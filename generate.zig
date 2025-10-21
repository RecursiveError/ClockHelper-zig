const std = @import("std");

const ClockTree = @import("src/clocktree.zig");
const Tree = ClockTree.Tree;
const Element = ClockTree.Element;
const Sources = ClockTree.Sources;
const Output = ClockTree.Output;
const Input = ClockTree.Input;
const ReferenceValue = ClockTree.ReferenceValue;
const Reference = ClockTree.Reference;

var nameMap: std.StringHashMap(Element) = undefined;
var RefIDmap: std.StringHashMap([]const u8) = undefined;
var RefValIDmap: std.StringHashMap(f32) = undefined;
var ValuesQtd: std.StringHashMap(usize) = undefined;

pub fn main() !void {
    var out_buffer: [50]u8 = undefined;
    var json_dir = try std.fs.cwd().openDir("mcu_json", .{ .iterate = true });
    var iter = json_dir.iterate();
    while (true) {
        const file = try iter.next();
        if (file) |entry| {
            switch (entry.kind) {
                .file => {
                    if (std.mem.startsWith(u8, entry.name, "STM32")) {
                        if ((entry.name[5] == 'M') or (entry.name[5] == 'W')) {
                            std.debug.print("SKIP {s}\n STM32Mxx/Wxx is not supported yet\n", .{entry.name});
                            continue;
                        }
                        std.debug.print("create new file from: {s}\n", .{entry.name});
                        const name = entry.name;
                        const out_name = std.fmt.bufPrint(&out_buffer, "src/ClockTrees/{s}.zig", .{name[0..(name.len - 5)]}) catch continue;
                        const json_file = json_dir.openFile(name, .{}) catch continue;
                        create_files(json_file, out_name) catch |err| {
                            std.log.info("Fail to create {s} Error: {any}", .{ name, err });
                        };
                        json_file.close();
                    }
                },
                else => {},
            }
            continue;
        }
        break;
    }
}

fn load_global_maps(tree: *const Tree, alloc: std.mem.Allocator) !void {
    var nmap = std.StringHashMap(Element).init(alloc);
    var rmap = std.StringHashMap([]const u8).init(alloc);
    var vmap = std.StringHashMap(f32).init(alloc);
    ValuesQtd = std.StringHashMap(usize).init(alloc);
    for (tree.element) |element| {
        try nmap.put(element.name, element);
        try rmap.put(element.reference_id, element.name);
        for (element.reference) |ref| {
            load_reference(ref.value, &vmap);
        }
    }
    nameMap = nmap;
    RefIDmap = rmap;
    RefValIDmap = vmap;
}

fn load_reference(ref: ReferenceValue, map: *std.StringHashMap(f32)) void {
    switch (ref) {
        .NumberList => |list| {
            for (list.list, list.id_list) |val, name| {
                map.put(name, val) catch continue;
            }
        },
        else => {},
    }
}

fn create_files(json_file: std.fs.File, out_name: []const u8) !void {
    var arena_state = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena_state.deinit();
    const arena = arena_state.allocator();

    const file_slice = json_file.readToEndAlloc(arena, 2042 * 1000) catch unreachable;
    const corrent_tree = try std.json.parseFromSlice(Tree, arena, file_slice, .{ .duplicate_field_behavior = .use_last });
    const tree = &corrent_tree.value;
    const clear_tree = try clean_tree(tree, arena);
    std.fs.cwd().deleteFile(out_name) catch {};
    const zig_file = try std.fs.cwd().createFile(out_name, .{ .truncate = false });
    errdefer zig_file.close();
    try load_global_maps(&clear_tree, arena);
    var writer_buf: [8000]u8 = undefined;
    var writer = zig_file.writer(&writer_buf);

    _ = try writer.interface.writeAll(
        \\const std = @import("std");
        \\const clock = @import("../ClockNode.zig");
        \\const ClockNode = clock.ClockNode;
        \\const ClockNodeTypes = clock.ClockNodesTypes;
        \\const ClockState = clock.ClockState;
        \\const ClockError = clock.ClockError;
        \\
        \\
    );

    try create_configs(&clear_tree, &writer.interface);
    try create_conf_struct(&clear_tree, &writer.interface);
    try create_alter_conf_struct(&clear_tree, &writer.interface);
    try create_clock_struct(&clear_tree, &writer.interface);
    try writer.interface.flush();
    zig_file.close();
    var ch = std.process.Child.init(&[_][]const u8{ "zig", "fmt", out_name }, arena);
    _ = try ch.spawnAndWait();
}

fn clean_tree(base_tree: *const Tree, alloc: std.mem.Allocator) !Tree {
    var new_elements = try std.ArrayList(Element).initCapacity(alloc, 1);
    for (base_tree.element) |element| {
        if (TypeMap.get(element.Elementtype)) |_| {
            switch (get_default_value(element.reference)) {
                .NoReference => continue,
                else => {},
            }
            try new_elements.append(alloc, element);
        }
    }

    var new_tree = base_tree.*;
    new_tree.element = try new_elements.toOwnedSlice(alloc);

    return new_tree;
}

