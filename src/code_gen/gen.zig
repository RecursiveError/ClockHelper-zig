const std = @import("std");
const data_types = @import("data_types");
const MCUContext = @import("mcu_context.zig").MCUContext;
const ClockTreeContext = @import("clocktree_context.zig").ClockTreeContext;
const EmbassyTargets = @import("embassy_targets.zig");
const GenZig = @import("generate.zig");

const MCUInfo = data_types.cubeMX_data.MCU_Info;
const logger = std.log.scoped(.gen);

const LOCAL_MCU_DATA_PATH = "mcu_data/";
const LOCAL_MCU_TREE_DATA_PATH = "patch_tree_data/";

const DEFAULT_OUTPUT_DIR = "src/clockhelper/";
const DEFAULT_LIBRARY_FILENAME = "clocktree.zig";

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const gpa_allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const args = try std.process.argsAlloc(gpa_allocator);
    defer std.process.argsFree(gpa.allocator(), args);

    if (args.len != 2) {
        logger.err("fail to load MCU file", .{});
        return error.InvalidArgs;
    }

    //CONTEXT LOAD

    var embassy_target = try EmbassyTargets.init(args[1], gpa_allocator);
    defer embassy_target.deinit();

    var mcu_file_dir = try std.fs.cwd().openDir(LOCAL_MCU_DATA_PATH, .{ .iterate = true });
    defer mcu_file_dir.close();

    var tree_dir = try std.fs.cwd().openDir(LOCAL_MCU_TREE_DATA_PATH, .{ .iterate = true });

    const mcu_context = try MCUContext.init(&mcu_file_dir, gpa_allocator);
    defer mcu_context.deinit();

    const clock_trees = try ClockTreeContext.init(&tree_dir, gpa_allocator);
    defer clock_trees.deinit();

    //CLOCKTREE GEN
    var writer_buffer: [4096]u8 = undefined;
    var name_buffer: [256]u8 = undefined;

    var out_dir = try check_or_create_output_dir(DEFAULT_OUTPUT_DIR);
    defer out_dir.close();

    for (clock_trees.trees) |tree| {
        logger.info("generating code for tree {s}", .{tree.name});

        const tree_name = tree.name;
        const file_name = try std.fmt.bufPrint(&name_buffer, "clocktrees/{s}.zig", .{tree_name});

        var out_file = try out_dir.createFile(file_name, .{});
        errdefer out_file.close();

        var writer = out_file.writer(&writer_buffer);
        try GenZig.generate_zig_clocktree(&writer.interface, tree, gpa_allocator);

        try writer.interface.flush();
        out_file.close();
        const full_name = try out_dir.realpathAlloc(gpa_allocator, file_name);
        defer gpa_allocator.free(full_name);

        var ch = std.process.Child.init(&[_][]const u8{ "zig", "fmt", full_name }, gpa_allocator);
        _ = try ch.spawnAndWait();
    }

    //MAIN LIB GEN
    var out_lib = try out_dir.createFile(DEFAULT_LIBRARY_FILENAME, .{});
    defer out_lib.close();

    var writer = out_lib.writer(&writer_buffer);
    var out = &writer.interface;

    try out.writeAll(
        \\ //AUTO-GENERATED FILE. DO NOT MODIFY.
        \\
        \\const std = @import("std");
        \\
    );
    for (clock_trees.trees) |tree| {
        try out.print(
            \\
            \\ const @"{0s}" = @import("clocktrees/{0s}.zig");
            \\
        , .{tree.name});
    }

    for (mcu_context.mcus) |mcu| {
        if (!clock_trees.tree_map.contains(mcu.clock_ref_file_union)) continue;
        try out.print(
            \\
            \\ const @"{0s}" = @"{1s}".ClockTree(std.StaticStringMap(void).initComptime(.{{
            \\
        , .{ mcu.name, mcu.clock_ref_file_union });

        for (mcu.extra_data) |data| {
            try out.print(
                \\ .{{"{s}", {{}}}},
                \\
            , .{data});
        }
        try out.writeAll("}));");
    }

    for (embassy_target.embassy_targets.keys()) |target| {
        const to_cmp = embassy_target.embassy_targets.get(target) orelse unreachable;
        if (mcu_context.mcu_map.get(to_cmp)) |mcu| {
            try out.print(
                \\
                \\ const @"{0s}" = @"{1s}";
                \\
            , .{ target, mcu.name });
        }
    }

    //write tests

    try out.writeAll(
        \\ test "COMPILE CHECK" {
        \\
    );
    var done_map = std.StringArrayHashMap(void).init(gpa_allocator);
    defer done_map.deinit();

    for (mcu_context.mcus) |mcu| {
        if (!clock_trees.tree_map.contains(mcu.clock_ref_file_union)) continue;
        if (done_map.contains(mcu.clock_ref_file_union)) continue;
        try done_map.put(mcu.clock_ref_file_union, {});

        try out.print(
            \\
            \\_ = comptime try @"{s}".get_clocks(.{{}});
            \\
        , .{mcu.name});
    }

    try out.writeAll(
        \\
        \\}
        \\
    );
    try out.writeAll(
        \\        test "STM32L47 RCC calculations" {
        \\    const base_file = STM32L476VG;
        \\    const base_tree = try STM32L476VG.get_clocks(.{});
        \\    const config_tree = try STM32L476VG.get_clocks(.{
        \\        .PLLSourceVirtual = .HSI,
        \\        .SYSCLKSource = .PLL1_R,
        \\    });
        \\
        \\    try std.testing.expectError(error.Underflow, STM32L476VG.get_clocks(.{
        \\        .PLLSourceVirtual = .MSI,
        \\        .SYSCLKSource = .PLL1_R,
        \\    }));
        \\
        \\    try std.testing.expectEqual(base_tree.clock.AHBOutput, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB1Output, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.TimPrescalerAPB1, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB2Prescaler, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.TimPrescalerAPB2, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.config.SYSCLKSource, base_file.RCC_SW.MSI);
        \\
        \\    try std.testing.expectEqual(config_tree.clock.AHBOutput, 64_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB1Output, 64_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.TimPrescalerAPB1, 64_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB2Prescaler, 64_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.TimPrescalerAPB2, 64_000_000);
        \\}
        \\
        \\test "STM32H723 RCC calculations" {
        \\    const base_file = STM32H723VG;
        \\    const base_tree = try STM32H723VG.get_clocks(.{});
        \\
        \\    const config_tree = try STM32H723VG.get_clocks(.{
        \\        .PLLSourceVirtual = .HSI,
        \\        .DIVM1 = 4,
        \\        .DIVN1 = 34,
        \\        .DIVP1 = 1,
        \\        .SYSCLKSource = .PLL1_P,
        \\        .HPRE = .Div2,
        \\        .D1PPRE = .Div2,
        \\        .D2PPRE1 = .Div2,
        \\        .D2PPRE2 = .Div2,
        \\        .D3PPRE = .Div2,
        \\        .USBCLockSelection = .HSI48,
        \\        .flags = .{ .USB_OTG_FSUsed_ForRCC = true },
        \\    });
        \\
        \\    //if USB use PLL, HSE must to be the source
        \\    try std.testing.expectError(error.InvalidConfig, STM32H723VG.get_clocks(.{
        \\        .PLLSourceVirtual = .HSI,
        \\        .DIVM1 = 4,
        \\        .DIVN1 = 34,
        \\        .DIVP1 = 1,
        \\        .SYSCLKSource = .PLL1_P,
        \\        .HPRE = .Div2,
        \\        .D1PPRE = .Div2,
        \\        .D2PPRE1 = .Div2,
        \\        .D2PPRE2 = .Div2,
        \\        .D3PPRE = .Div2,
        \\        .USBCLockSelection = .PLL1_Q,
        \\        .flags = .{ .USB_OTG_FSUsed_ForRCC = true },
        \\    }));
        \\
        \\    try std.testing.expectEqual(base_tree.clock.AHBOutput, 64_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB1Output, 64_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB2Output, 64_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB3Output, 64_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB4Output, 64_000_000);
        \\    try std.testing.expectEqual(base_tree.config.SYSCLKSource, base_file.RCC_SW.HSI);
        \\
        \\    try std.testing.expectEqual(config_tree.clock.AHBOutput, 272_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB1Output, 136_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB2Output, 136_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB3Output, 136_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB4Output, 136_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.Tim1Output, 272_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.Tim2Output, 272_000_000);
        \\}
        \\
        \\test "STM32U575 RCC calculations" {
        \\    const base_file = STM32U575VG;
        \\    const base_tree = try STM32U575VG.get_clocks(.{});
        \\    const config_tree = try STM32U575VG.get_clocks(.{
        \\        .PLLSourceVirtual = .HSI,
        \\        .PLLM = 1,
        \\        .PLLN = 20,
        \\        .PLL1R = .Div2,
        \\        .SYSCLKSource = .PLL1_R,
        \\        .APB1CLKDivider = .Div4,
        \\        .APB3CLKDivider = .Div2,
        \\        .MSIKClockRange = .RANGE_48MHZ,
        \\        .CK48CLockSelection = .MSIK,
        \\        .LPUART1CLockSelectionVirtual = .PCLK3,
        \\        .flags = .{ .USB_OTG_FSUsed_ForRCC = true, .LPUARTUsed_ForRCC = true },
        \\    });
        \\
        \\    try std.testing.expectEqual(base_tree.clock.AHBOutput, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB1Output, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB2Output, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB3Output, 4_000_000);
        \\    try std.testing.expectEqual(base_tree.config.SYSCLKSource, base_file.RCC_SW.MSIS);
        \\
        \\    try std.testing.expectEqual(config_tree.clock.AHBOutput, 160_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB1Output, 40_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.TimPrescOut1, 80_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB2Output, 160_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB3Output, 80_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.LPUART1output, 80_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.CK48output, 48_000_000);
        \\}
        \\
        \\test "STM32G061 RCC calculations" {
        \\    const base_file = STM32G061C6;
        \\    const base_tree = try STM32G061C6.get_clocks(.{});
        \\    const config_tree = try comptime STM32G061C6.get_clocks(.{
        \\        .PLLM = .Div1,
        \\        .PLLN = 8,
        \\        .TIM1CLockSelectionVirtual = .PLL1_Q,
        \\        .SYSCLKSource = .PLL1_R,
        \\        .flags = .{ .TIM1Used_ForRCC = true },
        \\    });
        \\
        \\    try std.testing.expectError(error.InvalidConfig, STM32G061C6.get_clocks(.{
        \\        .PLLM = .Div1,
        \\        .PLLN = 23,
        \\        .PLLR = .Div3,
        \\        .TIM1CLockSelectionVirtual = .PLL1_Q,
        \\        .SYSCLKSource = .PLL1_R,
        \\
        \\        .flags = .{ .TIM1Used_ForRCC = true },
        \\    }));
        \\
        \\    try std.testing.expectEqual(base_tree.clock.AHBOutput, 16_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APBOutput, 16_000_000);
        \\    try std.testing.expectEqual(base_tree.config.SYSCLKSource, base_file.RCC_SW.HSI);
        \\
        \\    try std.testing.expectEqual(config_tree.clock.AHBOutput, 64_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APBOutput, 64_000_000);
        \\}
        \\
        \\test "STM32F777 RCC calculations" {
        \\    const base_file = STM32F777II;
        \\    const base_tree = try comptime STM32F777II.get_clocks(.{});
        \\    const config_tree = try STM32F777II.get_clocks(.{
        \\        .SYSCLKSource = .PLL1_P,
        \\        .PLLM = 8,
        \\        .PLLN = 216,
        \\        .PLLP = .Div2,
        \\        .APB1CLKDivider = .Div4,
        \\        .APB2CLKDivider = .Div2,
        \\    });
        \\
        \\    try std.testing.expectError(error.Overflow, STM32F777II.get_clocks(.{
        \\        .SYSCLKSource = .PLL1_P,
        \\        .PLLM = 4,
        \\        .PLLN = 108,
        \\        .PLLP = .Div2,
        \\        .APB1CLKDivider = .Div4,
        \\        .APB2CLKDivider = .Div4,
        \\    }));
        \\
        \\    try std.testing.expectEqual(base_tree.clock.AHBOutput, 16_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB1Output, 16_000_000);
        \\    try std.testing.expectEqual(base_tree.clock.APB2Output, 16_000_000);
        \\    try std.testing.expectEqual(base_tree.config.SYSCLKSource, base_file.RCC_SW.HSI);
        \\
        \\    try std.testing.expectEqual(config_tree.clock.AHBOutput, 216_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB1Output, 54_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.TimPrescOut1, 108_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.APB2Output, 108_000_000);
        \\    try std.testing.expectEqual(config_tree.clock.TimPrescOut2, 216_000_000);
        \\}
        \\
    );

    try out.flush();

    const full_name = try out_dir.realpathAlloc(gpa_allocator, DEFAULT_LIBRARY_FILENAME);
    defer gpa_allocator.free(full_name);

    var ch = std.process.Child.init(&[_][]const u8{ "zig", "fmt", full_name }, gpa_allocator);
    _ = try ch.spawnAndWait();
}

//check or create the output directory tree:
//<dir_path>/
// - clocktrees/
//      - util
//            - solver.zig
//   - {tree_name}.zig
// - <library_name>.zig
fn check_or_create_output_dir(dir_path: []const u8) !std.fs.Dir {
    std.fs.cwd().makeDir(dir_path) catch |err| {
        if (err != error.PathAlreadyExists) {
            logger.err("failed to create output directory {s} - error {any}", .{ dir_path, err });
            return err;
        }
    };

    var dir = try std.fs.cwd().openDir(dir_path, .{ .iterate = true });
    dir.makeDir("clocktrees/") catch |err| {
        if (err != error.PathAlreadyExists) {
            logger.err("failed to create clocktrees directory {s} - error {any}", .{ dir_path, err });
            return err;
        }
    };

    dir.makeDir("clocktrees/util/") catch |err| {
        if (err != error.PathAlreadyExists) {
            logger.err("failed to create util directory {s} - error {any}", .{ dir_path, err });
            return err;
        }
    };

    return dir;
}
