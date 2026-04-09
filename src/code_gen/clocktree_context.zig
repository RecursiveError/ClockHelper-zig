//TODO:
// - list clocknodes and extra clocknodes
// - list the parents of a clocknode
// - list the children of a clocknode
// - list all the items in ref
// - list parents of a ref
// - list if a have have patches
// - check if a ref is a clocknode ref
// - check type of a clocknode ref
// - check type of a ref
// - check if a ref is static or dynamic
// - check for recursive refs
// - check if a ref need to be postproned

const std = @import("std");
const DataTypes = @import("data_types");
const Node = DataTypes.cubeMX_data.Clock_Node;
const ClockNode = DataTypes.cubeMX_data.Clock_Node;
const Reference = DataTypes.cubeMX_data.Reference;
const ClockTree = DataTypes.cubeMX_data.Clock_Tree;
const RefToEnum = DataTypes.cubeMX_data.Match_Ref_To_Enum_Patch;
const CreateEnum = DataTypes.cubeMX_data.Enum_Patch;
const RefVariant = DataTypes.cubeMX_data.Ref_variant;
const FixedMultiplexor = DataTypes.cubeMX_data.FixedMultiplexor;
const RefType = DataTypes.cubeMX_data.Ref_type;
const Input = DataTypes.cubeMX_data.Clock_Node_Input;

const logger = std.log.scoped(.clocktree_context);

const MultiTypes = packed struct(u3) {
    int: bool = false,
    float: bool = false,
    list: bool = false,
};

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
            return error.InvalidClockType;
        };
    }
};

const DepType = enum {
    None,
    Ref,
    Node,
};

const Flag_Type = enum {
    Node,
    Numeric,
    List,
    Numeric_List,
    skip_flag,
};

const BaseContext = struct {
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

    ///used to chech if a node name is an extra node
    extra_nodes: std.StringArrayHashMap(void),

    ///return de node name associated with ref
    node_ref: std.StringArrayHashMap([]const u8),

    ///Used to get the reference associated with a given name
    references: std.StringArrayHashMap(Reference),
    extra_references: std.StringArrayHashMap(void),
    extra_ref_configs: std.StringArrayHashMap(void),

    multiplexor_fix: std.StringArrayHashMap(FixedMultiplexor),

    ///used to check if a given name is a external reference
    extra_flags: std.StringArrayHashMap(void),

    ///used to check if a reference have a patch
    ref_to_enum_patches: std.StringArrayHashMap(RefToEnum),

    ///used to get the enum from a patch
    enum_patches: std.StringArrayHashMap(CreateEnum),

    pub fn init(raw_tree: ClockTree, allocator: std.mem.Allocator) !BaseContext {
        var ctx = BaseContext{
            .semaphores = .init(allocator),
            .nodes = .init(allocator),
            .extra_nodes = .init(allocator),
            .node_ref = .init(allocator),
            .references = .init(allocator),
            .extra_references = .init(allocator),
            .extra_flags = .init(allocator),
            .extra_ref_configs = .init(allocator),
            .ref_to_enum_patches = .init(allocator),
            .enum_patches = .init(allocator),
            .multiplexor_fix = .init(allocator),
        };

        for (raw_tree.extra_nodes) |extra_node| {
            try ctx.extra_nodes.put(extra_node, {});
        }

        for (raw_tree.extra_flags) |flag| {
            try ctx.extra_flags.put(flag, {});
        }

        for (raw_tree.extra_reference) |config| {
            try ctx.extra_references.put(config, {});
        }

        for (raw_tree.config_ref_names) |ref_name| {
            try ctx.extra_ref_configs.put(ref_name, {});
        }

        for (raw_tree.references) |ref| {
            if (!ctx.references.contains(ref.ref_name)) try ctx.references.put(ref.ref_name, ref);
            if (std.mem.endsWith(u8, ref.ref_name, "Virtual")) {
                const end = ref.ref_name.len - 7;
                try ctx.references.put(ref.ref_name[0..end], ref);
            }
            for (ref.variants) |v| {
                switch (v.ref) {
                    .list => |list| {
                        for (list.itens) |i| {
                            const semaphore_name = i.semaphore orelse continue;
                            try ctx.semaphores.put(semaphore_name, ref.ref_name);
                        }
                    },
                    .single_item => |item| {
                        const semaphore_name = item.semaphore orelse continue;
                        try ctx.semaphores.put(semaphore_name, ref.ref_name);
                    },
                    else => {},
                }
            }
        }

        for (raw_tree.nodes) |node| {
            try ctx.nodes.put(node.name, node);
            var refs = std.mem.splitAny(u8, node.reference, ",");
            while (refs.next()) |ref| {
                if (std.mem.endsWith(u8, ref, "Virtual")) {
                    try ctx.node_ref.put(ref[0..(ref.len - 7)], node.name);
                }
                try ctx.node_ref.put(ref, node.name);
            }
        }

        if (raw_tree.gen_patches) |patches| {
            for (patches.match_ref_to_enum) |ref_to_enum_patch| {
                try ctx.ref_to_enum_patches.put(ref_to_enum_patch.ref_name, ref_to_enum_patch);
            }

            for (patches.enums) |enum_patch| {
                try ctx.enum_patches.put(enum_patch.name, enum_patch);
            }
        }

        if (raw_tree.fixed_multiplexors) |fix| {
            for (fix) |i| {
                try ctx.multiplexor_fix.put(i.reference, i);
            }
        }

        return ctx;
    }

    pub fn deinit(self: *BaseContext) void {
        self.semaphores.deinit();
        self.nodes.deinit();
        self.extra_nodes.deinit();
        self.node_ref.deinit();
        self.references.deinit();
        self.extra_references.deinit();
        self.extra_flags.deinit();
        self.extra_ref_configs.deinit();
        self.ref_to_enum_patches.deinit();
        self.enum_patches.deinit();
        self.multiplexor_fix.deinit();
    }

    pub fn get_name_context(self: *const BaseContext, name: []const u8) ?ContextType {
        if (self.semaphores.contains(name)) return .semafore;
        if (self.references.contains(name)) return .reference;
        if (self.extra_flags.contains(name)) return .extra_flag;
        if (self.nodes.contains(name)) return .node;
        return null;
    }
};

