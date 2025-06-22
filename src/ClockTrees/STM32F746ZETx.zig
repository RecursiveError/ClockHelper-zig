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

    pub fn max() f32 {
        return 26000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const LSI_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 47000;
    }

    pub fn min() f32 {
        return 17000;
    }
};
pub const LSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 1000000;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,
};
pub const PLLMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 2;
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
            .RCC_RTCCLKSOURCE_HSE_DIV2 => 2,
            .RCC_RTCCLKSOURCE_HSE_DIV3 => 3,
            .RCC_RTCCLKSOURCE_HSE_DIV4 => 4,
            .RCC_RTCCLKSOURCE_HSE_DIV5 => 5,
            .RCC_RTCCLKSOURCE_HSE_DIV6 => 6,
            .RCC_RTCCLKSOURCE_HSE_DIV7 => 7,
            .RCC_RTCCLKSOURCE_HSE_DIV8 => 8,
            .RCC_RTCCLKSOURCE_HSE_DIV9 => 9,
            .RCC_RTCCLKSOURCE_HSE_DIV10 => 10,
            .RCC_RTCCLKSOURCE_HSE_DIV11 => 11,
            .RCC_RTCCLKSOURCE_HSE_DIV12 => 12,
            .RCC_RTCCLKSOURCE_HSE_DIV13 => 13,
            .RCC_RTCCLKSOURCE_HSE_DIV14 => 14,
            .RCC_RTCCLKSOURCE_HSE_DIV15 => 15,
            .RCC_RTCCLKSOURCE_HSE_DIV16 => 16,
            .RCC_RTCCLKSOURCE_HSE_DIV17 => 17,
            .RCC_RTCCLKSOURCE_HSE_DIV18 => 18,
            .RCC_RTCCLKSOURCE_HSE_DIV19 => 19,
            .RCC_RTCCLKSOURCE_HSE_DIV20 => 20,
            .RCC_RTCCLKSOURCE_HSE_DIV21 => 21,
            .RCC_RTCCLKSOURCE_HSE_DIV22 => 22,
            .RCC_RTCCLKSOURCE_HSE_DIV23 => 23,
            .RCC_RTCCLKSOURCE_HSE_DIV24 => 24,
            .RCC_RTCCLKSOURCE_HSE_DIV25 => 25,
            .RCC_RTCCLKSOURCE_HSE_DIV26 => 26,
            .RCC_RTCCLKSOURCE_HSE_DIV27 => 27,
            .RCC_RTCCLKSOURCE_HSE_DIV28 => 28,
            .RCC_RTCCLKSOURCE_HSE_DIV29 => 29,
            .RCC_RTCCLKSOURCE_HSE_DIV30 => 30,
            .RCC_RTCCLKSOURCE_HSE_DIV31 => 31,
        };
    }
};
pub const RTCClockSelectionConf = enum {
    HSERTCDevisor,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_SYSCLK,
    RCC_I2C1CLKSOURCE_HSI,
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_SYSCLK,
    RCC_I2C2CLKSOURCE_HSI,
};
pub const I2C3CLockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK1,
    RCC_I2C3CLKSOURCE_SYSCLK,
    RCC_I2C3CLKSOURCE_HSI,
};
pub const I2C4CLockSelectionConf = enum {
    RCC_I2C4CLKSOURCE_PCLK1,
    RCC_I2C4CLKSOURCE_SYSCLK,
    RCC_I2C4CLKSOURCE_HSI,
};
pub const PLL48CLockSelectionConf = enum {
    RCC_CLK48SOURCE_PLL,
    RCC_CLK48SOURCE_PLLSAIP,
};
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PLLSAI,
    RCC_SAI1CLKSOURCE_PLLI2S,
    RCC_SAI1CLKSOURCE_PIN,
};
pub const SAI2CLockSelectionConf = enum {
    RCC_SAI2CLKSOURCE_PLLSAI,
    RCC_SAI2CLKSOURCE_PLLI2S,
    RCC_SAI2CLKSOURCE_PIN,
};
pub const I2SCLockSelectionConf = enum {
    RCC_I2SCLKSOURCE_PLLI2S,
    RCC_I2SCLKSOURCE_EXT,
};
pub const SDMMCClockSelectionConf = enum {
    RCC_SDMMC1CLKSOURCE_CLK48,
    RCC_SDMMC1CLKSOURCE_SYSCLK,
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,
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
            .RCC_MCODIV_3 => 3,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_5 => 5,
        };
    }
};
pub const RCC_MCO2SourceConf = enum {
    RCC_MCO2SOURCE_SYSCLK,
    RCC_MCO2SOURCE_PLLI2SCLK,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_PLLCLK,
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
            .RCC_MCODIV_3 => 3,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_5 => 5,
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
            .RCC_SYSCLK_DIV1 => 1,
            .RCC_SYSCLK_DIV2 => 2,
            .RCC_SYSCLK_DIV4 => 4,
            .RCC_SYSCLK_DIV8 => 8,
            .RCC_SYSCLK_DIV16 => 16,
            .RCC_SYSCLK_DIV64 => 64,
            .RCC_SYSCLK_DIV128 => 128,
            .RCC_SYSCLK_DIV256 => 256,
            .RCC_SYSCLK_DIV512 => 512,
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
            .RCC_HCLK_DIV1 => 1,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV16 => 16,
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
            .RCC_HCLK_DIV1 => 1,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV16 => 16,
        };
    }
};
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
};
pub const USART2CLockSelectionConf = enum {
    RCC_USART2CLKSOURCE_PCLK1,
    RCC_USART2CLKSOURCE_SYSCLK,
    RCC_USART2CLKSOURCE_HSI,
    RCC_USART2CLKSOURCE_LSE,
};
pub const USART3CLockSelectionConf = enum {
    RCC_USART3CLKSOURCE_PCLK1,
    RCC_USART3CLKSOURCE_SYSCLK,
    RCC_USART3CLKSOURCE_HSI,
    RCC_USART3CLKSOURCE_LSE,
};
pub const USART6CLockSelectionConf = enum {
    RCC_USART6CLKSOURCE_PCLK2,
    RCC_USART6CLKSOURCE_SYSCLK,
    RCC_USART6CLKSOURCE_HSI,
    RCC_USART6CLKSOURCE_LSE,
};
pub const UART4CLockSelectionConf = enum {
    RCC_UART4CLKSOURCE_PCLK1,
    RCC_UART4CLKSOURCE_SYSCLK,
    RCC_UART4CLKSOURCE_HSI,
    RCC_UART4CLKSOURCE_LSE,
};
pub const UART5CLockSelectionConf = enum {
    RCC_UART5CLKSOURCE_PCLK1,
    RCC_UART5CLKSOURCE_SYSCLK,
    RCC_UART5CLKSOURCE_HSI,
    RCC_UART5CLKSOURCE_LSE,
};
pub const UART7CLockSelectionConf = enum {
    RCC_UART7CLKSOURCE_PCLK1,
    RCC_UART7CLKSOURCE_SYSCLK,
    RCC_UART7CLKSOURCE_HSI,
    RCC_UART7CLKSOURCE_LSE,
};
pub const UART8CLockSelectionConf = enum {
    RCC_UART8CLKSOURCE_PCLK1,
    RCC_UART8CLKSOURCE_SYSCLK,
    RCC_UART8CLKSOURCE_HSI,
    RCC_UART8CLKSOURCE_LSE,
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,
};
pub const CECClockSelectionConf = enum {
    RCC_CECCLKSOURCE_HSI,
    RCC_CECCLKSOURCE_LSE,
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 432;
    }

    pub fn min() f32 {
        return 50;
    }
};
pub const PLLPConf = enum {
    RCC_PLLP_DIV2,
    RCC_PLLP_DIV4,
    RCC_PLLP_DIV6,
    RCC_PLLP_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV2 => 2,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV8 => 8,
        };
    }
};
pub const PLLQConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 15;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLSAINConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 432;
    }

    pub fn min() f32 {
        return 50;
    }
};
pub const PLLSAIPConf = enum {
    RCC_PLLSAIP_DIV2,
    RCC_PLLSAIP_DIV4,
    RCC_PLLSAIP_DIV6,
    RCC_PLLSAIP_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLSAIP_DIV2 => 2,
            .RCC_PLLSAIP_DIV4 => 4,
            .RCC_PLLSAIP_DIV6 => 6,
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

    pub fn max() f32 {
        return 15;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLSAIQDivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLLSAIRConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLSAIRDivConf = enum {
    RCC_PLLSAIDIVR_2,
    RCC_PLLSAIDIVR_4,
    RCC_PLLSAIDIVR_8,
    RCC_PLLSAIDIVR_16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLSAIDIVR_2 => 2,
            .RCC_PLLSAIDIVR_4 => 4,
            .RCC_PLLSAIDIVR_8 => 8,
            .RCC_PLLSAIDIVR_16 => 16,
        };
    }
};
pub const PLLI2SNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 432;
    }

    pub fn min() f32 {
        return 50;
    }
};
pub const PLLI2SPConf = enum {
    RCC_PLLP_DIV2,
    RCC_PLLP_DIV4,
    RCC_PLLP_DIV6,
    RCC_PLLP_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV2 => 2,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV8 => 8,
        };
    }
};
pub const PLLI2SQConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 15;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLI2SQDivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLLI2SRConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const HSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const LSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 31;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const RCC_TIM_PRescaler_SelectionConf = enum {
    RCC_TIMPRES_ACTIVATED,
    RCC_TIMPRES_DESACTIVATED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TIMPRES_ACTIVATED => 0,
            .RCC_TIMPRES_DESACTIVATED => 1,
        };
    }
};
pub const LSE_Drive_CapabilityConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSE_VALUEConf = @enumFromInt(25000000),
    LSIRC: LSI_VALUEConf = @enumFromInt(32000),
    LSEOSC: LSE_VALUEConf = @enumFromInt(32768),
    SysClkSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_HSI,
    PLLSource: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLM: PLLMConf = @enumFromInt(16),
    HSERTCDevisor: RCC_RTC_Clock_Source_FROM_HSEConf = .RCC_RTCCLKSOURCE_HSE_DIV2,
    RTCClkSource: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    I2C1Mult: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    I2C2Mult: I2C2CLockSelectionConf = .RCC_I2C2CLKSOURCE_PCLK1,
    I2C3Mult: I2C3CLockSelectionConf = .RCC_I2C3CLKSOURCE_PCLK1,
    I2C4Mult: I2C4CLockSelectionConf = .RCC_I2C4CLKSOURCE_PCLK1,
    PLL48Mult: PLL48CLockSelectionConf = .RCC_CLK48SOURCE_PLL,
    SAI1Mult: SAI1CLockSelectionConf = .RCC_SAI1CLKSOURCE_PLLSAI,
    SAI2Mult: SAI2CLockSelectionConf = .RCC_SAI2CLKSOURCE_PLLSAI,
    I2SMult: I2SCLockSelectionConf = .RCC_I2SCLKSOURCE_PLLI2S,
    SDMMCMult: SDMMCClockSelectionConf = .RCC_SDMMC1CLKSOURCE_SYSCLK,
    MCO1Mult: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_HSI,
    MCO1Div: RCC_MCODiv1Conf = .RCC_MCODIV_1,
    MCO2Mult: RCC_MCO2SourceConf = .RCC_MCO2SOURCE_SYSCLK,
    MCO2Div: RCC_MCODiv2Conf = .RCC_MCODIV_1,
    AHBPrescaler: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    CortexPrescaler: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1Prescaler: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2Prescaler: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    USART1Mult: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    USART2Mult: USART2CLockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3Mult: USART3CLockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    USART6Mult: USART6CLockSelectionConf = .RCC_USART6CLKSOURCE_PCLK2,
    UART4Mult: UART4CLockSelectionConf = .RCC_UART4CLKSOURCE_PCLK1,
    UART5Mult: UART5CLockSelectionConf = .RCC_UART5CLKSOURCE_PCLK1,
    UART7Mult: UART7CLockSelectionConf = .RCC_UART7CLKSOURCE_PCLK1,
    UART8Mult: UART8CLockSelectionConf = .RCC_UART8CLKSOURCE_PCLK1,
    LPTIM1Mult: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK,
    CECMult: CECClockSelectionConf = .RCC_CECCLKSOURCE_HSI,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .RCC_PLLP_DIV2,
    PLLQ: PLLQConf = @enumFromInt(2),
    PLLSAIN: PLLSAINConf = @enumFromInt(192),
    PLLSAIP: PLLSAIPConf = .RCC_PLLSAIP_DIV2,
    PLLSAIQ: PLLSAIQConf = @enumFromInt(2),
    PLLSAIQDiv: PLLSAIQDivConf = @enumFromInt(1),
    PLLSAIR: PLLSAIRConf = @enumFromInt(2),
    PLLSAIRDiv: PLLSAIRDivConf = .RCC_PLLSAIDIVR_2,
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SP: PLLI2SPConf = .RCC_PLLP_DIV2,
    PLLI2SQ: PLLI2SQConf = @enumFromInt(2),
    PLLI2SQDiv: PLLI2SQDivConf = @enumFromInt(1),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionConf = .RCC_TIMPRES_DESACTIVATED,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: HSE_VALUEConf = @enumFromInt(25000000),
    LSI_VALUE: LSI_VALUEConf = @enumFromInt(32000),
    LSE_VALUE: LSE_VALUEConf = @enumFromInt(32768),
    SYSCLKSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_HSI,
    PLLSourceVirtual: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLM: PLLMConf = @enumFromInt(16),
    RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEConf = .RCC_RTCCLKSOURCE_HSE_DIV2,
    RTCClockSelection: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    I2C1CLockSelection: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    I2C2CLockSelection: I2C2CLockSelectionConf = .RCC_I2C2CLKSOURCE_PCLK1,
    I2C3CLockSelection: I2C3CLockSelectionConf = .RCC_I2C3CLKSOURCE_PCLK1,
    I2C4CLockSelection: I2C4CLockSelectionConf = .RCC_I2C4CLKSOURCE_PCLK1,
    PLL48CLockSelection: PLL48CLockSelectionConf = .RCC_CLK48SOURCE_PLL,
    SAI1CLockSelection: SAI1CLockSelectionConf = .RCC_SAI1CLKSOURCE_PLLSAI,
    SAI2CLockSelection: SAI2CLockSelectionConf = .RCC_SAI2CLKSOURCE_PLLSAI,
    I2SCLockSelection: I2SCLockSelectionConf = .RCC_I2SCLKSOURCE_PLLI2S,
    SDMMCClockSelection: SDMMCClockSelectionConf = .RCC_SDMMC1CLKSOURCE_SYSCLK,
    RCC_MCO1Source: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_HSI,
    RCC_MCODiv1: RCC_MCODiv1Conf = .RCC_MCODIV_1,
    RCC_MCO2Source: RCC_MCO2SourceConf = .RCC_MCO2SOURCE_SYSCLK,
    RCC_MCODiv2: RCC_MCODiv2Conf = .RCC_MCODIV_1,
    AHBCLKDivider: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    Cortex_Div: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1CLKDivider: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2CLKDivider: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    USART1CLockSelection: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    USART2CLockSelection: USART2CLockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3CLockSelection: USART3CLockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    USART6CLockSelection: USART6CLockSelectionConf = .RCC_USART6CLKSOURCE_PCLK2,
    UART4CLockSelection: UART4CLockSelectionConf = .RCC_UART4CLKSOURCE_PCLK1,
    UART5CLockSelection: UART5CLockSelectionConf = .RCC_UART5CLKSOURCE_PCLK1,
    UART7CLockSelection: UART7CLockSelectionConf = .RCC_UART7CLKSOURCE_PCLK1,
    UART8CLockSelection: UART8CLockSelectionConf = .RCC_UART8CLKSOURCE_PCLK1,
    LPTIM1CLockSelection: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK,
    CECClockSelection: CECClockSelectionConf = .RCC_CECCLKSOURCE_HSI,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .RCC_PLLP_DIV2,
    PLLQ: PLLQConf = @enumFromInt(2),
    PLLSAIN: PLLSAINConf = @enumFromInt(192),
    PLLSAIP: PLLSAIPConf = .RCC_PLLSAIP_DIV2,
    PLLSAIQ: PLLSAIQConf = @enumFromInt(2),
    PLLSAIQDiv: PLLSAIQDivConf = @enumFromInt(1),
    PLLSAIR: PLLSAIRConf = @enumFromInt(2),
    PLLSAIRDiv: PLLSAIRDivConf = .RCC_PLLSAIDIVR_2,
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SP: PLLI2SPConf = .RCC_PLLP_DIV2,
    PLLI2SQ: PLLI2SQConf = @enumFromInt(2),
    PLLI2SQDiv: PLLI2SQDivConf = @enumFromInt(1),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionConf = .RCC_TIMPRES_DESACTIVATED,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSIRC = self.LSI_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCClockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .I2C4Mult = self.I2C4CLockSelection,
            .PLL48Mult = self.PLL48CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .SAI2Mult = self.SAI2CLockSelection,
            .I2SMult = self.I2SCLockSelection,
            .SDMMCMult = self.SDMMCClockSelection,
            .MCO1Mult = self.RCC_MCO1Source,
            .MCO1Div = self.RCC_MCODiv1,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCODiv2,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .USART1Mult = self.USART1CLockSelection,
            .USART2Mult = self.USART2CLockSelection,
            .USART3Mult = self.USART3CLockSelection,
            .USART6Mult = self.USART6CLockSelection,
            .UART4Mult = self.UART4CLockSelection,
            .UART5Mult = self.UART5CLockSelection,
            .UART7Mult = self.UART7CLockSelection,
            .UART8Mult = self.UART8CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .CECMult = self.CECClockSelection,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLSAIN = self.PLLSAIN,
            .PLLSAIP = self.PLLSAIP,
            .PLLSAIQ = self.PLLSAIQ,
            .PLLSAIQDiv = self.PLLSAIQDiv,
            .PLLSAIR = self.PLLSAIR,
            .PLLSAIRDiv = self.PLLSAIRDiv,
            .PLLI2SN = self.PLLI2SN,
            .PLLI2SP = self.PLLI2SP,
            .PLLI2SQ = self.PLLI2SQ,
            .PLLI2SQDiv = self.PLLI2SQDiv,
            .PLLI2SR = self.PLLI2SR,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .RCC_TIM_PRescaler_Selection = self.RCC_TIM_PRescaler_Selection,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
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
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    PLL48Mult: ClockNode,
    RNGoutput: ClockNode,
    USBoutput: ClockNode,
    LCDTFTKOutput: ClockNode,
    SPDIFoutput: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    I2SMult: ClockNode,
    I2Soutput: ClockNode,
    SDMMCMult: ClockNode,
    SDMMCoutput: ClockNode,
    EthernetPtpOutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    AHBPrescaler: ClockNode,
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
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    USART6Mult: ClockNode,
    USART6output: ClockNode,
    UART4Mult: ClockNode,
    UART4output: ClockNode,
    UART5Mult: ClockNode,
    UART5output: ClockNode,
    UART7Mult: ClockNode,
    UART7output: ClockNode,
    UART8Mult: ClockNode,
    UART8output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1Output: ClockNode,
    HSIDivCEC: ClockNode,
    CECMult: ClockNode,
    CECOutput: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLSAIN: ClockNode,
    PLLSAIP: ClockNode,
    PLLSAIoutput: ClockNode,
    PLLSAIQ: ClockNode,
    PLLSAIQDiv: ClockNode,
    PLLSAIR: ClockNode,
    PLLSAIRDiv: ClockNode,
    PLLI2SN: ClockNode,
    PLLI2SP: ClockNode,
    PLLI2SQ: ClockNode,
    PLLI2SQDiv: ClockNode,
    PLLI2SR: ClockNode,
    PLLI2SRoutput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    RCC_TIM_PRescaler_Selection: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

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
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 26000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 47000, .min = 17000 },
            },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.LSEOSC.get(),
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
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
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
                .value = config.PLLM.get(),
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
                .value = config.PLLN.get(),
                .limit = .{ .max = 432, .min = 50 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLPval = ClockNodeTypes{ .div = .{ .value = config.PLLP.get() } };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = PLLPval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &PLLP,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const HSERTCDevisorval = ClockNodeTypes{ .div = .{ .value = config.HSERTCDevisor.get() } };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.RTCClkSource) };
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
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 216000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB1Prescaler.get() } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const I2C1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C1Mult) };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
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
        const I2C2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C2Mult) };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .Nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
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
        const I2C3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C3Mult) };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C3outputval = ClockNodeTypes{ .output = null };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = I2C3outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2C4Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C4Mult) };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",
            .Nodetype = I2C4Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C4outputval = ClockNodeTypes{ .output = null };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = I2C4outputval,
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const PLLQval = ClockNodeTypes{
            .div = .{
                .value = config.PLLQ.get(),
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
                .value = config.PLLSAIN.get(),
                .limit = .{ .max = 432, .min = 50 },
            },
        };
        const PLLSAIN: ClockNode = .{
            .name = "PLLSAIN",
            .Nodetype = PLLSAINval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLSAIPval = ClockNodeTypes{ .div = .{ .value = config.PLLSAIP.get() } };
        const PLLSAIP: ClockNode = .{
            .name = "PLLSAIP",
            .Nodetype = PLLSAIPval,
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLL48Multval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL48Mult) };
        const PLL48Mult: ClockNode = .{
            .name = "PLL48Mult",
            .Nodetype = PLL48Multval,

            .parents = &[_]*const ClockNode{
                &PLLQ,
                &PLLSAIP,
            },
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&PLL48Mult},
        };
        const USBoutputval = ClockNodeTypes{ .output = null };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&PLL48Mult},
        };
        const PLLSAIRval = ClockNodeTypes{
            .div = .{
                .value = config.PLLSAIR.get(),
                .limit = .{ .max = 7, .min = 2 },
            },
        };
        const PLLSAIR: ClockNode = .{
            .name = "PLLSAIR",
            .Nodetype = PLLSAIRval,
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAIRDivval = ClockNodeTypes{ .div = .{ .value = config.PLLSAIRDiv.get() } };
        const PLLSAIRDiv: ClockNode = .{
            .name = "PLLSAIRDiv",
            .Nodetype = PLLSAIRDivval,
            .parents = &[_]*const ClockNode{&PLLSAIR},
        };
        const LCDTFTKOutputval = ClockNodeTypes{
            .output = .{ .max = 45000000, .min = 0 },
        };
        const LCDTFTKOutput: ClockNode = .{
            .name = "LCDTFTKOutput",
            .Nodetype = LCDTFTKOutputval,
            .parents = &[_]*const ClockNode{&PLLSAIRDiv},
        };
        const PLLI2SNval = ClockNodeTypes{
            .mul = .{
                .value = config.PLLI2SN.get(),
                .limit = .{ .max = 432, .min = 50 },
            },
        };
        const PLLI2SN: ClockNode = .{
            .name = "PLLI2SN",
            .Nodetype = PLLI2SNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLI2SPval = ClockNodeTypes{ .div = .{ .value = config.PLLI2SP.get() } };
        const PLLI2SP: ClockNode = .{
            .name = "PLLI2SP",
            .Nodetype = PLLI2SPval,
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const SPDIFoutputval = ClockNodeTypes{
            .output = .{ .max = 0, .min = 5632000 },
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .Nodetype = SPDIFoutputval,
            .parents = &[_]*const ClockNode{&PLLI2SP},
        };
        const PLLSAIQval = ClockNodeTypes{
            .div = .{
                .value = config.PLLSAIQ.get(),
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
                .value = config.PLLSAIQDiv.get(),
                .limit = .{ .max = 32, .min = 1 },
            },
        };
        const PLLSAIQDiv: ClockNode = .{
            .name = "PLLSAIQDiv",
            .Nodetype = PLLSAIQDivval,
            .parents = &[_]*const ClockNode{&PLLSAIQ},
        };
        const PLLI2SQval = ClockNodeTypes{
            .div = .{
                .value = config.PLLI2SQ.get(),
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
                .value = config.PLLI2SQDiv.get(),
                .limit = .{ .max = 32, .min = 1 },
            },
        };
        const PLLI2SQDiv: ClockNode = .{
            .name = "PLLI2SQDiv",
            .Nodetype = PLLI2SQDivval,
            .parents = &[_]*const ClockNode{&PLLI2SQ},
        };
        const SAI1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SAI1Mult) };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",
            .Nodetype = SAI1Multval,

            .parents = &[_]*const ClockNode{
                &PLLSAIQDiv,
                &PLLI2SQDiv,
                &I2S_CKIN,
            },
        };
        const SAI1outputval = ClockNodeTypes{ .output = null };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SAI2Mult) };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",
            .Nodetype = SAI2Multval,

            .parents = &[_]*const ClockNode{
                &PLLSAIQDiv,
                &PLLI2SQDiv,
                &I2S_CKIN,
            },
        };
        const SAI2outputval = ClockNodeTypes{ .output = null };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = SAI2outputval,
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const PLLI2SRval = ClockNodeTypes{
            .div = .{
                .value = config.PLLI2SR.get(),
                .limit = .{ .max = 7, .min = 2 },
            },
        };
        const PLLI2SR: ClockNode = .{
            .name = "PLLI2SR",
            .Nodetype = PLLI2SRval,
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const I2SMultval = ClockNodeTypes{ .multi = @intFromEnum(config.I2SMult) };
        const I2SMult: ClockNode = .{
            .name = "I2SMult",
            .Nodetype = I2SMultval,

            .parents = &[_]*const ClockNode{
                &PLLI2SR,
                &I2S_CKIN,
            },
        };
        const I2Soutputval = ClockNodeTypes{ .output = null };
        const I2Soutput: ClockNode = .{
            .name = "I2Soutput",
            .Nodetype = I2Soutputval,
            .parents = &[_]*const ClockNode{&I2SMult},
        };
        const SDMMCMultval = ClockNodeTypes{ .multi = @intFromEnum(config.SDMMCMult) };
        const SDMMCMult: ClockNode = .{
            .name = "SDMMCMult",
            .Nodetype = SDMMCMultval,

            .parents = &[_]*const ClockNode{
                &PLL48Mult,
                &SysCLKOutput,
            },
        };
        const SDMMCoutputval = ClockNodeTypes{
            .output = .{ .max = 50000000, .min = 0 },
        };
        const SDMMCoutput: ClockNode = .{
            .name = "SDMMCoutput",
            .Nodetype = SDMMCoutputval,
            .parents = &[_]*const ClockNode{&SDMMCMult},
        };
        const EthernetPtpOutputval = ClockNodeTypes{ .output = null };
        const EthernetPtpOutput: ClockNode = .{
            .name = "EthernetPtpOutput",
            .Nodetype = EthernetPtpOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const MCO1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.MCO1Mult) };
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
        const MCO1Divval = ClockNodeTypes{ .div = .{ .value = config.MCO1Div.get() } };
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
        const MCO2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.MCO2Mult) };
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
        const MCO2Divval = ClockNodeTypes{ .div = .{ .value = config.MCO2Div.get() } };
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
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescalerval = ClockNodeTypes{ .div = .{ .value = config.CortexPrescaler.get() } };
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
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 54000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const RCC_TIM_PRescaler_Selectionval = ClockNodeTypes{
            .source = .{ .value = config.RCC_TIM_PRescaler_Selection.get() },
        };
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
        const APB2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB2Prescaler.get() } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 108000000, .min = 0 },
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
        const USART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART1Mult) };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
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
        const USART2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART2Mult) };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .Nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
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
        const USART3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART3Mult) };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",
            .Nodetype = USART3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
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
        const USART6Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART6Mult) };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",
            .Nodetype = USART6Multval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART6outputval = ClockNodeTypes{ .output = null };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = USART6outputval,
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const UART4Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART4Mult) };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",
            .Nodetype = UART4Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART4outputval = ClockNodeTypes{ .output = null };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .Nodetype = UART4outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART5Mult) };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",
            .Nodetype = UART5Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART5outputval = ClockNodeTypes{ .output = null };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .Nodetype = UART5outputval,
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const UART7Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART7Mult) };
        const UART7Mult: ClockNode = .{
            .name = "UART7Mult",
            .Nodetype = UART7Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART7outputval = ClockNodeTypes{ .output = null };
        const UART7output: ClockNode = .{
            .name = "UART7output",
            .Nodetype = UART7outputval,
            .parents = &[_]*const ClockNode{&UART7Mult},
        };
        const UART8Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART8Mult) };
        const UART8Mult: ClockNode = .{
            .name = "UART8Mult",
            .Nodetype = UART8Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART8outputval = ClockNodeTypes{ .output = null };
        const UART8output: ClockNode = .{
            .name = "UART8output",
            .Nodetype = UART8outputval,
            .parents = &[_]*const ClockNode{&UART8Mult},
        };
        const LPTIM1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM1Mult) };
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
        const LPTIM1Outputval = ClockNodeTypes{ .output = null };
        const LPTIM1Output: ClockNode = .{
            .name = "LPTIM1Output",
            .Nodetype = LPTIM1Outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const HSIDivCECval = ClockNodeTypes{
            .div = .{ .value = 488 },
        };
        const HSIDivCEC: ClockNode = .{
            .name = "HSIDivCEC",
            .Nodetype = HSIDivCECval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const CECMultval = ClockNodeTypes{ .multi = @intFromEnum(config.CECMult) };
        const CECMult: ClockNode = .{
            .name = "CECMult",
            .Nodetype = CECMultval,

            .parents = &[_]*const ClockNode{
                &HSIDivCEC,
                &LSEOSC,
            },
        };
        const CECOutputval = ClockNodeTypes{ .output = null };
        const CECOutput: ClockNode = .{
            .name = "CECOutput",
            .Nodetype = CECOutputval,
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const PLLQoutputval = ClockNodeTypes{ .output = null };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const PLLSAIoutputval = ClockNodeTypes{ .output = null };
        const PLLSAIoutput: ClockNode = .{
            .name = "PLLSAIoutput",
            .Nodetype = PLLSAIoutputval,
            .parents = &[_]*const ClockNode{&PLLSAIP},
        };
        const PLLI2SRoutputval = ClockNodeTypes{ .output = null };
        const PLLI2SRoutput: ClockNode = .{
            .name = "PLLI2SRoutput",
            .Nodetype = PLLI2SRoutputval,
            .parents = &[_]*const ClockNode{&PLLI2SR},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.HSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.LSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.HSICalibrationValue.get(),
                .limit = .{ .max = 31, .min = 0 },
            },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
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
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .PLL48Mult = PLL48Mult,
            .RNGoutput = RNGoutput,
            .USBoutput = USBoutput,
            .LCDTFTKOutput = LCDTFTKOutput,
            .SPDIFoutput = SPDIFoutput,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .I2SMult = I2SMult,
            .I2Soutput = I2Soutput,
            .SDMMCMult = SDMMCMult,
            .SDMMCoutput = SDMMCoutput,
            .EthernetPtpOutput = EthernetPtpOutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .AHBPrescaler = AHBPrescaler,
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
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .USART6Mult = USART6Mult,
            .USART6output = USART6output,
            .UART4Mult = UART4Mult,
            .UART4output = UART4output,
            .UART5Mult = UART5Mult,
            .UART5output = UART5output,
            .UART7Mult = UART7Mult,
            .UART7output = UART7output,
            .UART8Mult = UART8Mult,
            .UART8output = UART8output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1Output = LPTIM1Output,
            .HSIDivCEC = HSIDivCEC,
            .CECMult = CECMult,
            .CECOutput = CECOutput,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLSAIN = PLLSAIN,
            .PLLSAIP = PLLSAIP,
            .PLLSAIoutput = PLLSAIoutput,
            .PLLSAIQ = PLLSAIQ,
            .PLLSAIQDiv = PLLSAIQDiv,
            .PLLSAIR = PLLSAIR,
            .PLLSAIRDiv = PLLSAIRDiv,
            .PLLI2SN = PLLI2SN,
            .PLLI2SP = PLLI2SP,
            .PLLI2SQ = PLLI2SQ,
            .PLLI2SQDiv = PLLI2SQDiv,
            .PLLI2SR = PLLI2SR,
            .PLLI2SRoutput = PLLI2SRoutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.LCDTFTKOutput.get_comptime();
        _ = self.SPDIFoutput.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.I2Soutput.get_comptime();
        _ = self.SDMMCoutput.get_comptime();
        _ = self.EthernetPtpOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.USART6output.get_comptime();
        _ = self.UART4output.get_comptime();
        _ = self.UART5output.get_comptime();
        _ = self.UART7output.get_comptime();
        _ = self.UART8output.get_comptime();
        _ = self.LPTIM1Output.get_comptime();
        _ = self.CECOutput.get_comptime();
    }
};
