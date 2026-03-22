const std = @import("std");
const Yaml = @import("yaml").Yaml;
const Data_Types = @import("data_types");
const CubeMX = Data_Types.cubeMX_data;

pub const std_options = std.Options{
    .log_level = .debug,
    .log_scope_levels = &.{
        std.log.ScopeLevel{ .scope = .yaml, .level = .err },
        std.log.ScopeLevel{ .scope = .parser, .level = .err },
        std.log.ScopeLevel{ .scope = .tokenizer, .level = .err },
    },
};

const embassy_patches = std.StaticStringMap([]const []const u8).initComptime(.{
    .{ "STM32U0_256_STM32U0_256_rcc_v1_2", &.{"u0"} },
    .{ "STM32H7_STM32H7_rcc_v1_0", &.{ "h7rm0433", "h7" } },
    .{ "STM32L4_STM32L4_rcc_v1_0", &.{"l4"} },
    .{ "STM32F102_STM32F102_rcc_v1_0", &.{"f1"} },
    .{ "STM32F4_F469-F479_STM32F469-rcc_v1_0", &.{"f4"} },
    .{ "STM32H5_STM32H5_rcc_v1_0", &.{"h5"} },
    .{ "STM32L5_STM32L5_rcc_v1_0", &.{"l5"} },
    .{ "STM32L4x2_STM32L4x2_rcc_v1_0", &.{"l4"} },
    .{ "STM32L46_STM32L46_rcc_v1_0", &.{"l4"} },
    .{ "STM32F413_STM32F413-rcc_v1_0", &.{"f4"} },
    .{ "STM32F0_STM32F0_rcc_v1_0", &.{ "f0v2", "f0v1", "f0v3", "f0v4" } },
    .{ "STM32F4_F405-F407-F415-F417_STM32F417-rcc_v1_0", &.{"f4"} },
    .{ "STM32U5_9_A_STM32U5_rcc_v1_1", &.{"u5"} },
    .{ "STM32G0_64_STM32G0_64_rcc_v1_0", &.{"g0"} },
    .{ "STM32L0_STM32L051_rcc_v1_0", &.{ "l0_v2", "l0" } },
    .{ "STM32H7AB_STM32H7AB_rcc_v1_0", &.{"h7ab"} },
    .{ "STM32WL_STM32WLxx_rcc_v1_0", &.{ "wle", "wl5" } },
    .{ "STM32F373_STM32F3_rcc_v1_0", &.{"f37"} },
    .{ "STM32F091_STM32F091_rcc_v1_0", &.{ "f0v4", "f0v3" } },
    .{ "STM32L4RS_STM32L4RS_rcc_v1_0", &.{"l4plus"} },
    .{ "STM32W_STM32W_rcc_v1_0", &.{"wb"} },
    .{ "STM32F777_STM32F777_rcc_v1_0", &.{"f7"} },
    .{ "STM32L4x6_STM32L4x6_rcc_v1_0", &.{"l4"} },
    .{ "STM32H7RS_STM32H7RS_rcc_v1_0", &.{"h7rs"} },
    .{ "STM32H5_512_STM32H5_rcc_v1_512_0", &.{"h5"} },
    .{ "STM32U5_STM32U5_rcc_v1_0", &.{"u5"} },
    .{ "STM32G0-512_STM32G0-512_rcc_v1_0", &.{"g0"} },
    .{ "STM32G4_STM32G4_rcc_v1_0", &.{"g4"} },
    .{ "STM32F411_STM32F411-rcc_v1_0", &.{"f4"} },
    .{ "STM32F410_STM32F410-rcc_v1_0", &.{"f410"} },
    .{ "STM32WBA_STM32WBA_rcc_v1_0", &.{"wba"} },
    .{ "STM32H723_STM32H723_rcc_v1_0", &.{"h7"} },
    .{ "STM32F3_STM32F303_rcc_v1_0", &.{ "f3v1", "f3v2" } },
    .{ "STM32G4-479_STM32G4-479_rcc_v1_0", &.{"g4"} },
    .{ "STM32F446_STM32F446-rcc_v1_0", &.{"f4"} },
    .{ "STM32F722_STM32F722_rcc_v1_0", &.{"f7"} },
    .{ "STM32F105_STM32F105_rcc_v1_0", &.{"f1cl"} },
    .{ "STM32C0_STM32C0_rcc_v1_0", &.{"c0"} },
    .{ "STM32L1_STM32L1_rcc_v1_0", &.{"l1"} },
    .{ "STM32U5_STM32U5_rcc_v1_2", &.{"u5"} },
    .{ "STM32L43_STM32L43_rcc_v1_0", &.{"l4"} },
    .{ "STM32F4_F401_STM32F417-rcc_v1_0", &.{"f4"} },
    .{ "STM32F7_STM32F7_rcc_v1_0", &.{"f7"} },
    .{ "STM32F4_F427-F437_STM32F427-rcc_v1_0", &.{"f4"} },
    .{ "STM32G0_STM32G06_rcc_v1_0", &.{"g0"} },
    .{ "STM32F412_STM32F412-rcc_v1_0", &.{"f4"} },
    .{ "STM32G0_STM32G05_rcc_v1_0", &.{"g0"} },
    .{ "STM32F100_STM32F100_rcc_v1_0", &.{"f100"} },
    .{ "STM32G454_STM32G454_rcc_v1_0", &.{"g4"} },
    .{ "STM32F303_STM32F303E_rcc_v1_0", &.{"f3v3"} },
    .{ "STM32F2_F205-F207-F215-F217_STM32F217-rcc_v1_0", &.{"f2"} },
    .{ "STM32U0_64_STM32U0_64_rcc_v1_0", &.{"u0"} },
    .{ "STM32H5_128_STM32H5_rcc_v1_128_0", &.{"h50"} },
    .{ "STM32WB1_STM32WB1_rcc_v1_0", &.{"wb"} },
});

