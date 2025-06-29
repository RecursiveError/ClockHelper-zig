const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const MSIClockRangeConf = enum {
    RCC_MSIRANGE_0,
    RCC_MSIRANGE_1,
    RCC_MSIRANGE_2,
    RCC_MSIRANGE_3,
    RCC_MSIRANGE_4,
    RCC_MSIRANGE_5,
    RCC_MSIRANGE_6,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSIRANGE_3 => 524.288,
            .RCC_MSIRANGE_4 => 1048,
            .RCC_MSIRANGE_5 => 2097,
            .RCC_MSIRANGE_0 => 65.536,
            .RCC_MSIRANGE_6 => 4194,
            .RCC_MSIRANGE_2 => 262.144,
            .RCC_MSIRANGE_1 => 131.072,
        };
    }
};
pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const RCC_RTC_Clock_Source_FROM_HSEConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV2,
    RCC_RTCCLKSOURCE_HSE_DIV4,
    RCC_RTCCLKSOURCE_HSE_DIV8,
    RCC_RTCCLKSOURCE_HSE_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_RTCCLKSOURCE_HSE_DIV8 => 8,
            .RCC_RTCCLKSOURCE_HSE_DIV2 => 2,
            .RCC_RTCCLKSOURCE_HSE_DIV16 => 16,
            .RCC_RTCCLKSOURCE_HSE_DIV4 => 4,
        };
    }
};
pub const RTCClockSelectionConf = enum {
    HSERTCDevisor,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const AHBCLKDividerConf = enum {
    RCC_SYSCLK_DIV1,
    RCC_SYSCLK_DIV2,
    RCC_SYSCLK_DIV4,
    RCC_SYSCLK_DIV8,
    RCC_SYSCLK_DIV16,
    RCC_SYSCLK_DIV64,
    RCC_SYSCLK_DIV128,
    RCC_SYSCLK_DIV256,
    RCC_SYSCLK_DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_SYSCLK_DIV64 => 64,
            .RCC_SYSCLK_DIV2 => 2,
            .RCC_SYSCLK_DIV512 => 512,
            .RCC_SYSCLK_DIV16 => 16,
            .RCC_SYSCLK_DIV1 => 1,
            .RCC_SYSCLK_DIV4 => 4,
            .RCC_SYSCLK_DIV8 => 8,
            .RCC_SYSCLK_DIV256 => 256,
            .RCC_SYSCLK_DIV128 => 128,
        };
    }
};
pub const TimPrescalerConf = enum {
    SYSTICK_CLKSOURCE_HCLK,
    SYSTICK_CLKSOURCE_HCLK_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .SYSTICK_CLKSOURCE_HCLK => 1,
            .SYSTICK_CLKSOURCE_HCLK_DIV8 => 8,
        };
    }
};
pub const APB1CLKDividerConf = enum {
    RCC_HCLK_DIV1,
    RCC_HCLK_DIV2,
    RCC_HCLK_DIV4,
    RCC_HCLK_DIV8,
    RCC_HCLK_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HCLK_DIV16 => 16,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV1 => 1,
        };
    }
};
pub const APB2CLKDividerConf = enum {
    RCC_HCLK_DIV1,
    RCC_HCLK_DIV2,
    RCC_HCLK_DIV4,
    RCC_HCLK_DIV8,
    RCC_HCLK_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HCLK_DIV16 => 16,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV1 => 1,
        };
    }
};
pub const RCC_MCOSourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCODivConf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_4,
    RCC_MCODIV_8,
    RCC_MCODIV_16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_4 => 4,
        };
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSE,
    RCC_PLLSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLMULConf = enum {
    RCC_PLL_MUL3,
    RCC_PLL_MUL4,
    RCC_PLL_MUL6,
    RCC_PLL_MUL8,
    RCC_PLL_MUL12,
    RCC_PLL_MUL16,
    RCC_PLL_MUL24,
    RCC_PLL_MUL32,
    RCC_PLL_MUL48,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLL_MUL12 => 12,
            .RCC_PLL_MUL48 => 48,
            .RCC_PLL_MUL24 => 24,
            .RCC_PLL_MUL6 => 6,
            .RCC_PLL_MUL3 => 3,
            .RCC_PLL_MUL4 => 4,
            .RCC_PLL_MUL8 => 8,
            .RCC_PLL_MUL32 => 32,
            .RCC_PLL_MUL16 => 16,
        };
    }
};
pub const PLLDIVConf = enum {
    RCC_PLL_DIV2,
    RCC_PLL_DIV3,
    RCC_PLL_DIV4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLL_DIV3 => 3,
            .RCC_PLL_DIV2 => 2,
            .RCC_PLL_DIV4 => 4,
        };
    }
};
pub const HSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const MSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const Config = struct {
    MSIRC: ?MSIClockRangeConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    TIMPrescaler: ?TimPrescalerConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    MCOMult: ?RCC_MCOSourceConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    PLLDIV: ?PLLDIVConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
};

