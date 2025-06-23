const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSISYSCLKDividerConf = enum {
    RCC_HSI_DIV1,
    RCC_HSI_DIV2,
    RCC_HSI_DIV4,
    RCC_HSI_DIV8,
    RCC_HSI_DIV16,
    RCC_HSI_DIV32,
    RCC_HSI_DIV64,
    RCC_HSI_DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSI_DIV4 => 4,
            .RCC_HSI_DIV128 => 128,
            .RCC_HSI_DIV16 => 16,
            .RCC_HSI_DIV64 => 64,
            .RCC_HSI_DIV1 => 1,
            .RCC_HSI_DIV32 => 32,
            .RCC_HSI_DIV8 => 8,
            .RCC_HSI_DIV2 => 2,
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
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_LSE,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
    RCC_SYSCLKSOURCE_LSI,

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
pub const PLLMConf = enum {
    RCC_PLLM_DIV1,
    RCC_PLLM_DIV2,
    RCC_PLLM_DIV3,
    RCC_PLLM_DIV4,
    RCC_PLLM_DIV5,
    RCC_PLLM_DIV6,
    RCC_PLLM_DIV7,
    RCC_PLLM_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLM_DIV2 => 2,
            .RCC_PLLM_DIV8 => 8,
            .RCC_PLLM_DIV3 => 3,
            .RCC_PLLM_DIV6 => 6,
            .RCC_PLLM_DIV1 => 1,
            .RCC_PLLM_DIV5 => 5,
            .RCC_PLLM_DIV4 => 4,
            .RCC_PLLM_DIV7 => 7,
        };
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK1,
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART2CLockSelectionConf = enum {
    RCC_USART2CLKSOURCE_PCLK1,
    RCC_USART2CLKSOURCE_SYSCLK,
    RCC_USART2CLKSOURCE_HSI,
    RCC_USART2CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2S1CLockSelectionConf = enum {
    RCC_I2S1CLKSOURCE_SYSCLK,
    RCC_I2S1CLKSOURCE_PLL,
    RCC_I2S1CLKSOURCE_HSI,
    RCC_I2S1CLKSOURCE_EXT,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2S2CLockSelectionConf = enum {
    RCC_I2S2CLKSOURCE_SYSCLK,
    RCC_I2S2CLKSOURCE_PLL,
    RCC_I2S2CLKSOURCE_HSI,
    RCC_I2S2CLKSOURCE_EXT,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART3CLockSelectionConf = enum {
    RCC_USART3CLKSOURCE_PCLK1,
    RCC_USART3CLKSOURCE_SYSCLK,
    RCC_USART3CLKSOURCE_HSI,
    RCC_USART3CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK1,
    RCC_LPUART1CLKSOURCE_SYSCLK,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK1,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK1,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_HSI,
    RCC_LPTIM2CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART2CLockSelectionConf = enum {
    RCC_LPUART2CLKSOURCE_PCLK1,
    RCC_LPUART2CLKSOURCE_SYSCLK,
    RCC_LPUART2CLKSOURCE_HSI,
    RCC_LPUART2CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CECCLockSelectionConf = enum {
    RCC_CECCLKSOURCE_HSI_DIV488,
    RCC_CECCLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const TIM1CLockSelectionVirtualConf = enum {
    RCC_TIM1CLKSOURCE_PCLK1,
    RCC_TIM1CLKSOURCE_PLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const TIM15CLockSelectionVirtualConf = enum {
    RCC_TIM15CLKSOURCE_PCLK1,
    RCC_TIM15CLKSOURCE_PLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_SYSCLK,
    RCC_ADCCLKSOURCE_HSI,
    RCC_ADCCLKSOURCE_PLLADC,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RNGCLKDividerConf = enum {
    RCC_RNGCLK_DIV1,
    RCC_RNGCLK_DIV2,
    RCC_RNGCLK_DIV4,
    RCC_RNGCLK_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_RNGCLK_DIV4 => 4,
            .RCC_RNGCLK_DIV8 => 8,
            .RCC_RNGCLK_DIV1 => 1,
            .RCC_RNGCLK_DIV2 => 2,
        };
    }
};
pub const RNGCLockSelectionConf = enum {
    RCC_RNGCLKSOURCE_SYSCLK,
    RCC_RNGCLKSOURCE_PLL,
    RCC_RNGCLKSOURCE_HSI_DIV8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_SYSCLK,
    RCC_I2C1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_SYSCLK,
    RCC_I2C2CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FDCANCLockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_PCLK1,
    RCC_FDCANCLKSOURCE_PLL,
    RCC_FDCANCLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USBCLockSelectionConf = enum {
    RCC_USBCLKSOURCE_HSI48,
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_HSI48,
    RCC_MCO1SOURCE_PLLPCLK,
    RCC_MCO1SOURCE_PLLQCLK,
    RCC_MCO1SOURCE_RTCCLK,
    RCC_MCO1SOURCE_RTC_WKUP,

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
    RCC_MCODIV_32,
    RCC_MCODIV_64,
    RCC_MCODIV_128,
    RCC_MCODIV_256,
    RCC_MCODIV_512,
    RCC_MCODIV_1024,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_32 => 32,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_256 => 256,
            .RCC_MCODIV_512 => 512,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_1024 => 1024,
            .RCC_MCODIV_64 => 64,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_128 => 128,
        };
    }
};
pub const RCC_MCO2SourceConf = enum {
    RCC_MCO2SOURCE_LSE,
    RCC_MCO2SOURCE_LSI,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_HSI,
    RCC_MCO2SOURCE_PLLCLK,
    RCC_MCO2SOURCE_SYSCLK,
    RCC_MCO2SOURCE_HSI48,
    RCC_MCO2SOURCE_PLLPCLK,
    RCC_MCO2SOURCE_PLLQCLK,
    RCC_MCO2SOURCE_RTCCLK,
    RCC_MCO2SOURCE_RTC_WKUP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO2DivConf = enum {
    RCC_MCO2DIV_1,
    RCC_MCO2DIV_2,
    RCC_MCO2DIV_4,
    RCC_MCO2DIV_8,
    RCC_MCO2DIV_16,
    RCC_MCO2DIV_32,
    RCC_MCO2DIV_64,
    RCC_MCO2DIV_128,
    RCC_MCO2DIV_256,
    RCC_MCO2DIV_512,
    RCC_MCO2DIV_1024,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCO2DIV_1 => 1,
            .RCC_MCO2DIV_1024 => 1024,
            .RCC_MCO2DIV_8 => 8,
            .RCC_MCO2DIV_32 => 32,
            .RCC_MCO2DIV_256 => 256,
            .RCC_MCO2DIV_16 => 16,
            .RCC_MCO2DIV_2 => 2,
            .RCC_MCO2DIV_64 => 64,
            .RCC_MCO2DIV_4 => 4,
            .RCC_MCO2DIV_128 => 128,
            .RCC_MCO2DIV_512 => 512,
        };
    }
};
pub const LSCOSource1Conf = enum {
    RCC_LSCOSOURCE_LSI,
    RCC_LSCOSOURCE_LSE,

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
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLPConf = enum {
    RCC_PLLP_DIV2,
    RCC_PLLP_DIV3,
    RCC_PLLP_DIV4,
    RCC_PLLP_DIV5,
    RCC_PLLP_DIV6,
    RCC_PLLP_DIV7,
    RCC_PLLP_DIV8,
    RCC_PLLP_DIV9,
    RCC_PLLP_DIV10,
    RCC_PLLP_DIV11,
    RCC_PLLP_DIV12,
    RCC_PLLP_DIV13,
    RCC_PLLP_DIV14,
    RCC_PLLP_DIV15,
    RCC_PLLP_DIV16,
    RCC_PLLP_DIV17,
    RCC_PLLP_DIV18,
    RCC_PLLP_DIV19,
    RCC_PLLP_DIV20,
    RCC_PLLP_DIV21,
    RCC_PLLP_DIV22,
    RCC_PLLP_DIV23,
    RCC_PLLP_DIV24,
    RCC_PLLP_DIV25,
    RCC_PLLP_DIV26,
    RCC_PLLP_DIV27,
    RCC_PLLP_DIV28,
    RCC_PLLP_DIV29,
    RCC_PLLP_DIV30,
    RCC_PLLP_DIV31,
    RCC_PLLP_DIV32,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV24 => 24,
            .RCC_PLLP_DIV7 => 7,
            .RCC_PLLP_DIV20 => 20,
            .RCC_PLLP_DIV31 => 31,
            .RCC_PLLP_DIV9 => 9,
            .RCC_PLLP_DIV15 => 15,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV5 => 5,
            .RCC_PLLP_DIV19 => 19,
            .RCC_PLLP_DIV8 => 8,
            .RCC_PLLP_DIV11 => 11,
            .RCC_PLLP_DIV2 => 2,
            .RCC_PLLP_DIV3 => 3,
            .RCC_PLLP_DIV18 => 18,
            .RCC_PLLP_DIV12 => 12,
            .RCC_PLLP_DIV32 => 32,
            .RCC_PLLP_DIV25 => 25,
            .RCC_PLLP_DIV14 => 14,
            .RCC_PLLP_DIV10 => 10,
            .RCC_PLLP_DIV28 => 28,
            .RCC_PLLP_DIV13 => 13,
            .RCC_PLLP_DIV16 => 16,
            .RCC_PLLP_DIV22 => 22,
            .RCC_PLLP_DIV21 => 21,
            .RCC_PLLP_DIV29 => 29,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV23 => 23,
            .RCC_PLLP_DIV26 => 26,
            .RCC_PLLP_DIV30 => 30,
            .RCC_PLLP_DIV27 => 27,
        };
    }
};
pub const PLLQConf = enum {
    RCC_PLLQ_DIV2,
    RCC_PLLQ_DIV3,
    RCC_PLLQ_DIV4,
    RCC_PLLQ_DIV5,
    RCC_PLLQ_DIV6,
    RCC_PLLQ_DIV7,
    RCC_PLLQ_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLQ_DIV3 => 3,
            .RCC_PLLQ_DIV2 => 2,
            .RCC_PLLQ_DIV8 => 8,
            .RCC_PLLQ_DIV4 => 4,
            .RCC_PLLQ_DIV6 => 6,
            .RCC_PLLQ_DIV5 => 5,
            .RCC_PLLQ_DIV7 => 7,
        };
    }
};
pub const PLLRConf = enum {
    RCC_PLLR_DIV2,
    RCC_PLLR_DIV3,
    RCC_PLLR_DIV4,
    RCC_PLLR_DIV5,
    RCC_PLLR_DIV6,
    RCC_PLLR_DIV7,
    RCC_PLLR_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLR_DIV2 => 2,
            .RCC_PLLR_DIV8 => 8,
            .RCC_PLLR_DIV7 => 7,
            .RCC_PLLR_DIV3 => 3,
            .RCC_PLLR_DIV5 => 5,
            .RCC_PLLR_DIV6 => 6,
            .RCC_PLLR_DIV4 => 4,
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
pub const LSE_Drive_CapabilityConf = enum {
    RCC_LSEDRIVE_LOW,
    RCC_LSEDRIVE_MEDIUMLOW,
    RCC_LSEDRIVE_MEDIUMHIGH,
    RCC_LSEDRIVE_HIGH,
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_LSEDRIVE_LOW => 0,
            .RCC_LSEDRIVE_MEDIUMHIGH => 2,
            .null => 0,
            .RCC_LSEDRIVE_MEDIUMLOW => 1,
            .RCC_LSEDRIVE_HIGH => 3,
        };
    }
};
pub const LSE_Drive_CapabilityArgConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    HSISYS: ?HSISYSCLKDividerConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    USART1Mult: ?USART1CLockSelectionConf = null,
    USART2Mult: ?USART2CLockSelectionConf = null,
    I2S1Mult: ?I2S1CLockSelectionConf = null,
    I2S2Mult: ?I2S2CLockSelectionConf = null,
    USART3Mult: ?USART3CLockSelectionConf = null,
    LPUART1Mult: ?LPUART1CLockSelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionConf = null,
    LPTIM2Mult: ?LPTIM2CLockSelectionConf = null,
    LPUART2Mult: ?LPUART2CLockSelectionConf = null,
    CECMult: ?CECCLockSelectionConf = null,
    TIM1Mult: ?TIM1CLockSelectionVirtualConf = null,
    TIM15Mult: ?TIM15CLockSelectionVirtualConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    RNGDIV: ?RNGCLKDividerConf = null,
    CK48Mult: ?RNGCLockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    I2C2Mult: ?I2C2CLockSelectionConf = null,
    FDCANMult: ?FDCANCLockSelectionConf = null,
    USBMult: ?USBCLockSelectionConf = null,
    MCOMult: ?RCC_MCO1SourceConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCO2DivConf = null,
    LSCOMult: ?LSCOSource1Conf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    APBPrescaler: ?APB1CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    LSE_Drive_CapabilityArg: ?LSE_Drive_CapabilityArgConf = null,
};