const MAX_BYTES = (1024 * 200);

const Tree_Context = struct {
    tree_name: []const u8,
    tree: *const CubeMX.Clock_Tree,
    compatible_rcc: []const []const u8,
    regs_data: Regs_Data,
};

const Regs = struct {
    descriptor: []const u8,
    enum_name: ?[]const u8,
    size: u32,
};

const Regs_Data = struct {
    enums: []const CubeMX.Types_Patch,
    registers: std.StringArrayHashMap(Regs),
};

pub fn main() !void {
    const clk_tree_dir = try std.fs.cwd().openDir("clock_ref_data", .{});
    const embassy_regs_dir = try std.fs.cwd().openDir("embassy_register_data", .{});

    var file_name_buf: [256]u8 = undefined;
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const gpa = arena.allocator();

    //stage1 embassy patches, this will be used to patch the clock tree data with the embassy register data, this is needed because some details of the clock tree are not present on the cubeMX data, but are needed for the code gen to work properly, like the register layout and field enums.
    for (embassy_patches.keys()) |k| {
        std.log.info("start patch of tree: {s}", .{k});
        const rcc_version = embassy_patches.get(k) orelse unreachable;

        const regs_data = try list_embassy_types(rcc_version, &embassy_regs_dir, gpa);

        const tree_name = try std.fmt.bufPrint(&file_name_buf, "{s}.json", .{k});
        const tree_file = try clk_tree_dir.readFileAlloc(gpa, tree_name, MAX_BYTES);
        const tree = try std.json.parseFromSlice(CubeMX.Clock_Tree, gpa, tree_file, .{ .ignore_unknown_fields = true });

        const ctx = Tree_Context{
            .tree_name = k,
            .tree = &tree.value,
            .compatible_rcc = rcc_version,
            .regs_data = regs_data,
        };

        link_tree_to_regs(&ctx, gpa) catch |err| {
            std.log.debug("(stage1) fail to match tree {s} to embassy file {s} err: {any} - skipping", .{
                ctx.tree_name,
                ctx.compatible_rcc[0],
                err,
            });
        };

        while (true) {}

        tree.deinit();
        gpa.free(tree_file);

        _ = arena.reset(.free_all);
    }
}

pub fn list_embassy_types(rcc_versions: []const []const u8, dir: *const std.fs.Dir, gpa: std.mem.Allocator) !Regs_Data {
    var file_name_buf: [256]u8 = undefined;

    var enum_map = std.StringArrayHashMap(CubeMX.Types_Patch).init(gpa);
    var regs_map = std.StringArrayHashMap(Regs).init(gpa);

    for (rcc_versions) |v| {
        const regs_name = try std.fmt.bufPrint(&file_name_buf, "rcc_{s}.yaml", .{v});
        const regs_file = try dir.readFileAlloc(gpa, regs_name, MAX_BYTES);
        defer gpa.free(regs_file);

        var regs = Yaml{ .source = regs_file };
        defer regs.deinit(gpa);
        try regs.load(gpa);

        //file root
        const itens = regs.docs.items[0].map;

        //check for fieldset/<name> ou enum/<name>
        for (itens.keys()) |k| {
            var split = std.mem.splitAny(u8, k, "/");
            const f_type = split.next() orelse {
                std.log.debug("(List Types) invalid type on: {s}", .{k});
                continue;
            };
            const f_name = split.next() orelse {
                std.log.debug("(List Types) invalid name on: {s}", .{k});
                continue;
            };

            if (std.mem.eql(u8, f_type, "fieldset")) {
                //ignore RCC peri clock enable and reset
                if (std.mem.containsAtLeast(u8, f_name, 1, "ENR") or
                    std.mem.containsAtLeast(u8, f_name, 1, "STR"))
                {
                    std.log.debug("(List Type) skipping  ENABLE/RESET: {s}", .{f_name});
                    continue;
                }
                const fd = itens.get(k).?.map.get("fields") orelse {
                    std.log.debug(" (List Type) Missing fields on {s}", .{k});
                    continue;
                };
                std.log.debug("(List Type) - Register {s} data:", .{f_name});
                try get_register_info(&fd, &regs_map, gpa);
            } else if (std.mem.eql(u8, f_type, "enum")) {
                std.log.debug("(List enum) enum {s} data: ", .{f_name});
                const base_type = try get_enum_data(&itens.get(k).?, gpa);
                const enum_name = try gpa.dupe(u8, f_name);

                try enum_map.put(
                    enum_name,
                    .{
                        .base_type = base_type,
                        .name = enum_name,
                    },
                );
            }
        }
    }

    return Regs_Data{
        .enums = enum_map.values(),
        .registers = regs_map,
    };
}

