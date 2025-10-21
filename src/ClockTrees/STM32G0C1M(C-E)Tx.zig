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
    const Self = @This();

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

    pub fn init(comptime config: Config) Self {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .nodetype = HSIRCval,
        };
        const HSISYSval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSISYS) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSISYS: ClockNode = .{
            .name = "HSISYS",
            .nodetype = HSISYSval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .nodetype = HSI48RCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = @min(1_000_000_000, 48000000), .min = 4000000 },
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
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 1000 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .nodetype = LSEOSCval,
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
        const PLLMval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLM) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 8,
                .limit = .{ .max = @min(1_000_000_000, 86), .min = 8 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLRval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLR) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
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
                    break :inner 1;
                }
            },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .nodetype = SysClkSourceval,

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
            .nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    break :inner val.get();
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
        const RTCWkupOutputval = ClockNodeTypes{ .output = null };
        const RTCWkupOutput: ClockNode = .{
            .name = "RTCWkupOutput",
            .nodetype = RTCWkupOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
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
            .output = .{ .max = @min(1_000_000_000, 64000000), .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APBPrescaler: ClockNode = .{
            .name = "APBPrescaler",
            .nodetype = APBPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .nodetype = USART1Multval,

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
            .nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .nodetype = USART2Multval,

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
            .nodetype = USART2outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
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
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .nodetype = I2S_CKINval,
        };
        const I2S1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2S1Mult: ClockNode = .{
            .name = "I2S1Mult",
            .nodetype = I2S1Multval,

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
            .nodetype = I2S1outputval,
            .parents = &[_]*const ClockNode{&I2S1Mult},
        };
        const I2S2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2S2Mult: ClockNode = .{
            .name = "I2S2Mult",
            .nodetype = I2S2Multval,

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
            .nodetype = I2S2outputval,
            .parents = &[_]*const ClockNode{&I2S2Mult},
        };
        const USART3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",
            .nodetype = USART3Multval,

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
            .nodetype = USART3outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const LPUART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",
            .nodetype = LPUART1Multval,

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
            .nodetype = LPUART1outputval,
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .nodetype = LPTIM1Multval,

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
            .nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .nodetype = LPTIM2Multval,

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
            .nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const LPUART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPUART2Mult: ClockNode = .{
            .name = "LPUART2Mult",
            .nodetype = LPUART2Multval,

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
            .nodetype = LPUART2outputval,
            .parents = &[_]*const ClockNode{&LPUART2Mult},
        };
        const HSICECCDevisorval = ClockNodeTypes{
            .div = .{ .value = 488 },
        };
        const HSICECCDevisor: ClockNode = .{
            .name = "HSICECCDevisor",
            .nodetype = HSICECCDevisorval,
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
                &HSICECCDevisor,
                &LSEOSC,
            },
        };
        const CECoutputval = ClockNodeTypes{ .output = null };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .nodetype = CECoutputval,
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
            .nodetype = TimPrescalerAPBval,
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const PLLQval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLQ) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const TIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.TIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const TIM1Mult: ClockNode = .{
            .name = "TIM1Mult",
            .nodetype = TIM1Multval,

            .parents = &[_]*const ClockNode{
                &TimPrescalerAPB,
                &PLLQ,
            },
        };
        const TIM1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 128000000), .min = 0 },
        };
        const TIM1output: ClockNode = .{
            .name = "TIM1output",
            .nodetype = TIM1outputval,
            .parents = &[_]*const ClockNode{&TIM1Mult},
        };
        const TIM15Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.TIM15Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const TIM15Mult: ClockNode = .{
            .name = "TIM15Mult",
            .nodetype = TIM15Multval,

            .parents = &[_]*const ClockNode{
                &TimPrescalerAPB,
                &PLLQ,
            },
        };
        const TIM15outputval = ClockNodeTypes{ .output = null };
        const TIM15output: ClockNode = .{
            .name = "TIM15output",
            .nodetype = TIM15outputval,
            .parents = &[_]*const ClockNode{&TIM15Mult},
        };
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &PLLP,
            },
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 80000000), .min = 140000 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const RNGHSIDivval = ClockNodeTypes{
            .div = .{ .value = 8 },
        };
        const RNGHSIDiv: ClockNode = .{
            .name = "RNGHSIDiv",
            .nodetype = RNGHSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const CK48Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CK48Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",
            .nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLLQ,
                &RNGHSIDiv,
            },
        };
        const RNGDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.RNGDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const RNGDIV: ClockNode = .{
            .name = "RNGDIV",
            .nodetype = RNGDIVval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .nodetype = RNGoutputval,
        };
        const I2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .nodetype = I2C1outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C2outputval = ClockNodeTypes{ .output = null };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .nodetype = I2C2outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",
            .nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &PLLQ,
                &HSEOSC,
            },
        };
        const FDCANoutputval = ClockNodeTypes{ .output = null };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .nodetype = FDCANoutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
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
                &HSI48RC,
                &PLLQ,
                &HSEOSC,
            },
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48120000), .min = 47880000 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBMult},
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
            .nodetype = MCOMultval,

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
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCODiv: ClockNode = .{
            .name = "MCODiv",
            .nodetype = MCODivval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPinval = ClockNodeTypes{ .output = null };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .nodetype = MCOPinval,
            .parents = &[_]*const ClockNode{&MCODiv},
        };
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 5;
                }
            },
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .nodetype = MCO2Multval,

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
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const LSCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LSCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LSCOMult: ClockNode = .{
            .name = "LSCOMult",
            .nodetype = LSCOMultval,

            .parents = &[_]*const ClockNode{
                &LSIRC,
                &LSEOSC,
            },
        };
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .nodetype = LSCOOutputval,
            .parents = &[_]*const ClockNode{&LSCOMult},
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
        const APBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 64000000), .min = 0 },
        };
        const APBOutput: ClockNode = .{
            .name = "APBOutput",
            .nodetype = APBOutputval,
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB},
        };
        const PLLPoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 40000000), .min = 3090000 },
        };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .nodetype = PLLPoutputval,
            .parents = &[_]*const ClockNode{&PLLP},
        };
        const PLLQoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 128000000), .min = 12000000 },
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 64,
                .limit = .{ .max = @min(1_000_000_000, 127), .min = 0 },
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
                    break :inner val.get();
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
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSISYS.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.HSI48RC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.SysClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.HSISYS,
            &self.HSEOSC,
            &self.PLLR,
            &self.LSIRC,
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
        self.RTCWkupOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RTCClkSource,
        });
        self.IWDGOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIRC,
        });
        self.USART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.USART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART1Mult,
        });
        self.USART2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.USART2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART2Mult,
        });
        self.I2S1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.PLLP,
            &self.HSIRC,
            &self.I2S_CKIN,
        });
        self.I2S1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2S1Mult,
        });
        self.I2S2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.PLLP,
            &self.HSIRC,
            &self.I2S_CKIN,
        });
        self.I2S2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2S2Mult,
        });
        self.USART3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.USART3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART3Mult,
        });
        self.LPUART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPUART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPUART1Mult,
        });
        self.LPTIM1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.LSIRC,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPTIM1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM1Mult,
        });
        self.LPTIM2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.LSIRC,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPTIM2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM2Mult,
        });
        self.LPUART2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPUART2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPUART2Mult,
        });
        self.HSICECCDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.CECMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSICECCDevisor,
            &self.LSEOSC,
        });
        self.CECoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CECMult,
        });
        self.TIM1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB,
            &self.PLLQ,
        });
        self.TIM1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIM1Mult,
        });
        self.TIM15Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB,
            &self.PLLQ,
        });
        self.TIM15output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIM15Mult,
        });
        self.ADCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.PLLP,
        });
        self.ADCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCMult,
        });
        self.RNGDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CK48Mult,
        });
        self.RNGHSIDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.CK48Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.PLLQ,
            &self.RNGHSIDiv,
        });
        self.RNGoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RNGoutput,
        });
        self.I2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
        });
        self.I2C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C1Mult,
        });
        self.I2C2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
        });
        self.I2C2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C2Mult,
        });
        self.FDCANMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
            &self.PLLQ,
            &self.HSEOSC,
        });
        self.FDCANoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FDCANMult,
        });
        self.USBMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSI48RC,
            &self.PLLQ,
            &self.HSEOSC,
        });
        self.USBoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBMult,
        });
        self.I2S_CKIN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.MCOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.LSIRC,
            &self.HSEOSC,
            &self.HSIRC,
            &self.PLLR,
            &self.SysCLKOutput,
            &self.HSI48RC,
            &self.PLLP,
            &self.PLLQ,
            &self.RTCClkSource,
            &self.RTCWkupOutput,
        });
        self.MCODiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMult,
        });
        self.MCOPin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCODiv,
        });
        self.MCO2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.LSIRC,
            &self.HSEOSC,
            &self.HSIRC,
            &self.PLLR,
            &self.SysCLKOutput,
            &self.HSI48RC,
            &self.PLLP,
            &self.PLLQ,
            &self.RTCClkSource,
            &self.RTCWkupOutput,
        });
        self.MCO2Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Mult,
        });
        self.MCO2Pin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Div,
        });
        self.LSCOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIRC,
            &self.LSEOSC,
        });
        self.LSCOOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSCOMult,
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
        self.APBPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APBOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
        });
        self.TimPrescalerAPB.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APBPrescaler,
        });
        self.TimPrescOut1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB,
        });
        self.PLLN.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLM,
        });
        self.PLLP.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLLPoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLP,
        });
        self.PLLQ.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLLQoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLQ,
        });
        self.PLLR.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
    }
    pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
        alloc.free(self.HSIRC.parents.?);
        alloc.free(self.HSISYS.parents.?);
        alloc.free(self.HSI48RC.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.PLLSource.parents.?);
        alloc.free(self.PLLM.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.RTCWkupOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.USART1Mult.parents.?);
        alloc.free(self.USART1output.parents.?);
        alloc.free(self.USART2Mult.parents.?);
        alloc.free(self.USART2output.parents.?);
        alloc.free(self.I2S1Mult.parents.?);
        alloc.free(self.I2S1output.parents.?);
        alloc.free(self.I2S2Mult.parents.?);
        alloc.free(self.I2S2output.parents.?);
        alloc.free(self.USART3Mult.parents.?);
        alloc.free(self.USART3output.parents.?);
        alloc.free(self.LPUART1Mult.parents.?);
        alloc.free(self.LPUART1output.parents.?);
        alloc.free(self.LPTIM1Mult.parents.?);
        alloc.free(self.LPTIM1output.parents.?);
        alloc.free(self.LPTIM2Mult.parents.?);
        alloc.free(self.LPTIM2output.parents.?);
        alloc.free(self.LPUART2Mult.parents.?);
        alloc.free(self.LPUART2output.parents.?);
        alloc.free(self.HSICECCDevisor.parents.?);
        alloc.free(self.CECMult.parents.?);
        alloc.free(self.CECoutput.parents.?);
        alloc.free(self.TIM1Mult.parents.?);
        alloc.free(self.TIM1output.parents.?);
        alloc.free(self.TIM15Mult.parents.?);
        alloc.free(self.TIM15output.parents.?);
        alloc.free(self.ADCMult.parents.?);
        alloc.free(self.ADCoutput.parents.?);
        alloc.free(self.RNGDIV.parents.?);
        alloc.free(self.RNGHSIDiv.parents.?);
        alloc.free(self.CK48Mult.parents.?);
        alloc.free(self.RNGoutput.parents.?);
        alloc.free(self.I2C1Mult.parents.?);
        alloc.free(self.I2C1output.parents.?);
        alloc.free(self.I2C2Mult.parents.?);
        alloc.free(self.I2C2output.parents.?);
        alloc.free(self.FDCANMult.parents.?);
        alloc.free(self.FDCANoutput.parents.?);
        alloc.free(self.USBMult.parents.?);
        alloc.free(self.USBoutput.parents.?);
        alloc.free(self.I2S_CKIN.parents.?);
        alloc.free(self.MCOMult.parents.?);
        alloc.free(self.MCODiv.parents.?);
        alloc.free(self.MCOPin.parents.?);
        alloc.free(self.MCO2Mult.parents.?);
        alloc.free(self.MCO2Div.parents.?);
        alloc.free(self.MCO2Pin.parents.?);
        alloc.free(self.LSCOMult.parents.?);
        alloc.free(self.LSCOOutput.parents.?);
        alloc.free(self.AHBPrescaler.parents.?);
        alloc.free(self.PWRCLKoutput.parents.?);
        alloc.free(self.AHBOutput.parents.?);
        alloc.free(self.HCLKOutput.parents.?);
        alloc.free(self.CortexPrescaler.parents.?);
        alloc.free(self.CortexSysOutput.parents.?);
        alloc.free(self.FCLKCortexOutput.parents.?);
        alloc.free(self.APBPrescaler.parents.?);
        alloc.free(self.APBOutput.parents.?);
        alloc.free(self.TimPrescalerAPB.parents.?);
        alloc.free(self.TimPrescOut1.parents.?);
        alloc.free(self.PLLN.parents.?);
        alloc.free(self.PLLP.parents.?);
        alloc.free(self.PLLPoutput.parents.?);
        alloc.free(self.PLLQ.parents.?);
        alloc.free(self.PLLQoutput.parents.?);
        alloc.free(self.PLLR.parents.?);
    }
    pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        self.HSIRC.nodetype = HSIRCval;
        const HSISYSval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSISYS) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.HSISYS.nodetype = HSISYSval;
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        self.HSI48RC.nodetype = HSI48RCval;
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = @min(1_000_000_000, 48000000), .min = 4000000 },
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
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 1000 },
            },
        };
        self.LSEOSC.nodetype = LSEOSCval;
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
        const PLLMval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLM) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PLLM.nodetype = PLLMval;
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 8,
                .limit = .{ .max = @min(1_000_000_000, 86), .min = 8 },
            },
        };
        self.PLLN.nodetype = PLLNval;
        const PLLRval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLR) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.PLLR.nodetype = PLLRval;
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.SysClkSource.nodetype = SysClkSourceval;
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        self.SysCLKOutput.nodetype = SysCLKOutputval;
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        self.HSERTCDevisor.nodetype = HSERTCDevisorval;
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.RTCClkSource.nodetype = RTCClkSourceval;
        const RTCOutputval = ClockNodeTypes{ .output = null };
        self.RTCOutput.nodetype = RTCOutputval;
        const RTCWkupOutputval = ClockNodeTypes{ .output = null };
        self.RTCWkupOutput.nodetype = RTCWkupOutputval;
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        self.IWDGOutput.nodetype = IWDGOutputval;
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
            .output = .{ .max = @min(1_000_000_000, 64000000), .min = 0 },
        };
        self.AHBOutput.nodetype = AHBOutputval;
        const APBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APBPrescaler.nodetype = APBPrescalerval;
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART1Mult.nodetype = USART1Multval;
        const USART1outputval = ClockNodeTypes{ .output = null };
        self.USART1output.nodetype = USART1outputval;
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART2Mult.nodetype = USART2Multval;
        const USART2outputval = ClockNodeTypes{ .output = null };
        self.USART2output.nodetype = USART2outputval;
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
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        self.I2S_CKIN.nodetype = I2S_CKINval;
        const I2S1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2S1Mult.nodetype = I2S1Multval;
        const I2S1outputval = ClockNodeTypes{ .output = null };
        self.I2S1output.nodetype = I2S1outputval;
        const I2S2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2S2Mult.nodetype = I2S2Multval;
        const I2S2outputval = ClockNodeTypes{ .output = null };
        self.I2S2output.nodetype = I2S2outputval;
        const USART3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART3Mult.nodetype = USART3Multval;
        const USART3outputval = ClockNodeTypes{ .output = null };
        self.USART3output.nodetype = USART3outputval;
        const LPUART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPUART1Mult.nodetype = LPUART1Multval;
        const LPUART1outputval = ClockNodeTypes{ .output = null };
        self.LPUART1output.nodetype = LPUART1outputval;
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM1Mult.nodetype = LPTIM1Multval;
        const LPTIM1outputval = ClockNodeTypes{ .output = null };
        self.LPTIM1output.nodetype = LPTIM1outputval;
        const LPTIM2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM2Mult.nodetype = LPTIM2Multval;
        const LPTIM2outputval = ClockNodeTypes{ .output = null };
        self.LPTIM2output.nodetype = LPTIM2outputval;
        const LPUART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPUART2Mult.nodetype = LPUART2Multval;
        const LPUART2outputval = ClockNodeTypes{ .output = null };
        self.LPUART2output.nodetype = LPUART2outputval;
        const HSICECCDevisorval = ClockNodeTypes{
            .div = .{ .value = 488 },
        };
        self.HSICECCDevisor.nodetype = HSICECCDevisorval;
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
        const CECoutputval = ClockNodeTypes{ .output = null };
        self.CECoutput.nodetype = CECoutputval;
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
        self.TimPrescalerAPB.nodetype = TimPrescalerAPBval;
        const PLLQval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLQ) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.PLLQ.nodetype = PLLQval;
        const TIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.TIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.TIM1Mult.nodetype = TIM1Multval;
        const TIM1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 128000000), .min = 0 },
        };
        self.TIM1output.nodetype = TIM1outputval;
        const TIM15Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.TIM15Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.TIM15Mult.nodetype = TIM15Multval;
        const TIM15outputval = ClockNodeTypes{ .output = null };
        self.TIM15output.nodetype = TIM15outputval;
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ADCMult.nodetype = ADCMultval;
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 80000000), .min = 140000 },
        };
        self.ADCoutput.nodetype = ADCoutputval;
        const RNGHSIDivval = ClockNodeTypes{
            .div = .{ .value = 8 },
        };
        self.RNGHSIDiv.nodetype = RNGHSIDivval;
        const CK48Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CK48Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.CK48Mult.nodetype = CK48Multval;
        const RNGDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.RNGDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.RNGDIV.nodetype = RNGDIVval;
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.RNGoutput.nodetype = RNGoutputval;
        const I2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C1Mult.nodetype = I2C1Multval;
        const I2C1outputval = ClockNodeTypes{ .output = null };
        self.I2C1output.nodetype = I2C1outputval;
        const I2C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C2Mult.nodetype = I2C2Multval;
        const I2C2outputval = ClockNodeTypes{ .output = null };
        self.I2C2output.nodetype = I2C2outputval;
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.FDCANMult.nodetype = FDCANMultval;
        const FDCANoutputval = ClockNodeTypes{ .output = null };
        self.FDCANoutput.nodetype = FDCANoutputval;
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
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48120000), .min = 47880000 },
        };
        self.USBoutput.nodetype = USBoutputval;
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 5;
                }
            },
        };
        self.MCOMult.nodetype = MCOMultval;
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCODiv.nodetype = MCODivval;
        const MCOPinval = ClockNodeTypes{ .output = null };
        self.MCOPin.nodetype = MCOPinval;
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 5;
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
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        self.MCO2Pin.nodetype = MCO2Pinval;
        const LSCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LSCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LSCOMult.nodetype = LSCOMultval;
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        self.LSCOOutput.nodetype = LSCOOutputval;
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
        const APBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 64000000), .min = 0 },
        };
        self.APBOutput.nodetype = APBOutputval;
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        self.TimPrescOut1.nodetype = TimPrescOut1val;
        const PLLPoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 40000000), .min = 3090000 },
        };
        self.PLLPoutput.nodetype = PLLPoutputval;
        const PLLQoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 128000000), .min = 12000000 },
        };
        self.PLLQoutput.nodetype = PLLQoutputval;
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        self.HSE_Timout = HSE_Timoutval;
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        self.LSE_Timout = LSE_Timoutval;
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 64,
                .limit = .{ .max = @min(1_000_000_000, 127), .min = 0 },
            },
        };
        self.HSICalibrationValue = HSICalibrationValueval;
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
                    return error.InvalidConfig;
                } else {
                    break :inner 0;
                }
            },
        } };
        self.LSE_Drive_Capability = LSE_Drive_Capabilityval;
        const LSE_Drive_CapabilityArgval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.LSE_Drive_CapabilityArg) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
        self.LSE_Drive_CapabilityArg = LSE_Drive_CapabilityArgval;
    }
};