pub const OpValue = struct {
    op1: []const u8,
    op2: []const u8,
};

pub const Token = union(enum) {
    open_paren: void,
    close_paren: void,
    and_op: void,
    or_op: void,
    not_op: void,
    scalar: []const u8,
    ref_scalar: []const u8,
    expr_scalar: []const u8, //an expr that can be write direct
    eq: OpValue,
    bt: OpValue,
    lt: OpValue,
    add: OpValue,
    sub: OpValue,
    mul: OpValue,
    div: OpValue,
    by_value: []const u8, //used for pointer to ref value, like in "=ref1 * ref2"
    by_ref: []const u8, //used for pointer to ref, like in "+ref1"
};

pub const TokenizerData = struct {
    trim_expr: []const u8,
    tokens: []const Token,
    depend_on_node: bool,
};

pub const PreProcessRefVariant = struct {
    expr: ?[]const Token = null,

    default_expr: ?[]const Token = null, //always null if ref is not dynamic.
    max_expr: ?[]const Token = null, //only used for dynamic range, always null for other types.
    min_expr: ?[]const Token = null, //only used for dynamic range, always null for other types.

    diagnostic: ?[]const u8 = null,
    raw_expr: ?[]const u8 = null, //used for diagnostic and error messages, the raw expression as it is in the json, without any processing.
    have_default_value: bool = false,
    ref: RefType,
};

pub const RefTypeHelper = union(enum) {
    list: std.StringArrayHashMap(?f64), //if ref is a list, this field will contain the list of all items in the list.
    tag_flag: std.StringArrayHashMap(?f64), //same as list_flag but the flag is not boolean, instead, the flag is the presence of a specific item in the.
    numeric_list_flag: std.StringArrayHashMap(?f64),
    list_flag: std.StringArrayHashMap(?f64), //if the ref is a list, this field indicate if the item in the list are boolean flags

    numeric_flag: void, //if number are used as boolean flag.

    integer: void, //just the data type
    float: void, // just the data type
    multi_type: void, //we dont have any treatment for this case yet.
    no_helper_needed: void, //if the ref does not need a additional context to be processed (like: static non-flag numbers, strings and no_types)
};

