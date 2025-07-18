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
pub const USBCLockSelectionConf = enum {
    RCC_CLK48CLKSOURCE_PLLQ,
    RCC_CLK48CLKSOURCE_PLLSAIP,

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
    RCC_SAIACLKSOURCE_EXT,
    RCC_SAIACLKSOURCE_PLLI2S,
    RCC_SAIACLKSOURCE_PLLSAI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAIBCLockSelectionConf = enum {
    RCC_SAIBCLKSOURCE_EXT,
    RCC_SAIBCLKSOURCE_PLLI2S,
    RCC_SAIBCLKSOURCE_PLLSAI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2SCLockSelectionConf = enum {
    RCC_I2SCLKSOURCE_PLLI2S,
    RCC_I2SCLKSOURCE_EXT,

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
pub const DSICLockSelectionConf = enum {
    RCC_DSICLKSOURCE_PLLR,
    RCC_DSICLKSOURCE_DSIPHY,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DSITX_DivConf = enum(u32) {
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
pub const PLLSAIRConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLSAIRDivConf = enum {
    RCC_PLLSAIDIVR_2,
    RCC_PLLSAIDIVR_4,
    RCC_PLLSAIDIVR_8,
    RCC_PLLSAIDIVR_16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLSAIDIVR_8 => 8,
            .RCC_PLLSAIDIVR_4 => 4,
            .RCC_PLLSAIDIVR_16 => 16,
            .RCC_PLLSAIDIVR_2 => 2,
        };
    }
};
pub const PLLI2SNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
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
pub const PLLDSIIDFConf = enum {
    DSI_PLL_IN_DIV1,
    DSI_PLL_IN_DIV2,
    DSI_PLL_IN_DIV3,
    DSI_PLL_IN_DIV4,
    DSI_PLL_IN_DIV5,
    DSI_PLL_IN_DIV6,
    DSI_PLL_IN_DIV7,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DSI_PLL_IN_DIV7 => 7,
            .DSI_PLL_IN_DIV6 => 6,
            .DSI_PLL_IN_DIV5 => 5,
            .DSI_PLL_IN_DIV2 => 2,
            .DSI_PLL_IN_DIV1 => 1,
            .DSI_PLL_IN_DIV3 => 3,
            .DSI_PLL_IN_DIV4 => 4,
        };
    }
};
pub const PLLDSINDIVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLDSIODFConf = enum {
    DSI_PLL_OUT_DIV1,
    DSI_PLL_OUT_DIV2,
    DSI_PLL_OUT_DIV4,
    DSI_PLL_OUT_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DSI_PLL_OUT_DIV1 => 1,
            .DSI_PLL_OUT_DIV8 => 8,
            .DSI_PLL_OUT_DIV2 => 2,
            .DSI_PLL_OUT_DIV4 => 4,
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
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RCC_RTC_Clock_SourceVirtualConf = null,
    USBMult: ?USBCLockSelectionConf = null,
    SDIOMult: ?SDIOCLockSelectionConf = null,
    SAIAMult: ?SAIACLockSelectionConf = null,
    SAIBMult: ?SAIBCLockSelectionConf = null,
    I2SMult: ?I2SCLockSelectionConf = null,
    MCO1Mult: ?RCC_MCO1SourceConf = null,
    MCO1Div: ?RCC_MCODiv1Conf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCODiv2Conf = null,
    DSIMult: ?DSICLockSelectionConf = null,
    DSITXPrescaler: ?DSITX_DivConf = null,
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
    PLLSAIR: ?PLLSAIRConf = null,
    PLLSAIRDiv: ?PLLSAIRDivConf = null,
    PLLI2SN: ?PLLI2SNConf = null,
    PLLI2SQ: ?PLLI2SQConf = null,
    PLLI2SQDiv: ?PLLI2SQDivConf = null,
    PLLI2SR: ?PLLI2SRConf = null,
    PLLDSIIDF: ?PLLDSIIDFConf = null,
    PLLDSINDIV: ?PLLDSINDIVConf = null,
    PLLDSIODF: ?PLLDSIODFConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RCC_RTC_Clock_SourceVirtual: ?RCC_RTC_Clock_SourceVirtualConf = null,
    USBCLockSelection: ?USBCLockSelectionConf = null,
    SDIOCLockSelection: ?SDIOCLockSelectionConf = null,
    SAIACLockSelection: ?SAIACLockSelectionConf = null,
    SAIBCLockSelection: ?SAIBCLockSelectionConf = null,
    I2SCLockSelection: ?I2SCLockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv1: ?RCC_MCODiv1Conf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCODiv2: ?RCC_MCODiv2Conf = null,
    DSICLockSelection: ?DSICLockSelectionConf = null,
    DSITX_Div: ?DSITX_DivConf = null,
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
    PLLSAIR: ?PLLSAIRConf = null,
    PLLSAIRDiv: ?PLLSAIRDivConf = null,
    PLLI2SN: ?PLLI2SNConf = null,
    PLLI2SQ: ?PLLI2SQConf = null,
    PLLI2SQDiv: ?PLLI2SQDivConf = null,
    PLLI2SR: ?PLLI2SRConf = null,
    PLLDSIIDF: ?PLLDSIIDFConf = null,
    PLLDSINDIV: ?PLLDSINDIVConf = null,
    PLLDSIODF: ?PLLDSIODFConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RCC_RTC_Clock_SourceVirtual,
            .USBMult = self.USBCLockSelection,
            .SDIOMult = self.SDIOCLockSelection,
            .SAIAMult = self.SAIACLockSelection,
            .SAIBMult = self.SAIBCLockSelection,
            .I2SMult = self.I2SCLockSelection,
            .MCO1Mult = self.RCC_MCO1Source,
            .MCO1Div = self.RCC_MCODiv1,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCODiv2,
            .DSIMult = self.DSICLockSelection,
            .DSITXPrescaler = self.DSITX_Div,
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
            .PLLSAIR = self.PLLSAIR,
            .PLLSAIRDiv = self.PLLSAIRDiv,
            .PLLI2SN = self.PLLI2SN,
            .PLLI2SQ = self.PLLI2SQ,
            .PLLI2SQDiv = self.PLLI2SQDiv,
            .PLLI2SR = self.PLLI2SR,
            .PLLDSIIDF = self.PLLDSIIDF,
            .PLLDSINDIV = self.PLLDSINDIV,
            .PLLDSIODF = self.PLLDSIODF,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .RCC_TIM_PRescaler_Selection = self.RCC_TIM_PRescaler_Selection,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    I2S_CKIN: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    SDIOMult: ClockNode,
    SDIOoutput: ClockNode,
    SAIAMult: ClockNode,
    SAIAoutput: ClockNode,
    SAIBMult: ClockNode,
    SAIBoutput: ClockNode,
    I2SMult: ClockNode,
    I2Soutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    DSIPHYPrescaler: ClockNode,
    DSIMult: ClockNode,
    DSIoutput: ClockNode,
    DSITXPrescaler: ClockNode,
    DSITXCLKEsc: ClockNode,
    AHBPrescaler: ClockNode,
    EthernetPtpOutput: ClockNode,
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
    @"LCD-TFTCLKOutput": ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLR: ClockNode,
    PLLRoutput: ClockNode,
    PLLSAIN: ClockNode,
    PLLSAIP: ClockNode,
    PLLSAIQ: ClockNode,
    PLLSAIQDiv: ClockNode,
    PLLSAIR: ClockNode,
    PLLSAIRDiv: ClockNode,
    PLLI2SN: ClockNode,
    PLLI2SQ: ClockNode,
    PLLI2SQDiv: ClockNode,
    PLLI2SR: ClockNode,
    PLLDSIIDF: ClockNode,
    PLLDSIMultiplicator: ClockNode,
    PLLDSINDIV: ClockNode,
    VCOoutput: ClockNode,
    PLLDSIDevisor: ClockNode,
    PLLDSIODF: ClockNode,
    PLLDSIoutput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    RCC_TIM_PRescaler_Selection: ClockNodeTypes,

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
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
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
                    break :inner val.get();
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
                &HSIRC,
                &HSEOSC,
                &PLLP,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 180000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
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
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
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
        const PLLSAINval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLSAIN) |val| val.get() else 192,
                .limit = .{ .max = 432, .min = 50 },
            },
        };
        const PLLSAIN: ClockNode = .{
            .name = "PLLSAIN",
            .Nodetype = PLLSAINval,
            .parents = &[_]*const ClockNode{&PLLM},
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
            .Nodetype = PLLSAIPval,
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
            .Nodetype = USBMultval,

            .parents = &[_]*const ClockNode{
                &PLLQ,
                &PLLSAIP,
            },
        };
        const USBoutputval = ClockNodeTypes{ .output = null };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBMult},
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
            .Nodetype = SDIOMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &USBMult,
            },
        };
        const SDIOoutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const SDIOoutput: ClockNode = .{
            .name = "SDIOoutput",
            .Nodetype = SDIOoutputval,
            .parents = &[_]*const ClockNode{&SDIOMult},
        };
        const PLLI2SNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLI2SN) |val| val.get() else 192,
                .limit = .{ .max = 432, .min = 50 },
            },
        };
        const PLLI2SN: ClockNode = .{
            .name = "PLLI2SN",
            .Nodetype = PLLI2SNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLI2SQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SQ) |val| val.get() else 4,
                .limit = .{ .max = 15, .min = 2 },
            },
        };
        const PLLI2SQ: ClockNode = .{
            .name = "PLLI2SQ",
            .Nodetype = PLLI2SQval,
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const PLLI2SQDivval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SQDiv) |val| val.get() else 1,
                .limit = .{ .max = 32, .min = 1 },
            },
        };
        const PLLI2SQDiv: ClockNode = .{
            .name = "PLLI2SQDiv",
            .Nodetype = PLLI2SQDivval,
            .parents = &[_]*const ClockNode{&PLLI2SQ},
        };
        const PLLSAIQval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIQ) |val| val.get() else 4,
                .limit = .{ .max = 15, .min = 2 },
            },
        };
        const PLLSAIQ: ClockNode = .{
            .name = "PLLSAIQ",
            .Nodetype = PLLSAIQval,
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAIQDivval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIQDiv) |val| val.get() else 1,
                .limit = .{ .max = 32, .min = 1 },
            },
        };
        const PLLSAIQDiv: ClockNode = .{
            .name = "PLLSAIQDiv",
            .Nodetype = PLLSAIQDivval,
            .parents = &[_]*const ClockNode{&PLLSAIQ},
        };
        const SAIAMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAIAMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const SAIAMult: ClockNode = .{
            .name = "SAIAMult",
            .Nodetype = SAIAMultval,

            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &PLLI2SQDiv,
                &PLLSAIQDiv,
            },
        };
        const SAIAoutputval = ClockNodeTypes{ .output = null };
        const SAIAoutput: ClockNode = .{
            .name = "SAIAoutput",
            .Nodetype = SAIAoutputval,
            .parents = &[_]*const ClockNode{&SAIAMult},
        };
        const SAIBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAIBMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const SAIBMult: ClockNode = .{
            .name = "SAIBMult",
            .Nodetype = SAIBMultval,

            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &PLLI2SQDiv,
                &PLLSAIQDiv,
            },
        };
        const SAIBoutputval = ClockNodeTypes{ .output = null };
        const SAIBoutput: ClockNode = .{
            .name = "SAIBoutput",
            .Nodetype = SAIBoutputval,
            .parents = &[_]*const ClockNode{&SAIBMult},
        };
        const PLLI2SRval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLI2SR) |val| val.get() else 2,
                .limit = .{ .max = 7, .min = 2 },
            },
        };
        const PLLI2SR: ClockNode = .{
            .name = "PLLI2SR",
            .Nodetype = PLLI2SRval,
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const I2SMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2SMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2SMult: ClockNode = .{
            .name = "I2SMult",
            .Nodetype = I2SMultval,

            .parents = &[_]*const ClockNode{
                &PLLI2SR,
                &I2S_CKIN,
            },
        };
        const I2Soutputval = ClockNodeTypes{
            .output = .{ .max = 192000000, .min = 0 },
        };
        const I2Soutput: ClockNode = .{
            .name = "I2Soutput",
            .Nodetype = I2Soutputval,
            .parents = &[_]*const ClockNode{&I2SMult},
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
                    break :inner val.get();
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
        const MCO1Pinval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = MCO1Pinval,
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
            .Nodetype = MCO2Multval,

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
            .Nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const PLLDSIIDFval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDSIIDF) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PLLDSIIDF: ClockNode = .{
            .name = "PLLDSIIDF",
            .Nodetype = PLLDSIIDFval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLDSIMultiplicatorval = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        const PLLDSIMultiplicator: ClockNode = .{
            .name = "PLLDSIMultiplicator",
            .Nodetype = PLLDSIMultiplicatorval,
            .parents = &[_]*const ClockNode{&PLLDSIIDF},
        };
        const PLLDSINDIVval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLDSINDIV) |val| val.get() else 20,
                .limit = .{ .max = 125, .min = 10 },
            },
        };
        const PLLDSINDIV: ClockNode = .{
            .name = "PLLDSINDIV",
            .Nodetype = PLLDSINDIVval,
            .parents = &[_]*const ClockNode{&PLLDSIMultiplicator},
        };
        const VCOoutputval = ClockNodeTypes{
            .output = .{ .max = 1000000000, .min = 500000000 },
        };
        const VCOoutput: ClockNode = .{
            .name = "VCOoutput",
            .Nodetype = VCOoutputval,
            .parents = &[_]*const ClockNode{&PLLDSINDIV},
        };
        const PLLDSIDevisorval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const PLLDSIDevisor: ClockNode = .{
            .name = "PLLDSIDevisor",
            .Nodetype = PLLDSIDevisorval,
            .parents = &[_]*const ClockNode{&VCOoutput},
        };
        const PLLDSIODFval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDSIODF) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PLLDSIODF: ClockNode = .{
            .name = "PLLDSIODF",
            .Nodetype = PLLDSIODFval,
            .parents = &[_]*const ClockNode{&PLLDSIDevisor},
        };
        const DSIPHYPrescalerval = ClockNodeTypes{
            .div = .{ .value = 8 },
        };
        const DSIPHYPrescaler: ClockNode = .{
            .name = "DSIPHYPrescaler",
            .Nodetype = DSIPHYPrescalerval,
            .parents = &[_]*const ClockNode{&PLLDSIODF},
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
        const PLLRoutputval = ClockNodeTypes{ .output = null };
        const PLLRoutput: ClockNode = .{
            .name = "PLLRoutput",
            .Nodetype = PLLRoutputval,
            .parents = &[_]*const ClockNode{&PLLR},
        };
        const DSIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DSIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const DSIMult: ClockNode = .{
            .name = "DSIMult",
            .Nodetype = DSIMultval,

            .parents = &[_]*const ClockNode{
                &PLLRoutput,
                &DSIPHYPrescaler,
            },
        };
        const DSIoutputval = ClockNodeTypes{
            .output = .{ .max = 62500000, .min = 0 },
        };
        const DSIoutput: ClockNode = .{
            .name = "DSIoutput",
            .Nodetype = DSIoutputval,
            .parents = &[_]*const ClockNode{&DSIMult},
        };
        const DSITXPrescalerval = ClockNodeTypes{
            .div = .{
                .value = if (config.DSITXPrescaler) |val| val.get() else 4,
                .limit = .{ .max = 32, .min = 1 },
            },
        };
        const DSITXPrescaler: ClockNode = .{
            .name = "DSITXPrescaler",
            .Nodetype = DSITXPrescalerval,
            .parents = &[_]*const ClockNode{&DSIMult},
        };
        const DSITXCLKEscval = ClockNodeTypes{
            .output = .{ .max = 20000000, .min = 0 },
        };
        const DSITXCLKEsc: ClockNode = .{
            .name = "DSITXCLKEsc",
            .Nodetype = DSITXCLKEscval,
            .parents = &[_]*const ClockNode{&DSITXPrescaler},
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
        const EthernetPtpOutputval = ClockNodeTypes{ .output = null };
        const EthernetPtpOutput: ClockNode = .{
            .name = "EthernetPtpOutput",
            .Nodetype = EthernetPtpOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 180000000, .min = 0 },
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
                    break :inner val.get();
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
            .output = .{ .max = 45000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
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
            .Nodetype = TimPrescalerAPB1val,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
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
            .output = .{ .max = 90000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
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
            .Nodetype = TimPrescalerAPB2val,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2val = ClockNodeTypes{ .output = null };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const PLLSAIRval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAIR) |val| val.get() else 2,
                .limit = .{ .max = 7, .min = 2 },
            },
        };
        const PLLSAIR: ClockNode = .{
            .name = "PLLSAIR",
            .Nodetype = PLLSAIRval,
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAIRDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLSAIRDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLSAIRDiv: ClockNode = .{
            .name = "PLLSAIRDiv",
            .Nodetype = PLLSAIRDivval,
            .parents = &[_]*const ClockNode{&PLLSAIR},
        };
        const @"LCD-TFTCLKOutputval" = ClockNodeTypes{ .output = null };
        const @"LCD-TFTCLKOutput": ClockNode = .{
            .name = "LCD-TFTCLKOutput",
            .Nodetype = @"LCD-TFTCLKOutputval",
            .parents = &[_]*const ClockNode{&PLLSAIRDiv},
        };
        const PLLDSIoutputval = ClockNodeTypes{
            .output = .{ .max = 500000000, .min = 80000000 },
        };
        const PLLDSIoutput: ClockNode = .{
            .name = "PLLDSIoutput",
            .Nodetype = PLLDSIoutputval,
            .parents = &[_]*const ClockNode{&PLLDSIODF},
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
            .I2S_CKIN = I2S_CKIN,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .SDIOMult = SDIOMult,
            .SDIOoutput = SDIOoutput,
            .SAIAMult = SAIAMult,
            .SAIAoutput = SAIAoutput,
            .SAIBMult = SAIBMult,
            .SAIBoutput = SAIBoutput,
            .I2SMult = I2SMult,
            .I2Soutput = I2Soutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .DSIPHYPrescaler = DSIPHYPrescaler,
            .DSIMult = DSIMult,
            .DSIoutput = DSIoutput,
            .DSITXPrescaler = DSITXPrescaler,
            .DSITXCLKEsc = DSITXCLKEsc,
            .AHBPrescaler = AHBPrescaler,
            .EthernetPtpOutput = EthernetPtpOutput,
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
            .@"LCD-TFTCLKOutput" = @"LCD-TFTCLKOutput",
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLR = PLLR,
            .PLLRoutput = PLLRoutput,
            .PLLSAIN = PLLSAIN,
            .PLLSAIP = PLLSAIP,
            .PLLSAIQ = PLLSAIQ,
            .PLLSAIQDiv = PLLSAIQDiv,
            .PLLSAIR = PLLSAIR,
            .PLLSAIRDiv = PLLSAIRDiv,
            .PLLI2SN = PLLI2SN,
            .PLLI2SQ = PLLI2SQ,
            .PLLI2SQDiv = PLLI2SQDiv,
            .PLLI2SR = PLLI2SR,
            .PLLDSIIDF = PLLDSIIDF,
            .PLLDSIMultiplicator = PLLDSIMultiplicator,
            .PLLDSINDIV = PLLDSINDIV,
            .VCOoutput = VCOoutput,
            .PLLDSIDevisor = PLLDSIDevisor,
            .PLLDSIODF = PLLDSIODF,
            .PLLDSIoutput = PLLDSIoutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.USBoutput.get_comptime();
        _ = self.SDIOoutput.get_comptime();
        _ = self.SAIAoutput.get_comptime();
        _ = self.SAIBoutput.get_comptime();
        _ = self.I2Soutput.get_comptime();
        _ = self.DSIoutput.get_comptime();
        _ = self.DSITXCLKEsc.get_comptime();
        _ = self.EthernetPtpOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.@"LCD-TFTCLKOutput".get_comptime();
    }
};
