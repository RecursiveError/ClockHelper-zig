const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

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
pub const RCC_RTC_Clock_SourceConf = enum {
    HSERTCDevisor,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_RTC_Clock_Source_FROM_HSEConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV2,
    RCC_RTCCLKSOURCE_HSE_DIV3,
    RCC_RTCCLKSOURCE_HSE_DIV4,
    RCC_RTCCLKSOURCE_HSE_DIV5,
    RCC_RTCCLKSOURCE_HSE_DIV6,
    RCC_RTCCLKSOURCE_HSE_DIV7,
    RCC_RTCCLKSOURCE_HSE_DIV8,
    RCC_RTCCLKSOURCE_HSE_DIV9,
    RCC_RTCCLKSOURCE_HSE_DIV10,
    RCC_RTCCLKSOURCE_HSE_DIV11,
    RCC_RTCCLKSOURCE_HSE_DIV12,
    RCC_RTCCLKSOURCE_HSE_DIV13,
    RCC_RTCCLKSOURCE_HSE_DIV14,
    RCC_RTCCLKSOURCE_HSE_DIV15,
    RCC_RTCCLKSOURCE_HSE_DIV16,
    RCC_RTCCLKSOURCE_HSE_DIV17,
    RCC_RTCCLKSOURCE_HSE_DIV18,
    RCC_RTCCLKSOURCE_HSE_DIV19,
    RCC_RTCCLKSOURCE_HSE_DIV20,
    RCC_RTCCLKSOURCE_HSE_DIV21,
    RCC_RTCCLKSOURCE_HSE_DIV22,
    RCC_RTCCLKSOURCE_HSE_DIV23,
    RCC_RTCCLKSOURCE_HSE_DIV24,
    RCC_RTCCLKSOURCE_HSE_DIV25,
    RCC_RTCCLKSOURCE_HSE_DIV26,
    RCC_RTCCLKSOURCE_HSE_DIV27,
    RCC_RTCCLKSOURCE_HSE_DIV28,
    RCC_RTCCLKSOURCE_HSE_DIV29,
    RCC_RTCCLKSOURCE_HSE_DIV30,
    RCC_RTCCLKSOURCE_HSE_DIV31,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_RTCCLKSOURCE_HSE_DIV6 => 6,
            .RCC_RTCCLKSOURCE_HSE_DIV29 => 29,
            .RCC_RTCCLKSOURCE_HSE_DIV26 => 26,
            .RCC_RTCCLKSOURCE_HSE_DIV28 => 28,
            .RCC_RTCCLKSOURCE_HSE_DIV5 => 5,
            .RCC_RTCCLKSOURCE_HSE_DIV7 => 7,
            .RCC_RTCCLKSOURCE_HSE_DIV9 => 9,
            .RCC_RTCCLKSOURCE_HSE_DIV19 => 19,
            .RCC_RTCCLKSOURCE_HSE_DIV18 => 18,
            .RCC_RTCCLKSOURCE_HSE_DIV30 => 30,
            .RCC_RTCCLKSOURCE_HSE_DIV16 => 16,
            .RCC_RTCCLKSOURCE_HSE_DIV3 => 3,
            .RCC_RTCCLKSOURCE_HSE_DIV24 => 24,
            .RCC_RTCCLKSOURCE_HSE_DIV12 => 12,
            .RCC_RTCCLKSOURCE_HSE_DIV23 => 23,
            .RCC_RTCCLKSOURCE_HSE_DIV2 => 2,
            .RCC_RTCCLKSOURCE_HSE_DIV15 => 15,
            .RCC_RTCCLKSOURCE_HSE_DIV10 => 10,
            .RCC_RTCCLKSOURCE_HSE_DIV31 => 31,
            .RCC_RTCCLKSOURCE_HSE_DIV17 => 17,
            .RCC_RTCCLKSOURCE_HSE_DIV27 => 27,
            .RCC_RTCCLKSOURCE_HSE_DIV14 => 14,
            .RCC_RTCCLKSOURCE_HSE_DIV21 => 21,
            .RCC_RTCCLKSOURCE_HSE_DIV4 => 4,
            .RCC_RTCCLKSOURCE_HSE_DIV13 => 13,
            .RCC_RTCCLKSOURCE_HSE_DIV11 => 11,
            .RCC_RTCCLKSOURCE_HSE_DIV22 => 22,
            .RCC_RTCCLKSOURCE_HSE_DIV25 => 25,
            .RCC_RTCCLKSOURCE_HSE_DIV8 => 8,
            .RCC_RTCCLKSOURCE_HSE_DIV20 => 20,
        };
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
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
pub const Cortex_DivConf = enum {
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
pub const I2SClockSourceConf = enum {
    RCC_I2SAPBCLKSOURCE_PLLR,
    RCC_I2SAPBCLKSOURCE_PLLSRC,
    RCC_I2SAPBCLKSOURCE_EXT,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FMPI2C1SelectionConf = enum {
    RCC_FMPI2C1CLKSOURCE_HSI,
    RCC_FMPI2C1CLKSOURCE_APB,
    RCC_FMPI2C1CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCODiv1Conf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_3,
    RCC_MCODIV_4,
    RCC_MCODIV_5,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_5 => 5,
            .RCC_MCODIV_3 => 3,
            .RCC_MCODIV_4 => 4,
        };
    }
};
pub const RCC_MCO2SourceConf = enum {
    RCC_MCO2SOURCE_SYSCLK,
    RCC_MCO2SOURCE_I2SCLK,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCODiv2Conf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_3,
    RCC_MCODIV_4,
    RCC_MCODIV_5,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_5 => 5,
            .RCC_MCODIV_3 => 3,
            .RCC_MCODIV_4 => 4,
        };
    }
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLPConf = enum {
    RCC_PLLP_DIV2,
    RCC_PLLP_DIV4,
    RCC_PLLP_DIV6,
    RCC_PLLP_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV8 => 8,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV2 => 2,
        };
    }
};
pub const PLLQConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLRConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
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
pub const RCC_TIM_PRescaler_SelectionConf = enum {
    RCC_TIMPRES_ACTIVATED,
    RCC_TIMPRES_DESACTIVATED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TIMPRES_DESACTIVATED => 1,
            .RCC_TIMPRES_ACTIVATED => 0,
        };
    }
};
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const Config = struct {
    HSEOSC: ?HSE_VALUEConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    RTCClkSource: ?RCC_RTC_Clock_SourceConf = null,
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    I2SSrc: ?I2SClockSourceConf = null,
    FMPI2C1Mult: ?FMPI2C1SelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionConf = null,
    MCO1Mult: ?RCC_MCO1SourceConf = null,
    MCO1Div: ?RCC_MCODiv1Conf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCODiv2Conf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    RCC_RTC_Clock_Source: ?RCC_RTC_Clock_SourceConf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    I2SClockSource: ?I2SClockSourceConf = null,
    FMPI2C1Selection: ?FMPI2C1SelectionConf = null,
    LPTIM1CLockSelection: ?LPTIM1CLockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv1: ?RCC_MCODiv1Conf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCODiv2: ?RCC_MCODiv2Conf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .RTCClkSource = self.RCC_RTC_Clock_Source,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .I2SSrc = self.I2SClockSource,
            .FMPI2C1Mult = self.FMPI2C1Selection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .MCO1Mult = self.RCC_MCO1Source,
            .MCO1Div = self.RCC_MCODiv1,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCODiv2,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLR = self.PLLR,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .RCC_TIM_PRescaler_Selection = self.RCC_TIM_PRescaler_Selection,
            .HSICalibrationValue = self.HSICalibrationValue,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    SysClkSource: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    AHBPrescaler: ClockNode,
    SysCLKOutput: ClockNode,
    EthernetPtpOutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    PeriphPrescaler: ClockNode,
    PeriphPrescOutput: ClockNode,
    USBOTGOutput: ClockNode,
    I2SSrc: ClockNode,
    I2S_CKIN: ClockNode,
    I2SClocksOutput: ClockNode,
    FMPI2C1Mult: ClockNode,
    FMPI2C1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLR: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    RCC_TIM_PRescaler_Selection: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 25000000,
                .limit = .{ .max = 26000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = 1000000, .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const HSERTCDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSERTCDevisor) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_HSE_DIV2,
                        .RCC_RTCCLKSOURCE_HSE_DIV3,
                        .RCC_RTCCLKSOURCE_HSE_DIV4,
                        .RCC_RTCCLKSOURCE_HSE_DIV5,
                        .RCC_RTCCLKSOURCE_HSE_DIV6,
                        .RCC_RTCCLKSOURCE_HSE_DIV7,
                        .RCC_RTCCLKSOURCE_HSE_DIV8,
                        .RCC_RTCCLKSOURCE_HSE_DIV9,
                        .RCC_RTCCLKSOURCE_HSE_DIV10,
                        .RCC_RTCCLKSOURCE_HSE_DIV11,
                        .RCC_RTCCLKSOURCE_HSE_DIV12,
                        .RCC_RTCCLKSOURCE_HSE_DIV13,
                        .RCC_RTCCLKSOURCE_HSE_DIV14,
                        .RCC_RTCCLKSOURCE_HSE_DIV15,
                        .RCC_RTCCLKSOURCE_HSE_DIV16,
                        .RCC_RTCCLKSOURCE_HSE_DIV17,
                        .RCC_RTCCLKSOURCE_HSE_DIV18,
                        .RCC_RTCCLKSOURCE_HSE_DIV19,
                        .RCC_RTCCLKSOURCE_HSE_DIV20,
                        .RCC_RTCCLKSOURCE_HSE_DIV21,
                        .RCC_RTCCLKSOURCE_HSE_DIV22,
                        .RCC_RTCCLKSOURCE_HSE_DIV23,
                        .RCC_RTCCLKSOURCE_HSE_DIV24,
                        .RCC_RTCCLKSOURCE_HSE_DIV25,
                        .RCC_RTCCLKSOURCE_HSE_DIV26,
                        .RCC_RTCCLKSOURCE_HSE_DIV27,
                        .RCC_RTCCLKSOURCE_HSE_DIV28,
                        .RCC_RTCCLKSOURCE_HSE_DIV29,
                        .RCC_RTCCLKSOURCE_HSE_DIV30,
                        .RCC_RTCCLKSOURCE_HSE_DIV31,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
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
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const PLLSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSource) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_HSI,
                        .RCC_PLLSOURCE_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLM) |val| val.get() else 16,
                .limit = .{ .max = 63, .min = 2 },
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 192,
                .limit = .{ .max = 432, .min = 50 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLP) |val| {
                    switch (val) {
                        .RCC_PLLP_DIV2,
                        .RCC_PLLP_DIV4,
                        .RCC_PLLP_DIV6,
                        .RCC_PLLP_DIV8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = PLLPval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_HSI,
                        .RCC_SYSCLKSOURCE_HSE,
                        .RCC_SYSCLKSOURCE_PLLCLK,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &PLLP,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const AHBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.AHBPrescaler) |val| {
                    switch (val) {
                        .RCC_SYSCLK_DIV1,
                        .RCC_SYSCLK_DIV2,
                        .RCC_SYSCLK_DIV4,
                        .RCC_SYSCLK_DIV8,
                        .RCC_SYSCLK_DIV16,
                        .RCC_SYSCLK_DIV64,
                        .RCC_SYSCLK_DIV128,
                        .RCC_SYSCLK_DIV256,
                        .RCC_SYSCLK_DIV512,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
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
        const EthernetPtpOutputval = ClockNodeTypes{ .output = null };
        const EthernetPtpOutput: ClockNode = .{
            .name = "EthernetPtpOutput",
            .Nodetype = EthernetPtpOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
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
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    switch (val) {
                        .SYSTICK_CLKSOURCE_HCLK,
                        .SYSTICK_CLKSOURCE_HCLK_DIV8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
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
                    switch (val) {
                        .RCC_HCLK_DIV1,
                        .RCC_HCLK_DIV2,
                        .RCC_HCLK_DIV4,
                        .RCC_HCLK_DIV8,
                        .RCC_HCLK_DIV16,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
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
            .output = .{ .max = 50000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const RCC_TIM_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_PRescaler_Selection) |val| {
                    switch (val) {
                        .RCC_TIMPRES_ACTIVATED,
                        .RCC_TIMPRES_DESACTIVATED,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const TimPrescalerAPB1val = blk: {
            if (((APB1Prescalerval.num_val() == 1) and (RCC_TIM_PRescaler_Selectionval.num_val() == 1))) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else if ((RCC_TIM_PRescaler_Selectionval.num_val() == 1)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            } else if ((APB1Prescalerval.num_val() == 1) and (RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else if ((APB1Prescalerval.num_val() == 2) and (RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            } else if ((APB1Prescalerval.num_val() == 4) and (RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 4 },
                };
            } else if ((RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 4 },
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
                    switch (val) {
                        .RCC_HCLK_DIV1,
                        .RCC_HCLK_DIV2,
                        .RCC_HCLK_DIV4,
                        .RCC_HCLK_DIV8,
                        .RCC_HCLK_DIV16,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const PeriphPrescalerval = blk: {
            if (((APB2Prescalerval.num_val() == 1) and (RCC_TIM_PRescaler_Selectionval.num_val() == 1))) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else if ((RCC_TIM_PRescaler_Selectionval.num_val() == 1)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            } else if ((APB2Prescalerval.num_val() == 1) and (RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else if ((APB2Prescalerval.num_val() == 2) and (RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            } else if ((APB2Prescalerval.num_val() == 4) and (RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 4 },
                };
            } else if ((RCC_TIM_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 4 },
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
        const PLLQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLQ) |val| val.get() else 4,
                .limit = .{ .max = 15, .min = 2 },
            },
        };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const USBOTGOutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const USBOTGOutput: ClockNode = .{
            .name = "USBOTGOutput",
            .Nodetype = USBOTGOutputval,
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const PLLRval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLR) |val| val.get() else 2,
                .limit = .{ .max = 7, .min = 2 },
            },
        };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = PLLRval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
        };
        const I2SSrcval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2SSrc) |val| {
                    switch (val) {
                        .RCC_I2SAPBCLKSOURCE_PLLR,
                        .RCC_I2SAPBCLKSOURCE_PLLSRC,
                        .RCC_I2SAPBCLKSOURCE_EXT,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const I2SSrc: ClockNode = .{
            .name = "I2SSrc",
            .Nodetype = I2SSrcval,

            .parents = &[_]*const ClockNode{
                &PLLR,
                &PLLSource,
                &I2S_CKIN,
            },
        };
        const I2SClocksOutputval = ClockNodeTypes{
            .output = .{ .max = 192000000, .min = 0 },
        };
        const I2SClocksOutput: ClockNode = .{
            .name = "I2SClocksOutput",
            .Nodetype = I2SClocksOutputval,
            .parents = &[_]*const ClockNode{&I2SSrc},
        };
        const FMPI2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.FMPI2C1Mult) |val| {
                    switch (val) {
                        .RCC_FMPI2C1CLKSOURCE_HSI,
                        .RCC_FMPI2C1CLKSOURCE_APB,
                        .RCC_FMPI2C1CLKSOURCE_SYSCLK,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        };
        const FMPI2C1Mult: ClockNode = .{
            .name = "FMPI2C1Mult",
            .Nodetype = FMPI2C1Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &APB1Prescaler,
                &SysCLKOutput,
            },
        };
        const FMPI2C1outputval = ClockNodeTypes{ .output = null };
        const FMPI2C1output: ClockNode = .{
            .name = "FMPI2C1output",
            .Nodetype = FMPI2C1outputval,
            .parents = &[_]*const ClockNode{&FMPI2C1Mult},
        };
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_PCLK,
                        .RCC_LPTIM1CLKSOURCE_LSI,
                        .RCC_LPTIM1CLKSOURCE_HSI,
                        .RCC_LPTIM1CLKSOURCE_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIRC,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM1outputval = ClockNodeTypes{ .output = null };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const MCO1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO1Mult) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_LSE,
                        .RCC_MCO1SOURCE_HSE,
                        .RCC_MCO1SOURCE_HSI,
                        .RCC_MCO1SOURCE_PLLCLK,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",
            .Nodetype = MCO1Multval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &HSEOSC,
                &HSIRC,
                &PLLP,
            },
        };
        const MCO1Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO1Div) |val| {
                    switch (val) {
                        .RCC_MCODIV_1,
                        .RCC_MCODIV_2,
                        .RCC_MCODIV_3,
                        .RCC_MCODIV_4,
                        .RCC_MCODIV_5,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCO1Div: ClockNode = .{
            .name = "MCO1Div",
            .Nodetype = MCO1Divval,
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO1Pinval = ClockNodeTypes{ .output = null };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = MCO1Pinval,
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    switch (val) {
                        .RCC_MCO2SOURCE_SYSCLK,
                        .RCC_MCO2SOURCE_I2SCLK,
                        .RCC_MCO2SOURCE_HSE,
                        .RCC_MCO2SOURCE_PLLCLK,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .Nodetype = MCO2Multval,

            .parents = &[_]*const ClockNode{
                &SysClkSource,
                &PLLR,
                &HSEOSC,
                &PLLP,
            },
        };
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    switch (val) {
                        .RCC_MCODIV_1,
                        .RCC_MCODIV_2,
                        .RCC_MCODIV_3,
                        .RCC_MCODIV_4,
                        .RCC_MCODIV_5,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .Nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
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
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .SysClkSource = SysClkSource,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .AHBPrescaler = AHBPrescaler,
            .SysCLKOutput = SysCLKOutput,
            .EthernetPtpOutput = EthernetPtpOutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut = TimPrescOut,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .PeriphPrescaler = PeriphPrescaler,
            .PeriphPrescOutput = PeriphPrescOutput,
            .USBOTGOutput = USBOTGOutput,
            .I2SSrc = I2SSrc,
            .I2S_CKIN = I2S_CKIN,
            .I2SClocksOutput = I2SClocksOutput,
            .FMPI2C1Mult = FMPI2C1Mult,
            .FMPI2C1output = FMPI2C1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLR = PLLR,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval,
            .HSICalibrationValue = HSICalibrationValueval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.EthernetPtpOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.PeriphPrescOutput.get_comptime();
        _ = self.USBOTGOutput.get_comptime();
        _ = self.I2SClocksOutput.get_comptime();
        _ = self.FMPI2C1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
    }
};