pub const PreProcessedRef = struct {
    name: []const u8,
    disc: ?[]const u8,

    is_static: bool = true,
    is_nullable: bool = true,
    has_expression: bool = false,
    postpone: bool = false,
    is_node_ref: ?ClockType = null, //if the ref is a node ref, this field indicate the type of the node.

    type_helper: RefTypeHelper = .no_helper_needed,
    dependency: std.StringArrayHashMap(void) = undefined, //list of refs that need to be processed before this ref, used for check recursive refs and to know the order of processing
    variants: []PreProcessRefVariant = undefined,

    pub fn get_list_items(self: *const PreProcessedRef) !std.StringArrayHashMap(?f64) {
        return switch (self.type_helper) {
            inline .list, .list_flag, .tag_flag, .numeric_list_flag => |items| items,
            else => error.NotAListRef,
        };
    }

    //if the ref is a node ref and the ref value is directly used by clock nodes (like: divisor, multiplicator, fractional, etc)
    pub fn is_clocktree_value(self: *const PreProcessedRef) bool {
        if (self.is_node_ref) |node_type| {
            return switch (node_type) {
                .divisor, .multiplicator, .multiplicatorFrac, .source => true,
                else => false,
            };
        }
        return false;
    }

    pub fn check_for_range(self: *const PreProcessedRef) bool {
        if (self.is_node_ref) |node_t| {
            switch (node_t) {
                .output, .source => return false,
                else => {},
            }
        }
        return true;
    }

    pub fn is_list_based_ref(self: *const PreProcessedRef) bool {
        return switch (self.type_helper) {
            .list, .list_flag, .tag_flag => true,
            else => false,
        };
    }

    pub fn check_list_item(self: *const PreProcessedRef, item: []const u8) bool {
        switch (self.type_helper) {
            inline .list, .list_flag, .tag_flag => |items| {
                return items.contains(item);
            },
            else => return false,
        }
    }

    pub fn is_flag(self: *const PreProcessedRef) bool {
        return switch (self.type_helper) {
            .numeric_flag, .list_flag, .tag_flag, .numeric_list_flag => true,
            else => false,
        };
    }

    pub fn is_util(self: *const PreProcessedRef) bool {
        return switch (self.type_helper) {
            .multi_type,
            .no_helper_needed,
            => false,
            else => true,
        };
    }

    pub fn is_base_config(self: *const PreProcessedRef) bool {
        if (self.is_node_ref) |n_type| {
            return n_type != .output and !self.is_static and self.is_util();
        }
        return false;
    }

    pub fn is_extra_config(self: *const PreProcessedRef) bool {
        return (self.is_node_ref == null) and !self.is_static and self.is_util();
    }

    pub fn get_config_prefix(self: *const PreProcessedRef) ?[]const u8 {
        if (self.is_base_config()) {
            return "config.";
        } else if (self.is_extra_config()) {
            return "config.extra_config.";
        }
        return null;
    }

    pub fn is_output_config(self: *const PreProcessedRef) bool {
        var name_buf_aux: [256]u8 = undefined;
        const lower_n = std.ascii.lowerString(&name_buf_aux, self.name);

        if (std.mem.containsAtLeast(u8, lower_n, 1, "freq_value")) return false;
        if (self.is_node_ref) |n| {
            switch (n) {
                .output => return false,
                .source => {
                    if (!self.is_list_based_ref()) return false;
                },
                else => {},
            }
        }
        return self.is_util() and !self.is_flag();
    }

    pub fn to_postprone(self: *const PreProcessedRef) bool {
        var aux_buffer: [256]u8 = undefined;
        if (self.postpone) return true;
        const lower_name = std.ascii.lowerString(&aux_buffer, self.name);
        return std.mem.containsAtLeast(u8, lower_name, 1, "freq_value");
    }
};

pub const PreProcessedNodeVariant = struct {
    expr: ?[]const Token = null,
    raw_expr: ?[]const u8,
    diagnostic: ?[]const u8 = null,
    inputs: []const Input,
    outputs: []const []const u8,
};

pub const PreProcessedNode = struct {
    name: []const u8,
    node_type: ClockType,
    enable_flags: []const []const u8,
    enable_tokens: ?[]Token = null,
    references: []const []const u8,
    variants: []const PreProcessedNodeVariant,
};

