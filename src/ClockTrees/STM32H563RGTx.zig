const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSIDivConf = enum {
    RCC_HSI_DIV1,
    RCC_HSI_DIV2,
    RCC_HSI_DIV4,
    RCC_HSI_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSI_DIV4 => 4,
            .RCC_HSI_DIV1 => 1,
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
pub const LSI_VALUEConf = enum(u32) {
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
    RCC_SYSCLKSOURCE_CSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLL1_SOURCE_CSI,
    RCC_PLL1_SOURCE_HSI,
    RCC_PLL1_SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLL2SourceConf = enum {
    RCC_PLL2_SOURCE_CSI,
    RCC_PLL2_SOURCE_HSI,
    RCC_PLL2_SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLL3SourceConf = enum {
    RCC_PLL3_SOURCE_CSI,
    RCC_PLL3_SOURCE_HSI,
    RCC_PLL3_SOURCE_HSE,

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
pub const PLL2MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const RCC_RTC_Clock_Source_FROM_HSEConf = enum {
    RCC_RTC_HSE_NOCLOCK,
    RCC_RTC_HSE_DIV2,
    RCC_RTC_HSE_DIV3,
    RCC_RTC_HSE_DIV4,
    RCC_RTC_HSE_DIV5,
    RCC_RTC_HSE_DIV6,
    RCC_RTC_HSE_DIV7,
    RCC_RTC_HSE_DIV8,
    RCC_RTC_HSE_DIV9,
    RCC_RTC_HSE_DIV10,
    RCC_RTC_HSE_DIV11,
    RCC_RTC_HSE_DIV12,
    RCC_RTC_HSE_DIV13,
    RCC_RTC_HSE_DIV14,
    RCC_RTC_HSE_DIV15,
    RCC_RTC_HSE_DIV16,
    RCC_RTC_HSE_DIV17,
    RCC_RTC_HSE_DIV18,
    RCC_RTC_HSE_DIV19,
    RCC_RTC_HSE_DIV20,
    RCC_RTC_HSE_DIV21,
    RCC_RTC_HSE_DIV22,
    RCC_RTC_HSE_DIV23,
    RCC_RTC_HSE_DIV24,
    RCC_RTC_HSE_DIV25,
    RCC_RTC_HSE_DIV26,
    RCC_RTC_HSE_DIV27,
    RCC_RTC_HSE_DIV28,
    RCC_RTC_HSE_DIV29,
    RCC_RTC_HSE_DIV30,
    RCC_RTC_HSE_DIV31,
    RCC_RTC_HSE_DIV32,
    RCC_RTC_HSE_DIV33,
    RCC_RTC_HSE_DIV34,
    RCC_RTC_HSE_DIV35,
    RCC_RTC_HSE_DIV36,
    RCC_RTC_HSE_DIV37,
    RCC_RTC_HSE_DIV38,
    RCC_RTC_HSE_DIV39,
    RCC_RTC_HSE_DIV40,
    RCC_RTC_HSE_DIV41,
    RCC_RTC_HSE_DIV42,
    RCC_RTC_HSE_DIV43,
    RCC_RTC_HSE_DIV44,
    RCC_RTC_HSE_DIV45,
    RCC_RTC_HSE_DIV46,
    RCC_RTC_HSE_DIV47,
    RCC_RTC_HSE_DIV48,
    RCC_RTC_HSE_DIV49,
    RCC_RTC_HSE_DIV50,
    RCC_RTC_HSE_DIV51,
    RCC_RTC_HSE_DIV52,
    RCC_RTC_HSE_DIV53,
    RCC_RTC_HSE_DIV54,
    RCC_RTC_HSE_DIV55,
    RCC_RTC_HSE_DIV56,
    RCC_RTC_HSE_DIV57,
    RCC_RTC_HSE_DIV58,
    RCC_RTC_HSE_DIV59,
    RCC_RTC_HSE_DIV60,
    RCC_RTC_HSE_DIV61,
    RCC_RTC_HSE_DIV62,
    RCC_RTC_HSE_DIV63,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_RTC_HSE_DIV13 => 13,
            .RCC_RTC_HSE_DIV25 => 25,
            .RCC_RTC_HSE_DIV32 => 32,
            .RCC_RTC_HSE_DIV57 => 57,
            .RCC_RTC_HSE_DIV6 => 6,
            .RCC_RTC_HSE_DIV39 => 39,
            .RCC_RTC_HSE_DIV7 => 7,
            .RCC_RTC_HSE_DIV34 => 34,
            .RCC_RTC_HSE_DIV62 => 62,
            .RCC_RTC_HSE_DIV27 => 27,
            .RCC_RTC_HSE_DIV44 => 44,
            .RCC_RTC_HSE_DIV8 => 8,
            .RCC_RTC_HSE_DIV33 => 33,
            .RCC_RTC_HSE_DIV2 => 2,
            .RCC_RTC_HSE_DIV41 => 41,
            .RCC_RTC_HSE_DIV63 => 63,
            .RCC_RTC_HSE_DIV58 => 58,
            .RCC_RTC_HSE_DIV3 => 3,
            .RCC_RTC_HSE_DIV51 => 51,
            .RCC_RTC_HSE_DIV21 => 21,
            .RCC_RTC_HSE_DIV5 => 5,
            .RCC_RTC_HSE_NOCLOCK => 1,
            .RCC_RTC_HSE_DIV36 => 36,
            .RCC_RTC_HSE_DIV50 => 50,
            .RCC_RTC_HSE_DIV20 => 20,
            .RCC_RTC_HSE_DIV47 => 47,
            .RCC_RTC_HSE_DIV30 => 30,
            .RCC_RTC_HSE_DIV56 => 56,
            .RCC_RTC_HSE_DIV9 => 9,
            .RCC_RTC_HSE_DIV46 => 46,
            .RCC_RTC_HSE_DIV15 => 15,
            .RCC_RTC_HSE_DIV17 => 17,
            .RCC_RTC_HSE_DIV40 => 40,
            .RCC_RTC_HSE_DIV49 => 49,
            .RCC_RTC_HSE_DIV60 => 60,
            .RCC_RTC_HSE_DIV31 => 31,
            .RCC_RTC_HSE_DIV14 => 14,
            .RCC_RTC_HSE_DIV37 => 37,
            .RCC_RTC_HSE_DIV10 => 10,
            .RCC_RTC_HSE_DIV45 => 45,
            .RCC_RTC_HSE_DIV19 => 19,
            .RCC_RTC_HSE_DIV35 => 35,
            .RCC_RTC_HSE_DIV23 => 23,
            .RCC_RTC_HSE_DIV55 => 55,
            .RCC_RTC_HSE_DIV38 => 38,
            .RCC_RTC_HSE_DIV48 => 48,
            .RCC_RTC_HSE_DIV16 => 16,
            .RCC_RTC_HSE_DIV61 => 61,
            .RCC_RTC_HSE_DIV22 => 22,
            .RCC_RTC_HSE_DIV12 => 12,
            .RCC_RTC_HSE_DIV29 => 29,
            .RCC_RTC_HSE_DIV11 => 11,
            .RCC_RTC_HSE_DIV42 => 42,
            .RCC_RTC_HSE_DIV43 => 43,
            .RCC_RTC_HSE_DIV24 => 24,
            .RCC_RTC_HSE_DIV4 => 4,
            .RCC_RTC_HSE_DIV18 => 18,
            .RCC_RTC_HSE_DIV26 => 26,
            .RCC_RTC_HSE_DIV28 => 28,
            .RCC_RTC_HSE_DIV52 => 52,
            .RCC_RTC_HSE_DIV53 => 53,
            .RCC_RTC_HSE_DIV54 => 54,
            .RCC_RTC_HSE_DIV59 => 59,
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
pub const CECCLockSelectionConf = enum {
    RCC_CECCLKSOURCE_LSE,
    RCC_CECCLKSOURCE_CSI_DIV122,
    RCC_CECCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_PLL2Q,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
    RCC_USART1CLKSOURCE_CSI,
    RCC_USART1CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART2CLockSelectionConf = enum {
    RCC_USART2CLKSOURCE_PCLK1,
    RCC_USART2CLKSOURCE_PLL2Q,
    RCC_USART2CLKSOURCE_HSI,
    RCC_USART2CLKSOURCE_LSE,
    RCC_USART2CLKSOURCE_CSI,
    RCC_USART2CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART3CLockSelectionConf = enum {
    RCC_USART3CLKSOURCE_PCLK1,
    RCC_USART3CLKSOURCE_PLL2Q,
    RCC_USART3CLKSOURCE_HSI,
    RCC_USART3CLKSOURCE_LSE,
    RCC_USART3CLKSOURCE_CSI,
    RCC_USART3CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART4CLockSelectionConf = enum {
    RCC_UART4CLKSOURCE_PCLK1,
    RCC_UART4CLKSOURCE_PLL2Q,
    RCC_UART4CLKSOURCE_HSI,
    RCC_UART4CLKSOURCE_LSE,
    RCC_UART4CLKSOURCE_CSI,
    RCC_UART4CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART5CLockSelectionConf = enum {
    RCC_UART5CLKSOURCE_PCLK1,
    RCC_UART5CLKSOURCE_PLL2Q,
    RCC_UART5CLKSOURCE_HSI,
    RCC_UART5CLKSOURCE_LSE,
    RCC_UART5CLKSOURCE_CSI,
    RCC_UART5CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART6CLockSelectionConf = enum {
    RCC_USART6CLKSOURCE_PCLK1,
    RCC_USART6CLKSOURCE_PLL2Q,
    RCC_USART6CLKSOURCE_HSI,
    RCC_USART6CLKSOURCE_LSE,
    RCC_USART6CLKSOURCE_CSI,
    RCC_USART6CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART7CLockSelectionConf = enum {
    RCC_UART7CLKSOURCE_PCLK1,
    RCC_UART7CLKSOURCE_PLL2Q,
    RCC_UART7CLKSOURCE_HSI,
    RCC_UART7CLKSOURCE_LSE,
    RCC_UART7CLKSOURCE_CSI,
    RCC_UART7CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART11CLockSelectionConf = enum {
    RCC_USART11CLKSOURCE_PCLK1,
    RCC_USART11CLKSOURCE_PLL2Q,
    RCC_USART11CLKSOURCE_HSI,
    RCC_USART11CLKSOURCE_LSE,
    RCC_USART11CLKSOURCE_CSI,
    RCC_USART11CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK3,
    RCC_LPUART1CLKSOURCE_PLL2Q,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,
    RCC_LPUART1CLKSOURCE_CSI,
    RCC_LPUART1CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK3,
    RCC_LPTIM1CLKSOURCE_PLL2P,
    RCC_LPTIM1CLKSOURCE_LSE,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_CLKP,
    RCC_LPTIM1CLKSOURCE_PLL3R,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK1,
    RCC_LPTIM2CLKSOURCE_PLL2P,
    RCC_LPTIM2CLKSOURCE_LSE,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_CLKP,
    RCC_LPTIM2CLKSOURCE_PLL3R,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DACLowPowerCLockSelectionConf = enum {
    RCC_DACLPCLKSOURCE_LSE,
    RCC_DACLPCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCDACCLKSOURCE_HCLK,
    RCC_ADCDACCLKSOURCE_SYSCLK,
    RCC_ADCDACCLKSOURCE_PLL2R,
    RCC_ADCDACCLKSOURCE_HSE,
    RCC_ADCDACCLKSOURCE_HSI,
    RCC_ADCDACCLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USBCLockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLL3Q,
    RCC_USBCLKSOURCE_PLL1Q,
    RCC_USBCLKSOURCE_HSI48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SDMMC1ClockSelectionConf = enum {
    RCC_SDMMC1CLKSOURCE_PLL1Q,
    RCC_SDMMC1CLKSOURCE_PLL2R,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FDCANClockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_PLL1Q,
    RCC_FDCANCLKSOURCE_PLL2Q,
    RCC_FDCANCLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_PLL3R,
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_PLL3R,
    RCC_I2C2CLKSOURCE_HSI,
    RCC_I2C2CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C3CLockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK3,
    RCC_I2C3CLKSOURCE_PLL3R,
    RCC_I2C3CLKSOURCE_HSI,
    RCC_I2C3CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PLL2P,
    RCC_SAI1CLKSOURCE_PLL3P,
    RCC_SAI1CLKSOURCE_PLL1Q,
    RCC_SAI1CLKSOURCE_PIN,
    RCC_SAI1CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI2CLockSelectionConf = enum {
    RCC_SAI2CLKSOURCE_PLL2P,
    RCC_SAI2CLKSOURCE_PLL3P,
    RCC_SAI2CLKSOURCE_PLL1Q,
    RCC_SAI2CLKSOURCE_PIN,
    RCC_SAI2CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C4CLockSelectionConf = enum {
    RCC_I2C4CLKSOURCE_PCLK3,
    RCC_I2C4CLKSOURCE_PLL3R,
    RCC_I2C4CLKSOURCE_HSI,
    RCC_I2C4CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I3C1CLockSelectionConf = enum {
    RCC_I3C1CLKSOURCE_PCLK1,
    RCC_I3C1CLKSOURCE_PLL3R,
    RCC_I3C1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OCTOSPIMCLockSelectionConf = enum {
    RCC_OSPICLKSOURCE_HCLK,
    RCC_OSPICLKSOURCE_PLL1Q,
    RCC_OSPICLKSOURCE_PLL2R,
    RCC_OSPICLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM3CLockSelectionConf = enum {
    RCC_LPTIM3CLKSOURCE_PCLK3,
    RCC_LPTIM3CLKSOURCE_PLL2P,
    RCC_LPTIM3CLKSOURCE_LSE,
    RCC_LPTIM3CLKSOURCE_LSI,
    RCC_LPTIM3CLKSOURCE_CLKP,
    RCC_LPTIM3CLKSOURCE_PLL3R,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM4CLockSelectionConf = enum {
    RCC_LPTIM4CLKSOURCE_PCLK3,
    RCC_LPTIM4CLKSOURCE_PLL2P,
    RCC_LPTIM4CLKSOURCE_LSE,
    RCC_LPTIM4CLKSOURCE_LSI,
    RCC_LPTIM4CLKSOURCE_CLKP,
    RCC_LPTIM4CLKSOURCE_PLL3R,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM5CLockSelectionConf = enum {
    RCC_LPTIM5CLKSOURCE_PCLK3,
    RCC_LPTIM5CLKSOURCE_PLL2P,
    RCC_LPTIM5CLKSOURCE_LSE,
    RCC_LPTIM5CLKSOURCE_LSI,
    RCC_LPTIM5CLKSOURCE_CLKP,
    RCC_LPTIM5CLKSOURCE_PLL3R,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM6CLockSelectionConf = enum {
    RCC_LPTIM6CLKSOURCE_PCLK3,
    RCC_LPTIM6CLKSOURCE_PLL2P,
    RCC_LPTIM6CLKSOURCE_LSE,
    RCC_LPTIM6CLKSOURCE_LSI,
    RCC_LPTIM6CLKSOURCE_CLKP,
    RCC_LPTIM6CLKSOURCE_PLL3R,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RNGCLockSelectionConf = enum {
    RCC_RNGCLKSOURCE_HSI48,
    RCC_RNGCLKSOURCE_PLL1Q,
    RCC_RNGCLKSOURCE_LSE,
    RCC_RNGCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLL1Q,
    RCC_MCO1SOURCE_HSI48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCODivConf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_3,
    RCC_MCODIV_4,
    RCC_MCODIV_5,
    RCC_MCODIV_6,
    RCC_MCODIV_7,
    RCC_MCODIV_8,
    RCC_MCODIV_9,
    RCC_MCODIV_10,
    RCC_MCODIV_11,
    RCC_MCODIV_12,
    RCC_MCODIV_13,
    RCC_MCODIV_14,
    RCC_MCODIV_15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_10 => 10,
            .RCC_MCODIV_11 => 11,
            .RCC_MCODIV_5 => 5,
            .RCC_MCODIV_9 => 9,
            .RCC_MCODIV_13 => 13,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_6 => 6,
            .RCC_MCODIV_14 => 14,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_7 => 7,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_15 => 15,
            .RCC_MCODIV_12 => 12,
            .RCC_MCODIV_3 => 3,
        };
    }
};
pub const RCC_MCO2SourceConf = enum {
    RCC_MCO2SOURCE_LSI,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_CSI,
    RCC_MCO2SOURCE_PLL1P,
    RCC_MCO2SOURCE_PLL2P,
    RCC_MCO2SOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO2DivConf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_3,
    RCC_MCODIV_4,
    RCC_MCODIV_5,
    RCC_MCODIV_6,
    RCC_MCODIV_7,
    RCC_MCODIV_8,
    RCC_MCODIV_9,
    RCC_MCODIV_10,
    RCC_MCODIV_11,
    RCC_MCODIV_12,
    RCC_MCODIV_13,
    RCC_MCODIV_14,
    RCC_MCODIV_15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_10 => 10,
            .RCC_MCODIV_11 => 11,
            .RCC_MCODIV_5 => 5,
            .RCC_MCODIV_9 => 9,
            .RCC_MCODIV_13 => 13,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_6 => 6,
            .RCC_MCODIV_14 => 14,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_7 => 7,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_15 => 15,
            .RCC_MCODIV_12 => 12,
            .RCC_MCODIV_3 => 3,
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
pub const CKPERSourceSelectionConf = enum {
    RCC_CLKPSOURCE_HSI,
    RCC_CLKPSOURCE_HSE,
    RCC_CLKPSOURCE_CSI,

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
pub const CortexCLockSelectionConf = enum {
    SYSTICK_CLKSOURCE_HCLK_1_8,
    SYSTICK_CLKSOURCE_LSE,
    SYSTICK_CLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
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
pub const APB3CLKDividerConf = enum {
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
pub const SPI1CLockSelectionConf = enum {
    RCC_SPI1CLKSOURCE_PLL1Q,
    RCC_SPI1CLKSOURCE_PLL2P,
    RCC_SPI1CLKSOURCE_PLL3P,
    RCC_SPI1CLKSOURCE_PIN,
    RCC_SPI1CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI3CLockSelectionConf = enum {
    RCC_SPI3CLKSOURCE_PLL1Q,
    RCC_SPI3CLKSOURCE_PLL2P,
    RCC_SPI3CLKSOURCE_PLL3P,
    RCC_SPI3CLKSOURCE_PIN,
    RCC_SPI3CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI6CLockSelectionConf = enum {
    RCC_SPI6CLKSOURCE_PCLK2,
    RCC_SPI6CLKSOURCE_PLL2Q,
    RCC_SPI6CLKSOURCE_HSI,
    RCC_SPI6CLKSOURCE_CSI,
    RCC_SPI6CLKSOURCE_HSE,
    RCC_SPI6CLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI2CLockSelectionConf = enum {
    RCC_SPI2CLKSOURCE_PLL1Q,
    RCC_SPI2CLKSOURCE_PLL2P,
    RCC_SPI2CLKSOURCE_PLL3P,
    RCC_SPI2CLKSOURCE_PIN,
    RCC_SPI2CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLFRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL1PConf = enum {
    @"2",
    @"4",
    @"6",
    @"8",
    @"10",
    @"12",
    @"14",
    @"16",
    @"18",
    @"20",
    @"22",
    @"24",
    @"26",
    @"28",
    @"30",
    @"32",
    @"34",
    @"36",
    @"38",
    @"40",
    @"42",
    @"44",
    @"46",
    @"48",
    @"50",
    @"52",
    @"54",
    @"56",
    @"58",
    @"60",
    @"62",
    @"64",
    @"66",
    @"68",
    @"70",
    @"72",
    @"74",
    @"76",
    @"78",
    @"80",
    @"82",
    @"84",
    @"86",
    @"88",
    @"90",
    @"92",
    @"94",
    @"96",
    @"98",
    @"100",
    @"102",
    @"104",
    @"106",
    @"108",
    @"110",
    @"112",
    @"114",
    @"116",
    @"118",
    @"120",
    @"122",
    @"124",
    @"126",
    @"128",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"66" => 66,
            .@"34" => 34,
            .@"104" => 104,
            .@"114" => 114,
            .@"94" => 94,
            .@"86" => 86,
            .@"124" => 124,
            .@"22" => 22,
            .@"24" => 24,
            .@"8" => 8,
            .@"32" => 32,
            .@"78" => 78,
            .@"82" => 82,
            .@"62" => 62,
            .@"28" => 28,
            .@"12" => 12,
            .@"74" => 74,
            .@"120" => 120,
            .@"6" => 6,
            .@"72" => 72,
            .@"80" => 80,
            .@"64" => 64,
            .@"76" => 76,
            .@"90" => 90,
            .@"26" => 26,
            .@"118" => 118,
            .@"60" => 60,
            .@"36" => 36,
            .@"20" => 20,
            .@"18" => 18,
            .@"100" => 100,
            .@"10" => 10,
            .@"88" => 88,
            .@"38" => 38,
            .@"46" => 46,
            .@"44" => 44,
            .@"84" => 84,
            .@"42" => 42,
            .@"30" => 30,
            .@"2" => 2,
            .@"54" => 54,
            .@"56" => 56,
            .@"110" => 110,
            .@"52" => 52,
            .@"92" => 92,
            .@"98" => 98,
            .@"116" => 116,
            .@"122" => 122,
            .@"48" => 48,
            .@"112" => 112,
            .@"40" => 40,
            .@"16" => 16,
            .@"58" => 58,
            .@"102" => 102,
            .@"128" => 128,
            .@"4" => 4,
            .@"68" => 68,
            .@"126" => 126,
            .@"106" => 106,
            .@"14" => 14,
            .@"50" => 50,
            .@"108" => 108,
            .@"96" => 96,
            .@"70" => 70,
        };
    }
};
pub const PLL1QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL1RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2FRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3FRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3RConf = enum(u32) {
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
pub const CSICalibrationValueConf = enum(u32) {
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
pub const Config = struct {
    HSIDiv: ?HSIDivConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    LSIRC: ?LSI_VALUEConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLL2Source: ?PLL2SourceConf = null,
    PLL3Source: ?PLL3SourceConf = null,
    PLLM: ?PLLMConf = null,
    PLL2M: ?PLL2MConf = null,
    PLL3M: ?PLL3MConf = null,
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    CECMult: ?CECCLockSelectionConf = null,
    USART1Mult: ?USART1CLockSelectionConf = null,
    USART2Mult: ?USART2CLockSelectionConf = null,
    USART3Mult: ?USART3CLockSelectionConf = null,
    UART4Mult: ?UART4CLockSelectionConf = null,
    UART5Mult: ?UART5CLockSelectionConf = null,
    USART6Mult: ?USART6CLockSelectionConf = null,
    UART7Mult: ?UART7CLockSelectionConf = null,
    USART11Mult: ?USART11CLockSelectionConf = null,
    LPUART1Mult: ?LPUART1CLockSelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionConf = null,
    LPTIM2Mult: ?LPTIM2CLockSelectionConf = null,
    DACMult: ?DACLowPowerCLockSelectionConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    CK48Mult: ?USBCLockSelectionConf = null,
    SDMMC1Mult: ?SDMMC1ClockSelectionConf = null,
    FDCANMult: ?FDCANClockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    I2C2Mult: ?I2C2CLockSelectionConf = null,
    I2C3Mult: ?I2C3CLockSelectionConf = null,
    SAI1Mult: ?SAI1CLockSelectionConf = null,
    SAI2Mult: ?SAI2CLockSelectionConf = null,
    I2C4Mult: ?I2C4CLockSelectionConf = null,
    I3C1Mult: ?I3C1CLockSelectionConf = null,
    OCTOSPIMMult: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3Mult: ?LPTIM3CLockSelectionConf = null,
    LPTIM4Mult: ?LPTIM4CLockSelectionConf = null,
    LPTIM5Mult: ?LPTIM5CLockSelectionConf = null,
    LPTIM6Mult: ?LPTIM6CLockSelectionConf = null,
    RNGMult: ?RNGCLockSelectionConf = null,
    MCOMult: ?RCC_MCO1SourceConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCO2DivConf = null,
    LSCOMult: ?LSCOSource1Conf = null,
    CKPERMult: ?CKPERSourceSelectionConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    CortexCLockSelection: ?CortexCLockSelectionConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    APB3Prescaler: ?APB3CLKDividerConf = null,
    SPI1Mult: ?SPI1CLockSelectionConf = null,
    SPI3Mult: ?SPI3CLockSelectionConf = null,
    SPI6Mult: ?SPI6CLockSelectionConf = null,
    SPI2Mult: ?SPI2CLockSelectionConf = null,
    PLLN: ?PLLNConf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    PLL1P: ?PLL1PConf = null,
    PLL1Q: ?PLL1QConf = null,
    PLL1R: ?PLL1RConf = null,
    PLL2N: ?PLL2NConf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    PLL2P: ?PLL2PConf = null,
    PLL2Q: ?PLL2QConf = null,
    PLL2R: ?PLL2RConf = null,
    PLL3N: ?PLL3NConf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    PLL3P: ?PLL3PConf = null,
    PLL3Q: ?PLL3QConf = null,
    PLL3R: ?PLL3RConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    CSICalibrationValue: ?CSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    HSIDiv: ?HSIDivConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSI_VALUE: ?LSI_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLL2Source: ?PLL2SourceConf = null,
    PLL3Source: ?PLL3SourceConf = null,
    PLLM: ?PLLMConf = null,
    PLL2M: ?PLL2MConf = null,
    PLL3M: ?PLL3MConf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    CECCLockSelection: ?CECCLockSelectionConf = null,
    USART1CLockSelection: ?USART1CLockSelectionConf = null,
    USART2CLockSelection: ?USART2CLockSelectionConf = null,
    USART3CLockSelection: ?USART3CLockSelectionConf = null,
    UART4CLockSelection: ?UART4CLockSelectionConf = null,
    UART5CLockSelection: ?UART5CLockSelectionConf = null,
    USART6CLockSelection: ?USART6CLockSelectionConf = null,
    UART7CLockSelection: ?UART7CLockSelectionConf = null,
    USART11CLockSelection: ?USART11CLockSelectionConf = null,
    LPUART1CLockSelection: ?LPUART1CLockSelectionConf = null,
    LPTIM1CLockSelection: ?LPTIM1CLockSelectionConf = null,
    LPTIM2CLockSelection: ?LPTIM2CLockSelectionConf = null,
    DACLowPowerCLockSelection: ?DACLowPowerCLockSelectionConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    USBCLockSelection: ?USBCLockSelectionConf = null,
    SDMMC1ClockSelection: ?SDMMC1ClockSelectionConf = null,
    FDCANClockSelection: ?FDCANClockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    I2C2CLockSelection: ?I2C2CLockSelectionConf = null,
    I2C3CLockSelection: ?I2C3CLockSelectionConf = null,
    SAI1CLockSelection: ?SAI1CLockSelectionConf = null,
    SAI2CLockSelection: ?SAI2CLockSelectionConf = null,
    I2C4CLockSelection: ?I2C4CLockSelectionConf = null,
    I3C1CLockSelection: ?I3C1CLockSelectionConf = null,
    OCTOSPIMCLockSelection: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3CLockSelection: ?LPTIM3CLockSelectionConf = null,
    LPTIM4CLockSelection: ?LPTIM4CLockSelectionConf = null,
    LPTIM5CLockSelection: ?LPTIM5CLockSelectionConf = null,
    LPTIM6CLockSelection: ?LPTIM6CLockSelectionConf = null,
    RNGCLockSelection: ?RNGCLockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCO2Div: ?RCC_MCO2DivConf = null,
    LSCOSource1: ?LSCOSource1Conf = null,
    CKPERSourceSelection: ?CKPERSourceSelectionConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    CortexCLockSelection: ?CortexCLockSelectionConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    APB3CLKDivider: ?APB3CLKDividerConf = null,
    SPI1CLockSelection: ?SPI1CLockSelectionConf = null,
    SPI3CLockSelection: ?SPI3CLockSelectionConf = null,
    SPI6CLockSelection: ?SPI6CLockSelectionConf = null,
    SPI2CLockSelection: ?SPI2CLockSelectionConf = null,
    PLLN: ?PLLNConf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    PLL1P: ?PLL1PConf = null,
    PLL1Q: ?PLL1QConf = null,
    PLL1R: ?PLL1RConf = null,
    PLL2N: ?PLL2NConf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    PLL2P: ?PLL2PConf = null,
    PLL2Q: ?PLL2QConf = null,
    PLL2R: ?PLL2RConf = null,
    PLL3N: ?PLL3NConf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    PLL3P: ?PLL3PConf = null,
    PLL3Q: ?PLL3QConf = null,
    PLL3R: ?PLL3RConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    CSICalibrationValue: ?CSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSIDiv = self.HSIDiv,
            .HSEOSC = self.HSE_VALUE,
            .LSIRC = self.LSI_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLL2Source = self.PLL2Source,
            .PLL3Source = self.PLL3Source,
            .PLLM = self.PLLM,
            .PLL2M = self.PLL2M,
            .PLL3M = self.PLL3M,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCClockSelection,
            .CECMult = self.CECCLockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .USART2Mult = self.USART2CLockSelection,
            .USART3Mult = self.USART3CLockSelection,
            .UART4Mult = self.UART4CLockSelection,
            .UART5Mult = self.UART5CLockSelection,
            .USART6Mult = self.USART6CLockSelection,
            .UART7Mult = self.UART7CLockSelection,
            .USART11Mult = self.USART11CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .DACMult = self.DACLowPowerCLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .CK48Mult = self.USBCLockSelection,
            .SDMMC1Mult = self.SDMMC1ClockSelection,
            .FDCANMult = self.FDCANClockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .SAI2Mult = self.SAI2CLockSelection,
            .I2C4Mult = self.I2C4CLockSelection,
            .I3C1Mult = self.I3C1CLockSelection,
            .OCTOSPIMMult = self.OCTOSPIMCLockSelection,
            .LPTIM3Mult = self.LPTIM3CLockSelection,
            .LPTIM4Mult = self.LPTIM4CLockSelection,
            .LPTIM5Mult = self.LPTIM5CLockSelection,
            .LPTIM6Mult = self.LPTIM6CLockSelection,
            .RNGMult = self.RNGCLockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCO2Div,
            .LSCOMult = self.LSCOSource1,
            .CKPERMult = self.CKPERSourceSelection,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .CortexCLockSelection = self.CortexCLockSelection,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .APB3Prescaler = self.APB3CLKDivider,
            .SPI1Mult = self.SPI1CLockSelection,
            .SPI3Mult = self.SPI3CLockSelection,
            .SPI6Mult = self.SPI6CLockSelection,
            .SPI2Mult = self.SPI2CLockSelection,
            .PLLN = self.PLLN,
            .PLLFRACN = self.PLLFRACN,
            .PLL1P = self.PLL1P,
            .PLL1Q = self.PLL1Q,
            .PLL1R = self.PLL1R,
            .PLL2N = self.PLL2N,
            .PLL2FRACN = self.PLL2FRACN,
            .PLL2P = self.PLL2P,
            .PLL2Q = self.PLL2Q,
            .PLL2R = self.PLL2R,
            .PLL3N = self.PLL3N,
            .PLL3FRACN = self.PLL3FRACN,
            .PLL3P = self.PLL3P,
            .PLL3Q = self.PLL3Q,
            .PLL3R = self.PLL3R,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .RCC_TIM_PRescaler_Selection = self.RCC_TIM_PRescaler_Selection,
            .HSICalibrationValue = self.HSICalibrationValue,
            .CSICalibrationValue = self.CSICalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSIDiv: ClockNode,
    CRSCLKoutput: ClockNode,
    HSI48RC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    CSIRC: ClockNode,
    AUDIOCLK: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLL2Source: ClockNode,
    PLL3Source: ClockNode,
    PLLM: ClockNode,
    PLL2M: ClockNode,
    PLL3M: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    CSIdivTohdmi: ClockNode,
    CECMult: ClockNode,
    CECoutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    UART4Mult: ClockNode,
    UART4output: ClockNode,
    UART5Mult: ClockNode,
    UART5output: ClockNode,
    USART6Mult: ClockNode,
    USART6output: ClockNode,
    UART7Mult: ClockNode,
    UART7output: ClockNode,
    USART11Mult: ClockNode,
    USART11output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    DACMult: ClockNode,
    DACoutput: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CK48Mult: ClockNode,
    ETHoutput: ClockNode,
    USBoutput: ClockNode,
    SDMMC1Mult: ClockNode,
    SDMMC1Output: ClockNode,
    FDCANMult: ClockNode,
    FDCANOutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    I3C1Mult: ClockNode,
    I3C1output: ClockNode,
    OCTOSPIMMult: ClockNode,
    OCTOSPIMoutput: ClockNode,
    LPTIM3Mult: ClockNode,
    LPTIM3output: ClockNode,
    LPTIM4Mult: ClockNode,
    LPTIM4output: ClockNode,
    LPTIM5Mult: ClockNode,
    LPTIM5output: ClockNode,
    LPTIM6Mult: ClockNode,
    LPTIM6output: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    CKPERMult: ClockNode,
    CKPERoutput: ClockNode,
    AHBPrescaler: ClockNode,
    PWRCLKoutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexCLockSelection: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    APB3Prescaler: ClockNode,
    APB3Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    hsidivToUCPD: ClockNode,
    UCPD1Output: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
    SPI6Mult: ClockNode,
    SPI6output: ClockNode,
    SPI2Mult: ClockNode,
    SPI2output: ClockNode,
    PLLN: ClockNode,
    PLLFRACN: ClockNode,
    PLL1P: ClockNode,
    PLL1Q: ClockNode,
    PLLQoutput: ClockNode,
    PLL1R: ClockNode,
    PLL2N: ClockNode,
    PLL2FRACN: ClockNode,
    PLL2P: ClockNode,
    PLL2Poutput: ClockNode,
    PLL2Q: ClockNode,
    PLL2Qoutput: ClockNode,
    PLL2R: ClockNode,
    PLL2Routput: ClockNode,
    PLL3N: ClockNode,
    PLL3FRACN: ClockNode,
    PLL3P: ClockNode,
    PLL3Poutput: ClockNode,
    PLL3Q: ClockNode,
    PLL3Qoutput: ClockNode,
    PLL3R: ClockNode,
    PLL3Routput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    RCC_TIM_PRescaler_Selection: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    CSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSIDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSIDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const HSIDiv: ClockNode = .{
            .name = "HSIDiv",
            .Nodetype = HSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = HSI48RCval,
        };
        const CRSCLKoutputval = ClockNodeTypes{ .output = null };
        const CRSCLKoutput: ClockNode = .{
            .name = "CRSCLKoutput",
            .Nodetype = CRSCLKoutputval,
            .parents = &[_]*const ClockNode{&HSI48RC},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 25000000,
                .limit = .{ .max = 50000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSIRC) |val| val.get() else 32000,
                .limit = .{ .max = 32600, .min = 31400 },
            },
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
        const CSIRCval = ClockNodeTypes{
            .source = .{ .value = 4000000 },
        };
        const CSIRC: ClockNode = .{
            .name = "CSIRC",
            .Nodetype = CSIRCval,
        };
        const AUDIOCLKval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const AUDIOCLK: ClockNode = .{
            .name = "AUDIOCLK",
            .Nodetype = AUDIOCLKval,
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
                &CSIRC,
                &HSIDiv,
                &HSEOSC,
            },
        };
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLM) |val| val.get() else 1,
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLFRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLLFRACN) |val| val.get() else 0,
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .Nodetype = PLLFRACNval,
        };
        const PLLNval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLLN) |val| val.get() else 129,
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{ &PLLM, &PLLFRACN },
        };
        const PLL1Pval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLL1P) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLL1P: ClockNode = .{
            .name = "PLL1P",
            .Nodetype = PLL1Pval,
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
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &PLL1P,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PLL2Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL2Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",
            .Nodetype = PLL2Sourceval,

            .parents = &[_]*const ClockNode{
                &CSIRC,
                &HSIDiv,
                &HSEOSC,
            },
        };
        const PLL3Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL3Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",
            .Nodetype = PLL3Sourceval,

            .parents = &[_]*const ClockNode{
                &CSIRC,
                &HSIDiv,
                &HSEOSC,
            },
        };
        const PLL2Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2M) |val| val.get() else 1,
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const PLL2M: ClockNode = .{
            .name = "PLL2M",
            .Nodetype = PLL2Mval,
            .parents = &[_]*const ClockNode{&PLL2Source},
        };
        const PLL3Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3M) |val| val.get() else 1,
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const PLL3M: ClockNode = .{
            .name = "PLL3M",
            .Nodetype = PLL3Mval,
            .parents = &[_]*const ClockNode{&PLL3Source},
        };
        const HSERTCDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSERTCDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
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
                    break :inner val.get();
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
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = 50000000, .min = 0 },
        };
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
        const CSIdivTohdmival = ClockNodeTypes{
            .div = .{ .value = 122 },
        };
        const CSIdivTohdmi: ClockNode = .{
            .name = "CSIdivTohdmi",
            .Nodetype = CSIdivTohdmival,
            .parents = &[_]*const ClockNode{&CSIRC},
        };
        const CECMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CECMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",
            .Nodetype = CECMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &CSIdivTohdmi,
                &LSIRC,
            },
        };
        const CECoutputval = ClockNodeTypes{ .output = null };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .Nodetype = CECoutputval,
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
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
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
        const PLL2FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL2FRACN) |val| val.get() else 0,
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLL2FRACN: ClockNode = .{
            .name = "PLL2FRACN",
            .Nodetype = PLL2FRACNval,
        };
        const PLL2Nval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLL2N) |val| val.get() else 129,
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const PLL2N: ClockNode = .{
            .name = "PLL2N",
            .Nodetype = PLL2Nval,
            .parents = &[_]*const ClockNode{ &PLL2M, &PLL2FRACN },
        };
        const PLL2Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2Q) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL2Q: ClockNode = .{
            .name = "PLL2Q",
            .Nodetype = PLL2Qval,
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const PLL3FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL3FRACN) |val| val.get() else 0,
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLL3FRACN: ClockNode = .{
            .name = "PLL3FRACN",
            .Nodetype = PLL3FRACNval,
        };
        const PLL3Nval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLL3N) |val| val.get() else 129,
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const PLL3N: ClockNode = .{
            .name = "PLL3N",
            .Nodetype = PLL3Nval,
            .parents = &[_]*const ClockNode{ &PLL3M, &PLL3FRACN },
        };
        const PLL3Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3Q) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL3Q: ClockNode = .{
            .name = "PLL3Q",
            .Nodetype = PLL3Qval,
            .parents = &[_]*const ClockNode{&PLL3N},
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
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART1outputval = ClockNodeTypes{ .output = null };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
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
            .Nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART2outputval = ClockNodeTypes{ .output = null };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = USART2outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
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
            .Nodetype = USART3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART3outputval = ClockNodeTypes{ .output = null };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = USART3outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const UART4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",
            .Nodetype = UART4Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const UART4outputval = ClockNodeTypes{ .output = null };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .Nodetype = UART4outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",
            .Nodetype = UART5Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const UART5outputval = ClockNodeTypes{ .output = null };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .Nodetype = UART5outputval,
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const USART6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",
            .Nodetype = USART6Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART6outputval = ClockNodeTypes{ .output = null };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = USART6outputval,
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const UART7Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART7Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART7Mult: ClockNode = .{
            .name = "UART7Mult",
            .Nodetype = UART7Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const UART7outputval = ClockNodeTypes{ .output = null };
        const UART7output: ClockNode = .{
            .name = "UART7output",
            .Nodetype = UART7outputval,
            .parents = &[_]*const ClockNode{&UART7Mult},
        };
        const USART11Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART11Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART11Mult: ClockNode = .{
            .name = "USART11Mult",
            .Nodetype = USART11Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART11outputval = ClockNodeTypes{ .output = null };
        const USART11output: ClockNode = .{
            .name = "USART11output",
            .Nodetype = USART11outputval,
            .parents = &[_]*const ClockNode{&USART11Mult},
        };
        const APB3Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB3Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB3Prescaler: ClockNode = .{
            .name = "APB3Prescaler",
            .Nodetype = APB3Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB3Outputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = APB3Outputval,
            .parents = &[_]*const ClockNode{&APB3Prescaler},
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
            .Nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const LPUART1outputval = ClockNodeTypes{ .output = null };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = LPUART1outputval,
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const PLL2Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2P) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL2P: ClockNode = .{
            .name = "PLL2P",
            .Nodetype = PLL2Pval,
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const CKPERMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CKPERMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CKPERMult: ClockNode = .{
            .name = "CKPERMult",
            .Nodetype = CKPERMultval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
                &CSIRC,
            },
        };
        const PLL3Rval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3R) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL3R: ClockNode = .{
            .name = "PLL3R",
            .Nodetype = PLL3Rval,
            .parents = &[_]*const ClockNode{&PLL3N},
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
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
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
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .Nodetype = LPTIM2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
            },
        };
        const LPTIM2outputval = ClockNodeTypes{ .output = null };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const DACMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DACMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const DACMult: ClockNode = .{
            .name = "DACMult",
            .Nodetype = DACMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
            },
        };
        const DACoutputval = ClockNodeTypes{ .output = null };
        const DACoutput: ClockNode = .{
            .name = "DACoutput",
            .Nodetype = DACoutputval,
            .parents = &[_]*const ClockNode{&DACMult},
        };
        const PLL2Rval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2R) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL2R: ClockNode = .{
            .name = "PLL2R",
            .Nodetype = PLL2Rval,
            .parents = &[_]*const ClockNode{&PLL2N},
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
            .Nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &SysCLKOutput,
                &PLL2R,
                &HSEOSC,
                &HSIDiv,
                &CSIRC,
            },
        };
        const ADCoutputval = ClockNodeTypes{ .output = null };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const PLL1Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL1Q) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL1Q: ClockNode = .{
            .name = "PLL1Q",
            .Nodetype = PLL1Qval,
            .parents = &[_]*const ClockNode{&PLLN},
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
            .Nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &PLL3Q,
                &PLL1Q,
                &HSI48RC,
            },
        };
        const ETHoutputval = ClockNodeTypes{ .output = null };
        const ETHoutput: ClockNode = .{
            .name = "ETHoutput",
            .Nodetype = ETHoutputval,
            .parents = &[_]*const ClockNode{&PLL1Q},
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = 50000000, .min = 0 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const SDMMC1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMC1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SDMMC1Mult: ClockNode = .{
            .name = "SDMMC1Mult",
            .Nodetype = SDMMC1Multval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2R,
            },
        };
        const SDMMC1Outputval = ClockNodeTypes{ .output = null };
        const SDMMC1Output: ClockNode = .{
            .name = "SDMMC1Output",
            .Nodetype = SDMMC1Outputval,
            .parents = &[_]*const ClockNode{&SDMMC1Mult},
        };
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",
            .Nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2Q,
                &HSEOSC,
            },
        };
        const FDCANOutputval = ClockNodeTypes{ .output = null };
        const FDCANOutput: ClockNode = .{
            .name = "FDCANOutput",
            .Nodetype = FDCANOutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
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
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL3R,
                &HSIDiv,
                &CSIRC,
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
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .Nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL3R,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C2outputval = ClockNodeTypes{ .output = null };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .Nodetype = I2C2outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL3R,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C3outputval = ClockNodeTypes{ .output = null };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = I2C3outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const PLL3Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3P) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL3P: ClockNode = .{
            .name = "PLL3P",
            .Nodetype = PLL3Pval,
            .parents = &[_]*const ClockNode{&PLL3N},
        };
        const SAI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",
            .Nodetype = SAI1Multval,

            .parents = &[_]*const ClockNode{
                &PLL2P,
                &PLL3P,
                &PLL1Q,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SAI1outputval = ClockNodeTypes{ .output = null };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",
            .Nodetype = SAI2Multval,

            .parents = &[_]*const ClockNode{
                &PLL2P,
                &PLL3P,
                &PLL1Q,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SAI2outputval = ClockNodeTypes{ .output = null };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = SAI2outputval,
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const I2C4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",
            .Nodetype = I2C4Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL3R,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C4outputval = ClockNodeTypes{ .output = null };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = I2C4outputval,
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const I3C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I3C1Mult: ClockNode = .{
            .name = "I3C1Mult",
            .Nodetype = I3C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL3R,
                &HSIDiv,
            },
        };
        const I3C1outputval = ClockNodeTypes{ .output = null };
        const I3C1output: ClockNode = .{
            .name = "I3C1output",
            .Nodetype = I3C1outputval,
            .parents = &[_]*const ClockNode{&I3C1Mult},
        };
        const OCTOSPIMMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.OCTOSPIMMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const OCTOSPIMMult: ClockNode = .{
            .name = "OCTOSPIMMult",
            .Nodetype = OCTOSPIMMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &PLL1Q,
                &PLL2R,
                &CKPERMult,
            },
        };
        const OCTOSPIMoutputval = ClockNodeTypes{ .output = null };
        const OCTOSPIMoutput: ClockNode = .{
            .name = "OCTOSPIMoutput",
            .Nodetype = OCTOSPIMoutputval,
            .parents = &[_]*const ClockNode{&OCTOSPIMMult},
        };
        const LPTIM3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM3Mult: ClockNode = .{
            .name = "LPTIM3Mult",
            .Nodetype = LPTIM3Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
            },
        };
        const LPTIM3outputval = ClockNodeTypes{ .output = null };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .Nodetype = LPTIM3outputval,
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const LPTIM4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM4Mult: ClockNode = .{
            .name = "LPTIM4Mult",
            .Nodetype = LPTIM4Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
            },
        };
        const LPTIM4outputval = ClockNodeTypes{ .output = null };
        const LPTIM4output: ClockNode = .{
            .name = "LPTIM4output",
            .Nodetype = LPTIM4outputval,
            .parents = &[_]*const ClockNode{&LPTIM4Mult},
        };
        const LPTIM5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM5Mult: ClockNode = .{
            .name = "LPTIM5Mult",
            .Nodetype = LPTIM5Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
            },
        };
        const LPTIM5outputval = ClockNodeTypes{ .output = null };
        const LPTIM5output: ClockNode = .{
            .name = "LPTIM5output",
            .Nodetype = LPTIM5outputval,
            .parents = &[_]*const ClockNode{&LPTIM5Mult},
        };
        const LPTIM6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM6Mult: ClockNode = .{
            .name = "LPTIM6Mult",
            .Nodetype = LPTIM6Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
            },
        };
        const LPTIM6outputval = ClockNodeTypes{ .output = null };
        const LPTIM6output: ClockNode = .{
            .name = "LPTIM6output",
            .Nodetype = LPTIM6outputval,
            .parents = &[_]*const ClockNode{&LPTIM6Mult},
        };
        const RNGMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.RNGMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",
            .Nodetype = RNGMultval,

            .parents = &[_]*const ClockNode{
                &HSI48RC,
                &PLL1Q,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RNGoutputval = ClockNodeTypes{ .output = null };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &HSEOSC,
                &HSIDiv,
                &PLL1Q,
                &HSI48RC,
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
            .Nodetype = MCO2Multval,

            .parents = &[_]*const ClockNode{
                &LSIRC,
                &HSEOSC,
                &CSIRC,
                &PLL1P,
                &PLL2P,
                &SysCLKOutput,
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
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = MCO2Pinval,
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
        const CKPERoutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const CKPERoutput: ClockNode = .{
            .name = "CKPERoutput",
            .Nodetype = CKPERoutputval,
            .parents = &[_]*const ClockNode{&CKPERMult},
        };
        const PWRCLKoutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = PWRCLKoutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
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
        const CortexCLockSelectionval = ClockNodeTypes{
            .multi = inner: {
                if (config.CortexCLockSelection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CortexCLockSelection: ClockNode = .{
            .name = "CortexCLockSelection",
            .Nodetype = CortexCLockSelectionval,

            .parents = &[_]*const ClockNode{
                &CortexPrescaler,
                &LSEOSC,
                &LSIRC,
            },
        };
        const CortexSysOutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexCLockSelection},
        };
        const FCLKCortexOutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
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
        const TimPrescOut1val = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
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
        const TimPrescOut2val = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const hsidivToUCPDval = ClockNodeTypes{
            .div = .{ .value = 4 },
        };
        const hsidivToUCPD: ClockNode = .{
            .name = "hsidivToUCPD",
            .Nodetype = hsidivToUCPDval,
            .parents = &[_]*const ClockNode{&HSIDiv},
        };
        const UCPD1Outputval = ClockNodeTypes{ .output = null };
        const UCPD1Output: ClockNode = .{
            .name = "UCPD1Output",
            .Nodetype = UCPD1Outputval,
            .parents = &[_]*const ClockNode{&hsidivToUCPD},
        };
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",
            .Nodetype = SPI1Multval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &PLL3P,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SPI1outputval = ClockNodeTypes{ .output = null };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = SPI1outputval,
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",
            .Nodetype = SPI3Multval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &PLL3P,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SPI3outputval = ClockNodeTypes{ .output = null };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = SPI3outputval,
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const SPI6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI6Mult: ClockNode = .{
            .name = "SPI6Mult",
            .Nodetype = SPI6Multval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &PLL2Q,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &PLL3Q,
            },
        };
        const SPI6outputval = ClockNodeTypes{ .output = null };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .Nodetype = SPI6outputval,
            .parents = &[_]*const ClockNode{&SPI6Mult},
        };
        const SPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",
            .Nodetype = SPI2Multval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &PLL3P,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SPI2outputval = ClockNodeTypes{ .output = null };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .Nodetype = SPI2outputval,
            .parents = &[_]*const ClockNode{&SPI2Mult},
        };
        const PLLQoutputval = ClockNodeTypes{ .output = null };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLL1Q},
        };
        const PLL1Rval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL1R) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL1R: ClockNode = .{
            .name = "PLL1R",
            .Nodetype = PLL1Rval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLL2Poutputval = ClockNodeTypes{ .output = null };
        const PLL2Poutput: ClockNode = .{
            .name = "PLL2Poutput",
            .Nodetype = PLL2Poutputval,
            .parents = &[_]*const ClockNode{&PLL2P},
        };
        const PLL2Qoutputval = ClockNodeTypes{ .output = null };
        const PLL2Qoutput: ClockNode = .{
            .name = "PLL2Qoutput",
            .Nodetype = PLL2Qoutputval,
            .parents = &[_]*const ClockNode{&PLL2Q},
        };
        const PLL2Routputval = ClockNodeTypes{ .output = null };
        const PLL2Routput: ClockNode = .{
            .name = "PLL2Routput",
            .Nodetype = PLL2Routputval,
            .parents = &[_]*const ClockNode{&PLL2R},
        };
        const PLL3Poutputval = ClockNodeTypes{ .output = null };
        const PLL3Poutput: ClockNode = .{
            .name = "PLL3Poutput",
            .Nodetype = PLL3Poutputval,
            .parents = &[_]*const ClockNode{&PLL3P},
        };
        const PLL3Qoutputval = ClockNodeTypes{ .output = null };
        const PLL3Qoutput: ClockNode = .{
            .name = "PLL3Qoutput",
            .Nodetype = PLL3Qoutputval,
            .parents = &[_]*const ClockNode{&PLL3Q},
        };
        const PLL3Routputval = ClockNodeTypes{ .output = null };
        const PLL3Routput: ClockNode = .{
            .name = "PLL3Routput",
            .Nodetype = PLL3Routputval,
            .parents = &[_]*const ClockNode{&PLL3R},
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
        const CSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.CSICalibrationValue) |val| val.get() else 32,
                .limit = .{ .max = 255, .min = 0 },
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
        return .{
            .HSIRC = HSIRC,
            .HSIDiv = HSIDiv,
            .CRSCLKoutput = CRSCLKoutput,
            .HSI48RC = HSI48RC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .CSIRC = CSIRC,
            .AUDIOCLK = AUDIOCLK,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLL2Source = PLL2Source,
            .PLL3Source = PLL3Source,
            .PLLM = PLLM,
            .PLL2M = PLL2M,
            .PLL3M = PLL3M,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .CSIdivTohdmi = CSIdivTohdmi,
            .CECMult = CECMult,
            .CECoutput = CECoutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .UART4Mult = UART4Mult,
            .UART4output = UART4output,
            .UART5Mult = UART5Mult,
            .UART5output = UART5output,
            .USART6Mult = USART6Mult,
            .USART6output = USART6output,
            .UART7Mult = UART7Mult,
            .UART7output = UART7output,
            .USART11Mult = USART11Mult,
            .USART11output = USART11output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .DACMult = DACMult,
            .DACoutput = DACoutput,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CK48Mult = CK48Mult,
            .ETHoutput = ETHoutput,
            .USBoutput = USBoutput,
            .SDMMC1Mult = SDMMC1Mult,
            .SDMMC1Output = SDMMC1Output,
            .FDCANMult = FDCANMult,
            .FDCANOutput = FDCANOutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .I3C1Mult = I3C1Mult,
            .I3C1output = I3C1output,
            .OCTOSPIMMult = OCTOSPIMMult,
            .OCTOSPIMoutput = OCTOSPIMoutput,
            .LPTIM3Mult = LPTIM3Mult,
            .LPTIM3output = LPTIM3output,
            .LPTIM4Mult = LPTIM4Mult,
            .LPTIM4output = LPTIM4output,
            .LPTIM5Mult = LPTIM5Mult,
            .LPTIM5output = LPTIM5output,
            .LPTIM6Mult = LPTIM6Mult,
            .LPTIM6output = LPTIM6output,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .CKPERMult = CKPERMult,
            .CKPERoutput = CKPERoutput,
            .AHBPrescaler = AHBPrescaler,
            .PWRCLKoutput = PWRCLKoutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexCLockSelection = CortexCLockSelection,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .APB3Prescaler = APB3Prescaler,
            .APB3Output = APB3Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .hsidivToUCPD = hsidivToUCPD,
            .UCPD1Output = UCPD1Output,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
            .SPI6Mult = SPI6Mult,
            .SPI6output = SPI6output,
            .SPI2Mult = SPI2Mult,
            .SPI2output = SPI2output,
            .PLLN = PLLN,
            .PLLFRACN = PLLFRACN,
            .PLL1P = PLL1P,
            .PLL1Q = PLL1Q,
            .PLLQoutput = PLLQoutput,
            .PLL1R = PLL1R,
            .PLL2N = PLL2N,
            .PLL2FRACN = PLL2FRACN,
            .PLL2P = PLL2P,
            .PLL2Poutput = PLL2Poutput,
            .PLL2Q = PLL2Q,
            .PLL2Qoutput = PLL2Qoutput,
            .PLL2R = PLL2R,
            .PLL2Routput = PLL2Routput,
            .PLL3N = PLL3N,
            .PLL3FRACN = PLL3FRACN,
            .PLL3P = PLL3P,
            .PLL3Poutput = PLL3Poutput,
            .PLL3Q = PLL3Q,
            .PLL3Qoutput = PLL3Qoutput,
            .PLL3R = PLL3R,
            .PLL3Routput = PLL3Routput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval,
            .HSICalibrationValue = HSICalibrationValueval,
            .CSICalibrationValue = CSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.CRSCLKoutput.get_comptime();
        _ = self.RTCOutput.get_comptime();
        _ = self.IWDGOutput.get_comptime();
        _ = self.CECoutput.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.UART4output.get_comptime();
        _ = self.UART5output.get_comptime();
        _ = self.USART6output.get_comptime();
        _ = self.UART7output.get_comptime();
        _ = self.USART11output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.DACoutput.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.ETHoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.SDMMC1Output.get_comptime();
        _ = self.FDCANOutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.I3C1output.get_comptime();
        _ = self.OCTOSPIMoutput.get_comptime();
        _ = self.LPTIM3output.get_comptime();
        _ = self.LPTIM4output.get_comptime();
        _ = self.LPTIM5output.get_comptime();
        _ = self.LPTIM6output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.APB3Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI3output.get_comptime();
        _ = self.SPI6output.get_comptime();
        _ = self.SPI2output.get_comptime();
    }
};
