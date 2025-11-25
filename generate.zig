const std = @import("std");
const McuInfo = @import("src/mcu_info.zig");

const Mcu = McuInfo.MCU_Info;
const ClockTree = McuInfo.Clock_Tree;
const ClockNode = McuInfo.Clock_Node;
const ClockNodeVariant = McuInfo.Clock_Node_Variant;
const ClockNodeInput = McuInfo.Clock_Node_Input;
const Reference = McuInfo.Reference;
const RefVariant = McuInfo.Ref_variant;
const RefType = McuInfo.Ref_type;
const IntegerRange = McuInfo.Integrer_Range;
const FloatRange = McuInfo.Float_Range;
const DynamicRange = McuInfo.Dynamic_Range;
const List = McuInfo.List;
const ListItem = McuInfo.List_Item;
const RuntimeRef = struct {
    name: []const u8,
    val: RefVariant,
    is_runtime: bool,
};

// Used to keep track of various mappings during generation
const Context = struct {
    const ContextType = enum {
        semafore,
        node,
        node_enable,
        reference,
        extra_flag,
        extra_config,
    };

    const MultiTypes = packed struct(u3) {
        int: bool = false,
        float: bool = false,
        list: bool = false,
    };

    ///used to get the source reference of a given semafore
    semaphores: std.StringArrayHashMap([]const u8),

    /// used to get the node associated with the selected name
    nodes: std.StringArrayHashMap(ClockNode),

    ///return de node associated with ref
    node_ref: std.StringArrayHashMap([]const u8),

    ///Used to get the clock nodes that enable a given node
    nodes_enable: std.StringArrayHashMap([]const u8),

    /// Used to get the name of the input node associated with a multiplexer reference
    inputs_sources: std.StringHashMap([]const u8),

    ///Used to get the reference associated with a given name
    references: std.StringArrayHashMap(Reference),
    extra_references: std.StringArrayHashMap(void),

    ///used to check if a reference is multi-typed
    multi_type_ref: std.StringArrayHashMap(MultiTypes),

    ///used to check if a given name is a external reference
    extra_flags: std.StringArrayHashMap(void),

    ///used to check if a given name is a extra config
    extra_configs: std.StringArrayHashMap(void),

    //count the total items of a reference list
    total_list_item: std.StringHashMap(usize),

    pub fn init(allocator: std.mem.Allocator) Context {
        return Context{
            .semaphores = .init(allocator),
            .nodes = .init(allocator),
            .node_ref = .init(allocator),
            .nodes_enable = .init(allocator),
            .inputs_sources = .init(allocator),
            .references = .init(allocator),
            .extra_references = .init(allocator),
            .extra_flags = .init(allocator),
            .extra_configs = .init(allocator),
            .multi_type_ref = .init(allocator),
            .total_list_item = .init(allocator),
        };
    }

    pub fn deinit(self: *Context) void {
        self.semaphores.deinit();
        self.nodes.deinit();
        self.node_ref.deinit();
        self.nodes_enable.deinit();
        self.inputs_sources.deinit();
        self.references.deinit();
        self.extra_references.deinit();
        self.multi_type_ref.deinit();
        self.extra_flags.deinit();
        self.extra_configs.deinit();
        self.total_list_item.deinit();
    }

    pub fn get_name_context(self: *const Context, name: []const u8) ?ContextType {
        if (self.semaphores.contains(name)) return .semafore;
        if (self.references.contains(name)) return .reference;
        if (self.extra_flags.contains(name)) return .extra_flag;
        if (self.extra_configs.contains(name)) return .extra_config;
        if (self.nodes.contains(name)) return .node;
        if (self.nodes_enable.contains(name)) return .node_enable;
        return null;
    }
};

const MCU_DATA_PATH = "mcu_data/";
const MCU_OUTPUT_PATH = "src/mcus/";

const CLOCK_TREE_DATA_PATH = "clock_ref_data/";
const CLOCK_TREE_OUTPUT_PATH = "src/clocktree/";

var global_ref_name: []const u8 = undefined;
pub fn main() !void {
    const list = try generate_clock_trees();
    try generate_mcu_data(list);

    for (list) |i| {
        std.heap.page_allocator.free(i);
    }
    std.heap.page_allocator.free(list);
}

//mcu data generation

