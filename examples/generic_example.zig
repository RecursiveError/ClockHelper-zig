const std = @import("std");
const ClockHelper = @import("ClockHelper");

const STM32F103x = ClockHelper.@"STM32F103C(8-B)Tx";

const config = STM32F103x.Config{
    .SYSCLKSource = .RCC_SYSCLKSOURCE_PLLCLK,
    //.PLLSource = .RCC_PLLSOURCE_HSI_DIV2, USB force Pllsource to be HSE
    .PLLMUL = .RCC_PLL_MUL6,
    .APB1CLKDivider = .RCC_HCLK_DIV2,
    .flags = .{ .USBUsed_ForRCC = true, .HSEOscillator = true },
};

const out = STM32F103x.get_clocks(config) catch unreachable;
const Clock = out.clock;

pub fn main() !void {
    @compileLog(std.fmt.comptimePrint(
        \\Corrent OutClocks:
        \\SysClock: {d}Mhz
        \\AHB Clock: {d}Mhz
        \\APB1 Clock: {d}Mhz
        \\TimAPB1: {d}Mhz
        \\APB2 Clock: {d}Mhz
        \\TimAPB2: {d}Mhz
        \\USB: {d}Mhz
        \\
    , .{
        (Clock.SysCLKOutput / 1_000_000),
        (Clock.AHBOutput / 1_000_000),
        (Clock.APB1Output / 1_000_000),
        (Clock.TimPrescOut1 / 1_000_000),
        (Clock.APB2Output / 1_000_000),
        (Clock.TimPrescOut2 / 1_000_000),
        (Clock.USBoutput / 1_000_000),
    }));
}