pub const PreProcessedContext = struct {
    processedrefs: []PreProcessedRef,
    processednodes: []PreProcessedNode,

    node_process_map: std.StringArrayHashMap(*const PreProcessedNode),
    ref_process_map: std.StringArrayHashMap(*const PreProcessedRef),
};

pub const TreeContext = struct {
    name: []const u8,
    raw: ClockTree,
    base: BaseContext,
    pre: PreProcessedContext,

    pub fn get_reference_enum_patch(self: *const TreeContext, ref_name: []const u8) ?RefToEnum {
        return self.base.ref_to_enum_patches.get(ref_name);
    }

    pub fn is_node_valid(self: *const TreeContext, node_name: []const u8) bool {
        if (self.pre.node_process_map.get(node_name)) |node| {
            for (node.references) |refs| {
                if (self.pre.ref_process_map.contains(refs)) return true;
            }
        }

        return false;
    }
};

pub const ClockTreeContext = struct {
    arena: std.heap.ArenaAllocator,
    trees: []TreeContext,
    tree_map: std.StringHashMap(void),

    pub fn init(clock_tree_dir: *std.fs.Dir, alloc: std.mem.Allocator) !ClockTreeContext {
        var arena = std.heap.ArenaAllocator.init(alloc);
        errdefer arena.deinit();

        var tree_map = std.StringHashMap(void).init(arena.allocator());
        errdefer tree_map.deinit();

        const base_tree_contexts = try load_BaseContext(clock_tree_dir, arena.allocator());
        for (base_tree_contexts) |ctx| {
            try tree_map.put(ctx.name, {});
        }

        return ClockTreeContext{
            .arena = arena,
            .tree_map = tree_map,
            .trees = base_tree_contexts,
        };
    }

    pub fn deinit(self: *const ClockTreeContext) void {
        self.arena.deinit();
    }

    pub fn load_BaseContext(dir: *std.fs.Dir, alloc: std.mem.Allocator) ![]TreeContext {
        var tree_contexts = try std.ArrayList(TreeContext).initCapacity(alloc, 64);
        var dir_iter = dir.iterate();

        while (try dir_iter.next()) |file| {
            const name = file.name;
            if (file.kind != .file) continue;
            if (!std.mem.endsWith(u8, name, ".json")) continue;

            const tree_file = dir.readFileAlloc(alloc, name, (1024 * 1024) * 10) catch |err| {
                logger.warn("fail to read {s} - error {any}", .{ name, err });
                continue;
            };

            defer alloc.free(tree_file);

            const tree_data: std.json.Parsed(ClockTree) = std.json.parseFromSlice(ClockTree, alloc, tree_file, .{ .allocate = .alloc_always, .ignore_unknown_fields = true }) catch |err| {
                logger.warn("fail to parse {s} - error {any}", .{ name, err });
                continue;
            };
            const real_name = try alloc.dupe(u8, name[0..(name.len - 5)]); //remove .json extension
            const base_ctx = try BaseContext.init(tree_data.value, alloc);
            const pre = try pre_process_tree(tree_data.value, &base_ctx, alloc);
            try tree_contexts.append(alloc, .{
                .name = real_name,
                .raw = tree_data.value,
                .base = base_ctx,
                .pre = pre,
            });
        }
        return try tree_contexts.toOwnedSlice(alloc);
    }

    fn pre_process_tree(tree: ClockTree, base_ctx: *const BaseContext, alloc: std.mem.Allocator) !PreProcessedContext {
        var refs_map = std.StringArrayHashMap(*const PreProcessedRef).init(alloc);
        var nodes_map = std.StringArrayHashMap(*const PreProcessedNode).init(alloc);

        const refs = try pre_process_ref(tree.references, base_ctx, alloc);
        for (0..refs.len) |idx| {
            if (!refs_map.contains(refs[idx].name)) try refs_map.put(refs[idx].name, &refs[idx]);
            if (std.mem.endsWith(u8, refs[idx].name, "Virtual")) {
                const end = refs[idx].name.len - 7;
                try refs_map.put(refs[idx].name[0..end], &refs[idx]);
            }
        }

        const nodes = try pre_process_node(tree.nodes, base_ctx, alloc);
        for (0..nodes.len) |idx| {
            try nodes_map.put(nodes[idx].name, &nodes[idx]);
        }

        return PreProcessedContext{
            .processednodes = nodes,
            .processedrefs = refs,
            .node_process_map = nodes_map,
            .ref_process_map = refs_map,
        };
    }

    fn pre_process_ref(refs: []const Reference, base_ctx: *const BaseContext, alloc: std.mem.Allocator) ![]PreProcessedRef {
        var processed_refs = try std.ArrayList(PreProcessedRef).initCapacity(alloc, refs.len);

        for (refs) |ref| {
            var proc: PreProcessedRef = .{
                .name = ref.ref_name,
                .disc = ref.disc,
                .type_helper = .no_helper_needed,
            };
            proc.is_node_ref = blk: {
                if (base_ctx.node_ref.get(ref.ref_name)) |node_name| {
                    const node = base_ctx.nodes.get(node_name) orelse unreachable;
                    break :blk ClockType.get(node.node_type) catch {
                        logger.warn("invalid clock type {s} in node {s} for ref {s}", .{ node.node_type, node.name, ref.ref_name });
                        break :blk null;
                    };
                }
                break :blk null;
            };
            try process_ref_variant(ref.variants, base_ctx, &proc, alloc);

            try processed_refs.append(alloc, proc);
        }

        return try processed_refs.toOwnedSlice(alloc);
    }

    fn process_ref_variant(variants: []const RefVariant, ctx: *const BaseContext, pre: *PreProcessedRef, alloc: std.mem.Allocator) !void {
        var dependency_set = std.StringArrayHashMap(void).init(alloc);
        var pre_ref_vars = try std.ArrayList(PreProcessRefVariant).initCapacity(alloc, variants.len);
        var all_list_item = std.StringArrayHashMap(?f64).init(alloc);
        var all_list_defaults = std.StringArrayHashMap(void).init(alloc);
        defer all_list_defaults.deinit();

        var multi_types: MultiTypes = .{};
        var static = true;
        var have_string = false;
        var have_expr = false;
        var is_nullable = false;
        var depend_on_node = false;

        for (variants) |variant| {
            var ref_v = PreProcessRefVariant{
                .ref = variant.ref,
                .raw_expr = if (variant.expr) |to_clear| try format_raw_expr(to_clear, alloc) else null,
                .diagnostic = variant.diagnostic,
            };
            var have_default = false;

            switch (variant.ref) {
                .list => |list| {
                    static = false;
                    multi_types.list = true;
                    if (list.default_name) |def| {
                        have_default = true;

                        try all_list_defaults.put(def, {});
                    }
                    for (list.itens) |item| {
                        try all_list_item.put(item.name, item.value orelse null);
                    }
                },
                .single_item => |item| {
                    have_default = true;
                    multi_types.list = true;
                    try all_list_item.put(item.name, item.value orelse null);
                },
                .fixed_integer => {
                    multi_types.int = true;
                    have_default = true;
                },
                .fixed_float => {
                    multi_types.float = true;
                    have_default = true;
                },
                .fixed_expr => |expr| {
                    multi_types.float = true;
                    have_default = true;

                    const expr_ret = try process_expr(expr.value, ctx, &dependency_set, alloc);
                    ref_v.default_expr = expr_ret.tokens;
                },
                .integer_range => |range| {
                    static = false;
                    multi_types.int = true;
                    have_default = range.default_value != null;
                },
                .float_range => |range| {
                    multi_types.float = true;
                    static = false;
                    have_default = range.default_value != null;
                },
                .dynamic_range => |range| {
                    if (range.integer) {
                        multi_types.int = true;
                    } else {
                        multi_types.float = true;
                    }
                    static = false;

                    if (range.default_value) |default| {
                        have_default = true;
                        const expr_ret = try process_expr(default, ctx, &dependency_set, alloc);
                        ref_v.default_expr = expr_ret.tokens;
                    }

                    if (range.max) |max| {
                        const expr_ret = try process_expr(max, ctx, &dependency_set, alloc);
                        ref_v.max_expr = expr_ret.tokens;
                    }

                    if (range.min) |min| {
                        const expr_ret = try process_expr(min, ctx, &dependency_set, alloc);
                        ref_v.min_expr = expr_ret.tokens;
                    }
                },
                .string => {
                    have_string = true;
                },
                .no_value => {},
            }

            ref_v.have_default_value = have_default;

            if (variant.expr) |expr| {
                have_expr = true;
                const data = try process_expr(expr, ctx, &dependency_set, alloc);
                depend_on_node = data.depend_on_node;
                ref_v.expr = data.tokens;
            }
            if (!have_default) {
                is_nullable = true;
            }

            try pre_ref_vars.append(alloc, ref_v);
        }

        //after processing all variants, try get the ref true type helpers:
        const all_item = all_list_item;

        if (multi_types.int and !multi_types.float and !multi_types.list) {
            //if numeric, check if is a flag, a variable number or a static number:
            blk: {
                if (static) {
                    if (is_numeric_flag(variants)) {
                        pre.type_helper = .numeric_flag;
                        break :blk;
                    }
                }
                pre.type_helper = .integer;
            }
        } else if (multi_types.float and !multi_types.list) {
            pre.type_helper = .float;
        } else if (multi_types.list and !multi_types.int and !multi_types.float) {
            if (is_list_flag(all_item.keys())) |flag_t| {
                if (flag_t) {
                    pre.type_helper = .{ .numeric_list_flag = all_item };
                } else {
                    pre.type_helper = .{ .list_flag = all_item };
                }
            } else if (all_item.keys().len == 1) {
                if (std.mem.eql(u8, "auto", all_item.keys()[0])) {
                    pre.type_helper = .{ .tag_flag = all_item };
                } else {
                    pre.type_helper = .{ .list = all_item };
                }
            } else {
                pre.type_helper = .{ .list = all_item };
            }
        } else {
            pre.type_helper = .multi_type;
        }

        pre.is_static = static;
        pre.has_expression = have_expr;
        pre.is_nullable = if (pre.is_node_ref) |_| false else is_nullable; //node refs are never null
        pre.dependency = dependency_set;
        pre.variants = try pre_ref_vars.toOwnedSlice(alloc);
    }

    fn is_numeric_flag(variants: []const RefVariant) bool {
        if (variants.len > 2 or variants.len == 0) return false;
        var have_zero = false;
        var have_non_zero = false;
        for (variants) |variant| {
            switch (variant.ref) {
                .fixed_integer => |number| {
                    if (number == 0) {
                        have_zero = true;
                    } else {
                        have_non_zero = true;
                    }
                },
                else => return false,
            }
        }
        return have_zero and have_non_zero;
    }

    //if null list is not a flag.
    //if false list is a boolean flag.
    //if true list is tag flag.
    fn is_list_flag(items: []const []const u8) ?bool {
        if (items.len == 0 or items.len > 3) return null;
        if (items[0].len > 5) return null; //list flag can only be: true/false/auto
        var out: [6]u8 = undefined;
        const lower_items = std.ascii.lowerString(&out, items[0]);
        if (std.mem.eql(u8, lower_items, "true") or std.mem.eql(u8, lower_items, "false")) {
            return false;
        } else if (lower_items[0] == '1' or lower_items[0] == '0') {
            return true;
        }
        return null;
    }

    fn pre_process_node(nodes: []const Node, base_ctx: *const BaseContext, alloc: std.mem.Allocator) ![]PreProcessedNode {
        var pre_nodes = try std.ArrayList(PreProcessedNode).initCapacity(alloc, nodes.len);
        var enable_tokes = try std.ArrayList(Token).initCapacity(alloc, 10);
        errdefer pre_nodes.deinit(alloc);

        for (nodes) |node| {
            const node_type = ClockType.get(node.node_type) catch {
                logger.warn("invalid clock type {s} in node {s}", .{ node.node_type, node.name });
                continue;
            };
            var node_variants = try std.ArrayList(PreProcessedNodeVariant).initCapacity(alloc, node.variants.len);
            var node_flags = try std.ArrayList([]const u8).initCapacity(alloc, 3);
            var node_refs = std.StringArrayHashMap(void).init(alloc);

            var ref_iter = std.mem.splitAny(u8, node.reference, ",-|/");
            while (ref_iter.next()) |ref| {
                const ref_name = if (std.mem.endsWith(u8, ref, "Virtual")) ref[0..(ref.len - 7)] else ref;
                try node_refs.put(ref_name, {});
            }

            for (node.variants) |variant| {
                var new_variant: PreProcessedNodeVariant = .{
                    .diagnostic = variant.diagnostic,
                    .inputs = variant.inputs,
                    .outputs = variant.outputs,
                    .raw_expr = if (variant.expr) |expr| try format_raw_expr(expr, alloc) else null,
                };
                if (variant.expr) |expr| {
                    const data = try process_expr(expr, base_ctx, null, alloc);
                    new_variant.expr = data.tokens;
                }
                try node_variants.append(alloc, new_variant);
            }

            if (node.enable_flag) |flag| {
                var flag_iter = std.mem.splitAny(u8, flag, ",");
                var first: bool = true;
                while (flag_iter.next()) |flag_i| {
                    try node_flags.append(alloc, flag_i);
                    if (!first) {
                        try enable_tokes.append(alloc, .or_op);
                    }
                    if (base_ctx.references.contains(flag_i)) {
                        try enable_tokes.append(alloc, .{ .ref_scalar = flag_i });
                    } else {
                        try enable_tokes.append(alloc, .{ .scalar = flag_i });
                        logger.debug("GOT NON-REFERENCE ENABLE: \"{s}\", Node {s}", .{ flag_i, node.name });
                    }

                    first = false;
                }
            }

            try pre_nodes.append(alloc, .{
                .name = node.name,
                .node_type = node_type,
                .enable_flags = try node_flags.toOwnedSlice(alloc),
                .enable_tokens = try enable_tokes.toOwnedSlice(alloc),
                .variants = try node_variants.toOwnedSlice(alloc),
                .references = node_refs.keys(),
            });
        }
        return try pre_nodes.toOwnedSlice(alloc);
    }

    fn process_expr(expr: []const u8, ctx: *const BaseContext, has_dep: ?*std.StringArrayHashMap(void), alloc: std.mem.Allocator) !TokenizerData {
        var cur_idx: usize = 0;
        var depend_on_node = false;

        var tokens = try std.ArrayList(Token).initCapacity(alloc, 20);
        errdefer tokens.deinit(alloc);

        const trim_expr = try alloc.alloc(u8, expr.len);

        const out_ch = std.mem.replace(u8, expr, " ", "", trim_expr);
        var current_identifier: ?[]const u8 = null;
        var is_cur_ref = false;
        while (cur_idx < (trim_expr.len - out_ch)) {
            const char = trim_expr[cur_idx];
            switch (char) {
                '(', ')', '&', '|', '!' => {
                    if (current_identifier) |id| {
                        if (is_cur_ref) {
                            try tokens.append(alloc, .{ .ref_scalar = id });
                        } else {
                            try tokens.append(alloc, .{ .scalar = id });
                        }
                        is_cur_ref = false;
                        current_identifier = null;
                    }
                    const token: Token = switch (char) {
                        '(' => Token.open_paren,
                        ')' => Token.close_paren,
                        '&' => Token.and_op,
                        '|' => Token.or_op,
                        '!' => Token.not_op,
                        else => unreachable,
                    };
                    try tokens.append(alloc, token);
                },
                'a'...'z', 'A'...'Z', '0'...'9' => {
                    const raw_str = get_sub_string(trim_expr[cur_idx..]);
                    cur_idx += raw_str.len;

                    const sub_str = if (std.mem.endsWith(u8, raw_str, "Virtual")) raw_str[0..(raw_str.len - 7)] else raw_str;
                    current_identifier = sub_str;
                    is_cur_ref = false;

                    switch (try update_deps(sub_str, ctx, has_dep)) {
                        .Ref => is_cur_ref = true,
                        .Node => depend_on_node = true,
                        else => {},
                    }
                    continue;
                },
                '=', '<', '>', '+', '-', '*', '/' => {
                    //if a this operator is found, a identifier must be the next token
                    const op_sub = char;
                    cur_idx += 1;

                    const raw_next_sub = get_sub_string(trim_expr[cur_idx..]);
                    if (raw_next_sub.len == 0) {
                        logger.err("expected identifier after operator {c} in expression {s}", .{ op_sub, expr });
                        return error.InvalidExpr;
                    }

                    cur_idx += raw_next_sub.len;

                    const next_sub = if (std.mem.endsWith(u8, raw_next_sub, "Virtual")) raw_next_sub[0..(raw_next_sub.len - 7)] else raw_next_sub;
                    if (current_identifier) |id| {
                        switch (op_sub) {
                            '=' => try tokens.append(alloc, .{ .eq = .{ .op1 = id, .op2 = next_sub } }),
                            '<' => try tokens.append(alloc, .{ .lt = .{ .op1 = id, .op2 = next_sub } }),
                            '>' => try tokens.append(alloc, .{ .bt = .{ .op1 = id, .op2 = next_sub } }),
                            '+' => try tokens.append(alloc, .{ .add = .{ .op1 = id, .op2 = next_sub } }),
                            '-' => try tokens.append(alloc, .{ .sub = .{ .op1 = id, .op2 = next_sub } }),
                            '*' => try tokens.append(alloc, .{ .mul = .{ .op1 = id, .op2 = next_sub } }),
                            '/' => try tokens.append(alloc, .{ .div = .{ .op1 = id, .op2 = next_sub } }),
                            else => unreachable,
                        }

                        switch (try update_deps(next_sub, ctx, has_dep)) {
                            .Node => depend_on_node = true,
                            else => {},
                        }

                        current_identifier = null;
                    } else {
                        switch (op_sub) {
                            '<', '>' => {
                                try tokens.append(alloc, .{ .expr_scalar = try std.fmt.allocPrint(alloc, " {c} {s} ", .{ char, next_sub }) });
                            },
                            else => {
                                current_identifier = next_sub;
                                is_cur_ref = false;
                            },
                        }
                        switch (try update_deps(next_sub, ctx, has_dep)) {
                            .Ref => is_cur_ref = true,
                            .Node => depend_on_node = true,
                            else => {},
                        }
                    }
                    continue;
                },
                else => {},
            }

            cur_idx += 1;
        }
        if (current_identifier) |id| {
            if (is_cur_ref) {
                try tokens.append(alloc, .{ .ref_scalar = id });
            } else {
                try tokens.append(alloc, .{ .scalar = id });
            }
        }

        return TokenizerData{
            .trim_expr = trim_expr,
            .tokens = try tokens.toOwnedSlice(alloc),
            .depend_on_node = depend_on_node,
        };
    }

    fn get_sub_string(str: []const u8) []const u8 {
        for (str, 0..str.len) |char, idx| {
            switch (char) {
                'a'...'z', 'A'...'Z', '0'...'9', '_', '-', '.' => {},
                else => return str[0..idx],
            }
        }
        return str;
    }
};