fn get_default_value(references: []Reference) ReferenceValue {
    var val: ReferenceValue = .NoReference;
    for (references) |ref| {
        //only care abount the null expression
        if (ref.expr) |_| continue;
        //if the expr is resolved at the interface level, it has higher priority to be the default value
        if (ref.pre_evaluated) return ref.value;
        val = ref.value;
    }
    return val;
}

fn get_default_value_num(value: ReferenceValue, element: *const Element) f32 {
    return switch (value) {
        .Number => |val| @floatFromInt(val.default),
        .NumberList => |val| val.default,
        .FixedNumber => |val| @floatFromInt(val),
        .Input => |val| @floatFromInt(get_input_index_from_id(val.DefaultInput, element)),
        else => 0,
    };
}

fn get_input_index_from_id(id: []const u8, element: *const Element) usize {
    for (element.sources, 0..element.sources.len) |src, idx| {
        switch (src) {
            .input => |inp| {
                const ref_id = inp.RefValue orelse continue;
                if (std.mem.eql(u8, ref_id, id)) return idx;
            },
            else => {},
        }
    }
    return 0;
}

fn check_input(name: []const u8) bool {
    return if (nameMap.get(name)) |_| true else false;
}

//========= config types =========
///create enum configs for each type in clocktree
fn create_configs(tree: *const Tree, writer: *std.Io.Writer) !void {
    const palloc = std.heap.page_allocator;
    var parentmap = std.StringHashMap(void).init(palloc);
    defer parentmap.deinit();

    for (tree.element) |element| {
        if (std.mem.eql(u8, "output", element.Elementtype)) {
            continue;
        } else if (std.mem.eql(u8, "activeOutput", element.Elementtype)) {
            continue;
        }

        if (parentmap.get(element.reference_id)) |_| continue;
        try parentmap.put(element.reference_id, {});

        switch (get_default_value(element.reference)) {
            .NumberList => |_| {
                try create_list_config(&element, writer, palloc);
            },
            .Input => |_| {
                try create_mutiplexor_config(&element, writer);
            },
            .Number => |_| {
                try create_number_config(&element, writer);
            },
            else => {},
        }
    }
}

fn create_list_config(element: *const Element, writer: *std.Io.Writer, alloc: std.mem.Allocator) !void {
    var valuemap = std.StringHashMap(f32).init(alloc);
    defer valuemap.deinit();

    try writer.print(
        \\pub const @"{s}Conf" = enum{{
        \\
    , .{element.reference_id});

    for (element.reference) |ref| {
        switch (ref.value) {
            .NumberList => |list| {
                for (list.id_list, list.list) |id, val| {
                    if (valuemap.get(id)) |_| continue;
                    try valuemap.put(id, val);
                    try writer.print("@\"{s}\",\n", .{id});
                }
            },
            else => {},
        }
    }

    try writer.print(
        \\pub fn get(self: @This()) f32 {{
        \\  return switch(self) {{
        \\
    , .{});

    var map_iter = valuemap.iterator();
    var qtd: usize = 0;
    while (map_iter.next()) |entry| {
        try writer.print(".@\"{s}\" => {d},\n", .{ entry.key_ptr.*, entry.value_ptr.* });
        qtd += 1;
    }

    try writer.print(
        \\}};
        \\}}
        \\}};
        \\
    , .{});
    try ValuesQtd.put(element.name, qtd);
}

fn create_mutiplexor_config(element: *const Element, writer: *std.Io.Writer) !void {
    try writer.print("pub const @\"{s}Conf\" = enum{{\n", .{element.reference_id});
    var qtd: usize = 0;
    for (element.sources) |sources| {
        switch (sources) {
            .input => |input| {
                if (check_input(input.from)) {
                    if (input.RefValue) |val| {
                        try writer.print("{s},\n", .{val});
                    } else {
                        try writer.print("{s},\n", .{input.from});
                    }
                    qtd += 1;
                }
            },
            else => {},
        }
    }

    try writer.print(
        \\
        \\pub fn get(self: @This()) usize {{
        \\  return @intFromEnum(self);
        \\  }}
        \\}};
    , .{});

    try ValuesQtd.put(element.name, qtd);
}

fn create_number_config(element: *const Element, writer: *std.Io.Writer) !void {
    const name = element.reference_id;

    try writer.print(
        \\pub const @"{s}Conf" = enum(u32) {{
        \\    _,
        \\    pub fn get(num: @This()) f32 {{
        \\        const val: u32 = @intFromEnum(num);
        \\        return @as(f32,@floatFromInt(val));
        \\    }}
        \\}};
        \\
    , .{name});
}

