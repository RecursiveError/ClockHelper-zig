const std = @import("std");
const data_types = @import("data_types");
const Context = @import("clocktree_context.zig");
const Defaults = @import("defaults.zig");

const TreeContext = Context.TreeContext;
const EnumPatch = data_types.cubeMX_data.Enum_Patch;
const RefTpEnumPatch = data_types.cubeMX_data.Match_Ref_To_Enum_Patch;
const PreProcessedRef = Context.PreProcessedRef;
const PreProcessRefVariant = Context.PreProcessRefVariant;
const PreProcessedNode = Context.PreProcessedNode;
const PreProcessedNodeVariant = Context.PreProcessedNodeVariant;
const parser_expr = @import("parser_expr.zig").parser;

const DefaultToTrue = Defaults.DefaultToTrue;
const DefaultToFalse = Defaults.DefaultToFalse;

const DefaultBy = union(enum) {
    value: []const u8,
    reference: []const u8,
};

const logger = std.log.scoped(.zig_code_gen);

pub fn generate_zig_clocktree(io: *std.Io.Writer, tree: TreeContext, alloc: std.mem.Allocator) !void {
    generate_prelude(io) catch |err| {
        logger.err("failed to write prelude for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_enums(io, tree.base.enum_patches.values()) catch |err| {
        logger.err("failed to write enums for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_list_types(io, &tree, alloc) catch |err| {
        logger.err("failed to write list types for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_flags(io, &tree, alloc) catch |err| {
        logger.err("failed to write flags for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_cubemx_configs(io, &tree, alloc) catch |err| {
        logger.err("failed to write CubeMX configs for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_configs(io, &tree, alloc) catch |err| {
        logger.err("failed to write configs for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_check_mcu(io) catch |err| {
        logger.err("failed to write mcu check for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_tree_output(io, &tree) catch |err| {
        logger.err("failed to write tree output struct for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    generate_get_clocktree(io, &tree, alloc) catch |err| {
        logger.err("failed to write get_clocks function for tree {s} - error {any}", .{ tree.name, err });
        return err;
    };

    try generate_post(io);

    try io.writeAll(
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
        \\const clock = @import("util/solver.zig");
        \\const ClockNode = clock.ClockNode;
        \\const ClockNodeTypes = clock.ClockNodesTypes;
        \\const ClockState = clock.ClockState;
        \\const ClockError = clock.ClockError;
        \\const comptime_fail_or_error = clock.comptime_fail_or_error;
        \\const math_op = clock.math_op;
        \\const check_ref = clock.check_ref;
        \\const Limit = clock.Limit;
        \\const round = clock.round;
        \\const ignore_value = clock.ignore_value;
        \\
        \\
        \\pub fn ClockTree(comptime mcu_data: std.StaticStringMap(void)) type {
        \\  return struct {
        \\
        \\
    );
}

fn generate_enums(writer: *std.Io.Writer, enums: []const EnumPatch) !void {
    try writer.writeAll(
        \\//=======Embassy Enum Types========
        \\
    );

    for (enums) |enum_patch| {
        if (enum_patch.bit_size) |size| {
            try writer.print(
                \\pub const @"{s}" = enum(u{d}){{
                \\
            , .{ enum_patch.name, size });
        } else {
            try writer.print(
                \\pub const @"{s}" = enum{{
                \\
            , .{enum_patch.name});
        }

        for (enum_patch.fields) |fd| {
            try writer.print(
                \\    @"{s}"
            , .{fd.name});
            if (enum_patch.bit_size) |_| {
                try writer.print(
                    \\ = {d},
                    \\
                , .{fd.value});
            } else {
                try writer.writeAll(",\n");
            }
        }

        try writer.writeAll("\n};\n");
    }
}

fn generate_list_types(writer: *std.Io.Writer, tree: *const TreeContext, alloc: std.mem.Allocator) !void {
    var already_generated = std.StringArrayHashMap(void).init(alloc);
    defer already_generated.deinit();

    for (tree.pre.processedrefs) |ref| {
        if (already_generated.contains(ref.name)) continue;
        try already_generated.put(ref.name, {});
        const all_item = ref.get_list_items() catch continue;

        try writer.print(
            \\
            \\pub const @"{s}List" = enum {{
            \\
        , .{ref.name});

        for (all_item.keys()) |item| {
            try writer.print(
                \\    @"{s}",
                \\
            , .{item});
        }

        //if list has patch generate from_enum and to enum functions.
        if (tree.base.ref_to_enum_patches.get(ref.name)) |enum_patch| {

            //to_enum function:
            try writer.print(
                \\
                \\ pub fn to_enum(self: @This()) anyerror!@"{s}" {{
                \\    return switch (self) {{
                \\
            , .{enum_patch.@"enum"});

            for (enum_patch.items) |i| {
                try writer.print(
                    \\        .@"{s}" => .@"{s}",
                    \\
                , .{ i.ref_item_name, i.enum_item_name });
            }
            //if enum is incomplete, that means that not all items in the list are mapped to an enum item, so we need to add a catch-all case for the unmapped items.
            if (enum_patch.incomplete and std.mem.eql(u8, "enum", enum_patch.enum_or_ref)) {
                try writer.print(
                    \\        else => return comptime_fail_or_error(
                    \\          error.UnmappedListItem,
                    \\          "{{s}}List - {{s}} cannot be mapped to {{s}}",
                    \\          .{{ "{s}", @tagName(self), "{s}" }},),
                    \\
                , .{ ref.name, enum_patch.@"enum" });
            }
            try writer.writeAll("\n};\n}");

            //from_enum function:
            try writer.print(
                \\
                \\ pub fn from_enum(item: @"{s}") anyerror!@This() {{
                \\    return switch (item) {{
                \\
            , .{enum_patch.@"enum"});

            for (enum_patch.items) |i| {
                try writer.print(
                    \\        .@"{s}" => .@"{s}",
                    \\
                , .{ i.enum_item_name, i.ref_item_name });
            }

            if (enum_patch.incomplete and std.mem.eql(u8, "ref", enum_patch.enum_or_ref)) {
                try writer.print(
                    \\        else => return comptime_fail_or_error(
                    \\          error.UnmappedListItem,
                    \\          "{{s}} - {{s}} cannot be mapped to {{s}}List",
                    \\          .{{ "{s}", @tagName(item), "{s}" }},),
                    \\
                , .{ enum_patch.@"enum", ref.name });
            }

            try writer.writeAll("\n};\n}");
        }

        //optinal getter for the list items
        if (ref.is_clocktree_value()) {
            var has_null = false;
            try writer.writeAll(
                \\
                \\pub fn get(self: @This()) !f32 {
                \\    return switch (self) {
                \\
            );
            for (all_item.keys()) |item| {
                const value = all_item.get(item).? orelse {
                    has_null = true;
                    continue;
                };
                try writer.print(
                    \\    .@"{s}" => {},
                    \\
                , .{ item, value });
            }
            if (has_null) {
                try writer.print(
                    \\    else => return comptime_fail_or_error(
                    \\        error.NullListItem,
                    \\        "{{s}}List - {{s}} has no value",
                    \\        .{{ "{s}", @tagName(self) }}),
                    \\
                , .{ref.name});
            }

            try writer.writeAll("\n};\n}");
        }

        try writer.writeAll("\n};\n");
    }
}

pub fn generate_flags(writer: *std.Io.Writer, tree: *const TreeContext, alloc: std.mem.Allocator) !void {

    //flag config input

    try writer.writeAll(
        \\
        \\//=======ClockTree Flags========
        \\
        \\pub const Flags = struct {
        \\
    );

    for (tree.base.extra_flags.keys()) |flag| {
        const default_state = if (DefaultToTrue.get(flag)) |_| "true" else "false";
        try writer.print(
            \\    @"{s}": bool = {s},
            \\
        , .{ flag, default_state });
    }

    try writer.writeAll(
        \\
        \\};
        \\
    );

    //flag config output

    var already_generated = std.StringArrayHashMap(void).init(alloc);
    defer already_generated.deinit();

    try writer.writeAll(
        \\
        \\//=======ClockTree Output Flags========
        \\
        \\pub const OutputFlags = struct {
        \\
    );

    for (tree.base.extra_flags.keys()) |flag| {
        if (already_generated.contains(flag)) continue;
        try already_generated.put(flag, {});
        const default_state = if (DefaultToTrue.get(flag)) |_| "true" else "false";
        try writer.print(
            \\    @"{s}": bool = {s},
            \\
        , .{ flag, default_state });
    }

    for (tree.pre.processedrefs) |ref| {
        if (ref.is_flag() and !already_generated.contains(ref.name)) {
            try already_generated.put(ref.name, {});
            const default_state = if (DefaultToTrue.get(ref.name)) |_| "true" else "false";

            try writer.print(
                \\    @"{s}": bool = {s}, //Reference flag
                \\
            , .{ ref.name, default_state });
        }
    }

    for (tree.pre.processednodes) |node| {
        if (node.enable_flags.len > 0) {
            for (node.enable_flags) |flag| {
                if (flag.len == 0) continue; //skip empty flags
                if (already_generated.contains(flag)) continue;
                try already_generated.put(flag, {});
                const default_state = if (DefaultToTrue.get(flag)) |_| "true" else "false";
                try writer.print(
                    \\    @"{s}": bool = {s}, //Node enable flag
                    \\
                , .{ flag, default_state });
            }
        }
    }

    try writer.writeAll(
        \\
        \\};
        \\
    );
}

pub fn generate_cubemx_configs(writer: *std.Io.Writer, tree: *const TreeContext, alloc: std.mem.Allocator) !void {
    var already_generated = std.StringArrayHashMap(void).init(alloc);
    defer already_generated.deinit();

    try writer.writeAll(
        \\
        \\//=======CubeMX Configurations========
        \\
        \\ pub const CubeMXExtraConfig = struct {
        \\
    );

    for (tree.pre.processedrefs) |ref| {
        if (ref.is_extra_config() and !already_generated.contains(ref.name)) {
            try already_generated.put(ref.name, {});

            switch (ref.type_helper) {
                .float => try writer.print("@\"{s}\": ?f32 = null,\n", .{ref.name}),
                .integer => try writer.print("@\"{s}\": ?u32 = null,\n", .{ref.name}),
                .numeric_flag => try writer.print("@\"{s}\": ?u1 = null,\n", .{ref.name}),
                .list, .list_flag, .tag_flag, .numeric_list_flag => try writer.print("@\"{0s}\": ?@\"{0s}List\" = null,\n", .{ref.name}),
                else => {}, //skip non-config extra refs
            }
        }
    }

    try writer.writeAll(
        \\
        \\};
        \\
        \\ pub const CubeMXConfig = struct {
        \\
    );

    for (tree.pre.processedrefs) |ref| {
        if (ref.is_base_config() and !already_generated.contains(ref.name)) {
            try already_generated.put(ref.name, {});

            switch (ref.type_helper) {
                .float => try writer.print("@\"{s}\": ?f32 = null,\n", .{ref.name}),
                .integer => try writer.print("@\"{s}\": ?u32 = null,\n", .{ref.name}),
                .numeric_flag => try writer.print("@\"{s}\": ?u1 = null,\n", .{ref.name}),
                .list, .list_flag, .tag_flag, .numeric_list_flag => try writer.print("@\"{0s}\": ?@\"{0s}List\" = null,\n", .{ref.name}),
                else => {}, //skip non-config base refs
            }
        }
    }

    try writer.writeAll(
        \\  extra_config: CubeMXExtraConfig = .{},
        \\  flags: Flags = .{},
        \\
        \\};
        \\
        \\  pub const CubeMXOutputConfig = struct {
        \\    flags: OutputFlags = .{},
        \\
        \\
    );
    var out_done = std.StringHashMap(void).init(alloc);
    defer out_done.deinit();
    for (tree.pre.ref_process_map.keys()) |gen| {
        const ref = tree.pre.ref_process_map.get(gen) orelse unreachable;
        if (out_done.contains(ref.name)) continue;
        try out_done.put(ref.name, {});
        if (ref.is_output_config()) {
            const default_char = if (ref.is_nullable) "?" else "";
            switch (ref.type_helper) {
                .float => try writer.print("@\"{s}\": {1s}f32,\n", .{ ref.name, default_char }),
                .integer => try writer.print("@\"{s}\": {1s}u32,\n", .{ ref.name, default_char }),
                .numeric_flag => try writer.print("@\"{s}\": {1s}u1,\n", .{ ref.name, default_char }),
                .list, .list_flag, .tag_flag, .numeric_list_flag => try writer.print("@\"{0s}\": {1s}@\"{0s}List\",\n", .{ ref.name, default_char }),
                else => unreachable,
            }
        }
    }

    try writer.writeAll(
        \\};
        \\
    );
}

pub fn generate_configs(writer: *std.Io.Writer, tree: *const TreeContext, alloc: std.mem.Allocator) !void {
    var already_generated = std.StringArrayHashMap(void).init(alloc);
    var list_name_holder: [256]u8 = undefined; //to hold the generated list type name for printing in config structs
    defer already_generated.deinit();

    try writer.writeAll(
        \\
        \\//=======Clocktree regular Configurations========
        \\
        \\ pub const ExtraConfig = struct {
        \\
    );

    var extra_config = std.StringArrayHashMap(bool).init(alloc);
    defer extra_config.deinit();
    conf: for (tree.pre.processedrefs) |ref| {
        var have_patch = false;
        if (ref.is_extra_config() and !already_generated.contains(ref.name)) {
            try already_generated.put(ref.name, {});
            const ref_type_str = blk: {
                if (tree.get_reference_enum_patch(ref.name)) |enum_p| {
                    have_patch = true;
                    break :blk std.fmt.bufPrint(&list_name_holder, "@\"{s}\"", .{enum_p.@"enum"}) catch continue :conf;
                } else {
                    break :blk switch (ref.type_helper) {
                        .float => "f32",
                        .integer => "u32",
                        .numeric_flag => "u1",
                        .list, .list_flag, .tag_flag, .numeric_list_flag => std.fmt.bufPrint(&list_name_holder, "@\"{s}List\"", .{ref.name}) catch continue :conf,
                        else => continue :conf, //skip non-config extra refs
                    };
                }
            };

            try writer.print(
                \\    @"{s}": ?{s} = null,
                \\
            , .{ ref.name, ref_type_str });
            try extra_config.put(ref.name, have_patch);
        }
    }

    try writer.writeAll(
        \\
        \\pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
        \\    return CubeMXExtraConfig{
        \\
        \\
    );

    for (extra_config.keys()) |config| {
        if (extra_config.get(config) orelse unreachable) {
            try writer.print(
                \\      .@"{0s}" = if(self.@"{0s}")|val| try @"{0s}List".from_enum(val) else null,
                \\
            , .{config});
        } else {
            try writer.print(
                \\      .@"{0s}" = self.@"{0s}",
                \\
            , .{config});
        }
    }

    try writer.writeAll(
        \\    };
        \\  }
        \\};
        \\
        \\ pub const Config = struct {
        \\
    );

    var base_config = std.StringArrayHashMap(bool).init(alloc);
    defer base_config.deinit();
    conf: for (tree.pre.processedrefs) |ref| {
        if (ref.is_base_config() and !already_generated.contains(ref.name)) {
            try already_generated.put(ref.name, {});
            var have_patch = false;
            const ref_type_str = blk: {
                if (tree.get_reference_enum_patch(ref.name)) |enum_p| {
                    have_patch = true;
                    break :blk std.fmt.bufPrint(&list_name_holder, "@\"{s}\"", .{enum_p.@"enum"}) catch continue :conf;
                } else {
                    break :blk switch (ref.type_helper) {
                        .float => "f32",
                        .integer => "u32",
                        .numeric_flag => "u1",
                        .list, .list_flag, .tag_flag, .numeric_list_flag => std.fmt.bufPrint(&list_name_holder, "@\"{s}List\"", .{ref.name}) catch continue :conf,
                        else => continue :conf, //skip non-config extra refs
                    };
                }
            };

            try writer.print(
                \\    @"{s}": ?{s} = null,
                \\
            , .{ ref.name, ref_type_str });

            try base_config.put(ref.name, have_patch);
        }
    }

    try writer.writeAll(
        \\  extra_config: ExtraConfig = .{},
        \\  flags: Flags = .{},
        \\
        \\pub fn to_cubemx_config(self: Config) !CubeMXConfig {
        \\    return CubeMXConfig{
        \\
    );

    for (base_config.keys()) |config| {
        if (base_config.get(config) orelse unreachable) {
            try writer.print(
                \\      .@"{0s}" = if(self.@"{0s}")|val| try @"{0s}List".from_enum(val) else null,
                \\
            , .{config});
        } else {
            try writer.print(
                \\      .@"{0s}" = self.@"{0s}",
                \\
            , .{config});
        }
    }

    try writer.writeAll(
        \\   .flags = self.flags,
        \\   .extra_config = try self.extra_config.to_cubemx_config(),
        \\   };
        \\  }
        \\};
        \\
        \\  pub const OutputConfig = struct {
        \\    flags: OutputFlags = .{},
        \\
        \\
    );
    var out_done = std.StringArrayHashMap(void).init(alloc);
    defer out_done.deinit();
    conf: for (tree.pre.ref_process_map.keys()) |gen| {
        const ref = tree.pre.ref_process_map.get(gen) orelse unreachable;
        if (out_done.contains(ref.name)) continue;
        try out_done.put(ref.name, {});
        if (ref.is_output_config()) {
            const default_char = if (ref.is_nullable) "?" else "";
            const type_name = blk: {
                if (tree.get_reference_enum_patch(ref.name)) |enum_p| {
                    break :blk std.fmt.bufPrint(&list_name_holder, "@\"{s}\"", .{enum_p.@"enum"}) catch continue;
                } else {
                    break :blk switch (ref.type_helper) {
                        .float => "f32",
                        .integer => "u32",
                        .numeric_flag => "u1",
                        .list, .list_flag, .tag_flag, .numeric_list_flag => std.fmt.bufPrint(&list_name_holder, "@\"{s}List\"", .{ref.name}) catch continue :conf,
                        else => continue :conf, //skip non-config extra refs
                    };
                }
            };
            try writer.print(
                \\ @"{s}": {s}{s},
                \\
            , .{ ref.name, default_char, type_name });
        }
    }

    try writer.writeAll(
        \\
        \\pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
        \\    return OutputConfig{
        \\      .flags = cubemx_config.flags,
        \\
    );

    for (out_done.keys()) |gen| {
        const ref = tree.pre.ref_process_map.get(gen) orelse continue;
        if (!ref.is_output_config()) continue;
        const nullable = ref.is_nullable;

        if (tree.base.ref_to_enum_patches.contains(ref.name)) {
            if (nullable) {
                try writer.print(
                    \\      .@"{0s}" = if(cubemx_config.@"{0s}")|val| try val.to_enum() else null,
                    \\
                , .{gen});
            } else {
                try writer.print(
                    \\      .@"{0s}" = try cubemx_config.@"{0s}".to_enum(),
                    \\
                , .{gen});
            }
        } else {
            try writer.print(
                \\      .@"{0s}" = cubemx_config.@"{0s}",
                \\
            , .{gen});
        }
    }

    try writer.writeAll(
        \\
        \\   };
        \\  }
        \\};
        \\
    );
}

pub fn generate_tree_output(writer: *std.Io.Writer, tree: *const TreeContext) !void {
    try writer.writeAll(
        \\
        \\///output of clock values after processing
        \\///Note: outputs marked as 0 may indicate a disabled clock or an actual output value of 0.
        \\pub const ClockOutput = struct {
        \\ 
    );

    for (tree.pre.processednodes) |node| {
        try writer.print(
            \\  @"{s}": u32 = 0,
            \\
        , .{node.name});
    }

    try writer.writeAll(
        \\};
        \\ 
    );

    try writer.writeAll(
        \\
        \\pub const CubemxTreeOutput = struct {
        \\  clock: ClockOutput = .{},
        \\  config: CubeMXOutputConfig,
        \\};
        \\
        \\
        \\pub const TreeOutput = struct {
        \\  clock: ClockOutput = .{},
        \\  config: OutputConfig,
        \\};
        \\
    );
}

pub fn generate_check_mcu(writer: *std.Io.Writer) !void {
    try writer.writeAll(
        \\
        \\pub fn check_MCU(comptime to_check: []const u8) bool {
        \\    return mcu_data.get(to_check) != null;
        \\}
    );
}

pub fn generate_get_clocktree(writer: *std.Io.Writer, tree: *const TreeContext, alloc: std.mem.Allocator) !void {
    try writer.writeAll(
        \\pub fn get_cubemx_clocks(config: CubeMXConfig, comptime patch_logs: bool) anyerror!CubemxTreeOutput {
        \\std.mem.doNotOptimizeAway(patch_logs);
        \\
        \\if (@inComptime()) @setEvalBranchQuota(1000000);
        \\var out = ClockOutput{};
        \\var ref_out: CubeMXOutputConfig = undefined;
        \\
        \\
        \\
    );

    try generate_semaphores(writer, tree.base.semaphores.keys());
    try generate_base_nodes(writer, tree);
    var postproned_refs = try generate_base_references(writer, tree, alloc);
    defer postproned_refs.deinit();
    try generate_nodes(writer, tree, &postproned_refs);
    try generate_post_refs(writer, tree, &postproned_refs, alloc);
    try generate_clock_enable(writer, tree);
    try generate_out_values(writer, tree);

    try writer.writeAll(
        \\
        \\return CubemxTreeOutput{
        \\  .clock = out,
        \\  .config = ref_out,
        \\ };
        \\}
    );
}

pub fn generate_semaphores(writer: *std.Io.Writer, semaphores: []const []const u8) !void {
    for (semaphores) |sem| {
        const default_state = if (DefaultToTrue.get(sem)) |_| "true" else "false";

        try writer.print(
            \\ var @"{s}": bool = {s}; //semaphore for processing, not an actual flag in the output;
            \\
        , .{ sem, default_state });
    }
}

pub fn generate_base_nodes(writer: *std.Io.Writer, tree: *const TreeContext) !void {
    try writer.print(
        \\
        \\//Clock node bases
        \\
        \\const dummy = ClockNode{{
        \\.name = "dummy_clock",
        \\.nodetype = .off,
        \\.parents = &.{{}},
        \\}};
        \\std.mem.doNotOptimizeAway(dummy);
        \\
    , .{});

    for (tree.pre.processednodes) |node| {
        if (!tree.is_node_valid(node.name)) continue; //skip invalid nodes, they will be filtered out later in the processing and won't be included in the final tree.
        try writer.print(
            \\
            \\var @"{0s}" = ClockNode{{
            \\  .name = "{0s}",
            \\  .nodetype = .off, //to be filled later with actual node types after processing
            \\  .parents = &.{{}}, //to be filled later with actual parent references
            \\}};
            \\
        , .{node.name});
    }
}

//write the base references and return a list of all postphoned references that need to be resolved after all nodes are generated.
pub fn generate_base_references(writer: *std.Io.Writer, tree: *const TreeContext, alloc: std.mem.Allocator) !std.StringArrayHashMap(void) {
    var postphoned_refs = std.StringArrayHashMap(void).init(alloc);
    var done_map = std.StringArrayHashMap(void).init(alloc);
    defer done_map.deinit();

    for (tree.pre.processedrefs) |ref| {
        if (!ref.is_util()) continue;
        if (done_map.contains(ref.name)) continue;
        if (ref.to_postprone()) {
            try postphoned_refs.put(ref.name, {});
            continue;
        }
        try done_map.put(ref.name, {});
        try pre_write_ref(writer, &ref, tree, &done_map, &postphoned_refs, alloc);
    }

    return postphoned_refs;
}

pub fn pre_write_ref(
    writer: *std.Io.Writer,
    ref: *const PreProcessedRef,
    tree: *const TreeContext,
    done: *std.StringArrayHashMap(void),
    postprone: *std.StringArrayHashMap(void),
    alloc: std.mem.Allocator,
) !void {
    var recursive_deps = std.StringArrayHashMap(void).init(alloc);
    defer recursive_deps.deinit();

    if (ref.dependency.contains(ref.name)) {
        try recursive_deps.put(ref.name, {});
    }

    for (ref.dependency.keys()) |dep| {
        const dep_ref = tree.pre.ref_process_map.get(dep) orelse continue;
        if (dep_ref.dependency.contains(ref.name)) try recursive_deps.put(dep_ref.name, {});
        if (postprone.contains(dep_ref.name)) {
            try postprone.put(ref.name, {});
            return;
        }
        if (!done.contains(dep_ref.name)) {
            if (!dep_ref.is_util()) continue;
            if (dep_ref.to_postprone()) {
                try postprone.put(ref.name, {});
                return;
            }

            try done.put(dep_ref.name, {});
            try pre_write_ref(writer, dep_ref, tree, done, postprone, alloc);
            //re-check for postprone
            if (postprone.contains(dep_ref.name)) {
                try postprone.put(ref.name, {});
                return;
            }
        }
    }

    try write_ref(writer, ref, tree, &recursive_deps, alloc);
}

fn write_ref(
    writer: *std.Io.Writer,
    ref: *const PreProcessedRef,
    tree: *const TreeContext,
    recursive_deps: *std.StringArrayHashMap(void),
    alloc: std.mem.Allocator,
) !void {
    var aux_buffer: [512]u8 = undefined;
    const nullable_char = if (ref.is_nullable) "?" else "";
    const type_str: []const u8 = switch (ref.type_helper) {
        .float => "f32",
        .integer => "u32",
        .numeric_flag => "u1",
        .list, .list_flag, .tag_flag, .numeric_list_flag => try std.fmt.bufPrint(&aux_buffer, "@\"{s}List\"", .{ref.name}),
        else => unreachable, //only util references should be written here, and they should all have a type helper that maps to a valid Zig type.
    };

    var default_variant: ?PreProcessRefVariant = null;
    var first = true;

    try writer.print(
        \\
        \\const @"{s}Value": {s}{s} = blk: {{
        \\
        \\
    , .{ ref.name, nullable_char, type_str });

    for (ref.variants) |variant| {
        if (variant.expr == null) {
            default_variant = variant;
            continue;
        }
        //opening the if or else if block for the variant
        if (first) {
            first = false;
            try writer.writeAll("if( ");
        } else {
            try writer.writeAll("else if( ");
        }
        try parser_expr(writer, variant.expr.?, tree, recursive_deps);

        //close the condition and open the block
        try writer.writeAll(") {\n");

        try write_acutal_ref(writer, ref, &variant, tree, alloc);
        try writer.writeAll("\n}\n");
    }

    if (default_variant) |def_var| {
        try write_acutal_ref(writer, ref, &def_var, tree, alloc);
    } else {
        if (ref.is_nullable) {
            try writer.writeAll("break :blk null;");
        } else {
            logger.debug("fail to find defult expr for {s}, repeating first variant", .{ref.name});
            try write_acutal_ref(writer, ref, &ref.variants[0], tree, alloc);
        }
    }

    try writer.writeAll(
        \\
        \\};
        \\
    );
}

pub fn write_acutal_ref(
    writer: *std.Io.Writer,
    ref: *const PreProcessedRef,
    variant: *const PreProcessRefVariant,
    tree: *const TreeContext,
    alloc: std.mem.Allocator,
) !void {
    _ = alloc;
    switch (variant.ref) {
        .no_value => try write_no_value(writer, ref, variant),
        .fixed_float => try write_fixed_float(writer, ref, variant, tree),
        .fixed_integer => try write_fixed_int(writer, ref, variant, tree),
        .single_item => try write_fixed_list(writer, ref, variant, tree),
        .fixed_expr => try write_fixed_expr(writer, ref, variant, tree),
        .float_range => try write_range_float(writer, ref, variant, tree),
        .integer_range => try write_range_int(writer, ref, variant, tree),
        .list => try write_list(writer, ref, variant, tree),
        .string => {},
        else => {
            logger.debug("unhandled ref type for reference {s} - {}", .{ ref.name, variant.ref });
        },
    }
}

pub fn write_no_value(writer: *std.io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant) !void {
    const config_prefix = ref.get_config_prefix();
    const expr = variant.raw_expr orelse "Else";
    const dialog = variant.diagnostic orelse "No additional information";
    if (config_prefix) |config| {
        try writer.print(
            \\if({0s}@"{1s}")|_|{{
            \\return comptime_fail_or_error(error.InvalidConfig,
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
        , .{ config, ref.name, expr, dialog });
    }
    try writer.writeAll("break :blk null;");
}

pub fn write_fixed_float(writer: *std.Io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant, tree: *const TreeContext) !void {
    const config_prefix = ref.get_config_prefix();
    const value = variant.ref.fixed_float;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";

    if (config_prefix) |prefix| {
        try writer.print(
            \\if({0s}@"{1s}")|val| {{
            \\if(val != {2e}){{
            \\return comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Expected Fixed Value: {{e}} found: {{e}}
            \\  \\note: some values are fixed depending on the clock configuration.
            \\  \\
            \\  \\
            \\ ,.{{ "{1s}", "{3s}", "{4s}", {2e}, val, }});
            \\}}
            \\}}
        , .{ prefix, ref.name, value, expr, diagnostic });
    }

    if (ref.is_node_ref) |_| {
        const node = tree.base.node_ref.get(ref.name) orelse unreachable;
        if (!ref.check_for_range() and !ref.is_static) {
            try writer.print(
                \\@"{0s}".limit = .{{
                \\  .min = {1e},
                \\  .max = {1e},
                \\  .main_expr = "{2s}",
                \\  .main_dialog = "{3s}",
                \\}};
            , .{ node, value, expr, diagnostic });
        }
    }

    try writer.print(
        \\break :blk {e};
    , .{value});
}

pub fn write_fixed_int(writer: *std.Io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant, tree: *const TreeContext) !void {
    const config_prefix = ref.get_config_prefix();
    const value = variant.ref.fixed_integer;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";

    if (config_prefix) |prefix| {
        try writer.print(
            \\if({0s}@"{1s}")|val| {{
            \\if(val != {2d}){{
            \\return comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Expected Fixed Value: {{d}} found: {{d}}
            \\  \\note: some values are fixed depending on the clock configuration.
            \\  \\
            \\  \\
            \\ ,.{{ "{1s}", "{3s}", "{4s}", {2d}, val, }});
            \\}}
            \\}}
        , .{ prefix, ref.name, value, expr, diagnostic });
    }

    if (ref.is_node_ref) |_| {
        const node = tree.base.node_ref.get(ref.name) orelse unreachable;
        if (!ref.check_for_range()) {
            try writer.print(
                \\@"{0s}".limit = .{{
                \\  .min = {1d},
                \\  .max = {1d},
                \\  .main_expr = "{2s}",
                \\  .main_dialog = "{3s}",
                \\}};
            , .{ node, value, expr, diagnostic });
        }
    }

    if (ref.type_helper == .float) {
        try writer.print(
            \\break :blk @floatFromInt({d});
        , .{value});
    } else {
        try writer.print(
            \\break :blk {d};
        , .{value});
    }
}

pub fn write_fixed_list(writer: *std.Io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant, tree: *const TreeContext) !void {
    const config_prefix = ref.get_config_prefix();
    const value = variant.ref.single_item;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";

    if (config_prefix) |prefix| {
        if (tree.base.ref_to_enum_patches.get(ref.name)) |enum_patch| {
            const patch_name: []const u8 = name: {
                for (enum_patch.items) |item| {
                    if (std.mem.eql(u8, value.name, item.ref_item_name)) break :name item.enum_item_name;
                }
                break :name value.name;
            };

            try writer.print(
                \\if({0s}@"{1s}")|val| {{
                \\if(val != .@"{2s}"){{
                \\const patch_str = if(patch_logs) "{5s}" else "{2s}";
                \\const val_enum = if(patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                \\return comptime_fail_or_error(error.InvalidConfig,
                \\  \\
                \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                \\  \\Expected Fixed Value: {{s}} found: .{{s}}
                \\  \\note: some values are fixed depending on the clock configuration.
                \\  \\
                \\  \\
                \\ ,.{{ "{1s}", "{3s}", "{4s}", patch_str, val_enum, }});
                \\}}
                \\}}
            , .{ prefix, ref.name, value.name, expr, diagnostic, patch_name });
        } else {
            try writer.print(
                \\if({0s}@"{1s}")|val| {{
                \\if(val != .@"{2s}"){{
                \\return comptime_fail_or_error(error.InvalidConfig,
                \\  \\
                \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                \\  \\Expected Fixed Value: {{s}} found: {{any}}
                \\  \\note: some values are fixed depending on the clock configuration.
                \\  \\
                \\  \\
                \\ ,.{{ "{1s}", "{3s}", "{4s}", "{2s}", val, }});
                \\}}
                \\}}
            , .{ prefix, ref.name, value.name, expr, diagnostic });
        }
    }

    if (value.semaphore) |semaphore| {
        try writer.print(
            \\@"{s}" = true; 
        , .{semaphore});
    }
    try writer.print(
        \\break :blk .@"{s}";
    , .{value.name});
}

pub fn write_fixed_expr(writer: *std.Io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant, tree: *const TreeContext) !void {
    const config_prefix = ref.get_config_prefix();
    const expr_to_eval = variant.default_expr.?;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";

    try writer.writeAll(
        \\
        \\const value: f32 = ( 
    );

    try parser_expr(
        writer,
        expr_to_eval,
        tree,
        null,
    );

    try writer.writeAll(
        \\);
        \\
    );

    if (config_prefix) |prefix| {
        try writer.print(
            \\if({0s}@"{1s}")|val| {{
            \\if(val != value){{
            \\return comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
            \\  \\Expected Fixed Value: {{e}} found: {{e}}
            \\  \\note: some values are fixed depending on the clock configuration.
            \\  \\
            \\  \\
            \\ ,.{{ "{1s}", "{2s}", "{3s}", value, val, }});
            \\}}
            \\}}
        , .{ prefix, ref.name, expr, diagnostic });
    }

    if (ref.is_node_ref) |_| {
        const node = tree.base.node_ref.get(ref.name) orelse unreachable;
        if (!ref.check_for_range()) {
            try writer.print(
                \\@"{0s}".limit = .{{
                \\  .min = value,
                \\  .max = value,
                \\  .min_expr = "{1s}",
                \\  .max_expr = "{1s}",
                \\  .main_expr = "{2s}"
                \\  .main_dialog = "{3s}",
                \\}};
            , .{ node, variant.ref.fixed_expr.value, expr, diagnostic });
        }
    }

    if (variant.ref.fixed_expr.integer) {
        try writer.writeAll(
            \\ break :blk round(value);
        );
    } else {
        try writer.writeAll(
            \\ break :blk value;
        );
    }
}

pub fn write_range_float(writer: *std.Io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant, tree: *const TreeContext) !void {
    const config_prefix = ref.get_config_prefix();
    const value = variant.ref.float_range;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";

    const min = value.min;
    const max = value.max;
    const default = value.default_value;

    if (config_prefix) |config| {
        try writer.print(
            \\const user_val = {s}@"{s}";
            \\
        , .{ config, ref.name });

        if (ref.check_for_range()) {
            if (min != null or max != null) {
                try writer.writeAll(
                    \\if(user_val)|val| {
                    \\
                );

                if (min) |min_v| {
                    try writer.print(
                        \\  if(val < {0e}){{
                        \\  return comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Underflow Value - min: {{e}} found: {{e}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0e}, val, }});
                        \\  }}
                    , .{ min_v, ref.name, expr, diagnostic });
                }

                if (max) |max_v| {
                    try writer.print(
                        \\  if(val > {0e}){{
                        \\  return comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Overflow Value - max: {{e}} found: {{e}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0e}, val, }});
                        \\  }}
                    , .{ @min(max_v, std.math.floatMax(f32)), ref.name, expr, diagnostic });
                }
                try writer.writeAll(
                    \\}
                    \\
                );
            }
        } else {
            if (((max != null) or (min != null))) {
                if (tree.base.node_ref.get(ref.name)) |clk| {
                    try writer.print(
                        \\@"{s}".limit = .{{ 
                    , .{clk});
                    if (min) |min_v| try writer.print(".min = {e},", .{min_v}) else try writer.print(".min = null,\n", .{});
                    if (max) |max_v| try writer.print(".max = {e},", .{max_v}) else try writer.print(".max = null,\n", .{});
                    try writer.print(
                        \\
                        \\  .main_expr = "{s}",
                        \\  .main_dialog = "{s}",
                        \\}};
                        \\
                    , .{ expr, diagnostic });
                }
            }
        }

        try writer.writeAll(
            \\break :blk user_val
        );
        if (default) |val| {
            try writer.print(
                \\ orelse {e};
                \\
            , .{val});
        } else {
            try writer.writeAll(";\n");
        }
    } else {
        if (((max != null) or (min != null))) {
            if (tree.base.node_ref.get(ref.name)) |clk| {
                try writer.print(
                    \\@"{s}".limit = .{{ 
                , .{clk});
                if (min) |min_v| try writer.print(".min = {e},", .{min_v}) else try writer.print(".min = null,\n", .{});
                if (max) |max_v| try writer.print(".max = {e},", .{max_v}) else try writer.print(".max = null,\n", .{});
                try writer.print(
                    \\
                    \\  .main_expr = "{s}",
                    \\  .main_dialog = "{s}",
                    \\}};
                    \\
                , .{ expr, diagnostic });
            }
        }

        if (default) |val| {
            try writer.print("break :blk {e};", .{val});
        } else {
            try writer.writeAll("break :blk null;");
        }
    }
}

pub fn write_range_int(writer: *std.Io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant, tree: *const TreeContext) !void {
    const config_prefix = ref.get_config_prefix();
    const value = variant.ref.integer_range;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";

    const min = value.min;
    const max = value.max;
    const default = value.default_value;

    if (config_prefix) |config| {
        try writer.print(
            \\const user_val = {s}@"{s}";
            \\
        , .{ config, ref.name });

        if (ref.check_for_range()) {
            if (min != null or max != null) {
                try writer.writeAll(
                    \\if(user_val)|val| {
                    \\
                );

                if (min) |min_v| {
                    try writer.print(
                        \\  if(val < {0d}){{
                        \\  return comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Underflow Value - min: {{d}} found: {{d}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0d}, val, }});
                        \\  }}
                    , .{ min_v, ref.name, expr, diagnostic });
                }

                if (max) |max_v| {
                    try writer.print(
                        \\  if(val > {0d}){{
                        \\  return comptime_fail_or_error(error.InvalidConfig,
                        \\  \\
                        \\  \\Error on {{s}} | expr: {{s}} diagnostic: {{s}} 
                        \\  \\Overflow Value - max: {{d}} found: {{d}}
                        \\  \\note: ranges values may change depending on the configuration
                        \\  \\
                        \\ ,.{{ "{1s}", "{2s}", "{3s}", {0d}, val, }});
                        \\  }}
                    , .{ @min(max_v, std.math.maxInt(u32)), ref.name, expr, diagnostic });
                }
                try writer.writeAll(
                    \\}
                    \\
                );
            }
        } else {
            if (((max != null) or (min != null))) {
                if (tree.base.node_ref.get(ref.name)) |clk| {
                    try writer.print(
                        \\@"{s}".limit = .{{ 
                    , .{clk});
                    if (min) |min_v| try writer.print(".min = {d},", .{min_v}) else try writer.print(".min = null,\n", .{});
                    if (max) |max_v| try writer.print(".max = {d},", .{max_v}) else try writer.print(".max = null,\n", .{});
                    try writer.print(
                        \\
                        \\  .main_expr = "{s}",
                        \\  .main_dialog = "{s}",
                        \\}};
                        \\
                    , .{ expr, diagnostic });
                }
            }
        }

        try writer.writeAll(
            \\break :blk user_val
        );
        if (default) |val| {
            try writer.print(
                \\ orelse {d};
                \\
            , .{val});
        } else {
            try writer.writeAll(";\n");
        }
    } else {
        if (((max != null) or (min != null))) {
            if (tree.base.node_ref.get(ref.name)) |clk| {
                try writer.print(
                    \\@"{s}".limit = .{{ 
                , .{clk});
                if (min) |min_v| try writer.print(".min = {d},", .{min_v}) else try writer.print(".min = null,\n", .{});
                if (max) |max_v| try writer.print(".max = {d},", .{max_v}) else try writer.print(".max = null,\n", .{});
                try writer.print(
                    \\
                    \\  .main_expr = "{s}",
                    \\  .main_dialog = "{s}",
                    \\}};
                    \\
                , .{ expr, diagnostic });
            }
        }

        if (default) |val| {
            try writer.print("break :blk {d};", .{val});
        } else {
            try writer.writeAll("break :blk null;");
        }
    }
}

pub fn write_list(writer: *std.Io.Writer, ref: *const PreProcessedRef, variant: *const PreProcessRefVariant, tree: *const TreeContext) !void {
    const config_prefix = ref.get_config_prefix().?; //theres no list type that is not a config
    const value = variant.ref.list;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";

    const default = value.default_name;
    const all_itens = ref.get_list_items() catch unreachable;
    const have_all_itens = value.itens.len == all_itens.keys().len;
    const tree_patchs = tree.base.ref_to_enum_patches.get(ref.name);
    const first_item = value.itens[0];

    try writer.print(
        \\const user_val = {0s}@"{1s}";
        \\
        \\if(user_val)|val|{{
        \\  switch(val){{
        \\
    , .{ config_prefix, ref.name });
    for (value.itens) |item| {
        if (item.semaphore) |sema| {
            try writer.print(
                \\.@"{s}" => @"{s}" = true,
                \\
            , .{ item.name, sema });
        } else {
            try writer.print(
                \\.@"{s}" => {{}},
                \\
            , .{item.name});
        }
    }
    if (!have_all_itens) {
        try writer.writeAll(
            \\else => {
            \\return comptime_fail_or_error(error.InvalidConfig,
            \\  \\
            \\  \\Error on {s} | expr: {s} diagnostic: {s} 
            \\  \\Option not available in this condition: .{s}.
            \\  \\note: available options:
            \\
        );

        for (0..value.itens.len) |_| {
            try writer.writeAll("    \\\\ - {s}\n");
        }
        try writer.print(
            \\
            \\,.{{ "{s}", "{s}", "{s}", 
        , .{ ref.name, expr, diagnostic });

        if (tree_patchs) |patchs| {
            try writer.print(
                \\ if(patch_logs) @tagName(try val.to_enum()) else @tagName(val), 
            , .{});
            for (value.itens) |item| {
                if (field_have_patch(item.name, patchs)) |patch_name| {
                    try writer.print(
                        \\ if(patch_logs) "{s}" else "{s}", 
                    , .{ patch_name, item.name });
                } else {
                    try writer.print(
                        \\ "{s}", 
                    , .{item.name});
                }
            }
        } else {
            try writer.print(
                \\ @tagName(val), 
            , .{});

            for (value.itens) |item| {
                try writer.print(
                    \\ "{s}", 
                , .{item.name});
            }
        }

        try writer.writeAll(
            \\  });
            \\}
        );
    }
    try writer.writeAll(
        \\}
        \\}
        \\
    );

    try writer.writeAll(
        \\break :blk user_val
    );
    if (default) |def_pre| {
        const def = real_def: {
            if (tree.base.multiplexor_fix.get(ref.name)) |fix_dep| {
                for (fix_dep.removed_items) |replaced| {
                    if (std.mem.eql(u8, replaced, def_pre)) break :real_def fix_dep.add_item;
                }
            } else if (find_ref_pointer(ref, def_pre, tree)) |pointer| {
                //check if def is a pointer
                switch (pointer) {
                    .value => |val| break :real_def val,
                    .reference => |ref_ptr| {
                        if (tree.pre.ref_process_map.get(ref_ptr).?.is_nullable) {
                            try writer.print(
                                \\ orelse {{
                                \\  if(@"{s}Value")|val| {{
                                \\      break :blk @as(@"{s}List", @enumFromInt(@intFromEnum(val)))
                                \\  }} else {{
                                \\      
                                \\  
                            , .{ ref_ptr, ref.name });

                            if (first_item.semaphore) |sema| {
                                try writer.print(
                                    \\ @"{s}" = true;
                                    \\  
                                , .{sema});
                            }
                            try writer.print(
                                \\ break :blk .@"{s}";
                                \\    }}
                                \\}};  
                                \\  
                            , .{first_item.name});
                        } else {
                            try writer.print(
                                \\ orelse @as(@"{s}List", @enumFromInt(@intFromEnum(@"{s}Value")));
                                \\  
                            , .{ ref.name, ref_ptr });
                        }

                        return;
                    },
                }
            }
            break :real_def def_pre;
        };
        if (all_itens.contains(def)) {
            if (field_have_semaphore(def, variant)) |semaphore| {
                try writer.print(
                    \\ orelse {{
                    \\  @"{s}" = true;
                    \\  break :blk .@"{s}";
                    \\}};
                , .{ semaphore, def });
            } else {
                try writer.print(
                    \\ orelse .@"{s}";
                , .{def});
            }
        } else {
            logger.debug("item {s} is not on the list for {s}! dafault to: {s}", .{ def, ref.name, first_item.name });
            if (first_item.semaphore) |sema| {
                try writer.print(
                    \\ orelse {{
                    \\  @"{s}" = true;
                    \\  break :blk .@"{s}";
                    \\}};
                , .{ sema, first_item.name });
            } else {
                try writer.print(
                    \\ orelse .@"{s}";
                , .{first_item.name});
            }
        }
        return;
    }
    logger.debug("No Default for list {s}", .{ref.name});
}

pub fn field_have_patch(field: []const u8, patch: ?RefTpEnumPatch) ?[]const u8 {
    if (patch) |p| {
        for (p.items) |item| {
            if (std.mem.eql(u8, field, item.ref_item_name)) return item.enum_item_name;
        }
    }
    return null;
}

pub fn field_have_semaphore(field: []const u8, variant: *const PreProcessRefVariant) ?[]const u8 {
    for (variant.ref.list.itens) |item| {
        if (std.mem.eql(u8, field, item.name)) return item.semaphore;
    }
    return null;
}

pub fn find_ref_pointer(ref: *const PreProcessedRef, pre_def_ptr: []const u8, tree: *const TreeContext) ?DefaultBy {
    const def_ptr = blk: {
        if (pre_def_ptr.len > 0) {
            if (pre_def_ptr[0] == '+') break :blk pre_def_ptr[1..];
        }
        return null;
    };
    logger.debug("GOT PTR: {s}", .{def_ptr});
    const ref_ptr = tree.pre.ref_process_map.get(def_ptr) orelse return null;
    if (ref_ptr.is_list_based_ref()) {
        return DefaultBy{ .reference = ref_ptr.name };
    }

    for (ref_ptr.variants) |vars| {
        switch (vars.ref) {
            .string => |val| {
                return find_ref_pointer(ref, val, tree);
            },
            else => {},
        }
    }
    return null;
}

pub fn generate_nodes(writer: *std.Io.Writer, tree: *const TreeContext, post: *std.StringArrayHashMap(void)) !void {
    try writer.writeAll(
        \\// ========CLOCK NODES=========
        \\
    );
    for (tree.pre.processednodes) |*node| {
        const ref = tree.pre.ref_process_map.get(node.references[0]) orelse continue;
        if (post.contains(ref.name) and node.node_type != .output) continue;
        try write_nodes(writer, tree, node);
    }
}

pub fn write_nodes(writer: *std.Io.Writer, tree: *const TreeContext, node: *const PreProcessedNode) !void {
    var default_expr: ?*const PreProcessedNodeVariant = null;
    var first = true;
    try writer.print(
        \\
        \\// ======= NODE {s} ======
        \\
    , .{node.name});

    for (node.enable_flags) |flag| {
        if (tree.pre.ref_process_map.get(flag)) |ref| {
            if (ref.type_helper == .tag_flag) {
                try writer.print(
                    \\
                    \\ @"{s}".is_auto = true;
                    \\
                , .{node.name});
                break;
            }
        }
    }

    for (node.variants) |*node_var| {
        if (node_var.expr == null) {
            default_expr = node_var;
            continue;
        }

        if (first) {
            try writer.writeAll(
                \\if( 
            );
            first = false;
        } else {
            try writer.writeAll(
                \\else if( 
            );
        }

        try parser_expr(writer, node_var.expr.?, tree, null);

        try writer.writeAll(
            \\){
            \\
        );

        try write_node_value(writer, tree, node, node_var);

        try writer.writeAll(
            \\}
        );
    }

    if (default_expr) |val| {
        try write_node_value(writer, tree, node, val);
    }
}

pub fn write_node_value(writer: *std.Io.Writer, tree: *const TreeContext, node: *const PreProcessedNode, node_var: *const PreProcessedNodeVariant) !void {
    const reference = tree.pre.ref_process_map.get(node.references[0]) orelse unreachable;
    switch (node.node_type) {
        .source => try write_source(writer, node.name, reference),
        .divisor => try write_divisor(writer, node.name, false, node_var, reference),
        .multiplicator => try write_divisor(writer, node.name, true, node_var, reference),
        .multiplicatorFrac => try write_mulfrac(writer, node.name, node_var, reference),
        .multiplexor => try write_multiplexor(writer, node.name, node_var, reference),
        .output => try write_output(writer, node.name, node_var),
    }
}

//find first non recursive parent clock input
pub fn find_valid_parent(node_var: *const PreProcessedNodeVariant, node: []const u8) ?[]const u8 {
    for (node_var.inputs) |parents| {
        if (!std.mem.eql(u8, parents.source, node)) return parents.source;
    }
    return null;
}

pub fn write_source(writer: *std.Io.Writer, name: []const u8, reference: *const PreProcessedRef) !void {
    const have_prefix = if (reference.is_list_based_ref()) ".get()" else "";
    const have_try = if (reference.is_list_based_ref()) "try" else "";
    if (reference.type_helper == .integer) {
        try writer.print(
            \\@"{0s}".nodetype = .source;
            \\@"{0s}".value = @floatFromInt(@"{1s}Value"{2s});
            \\
        , .{ name, reference.name, have_prefix });
    } else {
        try writer.print(
            \\@"{0s}".nodetype = .source;
            \\@"{0s}".value = {3s} @"{1s}Value"{2s};
            \\
        , .{ name, reference.name, have_prefix, have_try });
    }
}

pub fn write_divisor(
    writer: *std.Io.Writer,
    name: []const u8,
    mul: bool,
    variant: *const PreProcessedNodeVariant,
    reference: *const PreProcessedRef,
) !void {
    const have_prefix = if (reference.is_list_based_ref()) ".get()" else "";
    const have_try = if (reference.is_list_based_ref()) "try" else "";
    const clock_t = if (mul) "mul" else "div";
    const valid_parent = find_valid_parent(variant, name) orelse "dummy";
    if (reference.type_helper == .integer) {
        try writer.print(
            \\@"{0s}".nodetype = .{3s};
            \\@"{0s}".value = @floatFromInt(@"{1s}Value"{2s});
            \\@"{0s}".parents = &.{{&@"{4s}"}};
            \\
        , .{ name, reference.name, have_prefix, clock_t, valid_parent });
    } else {
        try writer.print(
            \\@"{0s}".nodetype = .{3s};
            \\@"{0s}".value = {5s} @"{1s}Value"{2s};
            \\@"{0s}".parents = &.{{&@"{4s}"}};
            \\
        , .{ name, reference.name, have_prefix, clock_t, valid_parent, have_try });
    }
}

pub fn write_mulfrac(
    writer: *std.Io.Writer,
    name: []const u8,
    variant: *const PreProcessedNodeVariant,
    reference: *const PreProcessedRef,
) !void {
    const have_prefix = if (reference.is_list_based_ref()) ".get()" else "";
    const have_try = if (reference.is_list_based_ref()) "try" else "";
    if (reference.type_helper == .integer) {
        try writer.print(
            \\@"{0s}".nodetype = .mulfrac;
            \\@"{0s}".value = @floatFromInt(@"{1s}Value"{2s});
            \\@"{0s}".parents = &.{{&@"{3s}", &@"{4s}"}};
            \\
        , .{
            name,
            reference.name,
            have_prefix,
            variant.inputs[0].source,
            variant.inputs[1].source,
        });
    } else {
        try writer.print(
            \\@"{0s}".nodetype = .mulfrac;
            \\@"{0s}".value = {5s} @"{1s}Value"{2s};
            \\@"{0s}".parents = &.{{&@"{3s}", &@"{4s}"}};
            \\
        , .{
            name,
            reference.name,
            have_prefix,
            variant.inputs[0].source,
            variant.inputs[1].source,
            have_try,
        });
    }
}

pub fn write_multiplexor(
    writer: *std.Io.Writer,
    name: []const u8,
    variant: *const PreProcessedNodeVariant,
    reference: *const PreProcessedRef,
) !void {
    try writer.print(
        \\@"{0s}".nodetype = .multi;
        \\@"{0s}".parents = switch(@"{1s}Value"){{
    , .{ name, reference.name });

    const expr = variant.raw_expr orelse "Default";
    const dialog = variant.diagnostic orelse "No Extra Info";
    const total_item = try reference.get_list_items();
    var total_write_items: usize = 0;
    for (variant.inputs) |in| {
        if (std.mem.eql(u8, in.source, name)) continue;
        if (in.source_ref == null) {
            logger.err("Multiplexor {s} has null ref for {s}", .{ name, in.source });
            return error.InvalidMulti;
        }
        if (!total_item.contains(in.source_ref.?)) continue;
        total_write_items += 1;
        try writer.print(
            \\ .@"{s}" => &.{{&@"{s}"}},
            \\
        , .{ in.source_ref.?, in.source });
    }

    //reference shuld
    if (total_write_items < total_item.keys().len) {
        try writer.print(
            \\else => return comptime_fail_or_error(
            \\  error.InvalidClockSelection,
            \\  \\Error on node {{s}}: Invalid Clock Selection
            \\  \\current expr: {{s}}
            \\  \\diagnostic: {{s}}
            \\  \\reference {{s}} - .{{s}} cannot be selected as a clock source in the current configurations.
            \\  \\ Available source options:
            \\
        , .{});

        for (variant.inputs) |in| {
            if (std.mem.eql(u8, in.source, name)) continue;
            if (in.source_ref == null) continue;
            if (!total_item.contains(in.source_ref.?)) continue;
            try writer.writeAll(
                \\  \\  - {s}
                \\  \\
                \\
            );
        }

        try writer.print(
            \\  , .{{
            \\  "{0s}", 
            \\  "{1s}", 
            \\  "{2s}", 
            \\  "{3s}", 
            \\  if(patch_logs) @tagName(try @"{3s}Value".to_enum()) else @tagName(@"{3s}Value"),
            \\
        , .{ name, expr, dialog, reference.name });

        for (variant.inputs) |in| {
            if (std.mem.eql(u8, in.source, name)) continue;
            if (in.source_ref == null) continue;
            if (!total_item.contains(in.source_ref.?)) continue;

            try writer.print(
                \\  if(patch_logs) @tagName(try @"{0s}List".to_enum(.@"{1s}")) else @tagName(@"{0s}List".@"{1s}"),
                \\
            , .{ reference.name, in.source_ref.? });
        }

        try writer.print(
            \\}}
            \\),
            \\
        , .{});
    }

    try writer.writeAll("};\n");
}

pub fn write_output(writer: *std.Io.Writer, name: []const u8, variant: *const PreProcessedNodeVariant) !void {
    const valid_parent = find_valid_parent(variant, name) orelse "dummy";

    try writer.print(
        \\@"{0s}".nodetype = .output;
        \\@"{0s}".parents = &.{{&@"{1s}"}};
        \\
    , .{ name, valid_parent });
}

pub fn generate_post_refs(writer: *std.Io.Writer, tree: *const TreeContext, post_refs: *std.StringArrayHashMap(void), alloc: std.mem.Allocator) !void {
    var done_map = std.StringArrayHashMap(void).init(alloc);
    defer done_map.deinit();

    try writer.writeAll(
        \\
        \\ //======== POST REFS ========
        \\
    );

    for (post_refs.keys()) |post| {
        const ref = tree.pre.ref_process_map.get(post) orelse unreachable;
        if (done_map.contains(ref.name)) continue;
        try done_map.put(ref.name, {});
        try post_write_ref(writer, ref, tree, &done_map, post_refs, alloc);
    }
}

pub fn post_write_ref(
    writer: *std.Io.Writer,
    ref: *const PreProcessedRef,
    tree: *const TreeContext,
    done: *std.StringArrayHashMap(void),
    postprone: *std.StringArrayHashMap(void),
    alloc: std.mem.Allocator,
) !void {
    var recursive_deps = std.StringArrayHashMap(void).init(alloc);
    defer recursive_deps.deinit();

    if (ref.dependency.contains(ref.name)) {
        try recursive_deps.put(ref.name, {});
    }

    for (ref.dependency.keys()) |dep| {
        const dep_ref = tree.pre.ref_process_map.get(dep) orelse continue;
        if (!postprone.contains(dep_ref.name)) continue; //skip non prosphone refs
        if (dep_ref.dependency.contains(ref.name)) try recursive_deps.put(dep_ref.name, {});
        if (!done.contains(dep_ref.name)) {
            try done.put(dep_ref.name, {});
            try post_write_ref(writer, dep_ref, tree, done, postprone, alloc);
        }
    }

    const name_buffer = try alloc.alloc(u8, ref.name.len);
    defer alloc.free(name_buffer);
    const lower_name = std.ascii.lowerString(name_buffer, ref.name);
    if (std.mem.containsAtLeast(u8, lower_name, 1, "freq_value")) {
        try post_ref(writer, ref, tree, &recursive_deps, alloc);
    } else {
        try write_ref(writer, ref, tree, &recursive_deps, alloc);
    }

    //try add post nodes
    //post node are all non-output node that have a post ref
    if (ref.is_node_ref) |node_ref| {
        if (node_ref != .output) {
            const name = tree.base.node_ref.get(ref.name) orelse tree.base.node_ref.get(ref.name[0..(ref.name.len - 7)]) orelse unreachable;
            const node = tree.pre.node_process_map.get(name) orelse unreachable;
            try write_nodes(writer, tree, node);
        }
    }
}

fn post_ref(
    writer: *std.Io.Writer,
    ref: *const PreProcessedRef,
    tree: *const TreeContext,
    recursive_deps: *std.StringArrayHashMap(void),
    alloc: std.mem.Allocator,
) !void {
    var default_def: ?*const PreProcessRefVariant = null;
    var first = true;
    _ = alloc;

    try writer.print(
        \\
        \\ //======= {s} ========
        \\
    , .{ref.name});

    //get clock value
    if (tree.base.node_ref.get(ref.name)) |node| {
        try writer.print(
            \\const @"{s}Value" = @"{s}".get_as_ref();
            \\
        , .{ ref.name, node });
    } else {
        //try find default expr
        for (ref.variants) |v| {
            switch (v.ref) {
                .dynamic_range => |dyn| {
                    const pre_round = if (dyn.integer) "round( " else "";
                    const pos_round = if (dyn.integer) ").?" else "";
                    if (v.default_expr) |expr| {
                        try writer.print(
                            \\const @"{s}Value" = {s}
                        , .{ ref.name, pre_round });
                        try parser_expr(writer, expr, tree, null);
                        try writer.print(
                            \\{s};
                            \\
                        , .{pos_round});
                        break;
                    }
                },
                else => {},
            }
        } else {
            logger.debug("FAIL TO GET {s} value.", .{ref.name});
            try writer.print(
                \\const @"{s}Value" = 0;
                \\
            , .{ref.name});
        }
    }
    try writer.print(
        \\ignore_value(@"{s}Value");
        \\
    , .{ref.name});

    //try write limits
    if (tree.base.node_ref.get(ref.name)) |node| {
        for (ref.variants) |*vars| {
            //check if theres a limit to be write
            switch (vars.ref) {
                .float_range, .integer_range => {},
                .dynamic_range => |din_r| if (din_r.max == null and din_r.min == null) continue,
                else => continue,
            }

            //only one else range can be write
            if (vars.expr == null) {
                default_def = vars;
                continue;
            }

            if (first) {
                try writer.writeAll("if(");
                first = false;
            } else {
                try writer.writeAll("else if(");
            }

            try parser_expr(writer, vars.expr.?, tree, recursive_deps);

            try writer.writeAll("){\n");
            try write_freq_value(writer, vars, tree, node);
            try writer.writeAll("\n}\n");
        }

        if (default_def) |def| {
            if (!first) {
                try writer.writeAll("else {\n");
                try write_freq_value(writer, def, tree, node);
                try writer.writeAll("\n}\n");
            } else {
                try write_freq_value(writer, def, tree, node);
            }
        }
    }
}

fn write_freq_value(
    writer: *std.Io.Writer,
    variant: *const PreProcessRefVariant,
    tree: *const TreeContext,
    node: []const u8,
) !void {
    var min_aux_buffer: [256]u8 = undefined;
    var max_aux_buffer: [256]u8 = undefined;
    const expr = variant.raw_expr orelse "Else";
    const diagnostic = variant.diagnostic orelse "No additional information";
    switch (variant.ref) {
        .float_range => |val| {
            const min: []const u8 = if (val.min) |m| try std.fmt.bufPrint(&min_aux_buffer, "{e}", .{m}) else "null";
            const max: []const u8 = if (val.max) |m| try std.fmt.bufPrint(&max_aux_buffer, "{e}", .{m}) else "null";
            try writer.print(
                \\
                \\@"{s}".limit = .{{
                \\  .min = {s},
                \\  .max = {s},
                \\  .main_expr = "{s}",
                \\  .main_dialog = "{s}",
                \\}};
                \\
            , .{ node, min, max, expr, diagnostic });
        },

        .integer_range => |val| {
            const min: []const u8 = if (val.min) |m| try std.fmt.bufPrint(&min_aux_buffer, "{d}", .{m}) else "null";
            const max: []const u8 = if (val.max) |m| try std.fmt.bufPrint(&max_aux_buffer, "{d}", .{m}) else "null";
            try writer.print(
                \\
                \\@"{s}".limit = .{{
                \\  .min = {s},
                \\  .max = {s},
                \\.main_expr = "{s}",
                \\.main_dialog = "{s}",
                \\
                \\}};
                \\
            , .{ node, min, max, expr, diagnostic });
        },
        .dynamic_range => |din| {
            const pre_round = if (din.integer) "round( " else "";
            const pos_round = if (din.integer) ").?" else "";
            if (variant.max_expr) |v_expr| {
                try writer.print(
                    \\const @"max_{s}" = {s}
                , .{ node, pre_round });
                try parser_expr(writer, v_expr, tree, null);
                try writer.print(
                    \\{s};
                    \\
                , .{pos_round});
            }

            if (variant.min_expr) |v_expr| {
                try writer.print(
                    \\const @"min_{s}" = {s}
                , .{ node, pre_round });
                try parser_expr(writer, v_expr, tree, null);
                try writer.print(
                    \\{s};
                    \\
                , .{pos_round});
            }

            try writer.print(
                \\
                \\@"{s}".limit = .{{
                \\  .min = {s},
                \\  .max = {s},
                \\  .min_expr = "{s}",
                \\  .max_expr = "{s}",
                \\  .main_expr = "{s}",
                \\  .main_dialog = "{s}",
                \\}};
                \\
            , .{
                node,
                if (din.min) |_| try std.fmt.bufPrint(&min_aux_buffer, "@\"min_{s}\"", .{node}) else "null",
                if (din.max) |_| try std.fmt.bufPrint(&max_aux_buffer, "@\"max_{s}\"", .{node}) else "null",
                din.min orelse "",
                din.max orelse "",
                expr,
                diagnostic,
            });
        },
        else => {},
    }
}
fn generate_clock_enable(writer: *std.Io.Writer, tree: *const TreeContext) !void {
    for (tree.pre.processednodes) |node| {
        if (!tree.pre.ref_process_map.contains(node.references[0])) continue;
        if (node.enable_flags.len > 0) {
            try writer.writeAll(
                \\if(!( 
            );
            try parser_expr(writer, node.enable_tokens.?, tree, null);
            try writer.print(
                \\ )){{
                \\  @"{s}".nodetype = .off;
                \\}}
                \\
            , .{node.name});
        }
    }
}
fn generate_out_values(writer: *std.Io.Writer, tree: *const TreeContext) !void {
    for (tree.pre.processednodes) |node| {
        const get_func = if (tree.base.extra_nodes.contains(node.name)) ".get_extra_output()" else ".get_output()";
        if (tree.is_node_valid(node.name)) {
            try writer.print(
                \\ out.@"{0s}" = try @"{0s}"{1s};
                \\
            , .{ node.name, get_func });
        } else {
            try writer.print(
                \\ out.@"{0s}" = 0;
                \\
            , .{node.name});
        }
    }

    for (tree.pre.processedrefs) |ref| {
        if (ref.is_flag() and ref.is_util()) {
            try writer.print(
                \\ ref_out.flags.@"{0s}" = 
            , .{ref.name});
            switch (ref.type_helper) {
                .numeric_flag => try writer.print(
                    \\ @"{s}Value" != 0;
                    \\
                , .{ref.name}),
                .numeric_list_flag => try writer.print(
                    \\ @"{s}Value" != .@"0";
                    \\
                , .{ref.name}),
                .list_flag => |item| {
                    if (item.keys().len == 1 and item.contains("false")) {
                        try writer.print(
                            \\ false;
                            \\ ignore_value(@"{0s}Value");
                            \\
                        , .{ref.name});
                    } else {
                        try writer.print(
                            \\ @"{s}Value" == .@"true";
                            \\
                        , .{ref.name});
                    }
                },
                .tag_flag => try writer.print(
                    \\ @"{s}Value" == .@"auto";
                    \\
                , .{ref.name}),
                else => {},
            }
        } else if (ref.is_output_config()) {
            try writer.print(
                \\ ref_out.@"{0s}" = @"{0s}Value";
                \\
            , .{ref.name});
        } else if (ref.is_util()) {
            try writer.print(
                \\ ignore_value(@"{0s}Value");
                \\
            , .{ref.name});
        }
    }
}

fn generate_post(writer: *std.Io.Writer) !void {
    try writer.writeAll(
        \\
        \\pub fn get_clocks(config: Config) anyerror!TreeOutput {
        \\    const ret = try get_cubemx_clocks(try config.to_cubemx_config(), true);
        \\    return TreeOutput{
        \\        .clock = ret.clock,
        \\        .config = try OutputConfig.from_cubemx_output_config(ret.config),
        \\    };
        \\}
        \\
    );
}
