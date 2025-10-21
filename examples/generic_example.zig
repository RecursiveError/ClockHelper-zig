const std = @import("std");
const ClockHelper = @import("ClockHelper");

const STM32F103x = ClockHelper.@"STM32F103C(8-B)Tx";

const config = STM32F103x.Config{
    .PLLSource = .RCC_PLLSOURCE_HSE,
    .PLLMUL = .RCC_PLL_MUL9,
    .SysClkSource = .RCC_SYSCLKSOURCE_PLLCLK,
    .APB1Prescaler = .RCC_HCLK_DIV2,
};
const Clock = STM32F103x.ClockTree.init(config);
const conf_text = ClockHelper.print_clock_configs(config);

pub fn main() !void {
    std.debug.print("Corrent Config:\n{s}\n", .{conf_text});
    var runtime_clock = STM32F103x.ClockTree.init(.{});
    try runtime_clock.init_runtime_tree(std.heap.page_allocator);
    defer runtime_clock.deinit_runtime_tree(std.heap.page_allocator);
    try runtime_clock.runtime_apply(config);

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

    std.debug.print(
        \\Corrent OutClocks:
        \\SysClock: {any}
        \\AHB Clock: {any}
        \\APB1 Clock: {any}
        \\APB2 Clock: {any}
        \\TIMER APB1: {any}
        \\TIMER APB2: {any}
        \\
    , .{
        runtime_clock.SysCLKOutput.get(),
        runtime_clock.AHBOutput.get(),
        runtime_clock.APB1Output.get(),
        runtime_clock.APB2Output.get(),
        runtime_clock.TimPrescOut1.get(),
        runtime_clock.TimPrescOut2.get(),
    });
}