//======= config struct ==========
///cretate the config struct
fn create_conf_struct(tree: *const Tree, writer: *std.Io.Writer) !void {
    try writer.print("pub const Config = struct {{\n", .{});
    for (tree.element) |element| {
        const name = element.name;
        const id_name = element.reference_id;
        if (std.mem.eql(u8, "output", element.Elementtype)) {
            continue;
        } else if (std.mem.eql(u8, "activeOutput", element.Elementtype)) {
            continue;
        }
        switch (get_default_value(element.reference)) {
            .FixedNumber, .NoReference => {},
            else => {
                try writer.print("{s}: ?@\"{s}Conf\" = null,\n", .{ name, id_name });
            },
        }

        // switch (get_default_value(element.reference)) {
        //     .Number => |number| {
        //         try writer.print("{s}: @\"{s}Conf\" = @enumFromInt({d}),\n", .{ name, id_name, number.default });
        //     },
        //     .NumberList => |list| {
        //         const def_val = blk: {
        //             for (list.id_list, list.list) |val_name, number| {
        //                 if (number == list.default) break :blk val_name;
        //             }
        //             break :blk list.id_list[0];
        //         };
        //         try writer.print("{s}: @\"{s}Conf\" = ", .{ name, id_name });

        //         try writer.print(".@\"{s}\"", .{def_val});
        //         try writer.print(",\n", .{});
        //     },
        //     .Input => |input| {
        //         if (input.DefaultInput.len > 0) {
        //             try writer.print("{s}: @\"{s}Conf\" = .{s},\n", .{ name, id_name, input.DefaultInput });
        //         } else {
        //             for (element.sources) |src| {
        //                 switch (src) {
        //                     .input => |inpn| {
        //                         if (inpn.RefValue) |ref| {
        //                             try writer.print("{s}: @\"{s}Conf\" = .{s},\n", .{ name, id_name, ref });
        //                             break;
        //                         }
        //                     },
        //                     else => {},
        //                 }
        //             }
        //         }
        //     },
        //     else => {},
        // }
    }

    try writer.print("}};\n\n", .{});
}

fn create_alter_conf_struct(tree: *const Tree, writer: *std.Io.Writer) !void {
    const palloc = std.heap.page_allocator;
    var parentmap = std.StringHashMap(void).init(palloc);
    defer parentmap.deinit();

    try writer.print("pub const ConfigWithRef = struct {{\n", .{});
    for (tree.element) |element| {
        const id_name = element.reference_id;
        if (std.mem.eql(u8, "output", element.Elementtype)) {
            continue;
        } else if (std.mem.eql(u8, "activeOutput", element.Elementtype)) {
            continue;
        }

        if (parentmap.get(id_name)) |_| continue;
        try parentmap.put(id_name, {});

        switch (get_default_value(element.reference)) {
            .FixedNumber, .NoReference => {},
            else => {
                try writer.print("@\"{s}\": ?@\"{s}Conf\" = null,\n", .{ id_name, id_name });
            },
        }

        // switch (get_default_value(element.reference)) {
        //     .Number => |number| {
        //         try writer.print("@\"{s}\": @\"{s}Conf\" = @enumFromInt({d}),\n", .{ id_name, id_name, number.default });
        //     },
        //     .NumberList => |list| {
        //         const def_val = blk: {
        //             for (list.id_list, list.list) |val_name, number| {
        //                 if (number == list.default) break :blk val_name;
        //             }
        //             break :blk list.id_list[0];
        //         };
        //         try writer.print("@\"{s}\": @\"{s}Conf\" = ", .{ id_name, id_name });

        //         try writer.print(".@\"{s}\"", .{def_val});
        //         try writer.print(",\n", .{});
        //     },
        //     .Input => |input| {
        //         if (input.DefaultInput.len > 0) {
        //             try writer.print("@\"{0s}\": @\"{0s}Conf\" = .{1s},\n", .{ id_name, input.DefaultInput });
        //         } else {
        //             for (element.sources) |src| {
        //                 switch (src) {
        //                     .input => |inpn| {
        //                         if (inpn.RefValue) |ref| {
        //                             try writer.print("@\"{0s}\": @\"{0s}Conf\" = .{1s},\n", .{ id_name, ref });
        //                             break;
        //                         }
        //                     },
        //                     else => {},
        //                 }
        //             }
        //         }
        //     },
        //     else => {},
        // }
    }
    try create_into_config(tree, writer);

    try writer.print("}};\n\n", .{});
}

fn create_into_config(tree: *const Tree, writer: *std.Io.Writer) !void {
    _ = try writer.write(
        \\pub fn into_config(self: *const ConfigWithRef) Config {
        \\ return .{
        \\
    );
    for (tree.element) |element| {
        const name = element.name;
        const id_name = element.reference_id;
        if (std.mem.eql(u8, "output", element.Elementtype)) {
            continue;
        } else if (std.mem.eql(u8, "activeOutput", element.Elementtype)) {
            continue;
        }
        switch (get_default_value(element.reference)) {
            .NoReference, .FixedNumber => continue,
            else => try writer.print(".{s} = self.@\"{s}\",\n", .{ name, id_name }),
        }
    }

    _ = try writer.write(
        \\  };
        \\}
        \\
    );
}

//======= Clock Struct ========

fn create_clock_struct(tree: *const Tree, writer: *std.Io.Writer) !void {
    try writer.print(
        \\pub const ClockTree = struct {{
        \\  const Self = @This();
        \\
        \\
    , .{});

    try create_clock_types(tree, writer);
    try create_init_comptime(tree, writer);
    try create_into_runtime(tree, writer);
    try create_runtime_deinit(tree, writer);
    try create_runtime_apply(tree, writer);
    //try create_clock_validate(tree, writer);

    try writer.print(
        \\}};
        \\
        \\
    , .{});
}

