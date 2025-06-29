const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSIDivConf = enum {
    RCC_PLLSAIDIVR_1,
    RCC_PLLSAIDIVR_2,
    RCC_PLLSAIDIVR_4,
    RCC_PLLSAIDIVR_8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLSAIDIVR_8 => 8,
            .RCC_PLLSAIDIVR_4 => 4,
            .RCC_PLLSAIDIVR_1 => 1,
            .RCC_PLLSAIDIVR_2 => 2,
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
pub const traceClkSourceVirtualConf = enum {
    RCC_TRACECLKSOURCE_HSI,
    RCC_TRACECLKSOURCE_CSI,
    RCC_TRACECLKSOURCE_HSE,
    RCC_TRACECLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
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
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_HSI48,
    RCC_MCO1SOURCE_PLL1QCLK,

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
    RCC_MCO2SOURCE_SYSCLK,
    RCC_MCO2SOURCE_PLL2PCLK,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_PLLCLK,
    RCC_MCO2SOURCE_CSICLK,
    RCC_MCO2SOURCE_LSICLK,

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
pub const DSICLockSelectionConf = enum {
    RCC_DSICLKSOURCE_PLL2,
    RCC_DSICLKSOURCE_PHY,

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
pub const D1CPREConf = enum {
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
pub const HPREConf = enum {
    RCC_HCLK_DIV1,
    RCC_HCLK_DIV2,
    RCC_HCLK_DIV4,
    RCC_HCLK_DIV8,
    RCC_HCLK_DIV16,
    RCC_HCLK_DIV64,
    RCC_HCLK_DIV128,
    RCC_HCLK_DIV256,
    RCC_HCLK_DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HCLK_DIV128 => 128,
            .RCC_HCLK_DIV512 => 512,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV64 => 64,
            .RCC_HCLK_DIV16 => 16,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV256 => 256,
            .RCC_HCLK_DIV1 => 1,
        };
    }
};
pub const D1PPREConf = enum {
    RCC_APB3_DIV1,
    RCC_APB3_DIV2,
    RCC_APB3_DIV4,
    RCC_APB3_DIV8,
    RCC_APB3_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB3_DIV4 => 4,
            .RCC_APB3_DIV8 => 8,
            .RCC_APB3_DIV16 => 16,
            .RCC_APB3_DIV2 => 2,
            .RCC_APB3_DIV1 => 1,
        };
    }
};
pub const D2PPRE1Conf = enum {
    RCC_APB1_DIV1,
    RCC_APB1_DIV2,
    RCC_APB1_DIV4,
    RCC_APB1_DIV8,
    RCC_APB1_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB1_DIV4 => 4,
            .RCC_APB1_DIV8 => 8,
            .RCC_APB1_DIV16 => 16,
            .RCC_APB1_DIV1 => 1,
            .RCC_APB1_DIV2 => 2,
        };
    }
};
pub const D2PPRE2Conf = enum {
    RCC_APB2_DIV1,
    RCC_APB2_DIV2,
    RCC_APB2_DIV4,
    RCC_APB2_DIV8,
    RCC_APB2_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB2_DIV1 => 1,
            .RCC_APB2_DIV2 => 2,
            .RCC_APB2_DIV8 => 8,
            .RCC_APB2_DIV4 => 4,
            .RCC_APB2_DIV16 => 16,
        };
    }
};
pub const D3PPREConf = enum {
    RCC_APB4_DIV1,
    RCC_APB4_DIV2,
    RCC_APB4_DIV4,
    RCC_APB4_DIV8,
    RCC_APB4_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB4_DIV16 => 16,
            .RCC_APB4_DIV2 => 2,
            .RCC_APB4_DIV1 => 1,
            .RCC_APB4_DIV8 => 8,
            .RCC_APB4_DIV4 => 4,
        };
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_CSI,
    RCC_PLLSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CKPERSourceSelectionConf = enum {
    RCC_CLKPSOURCE_HSI,
    RCC_CLKPSOURCE_CSI,
    RCC_CLKPSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DIVM1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVM2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVM3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVN1Conf = enum(u32) {
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
pub const DIVP1Conf = enum {
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
pub const DIVQ1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVR1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVN2Conf = enum(u32) {
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
pub const DIVP2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVQ2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVR2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVN3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVP3Conf = enum(u32) {
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
pub const DIVQ3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVR3Conf = enum(u32) {
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
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_HSE_DIV33,
    RCC_RTCCLKSOURCE_HSE_DIV34,
    RCC_RTCCLKSOURCE_HSE_DIV35,
    RCC_RTCCLKSOURCE_HSE_DIV36,
    RCC_RTCCLKSOURCE_HSE_DIV37,
    RCC_RTCCLKSOURCE_HSE_DIV38,
    RCC_RTCCLKSOURCE_HSE_DIV39,
    RCC_RTCCLKSOURCE_HSE_DIV40,
    RCC_RTCCLKSOURCE_HSE_DIV41,
    RCC_RTCCLKSOURCE_HSE_DIV42,
    RCC_RTCCLKSOURCE_HSE_DIV43,
    RCC_RTCCLKSOURCE_HSE_DIV44,
    RCC_RTCCLKSOURCE_HSE_DIV45,
    RCC_RTCCLKSOURCE_HSE_DIV46,
    RCC_RTCCLKSOURCE_HSE_DIV47,
    RCC_RTCCLKSOURCE_HSE_DIV48,
    RCC_RTCCLKSOURCE_HSE_DIV49,
    RCC_RTCCLKSOURCE_HSE_DIV50,
    RCC_RTCCLKSOURCE_HSE_DIV51,
    RCC_RTCCLKSOURCE_HSE_DIV52,
    RCC_RTCCLKSOURCE_HSE_DIV53,
    RCC_RTCCLKSOURCE_HSE_DIV54,
    RCC_RTCCLKSOURCE_HSE_DIV55,
    RCC_RTCCLKSOURCE_HSE_DIV56,
    RCC_RTCCLKSOURCE_HSE_DIV57,
    RCC_RTCCLKSOURCE_HSE_DIV58,
    RCC_RTCCLKSOURCE_HSE_DIV59,
    RCC_RTCCLKSOURCE_HSE_DIV60,
    RCC_RTCCLKSOURCE_HSE_DIV61,
    RCC_RTCCLKSOURCE_HSE_DIV62,
    RCC_RTCCLKSOURCE_HSE_DIV63,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_RTCCLKSOURCE_HSE_DIV29 => 29,
            .RCC_RTCCLKSOURCE_HSE_DIV28 => 28,
            .RCC_RTCCLKSOURCE_HSE_DIV40 => 40,
            .RCC_RTCCLKSOURCE_HSE_DIV61 => 61,
            .RCC_RTCCLKSOURCE_HSE_DIV7 => 7,
            .RCC_RTCCLKSOURCE_HSE_DIV34 => 34,
            .RCC_RTCCLKSOURCE_HSE_DIV16 => 16,
            .RCC_RTCCLKSOURCE_HSE_DIV3 => 3,
            .RCC_RTCCLKSOURCE_HSE_DIV46 => 46,
            .RCC_RTCCLKSOURCE_HSE_DIV12 => 12,
            .RCC_RTCCLKSOURCE_HSE_DIV54 => 54,
            .RCC_RTCCLKSOURCE_HSE_DIV35 => 35,
            .RCC_RTCCLKSOURCE_HSE_DIV2 => 2,
            .RCC_RTCCLKSOURCE_HSE_DIV15 => 15,
            .RCC_RTCCLKSOURCE_HSE_DIV31 => 31,
            .RCC_RTCCLKSOURCE_HSE_DIV33 => 33,
            .RCC_RTCCLKSOURCE_HSE_DIV52 => 52,
            .RCC_RTCCLKSOURCE_HSE_DIV17 => 17,
            .RCC_RTCCLKSOURCE_HSE_DIV53 => 53,
            .RCC_RTCCLKSOURCE_HSE_DIV42 => 42,
            .RCC_RTCCLKSOURCE_HSE_DIV27 => 27,
            .RCC_RTCCLKSOURCE_HSE_DIV62 => 62,
            .RCC_RTCCLKSOURCE_HSE_DIV14 => 14,
            .RCC_RTCCLKSOURCE_HSE_DIV37 => 37,
            .RCC_RTCCLKSOURCE_HSE_DIV4 => 4,
            .RCC_RTCCLKSOURCE_HSE_DIV39 => 39,
            .RCC_RTCCLKSOURCE_HSE_DIV25 => 25,
            .RCC_RTCCLKSOURCE_HSE_DIV8 => 8,
            .RCC_RTCCLKSOURCE_HSE_DIV45 => 45,
            .RCC_RTCCLKSOURCE_HSE_DIV6 => 6,
            .RCC_RTCCLKSOURCE_HSE_DIV38 => 38,
            .RCC_RTCCLKSOURCE_HSE_DIV36 => 36,
            .RCC_RTCCLKSOURCE_HSE_DIV26 => 26,
            .RCC_RTCCLKSOURCE_HSE_DIV5 => 5,
            .RCC_RTCCLKSOURCE_HSE_DIV49 => 49,
            .RCC_RTCCLKSOURCE_HSE_DIV9 => 9,
            .RCC_RTCCLKSOURCE_HSE_DIV19 => 19,
            .RCC_RTCCLKSOURCE_HSE_DIV18 => 18,
            .RCC_RTCCLKSOURCE_HSE_DIV32 => 32,
            .RCC_RTCCLKSOURCE_HSE_DIV47 => 47,
            .RCC_RTCCLKSOURCE_HSE_DIV55 => 55,
            .RCC_RTCCLKSOURCE_HSE_DIV30 => 30,
            .RCC_RTCCLKSOURCE_HSE_DIV41 => 41,
            .RCC_RTCCLKSOURCE_HSE_DIV24 => 24,
            .RCC_RTCCLKSOURCE_HSE_DIV23 => 23,
            .RCC_RTCCLKSOURCE_HSE_DIV58 => 58,
            .RCC_RTCCLKSOURCE_HSE_DIV10 => 10,
            .RCC_RTCCLKSOURCE_HSE_DIV51 => 51,
            .RCC_RTCCLKSOURCE_HSE_DIV48 => 48,
            .RCC_RTCCLKSOURCE_HSE_DIV60 => 60,
            .RCC_RTCCLKSOURCE_HSE_DIV50 => 50,
            .RCC_RTCCLKSOURCE_HSE_DIV21 => 21,
            .RCC_RTCCLKSOURCE_HSE_DIV22 => 22,
            .RCC_RTCCLKSOURCE_HSE_DIV13 => 13,
            .RCC_RTCCLKSOURCE_HSE_DIV11 => 11,
            .RCC_RTCCLKSOURCE_HSE_DIV44 => 44,
            .RCC_RTCCLKSOURCE_HSE_DIV56 => 56,
            .RCC_RTCCLKSOURCE_HSE_DIV20 => 20,
            .RCC_RTCCLKSOURCE_HSE_DIV63 => 63,
            .RCC_RTCCLKSOURCE_HSE_DIV57 => 57,
            .RCC_RTCCLKSOURCE_HSE_DIV43 => 43,
            .RCC_RTCCLKSOURCE_HSE_DIV59 => 59,
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
pub const SPI123CLockSelectionConf = enum {
    RCC_SPI123CLKSOURCE_PLL,
    RCC_SPI123CLKSOURCE_PLL2,
    RCC_SPI123CLKSOURCE_PLL3,
    RCC_SPI123CLKSOURCE_PIN,
    RCC_SPI123CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI23CLockSelectionConf = enum {
    RCC_SAI23CLKSOURCE_PLL,
    RCC_SAI23CLKSOURCE_PLL2,
    RCC_SAI23CLKSOURCE_PLL3,
    RCC_SAI23CLKSOURCE_PIN,
    RCC_SAI23CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PLL,
    RCC_SAI1CLKSOURCE_PLL2,
    RCC_SAI1CLKSOURCE_PLL3,
    RCC_SAI1CLKSOURCE_PIN,
    RCC_SAI1CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI4BCLockSelectionConf = enum {
    RCC_SAI4BCLKSOURCE_PLL,
    RCC_SAI4BCLKSOURCE_PLL2,
    RCC_SAI4BCLKSOURCE_PLL3,
    RCC_SAI4BCLKSOURCE_PIN,
    RCC_SAI4BCLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI4ACLockSelectionConf = enum {
    RCC_SAI4ACLKSOURCE_PLL,
    RCC_SAI4ACLKSOURCE_PLL2,
    RCC_SAI4ACLKSOURCE_PLL3,
    RCC_SAI4ACLKSOURCE_PIN,
    RCC_SAI4ACLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RNGCLockSelectionConf = enum {
    RCC_RNGCLKSOURCE_HSI48,
    RCC_RNGCLKSOURCE_PLL,
    RCC_RNGCLKSOURCE_LSE,
    RCC_RNGCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C123CLockSelectionConf = enum {
    RCC_I2C123CLKSOURCE_D2PCLK1,
    RCC_I2C123CLKSOURCE_PLL3,
    RCC_I2C123CLKSOURCE_HSI,
    RCC_I2C123CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C4CLockSelectionConf = enum {
    RCC_I2C4CLKSOURCE_D3PCLK1,
    RCC_I2C4CLKSOURCE_PLL3,
    RCC_I2C4CLKSOURCE_HSI,
    RCC_I2C4CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPDIFCLockSelectionConf = enum {
    RCC_SPDIFRXCLKSOURCE_PLL,
    RCC_SPDIFRXCLKSOURCE_PLL2,
    RCC_SPDIFRXCLKSOURCE_PLL3,
    RCC_SPDIFRXCLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const QSPICLockSelectionConf = enum {
    RCC_QSPICLKSOURCE_D1HCLK,
    RCC_QSPICLKSOURCE_PLL,
    RCC_QSPICLKSOURCE_PLL2,
    RCC_QSPICLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FMCCLockSelectionConf = enum {
    RCC_FMCCLKSOURCE_D1HCLK,
    RCC_FMCCLKSOURCE_PLL,
    RCC_FMCCLKSOURCE_PLL2,
    RCC_FMCCLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SWPCLockSelectionConf = enum {
    RCC_SWPMI1CLKSOURCE_D2PCLK1,
    RCC_SWPMI1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SDMMC1CLockSelectionConf = enum {
    RCC_SDMMCCLKSOURCE_PLL,
    RCC_SDMMCCLKSOURCE_PLL2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DFSDMCLockSelectionConf = enum {
    RCC_DFSDM1CLKSOURCE_D2PCLK1,
    RCC_DFSDM1CLKSOURCE_SYS,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART16CLockSelectionConf = enum {
    RCC_USART16CLKSOURCE_D2PCLK2,
    RCC_USART16CLKSOURCE_PLL2,
    RCC_USART16CLKSOURCE_PLL3,
    RCC_USART16CLKSOURCE_HSI,
    RCC_USART16CLKSOURCE_CSI,
    RCC_USART16CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART234578CLockSelectionConf = enum {
    RCC_USART234578CLKSOURCE_D2PCLK1,
    RCC_USART234578CLKSOURCE_PLL2,
    RCC_USART234578CLKSOURCE_PLL3,
    RCC_USART234578CLKSOURCE_HSI,
    RCC_USART234578CLKSOURCE_CSI,
    RCC_USART234578CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_D3PCLK1,
    RCC_LPUART1CLKSOURCE_PLL2,
    RCC_LPUART1CLKSOURCE_PLL3,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_CSI,
    RCC_LPUART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_D2PCLK1,
    RCC_LPTIM1CLKSOURCE_PLL2,
    RCC_LPTIM1CLKSOURCE_PLL3,
    RCC_LPTIM1CLKSOURCE_LSE,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM345CLockSelectionConf = enum {
    RCC_LPTIM345CLKSOURCE_D3PCLK1,
    RCC_LPTIM345CLKSOURCE_PLL2,
    RCC_LPTIM345CLKSOURCE_PLL3,
    RCC_LPTIM345CLKSOURCE_LSE,
    RCC_LPTIM345CLKSOURCE_LSI,
    RCC_LPTIM345CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_D3PCLK1,
    RCC_LPTIM2CLKSOURCE_PLL2,
    RCC_LPTIM2CLKSOURCE_PLL3,
    RCC_LPTIM2CLKSOURCE_LSE,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI6CLockSelectionConf = enum {
    RCC_SPI6CLKSOURCE_D3PCLK1,
    RCC_SPI6CLKSOURCE_PLL2,
    RCC_SPI6CLKSOURCE_PLL3,
    RCC_SPI6CLKSOURCE_HSI,
    RCC_SPI6CLKSOURCE_CSI,
    RCC_SPI6CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Spi45ClockSelectionConf = enum {
    RCC_SPI45CLKSOURCE_D2PCLK1,
    RCC_SPI45CLKSOURCE_PLL2,
    RCC_SPI45CLKSOURCE_PLL3,
    RCC_SPI45CLKSOURCE_HSI,
    RCC_SPI45CLKSOURCE_CSI,
    RCC_SPI45CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USBCLockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_PLL3,
    RCC_USBCLKSOURCE_HSI48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FDCANCLockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_HSE,
    RCC_FDCANCLKSOURCE_PLL,
    RCC_FDCANCLKSOURCE_PLL2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_PLL2,
    RCC_ADCCLKSOURCE_PLL3,
    RCC_ADCCLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CECCLockSelectionConf = enum {
    RCC_CECCLKSOURCE_LSE,
    RCC_CECCLKSOURCE_LSI,
    RCC_CECCLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const HRTIMCLockSelectionConf = enum {
    RCC_HRTIM1CLK_TIMCLK,
    RCC_HRTIM1CLK_CPUCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
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
    traceClkSource: ?traceClkSourceVirtualConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    MCO1Mult: ?RCC_MCO1SourceConf = null,
    MCO1Div: ?RCC_MCODiv1Conf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCODiv2Conf = null,
    DSIMult: ?DSICLockSelectionConf = null,
    DSITXPrescaler: ?DSITX_DivConf = null,
    PLLDSIIDF: ?PLLDSIIDFConf = null,
    PLLDSINDIV: ?PLLDSINDIVConf = null,
    PLLDSIODF: ?PLLDSIODFConf = null,
    D1CPRE: ?D1CPREConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    HPRE: ?HPREConf = null,
    D1PPRE: ?D1PPREConf = null,
    D2PPRE1: ?D2PPRE1Conf = null,
    D2PPRE2: ?D2PPRE2Conf = null,
    D3PPRE: ?D3PPREConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    CKPERSource: ?CKPERSourceSelectionConf = null,
    DIVM1: ?DIVM1Conf = null,
    DIVM2: ?DIVM2Conf = null,
    DIVM3: ?DIVM3Conf = null,
    DIVN1: ?DIVN1Conf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    DIVP1: ?DIVP1Conf = null,
    DIVQ1: ?DIVQ1Conf = null,
    DIVR1: ?DIVR1Conf = null,
    DIVN2: ?DIVN2Conf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    DIVP2: ?DIVP2Conf = null,
    DIVQ2: ?DIVQ2Conf = null,
    DIVR2: ?DIVR2Conf = null,
    DIVN3: ?DIVN3Conf = null,
    DIVP3: ?DIVP3Conf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    DIVQ3: ?DIVQ3Conf = null,
    DIVR3: ?DIVR3Conf = null,
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    SPI123Mult: ?SPI123CLockSelectionConf = null,
    SAI23Mult: ?SAI23CLockSelectionConf = null,
    SAI1Mult: ?SAI1CLockSelectionConf = null,
    SAI4BMult: ?SAI4BCLockSelectionConf = null,
    SAI4AMult: ?SAI4ACLockSelectionConf = null,
    RNGMult: ?RNGCLockSelectionConf = null,
    I2C123Mult: ?I2C123CLockSelectionConf = null,
    I2C4Mult: ?I2C4CLockSelectionConf = null,
    SPDIFMult: ?SPDIFCLockSelectionConf = null,
    QSPIMult: ?QSPICLockSelectionConf = null,
    FMCMult: ?FMCCLockSelectionConf = null,
    SWPMult: ?SWPCLockSelectionConf = null,
    SDMMCMult: ?SDMMC1CLockSelectionConf = null,
    DFSDMMult: ?DFSDMCLockSelectionConf = null,
    USART16Mult: ?USART16CLockSelectionConf = null,
    USART234578Mult: ?USART234578CLockSelectionConf = null,
    LPUART1Mult: ?LPUART1CLockSelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionConf = null,
    LPTIM345Mult: ?LPTIM345CLockSelectionConf = null,
    LPTIM2Mult: ?LPTIM2CLockSelectionConf = null,
    SPI6Mult: ?SPI6CLockSelectionConf = null,
    SPI45Mult: ?Spi45ClockSelectionConf = null,
    USBMult: ?USBCLockSelectionConf = null,
    FDCANMult: ?FDCANCLockSelectionConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    CECMult: ?CECCLockSelectionConf = null,
    HrtimMult: ?HRTIMCLockSelectionConf = null,
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
    traceClkSourceVirtual: ?traceClkSourceVirtualConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv1: ?RCC_MCODiv1Conf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCODiv2: ?RCC_MCODiv2Conf = null,
    DSICLockSelection: ?DSICLockSelectionConf = null,
    DSITX_Div: ?DSITX_DivConf = null,
    PLLDSIIDF: ?PLLDSIIDFConf = null,
    PLLDSINDIV: ?PLLDSINDIVConf = null,
    PLLDSIODF: ?PLLDSIODFConf = null,
    D1CPRE: ?D1CPREConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    HPRE: ?HPREConf = null,
    D1PPRE: ?D1PPREConf = null,
    D2PPRE1: ?D2PPRE1Conf = null,
    D2PPRE2: ?D2PPRE2Conf = null,
    D3PPRE: ?D3PPREConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    CKPERSourceSelection: ?CKPERSourceSelectionConf = null,
    DIVM1: ?DIVM1Conf = null,
    DIVM2: ?DIVM2Conf = null,
    DIVM3: ?DIVM3Conf = null,
    DIVN1: ?DIVN1Conf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    DIVP1: ?DIVP1Conf = null,
    DIVQ1: ?DIVQ1Conf = null,
    DIVR1: ?DIVR1Conf = null,
    DIVN2: ?DIVN2Conf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    DIVP2: ?DIVP2Conf = null,
    DIVQ2: ?DIVQ2Conf = null,
    DIVR2: ?DIVR2Conf = null,
    DIVN3: ?DIVN3Conf = null,
    DIVP3: ?DIVP3Conf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    DIVQ3: ?DIVQ3Conf = null,
    DIVR3: ?DIVR3Conf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    SPI123CLockSelection: ?SPI123CLockSelectionConf = null,
    SAI23CLockSelection: ?SAI23CLockSelectionConf = null,
    SAI1CLockSelection: ?SAI1CLockSelectionConf = null,
    SAI4BCLockSelection: ?SAI4BCLockSelectionConf = null,
    SAI4ACLockSelection: ?SAI4ACLockSelectionConf = null,
    RNGCLockSelection: ?RNGCLockSelectionConf = null,
    I2C123CLockSelection: ?I2C123CLockSelectionConf = null,
    I2C4CLockSelection: ?I2C4CLockSelectionConf = null,
    SPDIFCLockSelection: ?SPDIFCLockSelectionConf = null,
    QSPICLockSelection: ?QSPICLockSelectionConf = null,
    FMCCLockSelection: ?FMCCLockSelectionConf = null,
    SWPCLockSelection: ?SWPCLockSelectionConf = null,
    SDMMC1CLockSelection: ?SDMMC1CLockSelectionConf = null,
    DFSDMCLockSelection: ?DFSDMCLockSelectionConf = null,
    USART16CLockSelection: ?USART16CLockSelectionConf = null,
    USART234578CLockSelection: ?USART234578CLockSelectionConf = null,
    LPUART1CLockSelection: ?LPUART1CLockSelectionConf = null,
    LPTIM1CLockSelection: ?LPTIM1CLockSelectionConf = null,
    LPTIM345CLockSelection: ?LPTIM345CLockSelectionConf = null,
    LPTIM2CLockSelection: ?LPTIM2CLockSelectionConf = null,
    SPI6CLockSelection: ?SPI6CLockSelectionConf = null,
    Spi45ClockSelection: ?Spi45ClockSelectionConf = null,
    USBCLockSelection: ?USBCLockSelectionConf = null,
    FDCANCLockSelection: ?FDCANCLockSelectionConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    CECCLockSelection: ?CECCLockSelectionConf = null,
    HRTIMCLockSelection: ?HRTIMCLockSelectionConf = null,
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
            .traceClkSource = self.traceClkSourceVirtual,
            .SysClkSource = self.SYSCLKSource,
            .MCO1Mult = self.RCC_MCO1Source,
            .MCO1Div = self.RCC_MCODiv1,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCODiv2,
            .DSIMult = self.DSICLockSelection,
            .DSITXPrescaler = self.DSITX_Div,
            .PLLDSIIDF = self.PLLDSIIDF,
            .PLLDSINDIV = self.PLLDSINDIV,
            .PLLDSIODF = self.PLLDSIODF,
            .D1CPRE = self.D1CPRE,
            .CortexPrescaler = self.Cortex_Div,
            .HPRE = self.HPRE,
            .D1PPRE = self.D1PPRE,
            .D2PPRE1 = self.D2PPRE1,
            .D2PPRE2 = self.D2PPRE2,
            .D3PPRE = self.D3PPRE,
            .PLLSource = self.PLLSourceVirtual,
            .CKPERSource = self.CKPERSourceSelection,
            .DIVM1 = self.DIVM1,
            .DIVM2 = self.DIVM2,
            .DIVM3 = self.DIVM3,
            .DIVN1 = self.DIVN1,
            .PLLFRACN = self.PLLFRACN,
            .DIVP1 = self.DIVP1,
            .DIVQ1 = self.DIVQ1,
            .DIVR1 = self.DIVR1,
            .DIVN2 = self.DIVN2,
            .PLL2FRACN = self.PLL2FRACN,
            .DIVP2 = self.DIVP2,
            .DIVQ2 = self.DIVQ2,
            .DIVR2 = self.DIVR2,
            .DIVN3 = self.DIVN3,
            .DIVP3 = self.DIVP3,
            .PLL3FRACN = self.PLL3FRACN,
            .DIVQ3 = self.DIVQ3,
            .DIVR3 = self.DIVR3,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCClockSelection,
            .SPI123Mult = self.SPI123CLockSelection,
            .SAI23Mult = self.SAI23CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .SAI4BMult = self.SAI4BCLockSelection,
            .SAI4AMult = self.SAI4ACLockSelection,
            .RNGMult = self.RNGCLockSelection,
            .I2C123Mult = self.I2C123CLockSelection,
            .I2C4Mult = self.I2C4CLockSelection,
            .SPDIFMult = self.SPDIFCLockSelection,
            .QSPIMult = self.QSPICLockSelection,
            .FMCMult = self.FMCCLockSelection,
            .SWPMult = self.SWPCLockSelection,
            .SDMMCMult = self.SDMMC1CLockSelection,
            .DFSDMMult = self.DFSDMCLockSelection,
            .USART16Mult = self.USART16CLockSelection,
            .USART234578Mult = self.USART234578CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM345Mult = self.LPTIM345CLockSelection,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .SPI6Mult = self.SPI6CLockSelection,
            .SPI45Mult = self.Spi45ClockSelection,
            .USBMult = self.USBCLockSelection,
            .FDCANMult = self.FDCANCLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .CECMult = self.CECCLockSelection,
            .HrtimMult = self.HRTIMCLockSelection,
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
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    CSIRC: ClockNode,
    RC48: ClockNode,
    I2S_CKIN: ClockNode,
    traceClkSource: ClockNode,
    TraceCLKOutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
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
    PLLDSIIDF: ClockNode,
    PLLDSIMultiplicator: ClockNode,
    PLLDSINDIV: ClockNode,
    VCOoutput: ClockNode,
    PLLDSIDevisor: ClockNode,
    PLLDSIODF: ClockNode,
    PLLDSIoutput: ClockNode,
    D1CPRE: ClockNode,
    D1CPREOutput: ClockNode,
    CpuClockOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    HPRE: ClockNode,
    AHBOutput: ClockNode,
    AXIClockOutput: ClockNode,
    HCLK3Output: ClockNode,
    D1PPRE: ClockNode,
    APB3Output: ClockNode,
    D2PPRE1: ClockNode,
    Tim1Mul: ClockNode,
    Tim1Output: ClockNode,
    AHB12Output: ClockNode,
    APB1Output: ClockNode,
    D2PPRE2: ClockNode,
    APB2Output: ClockNode,
    Tim2Mul: ClockNode,
    Tim2Output: ClockNode,
    AHB4Output: ClockNode,
    D3PPRE: ClockNode,
    APB4Output: ClockNode,
    PLLSource: ClockNode,
    CKPERSource: ClockNode,
    CKPERoutput: ClockNode,
    DIVM1: ClockNode,
    DIVM2: ClockNode,
    DIVM3: ClockNode,
    DIVN1: ClockNode,
    PLLFRACN: ClockNode,
    DIVP1: ClockNode,
    DIVQ1: ClockNode,
    DIVQ1output: ClockNode,
    DIVR1: ClockNode,
    DIVR1output: ClockNode,
    DIVN2: ClockNode,
    PLL2FRACN: ClockNode,
    DIVP2: ClockNode,
    DIVP2output: ClockNode,
    DIVQ2: ClockNode,
    DIVQ2output: ClockNode,
    DIVR2: ClockNode,
    DIVR2output: ClockNode,
    DIVN3: ClockNode,
    DIVP3: ClockNode,
    PLL3FRACN: ClockNode,
    DIVP3output: ClockNode,
    DIVQ3: ClockNode,
    DIVQ3output: ClockNode,
    DIVR3: ClockNode,
    LTDCOutput: ClockNode,
    DIVR3output: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    SPI123Mult: ClockNode,
    SPI123output: ClockNode,
    SAI23Mult: ClockNode,
    SAI23output: ClockNode,
    SAI1Mult: ClockNode,
    DFSDMACLKoutput: ClockNode,
    SAI1output: ClockNode,
    SAI4BMult: ClockNode,
    SAI4Boutput: ClockNode,
    SAI4AMult: ClockNode,
    SAI4Aoutput: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    I2C123Mult: ClockNode,
    I2C123output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    SPDIFMult: ClockNode,
    SPDIFoutput: ClockNode,
    QSPIMult: ClockNode,
    QSPIoutput: ClockNode,
    FMCMult: ClockNode,
    FMCoutput: ClockNode,
    SWPMult: ClockNode,
    SWPoutput: ClockNode,
    SDMMCMult: ClockNode,
    SDMMCoutput: ClockNode,
    DFSDMMult: ClockNode,
    DFSDMoutput: ClockNode,
    USART16Mult: ClockNode,
    USART16output: ClockNode,
    USART234578Mult: ClockNode,
    USART234578output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM345Mult: ClockNode,
    LPTIM345output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    SPI6Mult: ClockNode,
    SPI6output: ClockNode,
    SPI45Mult: ClockNode,
    SPI45output: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    FDCANMult: ClockNode,
    FDCANoutput: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CECMult: ClockNode,
    CECoutput: ClockNode,
    HrtimMult: ClockNode,
    HRTIMoutput: ClockNode,
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
                    break :inner 1;
                }
            },
        } };
        const HSIDiv: ClockNode = .{
            .name = "HSIDiv",
            .Nodetype = HSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
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
                .limit = .{ .max = 1000000, .min = 0 },
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
        const RC48val = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const RC48: ClockNode = .{
            .name = "RC48",
            .Nodetype = RC48val,
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
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const DIVM1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM1) |val| val.get() else 32,
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const DIVM1: ClockNode = .{
            .name = "DIVM1",
            .Nodetype = DIVM1val,
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
        const DIVN1val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN1) |val| val.get() else 129,
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const DIVN1: ClockNode = .{
            .name = "DIVN1",
            .Nodetype = DIVN1val,
            .parents = &[_]*const ClockNode{ &DIVM1, &PLLFRACN },
        };
        const DIVR1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR1) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVR1: ClockNode = .{
            .name = "DIVR1",
            .Nodetype = DIVR1val,
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const traceClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.traceClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const traceClkSource: ClockNode = .{
            .name = "traceClkSource",
            .Nodetype = traceClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &DIVR1,
            },
        };
        const TraceCLKOutputval = ClockNodeTypes{ .output = null };
        const TraceCLKOutput: ClockNode = .{
            .name = "TraceCLKOutput",
            .Nodetype = TraceCLKOutputval,
            .parents = &[_]*const ClockNode{&traceClkSource},
        };
        const DIVP1val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.DIVP1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const DIVP1: ClockNode = .{
            .name = "DIVP1",
            .Nodetype = DIVP1val,
            .parents = &[_]*const ClockNode{&DIVN1},
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
                &DIVP1,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 480000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const DIVQ1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ1) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVQ1: ClockNode = .{
            .name = "DIVQ1",
            .Nodetype = DIVQ1val,
            .parents = &[_]*const ClockNode{&DIVN1},
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
                &HSIDiv,
                &RC48,
                &DIVQ1,
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
        const MCO1Pinval = ClockNodeTypes{ .output = null };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = MCO1Pinval,
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const DIVM2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM2) |val| val.get() else 32,
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const DIVM2: ClockNode = .{
            .name = "DIVM2",
            .Nodetype = DIVM2val,
            .parents = &[_]*const ClockNode{&PLLSource},
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
        const DIVN2val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN2) |val| val.get() else 129,
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const DIVN2: ClockNode = .{
            .name = "DIVN2",
            .Nodetype = DIVN2val,
            .parents = &[_]*const ClockNode{ &DIVM2, &PLL2FRACN },
        };
        const DIVP2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVP2) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVP2: ClockNode = .{
            .name = "DIVP2",
            .Nodetype = DIVP2val,
            .parents = &[_]*const ClockNode{&DIVN2},
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
                &SysCLKOutput,
                &DIVP2,
                &HSEOSC,
                &DIVP1,
                &CSIRC,
                &LSIRC,
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
            .output = .{ .max = 2000000000, .min = 1000000000 },
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
        const DIVQ2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ2) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVQ2: ClockNode = .{
            .name = "DIVQ2",
            .Nodetype = DIVQ2val,
            .parents = &[_]*const ClockNode{&DIVN2},
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
                &DIVQ2,
                &DSIPHYPrescaler,
            },
        };
        const DSIoutputval = ClockNodeTypes{
            .output = .{ .max = 62000000, .min = 0 },
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
        const PLLDSIoutputval = ClockNodeTypes{
            .output = .{ .max = 1000000000, .min = 62500000 },
        };
        const PLLDSIoutput: ClockNode = .{
            .name = "PLLDSIoutput",
            .Nodetype = PLLDSIoutputval,
            .parents = &[_]*const ClockNode{&PLLDSIODF},
        };
        const D1CPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.D1CPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const D1CPRE: ClockNode = .{
            .name = "D1CPRE",
            .Nodetype = D1CPREval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const D1CPREOutputval = ClockNodeTypes{
            .output = .{ .max = 480000000, .min = 0 },
        };
        const D1CPREOutput: ClockNode = .{
            .name = "D1CPREOutput",
            .Nodetype = D1CPREOutputval,
            .parents = &[_]*const ClockNode{&D1CPRE},
        };
        const CpuClockOutputval = ClockNodeTypes{
            .output = .{ .max = 480000000, .min = 0 },
        };
        const CpuClockOutput: ClockNode = .{
            .name = "CpuClockOutput",
            .Nodetype = CpuClockOutputval,
            .parents = &[_]*const ClockNode{&D1CPRE},
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
            .parents = &[_]*const ClockNode{&D1CPRE},
        };
        const CortexSysOutputval = ClockNodeTypes{
            .output = .{ .max = 480000000, .min = 0 },
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const HPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HPRE: ClockNode = .{
            .name = "HPRE",
            .Nodetype = HPREval,
            .parents = &[_]*const ClockNode{&D1CPRE},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 240000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&HPRE},
        };
        const AXIClockOutputval = ClockNodeTypes{
            .output = .{ .max = 240000000, .min = 0 },
        };
        const AXIClockOutput: ClockNode = .{
            .name = "AXIClockOutput",
            .Nodetype = AXIClockOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const HCLK3Outputval = ClockNodeTypes{
            .output = .{ .max = 240000000, .min = 0 },
        };
        const HCLK3Output: ClockNode = .{
            .name = "HCLK3Output",
            .Nodetype = HCLK3Outputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const D1PPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.D1PPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const D1PPRE: ClockNode = .{
            .name = "D1PPRE",
            .Nodetype = D1PPREval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB3Outputval = ClockNodeTypes{
            .output = .{ .max = 120000000, .min = 0 },
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = APB3Outputval,
            .parents = &[_]*const ClockNode{&D1PPRE},
        };
        const D2PPRE1val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.D2PPRE1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const D2PPRE1: ClockNode = .{
            .name = "D2PPRE1",
            .Nodetype = D2PPRE1val,
            .parents = &[_]*const ClockNode{&AHBOutput},
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
        const Tim1Mulval = blk: {
            if ((RCC_TIM_PRescaler_Selectionval.num_val() == 1)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
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
        const Tim1Mul: ClockNode = .{
            .name = "Tim1Mul",
            .Nodetype = Tim1Mulval,
            .parents = &[_]*const ClockNode{&D2PPRE1},
        };
        const Tim1Outputval = ClockNodeTypes{ .output = null };
        const Tim1Output: ClockNode = .{
            .name = "Tim1Output",
            .Nodetype = Tim1Outputval,
            .parents = &[_]*const ClockNode{&Tim1Mul},
        };
        const AHB12Outputval = ClockNodeTypes{
            .output = .{ .max = 240000000, .min = 0 },
        };
        const AHB12Output: ClockNode = .{
            .name = "AHB12Output",
            .Nodetype = AHB12Outputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 120000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&D2PPRE1},
        };
        const D2PPRE2val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.D2PPRE2) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const D2PPRE2: ClockNode = .{
            .name = "D2PPRE2",
            .Nodetype = D2PPRE2val,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 120000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&D2PPRE2},
        };
        const Tim2Mulval = blk: {
            if ((RCC_TIM_PRescaler_Selectionval.num_val() == 1)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
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
        const Tim2Mul: ClockNode = .{
            .name = "Tim2Mul",
            .Nodetype = Tim2Mulval,
            .parents = &[_]*const ClockNode{&D2PPRE2},
        };
        const Tim2Outputval = ClockNodeTypes{ .output = null };
        const Tim2Output: ClockNode = .{
            .name = "Tim2Output",
            .Nodetype = Tim2Outputval,
            .parents = &[_]*const ClockNode{&Tim2Mul},
        };
        const AHB4Outputval = ClockNodeTypes{
            .output = .{ .max = 240000000, .min = 0 },
        };
        const AHB4Output: ClockNode = .{
            .name = "AHB4Output",
            .Nodetype = AHB4Outputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const D3PPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.D3PPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const D3PPRE: ClockNode = .{
            .name = "D3PPRE",
            .Nodetype = D3PPREval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB4Outputval = ClockNodeTypes{
            .output = .{ .max = 120000000, .min = 0 },
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .Nodetype = APB4Outputval,
            .parents = &[_]*const ClockNode{&D3PPRE},
        };
        const CKPERSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.CKPERSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CKPERSource: ClockNode = .{
            .name = "CKPERSource",
            .Nodetype = CKPERSourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const CKPERoutputval = ClockNodeTypes{ .output = null };
        const CKPERoutput: ClockNode = .{
            .name = "CKPERoutput",
            .Nodetype = CKPERoutputval,
            .parents = &[_]*const ClockNode{&CKPERSource},
        };
        const DIVM3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM3) |val| val.get() else 32,
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const DIVM3: ClockNode = .{
            .name = "DIVM3",
            .Nodetype = DIVM3val,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const DIVQ1outputval = ClockNodeTypes{ .output = null };
        const DIVQ1output: ClockNode = .{
            .name = "DIVQ1output",
            .Nodetype = DIVQ1outputval,
            .parents = &[_]*const ClockNode{&DIVQ1},
        };
        const DIVR1outputval = ClockNodeTypes{ .output = null };
        const DIVR1output: ClockNode = .{
            .name = "DIVR1output",
            .Nodetype = DIVR1outputval,
            .parents = &[_]*const ClockNode{&DIVR1},
        };
        const DIVP2outputval = ClockNodeTypes{ .output = null };
        const DIVP2output: ClockNode = .{
            .name = "DIVP2output",
            .Nodetype = DIVP2outputval,
            .parents = &[_]*const ClockNode{&DIVP2},
        };
        const DIVQ2outputval = ClockNodeTypes{ .output = null };
        const DIVQ2output: ClockNode = .{
            .name = "DIVQ2output",
            .Nodetype = DIVQ2outputval,
            .parents = &[_]*const ClockNode{&DIVQ2},
        };
        const DIVR2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR2) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVR2: ClockNode = .{
            .name = "DIVR2",
            .Nodetype = DIVR2val,
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVR2outputval = ClockNodeTypes{ .output = null };
        const DIVR2output: ClockNode = .{
            .name = "DIVR2output",
            .Nodetype = DIVR2outputval,
            .parents = &[_]*const ClockNode{&DIVR2},
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
        const DIVN3val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN3) |val| val.get() else 129,
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const DIVN3: ClockNode = .{
            .name = "DIVN3",
            .Nodetype = DIVN3val,
            .parents = &[_]*const ClockNode{ &DIVM3, &PLL3FRACN },
        };
        const DIVP3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVP3) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVP3: ClockNode = .{
            .name = "DIVP3",
            .Nodetype = DIVP3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVP3outputval = ClockNodeTypes{ .output = null };
        const DIVP3output: ClockNode = .{
            .name = "DIVP3output",
            .Nodetype = DIVP3outputval,
            .parents = &[_]*const ClockNode{&DIVP3},
        };
        const DIVQ3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ3) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVQ3: ClockNode = .{
            .name = "DIVQ3",
            .Nodetype = DIVQ3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVQ3outputval = ClockNodeTypes{ .output = null };
        const DIVQ3output: ClockNode = .{
            .name = "DIVQ3output",
            .Nodetype = DIVQ3outputval,
            .parents = &[_]*const ClockNode{&DIVQ3},
        };
        const DIVR3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR3) |val| val.get() else 2,
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVR3: ClockNode = .{
            .name = "DIVR3",
            .Nodetype = DIVR3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const LTDCOutputval = ClockNodeTypes{
            .output = .{ .max = 150000000, .min = 0 },
        };
        const LTDCOutput: ClockNode = .{
            .name = "LTDCOutput",
            .Nodetype = LTDCOutputval,
            .parents = &[_]*const ClockNode{&DIVR3},
        };
        const DIVR3outputval = ClockNodeTypes{ .output = null };
        const DIVR3output: ClockNode = .{
            .name = "DIVR3output",
            .Nodetype = DIVR3outputval,
            .parents = &[_]*const ClockNode{&DIVR3},
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
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = 1000000, .min = 0 },
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
        const SPI123Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI123Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI123Mult: ClockNode = .{
            .name = "SPI123Mult",
            .Nodetype = SPI123Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SPI123outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPI123output: ClockNode = .{
            .name = "SPI123output",
            .Nodetype = SPI123outputval,
            .parents = &[_]*const ClockNode{&SPI123Mult},
        };
        const SAI23Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI23Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI23Mult: ClockNode = .{
            .name = "SAI23Mult",
            .Nodetype = SAI23Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SAI23outputval = ClockNodeTypes{
            .output = .{ .max = 150000000, .min = 0 },
        };
        const SAI23output: ClockNode = .{
            .name = "SAI23output",
            .Nodetype = SAI23outputval,
            .parents = &[_]*const ClockNode{&SAI23Mult},
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
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const DFSDMACLKoutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const DFSDMACLKoutput: ClockNode = .{
            .name = "DFSDMACLKoutput",
            .Nodetype = DFSDMACLKoutputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI1outputval = ClockNodeTypes{
            .output = .{ .max = 150000000, .min = 0 },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI4BMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI4BMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI4BMult: ClockNode = .{
            .name = "SAI4BMult",
            .Nodetype = SAI4BMultval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SAI4Boutputval = ClockNodeTypes{
            .output = .{ .max = 150000000, .min = 0 },
        };
        const SAI4Boutput: ClockNode = .{
            .name = "SAI4Boutput",
            .Nodetype = SAI4Boutputval,
            .parents = &[_]*const ClockNode{&SAI4BMult},
        };
        const SAI4AMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI4AMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI4AMult: ClockNode = .{
            .name = "SAI4AMult",
            .Nodetype = SAI4AMultval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SAI4Aoutputval = ClockNodeTypes{
            .output = .{ .max = 150000000, .min = 0 },
        };
        const SAI4Aoutput: ClockNode = .{
            .name = "SAI4Aoutput",
            .Nodetype = SAI4Aoutputval,
            .parents = &[_]*const ClockNode{&SAI4AMult},
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
                &RC48,
                &DIVQ1,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const I2C123Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C123Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C123Mult: ClockNode = .{
            .name = "I2C123Mult",
            .Nodetype = I2C123Multval,

            .parents = &[_]*const ClockNode{
                &D2PPRE1,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C123outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const I2C123output: ClockNode = .{
            .name = "I2C123output",
            .Nodetype = I2C123outputval,
            .parents = &[_]*const ClockNode{&I2C123Mult},
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
                &D3PPRE,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C4outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = I2C4outputval,
            .parents = &[_]*const ClockNode{&I2C4Mult},
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
            .Nodetype = SPDIFMultval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVR2,
                &DIVR3,
                &HSIDiv,
            },
        };
        const SPDIFoutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .Nodetype = SPDIFoutputval,
            .parents = &[_]*const ClockNode{&SPDIFMult},
        };
        const QSPIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.QSPIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const QSPIMult: ClockNode = .{
            .name = "QSPIMult",
            .Nodetype = QSPIMultval,

            .parents = &[_]*const ClockNode{
                &HCLK3Output,
                &DIVQ1,
                &DIVR2,
                &CKPERSource,
            },
        };
        const QSPIoutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const QSPIoutput: ClockNode = .{
            .name = "QSPIoutput",
            .Nodetype = QSPIoutputval,
            .parents = &[_]*const ClockNode{&QSPIMult},
        };
        const FMCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FMCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const FMCMult: ClockNode = .{
            .name = "FMCMult",
            .Nodetype = FMCMultval,

            .parents = &[_]*const ClockNode{
                &HCLK3Output,
                &DIVQ1,
                &DIVR2,
                &CKPERSource,
            },
        };
        const FMCoutputval = ClockNodeTypes{
            .output = .{ .max = 300000000, .min = 0 },
        };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .Nodetype = FMCoutputval,
            .parents = &[_]*const ClockNode{&FMCMult},
        };
        const SWPMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SWPMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SWPMult: ClockNode = .{
            .name = "SWPMult",
            .Nodetype = SWPMultval,

            .parents = &[_]*const ClockNode{
                &D2PPRE1,
                &HSIDiv,
            },
        };
        const SWPoutputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const SWPoutput: ClockNode = .{
            .name = "SWPoutput",
            .Nodetype = SWPoutputval,
            .parents = &[_]*const ClockNode{&SWPMult},
        };
        const SDMMCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SDMMCMult: ClockNode = .{
            .name = "SDMMCMult",
            .Nodetype = SDMMCMultval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVR2,
            },
        };
        const SDMMCoutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const SDMMCoutput: ClockNode = .{
            .name = "SDMMCoutput",
            .Nodetype = SDMMCoutputval,
            .parents = &[_]*const ClockNode{&SDMMCMult},
        };
        const DFSDMMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DFSDMMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const DFSDMMult: ClockNode = .{
            .name = "DFSDMMult",
            .Nodetype = DFSDMMultval,

            .parents = &[_]*const ClockNode{
                &D2PPRE2,
                &SysCLKOutput,
            },
        };
        const DFSDMoutputval = ClockNodeTypes{
            .output = .{ .max = 250000000, .min = 0 },
        };
        const DFSDMoutput: ClockNode = .{
            .name = "DFSDMoutput",
            .Nodetype = DFSDMoutputval,
            .parents = &[_]*const ClockNode{&DFSDMMult},
        };
        const USART16Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART16Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART16Mult: ClockNode = .{
            .name = "USART16Mult",
            .Nodetype = USART16Multval,

            .parents = &[_]*const ClockNode{
                &D2PPRE2,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const USART16outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const USART16output: ClockNode = .{
            .name = "USART16output",
            .Nodetype = USART16outputval,
            .parents = &[_]*const ClockNode{&USART16Mult},
        };
        const USART234578Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART234578Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART234578Mult: ClockNode = .{
            .name = "USART234578Mult",
            .Nodetype = USART234578Multval,

            .parents = &[_]*const ClockNode{
                &D2PPRE1,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const USART234578outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const USART234578output: ClockNode = .{
            .name = "USART234578output",
            .Nodetype = USART234578outputval,
            .parents = &[_]*const ClockNode{&USART234578Mult},
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
                &D1PPRE,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const LPUART1outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = LPUART1outputval,
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
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &D2PPRE1,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM1outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM345Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM345Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM345Mult: ClockNode = .{
            .name = "LPTIM345Mult",
            .Nodetype = LPTIM345Multval,

            .parents = &[_]*const ClockNode{
                &D3PPRE,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM345outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const LPTIM345output: ClockNode = .{
            .name = "LPTIM345output",
            .Nodetype = LPTIM345outputval,
            .parents = &[_]*const ClockNode{&LPTIM345Mult},
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
                &D3PPRE,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM2outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
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
                &D3PPRE,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI6outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .Nodetype = SPI6outputval,
            .parents = &[_]*const ClockNode{&SPI6Mult},
        };
        const SPI45Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI45Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI45Mult: ClockNode = .{
            .name = "SPI45Mult",
            .Nodetype = SPI45Multval,

            .parents = &[_]*const ClockNode{
                &D2PPRE2,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI45outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const SPI45output: ClockNode = .{
            .name = "SPI45output",
            .Nodetype = SPI45outputval,
            .parents = &[_]*const ClockNode{&SPI45Mult},
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
                &DIVQ1,
                &DIVQ3,
                &RC48,
            },
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = 66000000, .min = 0 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",
            .Nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &DIVQ1,
                &DIVQ2,
            },
        };
        const FDCANoutputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .Nodetype = FDCANoutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
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
                &DIVP2,
                &DIVR3,
                &CKPERSource,
            },
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const CECMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CECMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",
            .Nodetype = CECMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &CSIRC,
            },
        };
        const CECoutputval = ClockNodeTypes{ .output = null };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .Nodetype = CECoutputval,
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const HrtimMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.HrtimMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const HrtimMult: ClockNode = .{
            .name = "HrtimMult",
            .Nodetype = HrtimMultval,

            .parents = &[_]*const ClockNode{
                &Tim2Output,
                &D1CPRE,
            },
        };
        const HRTIMoutputval = ClockNodeTypes{
            .output = .{ .max = 480000000, .min = 0 },
        };
        const HRTIMoutput: ClockNode = .{
            .name = "HRTIMoutput",
            .Nodetype = HRTIMoutputval,
            .parents = &[_]*const ClockNode{&HrtimMult},
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
                .value = if (config.HSICalibrationValue) |val| val.get() else 32,
                .limit = .{ .max = 63, .min = 0 },
            },
        };
        const CSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.CSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = 31, .min = 0 },
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
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .CSIRC = CSIRC,
            .RC48 = RC48,
            .I2S_CKIN = I2S_CKIN,
            .traceClkSource = traceClkSource,
            .TraceCLKOutput = TraceCLKOutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
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
            .PLLDSIIDF = PLLDSIIDF,
            .PLLDSIMultiplicator = PLLDSIMultiplicator,
            .PLLDSINDIV = PLLDSINDIV,
            .VCOoutput = VCOoutput,
            .PLLDSIDevisor = PLLDSIDevisor,
            .PLLDSIODF = PLLDSIODF,
            .PLLDSIoutput = PLLDSIoutput,
            .D1CPRE = D1CPRE,
            .D1CPREOutput = D1CPREOutput,
            .CpuClockOutput = CpuClockOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .HPRE = HPRE,
            .AHBOutput = AHBOutput,
            .AXIClockOutput = AXIClockOutput,
            .HCLK3Output = HCLK3Output,
            .D1PPRE = D1PPRE,
            .APB3Output = APB3Output,
            .D2PPRE1 = D2PPRE1,
            .Tim1Mul = Tim1Mul,
            .Tim1Output = Tim1Output,
            .AHB12Output = AHB12Output,
            .APB1Output = APB1Output,
            .D2PPRE2 = D2PPRE2,
            .APB2Output = APB2Output,
            .Tim2Mul = Tim2Mul,
            .Tim2Output = Tim2Output,
            .AHB4Output = AHB4Output,
            .D3PPRE = D3PPRE,
            .APB4Output = APB4Output,
            .PLLSource = PLLSource,
            .CKPERSource = CKPERSource,
            .CKPERoutput = CKPERoutput,
            .DIVM1 = DIVM1,
            .DIVM2 = DIVM2,
            .DIVM3 = DIVM3,
            .DIVN1 = DIVN1,
            .PLLFRACN = PLLFRACN,
            .DIVP1 = DIVP1,
            .DIVQ1 = DIVQ1,
            .DIVQ1output = DIVQ1output,
            .DIVR1 = DIVR1,
            .DIVR1output = DIVR1output,
            .DIVN2 = DIVN2,
            .PLL2FRACN = PLL2FRACN,
            .DIVP2 = DIVP2,
            .DIVP2output = DIVP2output,
            .DIVQ2 = DIVQ2,
            .DIVQ2output = DIVQ2output,
            .DIVR2 = DIVR2,
            .DIVR2output = DIVR2output,
            .DIVN3 = DIVN3,
            .DIVP3 = DIVP3,
            .PLL3FRACN = PLL3FRACN,
            .DIVP3output = DIVP3output,
            .DIVQ3 = DIVQ3,
            .DIVQ3output = DIVQ3output,
            .DIVR3 = DIVR3,
            .LTDCOutput = LTDCOutput,
            .DIVR3output = DIVR3output,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .SPI123Mult = SPI123Mult,
            .SPI123output = SPI123output,
            .SAI23Mult = SAI23Mult,
            .SAI23output = SAI23output,
            .SAI1Mult = SAI1Mult,
            .DFSDMACLKoutput = DFSDMACLKoutput,
            .SAI1output = SAI1output,
            .SAI4BMult = SAI4BMult,
            .SAI4Boutput = SAI4Boutput,
            .SAI4AMult = SAI4AMult,
            .SAI4Aoutput = SAI4Aoutput,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .I2C123Mult = I2C123Mult,
            .I2C123output = I2C123output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .SPDIFMult = SPDIFMult,
            .SPDIFoutput = SPDIFoutput,
            .QSPIMult = QSPIMult,
            .QSPIoutput = QSPIoutput,
            .FMCMult = FMCMult,
            .FMCoutput = FMCoutput,
            .SWPMult = SWPMult,
            .SWPoutput = SWPoutput,
            .SDMMCMult = SDMMCMult,
            .SDMMCoutput = SDMMCoutput,
            .DFSDMMult = DFSDMMult,
            .DFSDMoutput = DFSDMoutput,
            .USART16Mult = USART16Mult,
            .USART16output = USART16output,
            .USART234578Mult = USART234578Mult,
            .USART234578output = USART234578output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM345Mult = LPTIM345Mult,
            .LPTIM345output = LPTIM345output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .SPI6Mult = SPI6Mult,
            .SPI6output = SPI6output,
            .SPI45Mult = SPI45Mult,
            .SPI45output = SPI45output,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .FDCANMult = FDCANMult,
            .FDCANoutput = FDCANoutput,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CECMult = CECMult,
            .CECoutput = CECoutput,
            .HrtimMult = HrtimMult,
            .HRTIMoutput = HRTIMoutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval,
            .HSICalibrationValue = HSICalibrationValueval,
            .CSICalibrationValue = CSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.DSIoutput.get_comptime();
        _ = self.DSITXCLKEsc.get_comptime();
        _ = self.D1CPREOutput.get_comptime();
        _ = self.CpuClockOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.AXIClockOutput.get_comptime();
        _ = self.HCLK3Output.get_comptime();
        _ = self.APB3Output.get_comptime();
        _ = self.AHB12Output.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.AHB4Output.get_comptime();
        _ = self.APB4Output.get_comptime();
        _ = self.LTDCOutput.get_comptime();
        _ = self.SPI123output.get_comptime();
        _ = self.SAI23output.get_comptime();
        _ = self.DFSDMACLKoutput.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI4Boutput.get_comptime();
        _ = self.SAI4Aoutput.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.I2C123output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.SPDIFoutput.get_comptime();
        _ = self.QSPIoutput.get_comptime();
        _ = self.FMCoutput.get_comptime();
        _ = self.SWPoutput.get_comptime();
        _ = self.SDMMCoutput.get_comptime();
        _ = self.DFSDMoutput.get_comptime();
        _ = self.USART16output.get_comptime();
        _ = self.USART234578output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM345output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.SPI6output.get_comptime();
        _ = self.SPI45output.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.FDCANoutput.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.CECoutput.get_comptime();
        _ = self.HRTIMoutput.get_comptime();
    }
};
