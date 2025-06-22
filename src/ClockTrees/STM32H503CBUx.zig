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
    RCC_HSIPLL2SourceARGP_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSI_DIV1 => 1,
            .RCC_HSI_DIV2 => 2,
            .RCC_HSI_DIV4 => 4,
            .RCC_HSIPLL2SourceARGP_DIV8 => 8,
        };
    }
};
pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 50000000;
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
        return 32600;
    }

    pub fn min() f32 {
        return 31400;
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
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_CSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLL1_SOURCE_CSI,
    RCC_PLL1_SOURCE_HSI,
    RCC_PLL1_SOURCE_HSE,
};
pub const PLL2SourceConf = enum {
    RCC_PLL2_SOURCE_CSI,
    RCC_PLL2_SOURCE_HSI,
    RCC_PLL2_SOURCE_HSE,
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
        return 1;
    }
};
pub const PLL2MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 1;
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
            .RCC_RTC_HSE_NOCLOCK => 1,
            .RCC_RTC_HSE_DIV2 => 2,
            .RCC_RTC_HSE_DIV3 => 3,
            .RCC_RTC_HSE_DIV4 => 4,
            .RCC_RTC_HSE_DIV5 => 5,
            .RCC_RTC_HSE_DIV6 => 6,
            .RCC_RTC_HSE_DIV7 => 7,
            .RCC_RTC_HSE_DIV8 => 8,
            .RCC_RTC_HSE_DIV9 => 9,
            .RCC_RTC_HSE_DIV10 => 10,
            .RCC_RTC_HSE_DIV11 => 11,
            .RCC_RTC_HSE_DIV12 => 12,
            .RCC_RTC_HSE_DIV13 => 13,
            .RCC_RTC_HSE_DIV14 => 14,
            .RCC_RTC_HSE_DIV15 => 15,
            .RCC_RTC_HSE_DIV16 => 16,
            .RCC_RTC_HSE_DIV17 => 17,
            .RCC_RTC_HSE_DIV18 => 18,
            .RCC_RTC_HSE_DIV19 => 19,
            .RCC_RTC_HSE_DIV20 => 20,
            .RCC_RTC_HSE_DIV21 => 21,
            .RCC_RTC_HSE_DIV22 => 22,
            .RCC_RTC_HSE_DIV23 => 23,
            .RCC_RTC_HSE_DIV24 => 24,
            .RCC_RTC_HSE_DIV25 => 25,
            .RCC_RTC_HSE_DIV26 => 26,
            .RCC_RTC_HSE_DIV27 => 27,
            .RCC_RTC_HSE_DIV28 => 28,
            .RCC_RTC_HSE_DIV29 => 29,
            .RCC_RTC_HSE_DIV30 => 30,
            .RCC_RTC_HSE_DIV31 => 31,
            .RCC_RTC_HSE_DIV32 => 32,
            .RCC_RTC_HSE_DIV33 => 33,
            .RCC_RTC_HSE_DIV34 => 34,
            .RCC_RTC_HSE_DIV35 => 35,
            .RCC_RTC_HSE_DIV36 => 36,
            .RCC_RTC_HSE_DIV37 => 37,
            .RCC_RTC_HSE_DIV38 => 38,
            .RCC_RTC_HSE_DIV39 => 39,
            .RCC_RTC_HSE_DIV40 => 40,
            .RCC_RTC_HSE_DIV41 => 41,
            .RCC_RTC_HSE_DIV42 => 42,
            .RCC_RTC_HSE_DIV43 => 43,
            .RCC_RTC_HSE_DIV44 => 44,
            .RCC_RTC_HSE_DIV45 => 45,
            .RCC_RTC_HSE_DIV46 => 46,
            .RCC_RTC_HSE_DIV47 => 47,
            .RCC_RTC_HSE_DIV48 => 48,
            .RCC_RTC_HSE_DIV49 => 49,
            .RCC_RTC_HSE_DIV50 => 50,
            .RCC_RTC_HSE_DIV51 => 51,
            .RCC_RTC_HSE_DIV52 => 52,
            .RCC_RTC_HSE_DIV53 => 53,
            .RCC_RTC_HSE_DIV54 => 54,
            .RCC_RTC_HSE_DIV55 => 55,
            .RCC_RTC_HSE_DIV56 => 56,
            .RCC_RTC_HSE_DIV57 => 57,
            .RCC_RTC_HSE_DIV58 => 58,
            .RCC_RTC_HSE_DIV59 => 59,
            .RCC_RTC_HSE_DIV60 => 60,
            .RCC_RTC_HSE_DIV61 => 61,
            .RCC_RTC_HSE_DIV62 => 62,
            .RCC_RTC_HSE_DIV63 => 63,
        };
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,
};
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_PLL2Q,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
    RCC_USART1CLKSOURCE_CSI,
};
pub const USART2CLockSelectionConf = enum {
    RCC_USART2CLKSOURCE_PCLK1,
    RCC_USART2CLKSOURCE_PLL2Q,
    RCC_USART2CLKSOURCE_HSI,
    RCC_USART2CLKSOURCE_LSE,
    RCC_USART2CLKSOURCE_CSI,
};
pub const USART3CLockSelectionConf = enum {
    RCC_USART3CLKSOURCE_PCLK1,
    RCC_USART3CLKSOURCE_PLL2Q,
    RCC_USART3CLKSOURCE_HSI,
    RCC_USART3CLKSOURCE_LSE,
    RCC_USART3CLKSOURCE_CSI,
};
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK3,
    RCC_LPUART1CLKSOURCE_PLL2Q,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,
    RCC_LPUART1CLKSOURCE_CSI,
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK3,
    RCC_LPTIM1CLKSOURCE_PLL2P,
    RCC_LPTIM1CLKSOURCE_LSE,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_CLKP,
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK1,
    RCC_LPTIM2CLKSOURCE_PLL2P,
    RCC_LPTIM2CLKSOURCE_LSE,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_CLKP,
};
pub const DACLowPowerCLockSelectionConf = enum {
    RCC_DACLPCLKSOURCE_LSE,
    RCC_DACLPCLKSOURCE_LSI,
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCDACCLKSOURCE_HCLK,
    RCC_ADCDACCLKSOURCE_SYSCLK,
    RCC_ADCDACCLKSOURCE_PLL2R,
    RCC_ADCDACCLKSOURCE_HSE,
    RCC_ADCDACCLKSOURCE_HSI,
    RCC_ADCDACCLKSOURCE_CSI,
};
pub const USBCLockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLL2Q,
    RCC_USBCLKSOURCE_PLL1Q,
    RCC_USBCLKSOURCE_HSI48,
};
pub const FDCANClockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_PLL1Q,
    RCC_FDCANCLKSOURCE_PLL2Q,
    RCC_FDCANCLKSOURCE_HSE,
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_PLL2R,
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_CSI,
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_PLL2R,
    RCC_I2C2CLKSOURCE_HSI,
    RCC_I2C2CLKSOURCE_CSI,
};
pub const I3C2CLockSelectionConf = enum {
    RCC_I3C2CLKSOURCE_PCLK3,
    RCC_I3C2CLKSOURCE_PLL2R,
    RCC_I3C2CLKSOURCE_HSI,
};
pub const I3C1CLockSelectionConf = enum {
    RCC_I3C1CLKSOURCE_PCLK1,
    RCC_I3C1CLKSOURCE_PLL2R,
    RCC_I3C1CLKSOURCE_HSI,
};
pub const RNGCLockSelectionConf = enum {
    RCC_RNGCLKSOURCE_HSI48,
    RCC_RNGCLKSOURCE_PLL1Q,
    RCC_RNGCLKSOURCE_LSE,
    RCC_RNGCLKSOURCE_LSI,
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLL1Q,
    RCC_MCO1SOURCE_HSI48,
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
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_3 => 3,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_5 => 5,
            .RCC_MCODIV_6 => 6,
            .RCC_MCODIV_7 => 7,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_9 => 9,
            .RCC_MCODIV_10 => 10,
            .RCC_MCODIV_11 => 11,
            .RCC_MCODIV_12 => 12,
            .RCC_MCODIV_13 => 13,
            .RCC_MCODIV_14 => 14,
            .RCC_MCODIV_15 => 15,
        };
    }
};
pub const LSCOSource1Conf = enum {
    RCC_LSCOSOURCE_LSI,
    RCC_LSCOSOURCE_LSE,
};
pub const CKPERSourceSelectionConf = enum {
    RCC_CLKPSOURCE_HSI,
    RCC_CLKPSOURCE_HSE,
    RCC_CLKPSOURCE_CSI,
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
pub const CortexCLockSelectionConf = enum {
    SYSTICK_CLKSOURCE_HCLK_1_8,
    SYSTICK_CLKSOURCE_LSE,
    SYSTICK_CLKSOURCE_LSI,
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
pub const APB3CLKDividerConf = enum {
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
pub const SPI1CLockSelectionConf = enum {
    RCC_SPI1CLKSOURCE_PLL1Q,
    RCC_SPI1CLKSOURCE_PLL2P,
    RCC_SPI1CLKSOURCE_CLKP,
    RCC_SPI1CLKSOURCE_PIN,
};
pub const SPI3CLockSelectionConf = enum {
    RCC_SPI3CLKSOURCE_PLL1Q,
    RCC_SPI3CLKSOURCE_PLL2P,
    RCC_SPI3CLKSOURCE_CLKP,
    RCC_SPI3CLKSOURCE_PIN,
};
pub const SPI2CLockSelectionConf = enum {
    RCC_SPI2CLKSOURCE_PLL1Q,
    RCC_SPI2CLKSOURCE_PLL2P,
    RCC_SPI2CLKSOURCE_CLKP,
    RCC_SPI2CLKSOURCE_PIN,
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 512;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLLFRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8191;
    }

    pub fn min() f32 {
        return 0;
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
            .@"2" => 2,
            .@"4" => 4,
            .@"6" => 6,
            .@"8" => 8,
            .@"10" => 10,
            .@"12" => 12,
            .@"14" => 14,
            .@"16" => 16,
            .@"18" => 18,
            .@"20" => 20,
            .@"22" => 22,
            .@"24" => 24,
            .@"26" => 26,
            .@"28" => 28,
            .@"30" => 30,
            .@"32" => 32,
            .@"34" => 34,
            .@"36" => 36,
            .@"38" => 38,
            .@"40" => 40,
            .@"42" => 42,
            .@"44" => 44,
            .@"46" => 46,
            .@"48" => 48,
            .@"50" => 50,
            .@"52" => 52,
            .@"54" => 54,
            .@"56" => 56,
            .@"58" => 58,
            .@"60" => 60,
            .@"62" => 62,
            .@"64" => 64,
            .@"66" => 66,
            .@"68" => 68,
            .@"70" => 70,
            .@"72" => 72,
            .@"74" => 74,
            .@"76" => 76,
            .@"78" => 78,
            .@"80" => 80,
            .@"82" => 82,
            .@"84" => 84,
            .@"86" => 86,
            .@"88" => 88,
            .@"90" => 90,
            .@"92" => 92,
            .@"94" => 94,
            .@"96" => 96,
            .@"98" => 98,
            .@"100" => 100,
            .@"102" => 102,
            .@"104" => 104,
            .@"106" => 106,
            .@"108" => 108,
            .@"110" => 110,
            .@"112" => 112,
            .@"114" => 114,
            .@"116" => 116,
            .@"118" => 118,
            .@"120" => 120,
            .@"122" => 122,
            .@"124" => 124,
            .@"126" => 126,
            .@"128" => 128,
        };
    }
};
pub const PLL1QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL1RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL2NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 512;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLL2FRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8191;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const PLL2PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL2QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL2RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
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
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 127;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const CSICalibrationValueConf = enum(u32) {
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
pub const LSE_Drive_CapabilityConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    HSIDiv: HSIDivConf = .RCC_HSI_DIV2,
    HSEOSC: HSE_VALUEConf = @enumFromInt(25000000),
    LSIRC: LSI_VALUEConf = @enumFromInt(32000),
    LSEOSC: LSE_VALUEConf = @enumFromInt(32768),
    SysClkSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_HSI,
    PLLSource: PLLSourceVirtualConf = .RCC_PLL1_SOURCE_CSI,
    PLL2Source: PLL2SourceConf = .RCC_PLL2_SOURCE_CSI,
    PLLM: PLLMConf = @enumFromInt(1),
    PLL2M: PLL2MConf = @enumFromInt(1),
    HSERTCDevisor: RCC_RTC_Clock_Source_FROM_HSEConf = .RCC_RTC_HSE_NOCLOCK,
    RTCClkSource: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1Mult: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    USART2Mult: USART2CLockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3Mult: USART3CLockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    LPUART1Mult: LPUART1CLockSelectionConf = .RCC_LPUART1CLKSOURCE_PCLK3,
    LPTIM1Mult: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK3,
    LPTIM2Mult: LPTIM2CLockSelectionConf = .RCC_LPTIM2CLKSOURCE_PCLK1,
    DACMult: DACLowPowerCLockSelectionConf = .RCC_DACLPCLKSOURCE_LSE,
    ADCMult: ADCCLockSelectionConf = .RCC_ADCDACCLKSOURCE_HCLK,
    CK48Mult: USBCLockSelectionConf = .RCC_USBCLKSOURCE_HSI48,
    FDCANMult: FDCANClockSelectionConf = .RCC_FDCANCLKSOURCE_HSE,
    I2C1Mult: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    I2C2Mult: I2C2CLockSelectionConf = .RCC_I2C2CLKSOURCE_PCLK1,
    I3C2Mult: I3C2CLockSelectionConf = .RCC_I3C2CLKSOURCE_PCLK3,
    I3C1Mult: I3C1CLockSelectionConf = .RCC_I3C1CLKSOURCE_PCLK1,
    RNGMult: RNGCLockSelectionConf = .RCC_RNGCLKSOURCE_HSI48,
    MCOMult: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_HSI,
    MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    LSCOMult: LSCOSource1Conf = .RCC_LSCOSOURCE_LSI,
    CKPERMult: CKPERSourceSelectionConf = .RCC_CLKPSOURCE_HSI,
    AHBPrescaler: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    CortexPrescaler: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    CortexCLockSelection: CortexCLockSelectionConf = .SYSTICK_CLKSOURCE_HCLK_1_8,
    APB1Prescaler: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2Prescaler: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    APB3Prescaler: APB3CLKDividerConf = .RCC_HCLK_DIV1,
    SPI1Mult: SPI1CLockSelectionConf = .RCC_SPI1CLKSOURCE_PLL1Q,
    SPI3Mult: SPI3CLockSelectionConf = .RCC_SPI3CLKSOURCE_PLL1Q,
    SPI2Mult: SPI2CLockSelectionConf = .RCC_SPI2CLKSOURCE_PLL1Q,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = .@"2",
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = @enumFromInt(2),
    PLL2N: PLL2NConf = @enumFromInt(129),
    PLL2FRACN: PLL2FRACNConf = @enumFromInt(0),
    PLL2P: PLL2PConf = @enumFromInt(2),
    PLL2Q: PLL2QConf = @enumFromInt(2),
    PLL2R: PLL2RConf = @enumFromInt(2),
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionConf = .RCC_TIMPRES_DESACTIVATED,
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(64),
    CSICalibrationValue: CSICalibrationValueConf = @enumFromInt(16),
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ConfigWithRef = struct {
    HSIDiv: HSIDivConf = .RCC_HSI_DIV2,
    HSE_VALUE: HSE_VALUEConf = @enumFromInt(25000000),
    LSI_VALUE: LSI_VALUEConf = @enumFromInt(32000),
    LSE_VALUE: LSE_VALUEConf = @enumFromInt(32768),
    SYSCLKSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_HSI,
    PLLSourceVirtual: PLLSourceVirtualConf = .RCC_PLL1_SOURCE_CSI,
    PLL2Source: PLL2SourceConf = .RCC_PLL2_SOURCE_CSI,
    PLLM: PLLMConf = @enumFromInt(1),
    PLL2M: PLL2MConf = @enumFromInt(1),
    RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEConf = .RCC_RTC_HSE_NOCLOCK,
    RTCClockSelection: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1CLockSelection: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    USART2CLockSelection: USART2CLockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3CLockSelection: USART3CLockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    LPUART1CLockSelection: LPUART1CLockSelectionConf = .RCC_LPUART1CLKSOURCE_PCLK3,
    LPTIM1CLockSelection: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK3,
    LPTIM2CLockSelection: LPTIM2CLockSelectionConf = .RCC_LPTIM2CLKSOURCE_PCLK1,
    DACLowPowerCLockSelection: DACLowPowerCLockSelectionConf = .RCC_DACLPCLKSOURCE_LSE,
    ADCCLockSelection: ADCCLockSelectionConf = .RCC_ADCDACCLKSOURCE_HCLK,
    USBCLockSelection: USBCLockSelectionConf = .RCC_USBCLKSOURCE_HSI48,
    FDCANClockSelection: FDCANClockSelectionConf = .RCC_FDCANCLKSOURCE_HSE,
    I2C1CLockSelection: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    I2C2CLockSelection: I2C2CLockSelectionConf = .RCC_I2C2CLKSOURCE_PCLK1,
    I3C2CLockSelection: I3C2CLockSelectionConf = .RCC_I3C2CLKSOURCE_PCLK3,
    I3C1CLockSelection: I3C1CLockSelectionConf = .RCC_I3C1CLKSOURCE_PCLK1,
    RNGCLockSelection: RNGCLockSelectionConf = .RCC_RNGCLKSOURCE_HSI48,
    RCC_MCO1Source: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_HSI,
    RCC_MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    LSCOSource1: LSCOSource1Conf = .RCC_LSCOSOURCE_LSI,
    CKPERSourceSelection: CKPERSourceSelectionConf = .RCC_CLKPSOURCE_HSI,
    AHBCLKDivider: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    Cortex_Div: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    CortexCLockSelection: CortexCLockSelectionConf = .SYSTICK_CLKSOURCE_HCLK_1_8,
    APB1CLKDivider: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2CLKDivider: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    APB3CLKDivider: APB3CLKDividerConf = .RCC_HCLK_DIV1,
    SPI1CLockSelection: SPI1CLockSelectionConf = .RCC_SPI1CLKSOURCE_PLL1Q,
    SPI3CLockSelection: SPI3CLockSelectionConf = .RCC_SPI3CLKSOURCE_PLL1Q,
    SPI2CLockSelection: SPI2CLockSelectionConf = .RCC_SPI2CLKSOURCE_PLL1Q,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = .@"2",
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = @enumFromInt(2),
    PLL2N: PLL2NConf = @enumFromInt(129),
    PLL2FRACN: PLL2FRACNConf = @enumFromInt(0),
    PLL2P: PLL2PConf = @enumFromInt(2),
    PLL2Q: PLL2QConf = @enumFromInt(2),
    PLL2R: PLL2RConf = @enumFromInt(2),
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionConf = .RCC_TIMPRES_DESACTIVATED,
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(64),
    CSICalibrationValue: CSICalibrationValueConf = @enumFromInt(16),
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSIDiv = self.HSIDiv,
            .HSEOSC = self.HSE_VALUE,
            .LSIRC = self.LSI_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLL2Source = self.PLL2Source,
            .PLLM = self.PLLM,
            .PLL2M = self.PLL2M,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .USART2Mult = self.USART2CLockSelection,
            .USART3Mult = self.USART3CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .DACMult = self.DACLowPowerCLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .CK48Mult = self.USBCLockSelection,
            .FDCANMult = self.FDCANClockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I3C2Mult = self.I3C2CLockSelection,
            .I3C1Mult = self.I3C1CLockSelection,
            .RNGMult = self.RNGCLockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
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
    PLLM: ClockNode,
    PLL2M: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
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
    DACMult: ClockNode,
    DACoutput: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CK48Mult: ClockNode,
    USBoutput: ClockNode,
    FDCANMult: ClockNode,
    FDCANOutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I3C2Mult: ClockNode,
    I3C2output: ClockNode,
    I3C1Mult: ClockNode,
    I3C1output: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
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
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
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
        const HSIDivval = ClockNodeTypes{ .div = .{ .value = config.HSIDiv.get() } };
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
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 50000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 32600, .min = 31400 },
            },
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
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
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
                .value = config.PLLM.get(),
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
                .value = config.PLLFRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .Nodetype = PLLFRACNval,
        };
        const PLLNval = ClockNodeTypes{
            .mulfrac = .{
                .value = config.PLLN.get(),
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{ &PLLM, &PLLFRACN },
        };
        const PLL1Pval = ClockNodeTypes{ .div = .{ .value = config.PLL1P.get() } };
        const PLL1P: ClockNode = .{
            .name = "PLL1P",
            .Nodetype = PLL1Pval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
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
        const PLL2Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL2Source) };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",
            .Nodetype = PLL2Sourceval,

            .parents = &[_]*const ClockNode{
                &CSIRC,
                &HSIDiv,
                &HSEOSC,
            },
        };
        const PLL2Mval = ClockNodeTypes{
            .div = .{
                .value = config.PLL2M.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const PLL2M: ClockNode = .{
            .name = "PLL2M",
            .Nodetype = PLL2Mval,
            .parents = &[_]*const ClockNode{&PLL2Source},
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
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
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
        const APB2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB2Prescaler.get() } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const PLL2FRACNval = ClockNodeTypes{
            .source = .{
                .value = config.PLL2FRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLL2FRACN: ClockNode = .{
            .name = "PLL2FRACN",
            .Nodetype = PLL2FRACNval,
        };
        const PLL2Nval = ClockNodeTypes{
            .mulfrac = .{
                .value = config.PLL2N.get(),
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
                .value = config.PLL2Q.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL2Q: ClockNode = .{
            .name = "PLL2Q",
            .Nodetype = PLL2Qval,
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const USART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART1Mult) };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
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
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
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
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
            },
        };
        const USART3outputval = ClockNodeTypes{ .output = null };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = USART3outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const APB3Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB3Prescaler.get() } };
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
        const LPUART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPUART1Mult) };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",
            .Nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
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
                .value = config.PLL2P.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL2P: ClockNode = .{
            .name = "PLL2P",
            .Nodetype = PLL2Pval,
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const CKPERMultval = ClockNodeTypes{ .multi = @intFromEnum(config.CKPERMult) };
        const CKPERMult: ClockNode = .{
            .name = "CKPERMult",
            .Nodetype = CKPERMultval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
                &CSIRC,
            },
        };
        const LPTIM1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM1Mult) };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
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
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
            },
        };
        const LPTIM2outputval = ClockNodeTypes{ .output = null };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const DACMultval = ClockNodeTypes{ .multi = @intFromEnum(config.DACMult) };
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
                .value = config.PLL2R.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL2R: ClockNode = .{
            .name = "PLL2R",
            .Nodetype = PLL2Rval,
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const ADCMultval = ClockNodeTypes{ .multi = @intFromEnum(config.ADCMult) };
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
                .value = config.PLL1Q.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL1Q: ClockNode = .{
            .name = "PLL1Q",
            .Nodetype = PLL1Qval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const CK48Multval = ClockNodeTypes{ .multi = @intFromEnum(config.CK48Mult) };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",
            .Nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &PLL2Q,
                &PLL1Q,
                &HSI48RC,
            },
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = 50000000, .min = 0 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const FDCANMultval = ClockNodeTypes{ .multi = @intFromEnum(config.FDCANMult) };
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
        const I2C1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C1Mult) };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2R,
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
        const I2C2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C2Mult) };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .Nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2R,
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
        const I3C2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I3C2Mult) };
        const I3C2Mult: ClockNode = .{
            .name = "I3C2Mult",
            .Nodetype = I3C2Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2R,
                &HSIDiv,
            },
        };
        const I3C2outputval = ClockNodeTypes{ .output = null };
        const I3C2output: ClockNode = .{
            .name = "I3C2output",
            .Nodetype = I3C2outputval,
            .parents = &[_]*const ClockNode{&I3C2Mult},
        };
        const I3C1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I3C1Mult) };
        const I3C1Mult: ClockNode = .{
            .name = "I3C1Mult",
            .Nodetype = I3C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2R,
                &HSIDiv,
            },
        };
        const I3C1outputval = ClockNodeTypes{ .output = null };
        const I3C1output: ClockNode = .{
            .name = "I3C1output",
            .Nodetype = I3C1outputval,
            .parents = &[_]*const ClockNode{&I3C1Mult},
        };
        const RNGMultval = ClockNodeTypes{ .multi = @intFromEnum(config.RNGMult) };
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
        const MCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.MCOMult) };
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
        const CortexPrescalerval = ClockNodeTypes{ .div = .{ .value = config.CortexPrescaler.get() } };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexCLockSelectionval = ClockNodeTypes{ .multi = @intFromEnum(config.CortexCLockSelection) };
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
        const SPI1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI1Mult) };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",
            .Nodetype = SPI1Multval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &CKPERMult,
                &AUDIOCLK,
            },
        };
        const SPI1outputval = ClockNodeTypes{ .output = null };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = SPI1outputval,
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI3Mult) };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",
            .Nodetype = SPI3Multval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &CKPERMult,
                &AUDIOCLK,
            },
        };
        const SPI3outputval = ClockNodeTypes{ .output = null };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = SPI3outputval,
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const SPI2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI2Mult) };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",
            .Nodetype = SPI2Multval,

            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &CKPERMult,
                &AUDIOCLK,
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
                .value = config.PLL1R.get(),
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
                .limit = .{ .max = 127, .min = 0 },
            },
        };
        const CSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.CSICalibrationValue.get(),
                .limit = .{ .max = 31, .min = 0 },
            },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
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
            .PLLM = PLLM,
            .PLL2M = PLL2M,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
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
            .DACMult = DACMult,
            .DACoutput = DACoutput,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CK48Mult = CK48Mult,
            .USBoutput = USBoutput,
            .FDCANMult = FDCANMult,
            .FDCANOutput = FDCANOutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I3C2Mult = I3C2Mult,
            .I3C2output = I3C2output,
            .I3C1Mult = I3C1Mult,
            .I3C1output = I3C1output,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
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
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
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
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.DACoutput.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.FDCANOutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I3C2output.get_comptime();
        _ = self.I3C1output.get_comptime();
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
        _ = self.SPI2output.get_comptime();
    }
};