fn generate_mcu_data(clk_tree_list: []const []const u8) !void {
    var root_buf: [4096]u8 = undefined;
    var root_file = try std.fs.cwd().createFile("src/lib.zig", .{});
    var writer = root_file.writer(&root_buf);
    const interface = &writer.interface;

    var mcu_dir = try std.fs.cwd().openDir(MCU_DATA_PATH, .{ .iterate = true });
    defer mcu_dir.close();
    try interface.writeAll("const std = @import(\"std\");\n");
    for (clk_tree_list) |i| {
        try interface.print(
            \\const @"{0s}" = @import("clocktree/{0s}.zig");
            \\
        , .{i});
    }

    var mcu_iter = mcu_dir.iterate();
    var json_buf: [4096]u8 = undefined;
    std.log.info("starting MCU data generation; this may take a few minutes", .{});
    var count: usize = 0;
    while (try mcu_iter.next()) |mcu| {
        count += 1;
        var mcu_file = try mcu_dir.openFile(mcu.name, .{});
        var reader = mcu_file.reader(&json_buf);
        var j_reader = std.json.Reader.init(std.heap.page_allocator, &reader.interface);
        defer j_reader.deinit();
        const json = try std.json.parseFromTokenSource(Mcu, std.heap.page_allocator, &j_reader, .{});
        defer json.deinit();
        const mcu_inst: Mcu = json.value;
        try interface.print(
            \\pub const @"{s}" = @"{s}".ClockTree(std.StaticStringMap(void).initComptime(.{{
            \\
        , .{ mcu_inst.name, mcu_inst.clock_ref_file_union });
        for (mcu_inst.extra_data) |data| {
            try interface.print(
                \\.{{ "{s}", {{}} }},
                \\
            , .{data});
        }

        try interface.writeAll("\n}));\n");

        mcu_file.close();
        std.log.info("finished: {d} \x1b[1A\x1b[2K", .{count});
    }
    try interface.flush();
    root_file.close();
    std.log.info("\n\n", .{});
    var ch = std.process.Child.init(&[_][]const u8{ "zig", "fmt", "src/lib.zig" }, std.heap.page_allocator);
    _ = try ch.spawnAndWait();
}

// ============ Clock Tree Generation ===========
fn generate_clock_trees() ![]const []const u8 {
    var clk_tree_list = try std.ArrayList([]const u8).initCapacity(std.heap.page_allocator, 65);
    var clock_dir = try std.fs.cwd().openDir(CLOCK_TREE_DATA_PATH, .{ .iterate = true });
    var out_dir = try std.fs.cwd().openDir(CLOCK_TREE_OUTPUT_PATH, .{});
    defer clock_dir.close();
    defer out_dir.close();

    var clock_iter = clock_dir.iterate();
    var namebuf: [256]u8 = undefined;
    while (try clock_iter.next()) |entry| {
        if (entry.kind != .file) continue;
        if (!std.mem.endsWith(u8, entry.name, ".json")) continue;

        const name = entry.name[0 .. entry.name.len - 5]; // remove .json
        try clk_tree_list.append(std.heap.page_allocator, try std.heap.page_allocator.dupe(u8, name));
        global_ref_name = name;
        var file = try clock_dir.openFile(entry.name, .{});
        errdefer file.close();
        const out_name = try std.fmt.bufPrint(&namebuf, "{s}.zig", .{name});
        var out_file = try out_dir.createFile(out_name, .{});
        errdefer out_file.close();
        std.log.info("starting parser on: {s}", .{name});
        try process_clock_json(&file, &out_file);
        file.close();
        out_file.close();
        const file_path = try std.fmt.bufPrint(&namebuf, "{s}{s}.zig", .{ CLOCK_TREE_OUTPUT_PATH, name });
        var ch = std.process.Child.init(&[_][]const u8{ "zig", "fmt", file_path }, std.heap.page_allocator);
        _ = try ch.spawnAndWait();
    }
    return clk_tree_list.toOwnedSlice(std.heap.page_allocator);
}

fn process_clock_json(file: *std.fs.File, out_file: *std.fs.File) !void {
    var writer_buffer: [4096]u8 = undefined;
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const alloc = arena.allocator();
    var IO_buffer: [8192]u8 = undefined;
    var file_data = file.reader(&IO_buffer);
    var j_reader = std.json.Reader.init(alloc, &file_data.interface);
    defer j_reader.deinit();
    const json = try std.json.parseFromTokenSource(ClockTree, alloc, &j_reader, .{});
    defer json.deinit();
    //init context
    var context = Context.init(alloc);
    defer context.deinit();
    var out_writer = out_file.writer(&writer_buffer);

    try init_clocktree_context(&json.value, &context);
    try generate_clock_file(&json.value, &out_writer.interface, &context, alloc);
    try out_writer.interface.flush();
}

fn init_clocktree_context(clock_tree: *const ClockTree, context: *Context) !void {
    //process_semaphores and references
    //semaphores are only in reference types List and List_Item
    for (clock_tree.references) |ref| {
        const ref_name = ref.ref_name;
        try context.references.put(ref_name, ref);
        if (check_multi_type(&ref)) |val| {
            try context.multi_type_ref.put(ref_name, val);
        }
        for (ref.variants) |v| {
            switch (v.ref) {
                .list => |l| {
                    for (l.itens) |i| {
                        if (i.semaphore) |s| {
                            try context.semaphores.put(s, ref_name);
                        }
                    }
                },
                .single_item => |i| {
                    if (i.semaphore) |s| {
                        try context.semaphores.put(s, ref_name);
                    }
                },
                else => {},
            }
        }
    }

    //Process Nodes and Input nodes
    for (clock_tree.nodes) |node| {
        const node_name = node.name;
        try context.nodes.put(node_name, node);
        if (node.enable_flag) |flag| {
            var flag_iter = std.mem.splitAny(u8, flag, ",");
            while (flag_iter.next()) |f_name| {
                try context.nodes_enable.put(f_name, node_name);
            }
        }
        for (node.variants) |v| {
            for (v.inputs) |in| {
                const ref = in.source_ref orelse continue;
                try context.inputs_sources.put(ref, in.source);
            }
        }

        var ref_iter = std.mem.splitAny(u8, node.reference, "|/\\,+-= ");
        while (ref_iter.next()) |r| {
            try context.node_ref.put(r, node.name);
        }
    }

    //Process Extra Flags
    for (clock_tree.extra_flags) |flag| {
        try context.extra_flags.put(flag, {});
    }

    for (clock_tree.config_ref_names) |n| {
        try context.extra_configs.put(n, {});
    }

    for (clock_tree.extra_reference) |extra| {
        if (context.references.contains(extra)) {
            try context.extra_references.put(extra, {});
        }
    }
}

fn check_multi_type(ref: *const Reference) ?Context.MultiTypes {
    var types = Context.MultiTypes{};
    for (ref.variants) |v| {
        switch (v.ref) {
            .float_range, .dynamic_range => types.float = true,
            .integer_range => types.int = true,
            .list => types.list = true,
            .single_item => |item| {
                if (std.mem.startsWith(u8, item.name, "__HAL") and (item.semaphore == null)) {
                    continue;
                }
                types.list = true;
            },
            else => {},
        }
    }

    return switch (@as(u3, @bitCast(types))) {
        0, 0b001, 0b010, 0b100 => null,
        else => types,
    };
}

fn generate_clock_file(tree: *const ClockTree, writer: *std.Io.Writer, context: *const Context, alloc: std.mem.Allocator) !void {
    try generate_prelude(writer);
    try generate_list_types(tree, writer, context, alloc);
    try generate_multi_types(context, writer);
    try writer.writeAll(
        \\pub fn ClockTree(comptime mcu_data: std.StaticStringMap(void)) type {
        \\  return struct {
    );
    try generate_types(tree, writer, context, alloc);
    try generate_get_clocks(tree, writer, context, alloc);

    try writer.writeAll(
        \\  };
        \\}
        \\
        \\
    );
}
fn generate_prelude(writer: *std.Io.Writer) !void {
    try writer.writeAll(
        \\//AUTO-GENERATED FILE. DO NOT MODIFY.
        \\//any issues or changes should be made in the source JSON files or the generator script.
        \\
        \\const std = @import("std");
        \\const clock = @import("nodes/ClockNode.zig");
        \\const ClockNode = clock.ClockNode;
        \\const ClockNodeTypes = clock.ClockNodesTypes;
        \\const ClockState = clock.ClockState;
        \\const ClockError = clock.ClockError;
        \\const comptime_fail_or_error = clock.comptime_fail_or_error;
        \\const math_op = clock.math_op;
        \\const check_ref = clock.check_ref;
        \\const Limit = clock.Limit;
        \\
        \\
    );
}

/// First generate the list types before the other types to simplify their handling.
/// There are 3 kinds of lists:
/// - numbers: lists of fixed numeric values
/// - multiplexers: lists whose values refer to a clock node
/// - tag list: a list whose values are only identifiers and do not carry any special meaning
const ListType = enum {
    number,
    tag,
    multi,
};

fn find_multi_list_semaphore(s_name: []const u8, ref: Reference) ?[]const u8 {
    for (ref.variants) |vras| {
        switch (vras.ref) {
            .list => |l| {
                for (l.itens) |i| {
                    if (std.mem.eql(u8, s_name, i.name)) return i.semaphore;
                }
            },
            .single_item => |i| {
                if (std.mem.eql(u8, s_name, i.name)) return i.semaphore;
            },
            else => {},
        }
    }
    return null;
}

fn generate_list_types(tree: *const ClockTree, writer: *std.Io.Writer, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx: *Context = @constCast(context);
    var created_list = std.StringArrayHashMap(void).init(alloc);
    defer created_list.deinit();

    //get multiplexer list first
    for (tree.nodes) |node| {
        if (std.mem.eql(u8, node.node_type, "multiplexor") or
            std.mem.eql(u8, node.node_type, "xbar"))
        {
            var name_spl = std.mem.splitAny(u8, node.reference, ",*=-/ ");
            const pre_name = name_spl.peek().?;
            const name = if (std.mem.indexOf(u8, pre_name, "Virtual")) |vidx| pre_name[0..vidx] else pre_name;
            if (created_list.contains(name)) continue;
            try created_list.put(name, {});
            try created_list.put(pre_name, {});

            while (name_spl.next()) |ref_name| {
                try created_list.put(ref_name, {});
            }

            try created_list.put(name, {});
            var multi_list = std.StringArrayHashMap(ListItem).init(alloc);
            for (node.variants) |v| {
                for (v.inputs, 0..) |in, idx| {
                    if (in.source_ref) |s| {
                        const ref = context.references.get(name) orelse {
                            std.log.info("not found ref for {s} - {s}", .{ node.name, name });
                            continue;
                        };
                        try multi_list.put(s, .{
                            .name = s,
                            .semaphore = find_multi_list_semaphore(s, ref),
                            .value = @as(f32, @floatFromInt(idx)),
                        });
                    } else {
                        try multi_list.put(in.source, .{
                            .name = in.source,
                            .semaphore = null,
                            .value = @as(f32, @floatFromInt(idx)),
                        });
                    }
                }
            }
            const values = multi_list.values();
            try write_list(
                writer,
                name,
                values,
                .multi,
            );
            try ctx.total_list_item.put(name, values.len);

            multi_list.deinit();
        }
    }

    for (tree.references) |ref| {
        if (created_list.contains(ref.ref_name)) continue;
        const itens = try list_itens(ref.variants, alloc);
        if (itens.len == 0) continue;
        try write_list(
            writer,
            ref.ref_name,
            itens,
            get_list_type(itens),
        );
        try ctx.total_list_item.put(ref.ref_name, itens.len);
    }
}
/// merge all items from all list variants of a reference
fn list_itens(variants: []const RefVariant, alloc: std.mem.Allocator) ![]const ListItem {
    var list = std.StringArrayHashMap(ListItem).init(alloc);
    defer list.deinit();
    for (variants) |v| {
        switch (v.ref) {
            .list => |l| {
                for (l.itens) |i| {
                    try list.put(i.name, i);
                }
            },
            .single_item => |i| {
                try list.put(i.name, i);
            },
            else => {},
        }
    }
    return try alloc.dupe(ListItem, list.values());
}

fn write_list(writer: *std.Io.Writer, name: []const u8, list: []const ListItem, list_type: ListType) !void {
    try writer.print(
        \\pub const @"{s}List" = enum {{
        \\
    , .{name});
    for (list) |i| {
        try writer.print(
            \\@"{s}",
        , .{i.name});
    }

    switch (list_type) {
        .number => {
            try writer.writeAll(
                \\
                \\pub fn get(self: @This()) f32 {
                \\  return switch(self){
            );

            for (list) |i| {
                const number = i.value orelse 0;
                try writer.print(
                    \\.@"{s}" => {d},
                    \\
                , .{
                    i.name, number,
                });
            }

            try writer.writeAll("};\n}\n");
        },
        .multi => {
            try writer.writeAll(
                \\
                \\pub fn get(self: @This()) usize {
                \\  return switch(self){
            );

            for (list) |i| {
                try writer.print(
                    \\.@"{s}" => {d},
                    \\
                , .{ i.name, @as(usize, @intFromFloat(i.value.?)) });
            }

            try writer.writeAll("};\n}\n");
        },
        .tag => {},
    }

    try writer.writeAll("\n};\n");
}

fn get_list_type(list: []const ListItem) ListType {
    for (list) |l| {
        if (l.value) |_| return .number;
    }
    return .tag;
}

fn generate_multi_types(ctx: *const Context, writer: *std.Io.Writer) !void {
    const keys = ctx.multi_type_ref.keys();
    const values = ctx.multi_type_ref.values();
    for (keys, values) |k, v| {
        try writer.print(
            \\pub const @"{s}Union" = union(enum) {{
            \\
        , .{k});
        if (v.float) try writer.writeAll("float: f32,\n");
        if (v.int) try writer.writeAll("int: u32,\n");
        if (v.list) try writer.print("list: @\"{s}List\", \n", .{k});
        try writer.writeAll("\n};\n");
    }
}

fn generate_types(tree: *const ClockTree, writer: *std.Io.Writer, context: *const Context, alloc: std.mem.Allocator) !void {
    //=========Flags==========
    try writer.writeAll(
        \\pub const Flags = struct {
        \\ 
    );

    for (tree.extra_flags) |f| {
        try writer.print(
            \\@"{s}":bool = false,
            \\
        , .{f});
    }

    try writer.writeAll(
        \\};
        \\ 
    );

    //=========== Extraconfigs ==========
    try writer.writeAll(
        \\//optional extra configurations
        \\pub const ExtraConfig = struct {
        \\ 
    );

    for (context.extra_configs.keys()) |c| {
        if (context.references.get(c)) |ref| {
            try write_config(&ref, writer, context);
        } else {
            std.log.warn("skipping Extra: {s}", .{c});
        }
    }

    for (context.extra_references.keys()) |extra| {
        if (context.extra_configs.contains(extra)) continue;
        if (context.node_ref.contains(extra)) continue;
        const ref = context.references.get(extra) orelse continue;
        try write_config(&ref, writer, context);
    }

    try writer.writeAll(
        \\};
        \\ 
    );

    //========= configs ===========
    try writer.writeAll(
        \\pub const Config = struct {
        \\ 
    );
    var ref_write = std.StringArrayHashMap(void).init(alloc);
    for (tree.nodes) |node| {
        if (std.mem.eql(u8, node.node_type, "output") or
            std.mem.eql(u8, node.node_type, "activeOutput") or
            std.mem.eql(u8, node.node_type, "fixedSource") or
            std.mem.eql(u8, node.node_type, "pixelClockSource")) continue;
        var ref_spl = std.mem.splitAny(u8, node.reference, ",/*+-= ");
        const pre_ref_name = ref_spl.next().?;
        const ref_name = if (std.mem.indexOf(u8, pre_ref_name, "Virtual")) |vidx| pre_ref_name[0..vidx] else pre_ref_name;
        const ref = context.references.get(ref_name) orelse continue;
        if (ref_write.contains(ref_name)) continue;
        try ref_write.put(ref_name, {});
        try write_config(&ref, writer, context);
    }
    ref_write.deinit();

    try writer.writeAll(
        \\  extra: ExtraConfig = .{},
        \\  flags: Flags = .{},
        \\};
        \\ 
    );

    //========== output=============
    try writer.writeAll(
        \\///output of clock values after processing
        \\///Note: outputs marked as 0 may indicate a disabled clock or an actual output value of 0.
        \\pub const Clock_Output = struct {
        \\ 
    );

    for (context.nodes.keys()) |f| {
        try writer.print(
            \\@"{s}":f32 = 0,
            \\
        , .{f});
    }

    try writer.writeAll(
        \\};
        \\
    );

    try writer.writeAll(
        \\/// Configuration output after processing the clock tree.
        \\/// Values marked as null indicate that the RCC configuration should remain at its reset value.
        \\pub const Config_Output = struct {
        \\ 
    );

    var imp_map = std.StringArrayHashMap(void).init(alloc);
    for (context.references.values()) |f| {
        if (imp_map.contains(f.ref_name)) continue;
        try imp_map.put(f.ref_name, {});
        if (is_ref_output(f, context)) continue;

        const comment = blk: {
            if (context.extra_configs.contains(f.ref_name)) {
                break :blk "from RCC Advanced Config";
            } else if (context.node_ref.contains(f.ref_name)) {
                break :blk "from RCC Clock Config";
            } else {
                break :blk "from extra RCC references";
            }
        };
        if (is_list(f, context)) {
            try writer.print(
                \\@"{0s}": ?@"{0s}List" = null, //{1s}
                \\
            , .{ f.ref_name, comment });
        } else {
            try writer.print(
                \\@"{0s}": ?f32 = null, //{1s}
                \\
            , .{ f.ref_name, comment });
        }
    }

    try writer.writeAll(
        \\};
        \\
    );
    imp_map.deinit();

    try writer.writeAll(
        \\
        \\pub const Tree_Output = struct {
        \\  clock: Clock_Output,
        \\  config: Config_Output,
        \\};
        \\
    );

    //aux function
    try writer.writeAll(
        \\
        \\fn check_MCU(comptime to_check: []const u8) bool {
        \\    return mcu_data.get(to_check) != null;
        \\}
    );
}

fn get_ref_from_ptr(name: []const u8, ctx: *const Context) !Reference {
    const ref = ctx.references.get(name) orelse return error.InvalidReference;
    for (ref.variants) |vars| {
        switch (vars.ref) {
            .string => |str| {
                const slc = if (str[0] == '+') str[1..] else str;
                return get_ref_from_ptr(slc, ctx);
            },
            else => {},
        }
    }
    return ref;
}

fn is_ref_config(ref: Reference, ctx: *const Context) bool {
    return !is_ref_output(ref, ctx) and !is_ref_static(ref.variants);
}

fn is_ref_output(ref: Reference, ctx: *const Context) bool {
    if (ctx.node_ref.get(ref.ref_name)) |node_name| {
        if (ctx.nodes.get(node_name)) |node| {
            return (std.mem.eql(u8, node.node_type, "output") or
                std.mem.eql(u8, node.node_type, "activeOutput") or
                std.mem.eql(u8, node.node_type, "fixedSource") or
                std.mem.eql(u8, node.node_type, "pixelClockSource"));
        }
    }

    return is_ref_string(ref.variants);
}

fn is_ref_string(rev: []const RefVariant) bool {
    return switch (rev[0].ref) {
        .string => true,
        else => false,
    };
}

fn is_ref_static(ref_var: []const RefVariant) bool {
    for (ref_var) |v| {
        switch (v.ref) {
            .list, .integer_range, .float_range, .dynamic_range => return false,
            else => {},
        }
    }
    return true;
}

fn write_config(ref: *const Reference, writer: *std.Io.Writer, context: *const Context) !void {
    if (!is_ref_static(ref.variants)) {
        if (context.multi_type_ref.get(ref.ref_name)) |_| {
            try writer.print(
                \\@"{0s}": ?@"{0s}Union" = null,
                \\
            , .{ref.ref_name});
        } else {
            if (is_list(ref.*, context)) {
                try writer.print(
                    \\@"{0s}": ?@"{0s}List" = null,
                    \\
                , .{ref.ref_name});
                return;
            } else if (is_variable_number(ref.*, context)) {
                const type_str = if (is_major_int(ref.*)) "u32" else "f32";
                try writer.print(
                    \\@"{s}": ?{s} = null,
                    \\
                , .{ ref.ref_name, type_str });
            }
        }
    }
}

fn generate_get_clocks(tree: *const ClockTree, writer: *std.Io.Writer, context: *const Context, alloc: std.mem.Allocator) !void {
    _ = tree;
    try writer.writeAll(
        \\pub fn get_clocks(config: Config) anyerror!Tree_Output {
        \\var out = Clock_Output{};
        \\var ref_out = Config_Output{};
        \\
        \\
    );
    try generate_semaphores(writer, context);
    try generate_limits(writer, context);
    try generate_ref_values(writer, context, alloc);
    try generate_clock(writer, context, alloc);
    try generate_reference_out(writer, context, alloc);
    try writer.writeAll(
        \\
        \\return Tree_Output{
        \\  .clock = out,
        \\  .config = ref_out,
        \\ };
        \\}
    );
}

fn generate_semaphores(writer: *std.Io.Writer, context: *const Context) !void {
    try writer.writeAll(
        \\//Semaphores flags
        \\
        \\
    );
    for (context.semaphores.keys()) |k| {
        try writer.print(
            \\var @"{s}": bool = false;
            \\
        , .{k});
    }
}

fn generate_limits(writer: *std.Io.Writer, context: *const Context) !void {
    for (context.references.values()) |ref| {
        if (is_list(ref, context)) continue;
        if (check_for_range(ref.ref_name, context)) continue;
        if (is_ref_static(ref.variants)) continue;
        try writer.print(
            \\var @"{s}Limit": Limit = .{{}};
            \\
        , .{ref.ref_name});
    }
}

fn generate_ref_values(writer: *std.Io.Writer, context: *const Context, alloc: std.mem.Allocator) !void {
    try writer.writeAll(
        \\//Ref Values
        \\
        \\
    );

    var done_map: std.StringArrayHashMap(void) = .init(alloc);
    const refs = context.references.values();
    for (refs) |ref| {
        if (done_map.contains(ref.ref_name)) continue;
        try done_map.put(ref.ref_name, {});
        try write_ref_value(writer, context, ref, alloc, &done_map);
    }
}

fn write_ref_value(writer: *std.Io.Writer, context: *const Context, ref: Reference, alloc: std.mem.Allocator, done: *std.StringArrayHashMap(void)) !void {
    //try implement all base values before the corrent ref
    if (ref.variants.len == 1) {
        switch (ref.variants[0].ref) {
            .string => return,
            else => {},
        }
    }
    for (ref.variants) |vars| {
        if (vars.expr) |expr| {
            var expr_tokens = std.mem.splitAny(u8, expr, "()+-,.|&%*<>!=\\/? ");
            try write_parent_ref_value(writer, context, ref, alloc, done, &expr_tokens);
        }
        switch (vars.ref) {
            .dynamic_range => |range| {
                if (range.default_value) |expr| {
                    var expr_tokens = std.mem.splitAny(u8, expr, "()+-,.|&%*<>!=\\/? ");
                    try write_parent_ref_value(writer, context, ref, alloc, done, &expr_tokens);
                }

                if (range.max) |expr| {
                    var expr_tokens = std.mem.splitAny(u8, expr, "()+-,.|&%*<>!=\\/? ");
                    try write_parent_ref_value(writer, context, ref, alloc, done, &expr_tokens);
                }

                if (range.min) |expr| {
                    var expr_tokens = std.mem.splitAny(u8, expr, "()+-,.|&%*<>!=\\/? ");
                    try write_parent_ref_value(writer, context, ref, alloc, done, &expr_tokens);
                }
            },
            .fixed_expr => |expr| {
                var expr_tokens = std.mem.splitAny(u8, expr, "()+-,.|&%*<>!=\\/? ");
                try write_parent_ref_value(writer, context, ref, alloc, done, &expr_tokens);
            },
            else => {},
        }
    }

    //actual node write
    //std.log.debug("Creating ref {s}", .{ref.ref_name});
    try write_actual_node(writer, context, ref, alloc);
}

fn write_parent_ref_value(writer: *std.Io.Writer, context: *const Context, _: Reference, alloc: std.mem.Allocator, done: *std.StringArrayHashMap(void), tokens: *std.mem.SplitIterator(u8, .any)) anyerror!void {
    while (tokens.next()) |token| {
        if (token.len == 0) continue;
        if (context.references.get(token)) |in_ref| {
            if (done.contains(in_ref.ref_name)) continue;
            try done.put(in_ref.ref_name, {});
            try write_ref_value(writer, context, in_ref, alloc, done);
        }
    }
}

fn write_actual_node(writer: *std.Io.Writer, context: *const Context, ref: Reference, alloc: std.mem.Allocator) !void {
    const runtime = is_ref_config(ref, context);
    var default_var: ?RefVariant = null;
    var extra_var = try std.ArrayList(RefVariant).initCapacity(alloc, 0);

    // organize variants before the final write to the file
    for (ref.variants) |vars| {
        if (vars.expr) |_| {
            try extra_var.append(alloc, vars);
        } else {
            default_var = vars;
        }
    }
    var prefix_buf: [150]u8 = undefined;
    try writer.print(
        \\const @"{s}Value": ?{s} = blk: {{
        \\
        \\
    , .{ ref.ref_name, get_type_prefix(ref, &prefix_buf, context) });

    var fisrt = false;
    for (extra_var.items) |i| {
        const zig_expr = translate_expr(i.expr.?, ref.ref_name, context, alloc) catch {
            //std.log.info("got {any} on expr {s} skipping expr", .{ err, i.expr.? });
            continue;
        };
        if (!fisrt) {
            try writer.print(
                \\if({s}){{
                \\
                \\
            , .{zig_expr});
            fisrt = true;
        } else {
            try writer.print(
                \\else if({s}){{
                \\
                \\
            , .{zig_expr});
        }
        try write_reference_value(
            writer,
            context,
            i,
            ref.ref_name,
            runtime,
            alloc,
        );
        try writer.writeAll("\n}\n");
    }

    if (default_var) |def| {
        try write_reference_value(
            writer,
            context,
            def,
            ref.ref_name,
            runtime,
            alloc,
        );
    } else {
        try writer.writeAll("break :blk null;");
    }

    try writer.writeAll("\n};\n");
    //try writer.print(
    //    \\
    //    \\std.mem.doNotOptimizeAway(@"{s}Value");
    //    \\
    //, .{ref.ref_name});
}

fn translate_expr(expr: []const u8, name: []const u8, context: *const Context, alloc: std.mem.Allocator) ![]const u8 {
    //std.log.info("start EXPR translate {s}", .{expr});
    var inner = try alloc.alloc(u8, expr.len * 10);
    defer alloc.free(inner);
    var inner_idx: usize = 0;

    const len = expr.len;
    var idx: usize = 0;
    while (idx < len) {
        switch (expr[idx]) {
            0...9 => idx += 1,
            '!',
            '(',
            ')',
            '/',
            '-',
            '+',
            '*',
            ' ',
            0x0a,
            0x0d,
            => {
                inner[inner_idx] = expr[idx];
                idx += 1;
                inner_idx += 1;
            },

            '<', '>' => {
                inner[inner_idx] = ' ';
                inner[inner_idx + 1] = expr[idx];
                inner[inner_idx + 2] = ' ';
                inner_idx += 3;
                idx += 1;
            },

            '=' => {
                std.mem.copyForwards(u8, inner[inner_idx..], " == ");
                idx += 1;
                inner_idx += 4;
            },

            '|' => {
                std.mem.copyForwards(u8, inner[inner_idx..], " or ");
                idx += 1;
                inner_idx += 4;
            },

            '&' => {
                std.mem.copyForwards(u8, inner[inner_idx..], " and ");
                idx += 1;
                inner_idx += 5;
            },

            else => {
                const pre_str = get_cur_str(expr[idx..]);
                idx += pre_str.len;
                const str = if (std.mem.indexOf(u8, pre_str, "Virtual")) |vidx| pre_str[0..vidx] else pre_str;
                const ctx = context.get_name_context(str);

                if (ctx) |ct| {
                    switch (ct) {
                        .extra_flag, .node_enable => {
                            // skip redundant checks (== true, false, 0, 1)
                            if (try is_next_equal(expr[idx..])) |equal| {
                                idx += equal;
                                const next_str = get_cur_str(expr[idx..]);
                                idx += next_str.len;
                            }
                            const ret = std.fmt.bufPrint(inner[inner_idx..], "config.flags.@\"{s}\"", .{str}) catch unreachable;
                            inner_idx += ret.len;
                        },
                        .semafore => {
                            // skip redundant checks (== true, false, 0, 1)
                            if (try is_next_equal(expr[idx..])) |equal| {
                                idx += equal;
                                const next_str = get_cur_str(expr[idx..]);
                                idx += next_str.len;
                            }
                            const ret = std.fmt.bufPrint(inner[inner_idx..], "@\"{s}\"", .{str}) catch unreachable;
                            inner_idx += ret.len;
                        },
                        .reference => {
                            var prefix: []const u8 = "";
                            var posfix: []const u8 = "Value";

                            // if a reference refers to itself in an expression, use the config value
                            // if no configuration is found, the expression is invalid
                            const ref = context.references.get(name).?;
                            if (std.mem.eql(u8, name, str)) {
                                if (is_ref_config(ref, context)) {
                                    prefix = if (context.extra_configs.contains(name)) "config.extra." else "config.";
                                    posfix = "";
                                } else {
                                    return error.InvalidFlag;
                                }
                            }
                            const op = try next_op(expr[idx..], &idx);

                            if (op.len != 0) {
                                const next_str = get_cur_str(expr[idx..]);
                                idx += next_str.len;

                                if (next_str.len == 0) {
                                    std.log.info("not fount next str on pre: {s} op: {s} expr: {s}", .{ str, op, expr[idx..] });
                                    return error.MalformedExpr;
                                }

                                const next_prefix = if (!is_numeric(next_str)) ".@\"" else "";
                                const next_posfix = if (!is_numeric(next_str)) "\"" else "";

                                if (!is_math_oprator(op)) {
                                    const ret = std.fmt.bufPrint(inner[inner_idx..],
                                        \\ check_ref(@TypeOf({0s}@"{1s}{2s}"), {0s}@"{1s}{2s}", {3s}{4s}{5s}, .@"{6s}") 
                                    , .{
                                        prefix,
                                        str,
                                        posfix,
                                        next_prefix,
                                        next_str,
                                        next_posfix,
                                        op,
                                    }) catch unreachable;

                                    inner_idx += ret.len;
                                } else {
                                    const ret = std.fmt.bufPrint(inner[inner_idx..],
                                        \\ try math_op(@TypeOf({0s}@"{1s}{2s}"), {0s}@"{1s}{2s}", {6s}{3s}{7s}, .@"{4s}", "{5s}", "{1s}", "{3s}") 
                                    , .{
                                        prefix,
                                        str,
                                        posfix,
                                        next_str,
                                        op,
                                        name,
                                        next_prefix,
                                        next_posfix,
                                    }) catch unreachable;

                                    inner_idx += ret.len;
                                }
                            } else {
                                if (std.mem.indexOf(u8, str, "Used")) |_| {
                                    const used_ref = context.references.get(str) orelse return error.MalformedExpr;
                                    const line = if (is_list(used_ref, context)) "@\"true\"" else "1";
                                    const ret = std.fmt.bufPrint(inner[inner_idx..],
                                        \\ check_ref(@TypeOf({0s}@"{1s}{2s}"), {0s}@"{1s}{2s}", {3s}, .@"=") 
                                    , .{ prefix, str, posfix, line }) catch unreachable;
                                    inner_idx += ret.len;
                                } else {
                                    const ret = std.fmt.bufPrint(inner[inner_idx..],
                                        \\@"{s}Value" 
                                    , .{str}) catch unreachable;
                                    inner_idx += ret.len;
                                }
                            }
                        },
                        .node => {
                            std.log.info("GET NODE : {s} REF {any}", .{ str, context.references.get(str) });
                        },
                        else => {},
                    }
                } else {
                    if (try is_next_equal(expr[idx..])) |equal| {
                        idx += equal;
                        const next_str = get_cur_str(expr[idx..]);
                        idx += next_str.len;
                    }
                    if (try try_translate_flag(str, context)) |out| {
                        const ret = std.fmt.bufPrint(inner[inner_idx..], "config.flags.@\"{s}\"", .{out}) catch unreachable;
                        inner_idx += ret.len;
                    } else {
                        if (is_numeric(str)) {
                            const ret = std.fmt.bufPrint(inner[inner_idx..], "{s}", .{str}) catch unreachable;
                            inner_idx += ret.len;
                        } else {
                            const ret = std.fmt.bufPrint(inner[inner_idx..], "check_MCU(\"{s}\")", .{str}) catch unreachable;
                            inner_idx += ret.len;
                        }
                    }
                }
            },
        }
    }
    return try alloc.dupe(u8, inner[0..inner_idx]);
}

fn is_numeric(str: []const u8) bool {
    for (str) |c| {
        switch (c) {
            '0'...'9', '.' => {},
            else => return false,
        }
    }
    return true;
}

fn is_math_oprator(op: []const u8) bool {
    const b = op[0];
    if ((b == '+') or
        (b == '-') or
        (b == '*') or
        (b == '/')) return true;
    return false;
}

fn get_cur_str(buf: []const u8) []const u8 {
    var index: usize = 0;
    for (buf) |ch| {
        if (ch == '.') {
            index += 1;
        } else if (ch == '_') {
            index += 1;
        } else if (std.ascii.isAlphanumeric(ch)) {
            index += 1;
        } else break;
    }
    return buf[0..index];
}
// returns the offset of the next equals sign if it is the next operator
fn is_next_equal(cur: []const u8) !?usize {
    var skip: usize = 0;
    const op = try next_op(cur, &skip);
    if (op.len != 0) {
        if (op[0] == '=') {
            return skip;
        }
    }
    return null;
}

const OpState = enum {
    pre,
    op,
    pos,
};

fn next_op(cur: []const u8, skip_cnt: *usize) ![]const u8 {
    var op_s: usize = 0;
    var op_e: usize = 0;
    var state: OpState = .pre;
    for (cur, 0..) |b, idx| {
        switch (b) {
            ' ' => {
                switch (state) {
                    .op => {
                        op_e = idx;
                        state = .pos;
                    },
                    else => {},
                }
            },
            '=', '>', '<', '!', '+', '-', '/', '*' => {
                switch (state) {
                    .pre => {
                        op_s = idx;
                        state = .op;
                    },
                    .op => {},

                    .pos => {
                        return error.MalformedExpr;
                    },
                }
            },
            else => {
                if (state == .op) op_e = idx;
                skip_cnt.* += idx;
                break;
            },
        }
    }
    return cur[op_s..op_e];
}

fn is_list(ref: Reference, context: *const Context) bool {
    if (context.multi_type_ref.contains(ref.ref_name)) return false;
    for (ref.variants) |vars| {
        switch (vars.ref) {
            .list, .single_item => return true,
            else => {},
        }
    }
    return false;
}

fn is_variable_number(ref: Reference, context: *const Context) bool {
    if (context.multi_type_ref.contains(ref.ref_name)) return false;
    for (ref.variants) |vars| {
        switch (vars.ref) {
            .dynamic_range, .float_range, .integer_range => return true,
            else => {},
        }
    }
    return false;
}
fn get_type_prefix(ref: Reference, buf: []u8, context: *const Context) []const u8 {
    if (is_list(ref, context)) {
        return std.fmt.bufPrint(buf, "@\"{s}List\"", .{ref.ref_name}) catch unreachable;
    }
    return "f32";
}

// Attempts to translate a flag based on prefixes.
// If a prefix is found but the flag is not available, returns an error.
// If no prefix is found, returns null.
fn try_translate_flag(flag: []const u8, ctx: *const Context) !?[]const u8 {
    var base_slice: ?[]const u8 = null;
    if (std.mem.indexOf(u8, flag, "UsedAsynchronous")) |i| {
        base_slice = flag[0..i];
        std.log.info("find async rcc expr {s}", .{flag});
    } else if (std.mem.indexOf(u8, flag, "Used")) |i| {
        base_slice = flag[0..i];
    } else if (std.mem.indexOf(u8, flag, "State")) |i| {
        base_slice = flag[0..i];
    }
    const final = base_slice orelse return null;
    std.log.info("to find {s}", .{flag});
    for (ctx.nodes_enable.keys()) |k| {
        if (std.mem.indexOf(u8, k, final)) |_| return k;
    }

    return error.InvalidFlag;
}

/// floats have priority over ints in the configurations, so check whether all elements are integers
fn is_major_int(ref: Reference) bool {
    for (ref.variants) |v| {
        switch (v.ref) {
            .fixed_expr,
            .fixed_float,
            .dynamic_range,
            .float_range,
            => return false,
            else => {},
        }
    }
    return true;
}
// function that indicates whether the numeric range should be checked immediately
fn check_for_range(name: []const u8, ctx: *const Context) bool {
    const clk_name = ctx.node_ref.get(name) orelse {
        return true;
    };
    const clk = ctx.nodes.get(clk_name) orelse {
        return true;
    };

    if (std.mem.eql(u8, clk.node_type, "output") or
        std.mem.eql(u8, clk.node_type, "fixedSource") or
        std.mem.eql(u8, clk.node_type, "activeOutput") or
        std.mem.eql(u8, clk.node_type, "pixelClockSource")) return false;
    return true;
}

fn clear_string(str: []const u8, alloc: std.mem.Allocator) ![]const u8 {
    var buf: [2048]u8 = undefined;
    var buf2: [2048]u8 = undefined;
    const carry_r = std.mem.replace(u8, str, "\r", "\\r", &buf);
    const buf_s = buf[0 .. str.len + (carry_r * 2)];
    const table_r = std.mem.replace(u8, buf_s, "\t", "\\t", &buf2);
    const buf2_s = buf2[0 .. buf_s.len + (table_r * 2)];
    const new_r = std.mem.replace(u8, buf2_s, "\n", "\\n", &buf);
    const final = buf[0 .. buf2_s.len + (new_r * 2)];
    return try alloc.dupe(u8, final);
}

fn write__ref_expr(writer: *std.Io.Writer, val: []const u8, name: []const u8, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx = runtime_ctx;
    const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
    const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
    const err_expr = try clear_string(ctx.val.expr orelse "Else", alloc);
    if (val[0] == '+') {
        const ref = get_ref_from_ptr(val[1..], context) catch |err| {
            std.log.info("fail to get ref ptr {s} on {s}", .{ val, ctx.name });
            return err;
        };

        try writer.print(
            \\const {4s}: ?f32 = @"{0s}Value" orelse comptime_fail_or_error(error.NullReference,
            \\ \\Error on {{s}} | expr: {{s}} diagnostic: {{s}}
            \\ \\Expected value from: {{s}}, but it is undefined
            \\ \\note: some configurations are only valid if another configuration is applied.
            \\ , .{{ "{1s}", "{2s}" , "{3s}" , "{0s}" }});
        , .{ ref.ref_name, ctx.name, err_expr, err_log, name });
    } else if (val[0] == '=') {
        const expr = try translate_expr(val[1..], ctx.name, context, alloc);
        try writer.print(
            \\const {s}: ?f32 = {s};
            \\
        , .{ name, expr });
    } else if (is_numeric(val)) {
        try writer.print("const {s}: ?f32 = @min({s}, std.math.floatMax(f32));\n", .{ name, val });
    } else if (val.len == 0 or std.mem.eql(u8, "null", val)) {
        try writer.print("const {s}: ?f32 = null;\n", .{name});
    } else {
        std.log.info("expr not found on: {s},{s}", .{ ctx.name, val });
    }
}

//Actual reference writting :D
fn write_reference_value(writer: *std.Io.Writer, context: *const Context, ref: RefVariant, ref_name: []const u8, is_runtime: bool, alloc: std.mem.Allocator) !void {
    const runtime_ctx = RuntimeRef{
        .name = ref_name,
        .val = ref,
        .is_runtime = is_runtime,
    };
    var arena = std.heap.ArenaAllocator.init(alloc);
    defer arena.deinit();
    switch (ref.ref) {
        .no_value => try write_no_value(writer, runtime_ctx, context, arena.allocator()),
        .fixed_float => |f| try writer_fixed_float(writer, f, runtime_ctx, context, arena.allocator()),
        .fixed_integer => |i| try writer_fixed_integer(writer, i, runtime_ctx, context, arena.allocator()),
        .fixed_expr => |e| try writer_fixed_expr(writer, e, runtime_ctx, context, arena.allocator()),
        .float_range => |r| try writer_float_range(writer, r, runtime_ctx, context, arena.allocator()),
        .integer_range => |r| try writer_int_range(writer, r, runtime_ctx, context, arena.allocator()),
        .dynamic_range => |d| try writer_dynamic_range(writer, d, runtime_ctx, context, arena.allocator()),
        .single_item => |i| try writer_list_item(writer, i, runtime_ctx, context, arena.allocator()),
        .list => |l| try writer_list(writer, l, runtime_ctx, context, arena.allocator()),
        else => {},
    }
}

fn write_no_value(writer: *std.Io.Writer, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    if (runtime_ctx.is_runtime) {
        const conf_prefix = if (context.extra_configs.contains(runtime_ctx.name) or context.extra_references.contains(runtime_ctx.name)) "config.extra" else "config";
        const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
        const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
        const err_expr = try clear_string(runtime_ctx.val.expr orelse "Else", alloc);
        try writer.print(
            \\if({0s}.@"{1s}")|_|{{
            \\try comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Value should be null.
            \\  \\note: some configurations are invalid in certain cases.
            \\  \\
            \\  \\
            \\ ,.{{ "{1s}", "{2s}", "{3s}"}});
            \\
            \\}}
            \\
        , .{ conf_prefix, runtime_ctx.name, err_expr, err_log });
    }

    try writer.writeAll("break :blk null;\n");
}

fn writer_fixed_float(writer: *std.Io.Writer, val: f32, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx = runtime_ctx;
    if (runtime_ctx.is_runtime) {
        const conf_prefix = if (context.extra_configs.contains(ctx.name) or context.extra_references.contains(ctx.name)) "config.extra" else "config";
        const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
        const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
        const err_expr = try clear_string(ctx.val.expr orelse "Else", alloc);

        try writer.print(
            \\if({0s}.@"{1s}")|val| {{
            \\if(val != {2e}){{
            \\try comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Expected Fixed Value: {{e}} found: {{e}}
            \\  \\note: some values are fixed depending on the clock configuration.
            \\  \\
            \\  \\
            \\ ,.{{ "{1s}", "{3s}", "{4s}", {2e}, val, }});
            \\}}
            \\}}
        , .{ conf_prefix, ctx.name, val, err_expr, err_log });

        if (!check_for_range(ctx.name, context)) {
            try writer.print(
                \\@"{s}Limit" = .{{
                \\  .min = {e},
                \\  .max = {e},
                \\}};
            , .{ ctx.name, val, val });
        }
    }
    try writer.print(
        \\ break :blk {d};
    , .{val});
}

fn writer_fixed_integer(writer: *std.Io.Writer, val: u32, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx = runtime_ctx;
    if (runtime_ctx.is_runtime) {
        const conf_prefix = if (context.extra_configs.contains(ctx.name) or context.extra_references.contains(ctx.name)) "config.extra" else "config";
        const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
        const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
        const err_expr = try clear_string(ctx.val.expr orelse "Else", alloc);
        try writer.print(
            \\if({0s}.@"{1s}")|val| {{
            \\if(val != {2d}){{
            \\try comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Expected Fixed Value: {{d}} found: {{d}}
            \\  \\note: some values are fixed depending on the clock configuration
            \\  \\
            \\ ,.{{ "{1s}", "{3s}", "{4s}", {2d}, val, }});
            \\}}
            \\}}
        , .{ conf_prefix, ctx.name, val, err_expr, err_log });
        if (!check_for_range(ctx.name, context)) {
            try writer.print(
                \\@"{s}Limit" = .{{
                \\  .min = {d},
                \\  .max = {d},
                \\}};
            , .{ ctx.name, val, val });
        }
    }
    try writer.print(
        \\ break :blk {d};
    , .{val});
}

fn writer_fixed_expr(writer: *std.Io.Writer, val: []const u8, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx = runtime_ctx;
    try write__ref_expr(writer, val, "val", runtime_ctx, context, alloc);

    if (runtime_ctx.is_runtime) {
        if (!check_for_range(ctx.name, context)) {
            try writer.print(
                \\@"{0s}Limit" = .{{
                \\  .min = val,
                \\  .max = val,
                \\  .min_expr = {1s},
                \\  .max_expr = {1s},
                \\}};
            , .{
                ctx.name,
                if (is_numeric(val)) "null" else val,
            });
        }
    }
    try writer.print(
        \\ break :blk val;
    , .{});
}

fn writer_float_range(writer: *std.Io.Writer, val: FloatRange, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx = runtime_ctx;
    if (runtime_ctx.is_runtime) {
        const name = ctx.name;
        const conf_prefix = if (context.extra_configs.contains(ctx.name) or context.extra_references.contains(ctx.name)) "config.extra" else "config";

        if (check_for_range(name, context)) {
            const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
            const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
            const err_expr = try clear_string(ctx.val.expr orelse "Else", alloc);

            try writer.print(
                \\const config_val = {s}.@"{s}";
                \\
            , .{ conf_prefix, name });

            if (((val.max != null) or (val.min != null))) {
                try writer.writeAll(
                    \\if(config_val)|val| {
                    \\
                );

                if (val.min) |min| {
                    try writer.print(
                        \\  if(val < {0e}){{
                        \\  try comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Underflow Value - min: {{e}} found: {{e}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0e}, val, }});
                        \\  }}
                    , .{ min, ctx.name, err_expr, err_log });
                }

                if (val.max) |max| {
                    try writer.print(
                        \\  if(val > {0e}){{
                        \\  try comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Overflow Value - max: {{e}} found: {{e}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0e}, val, }});
                        \\  }}
                    , .{ @min(max, std.math.floatMax(f32)), ctx.name, err_expr, err_log });
                }
                try writer.writeAll(
                    \\}
                    \\
                );
            }
            try writer.writeAll(
                \\break :blk config_val
            );
            if (val.default_value) |d| try writer.print(" orelse {d}", .{d});
            try writer.writeAll(";\n");
        }
    } else {
        if (((val.max != null) or (val.min != null))) {
            try writer.print(
                \\@"{s}Limit" = .{{ 
            , .{ctx.name});
            if (val.min) |min| try writer.print(".min = {e},", .{min}) else try writer.print(".min = null,\n", .{});
            if (val.max) |max| try writer.print(".max = {e},", .{max}) else try writer.print(".max = null,\n", .{});
            try writer.writeAll("};");
            try writer.writeAll("break :blk null;");
        }
    }
}

fn writer_int_range(writer: *std.Io.Writer, val: IntegerRange, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx = runtime_ctx;
    const name = ctx.name;
    const conf_prefix = if (context.extra_configs.contains(ctx.name) or context.extra_references.contains(ctx.name)) "config.extra" else "config";
    if (ctx.is_runtime) {
        if (check_for_range(name, context)) {
            const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
            const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
            const err_expr = try clear_string(ctx.val.expr orelse "Else", alloc);

            try writer.print(
                \\const config_val = {s}.@"{s}";
                \\
            , .{ conf_prefix, name });

            if (((val.max != null) or (val.min != null))) {
                try writer.writeAll(
                    \\if(config_val)|val| {
                    \\
                );

                if (val.min) |min| {
                    try writer.print(
                        \\  if(val < {0d}){{
                        \\  try comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Underflow Value - min: {{d}} found: {{d}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0d}, val, }});
                        \\  }}
                    , .{ min, ctx.name, err_expr, err_log });
                }

                if (val.max) |max| {
                    try writer.print(
                        \\  if(val > {0d}){{
                        \\  try comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Overflow Value - max: {{d}} found: {{d}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0d}, val, }});
                        \\  }}
                    , .{ @min(max, std.math.maxInt(u30)), ctx.name, err_expr, err_log });
                }
                try writer.writeAll(
                    \\}
                    \\
                );
            }
            try writer.writeAll(
                \\break :blk if(config_val)|i| @as(f32,@floatFromInt(i))
            );
            if (val.default_value) |d| try writer.print(" else {d}", .{d});
            try writer.writeAll(";\n");
        }
    } else {
        if (((val.max != null) or (val.min != null))) {
            try writer.print(
                \\@"{s}Limit" = .{{ 
            , .{name});
            if (val.min) |min| try writer.print(".min = {d},", .{min}) else try writer.print(".min = null,\n", .{});
            if (val.max) |max| try writer.print(".max = {d},", .{max}) else try writer.print(".max = null,\n", .{});
            try writer.writeAll("};");
            try writer.writeAll("break :blk null;");
        }
    }
}

fn writer_dynamic_range(writer: *std.Io.Writer, val: DynamicRange, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const ctx = runtime_ctx;
    const def_str = val.default_value orelse "null";
    const min_str = val.min orelse "null";
    const max_str = val.max orelse "null";
    try write__ref_expr(writer, min_str, "min", runtime_ctx, context, alloc);
    try write__ref_expr(writer, max_str, "max", runtime_ctx, context, alloc);

    if (runtime_ctx.is_runtime) {
        const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
        const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
        const err_expr = try clear_string(ctx.val.expr orelse "Else", alloc);

        try write__ref_expr(writer, def_str, "val", runtime_ctx, context, alloc);
        try writer.writeAll("\nif(val)|actual| {\n");
        try writer.print(
            \\if(max)|m|{{
            \\  if(actual > m){{
            \\  try comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Overflow Value - max: {3s}({{e}}) found: {{e}}
            \\  \\note: ranges values may change depending on the configuration
            \\  \\
            \\ ,.{{ "{0s}", "{1s}", "{2s}", m, actual }});
            \\  }}
            \\}}
        , .{ ctx.name, err_expr, err_log, if (is_numeric(max_str)) "" else max_str });

        try writer.print(
            \\if(min)|m|{{
            \\  if(actual < m){{
            \\  try comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Underflow Value - min: {3s}({{e}}) found: {{e}}
            \\  \\note: ranges values may change depending on the configuration
            \\  \\
            \\ ,.{{ "{0s}", "{1s}", "{2s}", m, actual }});
            \\  }}
            \\}}
        , .{ ctx.name, err_expr, err_log, if (is_numeric(min_str)) "" else max_str });
        try writer.writeAll("}\n");
        try writer.print(
            \\ break :blk val;
        , .{});
    } else {
        if (!check_for_range(ctx.name, context)) {
            try writer.print(
                \\@"{s}Limit" = .{{
                \\  .min = min,
                \\  .max = max,
                \\  .min_expr = "{s}",
                \\  .max_expr = "{s}",
                \\}};
            , .{
                ctx.name,
                if (is_numeric(min_str)) "null" else min_str,
                if (is_numeric(max_str)) "null" else max_str,
            });
        }
        try writer.print(
            \\ break :blk null;
        , .{});
    }
}

fn writer_list_item(writer: *std.Io.Writer, val: ListItem, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    if (val.semaphore) |s| {
        try writer.print(
            \\ @"{s}" = true; 
            \\
        , .{s});
    }

    if ((val.name.len == 0) or std.mem.eql(u8, val.name, "null")) {
        try writer.print(
            \\ break :blk null; 
            \\
        , .{});
        return;
    }

    try writer.print(
        \\ const item: @"{s}List" = .@"{s}"; 
        \\
    , .{ runtime_ctx.name, val.name });

    if (runtime_ctx.is_runtime) {
        const conf_prefix = if (context.extra_configs.contains(runtime_ctx.name) or context.extra_references.contains(runtime_ctx.name)) "config.extra" else "config";
        const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
        const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
        const err_expr = try clear_string(runtime_ctx.val.expr orelse "Else", alloc);

        try writer.print(
            \\ const conf_item =  {0s}.@"{1s}";
            \\ if(conf_item)|i|{{
            \\ if(item != i) {{
            \\try comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Expected Fixed List Value: {{s}} found {{any}}
            \\  \\note: the current condition limits the choice to only one list item,
            \\  \\select the expected option or leave the value as null.
            \\  \\
            \\ ,.{{"{1s}", "{2s}", "{3s}", "{4s}", i}});
            \\}}
            \\}}
            \\
        , .{ conf_prefix, runtime_ctx.name, err_expr, err_log, val.name });
    }

    try writer.print(
        \\ break :blk item; 
        \\
    , .{});
}

fn writer_list(writer: *std.Io.Writer, val: List, runtime_ctx: RuntimeRef, context: *const Context, alloc: std.mem.Allocator) !void {
    const conf_prefix = if (context.extra_configs.contains(runtime_ctx.name) or context.extra_references.contains(runtime_ctx.name)) "config.extra" else "config";

    try writer.print(
        \\ const conf_item = {0s}.@"{1s}";
        \\
    , .{ conf_prefix, runtime_ctx.name });

    if (runtime_ctx.is_runtime) {
        const pre_log = try clear_string(runtime_ctx.val.diagnostic orelse "No Extra Log", alloc);
        const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
        const err_expr = try clear_string(runtime_ctx.val.expr orelse "Else", alloc);

        try writer.writeAll(
            \\if(conf_item)|item|{
            \\switch(item){
            \\
        );
        for (val.itens) |i| {
            try writer.print(
                \\.@"{s}" => 
            , .{i.name});
            if (i.semaphore) |s| {
                try writer.print(
                    \\@"{s}" = true,
                    \\
                , .{s});
            } else {
                try writer.writeAll(
                    \\{},
                    \\
                );
            }
        }

        if (context.total_list_item.get(runtime_ctx.name)) |total| {
            if (val.itens.len < total) {
                try writer.writeAll(
                    \\else => {
                    \\try comptime_fail_or_error(error.InvalidConfig,
                    \\  \\
                    \\  \\Error on {s} | expr: {s} diagnostic: {s} 
                    \\  \\Option not available in this condition: {any}.
                    \\  \\note: available options:
                    \\
                );
                for (val.itens) |n| {
                    try writer.print(
                        \\ \\ - {s}
                        \\
                    , .{n.name});
                }
                try writer.print(
                    \\ , .{{ "{s}", "{s}", "{s}", item}});
                    \\}},
                    \\
                , .{ runtime_ctx.name, err_expr, err_log });
            }
        }

        try writer.writeAll("\n}\n}\n");
    }
    try writer.writeAll(
        \\
        \\break :blk conf_item
    );

    if (val.default_name) |def| {
        if ((def.len != 0) and !(std.mem.eql(u8, def, "null"))) {
            try writer.print(" orelse .@\"{s}\"", .{def});
        } else if (def.len != 0) {
            if (def[0] == '+') {
                const ref = get_ref_from_ptr(def[1..], context) catch {
                    std.log.info("fail to get ref form def {s}", .{def});
                    try writer.writeAll(";\n");
                    return;
                };
                for (ref.variants) |vars| {
                    const to_def = switch (vars.ref) {
                        .string => |s| s,
                        .list => |l| l.default_name,
                        .single_item => |i| i.name,
                        else => null,
                    };
                    if (to_def) |to| {
                        if ((to.len != 0) and !(std.mem.eql(u8, to, "null"))) {
                            try writer.print(" orelse .@\"{s}\"", .{to});
                            break;
                        }
                    }
                }
            }
        }
    }

    try writer.writeAll(";\n");
}

fn generate_clock(writer: *std.Io.Writer, context: *const Context, alloc: std.mem.Allocator) !void {
    try generate_clock_base(writer, context);
    for (context.nodes.values()) |nodes| {
        if (!context.references.contains(get_node_reference(nodes))) continue;

        try generate_clock_values(writer, nodes, context, alloc);
    }

    for (context.nodes.values()) |nodes| {
        if (!context.references.contains(get_node_reference(nodes))) continue;
        try writer.print(
            \\
            \\out.@"{0s}" = try @"{0s}".get_output();
        , .{nodes.name});
    }
}

fn generate_clock_base(writer: *std.Io.Writer, context: *const Context) !void {
    for (context.nodes.values()) |clk| {
        if (!context.references.contains(get_node_reference(clk))) {
            std.log.info("Not found ref for node {s} skipping", .{clk.name});
            continue;
        }
        try writer.print(
            \\
            \\var @"{0s}" = ClockNode{{
            \\.name = "{0s}",
            \\.nodetype = .off,
            \\.parents = &.{{}},
            \\}};
            \\
        , .{clk.name});
    }
}

fn generate_clock_values(writer: *std.Io.Writer, node: ClockNode, context: *const Context, alloc: std.mem.Allocator) !void {
    var default_var: ?ClockNodeVariant = null;
    var extra_var = try std.ArrayList(ClockNodeVariant).initCapacity(alloc, 0);

    // organize variants before the final write to the file
    for (node.variants) |vars| {
        if (vars.expr) |_| {
            try extra_var.append(alloc, vars);
        } else {
            default_var = vars;
        }
    }

    var fisrt = false;
    for (extra_var.items) |i| {
        const zig_expr = translate_expr(i.expr.?, node.name, context, alloc) catch {
            //std.log.info("got {any} on expr {s} skipping expr", .{ err, i.expr.? });
            continue;
        };
        if (!fisrt) {
            try writer.print(
                \\if({s}){{
                \\
                \\
            , .{zig_expr});
            fisrt = true;
        } else {
            try writer.print(
                \\else if({s}){{
                \\
                \\
            , .{zig_expr});
        }
        //write clock vars
        try write_actual_clock_value(writer, node, i, context, alloc);
        try writer.writeAll("\n}\n");
    }

    if (default_var) |def| {
        try write_actual_clock_value(writer, node, def, context, alloc);
    }
}

const ClockType = enum {
    source,
    multiplicator,
    multiplicatorFrac,
    divisor,
    multiplexor,
    output,

    const TypeMap = std.StaticStringMap(@This()).initComptime(.{
        .{ "distinctValsSource", ClockType.source },
        .{ "fixedSource", ClockType.source },
        .{ "variedSource", ClockType.source },
        .{ "fractional", ClockType.source },
        .{ "multiplicator", ClockType.multiplicator },
        .{ "multiplicatorFrac", ClockType.multiplicatorFrac },
        .{ "devisor", ClockType.divisor },
        .{ "divisor", ClockType.divisor },
        .{ "multiplexor", ClockType.multiplexor },
        .{ "xbar", ClockType.multiplexor },
        .{ "output", ClockType.output },
        .{ "activeOutput", ClockType.output },
        .{ "pixelClockSource", ClockType.output },
    });

    pub fn get(t_str: []const u8) !ClockType {
        return ClockType.TypeMap.get(t_str) orelse {
            std.log.info("get type: {s}", .{t_str});
            return error.InvalidClockType;
        };
    }
};

fn write_actual_clock_value(writer: *std.Io.Writer, node: ClockNode, node_var: ClockNodeVariant, context: *const Context, alloc: std.mem.Allocator) !void {
    const ref_name = get_node_reference(node);
    const ref = context.references.get(ref_name).?;
    if (node.enable_flag) |enable| {
        try writer.writeAll(
            \\if( 
        );
        try translate_enable(writer, enable, context);
        try writer.writeAll(
            \\){
            \\ 
        );
    }
    const pre_log = try clear_string(node_var.diagnostic orelse "No Extra Log", alloc);
    const err_log: []const u8 = if (pre_log.len == 0) "No Extra Log" else pre_log;
    const err_expr = try clear_string(node_var.expr orelse "Else", alloc);
    const clk_t = try ClockType.get(node.node_type);
    if (clk_t != .output) {
        try writer.print(
            \\
            \\const @"{0s}_clk_value" = @"{1s}Value" orelse try comptime_fail_or_error(error.InvalidClockValue, 
            \\  \\Error on Clock {{s}} | expr: {{s}} diagnostic: {{s}}
            \\  \\Clock is active but the reference value {{s}} is null
            \\  \\note: check the flags and configurations associated with this clock
            \\  \\note2: actually I'm not sure if null values and clock nodes should be treated as errors.
            \\  , .{{
            \\  "{0s}",
            \\  "{2s}",
            \\  "{3s}",
            \\  "{1s}",
            \\}});
        , .{ node.name, ref_name, err_expr, err_log });
    } else {
        try writer.print(
            \\
            \\std.mem.doNotOptimizeAway(@"{s}Value");
            \\
        , .{ref_name});
    }
    switch (clk_t) {
        .source => try create_source(node, is_list(ref, context), writer),
        .divisor => try create_divisor(node, node_var, is_list(ref, context), writer),
        .multiplicator => try create_multiplicator(node, node_var, is_list(ref, context), writer),
        .multiplicatorFrac => try create_multiplicator_frac(node, node_var, is_list(ref, context), writer),
        .multiplexor => try create_multiplexor(node, node_var, writer),
        .output => try create_output(node, node_var, ref, context, writer),
    }

    if (node.enable_flag) |_| {
        try writer.writeAll(
            \\
            \\}
            \\ 
        );
    }
}

fn translate_enable(writer: *std.Io.Writer, flag: []const u8, context: *const Context) !void {
    var flag_spl = std.mem.splitAny(u8, flag, ",|/\\\n\t\r ");
    const ft = flag_spl.next().?;
    if (ft.len > 3) try writer_flag(writer, ft, context);
    while (flag_spl.next()) |sub_flag| {
        if (sub_flag.len < 3) continue;
        try writer.writeAll(
            \\ or
            \\
        );
        try writer_flag(writer, sub_flag, context);
    }
}

fn writer_flag(writer: *std.Io.Writer, sub_flag: []const u8, context: *const Context) !void {
    const ctx = context.get_name_context(sub_flag).?;
    switch (ctx) {
        .reference => {
            const ref = context.references.get(sub_flag).?;
            const cmp = if (is_list(ref, context)) ".@\"true\"" else "1";

            try writer.print(
                \\check_ref(@TypeOf(@"{0s}Value"), @"{0s}Value", {1s}, .@"=")
            , .{ sub_flag, cmp });
        },
        .extra_flag => {
            try writer.print(
                \\config.flags.@"{s}"
            , .{sub_flag});
        },
        else => {
            if (std.mem.eql(u8, "false", sub_flag) or
                std.mem.eql(u8, "true", sub_flag))
            {
                try writer.print("{s}", .{sub_flag});
            } else {
                std.log.info("SUB TYPE {s}{x} = {any}", .{ sub_flag, sub_flag, ctx });
                while (true) {}
            }
        },
    }
}

fn get_node_reference(node: ClockNode) []const u8 {
    var ref_spl = std.mem.splitAny(u8, node.reference, ",/*+-= ");
    const pre_ref_name = ref_spl.next().?;
    return if (std.mem.indexOf(u8, pre_ref_name, "Virtual")) |vidx| pre_ref_name[0..vidx] else pre_ref_name;
}

fn get_first_input(name: []const u8, inputs: []const ClockNodeInput) ![]const u8 {
    for (inputs) |in| {
        if (std.mem.eql(u8, in.source, name)) continue;
        if (std.mem.containsAtLeast(u8, in.source, 1, "Frac") or
            std.mem.containsAtLeast(u8, in.source, 1, "frac")) continue;
        return in.source;
    }
    std.log.err("Invalid input source for {s}", .{name});
    return error.InvalidInputSource;
}

fn get_first_frac(name: []const u8, inputs: []const ClockNodeInput) ![]const u8 {
    for (inputs) |in| {
        if (std.mem.eql(u8, in.source, name)) continue;
        if (std.mem.containsAtLeast(u8, in.source, 1, "Frac") or
            std.mem.containsAtLeast(u8, in.source, 1, "frac") or
            std.mem.containsAtLeast(u8, in.source, 1, "FRAC")) return in.source;
    }
    std.log.err("Invalid input source for {s}", .{name});
    return error.InvalidInputSource;
}

fn create_source(node: ClockNode, list: bool, writer: *std.Io.Writer) anyerror!void {
    const postfix = if (list) ".get()" else "";
    try writer.print(
        \\@"{0s}".nodetype = .source;
        \\@"{0s}".value = @"{0s}_clk_value"{1s};
        \\
    , .{ node.name, postfix });
}

fn create_divisor(node: ClockNode, node_var: ClockNodeVariant, list: bool, writer: *std.Io.Writer) anyerror!void {
    const postfix = if (list) ".get()" else "";
    try writer.print(
        \\@"{0s}".nodetype = .div;
        \\@"{0s}".value = @"{0s}_clk_value"{1s};
        \\@"{0s}".parents = &.{{&@"{2s}"}};
        \\
    , .{ node.name, postfix, try get_first_input(node.name, node_var.inputs) });
}

fn create_multiplicator(node: ClockNode, node_var: ClockNodeVariant, list: bool, writer: *std.Io.Writer) anyerror!void {
    const postfix = if (list) ".get()" else "";
    try writer.print(
        \\@"{0s}".nodetype = .mul;
        \\@"{0s}".value = @"{0s}_clk_value"{1s};
        \\@"{0s}".parents = &.{{&@"{2s}"}};
        \\
    , .{ node.name, postfix, try get_first_input(node.name, node_var.inputs) });
}

fn create_multiplicator_frac(node: ClockNode, node_var: ClockNodeVariant, list: bool, writer: *std.Io.Writer) anyerror!void {
    const postfix = if (list) ".get()" else "";

    try writer.print(
        \\@"{0s}".nodetype = .mulfrac;
        \\@"{0s}".value = @"{0s}_clk_value"{1s};
        \\@"{0s}".parents = &.{{&@"{2s}", &@"{3s}"}};
        \\
    , .{ node.name, postfix, try get_first_input(node.name, node_var.inputs), try get_first_frac(node.name, node_var.inputs) });
}

fn create_multiplexor(node: ClockNode, node_var: ClockNodeVariant, writer: *std.Io.Writer) anyerror!void {
    try writer.print(
        \\const @"{s}parents" = [_]*const ClockNode{{
        \\
    , .{node.name});

    for (node_var.inputs) |in| {
        try writer.print(
            \\ &@"{s}",
            \\
        , .{in.source});
    }
    try writer.writeAll("};\n");
    try writer.print(
        \\@"{0s}".nodetype = .multi;
        \\@"{0s}".parents = &.{{@"{0s}parents"[@"{0s}_clk_value".get()]}};
        \\
    , .{node.name});
}

fn create_output(node: ClockNode, node_var: ClockNodeVariant, ref: Reference, ctx: *const Context, writer: *std.Io.Writer) anyerror!void {
    const ref_name = ref.ref_name;
    if (!check_for_range(ref_name, ctx) and !is_ref_static(ref.variants) and !is_list(ref, ctx)) {
        try writer.print(
            \\@"{s}".limit = @"{s}Limit";
            \\
        , .{ node.name, ref_name });
    }
    try writer.print(
        \\@"{0s}".nodetype = .output;
        \\@"{0s}".parents = &.{{&@"{1s}"}};
        \\
    , .{ node.name, get_first_input(node.name, node_var.inputs) catch node.name });
}

fn generate_reference_out(writer: *std.Io.Writer, context: *const Context, alloc: std.mem.Allocator) !void {
    var imp_map = std.StringArrayHashMap(void).init(alloc);
    defer imp_map.deinit();
    for (context.references.values()) |r| {
        if (imp_map.contains(r.ref_name)) continue;
        try imp_map.put(r.ref_name, {});
        if (is_ref_output(r, context)) continue;

        try writer.print(
            \\ref_out.@"{0s}" = @"{0s}Value";
        , .{r.ref_name});
    }
}