const ValueTyRef = *const fn (*const Element, ReferenceValue, bool, *std.Io.Writer) anyerror!void;
const ValueTyMap = std.StaticStringMap(ValueTyRef).initComptime(.{
    .{ "ExtraRef", create_source_val },
    .{ "distinctValsSource", create_source_val },
    .{ "fixedSource", create_source_val },
    .{ "variedSource", create_source_val },
    .{ "fractional", create_source_val },
    .{ "multiplicator", create_prescaler_val },
    .{ "multiplicatorFrac", create_mulfrac_val },
    .{ "devisor", create_prescaler_val },
    .{ "divisor", create_prescaler_val },
    .{ "multiplexor", create_multiplex_val },
    .{ "xbar", create_multiplex_val },
    .{ "output", create_output_val },
    .{ "activeOutput", create_output_val },
});

const TypeRef = *const fn (*const Element, *std.Io.Writer) anyerror!void;
const TypeMap = std.StaticStringMap(TypeRef).initComptime(.{
    .{ "ExtraRef", create_source },
    .{ "distinctValsSource", create_source },
    .{ "fixedSource", create_source },
    .{ "variedSource", create_source },
    .{ "fractional", create_source },
    .{ "multiplicator", create_prescaler },
    .{ "multiplicatorFrac", create_mulfrac },
    .{ "devisor", create_prescaler },
    .{ "divisor", create_prescaler },
    .{ "multiplexor", create_multiplex },
    .{ "xbar", create_multiplex },
    .{ "output", create_output },
    .{ "activeOutput", create_output },
});

fn create_clock_types(tree: *const Tree, writer: *std.Io.Writer) !void {
    for (tree.element) |element| {
        if (std.mem.eql(u8, "ExtraRef", element.Elementtype)) {
            try writer.print("@\"{s}\": ClockNodeTypes,\n", .{element.name});
        } else {
            try writer.print("@\"{s}\": ClockNode,\n", .{element.name});
        }
    }
    _ = try writer.write("\n");
}

fn create_init_comptime(tree: *const Tree, writer: *std.Io.Writer) !void {
    const palloc = std.heap.page_allocator;
    var parentmap = std.StringHashMap(bool).init(palloc);
    defer parentmap.deinit();
    try writer.print(
        \\pub fn init(comptime config: Config) Self {{
        \\
    , .{});
    for (tree.element) |element| {
        if (parentmap.get(element.name)) |_| continue;
        try parentmap.put(element.name, true);
        try create_node_source(&element, writer, &parentmap);
    }

    _ = try writer.write("return .{\n");
    for (tree.element) |element| {
        if (std.mem.eql(u8, "ExtraRef", element.Elementtype)) {
            try writer.print(".@\"{0s}\" = @\"{0s}val\",\n", .{element.name});
        } else {
            try writer.print(".@\"{0s}\" = @\"{0s}\",\n", .{element.name});
        }
    }

    _ = try writer.write(
        \\  };
        \\}
        \\
    );
}

