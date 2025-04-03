const std = @import("std");
const ClockHelper = @import("ClockHelper");

const STM32F103x = ClockHelper.@"STM32F103C(8-B)Tx";

const config = STM32F103x.Config{};
const Clock = STM32F103x.ClockTree.init_comptime(config);
const conf_text = ClockHelper.print_clock_configs(config);

pub fn main() !void {
    std.debug.print("Corrent Config:\n{s}\n", .{conf_text.*});

    std.debug.print(
        \\Corrent OutClocks:
        \\SysClock: {d}Mhz
        \\AHB Clock: {d}Mhz
        \\APB1 Clock: {d}Mhz
        \\APB2 Clock: {d}Mhz
        \\
    , .{
        (Clock.SysCLKOutput.get_comptime() / 1_000_000),
        (Clock.AHBOutput.get_comptime() / 1_000_000),
        (Clock.APB1Output.get_comptime() / 1_000_000),
        (Clock.APB2Output.get_comptime() / 1_000_000),
    });
}
