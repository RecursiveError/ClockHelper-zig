const std = @import("std");
const Token = @import("clocktree_context.zig").Token;
const ClockTreeContext = @import("clocktree_context.zig");
const Defaults = @import("defaults.zig");

const TreeContext = ClockTreeContext.TreeContext;
const PreprocessedRef = ClockTreeContext.PreProcessedRef;
const PreProcessedNode = ClockTreeContext.PreProcessedNode;

const DefaultToTrue = Defaults.DefaultToTrue;
const DefaultToFalse = Defaults.DefaultToFalse;

const logger = std.log.scoped(.parser);

pub fn parser(
    writer: *std.io.Writer,
    tokens: []const Token,
    tree: *const TreeContext,
    recursive_expr: ?*const std.StringArrayHashMap(void),
) !void {
    for (tokens) |token| {
        switch (token) {
            .open_paren => try writer.writeAll(" ( "),
            .close_paren => try writer.writeAll(" ) "),
            .and_op => try writer.writeAll(" and "),
            .or_op => try writer.writeAll(" or "),
            .not_op => try writer.writeAll("!"),
            .scalar => |name| {
                if (name.len == 0) {
                    try writer.writeAll("false");
                } else if (tree.base.semaphores.contains(name)) {
                    try writer.print(
                        \\ @"{s}"
                    , .{name});
                } else if (tree.base.extra_flags.contains(name)) {
                    try writer.print(
                        \\ config.flags.@"{s}"
                    , .{name});
                } else if (DefaultToTrue.has(name)) {
                    try writer.writeAll("true");
                } else if (DefaultToFalse.has(name)) {
                    try writer.writeAll("false");
                } else if (is_numeric(name)) {
                    try writer.print(
                        \\ {s} 
                    , .{name});
                } else {
                    try writer.print(
                        \\ check_MCU("{s}") 
                    , .{name});
                }
            },
            .eq, .bt, .lt => |op| {
                const op_char: u8 = switch (token) {
                    .eq => '=',
                    .bt => '>',
                    .lt => '<',
                    else => unreachable,
                };

                const op_str: [:0]const u8 = switch (token) {
                    .eq => "==",
                    .bt => ">",
                    .lt => "<",
                    else => unreachable,
                };

                if (tree.pre.ref_process_map.get(op.op1)) |ref| {
                    const recursive = if (recursive_expr) |d| d.contains(op.op1) else false;
                    try write_ref_logic_op(writer, ref, tree, op_char, op.op2, recursive);
                } else if (tree.pre.node_process_map.get(op.op1)) |node| {
                    logger.debug("Unsupported Logic: Node:{s} {s} {s}", .{ node.name, op_str, op.op2 });
                } else if (tree.base.extra_flags.contains(op.op1)) {
                    if (std.mem.eql(u8, op.op2, "true") or std.mem.eql(u8, op.op2, "false")) {
                        try writer.print(
                            \\config.flags.@"{s}" {s} {s}
                        , .{ op.op1, op_str, op.op2 });
                    } else {
                        try writer.print(
                            \\config.flags.@"{s}"
                        , .{
                            op.op1,
                        });
                    }
                } else if (DefaultToTrue.has(op.op1)) {
                    try writer.writeAll("true");
                } else {
                    logger.debug("Unknown Op: {s} {s} {s}, defaulting to false", .{ op.op1, op_str, op.op2 });
                    try writer.writeAll("false");
                }
            },
            .ref_scalar => |name| {
                const ref = tree.pre.ref_process_map.get(name) orelse {
                    logger.debug("Unknown scalar ref: {s}", .{name});
                    return;
                };

                if (ref.is_flag()) {
                    switch (ref.type_helper) {
                        .list_flag => try write_ref_logic_op(writer, ref, tree, '=', "true", false),
                        .numeric_flag => {
                            try write_ref_logic_op(writer, ref, tree, '=', "1", false);
                        },
                        .tag_flag => |item| {
                            if (item.keys().len == 1) {
                                // if the list contains only one item, there can't be a false comparison
                                try writer.writeAll("true");
                            } else {
                                logger.debug("MULTI ITEM TAG-FLAG on TREE {s}-{s}", .{ tree.name, name });
                            }
                        },
                        else => unreachable,
                    }
                } else {
                    if (!ref.is_nullable) {
                        switch (ref.type_helper) {
                            .list, .list_flag, .tag_flag => try writer.print("@\"{s}\".get()", .{ref.name}),
                            .float => try writer.print("@\"{s}Value\"", .{ref.name}),
                            .integer => try writer.print("@floatFromInt(@\"{s}Value\")", .{ref.name}),
                            else => {
                                logger.debug("ref {s} has a invalid type {}", .{ ref.name, ref.type_helper });
                                while (true) {}
                            },
                        }
                    } else {
                        logger.debug("ref {s} is nullable, skipping", .{ref.name});
                    }
                }
            },
            .add, .div, .mul, .sub => |op| {
                const op_char: u8 = switch (token) {
                    .add => '+',
                    .sub => '-',
                    .div => '/',
                    .mul => '*',
                    else => unreachable,
                };
                if (tree.pre.ref_process_map.get(op.op1)) |ref| {
                    try write_ref_math_op(writer, ref, op_char, op.op2);
                } else if (is_numeric(op.op1)) {
                    try writer.print(
                        \\try math_op(?f32, {s}, {s}, .@"{c}", "")
                    , .{ op.op1, op.op2, op_char });
                }
            },
            .expr_scalar => |to_write| {
                try writer.writeAll(to_write);
            },

            else => {
                logger.debug("Unknown token: {any}", .{token});
            },
        }
    }
}

