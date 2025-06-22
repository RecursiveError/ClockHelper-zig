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
        return 48000000;
    }

    pub fn min() f32 {
        return 4000000;
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
        return 1000;
    }
};
pub const MSIClockRangeConf = enum {
    RCC_MSIRANGE_0,
    RCC_MSIRANGE_1,
    RCC_MSIRANGE_2,
    RCC_MSIRANGE_3,
    RCC_MSIRANGE_4,
    RCC_MSIRANGE_5,
    RCC_MSIRANGE_6,
    RCC_MSIRANGE_7,
    RCC_MSIRANGE_8,
    RCC_MSIRANGE_9,
    RCC_MSIRANGE_10,
    RCC_MSIRANGE_11,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSIRANGE_0 => 100,
            .RCC_MSIRANGE_1 => 200,
            .RCC_MSIRANGE_2 => 400,
            .RCC_MSIRANGE_3 => 800,
            .RCC_MSIRANGE_4 => 1000,
            .RCC_MSIRANGE_5 => 2000,
            .RCC_MSIRANGE_6 => 4000,
            .RCC_MSIRANGE_7 => 8000,
            .RCC_MSIRANGE_8 => 16000,
            .RCC_MSIRANGE_9 => 24000,
            .RCC_MSIRANGE_10 => 32000,
            .RCC_MSIRANGE_11 => 48000,
        };
    }
};
pub const LSCOSource1Conf = enum {
    RCC_LSCOSOURCE_LSI,
    RCC_LSCOSOURCE_LSE,
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_MSI,
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
        return 8;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,
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
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK1,
    RCC_LPUART1CLKSOURCE_SYSCLK,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_HSI,
    RCC_LPTIM2CLKSOURCE_LSE,
};
pub const SWPMI1CLockSelectionConf = enum {
    RCC_SWPMI1CLKSOURCE_PCLK,
    RCC_SWPMI1CLKSOURCE_HSI,
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_PLLSAI1,
    RCC_ADCCLKSOURCE_SYSCLK,
};
pub const CK48CLockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLLSAI1,
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_MSI,
    RCC_USBCLKSOURCE_HSI48,
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
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PLLSAI1,
    RCC_SAI1CLKSOURCE_PLL,
    RCC_SAI1CLKSOURCE_PIN,
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_MSI,
    RCC_MCO1SOURCE_HSI48,
};
pub const RCC_MCODivConf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_4,
    RCC_MCODIV_8,
    RCC_MCODIV_16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_16 => 16,
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
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 86;
    }

    pub fn min() f32 {
        return 8;
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
            .RCC_PLLP_DIV2 => 2,
            .RCC_PLLP_DIV3 => 3,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV5 => 5,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV7 => 7,
            .RCC_PLLP_DIV8 => 8,
            .RCC_PLLP_DIV9 => 9,
            .RCC_PLLP_DIV10 => 10,
            .RCC_PLLP_DIV11 => 11,
            .RCC_PLLP_DIV12 => 12,
            .RCC_PLLP_DIV13 => 13,
            .RCC_PLLP_DIV14 => 14,
            .RCC_PLLP_DIV15 => 15,
            .RCC_PLLP_DIV16 => 16,
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV18 => 18,
            .RCC_PLLP_DIV19 => 19,
            .RCC_PLLP_DIV20 => 20,
            .RCC_PLLP_DIV21 => 21,
            .RCC_PLLP_DIV22 => 22,
            .RCC_PLLP_DIV23 => 23,
            .RCC_PLLP_DIV24 => 24,
            .RCC_PLLP_DIV25 => 25,
            .RCC_PLLP_DIV26 => 26,
            .RCC_PLLP_DIV27 => 27,
            .RCC_PLLP_DIV28 => 28,
            .RCC_PLLP_DIV29 => 29,
            .RCC_PLLP_DIV30 => 30,
            .RCC_PLLP_DIV31 => 31,
            .RCC_PLLP_DIV32 => 32,
        };
    }
};
pub const PLLQConf = enum {
    RCC_PLLQ_DIV2,
    RCC_PLLQ_DIV4,
    RCC_PLLQ_DIV6,
    RCC_PLLQ_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLQ_DIV2 => 2,
            .RCC_PLLQ_DIV4 => 4,
            .RCC_PLLQ_DIV6 => 6,
            .RCC_PLLQ_DIV8 => 8,
        };
    }
};
pub const PLLRConf = enum {
    RCC_PLLR_DIV2,
    RCC_PLLR_DIV4,
    RCC_PLLR_DIV6,
    RCC_PLLR_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLR_DIV2 => 2,
            .RCC_PLLR_DIV4 => 4,
            .RCC_PLLR_DIV6 => 6,
            .RCC_PLLR_DIV8 => 8,
        };
    }
};
pub const PLLSAI1NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 86;
    }

    pub fn min() f32 {
        return 8;
    }
};
pub const PLLSAI1PConf = enum {
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
            .RCC_PLLP_DIV2 => 2,
            .RCC_PLLP_DIV3 => 3,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV5 => 5,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV7 => 7,
            .RCC_PLLP_DIV8 => 8,
            .RCC_PLLP_DIV9 => 9,
            .RCC_PLLP_DIV10 => 10,
            .RCC_PLLP_DIV11 => 11,
            .RCC_PLLP_DIV12 => 12,
            .RCC_PLLP_DIV13 => 13,
            .RCC_PLLP_DIV14 => 14,
            .RCC_PLLP_DIV15 => 15,
            .RCC_PLLP_DIV16 => 16,
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV18 => 18,
            .RCC_PLLP_DIV19 => 19,
            .RCC_PLLP_DIV20 => 20,
            .RCC_PLLP_DIV21 => 21,
            .RCC_PLLP_DIV22 => 22,
            .RCC_PLLP_DIV23 => 23,
            .RCC_PLLP_DIV24 => 24,
            .RCC_PLLP_DIV25 => 25,
            .RCC_PLLP_DIV26 => 26,
            .RCC_PLLP_DIV27 => 27,
            .RCC_PLLP_DIV28 => 28,
            .RCC_PLLP_DIV29 => 29,
            .RCC_PLLP_DIV30 => 30,
            .RCC_PLLP_DIV31 => 31,
            .RCC_PLLP_DIV32 => 32,
        };
    }
};
pub const PLLSAI1QConf = enum {
    RCC_PLLQ_DIV2,
    RCC_PLLQ_DIV4,
    RCC_PLLQ_DIV6,
    RCC_PLLQ_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLQ_DIV2 => 2,
            .RCC_PLLQ_DIV4 => 4,
            .RCC_PLLQ_DIV6 => 6,
            .RCC_PLLQ_DIV8 => 8,
        };
    }
};
pub const PLLSAI1RConf = enum {
    RCC_PLLR_DIV2,
    RCC_PLLR_DIV4,
    RCC_PLLR_DIV6,
    RCC_PLLR_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLR_DIV2 => 2,
            .RCC_PLLR_DIV4 => 4,
            .RCC_PLLR_DIV6 => 6,
            .RCC_PLLR_DIV8 => 8,
        };
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
pub const MSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 255;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const MSIAutoCalibrationConf = enum {
    DISABLED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DISABLED => 0,
        };
    }
};
pub const MSIAutoCalibrationArgConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
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
pub const LSE_Drive_CapabilityArgConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSE_VALUEConf = @enumFromInt(8000000),
    LSEOSC: LSE_VALUEConf = @enumFromInt(32768),
    MSIRC: MSIClockRangeConf = .RCC_MSIRANGE_6,
    LSCOMult: LSCOSource1Conf = .RCC_LSCOSOURCE_LSI,
    SysClkSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_MSI,
    PLLSource: PLLSourceVirtualConf = .RCC_PLLSOURCE_MSI,
    PLLM: PLLMConf = @enumFromInt(1),
    RTCClkSource: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1Mult: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    USART2Mult: USART2CLockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3Mult: USART3CLockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    LPUART1Mult: LPUART1CLockSelectionConf = .RCC_LPUART1CLKSOURCE_PCLK1,
    LPTIM1Mult: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK,
    LPTIM2Mult: LPTIM2CLockSelectionConf = .RCC_LPTIM2CLKSOURCE_PCLK,
    SWPMIMult: SWPMI1CLockSelectionConf = .RCC_SWPMI1CLKSOURCE_PCLK,
    ADCMult: ADCCLockSelectionConf = .RCC_ADCCLKSOURCE_PLLSAI1,
    CK48Mult: CK48CLockSelectionConf = .RCC_USBCLKSOURCE_PLLSAI1,
    I2C1Mult: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    I2C2Mult: I2C2CLockSelectionConf = .RCC_I2C2CLKSOURCE_PCLK1,
    I2C3Mult: I2C3CLockSelectionConf = .RCC_I2C3CLKSOURCE_PCLK1,
    SAI1Mult: SAI1CLockSelectionConf = .RCC_SAI1CLKSOURCE_PLLSAI,
    MCOMult: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_SYSCLK,
    MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    AHBPrescaler: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    CortexPrescaler: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1Prescaler: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2Prescaler: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .RCC_PLLP_DIV7,
    PLLQ: PLLQConf = .RCC_PLLQ_DIV2,
    PLLR: PLLRConf = .RCC_PLLR_DIV2,
    PLLSAI1N: PLLSAI1NConf = @enumFromInt(8),
    PLLSAI1P: PLLSAI1PConf = .RCC_PLLP_DIV7,
    PLLSAI1Q: PLLSAI1QConf = .RCC_PLLQ_DIV2,
    PLLSAI1R: PLLSAI1RConf = .RCC_PLLR_DIV2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    MSICalibrationValue: MSICalibrationValueConf = @enumFromInt(0),
    MSIAutoCalibration: MSIAutoCalibrationConf = .DISABLED,
    MSIAutoCalibrationArg: MSIAutoCalibrationArgConf = .null,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    LSE_Drive_CapabilityArg: LSE_Drive_CapabilityArgConf = .null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: HSE_VALUEConf = @enumFromInt(8000000),
    LSE_VALUE: LSE_VALUEConf = @enumFromInt(32768),
    MSIClockRange: MSIClockRangeConf = .RCC_MSIRANGE_6,
    LSCOSource1: LSCOSource1Conf = .RCC_LSCOSOURCE_LSI,
    SYSCLKSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_MSI,
    PLLSourceVirtual: PLLSourceVirtualConf = .RCC_PLLSOURCE_MSI,
    PLLM: PLLMConf = @enumFromInt(1),
    RTCClockSelection: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1CLockSelection: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    USART2CLockSelection: USART2CLockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3CLockSelection: USART3CLockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    LPUART1CLockSelection: LPUART1CLockSelectionConf = .RCC_LPUART1CLKSOURCE_PCLK1,
    LPTIM1CLockSelection: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK,
    LPTIM2CLockSelection: LPTIM2CLockSelectionConf = .RCC_LPTIM2CLKSOURCE_PCLK,
    SWPMI1CLockSelection: SWPMI1CLockSelectionConf = .RCC_SWPMI1CLKSOURCE_PCLK,
    ADCCLockSelection: ADCCLockSelectionConf = .RCC_ADCCLKSOURCE_PLLSAI1,
    CK48CLockSelection: CK48CLockSelectionConf = .RCC_USBCLKSOURCE_PLLSAI1,
    I2C1CLockSelection: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    I2C2CLockSelection: I2C2CLockSelectionConf = .RCC_I2C2CLKSOURCE_PCLK1,
    I2C3CLockSelection: I2C3CLockSelectionConf = .RCC_I2C3CLKSOURCE_PCLK1,
    SAI1CLockSelection: SAI1CLockSelectionConf = .RCC_SAI1CLKSOURCE_PLLSAI,
    RCC_MCO1Source: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_SYSCLK,
    RCC_MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    AHBCLKDivider: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    Cortex_Div: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1CLKDivider: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2CLKDivider: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .RCC_PLLP_DIV7,
    PLLQ: PLLQConf = .RCC_PLLQ_DIV2,
    PLLR: PLLRConf = .RCC_PLLR_DIV2,
    PLLSAI1N: PLLSAI1NConf = @enumFromInt(8),
    PLLSAI1P: PLLSAI1PConf = .RCC_PLLP_DIV7,
    PLLSAI1Q: PLLSAI1QConf = .RCC_PLLQ_DIV2,
    PLLSAI1R: PLLSAI1RConf = .RCC_PLLR_DIV2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    MSICalibrationValue: MSICalibrationValueConf = @enumFromInt(0),
    MSIAutoCalibration: MSIAutoCalibrationConf = .DISABLED,
    MSIAutoCalibrationArg: MSIAutoCalibrationArgConf = .null,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    LSE_Drive_CapabilityArg: LSE_Drive_CapabilityArgConf = .null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .MSIRC = self.MSIClockRange,
            .LSCOMult = self.LSCOSource1,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .USART2Mult = self.USART2CLockSelection,
            .USART3Mult = self.USART3CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .SWPMIMult = self.SWPMI1CLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .CK48Mult = self.CK48CLockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLR = self.PLLR,
            .PLLSAI1N = self.PLLSAI1N,
            .PLLSAI1P = self.PLLSAI1P,
            .PLLSAI1Q = self.PLLSAI1Q,
            .PLLSAI1R = self.PLLSAI1R,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSICalibrationValue = self.MSICalibrationValue,
            .MSIAutoCalibration = self.MSIAutoCalibration,
            .MSIAutoCalibrationArg = self.MSIAutoCalibrationArg,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
            .LSE_Drive_CapabilityArg = self.LSE_Drive_CapabilityArg,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSI48RC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    MSIRC: ClockNode,
    SAI1_EXT: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    LCDOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    SWPMIMult: ClockNode,
    SWPMIoutput: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CK48Mult: ClockNode,
    CK48output: ClockNode,
    SDMMCoutput: ClockNode,
    RNGoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
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
    PLLPoutput: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLR: ClockNode,
    PLLSAI1N: ClockNode,
    PLLSAI1P: ClockNode,
    PLLSAI1Poutput: ClockNode,
    PLLSAI1Q: ClockNode,
    PLLSAI1Qoutput: ClockNode,
    PLLSAI1R: ClockNode,
    PLLSAI1Routput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,
    MSIAutoCalibration: ClockNodeTypes,
    MSIAutoCalibrationArg: ClockNodeTypes,
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
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = HSI48RCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.HSEOSC.get(),
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
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 1000 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const MSIRCval = ClockNodeTypes{
            .source = .{ .value = config.MSIRC.get() },
        };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = MSIRCval,
        };
        const SAI1_EXTval = ClockNodeTypes{
            .source = .{ .value = 2097000 },
        };
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .Nodetype = SAI1_EXTval,
        };
        const LSCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.LSCOMult) };
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
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = config.PLLM.get(),
                .limit = .{ .max = 8, .min = 1 },
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
                .limit = .{ .max = 86, .min = 8 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLRval = ClockNodeTypes{ .div = .{ .value = config.PLLR.get() } };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = PLLRval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
                &PLLR,
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
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{ .output = null };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB2Prescaler.get() } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
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
        const APB1Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB1Prescaler.get() } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
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
        const LPUART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPUART1Mult) };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",
            .Nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
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
        const LPTIM1outputval = ClockNodeTypes{ .output = null };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM2Mult) };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .Nodetype = LPTIM2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
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
        const SWPMIMultval = ClockNodeTypes{ .multi = @intFromEnum(config.SWPMIMult) };
        const SWPMIMult: ClockNode = .{
            .name = "SWPMIMult",
            .Nodetype = SWPMIMultval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRC,
            },
        };
        const SWPMIoutputval = ClockNodeTypes{ .output = null };
        const SWPMIoutput: ClockNode = .{
            .name = "SWPMIoutput",
            .Nodetype = SWPMIoutputval,
            .parents = &[_]*const ClockNode{&SWPMIMult},
        };
        const PLLSAI1Nval = ClockNodeTypes{
            .mul = .{
                .value = config.PLLSAI1N.get(),
                .limit = .{ .max = 86, .min = 8 },
            },
        };
        const PLLSAI1N: ClockNode = .{
            .name = "PLLSAI1N",
            .Nodetype = PLLSAI1Nval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLSAI1Rval = ClockNodeTypes{ .div = .{ .value = config.PLLSAI1R.get() } };
        const PLLSAI1R: ClockNode = .{
            .name = "PLLSAI1R",
            .Nodetype = PLLSAI1Rval,
            .parents = &[_]*const ClockNode{&PLLSAI1N},
        };
        const ADCMultval = ClockNodeTypes{ .multi = @intFromEnum(config.ADCMult) };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .Nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &PLLSAI1R,
                &SysCLKOutput,
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
        const PLLSAI1Qval = ClockNodeTypes{ .div = .{ .value = config.PLLSAI1Q.get() } };
        const PLLSAI1Q: ClockNode = .{
            .name = "PLLSAI1Q",
            .Nodetype = PLLSAI1Qval,
            .parents = &[_]*const ClockNode{&PLLSAI1N},
        };
        const PLLQval = ClockNodeTypes{ .div = .{ .value = config.PLLQ.get() } };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const CK48Multval = ClockNodeTypes{ .multi = @intFromEnum(config.CK48Mult) };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",
            .Nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &PLLSAI1Q,
                &PLLQ,
                &MSIRC,
                &HSI48RC,
            },
        };
        const CK48outputval = ClockNodeTypes{
            .output = .{ .max = 48120000, .min = 47880000 },
        };
        const CK48output: ClockNode = .{
            .name = "CK48output",
            .Nodetype = CK48outputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const SDMMCoutputval = ClockNodeTypes{
            .output = .{ .max = 50000000, .min = 0 },
        };
        const SDMMCoutput: ClockNode = .{
            .name = "SDMMCoutput",
            .Nodetype = SDMMCoutputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
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
        const PLLSAI1Pval = ClockNodeTypes{ .div = .{ .value = config.PLLSAI1P.get() } };
        const PLLSAI1P: ClockNode = .{
            .name = "PLLSAI1P",
            .Nodetype = PLLSAI1Pval,
            .parents = &[_]*const ClockNode{&PLLSAI1N},
        };
        const PLLPval = ClockNodeTypes{ .div = .{ .value = config.PLLP.get() } };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = PLLPval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SAI1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SAI1Mult) };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",
            .Nodetype = SAI1Multval,

            .parents = &[_]*const ClockNode{
                &PLLSAI1P,
                &PLLP,
                &SAI1_EXT,
            },
        };
        const SAI1outputval = ClockNodeTypes{ .output = null };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const MCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.MCOMult) };
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
                &MSIRC,
                &HSI48RC,
            },
        };
        const MCODivval = ClockNodeTypes{ .div = .{ .value = config.MCODiv.get() } };
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
            .output = .{ .max = 80000000, .min = 0 },
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
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 80000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2val = blk: {
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
        const PLLPoutputval = ClockNodeTypes{ .output = null };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .Nodetype = PLLPoutputval,
            .parents = &[_]*const ClockNode{&PLLP},
        };
        const PLLQoutputval = ClockNodeTypes{ .output = null };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const PLLSAI1Poutputval = ClockNodeTypes{ .output = null };
        const PLLSAI1Poutput: ClockNode = .{
            .name = "PLLSAI1Poutput",
            .Nodetype = PLLSAI1Poutputval,
            .parents = &[_]*const ClockNode{&PLLSAI1P},
        };
        const PLLSAI1Qoutputval = ClockNodeTypes{ .output = null };
        const PLLSAI1Qoutput: ClockNode = .{
            .name = "PLLSAI1Qoutput",
            .Nodetype = PLLSAI1Qoutputval,
            .parents = &[_]*const ClockNode{&PLLSAI1Q},
        };
        const PLLSAI1Routputval = ClockNodeTypes{ .output = null };
        const PLLSAI1Routput: ClockNode = .{
            .name = "PLLSAI1Routput",
            .Nodetype = PLLSAI1Routputval,
            .parents = &[_]*const ClockNode{&PLLSAI1R},
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
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.MSICalibrationValue.get(),
                .limit = .{ .max = 255, .min = 0 },
            },
        };
        const MSIAutoCalibrationval = ClockNodeTypes{
            .source = .{ .value = config.MSIAutoCalibration.get() },
        };
        const MSIAutoCalibrationArgval = ClockNodeTypes{
            .source = .{ .value = config.MSIAutoCalibrationArg.get() },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
        const LSE_Drive_CapabilityArgval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_CapabilityArg.get() },
        };
        return .{
            .HSIRC = HSIRC,
            .HSI48RC = HSI48RC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .MSIRC = MSIRC,
            .SAI1_EXT = SAI1_EXT,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .LCDOutput = LCDOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .SWPMIMult = SWPMIMult,
            .SWPMIoutput = SWPMIoutput,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CK48Mult = CK48Mult,
            .CK48output = CK48output,
            .SDMMCoutput = SDMMCoutput,
            .RNGoutput = RNGoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
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
            .PLLPoutput = PLLPoutput,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLR = PLLR,
            .PLLSAI1N = PLLSAI1N,
            .PLLSAI1P = PLLSAI1P,
            .PLLSAI1Poutput = PLLSAI1Poutput,
            .PLLSAI1Q = PLLSAI1Q,
            .PLLSAI1Qoutput = PLLSAI1Qoutput,
            .PLLSAI1R = PLLSAI1R,
            .PLLSAI1Routput = PLLSAI1Routput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSICalibrationValue = MSICalibrationValueval,
            .MSIAutoCalibration = MSIAutoCalibrationval,
            .MSIAutoCalibrationArg = MSIAutoCalibrationArgval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
            .LSE_Drive_CapabilityArg = LSE_Drive_CapabilityArgval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.SWPMIoutput.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.CK48output.get_comptime();
        _ = self.SDMMCoutput.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
    }
};