pub const ConfigWithRef = struct {
    HSISYSCLKDivider: ?HSISYSCLKDividerConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    USART1CLockSelection: ?USART1CLockSelectionConf = null,
    USART2CLockSelection: ?USART2CLockSelectionConf = null,
    I2S1CLockSelection: ?I2S1CLockSelectionConf = null,
    I2S2CLockSelection: ?I2S2CLockSelectionConf = null,
    USART3CLockSelection: ?USART3CLockSelectionConf = null,
    LPUART1CLockSelection: ?LPUART1CLockSelectionConf = null,
    LPTIM1CLockSelection: ?LPTIM1CLockSelectionConf = null,
    LPTIM2CLockSelection: ?LPTIM2CLockSelectionConf = null,
    LPUART2CLockSelection: ?LPUART2CLockSelectionConf = null,
    CECCLockSelection: ?CECCLockSelectionConf = null,
    TIM1CLockSelectionVirtual: ?TIM1CLockSelectionVirtualConf = null,
    TIM15CLockSelectionVirtual: ?TIM15CLockSelectionVirtualConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    RNGCLKDivider: ?RNGCLKDividerConf = null,
    RNGCLockSelection: ?RNGCLockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    I2C2CLockSelection: ?I2C2CLockSelectionConf = null,
    FDCANCLockSelection: ?FDCANCLockSelectionConf = null,
    USBCLockSelection: ?USBCLockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCO2Div: ?RCC_MCO2DivConf = null,
    LSCOSource1: ?LSCOSource1Conf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    LSE_Drive_CapabilityArg: ?LSE_Drive_CapabilityArgConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSISYS = self.HSISYSCLKDivider,
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .USART2Mult = self.USART2CLockSelection,
            .I2S1Mult = self.I2S1CLockSelection,
            .I2S2Mult = self.I2S2CLockSelection,
            .USART3Mult = self.USART3CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .LPUART2Mult = self.LPUART2CLockSelection,
            .CECMult = self.CECCLockSelection,
            .TIM1Mult = self.TIM1CLockSelectionVirtual,
            .TIM15Mult = self.TIM15CLockSelectionVirtual,
            .ADCMult = self.ADCCLockSelection,
            .RNGDIV = self.RNGCLKDivider,
            .CK48Mult = self.RNGCLockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .FDCANMult = self.FDCANCLockSelection,
            .USBMult = self.USBCLockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCO2Div,
            .LSCOMult = self.LSCOSource1,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APBPrescaler = self.APB1CLKDivider,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLR = self.PLLR,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
            .LSE_Drive_CapabilityArg = self.LSE_Drive_CapabilityArg,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSISYS: ClockNode,
    HSI48RC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    RTCWkupOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    I2S1Mult: ClockNode,
    I2S1output: ClockNode,
    I2S2Mult: ClockNode,
    I2S2output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    LPUART2Mult: ClockNode,
    LPUART2output: ClockNode,
    HSICECCDevisor: ClockNode,
    CECMult: ClockNode,
    CECoutput: ClockNode,
    TIM1Mult: ClockNode,
    TIM1output: ClockNode,
    TIM15Mult: ClockNode,
    TIM15output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    RNGDIV: ClockNode,
    RNGHSIDiv: ClockNode,
    CK48Mult: ClockNode,
    RNGoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    FDCANMult: ClockNode,
    FDCANoutput: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    I2S_CKIN: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    AHBPrescaler: ClockNode,
    PWRCLKoutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APBPrescaler: ClockNode,
    APBOutput: ClockNode,
    TimPrescalerAPB: ClockNode,
    TimPrescOut1: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLPoutput: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLR: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,
    LSE_Drive_CapabilityArg: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSISYSval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSISYS) |val| {
                    switch (val) {
                        .RCC_HSI_DIV1,
                        .RCC_HSI_DIV2,
                        .RCC_HSI_DIV4,
                        .RCC_HSI_DIV8,
                        .RCC_HSI_DIV16,
                        .RCC_HSI_DIV32,
                        .RCC_HSI_DIV64,
                        .RCC_HSI_DIV128,
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
        const HSISYS: ClockNode = .{
            .name = "HSISYS",
            .Nodetype = HSISYSval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = HSI48RCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = 48000000, .min = 4000000 },
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
                .limit = .{ .max = 1000000, .min = 1000 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
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
        const PLLMval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLM) |val| {
                    switch (val) {
                        .RCC_PLLM_DIV1,
                        .RCC_PLLM_DIV2,
                        .RCC_PLLM_DIV3,
                        .RCC_PLLM_DIV4,
                        .RCC_PLLM_DIV5,
                        .RCC_PLLM_DIV6,
                        .RCC_PLLM_DIV7,
                        .RCC_PLLM_DIV8,
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
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 8,
                .limit = .{ .max = 86, .min = 8 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLRval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLR) |val| {
                    switch (val) {
                        .RCC_PLLR_DIV2,
                        .RCC_PLLR_DIV3,
                        .RCC_PLLR_DIV4,
                        .RCC_PLLR_DIV5,
                        .RCC_PLLR_DIV6,
                        .RCC_PLLR_DIV7,
                        .RCC_PLLR_DIV8,
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
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = PLLRval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_LSE,
                        .RCC_SYSCLKSOURCE_HSI,
                        .RCC_SYSCLKSOURCE_HSE,
                        .RCC_SYSCLKSOURCE_PLLCLK,
                        .RCC_SYSCLKSOURCE_LSI,
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
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &HSISYS,
                &HSEOSC,
                &PLLR,
                &LSIRC,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_HSE_DIV32,
                        .RCC_RTCCLKSOURCE_LSE,
                        .RCC_RTCCLKSOURCE_LSI,
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
        const RTCWkupOutputval = ClockNodeTypes{ .output = null };
        const RTCWkupOutput: ClockNode = .{
            .name = "RTCWkupOutput",
            .Nodetype = RTCWkupOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
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
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APBPrescaler) |val| {
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
        const APBPrescaler: ClockNode = .{
            .name = "APBPrescaler",
            .Nodetype = APBPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK1,
                        .RCC_USART1CLKSOURCE_SYSCLK,
                        .RCC_USART1CLKSOURCE_HSI,
                        .RCC_USART1CLKSOURCE_LSE,
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
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART1outputval = ClockNodeTypes{ .output = null };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    switch (val) {
                        .RCC_USART2CLKSOURCE_PCLK1,
                        .RCC_USART2CLKSOURCE_SYSCLK,
                        .RCC_USART2CLKSOURCE_HSI,
                        .RCC_USART2CLKSOURCE_LSE,
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
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .Nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART2outputval = ClockNodeTypes{ .output = null };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = USART2outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const PLLPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLP) |val| {
                    switch (val) {
                        .RCC_PLLP_DIV2,
                        .RCC_PLLP_DIV3,
                        .RCC_PLLP_DIV4,
                        .RCC_PLLP_DIV5,
                        .RCC_PLLP_DIV6,
                        .RCC_PLLP_DIV7,
                        .RCC_PLLP_DIV8,
                        .RCC_PLLP_DIV9,
                        .RCC_PLLP_DIV10,
                        .RCC_PLLP_DIV11,
                        .RCC_PLLP_DIV12,
                        .RCC_PLLP_DIV13,
                        .RCC_PLLP_DIV14,
                        .RCC_PLLP_DIV15,
                        .RCC_PLLP_DIV16,
                        .RCC_PLLP_DIV17,
                        .RCC_PLLP_DIV18,
                        .RCC_PLLP_DIV19,
                        .RCC_PLLP_DIV20,
                        .RCC_PLLP_DIV21,
                        .RCC_PLLP_DIV22,
                        .RCC_PLLP_DIV23,
                        .RCC_PLLP_DIV24,
                        .RCC_PLLP_DIV25,
                        .RCC_PLLP_DIV26,
                        .RCC_PLLP_DIV27,
                        .RCC_PLLP_DIV28,
                        .RCC_PLLP_DIV29,
                        .RCC_PLLP_DIV30,
                        .RCC_PLLP_DIV31,
                        .RCC_PLLP_DIV32,
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
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
        };
        const I2S1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S1Mult) |val| {
                    switch (val) {
                        .RCC_I2S1CLKSOURCE_SYSCLK,
                        .RCC_I2S1CLKSOURCE_PLL,
                        .RCC_I2S1CLKSOURCE_HSI,
                        .RCC_I2S1CLKSOURCE_EXT,
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
        const I2S1Mult: ClockNode = .{
            .name = "I2S1Mult",
            .Nodetype = I2S1Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLLP,
                &HSIRC,
                &I2S_CKIN,
            },
        };
        const I2S1outputval = ClockNodeTypes{ .output = null };
        const I2S1output: ClockNode = .{
            .name = "I2S1output",
            .Nodetype = I2S1outputval,
            .parents = &[_]*const ClockNode{&I2S1Mult},
        };
        const I2S2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S2Mult) |val| {
                    switch (val) {
                        .RCC_I2S2CLKSOURCE_SYSCLK,
                        .RCC_I2S2CLKSOURCE_PLL,
                        .RCC_I2S2CLKSOURCE_HSI,
                        .RCC_I2S2CLKSOURCE_EXT,
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
        const I2S2Mult: ClockNode = .{
            .name = "I2S2Mult",
            .Nodetype = I2S2Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLLP,
                &HSIRC,
                &I2S_CKIN,
            },
        };
        const I2S2outputval = ClockNodeTypes{ .output = null };
        const I2S2output: ClockNode = .{
            .name = "I2S2output",
            .Nodetype = I2S2outputval,
            .parents = &[_]*const ClockNode{&I2S2Mult},
        };
        const USART3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART3Mult) |val| {
                    switch (val) {
                        .RCC_USART3CLKSOURCE_PCLK1,
                        .RCC_USART3CLKSOURCE_SYSCLK,
                        .RCC_USART3CLKSOURCE_HSI,
                        .RCC_USART3CLKSOURCE_LSE,
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
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",
            .Nodetype = USART3Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART3outputval = ClockNodeTypes{ .output = null };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = USART3outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const LPUART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART1Mult) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_PCLK1,
                        .RCC_LPUART1CLKSOURCE_SYSCLK,
                        .RCC_LPUART1CLKSOURCE_HSI,
                        .RCC_LPUART1CLKSOURCE_LSE,
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
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",
            .Nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPUART1outputval = ClockNodeTypes{ .output = null };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = LPUART1outputval,
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_PCLK1,
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
                &APBPrescaler,
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
        const LPTIM2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM2Mult) |val| {
                    switch (val) {
                        .RCC_LPTIM2CLKSOURCE_PCLK1,
                        .RCC_LPTIM2CLKSOURCE_LSI,
                        .RCC_LPTIM2CLKSOURCE_HSI,
                        .RCC_LPTIM2CLKSOURCE_LSE,
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
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .Nodetype = LPTIM2Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &LSIRC,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM2outputval = ClockNodeTypes{ .output = null };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const LPUART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART2Mult) |val| {
                    switch (val) {
                        .RCC_LPUART2CLKSOURCE_PCLK1,
                        .RCC_LPUART2CLKSOURCE_SYSCLK,
                        .RCC_LPUART2CLKSOURCE_HSI,
                        .RCC_LPUART2CLKSOURCE_LSE,
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
        const LPUART2Mult: ClockNode = .{
            .name = "LPUART2Mult",
            .Nodetype = LPUART2Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPUART2outputval = ClockNodeTypes{ .output = null };
        const LPUART2output: ClockNode = .{
            .name = "LPUART2output",
            .Nodetype = LPUART2outputval,
            .parents = &[_]*const ClockNode{&LPUART2Mult},
        };
        const HSICECCDevisorval = ClockNodeTypes{
            .div = .{ .value = 488 },
        };
        const HSICECCDevisor: ClockNode = .{
            .name = "HSICECCDevisor",
            .Nodetype = HSICECCDevisorval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const CECMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CECMult) |val| {
                    switch (val) {
                        .RCC_CECCLKSOURCE_HSI_DIV488,
                        .RCC_CECCLKSOURCE_LSE,
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
        const CECMult: ClockNode = .{
            .name = "CECMult",
            .Nodetype = CECMultval,

            .parents = &[_]*const ClockNode{
                &HSICECCDevisor,
                &LSEOSC,
            },
        };
        const CECoutputval = ClockNodeTypes{ .output = null };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .Nodetype = CECoutputval,
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const TimPrescalerAPBval = blk: {
            if (APBPrescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const TimPrescalerAPB: ClockNode = .{
            .name = "TimPrescalerAPB",
            .Nodetype = TimPrescalerAPBval,
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const PLLQval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLQ) |val| {
                    switch (val) {
                        .RCC_PLLQ_DIV2,
                        .RCC_PLLQ_DIV3,
                        .RCC_PLLQ_DIV4,
                        .RCC_PLLQ_DIV5,
                        .RCC_PLLQ_DIV6,
                        .RCC_PLLQ_DIV7,
                        .RCC_PLLQ_DIV8,
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
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const TIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.TIM1Mult) |val| {
                    switch (val) {
                        .RCC_TIM1CLKSOURCE_PCLK1,
                        .RCC_TIM1CLKSOURCE_PLL,
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
        const TIM1Mult: ClockNode = .{
            .name = "TIM1Mult",
            .Nodetype = TIM1Multval,

            .parents = &[_]*const ClockNode{
                &TimPrescalerAPB,
                &PLLQ,
            },
        };
        const TIM1outputval = ClockNodeTypes{
            .output = .{ .max = 128000000, .min = 0 },
        };
        const TIM1output: ClockNode = .{
            .name = "TIM1output",
            .Nodetype = TIM1outputval,
            .parents = &[_]*const ClockNode{&TIM1Mult},
        };
        const TIM15Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.TIM15Mult) |val| {
                    switch (val) {
                        .RCC_TIM15CLKSOURCE_PCLK1,
                        .RCC_TIM15CLKSOURCE_PLL,
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
        const TIM15Mult: ClockNode = .{
            .name = "TIM15Mult",
            .Nodetype = TIM15Multval,

            .parents = &[_]*const ClockNode{
                &TimPrescalerAPB,
                &PLLQ,
            },
        };
        const TIM15outputval = ClockNodeTypes{ .output = null };
        const TIM15output: ClockNode = .{
            .name = "TIM15output",
            .Nodetype = TIM15outputval,
            .parents = &[_]*const ClockNode{&TIM15Mult},
        };
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_SYSCLK,
                        .RCC_ADCCLKSOURCE_HSI,
                        .RCC_ADCCLKSOURCE_PLLADC,
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
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .Nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &PLLP,
            },
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = 80000000, .min = 140000 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const RNGHSIDivval = ClockNodeTypes{
            .div = .{ .value = 8 },
        };
        const RNGHSIDiv: ClockNode = .{
            .name = "RNGHSIDiv",
            .Nodetype = RNGHSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const CK48Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CK48Mult) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_SYSCLK,
                        .RCC_RNGCLKSOURCE_PLL,
                        .RCC_RNGCLKSOURCE_HSI_DIV8,
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
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",
            .Nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLLQ,
                &RNGHSIDiv,
            },
        };
        const RNGDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.RNGDIV) |val| {
                    switch (val) {
                        .RCC_RNGCLK_DIV1,
                        .RCC_RNGCLK_DIV2,
                        .RCC_RNGCLK_DIV4,
                        .RCC_RNGCLK_DIV8,
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
        const RNGDIV: ClockNode = .{
            .name = "RNGDIV",
            .Nodetype = RNGDIVval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
        };
        const I2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C1Mult) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_PCLK1,
                        .RCC_I2C1CLKSOURCE_SYSCLK,
                        .RCC_I2C1CLKSOURCE_HSI,
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
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = I2C1outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C2Mult) |val| {
                    switch (val) {
                        .RCC_I2C2CLKSOURCE_PCLK1,
                        .RCC_I2C2CLKSOURCE_SYSCLK,
                        .RCC_I2C2CLKSOURCE_HSI,
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
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .Nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C2outputval = ClockNodeTypes{ .output = null };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .Nodetype = I2C2outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    switch (val) {
                        .RCC_FDCANCLKSOURCE_PCLK1,
                        .RCC_FDCANCLKSOURCE_PLL,
                        .RCC_FDCANCLKSOURCE_HSE,
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
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",
            .Nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &PLLQ,
                &HSEOSC,
            },
        };
        const FDCANoutputval = ClockNodeTypes{ .output = null };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .Nodetype = FDCANoutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const USBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBMult) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_HSI48,
                        .RCC_USBCLKSOURCE_PLL,
                        .RCC_USBCLKSOURCE_HSE,
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
        const USBMult: ClockNode = .{
            .name = "USBMult",
            .Nodetype = USBMultval,

            .parents = &[_]*const ClockNode{
                &HSI48RC,
                &PLLQ,
                &HSEOSC,
            },
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = 48120000, .min = 47880000 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_LSE,
                        .RCC_MCO1SOURCE_LSI,
                        .RCC_MCO1SOURCE_HSE,
                        .RCC_MCO1SOURCE_HSI,
                        .RCC_MCO1SOURCE_PLLCLK,
                        .RCC_MCO1SOURCE_SYSCLK,
                        .RCC_MCO1SOURCE_HSI48,
                        .RCC_MCO1SOURCE_PLLPCLK,
                        .RCC_MCO1SOURCE_PLLQCLK,
                        .RCC_MCO1SOURCE_RTCCLK,
                        .RCC_MCO1SOURCE_RTC_WKUP,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
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
                &PLLR,
                &SysCLKOutput,
                &HSI48RC,
                &PLLP,
                &PLLQ,
                &RTCClkSource,
                &RTCWkupOutput,
            },
        };
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    switch (val) {
                        .RCC_MCODIV_1,
                        .RCC_MCODIV_2,
                        .RCC_MCODIV_4,
                        .RCC_MCODIV_8,
                        .RCC_MCODIV_16,
                        .RCC_MCODIV_32,
                        .RCC_MCODIV_64,
                        .RCC_MCODIV_128,
                        .RCC_MCODIV_256,
                        .RCC_MCODIV_512,
                        .RCC_MCODIV_1024,
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
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    switch (val) {
                        .RCC_MCO2SOURCE_LSE,
                        .RCC_MCO2SOURCE_LSI,
                        .RCC_MCO2SOURCE_HSE,
                        .RCC_MCO2SOURCE_HSI,
                        .RCC_MCO2SOURCE_PLLCLK,
                        .RCC_MCO2SOURCE_SYSCLK,
                        .RCC_MCO2SOURCE_HSI48,
                        .RCC_MCO2SOURCE_PLLPCLK,
                        .RCC_MCO2SOURCE_PLLQCLK,
                        .RCC_MCO2SOURCE_RTCCLK,
                        .RCC_MCO2SOURCE_RTC_WKUP,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .Nodetype = MCO2Multval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &PLLR,
                &SysCLKOutput,
                &HSI48RC,
                &PLLP,
                &PLLQ,
                &RTCClkSource,
                &RTCWkupOutput,
            },
        };
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    switch (val) {
                        .RCC_MCO2DIV_1,
                        .RCC_MCO2DIV_2,
                        .RCC_MCO2DIV_4,
                        .RCC_MCO2DIV_8,
                        .RCC_MCO2DIV_16,
                        .RCC_MCO2DIV_32,
                        .RCC_MCO2DIV_64,
                        .RCC_MCO2DIV_128,
                        .RCC_MCO2DIV_256,
                        .RCC_MCO2DIV_512,
                        .RCC_MCO2DIV_1024,
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
        const LSCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LSCOMult) |val| {
                    switch (val) {
                        .RCC_LSCOSOURCE_LSI,
                        .RCC_LSCOSOURCE_LSE,
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
        const LSCOMult: ClockNode = .{
            .name = "LSCOMult",
            .Nodetype = LSCOMultval,

            .parents = &[_]*const ClockNode{
                &LSIRC,
                &LSEOSC,
            },
        };
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = LSCOOutputval,
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const PWRCLKoutputval = ClockNodeTypes{ .output = null };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = PWRCLKoutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
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
        const APBOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const APBOutput: ClockNode = .{
            .name = "APBOutput",
            .Nodetype = APBOutputval,
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB},
        };
        const PLLPoutputval = ClockNodeTypes{
            .output = .{ .max = 40000000, .min = 3090000 },
        };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .Nodetype = PLLPoutputval,
            .parents = &[_]*const ClockNode{&PLLP},
        };
        const PLLQoutputval = ClockNodeTypes{
            .output = .{ .max = 128000000, .min = 12000000 },
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLLQ},
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
                .value = if (config.HSICalibrationValue) |val| val.get() else 64,
                .limit = .{ .max = 127, .min = 0 },
            },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.LSE_Drive_Capability) |val| {
                    switch (val) {
                        .null,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        } };
        const LSE_Drive_CapabilityArgval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.LSE_Drive_CapabilityArg) |val| {
                    switch (val) {
                        .null,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        } };
        return .{
            .HSIRC = HSIRC,
            .HSISYS = HSISYS,
            .HSI48RC = HSI48RC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .RTCWkupOutput = RTCWkupOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .I2S1Mult = I2S1Mult,
            .I2S1output = I2S1output,
            .I2S2Mult = I2S2Mult,
            .I2S2output = I2S2output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .LPUART2Mult = LPUART2Mult,
            .LPUART2output = LPUART2output,
            .HSICECCDevisor = HSICECCDevisor,
            .CECMult = CECMult,
            .CECoutput = CECoutput,
            .TIM1Mult = TIM1Mult,
            .TIM1output = TIM1output,
            .TIM15Mult = TIM15Mult,
            .TIM15output = TIM15output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .RNGDIV = RNGDIV,
            .RNGHSIDiv = RNGHSIDiv,
            .CK48Mult = CK48Mult,
            .RNGoutput = RNGoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .FDCANMult = FDCANMult,
            .FDCANoutput = FDCANoutput,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .I2S_CKIN = I2S_CKIN,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .AHBPrescaler = AHBPrescaler,
            .PWRCLKoutput = PWRCLKoutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APBPrescaler = APBPrescaler,
            .APBOutput = APBOutput,
            .TimPrescalerAPB = TimPrescalerAPB,
            .TimPrescOut1 = TimPrescOut1,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLPoutput = PLLPoutput,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLR = PLLR,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
            .LSE_Drive_CapabilityArg = LSE_Drive_CapabilityArgval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.I2S1output.get_comptime();
        _ = self.I2S2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.LPUART2output.get_comptime();
        _ = self.CECoutput.get_comptime();
        _ = self.TIM1output.get_comptime();
        _ = self.TIM15output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.FDCANoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APBOutput.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
    }
};