fn write_ref_logic_op(
    writer: *std.io.Writer,
    ref: *const PreprocessedRef,
    tree: *const TreeContext,
    op: u8,
    val2: []const u8,
    recursive: bool,
) !void {

    //if the ref is list based, we need to check if the value is in the list before doing any other checks
    if (ref.is_list_based_ref()) {
        if (!ref.check_list_item(val2)) {
            try writer.writeAll("false");
            return;
        }
    }

    const prefix = blk: {
        if (recursive) {
            if (ref.is_base_config()) {
                break :blk "config.base.";
            } else if (ref.is_extra_config()) {
                break :blk "config.extra_config.";
            }
        }
        break :blk "";
    };

    const postfix = if (prefix.len == 0) "Value" else "";
    if (ref.is_list_based_ref()) {
        const all = try ref.get_list_items();
        if (all.contains(val2)) {
            try writer.print(
                \\check_ref(@TypeOf({0s}@"{1s}{2s}"), {0s}@"{1s}{2s}", .@"{3s}", .@"{4c}") 
            , .{
                prefix,
                ref.name,
                postfix,
                val2,
                op,
            });
        } else {
            logger.debug("Reference {s} is a list but {s} is not a item, default to false", .{ ref.name, val2 });
            try writer.writeAll("false");
        }
    } else {
        if (is_numeric(val2)) {
            try writer.print(
                \\check_ref(@TypeOf({0s}@"{1s}{2s}"), {0s}@"{1s}{2s}", {3s}, .@"{4c}") 
            , .{
                prefix,
                ref.name,
                postfix,
                val2,
                op,
            });
        } else if (tree.pre.ref_process_map.contains(val2)) {
            try writer.print(
                \\check_ref(@TypeOf({0s}@"{1s}{2s}"), {0s}@"{1s}{2s}", @"{3s}Value", .@"{4c}") 
            , .{
                prefix,
                ref.name,
                postfix,
                val2,
                op,
            });
        } else {
            logger.debug("Invalid Expr between Reference {s} and Val {s}", .{ ref.name, val2 });
            try writer.writeAll("false");
        }
    }
}

fn write_ref_math_op(
    writer: *std.io.Writer,
    ref: *const PreprocessedRef,
    op: u8,
    val2: []const u8,
) !void {
    const nullable_str = if (ref.is_nullable) "" else "?";
    try writer.print(
        \\try math_op({s}@TypeOf(@"{s}Value"), 
    , .{ nullable_str, ref.name });

    switch (ref.type_helper) {
        .list => try writer.print(
            \\@"{s}Value".get(),
        , .{ref.name}),

        .integer, .float => try writer.print(
            \\@"{s}Value",
        , .{ref.name}),
        else => unreachable,
    }

    try writer.print(
        \\{s}, .@"{c}", "{s}")
    , .{ val2, op, ref.name });
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