pub const ConfigWithRef = struct {
    MSIClockRange: ?MSIClockRangeConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    TimPrescaler: ?TimPrescalerConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    RCC_MCOSource: ?RCC_MCOSourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    PLLDIV: ?PLLDIVConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .MSIRC = self.MSIClockRange,
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCClockSelection,
            .SysClkSource = self.SYSCLKSource,
            .AHBPrescaler = self.AHBCLKDivider,
            .TIMPrescaler = self.TimPrescaler,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .MCOMult = self.RCC_MCOSource,
            .MCODiv = self.RCC_MCODiv,
            .PLLSource = self.PLLSourceVirtual,
            .PLLMUL = self.PLLMUL,
            .PLLDIV = self.PLLDIV,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSICalibrationValue = self.MSICalibrationValue,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    ADCOutput: ClockNode,
    MSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    LCDOutput: ClockNode,
    IWDGOutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PWROutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    TIMPrescaler: ClockNode,
    TIMOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    PeriphPrescaler: ClockNode,
    PeriphPrescOutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    PLLSource: ClockNode,
    VCOIIuput: ClockNode,
    PLLMUL: ClockNode,
    USBPres: ClockNode,
    PLLDIV: ClockNode,
    USBOutput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const ADCOutputval = ClockNodeTypes{ .output = null };
        const ADCOutput: ClockNode = .{
            .name = "ADCOutput",
            .Nodetype = ADCOutputval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const MSIRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2097;
                }
            },
        } };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = MSIRCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 24000000,
                .limit = .{ .max = 24000000, .min = 1000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 37000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = 1000000, .min = 1000 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const HSERTCDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSERTCDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE,
                        .RCC_RTCCLKSOURCE_LSI,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",
            .Nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{ .output = null };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const LCDOutputval = ClockNodeTypes{ .output = null };
        const LCDOutput: ClockNode = .{
            .name = "LCDOutput",
            .Nodetype = LCDOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const PLLSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &HSIRC,
            },
        };
        const VCOIIuputval = ClockNodeTypes{ .output = null };
        const VCOIIuput: ClockNode = .{
            .name = "VCOIIuput",
            .Nodetype = VCOIIuputval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLMULval = ClockNodeTypes{ .mul = .{
            .value = inner: {
                if (config.PLLMUL) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        } };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = PLLMULval,
            .parents = &[_]*const ClockNode{&VCOIIuput},
        };
        const PLLDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLDIV: ClockNode = .{
            .name = "PLLDIV",
            .Nodetype = PLLDIVval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
                &PLLDIV,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PWROutputval = ClockNodeTypes{ .output = null };
        const PWROutput: ClockNode = .{
            .name = "PWROutput",
            .Nodetype = PWROutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.AHBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TIMPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TIMPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const TIMPrescaler: ClockNode = .{
            .name = "TIMPrescaler",
            .Nodetype = TIMPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TIMOutputval = ClockNodeTypes{ .output = null };
        const TIMOutput: ClockNode = .{
            .name = "TIMOutput",
            .Nodetype = TIMOutputval,
            .parents = &[_]*const ClockNode{&TIMPrescaler},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB1Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1val = blk: {
            if (APB1Prescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = TimPrescalerAPB1val,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOutval = ClockNodeTypes{ .output = null };
        const TimPrescOut: ClockNode = .{
            .name = "TimPrescOut",
            .Nodetype = TimPrescOutval,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB2Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const PeriphPrescalerval = blk: {
            if (APB2Prescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const PeriphPrescaler: ClockNode = .{
            .name = "PeriphPrescaler",
            .Nodetype = PeriphPrescalerval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const PeriphPrescOutputval = ClockNodeTypes{ .output = null };
        const PeriphPrescOutput: ClockNode = .{
            .name = "PeriphPrescOutput",
            .Nodetype = PeriphPrescOutputval,
            .parents = &[_]*const ClockNode{&PeriphPrescaler},
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 5;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &PLLDIV,
                &SysCLKOutput,
                &MSIRC,
            },
        };
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCODiv: ClockNode = .{
            .name = "MCODiv",
            .Nodetype = MCODivval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPinval = ClockNodeTypes{ .output = null };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .Nodetype = MCOPinval,
            .parents = &[_]*const ClockNode{&MCODiv},
        };
        const USBPresval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const USBPres: ClockNode = .{
            .name = "USBPres",
            .Nodetype = USBPresval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBOutputval = ClockNodeTypes{
            .output = .{ .max = 48120000, .min = 47880000 },
        };
        const USBOutput: ClockNode = .{
            .name = "USBOutput",
            .Nodetype = USBOutputval,
            .parents = &[_]*const ClockNode{&USBPres},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = 31, .min = 0 },
            },
        };
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 0,
                .limit = .{ .max = 255, .min = 0 },
            },
        };
        return .{
            .HSIRC = HSIRC,
            .ADCOutput = ADCOutput,
            .MSIRC = MSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .LCDOutput = LCDOutput,
            .IWDGOutput = IWDGOutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PWROutput = PWROutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .TIMPrescaler = TIMPrescaler,
            .TIMOutput = TIMOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut = TimPrescOut,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .PeriphPrescaler = PeriphPrescaler,
            .PeriphPrescOutput = PeriphPrescOutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .PLLSource = PLLSource,
            .VCOIIuput = VCOIIuput,
            .PLLMUL = PLLMUL,
            .USBPres = USBPres,
            .PLLDIV = PLLDIV,
            .USBOutput = USBOutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSICalibrationValue = MSICalibrationValueval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.PWROutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.TIMOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.PeriphPrescOutput.get_comptime();
        _ = self.USBOutput.get_comptime();
    }
};