pub fn get_register_info(val: *const Yaml.Value, out_map: *std.StringArrayHashMap(Regs), alloc: std.mem.Allocator) !void {
    for (val.list) |vals| {
        //only enum patchs for now
        const map = vals.map;

        const name = map.get("name") orelse continue;
        const desc = map.get("description") orelse continue;
        const bit_s = map.get("bit_size") orelse continue;
        const en = map.get("enum");

        const a_name = try alloc.dupe(u8, name.scalar);
        const a_desc = try alloc.dupe(u8, desc.scalar);
        const s_bit = try std.fmt.parseInt(u32, bit_s.scalar, 10);
        const a_enum: ?[]const u8 = if (en) |v| try alloc.dupe(u8, v.scalar) else null;

        if (skip_reg(a_name)) {
            alloc.free(a_name);
            alloc.free(a_desc);
            if (a_enum) |a| alloc.free(a);
            continue;
        }

        std.log.debug("(get regs) found new field: {s}", .{name.scalar});
        try out_map.put(a_name, .{
            .descriptor = a_desc,
            .enum_name = a_enum,
            .size = s_bit,
        });
    }
}

fn skip_reg(name: []const u8) bool {
    return std.mem.containsAtLeast(u8, name, 1, "EN") or
        std.mem.containsAtLeast(u8, name, 1, "STR") or
        std.mem.containsAtLeast(u8, name, 1, "RDY") or
        std.mem.containsAtLeast(u8, name, 1, "BYP") or
        std.mem.containsAtLeast(u8, name, 1, "ON") or
        std.mem.containsAtLeast(u8, name, 1, "RST") or
        std.mem.containsAtLeast(u8, name, 1, "STF") or
        std.mem.endsWith(u8, name, "F") or
        std.mem.endsWith(u8, name, "C") or
        std.mem.endsWith(u8, name, "SWS") or
        std.mem.endsWith(u8, name, "IE");
}

fn get_enum_data(val: *const Yaml.Value, alloc: std.mem.Allocator) !CubeMX.Base_type {
    const map = val.map;
    const vari = map.get("variants").?.list;

    const bit_size = if (map.get("bit_size")) |s| try std.fmt.parseInt(u32, s.scalar, 10) else null;

    var enum_var = try std.ArrayList(CubeMX.EnumField).initCapacity(alloc, 1);

    for (vari, 0..) |v, idx| {
        const name = v.map.get("name") orelse {
            std.log.debug("(get Enum) FAIL to get enum item name", .{});
            return error.InvalidEnum;
        };

        const value: u32 = if (v.map.get("value")) |var_val| try std.fmt.parseInt(u32, var_val.scalar, 10) else @intCast(idx);

        try enum_var.append(alloc, .{
            .name = try alloc.dupe(u8, name.scalar),
            .value = value,
        });
        std.log.debug("(get enum) got enum item: {s} value {d}", .{ name.scalar, value });
    }

    return CubeMX.Base_type{
        .@"enum" = .{
            .bit_width = bit_size,
            .fields = try enum_var.toOwnedSlice(alloc),
        },
    };
}

fn link_tree_to_regs(tree_ctx: *const Tree_Context, alloc: std.mem.Allocator) !void {
    std.log.debug("LISTA1:", .{});

    for (tree_ctx.tree.references) |r| {
        const ref_name = r.ref_name;
        if (try skip_tree_ref(ref_name, alloc)) {
            //std.log.debug("skipping: {s}", .{ref_name});
            continue;
        }
        std.log.debug("{s} -  {s}", .{ ref_name, r.disc orelse "no disc" });
    }
    std.log.debug("\nLISTA2", .{});
    var regs_iter = tree_ctx.regs_data.registers.iterator();

    while (regs_iter.next()) |reg| {
        std.log.debug("{s} - {s}", .{
            reg.key_ptr.*,
            reg.value_ptr.descriptor,
        });
    }
}

fn skip_tree_ref(ref_name: []const u8, alloc: std.mem.Allocator) !bool {
    const low_name = try alloc.dupe(u8, ref_name);
    defer alloc.free(low_name);
    const low = std.ascii.lowerString(low_name, ref_name);

    return std.mem.containsAtLeast(u8, low, 1, "value") or
        std.mem.containsAtLeast(u8, low, 1, "enable") or
        std.mem.containsAtLeast(u8, low, 1, "enbale") or
        std.mem.containsAtLeast(u8, low, 1, "state") or
        std.mem.containsAtLeast(u8, low, 1, "from") or
        std.mem.containsAtLeast(u8, low, 1, "string") or
        std.mem.containsAtLeast(u8, low, 1, "used") or
        std.mem.containsAtLeast(u8, low, 1, "type");
}