fn create_into_runtime(tree: *const Tree, writer: *std.Io.Writer) !void {
    try writer.writeAll(
        \\pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
    );

    for (tree.element) |element| {
        if (std.mem.eql(u8, "ExtraRef", element.Elementtype)) continue;
        const name = element.name;
        try writer.print(
            \\self.@"{s}".parents = try alloc.dupe(*const ClockNode, &.{{
        , .{name});

        for (element.sources) |source| {
            switch (source) {
                .input => |input| {
                    if (check_input(input.from)) {
                        try writer.print("&self.@\"{s}\",", .{input.from});
                    }
                },
                else => {},
            }
        }

        try writer.writeAll("});\n");
    }

    try writer.writeAll(
        \\}
    );
}

fn create_runtime_deinit(tree: *const Tree, writer: *std.Io.Writer) !void {
    try writer.writeAll(
        \\pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
    );

    for (tree.element) |element| {
        if (std.mem.eql(u8, "ExtraRef", element.Elementtype)) continue;
        const name = element.name;
        try writer.print(
            \\alloc.free(self.@"{s}".parents.?);
        , .{name});
    }

    try writer.writeAll(
        \\}
    );
}

fn create_runtime_apply(tree: *const Tree, writer: *std.Io.Writer) !void {
    var map = std.StringHashMap(void).init(std.heap.page_allocator);
    defer map.deinit();

    try writer.writeAll("pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {");
    for (tree.element) |element| {
        if (map.get(element.reference_id)) |_| continue;
        try map.put(element.reference_id, {});
        try create_runtime_apply_values(element, &map, writer);
    }
    try writer.writeAll("}");
}

fn create_runtime_apply_values(element: Element, map: *std.StringHashMap(void), writer: *std.Io.Writer) !void {
    for (element.sources) |src| {
        switch (src) {
            .input => |in| {
                const in_element = nameMap.get(in.from) orelse continue;
                if (map.get(in_element.reference_id)) |_| continue;
                if (std.mem.eql(u8, in_element.reference_id, element.reference_id)) continue;
                try map.put(in_element.reference_id, {});
                try create_runtime_apply_values(in_element, map, writer);
            },
            else => continue,
        }
    }
    for (element.reference) |ref| {
        try apply_expr(ref, map, writer);
    }
    try create_node_value(&element, true, writer);
    if (std.mem.eql(u8, element.Elementtype, "ExtraRef")) {
        try writer.print("self.@\"{0s}\" = @\"{0s}val\";\n", .{element.name});
    } else {
        try writer.print("self.@\"{0s}\".nodetype = @\"{0s}val\";\n", .{element.name});
    }
}

fn apply_expr(ref: Reference, map: *std.StringHashMap(void), writer: *std.Io.Writer) anyerror!void {
    if (ref.expr) |expr| {
        const len = expr.len;
        var idx: usize = 0;
        while (idx < len) {
            switch (expr[idx]) {
                '&', '|', '=', '!', '(', ')', '/', ' ', '<', '>' => {
                    idx += 1;
                },
                else => {
                    const str = get_cur_str(expr[idx..]);
                    idx += str.len;
                    const ref_id = RefIDmap.get(str) orelse continue;
                    const exp_element = nameMap.get(ref_id) orelse continue;
                    if (map.get(exp_element.reference_id)) |_| continue;
                    try map.put(exp_element.reference_id, {});
                    try create_runtime_apply_values(exp_element, map, writer);
                },
            }
        }
    }
}

const NodeType = enum { none, simple, frac, multi };
const NodeMap = std.StaticStringMap(NodeType).initComptime(.{
    .{ "distinctValsSource", NodeType.none },
    .{ "fixedSource", NodeType.none },
    .{ "variedSource", NodeType.none },
    .{ "fractional", NodeType.none },
    .{ "multiplicator", NodeType.simple },
    .{ "multiplicatorFrac", NodeType.frac },
    .{ "devisor", NodeType.simple },
    .{ "divisor", NodeType.simple },
    .{ "multiplexor", NodeType.multi },
    .{ "xbar", NodeType.multi },
    .{ "output", NodeType.simple },
    .{ "activeOutput", NodeType.simple },
});
fn create_node_source(element: *const Element, writer: *std.Io.Writer, parentmap: *std.StringHashMap(bool)) !void {
    //std.debug.print("create source for: {s}\n", .{element.name});
    const nodet: NodeType = NodeMap.get(element.Elementtype) orelse NodeType.none;

    switch (nodet) {
        .none => {},
        .simple => {
            const input_name = try find_fist_input(element.sources);
            if (!std.mem.eql(u8, input_name, element.name)) {
                if (parentmap.get(input_name)) |_| {} else {
                    if (nameMap.get(input_name)) |input_element| {
                        try parentmap.put(input_name, true);
                        try create_node_source(&input_element, writer, parentmap);
                    }
                }
            }
        },

        .frac => {
            const frac_inputs = try find_fract(element.sources);
            const names = &[_][]const u8{ frac_inputs.inputid, frac_inputs.fractid };
            for (names) |name| {
                if (!std.mem.eql(u8, name, element.name)) {
                    if (parentmap.get(name)) |_| {} else {
                        if (nameMap.get(name)) |input_element| {
                            try parentmap.put(name, true);
                            try create_node_source(&input_element, writer, parentmap);
                        }
                    }
                }
            }
        },

        .multi => {
            for (element.sources) |source| {
                switch (source) {
                    .input => |input| {
                        const input_name = input.from;
                        if (std.mem.eql(u8, input_name, element.name)) continue;
                        if (parentmap.get(input_name)) |_| continue;
                        const input_element = nameMap.get(input_name) orelse continue;
                        try parentmap.put(input_name, true);
                        try create_node_source(&input_element, writer, parentmap);
                    },
                    else => {},
                }
            }
        },
    }
    var max_refs: [25][]const u8 = undefined;
    for (element.reference) |ref| {
        if (ref.expr) |expr| {
            const to_create = get_expr_refs(expr, &max_refs);
            for (to_create) |name| {
                if (parentmap.get(name)) |_| continue;
                try parentmap.put(name, true);
                const input_element = nameMap.get(name) orelse continue;
                try create_node_source(&input_element, writer, parentmap);
            }
        }
    }
    try create_node(element, writer);
    //std.debug.print("===end create===\n", .{});
}

fn get_expr_refs(expr: []const u8, expr_deep: [][]const u8) []const []const u8 {
    var expr_idx: usize = 0;
    var expr_deep_idx: usize = 0;
    while (expr_idx < expr.len) {
        switch (expr[expr_idx]) {
            '!', '(', ')', '/', '=', '|', '&', ' ', '>', '<' => {
                expr_idx += 1;
            },
            else => {
                const str = get_cur_str(expr[expr_idx..]);
                expr_idx += str.len;
                if (is_element(str)) {
                    expr_deep[expr_deep_idx] = str;
                    expr_deep_idx += 1;
                }
            },
        }
    }

    return expr_deep[0..expr_deep_idx];
}

fn is_element(str: []const u8) bool {
    return if (nameMap.get(str)) |_| true else false;
}

fn create_node(element: *const Element, writer: *std.Io.Writer) !void {
    try create_node_value(element, false, writer);
    if (std.mem.eql(u8, "ExtraRef", element.Elementtype)) return;
    try writer.print(
        \\const @"{0s}": ClockNode = .{{
        \\  .name = "{0s}",
        \\  .nodetype = @"{0s}val",
        \\
    , .{element.name});
    const callback = TypeMap.get(element.Elementtype) orelse return error.InvalidType;
    callback(element, writer) catch |err| {
        switch (err) {
            error.RecursiveNode => {},
            else => return err,
        }
    };

    try writer.print(
        \\}};
        \\ 
    , .{});
}

var global_expr: ?[]const u8 = null;
fn create_node_value(element: *const Element, runtime: bool, writer: *std.Io.Writer) !void {
    const callback = ValueTyMap.get(element.Elementtype) orelse return error.InvalidType;
    const defualt = get_default_value(element.reference);
    var have_expr: bool = false;
    var buf: [500]u8 = undefined;
    try writer.print(
        \\const @"{s}val" =
    , .{element.name});
    for (element.reference) |reference| {
        const zig_expr = trasnlate_expression(reference, &buf) orelse continue;
        global_expr = reference.expr;
        if (!have_expr) {
            try writer.print(
                \\blk: {{
                \\if({s}){{
                \\  break :blk 
            , .{zig_expr});

            callback(element, reference.value, runtime, writer) catch |err| {
                switch (err) {
                    error.RecursiveNode => {},
                    else => return err,
                }
            };

            try writer.print(
                \\}}
                \\
            , .{});
            have_expr = true;
        } else if (have_expr) {
            try writer.print(
                \\else if({s}){{
                \\  break :blk 
            , .{zig_expr});
            callback(element, reference.value, runtime, writer) catch |err| {
                switch (err) {
                    error.RecursiveNode => {},
                    else => return err,
                }
            };
            try writer.print(
                \\}}
                \\
            , .{});
        }
    }

    global_expr = null;

    if (have_expr) {
        try writer.print(
            \\else {{
            \\  break :blk 
        , .{});
        callback(element, defualt, runtime, writer) catch |err| {
            switch (err) {
                error.RecursiveNode => {},
                else => return err,
            }
        };
        try writer.print(
            \\}}
            \\}}; 
            \\
        , .{});
    } else {
        callback(element, defualt, runtime, writer) catch |err| {
            switch (err) {
                error.RecursiveNode => {},
                else => return err,
            }
        };
    }
}

fn trasnlate_expression(ref: Reference, buf: []u8) ?[]const u8 {
    var inner: [550]u8 = undefined;
    var inner_idx: usize = 0;

    if (ref.expr) |expr| {
        const len = expr.len;
        var idx: usize = 0;
        while (idx < len) {
            switch (expr[idx]) {
                '!', '(', ')', '/', ' ', '<', '>' => {
                    inner[inner_idx] = expr[idx];
                    idx += 1;
                    inner_idx += 1;
                },

                '=' => {
                    std.mem.copyForwards(u8, inner[inner_idx..], "==");
                    idx += 1;
                    inner_idx += 2;
                },

                '|' => {
                    std.mem.copyForwards(u8, inner[inner_idx..], "or");
                    idx += 1;
                    inner_idx += 2;
                },

                '&' => {
                    std.mem.copyForwards(u8, inner[inner_idx..], "and");
                    idx += 1;
                    inner_idx += 3;
                },

                else => {
                    const str = get_cur_str(expr[idx..]);
                    const val = string_to_idval(str, inner[inner_idx..]) catch return null;
                    idx += str.len;
                    inner_idx += val;
                },
            }
        }
        std.mem.copyForwards(u8, buf, inner[0..inner_idx]);
        return buf[0..inner_idx];
    }

    return null;
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

var last_node: ?Element = null;
fn string_to_idval(buf: []const u8, outbuf: []u8) !usize {
    if (RefIDmap.get(buf)) |data| {
        last_node = nameMap.get(data);
        return (try std.fmt.bufPrint(outbuf, "@\"{s}val\".num_val()", .{data})).len;
    }

    if (RefValIDmap.get(buf)) |data| {
        return (try std.fmt.bufPrint(outbuf, "{d}", .{data})).len;
    }

    if (nameMap.get(buf)) |_| {
        if (last_node) |node| {
            const size = (try std.fmt.bufPrint(outbuf, "@as(f32, @floatFromInt(@as(usize, @intFromEnum(@\"{s}Conf\".{s}))))", .{ node.name, buf })).len;
            last_node = null;
            return size;
        }
        return error.fail;
    }

    const is_number: ?f32 = std.fmt.parseFloat(f32, buf) catch null;
    if (is_number) |data| {
        return (try std.fmt.bufPrint(outbuf, "{d}", .{data})).len;
    }

    return error.fail;
}

fn find_fist_input(sources: []const ClockTree.Sources) ![]const u8 {
    for (sources) |source| {
        switch (source) {
            .input => |input| {
                return input.from;
            },
            else => {},
        }
    }

    return error.NoInputFind;
}

fn create_prescaler(element: *const Element, writer: *std.Io.Writer) anyerror!void {
    const name = element.name;
    const first_input = try find_fist_input(element.sources);
    if (std.mem.eql(u8, name, first_input)) return error.RecursiveNode;
    try writer.print(
        \\.parents = &[_]*const ClockNode{{&@"{s}"}},
        \\
    , .{first_input});
}

const PLLMap = std.StaticStringMap([]const u8).initComptime(.{
    .{ "multiplicator", "MUL" },
    .{ "multiplicatorFrac", "MUL" },
    .{ "devisor", "DIV" },
    .{ "divisor", "DIV" },
});

fn create_prescaler_val(element: *const Element, value: ReferenceValue, runtime: bool, writer: *std.Io.Writer) anyerror!void {
    const name = element.name;
    const first_input = try find_fist_input(element.sources);
    if (std.mem.eql(u8, name, first_input)) return error.RecursiveNode;
    var buf: [5]u8 = undefined;
    const prefix = PLLMap.get(element.Elementtype) orelse return error.InvalidPrescalerType;
    const lower_prefix = to_lower(&buf, prefix);
    switch (value) {
        .Number => |limits| {
            try writer.print(
                \\ClockNodeTypes{{ .{s} = .{{ .value = if(config.@"{s}") |val| val.get() else {d}, .limit = .{{ .max = @min(1_000_000_000, {d}), .min = {d} }}, }}, }};
                \\
            , .{ lower_prefix, name, limits.default, limits.max, limits.min });
        },

        .FixedNumber => |num| {
            try writer.print(
                \\ClockNodeTypes{{ .{s} = .{{ .value = {d} }}, }};
                \\
            , .{ lower_prefix, num });
        },

        .NumberList => |lists| {
            try writer.print(
                \\ClockNodeTypes{{ .{s} = .{{ .value = inner: {{
                \\
            , .{lower_prefix});
            try create_check_options(element, lists.id_list, value, runtime, writer);

            try writer.print(
                \\  }},
                \\  }} 
                \\}};
                \\
            , .{});
        },
        else => {
            return error.InvalidMulRef;
        },
    }
}

const FracIds = struct {
    inputid: []const u8,
    fractid: []const u8,
};

fn to_lower(out: []u8, from: []const u8) []const u8 {
    const size: usize = @min(out.len, from.len);
    for (0..size) |index| {
        out[index] = std.ascii.toLower(from[index]);
    }
    return out[0..size];
}

fn find_fract(sources: []Sources) !FracIds {
    var buffer: [50]u8 = undefined;
    var fract: ?[]const u8 = null;
    var input: ?[]const u8 = null;
    var default: [2]Input = undefined;
    var def_index: usize = 0;
    for (sources) |source| {
        switch (source) {
            .input => |from| {
                const id = to_lower(&buffer, from.from);
                default[def_index] = from;
                def_index += 1;
                if (std.mem.indexOf(u8, id, "frac")) |_| {
                    fract = from.from;
                    continue;
                }
                input = from.from;
                if (def_index == 2) break;
            },
            else => {},
        }
    }

    if (def_index > 2) return error.InvalidInput;

    if (fract) |fractional| {
        if (input) |from| {
            return FracIds{
                .fractid = fractional,
                .inputid = from,
            };
        }
    }

    return FracIds{
        .fractid = default[1].from,
        .inputid = default[0].from,
    };
}
fn create_mulfrac(element: *const Element, writer: *std.Io.Writer) anyerror!void {
    const inputs = try find_fract(element.sources);
    try writer.print(
        \\.parents = &[_]*const ClockNode{{&@"{s}", &@"{s}"}},
        \\
    , .{ inputs.inputid, inputs.fractid });
}

fn create_mulfrac_val(element: *const Element, value: ReferenceValue, runtime: bool, writer: *std.Io.Writer) anyerror!void {
    const name = element.name;
    switch (value) {
        .Number => |limits| {
            try writer.print(
                \\ClockNodeTypes{{ .mulfrac = .{{ .value = if(config.@"{s}") |val| val.get() else {d}, .limit = .{{ .max = @min(1_000_000_000, {d}), .min = {d} }}, }}, }};
                \\
            , .{ name, limits.default, limits.max, limits.min });
        },
        .FixedNumber => |num| {
            try writer.print(
                \\ClockNodeTypes{{ .mulfrac = .{{ .value = {d} }}, }};
                \\
            , .{num});
        },
        .NumberList => |lists| {
            try writer.print(
                \\ClockNodeTypes{{ .mulfrac = .{{ .value = inner: {{
                \\
            , .{});
            try create_check_options(element, lists.id_list, value, runtime, writer);

            try writer.print(
                \\  }},
                \\  }} 
                \\}};
                \\
            , .{});
        },
        else => {
            return error.InvalidMulRef;
        },
    }
}

fn create_multiplex(element: *const Element, writer: *std.Io.Writer) anyerror!void {
    try writer.print(
        \\
        \\.parents = &[_]*const ClockNode{{
    , .{});

    for (element.sources) |source| {
        switch (source) {
            .input => |input| {
                if (check_input(input.from)) {
                    try writer.print("&@\"{s}\",", .{input.from});
                }
            },
            else => {},
        }
    }
    _ = try writer.write(
        \\},
        \\
    );
}

fn create_multiplex_val(element: *const Element, val: ReferenceValue, runtime: bool, writer: *std.Io.Writer) anyerror!void {
    var inputs_ids: [200][]const u8 = undefined;
    var inputs_idx: usize = 0;

    for (element.sources) |src| {
        switch (src) {
            .input => |in| {
                const ref_name = in.RefValue orelse continue;
                inputs_ids[inputs_idx] = ref_name;
                inputs_idx += 1;
            },
            else => {},
        }
    }

    try writer.print(
        \\ClockNodeTypes{{ .multi = inner: {{
        \\
    , .{});
    try create_check_options(element, inputs_ids[0..inputs_idx], val, runtime, writer);

    try writer.print(
        \\  }},
        \\}};
        \\
    , .{});
}

fn create_output(element: *const Element, writer: *std.Io.Writer) anyerror!void {
    const input_id = try find_fist_input(element.sources);
    if (std.mem.eql(u8, element.name, input_id)) return error.RecursiveNode;
    try writer.print(
        \\.parents = &[_]*const ClockNode{{&@"{s}"}},
        \\
    , .{input_id});
}

fn create_output_val(_: *const Element, value: ReferenceValue, _: bool, writer: *std.Io.Writer) anyerror!void {
    switch (value) {
        .Number => |num| {
            try writer.print(
                \\ClockNodeTypes{{ .output = .{{ .max = @min(1_000_000_000, {d}), .min = {d} }}, }};
                \\
            , .{ num.max, num.min });
        },
        else => {
            try writer.print(
                \\ClockNodeTypes{{ .output = null }};
                \\
            , .{});
        },
    }
}

fn create_check_options(element: *const Element, valid_op: []const []const u8, value: ReferenceValue, runtime: bool, writer: *std.Io.Writer) anyerror!void {
    const qtd = ValuesQtd.get(element.name) orelse 0;
    if (qtd > valid_op.len) {
        try writer.print(
            \\if(config.@"{s}") |val| {{
            \\switch(val) {{
            \\
        , .{element.name});

        for (valid_op) |op| {
            try writer.print(
                \\ .@"{s}",
                \\
            , .{op});
        }

        try writer.print(
            \\ => {{break :inner val.get();}},
            \\
        , .{});

        try writer.print(
            \\else => {{}},
            \\
        , .{});

        if (global_expr) |expr| {
            if (runtime) {
                try writer.print(
                    \\}}
                    \\return error.InvalidConfig;
                    \\
                , .{});
            } else {
                try writer.print(
                    \\}}
                    \\@compileError(std.fmt.comptimePrint("value {{s}}, cannot be used if expr: {{s}} is true", .{{@tagName(val), "{s}" }}));
                    \\
                , .{expr});
            }
        } else {
            if (runtime) {
                try writer.print(
                    \\}}
                    \\return error.InvalidConfig;
                    \\
                , .{});
            } else {
                try writer.print(
                    \\}}
                    \\@compileError(std.fmt.comptimePrint("value {{s}} depends on an expression that returned false", .{{@tagName(val)}}));
                    \\
                , .{});
            }
        }
    } else {
        try writer.print(
            \\if(config.@"{s}") |val| {{
            \\ break :inner val.get();
            \\
        , .{element.name});
    }

    try writer.print(
        \\}} else {{
        \\  break :inner {d};
        \\}}
        \\
    , .{get_default_value_num(value, element)});
}