pub fn format_raw_expr(raw: []const u8, alloc: std.mem.Allocator) ![]const u8 {
    const new_buffer = try alloc.alloc(u8, (raw.len * 2));
    var new_buffer_idx: usize = 0;

    for (raw) |char| {
        switch (char) {
            '\r' => {
                new_buffer[new_buffer_idx] = '\\';
                new_buffer[new_buffer_idx + 1] = 'r';
                new_buffer_idx += 2;
            },

            '\n' => {
                new_buffer[new_buffer_idx] = '\\';
                new_buffer[new_buffer_idx + 1] = 'n';
                new_buffer_idx += 2;
            },

            '\t' => {
                new_buffer[new_buffer_idx] = '\\';
                new_buffer[new_buffer_idx + 1] = 't';
                new_buffer_idx += 2;
            },

            else => {
                new_buffer[new_buffer_idx] = char;
                new_buffer_idx += 1;
            },
        }
    }

    return new_buffer[0..new_buffer_idx];
}

fn update_deps(sub_str: []const u8, ctx: *const BaseContext, deps: ?*std.StringArrayHashMap(void)) !DepType {
    const id_type = ctx.get_name_context(sub_str) orelse return .Node;
    switch (id_type) {
        .semafore => {
            const ref_name = ctx.semaphores.get(sub_str) orelse unreachable;
            if (deps) |dep| {
                if (!dep.contains(ref_name)) {
                    try dep.put(ref_name, {});
                }
            }
            return .None;
        },
        .reference => {
            if (deps) |dep| {
                if (!dep.contains(sub_str)) {
                    try dep.put(sub_str, {});
                }
                return .Ref;
            }
        },
        .node, .node_enable => {
            return .Node;
        },
        else => {},
    }
    return .None;
}
