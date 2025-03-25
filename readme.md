# ClockHelper

ClockHelper is a utility to facilitate clock management on STM32 microcontrollers.

## usage

To use it, it's very simple:

Choose a controller from the [list](src/ClockTrees/):
```zig

const ClockHelper = @import("ClockHelper");

const STM32F103x = ClockHelper.@"STM32F103C(8-B)Tx";
```

Create a clock using the settings you want to use:

```zig
const config = STM32F103x.Config{};
const Clock = STM32F103x.Clock(config);
```

And that's it, ClockHelper will give you the clock value of each peripheral for this setting, and it will also warn you if a setting is invalid!

```zig
const std = @import("std");
const ClockHelper = @import("ClockHelper");

const STM32F103x = ClockHelper.@"STM32F103C(8-B)Tx";

const config = STM32F103x.Config{};
const Clock = STM32F103x.Clock(config);
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
        (Clock.SysCLKOutput.get() / 1_000_000),
        (Clock.AHBOutput.get() / 1_000_000),
        (Clock.APB1Output.get() / 1_000_000),
        (Clock.APB2Output.get() / 1_000_000),
    });
}

```