fn create_source(_: *const Element, _: *std.Io.Writer) anyerror!void {}

fn create_source_val(element: *const Element, value: ReferenceValue, runtime: bool, writer: *std.Io.Writer) anyerror!void {
    const name = element.name;
    switch (value) {
        .Number => |limits| {
            try writer.print(
                \\ClockNodeTypes{{ .source = .{{ .value = if(config.@"{s}") |val| val.get() else {d}, .limit = .{{ .max = @min(1_000_000_000, {d}), .min = {d} }}, }}, }};
                \\
            , .{ name, limits.default, limits.max, limits.min });
        },
        .FixedNumber => |num| {
            try writer.print(
                \\ClockNodeTypes{{ .source = .{{ .value = {d} }}, }};
                \\
            , .{num});
        },
        .NumberList => |lists| {
            try writer.print(
                \\ClockNodeTypes{{ .source = .{{ .value = inner: {{
                \\
            , .{});
            try create_check_options(element, lists.id_list, value, runtime, writer);

            try writer.print(
                \\  }},
                \\  }} 
                \\}};
                \\
            , .{});
        },
        else => {},
    }
}

fn create_clock_validate(tree: *const Tree, writer: *std.Io.Writer) !void {
    try writer.print(
        \\
        \\ pub fn validate(comptime self: *const this) void {{
        \\
    , .{});
    for (tree.element) |element| {
        const name = element.name;

        if (std.mem.eql(u8, element.Elementtype, "activeOutput")) {
            try writer.print(
                \\ _ = self.@"{s}".get_comptime();
                \\
            , .{name});
        }
    }

    try writer.print("\n}}\n", .{});
}
