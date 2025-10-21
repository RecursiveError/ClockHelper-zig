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
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
    RCC_SYSCLKSOURCE_PLLRCLK,

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
pub const PLLSAIMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLI2SMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
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
pub const RCC_RTC_Clock_SourceVirtualConf = enum {
    HSERTCDevisor,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CECClockSelectionConf = enum {
    RCC_CECCLKSOURCE_HSI,
    RCC_CECCLKSOURCE_LSE,

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
pub const USBCLockSelectionConf = enum {
    RCC_CLK48CLKSOURCE_PLLQ,
    RCC_CLK48CLKSOURCE_PLLSAIP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPDIFCLockSelectionConf = enum {
    RCC_SPDIFRXCLKSOURCE_PLLR,
    RCC_SPDIFRXCLKSOURCE_PLLI2SP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SDIOCLockSelectionConf = enum {
    RCC_SDIOCLKSOURCE_SYSCLK,
    RCC_SDIOCLKSOURCE_CLK48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAIACLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_EXT,
    RCC_SAI1CLKSOURCE_PLLR,
    RCC_SAI1CLKSOURCE_PLLI2S,
    RCC_SAI1CLKSOURCE_PLLSAI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAIBCLockSelectionConf = enum {
    RCC_SAI2CLKSOURCE_PLLSRC,
    RCC_SAI2CLKSOURCE_PLLR,
    RCC_SAI2CLKSOURCE_PLLI2S,
    RCC_SAI2CLKSOURCE_PLLSAI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2S1CLockSelectionConf = enum {
    RCC_I2SAPB1CLKSOURCE_PLLSRC,
    RCC_I2SAPB1CLKSOURCE_PLLR,
    RCC_I2SAPB1CLKSOURCE_EXT,
    RCC_I2SAPB1CLKSOURCE_PLLI2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2S2CLockSelectionConf = enum {
    RCC_I2SAPB2CLKSOURCE_PLLSRC,
    RCC_I2SAPB2CLKSOURCE_PLLR,
    RCC_I2SAPB2CLKSOURCE_EXT,
    RCC_I2SAPB2CLKSOURCE_PLLI2S,

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
    RCC_MCO2SOURCE_PLLI2SCLK,
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
pub const PLLSAINConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLSAIPConf = enum {
    RCC_PLLSAIP_DIV2,
    RCC_PLLSAIP_DIV4,
    RCC_PLLSAIP_DIV6,
    RCC_PLLSAIP_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLSAIP_DIV6 => 6,
            .RCC_PLLSAIP_DIV4 => 4,
            .RCC_PLLSAIP_DIV2 => 2,
            .RCC_PLLSAIP_DIV8 => 8,
        };
    }
};
pub const PLLSAIQConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLSAIQDivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLI2SNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLI2SPConf = enum {
    RCC_PLLI2SP_DIV2,
    RCC_PLLI2SP_DIV4,
    RCC_PLLI2SP_DIV6,
    RCC_PLLI2SP_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLI2SP_DIV8 => 8,
            .RCC_PLLI2SP_DIV2 => 2,
            .RCC_PLLI2SP_DIV6 => 6,
            .RCC_PLLI2SP_DIV4 => 4,
        };
    }
};
pub const PLLI2SQConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLI2SQDivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLI2SRConf = enum(u32) {
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
pub const Config = struct {
    HSEOSC: ?HSE_VALUEConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    PLLSAIM: ?PLLSAIMConf = null,
    PLLI2SM: ?PLLI2SMConf = null,
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RCC_RTC_Clock_SourceVirtualConf = null,
    CECMult: ?CECClockSelectionConf = null,
    FMPI2C1Mult: ?FMPI2C1SelectionConf = null,
    USBMult: ?USBCLockSelectionConf = null,
    SPDIFMult: ?SPDIFCLockSelectionConf = null,
    SDIOMult: ?SDIOCLockSelectionConf = null,
    SAIAMult: ?SAIACLockSelectionConf = null,
    SAIBMult: ?SAIBCLockSelectionConf = null,
    I2S1Mult: ?I2S1CLockSelectionConf = null,
    I2S2Mult: ?I2S2CLockSelectionConf = null,
    MCO1Mult: ?RCC_MCO1SourceConf = null,
    MCO1Div: ?RCC_MCODiv1Conf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCODiv2Conf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    PLLSAIN: ?PLLSAINConf = null,
    PLLSAIP: ?PLLSAIPConf = null,
    PLLSAIQ: ?PLLSAIQConf = null,
    PLLSAIQDiv: ?PLLSAIQDivConf = null,
    PLLI2SN: ?PLLI2SNConf = null,
    PLLI2SP: ?PLLI2SPConf = null,
    PLLI2SQ: ?PLLI2SQConf = null,
    PLLI2SQDiv: ?PLLI2SQDivConf = null,
    PLLI2SR: ?PLLI2SRConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    PLLSAIM: ?PLLSAIMConf = null,
    PLLI2SM: ?PLLI2SMConf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RCC_RTC_Clock_SourceVirtual: ?RCC_RTC_Clock_SourceVirtualConf = null,
    CECClockSelection: ?CECClockSelectionConf = null,
    FMPI2C1Selection: ?FMPI2C1SelectionConf = null,
    USBCLockSelection: ?USBCLockSelectionConf = null,
    SPDIFCLockSelection: ?SPDIFCLockSelectionConf = null,
    SDIOCLockSelection: ?SDIOCLockSelectionConf = null,
    SAIACLockSelection: ?SAIACLockSelectionConf = null,
    SAIBCLockSelection: ?SAIBCLockSelectionConf = null,
    I2S1CLockSelection: ?I2S1CLockSelectionConf = null,
    I2S2CLockSelection: ?I2S2CLockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv1: ?RCC_MCODiv1Conf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCODiv2: ?RCC_MCODiv2Conf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    PLLSAIN: ?PLLSAINConf = null,
    PLLSAIP: ?PLLSAIPConf = null,
    PLLSAIQ: ?PLLSAIQConf = null,
    PLLSAIQDiv: ?PLLSAIQDivConf = null,
    PLLI2SN: ?PLLI2SNConf = null,
    PLLI2SP: ?PLLI2SPConf = null,
    PLLI2SQ: ?PLLI2SQConf = null,
    PLLI2SQDiv: ?PLLI2SQDivConf = null,
    PLLI2SR: ?PLLI2SRConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .PLLSAIM = self.PLLSAIM,
            .PLLI2SM = self.PLLI2SM,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RCC_RTC_Clock_SourceVirtual,
            .CECMult = self.CECClockSelection,
            .FMPI2C1Mult = self.FMPI2C1Selection,
            .USBMult = self.USBCLockSelection,
            .SPDIFMult = self.SPDIFCLockSelection,
            .SDIOMult = self.SDIOCLockSelection,
            .SAIAMult = self.SAIACLockSelection,
            .SAIBMult = self.SAIBCLockSelection,
            .I2S1Mult = self.I2S1CLockSelection,
            .I2S2Mult = self.I2S2CLockSelection,
            .MCO1Mult = self.RCC_MCO1Source,
            .MCO1Div = self.RCC_MCODiv1,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCODiv2,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLR = self.PLLR,
            .PLLSAIN = self.PLLSAIN,
            .PLLSAIP = self.PLLSAIP,
            .PLLSAIQ = self.PLLSAIQ,
            .PLLSAIQDiv = self.PLLSAIQDiv,
            .PLLI2SN = self.PLLI2SN,
            .PLLI2SP = self.PLLI2SP,
            .PLLI2SQ = self.PLLI2SQ,
            .PLLI2SQDiv = self.PLLI2SQDiv,
            .PLLI2SR = self.PLLI2SR,
            .HSICalibrationValue = self.HSICalibrationValue,
            .RCC_TIM_PRescaler_Selection = self.RCC_TIM_PRescaler_Selection,
        };
    }
};

pub const ClockTree = struct {
    const Self = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    I2S_CKIN: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    PLLSAIM: ClockNode,
    PLLI2SM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    HSIDivCEC: ClockNode,
    CECMult: ClockNode,
    CECOutput: ClockNode,
    FMPI2C1Mult: ClockNode,
    FMPI2C1output: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    SPDIFMult: ClockNode,
    SPDIFoutput: ClockNode,
    SDIOMult: ClockNode,
    SDIOoutput: ClockNode,
    SAIAMult: ClockNode,
    SAIAoutput: ClockNode,
    SAIBMult: ClockNode,
    SAIBoutput: ClockNode,
    I2S1Mult: ClockNode,
    I2S1output: ClockNode,
    I2S2Mult: ClockNode,
    I2S2output: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    AHBPrescaler: ClockNode,
    PWRCLKoutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLR: ClockNode,
    PLLSAIN: ClockNode,
    PLLSAIP: ClockNode,
    PLLSAIoutput: ClockNode,
    PLLSAIQ: ClockNode,
    PLLSAIQDiv: ClockNode,
    PLLI2SN: ClockNode,
    PLLI2SP: ClockNode,
    PLLI2Soutput: ClockNode,
    PLLI2SQ: ClockNode,
    PLLI2SQDiv: ClockNode,
    PLLI2SR: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    RCC_TIM_PRescaler_Selection: ClockNodeTypes,

    pub fn init(comptime config: Config) Self {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .nodetype = HSIRCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 25000000,
                .limit = .{ .max = @min(1_000_000_000, 26000000), .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .nodetype = LSEOSCval,
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .nodetype = I2S_CKINval,
        };
        const PLLSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLM) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 192,
                .limit = .{ .max = @min(1_000_000_000, 432), .min = 50 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .nodetype = PLLPval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLLRval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLR) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 2 },
            },
        };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .nodetype = PLLRval,
            .parents = &[_]*const ClockNode{&PLLN},
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
            .nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &PLLP,
                &PLLR,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 180000000), .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PLLSAIMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIM) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        const PLLSAIM: ClockNode = .{
            .name = "PLLSAIM",
            .nodetype = PLLSAIMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLI2SMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SM) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        const PLLI2SM: ClockNode = .{
            .name = "PLLI2SM",
            .nodetype = PLLI2SMval,
            .parents = &[_]*const ClockNode{&PLLSource},
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
            .nodetype = HSERTCDevisorval,
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
            .nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{ .output = null };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const HSIDivCECval = ClockNodeTypes{
            .div = .{ .value = 488 },
        };
        const HSIDivCEC: ClockNode = .{
            .name = "HSIDivCEC",
            .nodetype = HSIDivCECval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const CECMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CECMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",
            .nodetype = CECMultval,

            .parents = &[_]*const ClockNode{
                &HSIDivCEC,
                &LSEOSC,
            },
        };
        const CECOutputval = ClockNodeTypes{ .output = null };
        const CECOutput: ClockNode = .{
            .name = "CECOutput",
            .nodetype = CECOutputval,
            .parents = &[_]*const ClockNode{&CECMult},
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
            .nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 180000000), .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
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
            .nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const FMPI2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.FMPI2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const FMPI2C1Mult: ClockNode = .{
            .name = "FMPI2C1Mult",
            .nodetype = FMPI2C1Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &APB1Prescaler,
                &SysCLKOutput,
            },
        };
        const FMPI2C1outputval = ClockNodeTypes{ .output = null };
        const FMPI2C1output: ClockNode = .{
            .name = "FMPI2C1output",
            .nodetype = FMPI2C1outputval,
            .parents = &[_]*const ClockNode{&FMPI2C1Mult},
        };
        const PLLQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLQ) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 15), .min = 2 },
            },
        };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLLSAINval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLSAIN) |val| val.get() else 192,
                .limit = .{ .max = @min(1_000_000_000, 432), .min = 50 },
            },
        };
        const PLLSAIN: ClockNode = .{
            .name = "PLLSAIN",
            .nodetype = PLLSAINval,
            .parents = &[_]*const ClockNode{&PLLSAIM},
        };
        const PLLSAIPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLSAIP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLSAIP: ClockNode = .{
            .name = "PLLSAIP",
            .nodetype = PLLSAIPval,
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const USBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USBMult: ClockNode = .{
            .name = "USBMult",
            .nodetype = USBMultval,

            .parents = &[_]*const ClockNode{
                &PLLQ,
                &PLLSAIP,
            },
        };
        const USBoutputval = ClockNodeTypes{ .output = null };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const PLLI2SNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLI2SN) |val| val.get() else 192,
                .limit = .{ .max = @min(1_000_000_000, 432), .min = 50 },
            },
        };
        const PLLI2SN: ClockNode = .{
            .name = "PLLI2SN",
            .nodetype = PLLI2SNval,
            .parents = &[_]*const ClockNode{&PLLI2SM},
        };
        const PLLI2SPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLI2SP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLI2SP: ClockNode = .{
            .name = "PLLI2SP",
            .nodetype = PLLI2SPval,
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const SPDIFMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPDIFMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPDIFMult: ClockNode = .{
            .name = "SPDIFMult",
            .nodetype = SPDIFMultval,

            .parents = &[_]*const ClockNode{
                &PLLR,
                &PLLI2SP,
            },
        };
        const SPDIFoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 0), .min = 5632000 },
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .nodetype = SPDIFoutputval,
            .parents = &[_]*const ClockNode{&SPDIFMult},
        };
        const SDIOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDIOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const SDIOMult: ClockNode = .{
            .name = "SDIOMult",
            .nodetype = SDIOMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &USBMult,
            },
        };
        const SDIOoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const SDIOoutput: ClockNode = .{
            .name = "SDIOoutput",
            .nodetype = SDIOoutputval,
            .parents = &[_]*const ClockNode{&SDIOMult},
        };
        const PLLI2SQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SQ) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 15), .min = 2 },
            },
        };
        const PLLI2SQ: ClockNode = .{
            .name = "PLLI2SQ",
            .nodetype = PLLI2SQval,
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const PLLI2SQDivval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SQDiv) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 32), .min = 1 },
            },
        };
        const PLLI2SQDiv: ClockNode = .{
            .name = "PLLI2SQDiv",
            .nodetype = PLLI2SQDivval,
            .parents = &[_]*const ClockNode{&PLLI2SQ},
        };
        const PLLSAIQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIQ) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 15), .min = 2 },
            },
        };
        const PLLSAIQ: ClockNode = .{
            .name = "PLLSAIQ",
            .nodetype = PLLSAIQval,
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAIQDivval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIQDiv) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 32), .min = 1 },
            },
        };
        const PLLSAIQDiv: ClockNode = .{
            .name = "PLLSAIQDiv",
            .nodetype = PLLSAIQDivval,
            .parents = &[_]*const ClockNode{&PLLSAIQ},
        };
        const SAIAMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAIAMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const SAIAMult: ClockNode = .{
            .name = "SAIAMult",
            .nodetype = SAIAMultval,

            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &PLLR,
                &PLLI2SQDiv,
                &PLLSAIQDiv,
            },
        };
        const SAIAoutputval = ClockNodeTypes{ .output = null };
        const SAIAoutput: ClockNode = .{
            .name = "SAIAoutput",
            .nodetype = SAIAoutputval,
            .parents = &[_]*const ClockNode{&SAIAMult},
        };
        const SAIBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAIBMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const SAIBMult: ClockNode = .{
            .name = "SAIBMult",
            .nodetype = SAIBMultval,

            .parents = &[_]*const ClockNode{
                &PLLSource,
                &PLLR,
                &PLLI2SQDiv,
                &PLLSAIQDiv,
            },
        };
        const SAIBoutputval = ClockNodeTypes{ .output = null };
        const SAIBoutput: ClockNode = .{
            .name = "SAIBoutput",
            .nodetype = SAIBoutputval,
            .parents = &[_]*const ClockNode{&SAIBMult},
        };
        const PLLI2SRval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SR) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 2 },
            },
        };
        const PLLI2SR: ClockNode = .{
            .name = "PLLI2SR",
            .nodetype = PLLI2SRval,
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const I2S1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const I2S1Mult: ClockNode = .{
            .name = "I2S1Mult",
            .nodetype = I2S1Multval,

            .parents = &[_]*const ClockNode{
                &PLLSource,
                &PLLR,
                &I2S_CKIN,
                &PLLI2SR,
            },
        };
        const I2S1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 192000000), .min = 0 },
        };
        const I2S1output: ClockNode = .{
            .name = "I2S1output",
            .nodetype = I2S1outputval,
            .parents = &[_]*const ClockNode{&I2S1Mult},
        };
        const I2S2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const I2S2Mult: ClockNode = .{
            .name = "I2S2Mult",
            .nodetype = I2S2Multval,

            .parents = &[_]*const ClockNode{
                &PLLSource,
                &PLLR,
                &I2S_CKIN,
                &PLLI2SR,
            },
        };
        const I2S2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 192000000), .min = 0 },
        };
        const I2S2output: ClockNode = .{
            .name = "I2S2output",
            .nodetype = I2S2outputval,
            .parents = &[_]*const ClockNode{&I2S2Mult},
        };
        const MCO1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",
            .nodetype = MCO1Multval,

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
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCO1Div: ClockNode = .{
            .name = "MCO1Div",
            .nodetype = MCO1Divval,
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO1Pinval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .nodetype = MCO1Pinval,
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .nodetype = MCO2Multval,

            .parents = &[_]*const ClockNode{
                &SysClkSource,
                &PLLI2SR,
                &HSEOSC,
                &PLLP,
            },
        };
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const PWRCLKoutputval = ClockNodeTypes{ .output = null };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .nodetype = PWRCLKoutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 45000000), .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const RCC_TIM_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_PRescaler_Selection) |val| {
                    break :inner val.get();
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
            .nodetype = TimPrescalerAPB1val,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .nodetype = TimPrescOut1val,
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
            .nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 90000000), .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2val = blk: {
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
        const TimPrescalerAPB2: ClockNode = .{
            .name = "TimPrescalerAPB2",
            .nodetype = TimPrescalerAPB2val,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2val = ClockNodeTypes{ .output = null };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const PLLSAIoutputval = ClockNodeTypes{ .output = null };
        const PLLSAIoutput: ClockNode = .{
            .name = "PLLSAIoutput",
            .nodetype = PLLSAIoutputval,
            .parents = &[_]*const ClockNode{&PLLSAIP},
        };
        const PLLI2Soutputval = ClockNodeTypes{ .output = null };
        const PLLI2Soutput: ClockNode = .{
            .name = "PLLI2Soutput",
            .nodetype = PLLI2Soutputval,
            .parents = &[_]*const ClockNode{&PLLI2SP},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{ .value = 100 },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{ .value = 5000 },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
            },
        };
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .I2S_CKIN = I2S_CKIN,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .PLLSAIM = PLLSAIM,
            .PLLI2SM = PLLI2SM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .HSIDivCEC = HSIDivCEC,
            .CECMult = CECMult,
            .CECOutput = CECOutput,
            .FMPI2C1Mult = FMPI2C1Mult,
            .FMPI2C1output = FMPI2C1output,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .SPDIFMult = SPDIFMult,
            .SPDIFoutput = SPDIFoutput,
            .SDIOMult = SDIOMult,
            .SDIOoutput = SDIOoutput,
            .SAIAMult = SAIAMult,
            .SAIAoutput = SAIAoutput,
            .SAIBMult = SAIBMult,
            .SAIBoutput = SAIBoutput,
            .I2S1Mult = I2S1Mult,
            .I2S1output = I2S1output,
            .I2S2Mult = I2S2Mult,
            .I2S2output = I2S2output,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .AHBPrescaler = AHBPrescaler,
            .PWRCLKoutput = PWRCLKoutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLR = PLLR,
            .PLLSAIN = PLLSAIN,
            .PLLSAIP = PLLSAIP,
            .PLLSAIoutput = PLLSAIoutput,
            .PLLSAIQ = PLLSAIQ,
            .PLLSAIQDiv = PLLSAIQDiv,
            .PLLI2SN = PLLI2SN,
            .PLLI2SP = PLLI2SP,
            .PLLI2Soutput = PLLI2Soutput,
            .PLLI2SQ = PLLI2SQ,
            .PLLI2SQDiv = PLLI2SQDiv,
            .PLLI2SR = PLLI2SR,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval,
        };
    }
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.I2S_CKIN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.SysClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.HSEOSC,
            &self.PLLP,
            &self.PLLR,
        });
        self.SysCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysClkSource,
        });
        self.PLLSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.HSEOSC,
        });
        self.PLLM.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.PLLSAIM.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.PLLI2SM.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.HSERTCDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.RTCClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSERTCDevisor,
            &self.LSEOSC,
            &self.LSIRC,
        });
        self.RTCOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RTCClkSource,
        });
        self.IWDGOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIRC,
        });
        self.HSIDivCEC.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.CECMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDivCEC,
            &self.LSEOSC,
        });
        self.CECOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CECMult,
        });
        self.FMPI2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.APB1Prescaler,
            &self.SysCLKOutput,
        });
        self.FMPI2C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FMPI2C1Mult,
        });
        self.USBMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLQ,
            &self.PLLSAIP,
        });
        self.USBoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBMult,
        });
        self.SPDIFMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLR,
            &self.PLLI2SP,
        });
        self.SPDIFoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPDIFMult,
        });
        self.SDIOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.USBMult,
        });
        self.SDIOoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SDIOMult,
        });
        self.SAIAMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2S_CKIN,
            &self.PLLR,
            &self.PLLI2SQDiv,
            &self.PLLSAIQDiv,
        });
        self.SAIAoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAIAMult,
        });
        self.SAIBMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
            &self.PLLR,
            &self.PLLI2SQDiv,
            &self.PLLSAIQDiv,
        });
        self.SAIBoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAIBMult,
        });
        self.I2S1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
            &self.PLLR,
            &self.I2S_CKIN,
            &self.PLLI2SR,
        });
        self.I2S1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2S1Mult,
        });
        self.I2S2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
            &self.PLLR,
            &self.I2S_CKIN,
            &self.PLLI2SR,
        });
        self.I2S2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2S2Mult,
        });
        self.MCO1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.HSEOSC,
            &self.HSIRC,
            &self.PLLP,
        });
        self.MCO1Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO1Mult,
        });
        self.MCO1Pin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO1Div,
        });
        self.MCO2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysClkSource,
            &self.PLLI2SR,
            &self.HSEOSC,
            &self.PLLP,
        });
        self.MCO2Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Mult,
        });
        self.MCO2Pin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Div,
        });
        self.AHBPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
        });
        self.PWRCLKoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
        });
        self.AHBOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBPrescaler,
        });
        self.HCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.CortexPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.CortexSysOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CortexPrescaler,
        });
        self.FCLKCortexOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB1Prescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
        });
        self.TimPrescalerAPB1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
        });
        self.TimPrescOut1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB1,
        });
        self.APB2Prescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB2Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
        });
        self.TimPrescalerAPB2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
        });
        self.TimPrescOut2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB2,
        });
        self.PLLN.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLM,
        });
        self.PLLP.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLLQ.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLLR.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLLSAIN.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSAIM,
        });
        self.PLLSAIP.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSAIN,
        });
        self.PLLSAIoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSAIP,
        });
        self.PLLSAIQ.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSAIN,
        });
        self.PLLSAIQDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSAIQ,
        });
        self.PLLI2SN.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLI2SM,
        });
        self.PLLI2SP.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLI2SN,
        });
        self.PLLI2Soutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLI2SP,
        });
        self.PLLI2SQ.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLI2SN,
        });
        self.PLLI2SQDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLI2SQ,
        });
        self.PLLI2SR.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLI2SN,
        });
    }
    pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
        alloc.free(self.HSIRC.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.I2S_CKIN.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.PLLSource.parents.?);
        alloc.free(self.PLLM.parents.?);
        alloc.free(self.PLLSAIM.parents.?);
        alloc.free(self.PLLI2SM.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.HSIDivCEC.parents.?);
        alloc.free(self.CECMult.parents.?);
        alloc.free(self.CECOutput.parents.?);
        alloc.free(self.FMPI2C1Mult.parents.?);
        alloc.free(self.FMPI2C1output.parents.?);
        alloc.free(self.USBMult.parents.?);
        alloc.free(self.USBoutput.parents.?);
        alloc.free(self.SPDIFMult.parents.?);
        alloc.free(self.SPDIFoutput.parents.?);
        alloc.free(self.SDIOMult.parents.?);
        alloc.free(self.SDIOoutput.parents.?);
        alloc.free(self.SAIAMult.parents.?);
        alloc.free(self.SAIAoutput.parents.?);
        alloc.free(self.SAIBMult.parents.?);
        alloc.free(self.SAIBoutput.parents.?);
        alloc.free(self.I2S1Mult.parents.?);
        alloc.free(self.I2S1output.parents.?);
        alloc.free(self.I2S2Mult.parents.?);
        alloc.free(self.I2S2output.parents.?);
        alloc.free(self.MCO1Mult.parents.?);
        alloc.free(self.MCO1Div.parents.?);
        alloc.free(self.MCO1Pin.parents.?);
        alloc.free(self.MCO2Mult.parents.?);
        alloc.free(self.MCO2Div.parents.?);
        alloc.free(self.MCO2Pin.parents.?);
        alloc.free(self.AHBPrescaler.parents.?);
        alloc.free(self.PWRCLKoutput.parents.?);
        alloc.free(self.AHBOutput.parents.?);
        alloc.free(self.HCLKOutput.parents.?);
        alloc.free(self.CortexPrescaler.parents.?);
        alloc.free(self.CortexSysOutput.parents.?);
        alloc.free(self.FCLKCortexOutput.parents.?);
        alloc.free(self.APB1Prescaler.parents.?);
        alloc.free(self.APB1Output.parents.?);
        alloc.free(self.TimPrescalerAPB1.parents.?);
        alloc.free(self.TimPrescOut1.parents.?);
        alloc.free(self.APB2Prescaler.parents.?);
        alloc.free(self.APB2Output.parents.?);
        alloc.free(self.TimPrescalerAPB2.parents.?);
        alloc.free(self.TimPrescOut2.parents.?);
        alloc.free(self.PLLN.parents.?);
        alloc.free(self.PLLP.parents.?);
        alloc.free(self.PLLQ.parents.?);
        alloc.free(self.PLLR.parents.?);
        alloc.free(self.PLLSAIN.parents.?);
        alloc.free(self.PLLSAIP.parents.?);
        alloc.free(self.PLLSAIoutput.parents.?);
        alloc.free(self.PLLSAIQ.parents.?);
        alloc.free(self.PLLSAIQDiv.parents.?);
        alloc.free(self.PLLI2SN.parents.?);
        alloc.free(self.PLLI2SP.parents.?);
        alloc.free(self.PLLI2Soutput.parents.?);
        alloc.free(self.PLLI2SQ.parents.?);
        alloc.free(self.PLLI2SQDiv.parents.?);
        alloc.free(self.PLLI2SR.parents.?);
    }
    pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        self.HSIRC.nodetype = HSIRCval;
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 25000000,
                .limit = .{ .max = @min(1_000_000_000, 26000000), .min = 4000000 },
            },
        };
        self.HSEOSC.nodetype = HSEOSCval;
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        self.LSIRC.nodetype = LSIRCval;
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 0 },
            },
        };
        self.LSEOSC.nodetype = LSEOSCval;
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        self.I2S_CKIN.nodetype = I2S_CKINval;
        const PLLSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLLSource.nodetype = PLLSourceval;
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLM) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        self.PLLM.nodetype = PLLMval;
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 192,
                .limit = .{ .max = @min(1_000_000_000, 432), .min = 50 },
            },
        };
        self.PLLN.nodetype = PLLNval;
        const PLLPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.PLLP.nodetype = PLLPval;
        const PLLRval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLR) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 2 },
            },
        };
        self.PLLR.nodetype = PLLRval;
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SysClkSource.nodetype = SysClkSourceval;
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 180000000), .min = 0 },
        };
        self.SysCLKOutput.nodetype = SysCLKOutputval;
        const PLLSAIMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIM) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        self.PLLSAIM.nodetype = PLLSAIMval;
        const PLLI2SMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SM) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        self.PLLI2SM.nodetype = PLLI2SMval;
        const HSERTCDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSERTCDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.HSERTCDevisor.nodetype = HSERTCDevisorval;
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
                    return error.InvalidConfig;
                } else {
                    break :inner 2;
                }
            },
        };
        self.RTCClkSource.nodetype = RTCClkSourceval;
        const RTCOutputval = ClockNodeTypes{ .output = null };
        self.RTCOutput.nodetype = RTCOutputval;
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        self.IWDGOutput.nodetype = IWDGOutputval;
        const HSIDivCECval = ClockNodeTypes{
            .div = .{ .value = 488 },
        };
        self.HSIDivCEC.nodetype = HSIDivCECval;
        const CECMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CECMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.CECMult.nodetype = CECMultval;
        const CECOutputval = ClockNodeTypes{ .output = null };
        self.CECOutput.nodetype = CECOutputval;
        const AHBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.AHBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.AHBPrescaler.nodetype = AHBPrescalerval;
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 180000000), .min = 0 },
        };
        self.AHBOutput.nodetype = AHBOutputval;
        const APB1Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB1Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB1Prescaler.nodetype = APB1Prescalerval;
        const FMPI2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.FMPI2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.FMPI2C1Mult.nodetype = FMPI2C1Multval;
        const FMPI2C1outputval = ClockNodeTypes{ .output = null };
        self.FMPI2C1output.nodetype = FMPI2C1outputval;
        const PLLQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLQ) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 15), .min = 2 },
            },
        };
        self.PLLQ.nodetype = PLLQval;
        const PLLSAINval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLSAIN) |val| val.get() else 192,
                .limit = .{ .max = @min(1_000_000_000, 432), .min = 50 },
            },
        };
        self.PLLSAIN.nodetype = PLLSAINval;
        const PLLSAIPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLSAIP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.PLLSAIP.nodetype = PLLSAIPval;
        const USBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USBMult.nodetype = USBMultval;
        const USBoutputval = ClockNodeTypes{ .output = null };
        self.USBoutput.nodetype = USBoutputval;
        const PLLI2SNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLI2SN) |val| val.get() else 192,
                .limit = .{ .max = @min(1_000_000_000, 432), .min = 50 },
            },
        };
        self.PLLI2SN.nodetype = PLLI2SNval;
        const PLLI2SPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLI2SP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.PLLI2SP.nodetype = PLLI2SPval;
        const SPDIFMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPDIFMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPDIFMult.nodetype = SPDIFMultval;
        const SPDIFoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 0), .min = 5632000 },
        };
        self.SPDIFoutput.nodetype = SPDIFoutputval;
        const SDIOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDIOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.SDIOMult.nodetype = SDIOMultval;
        const SDIOoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.SDIOoutput.nodetype = SDIOoutputval;
        const PLLI2SQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SQ) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 15), .min = 2 },
            },
        };
        self.PLLI2SQ.nodetype = PLLI2SQval;
        const PLLI2SQDivval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SQDiv) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 32), .min = 1 },
            },
        };
        self.PLLI2SQDiv.nodetype = PLLI2SQDivval;
        const PLLSAIQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIQ) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 15), .min = 2 },
            },
        };
        self.PLLSAIQ.nodetype = PLLSAIQval;
        const PLLSAIQDivval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIQDiv) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 32), .min = 1 },
            },
        };
        self.PLLSAIQDiv.nodetype = PLLSAIQDivval;
        const SAIAMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAIAMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.SAIAMult.nodetype = SAIAMultval;
        const SAIAoutputval = ClockNodeTypes{ .output = null };
        self.SAIAoutput.nodetype = SAIAoutputval;
        const SAIBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAIBMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.SAIBMult.nodetype = SAIBMultval;
        const SAIBoutputval = ClockNodeTypes{ .output = null };
        self.SAIBoutput.nodetype = SAIBoutputval;
        const PLLI2SRval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SR) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 2 },
            },
        };
        self.PLLI2SR.nodetype = PLLI2SRval;
        const I2S1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.I2S1Mult.nodetype = I2S1Multval;
        const I2S1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 192000000), .min = 0 },
        };
        self.I2S1output.nodetype = I2S1outputval;
        const I2S2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.I2S2Mult.nodetype = I2S2Multval;
        const I2S2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 192000000), .min = 0 },
        };
        self.I2S2output.nodetype = I2S2outputval;
        const MCO1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.MCO1Mult.nodetype = MCO1Multval;
        const MCO1Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO1Div) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCO1Div.nodetype = MCO1Divval;
        const MCO1Pinval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.MCO1Pin.nodetype = MCO1Pinval;
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.MCO2Mult.nodetype = MCO2Multval;
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCO2Div.nodetype = MCO2Divval;
        const MCO2Pinval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.MCO2Pin.nodetype = MCO2Pinval;
        const PWRCLKoutputval = ClockNodeTypes{ .output = null };
        self.PWRCLKoutput.nodetype = PWRCLKoutputval;
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        self.HCLKOutput.nodetype = HCLKOutputval;
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.CortexPrescaler.nodetype = CortexPrescalerval;
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        self.CortexSysOutput.nodetype = CortexSysOutputval;
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        self.FCLKCortexOutput.nodetype = FCLKCortexOutputval;
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 45000000), .min = 0 },
        };
        self.APB1Output.nodetype = APB1Outputval;
        const RCC_TIM_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_PRescaler_Selection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval;
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
        self.TimPrescalerAPB1.nodetype = TimPrescalerAPB1val;
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        self.TimPrescOut1.nodetype = TimPrescOut1val;
        const APB2Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB2Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB2Prescaler.nodetype = APB2Prescalerval;
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 90000000), .min = 0 },
        };
        self.APB2Output.nodetype = APB2Outputval;
        const TimPrescalerAPB2val = blk: {
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
        self.TimPrescalerAPB2.nodetype = TimPrescalerAPB2val;
        const TimPrescOut2val = ClockNodeTypes{ .output = null };
        self.TimPrescOut2.nodetype = TimPrescOut2val;
        const PLLSAIoutputval = ClockNodeTypes{ .output = null };
        self.PLLSAIoutput.nodetype = PLLSAIoutputval;
        const PLLI2Soutputval = ClockNodeTypes{ .output = null };
        self.PLLI2Soutput.nodetype = PLLI2Soutputval;
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{ .value = 100 },
        };
        self.HSE_Timout = HSE_Timoutval;
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{ .value = 5000 },
        };
        self.LSE_Timout = LSE_Timoutval;
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
            },
        };
        self.HSICalibrationValue = HSICalibrationValueval;
    }
};
