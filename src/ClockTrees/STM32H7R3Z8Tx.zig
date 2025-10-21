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
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSI48,
    RCC_MCO1SOURCE_PLL1Q,

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
    RCC_MCO2SOURCE_PLL2P,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_PLL1P,
    RCC_MCO2SOURCE_CSI,
    RCC_MCO2SOURCE_LSI,

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
pub const CPREConf = enum {
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
pub const TPIUConf = enum {
    RCC_TPIU_DIV,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TPIU_DIV => 3,
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
pub const BMPREConf = enum {
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
pub const PPRE5Conf = enum {
    RCC_APB5_DIV1,
    RCC_APB5_DIV2,
    RCC_APB5_DIV4,
    RCC_APB5_DIV8,
    RCC_APB5_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB5_DIV2 => 2,
            .RCC_APB5_DIV16 => 16,
            .RCC_APB5_DIV4 => 4,
            .RCC_APB5_DIV8 => 8,
            .RCC_APB5_DIV1 => 1,
        };
    }
};
pub const PPRE1Conf = enum {
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
pub const PPRE2Conf = enum {
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
pub const PPRE4Conf = enum {
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
pub const PLLSourceConf = enum {
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
    @"1",
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
            .@"8" => 8,
            .@"24" => 24,
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
            .@"1" => 1,
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
pub const DIVS1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVT1Conf = enum(u32) {
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
pub const DIVS2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVT2Conf = enum(u32) {
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
pub const PLL3FRACNConf = enum(u32) {
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
pub const DIVS3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const DIVT3Conf = enum(u32) {
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
pub const HSIDivToUCPDConf = enum {
    RCC_UCPDCLKSOURCE_HSI4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_UCPDCLKSOURCE_HSI4 => 4,
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
pub const SPI23CLockSelectionConf = enum {
    RCC_SPI23CLKSOURCE_PLL1Q,
    RCC_SPI23CLKSOURCE_PLL2P,
    RCC_SPI23CLKSOURCE_PLL3P,
    RCC_SPI23CLKSOURCE_PIN,
    RCC_SPI23CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PLL1Q,
    RCC_SAI1CLKSOURCE_PLL2P,
    RCC_SAI1CLKSOURCE_PLL3P,
    RCC_SAI1CLKSOURCE_PIN,
    RCC_SAI1CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI2CLockSelectionConf = enum {
    RCC_SAI2CLKSOURCE_PLL1Q,
    RCC_SAI2CLKSOURCE_PLL2P,
    RCC_SAI2CLKSOURCE_PLL3P,
    RCC_SAI2CLKSOURCE_PIN,
    RCC_SAI2CLKSOURCE_CLKP,
    RCC_SAI2CLKSOURCE_SPDIF,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1_I3C1CLKSOURCE_PCLK1,
    RCC_I2C1_I3C1CLKSOURCE_PLL3R,
    RCC_I2C1_I3C1CLKSOURCE_HSI,
    RCC_I2C1_I3C1CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C23CLockSelectionConf = enum {
    RCC_I2C23CLKSOURCE_PCLK1,
    RCC_I2C23CLKSOURCE_PLL3R,
    RCC_I2C23CLKSOURCE_HSI,
    RCC_I2C23CLKSOURCE_CSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPDIFCLockSelectionConf = enum {
    RCC_SPDIFRXCLKSOURCE_PLL1Q,
    RCC_SPDIFRXCLKSOURCE_PLL2R,
    RCC_SPDIFRXCLKSOURCE_PLL3R,
    RCC_SPDIFRXCLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FmcClockSelectionConf = enum {
    RCC_FMCCLKSOURCE_HCLK,
    RCC_FMCCLKSOURCE_PLL1Q,
    RCC_FMCCLKSOURCE_PLL2R,
    RCC_FMCCLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SDMMC1CLockSelectionConf = enum {
    RCC_SDMMC12CLKSOURCE_PLL2S,
    RCC_SDMMC12CLKSOURCE_PLL2T,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_PLL2Q,
    RCC_USART1CLKSOURCE_PLL3Q,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_CSI,
    RCC_USART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Adf1ClockSelectionConf = enum {
    RCC_ADF1CLKSOURCE_HCLK,
    RCC_ADF1CLKSOURCE_PLL2P,
    RCC_ADF1CLKSOURCE_PLL3P,
    RCC_ADF1CLKSOURCE_PIN,
    RCC_ADF1CLKSOURCE_CSI,
    RCC_ADF1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART234578CLockSelectionConf = enum {
    RCC_USART234578CLKSOURCE_PCLK1,
    RCC_USART234578CLKSOURCE_PLL2Q,
    RCC_USART234578CLKSOURCE_PLL3Q,
    RCC_USART234578CLKSOURCE_HSI,
    RCC_USART234578CLKSOURCE_CSI,
    RCC_USART234578CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK4,
    RCC_LPUART1CLKSOURCE_PLL2Q,
    RCC_LPUART1CLKSOURCE_PLL3Q,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_CSI,
    RCC_LPUART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK1,
    RCC_LPTIM1CLKSOURCE_PLL2P,
    RCC_LPTIM1CLKSOURCE_PLL3R,
    RCC_LPTIM1CLKSOURCE_LSE,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM23CLockSelectionConf = enum {
    RCC_LPTIM23CLKSOURCE_PCLK4,
    RCC_LPTIM23CLKSOURCE_PLL2P,
    RCC_LPTIM23CLKSOURCE_PLL3R,
    RCC_LPTIM23CLKSOURCE_LSE,
    RCC_LPTIM23CLKSOURCE_LSI,
    RCC_LPTIM23CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM45CLockSelectionConf = enum {
    RCC_LPTIM45CLKSOURCE_PCLK4,
    RCC_LPTIM45CLKSOURCE_PLL2P,
    RCC_LPTIM45CLKSOURCE_PLL3R,
    RCC_LPTIM45CLKSOURCE_LSE,
    RCC_LPTIM45CLKSOURCE_LSI,
    RCC_LPTIM45CLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI6CLockSelectionConf = enum {
    RCC_SPI6CLKSOURCE_PCLK4,
    RCC_SPI6CLKSOURCE_PLL2Q,
    RCC_SPI6CLKSOURCE_PLL3Q,
    RCC_SPI6CLKSOURCE_HSI,
    RCC_SPI6CLKSOURCE_CSI,
    RCC_SPI6CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Spi45ClockSelectionConf = enum {
    RCC_SPI45CLKSOURCE_PCLK2,
    RCC_SPI45CLKSOURCE_PLL2Q,
    RCC_SPI45CLKSOURCE_PLL3Q,
    RCC_SPI45CLKSOURCE_HSI,
    RCC_SPI45CLKSOURCE_CSI,
    RCC_SPI45CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_USBPHY_Clock_Source_FROM_HSEConf = enum {
    RCC_USBPHYCCLKSOURCE_HSE_DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_USBPHYCCLKSOURCE_HSE_DIV2 => 2,
        };
    }
};
pub const USBPHYCLKSourceConf = enum {
    RCC_USBPHYCCLKSOURCE_HSE,
    RCC_USBPHYCCLKSOURCE_HSE_DIV2,
    RCC_USBPHYCCLKSOURCE_PLL3Q,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USBCLockSelectionConf = enum {
    RCC_USBOTGFSCLKSOURCE_HSI48,
    RCC_USBOTGFSCLKSOURCE_PLL3Q,
    RCC_USBOTGFSCLKSOURCE_HSE,
    RCC_USBOTGFSCLKSOURCE_CLK48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FDCANCLockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_HSE,
    RCC_FDCANCLKSOURCE_PLL1Q,
    RCC_FDCANCLKSOURCE_PLL2P,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Xspi1ClockSelectionConf = enum {
    RCC_XSPI1CLKSOURCE_HCLK,
    RCC_XSPI1CLKSOURCE_PLL2S,
    RCC_XSPI1CLKSOURCE_PLL2T,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PSSICLockSelectionConf = enum {
    RCC_PSSICLKSOURCE_PLL3R,
    RCC_PSSICLKSOURCE_CLKP,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Xspi2ClockSelectionConf = enum {
    RCC_XSPI2CLKSOURCE_HCLK,
    RCC_XSPI2CLKSOURCE_PLL2S,
    RCC_XSPI2CLKSOURCE_PLL2T,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ETHPHYCLockSelectionConf = enum {
    RCC_ETH1PHYCLKSOURCE_HSE,
    RCC_ETH1PHYCLKSOURCE_PLL3S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ETH1CLockSelectionConf = enum {
    RCC_ETH1REFCLKSOURCE_PHY,
    RCC_ETH1REFCLKSOURCE_HSE,
    RCC_ETH1REFCLKSOURCE_ETH,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_PLL2P,
    RCC_ADCCLKSOURCE_PLL3R,
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
pub const CSI_DIVConf = enum {
    RCC_CECCLKSOURCE_CSI,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_CECCLKSOURCE_CSI => 122,
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
pub const RCC_TIM_PRescaler_SelectionConf = enum {
    RCC_TIMPRES_ACTIVATED,
    RCC_TIMPRES_DISABLE,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TIMPRES_DISABLE => 1,
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
    MCO1Mult: ?RCC_MCO1SourceConf = null,
    MCO1Div: ?RCC_MCODiv1Conf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCODiv2Conf = null,
    CPRE: ?CPREConf = null,
    TPIUPrescaler: ?TPIUConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    BMPRE: ?BMPREConf = null,
    PPRE5: ?PPRE5Conf = null,
    PPRE1: ?PPRE1Conf = null,
    PPRE2: ?PPRE2Conf = null,
    PPRE4: ?PPRE4Conf = null,
    PLLSource: ?PLLSourceConf = null,
    CKPERSource: ?CKPERSourceSelectionConf = null,
    DIVM1: ?DIVM1Conf = null,
    DIVM2: ?DIVM2Conf = null,
    DIVM3: ?DIVM3Conf = null,
    DIVN1: ?DIVN1Conf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    DIVP1: ?DIVP1Conf = null,
    DIVQ1: ?DIVQ1Conf = null,
    DIVR1: ?DIVR1Conf = null,
    DIVS1: ?DIVS1Conf = null,
    DIVT1: ?DIVT1Conf = null,
    DIVN2: ?DIVN2Conf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    DIVP2: ?DIVP2Conf = null,
    DIVQ2: ?DIVQ2Conf = null,
    DIVR2: ?DIVR2Conf = null,
    DIVS2: ?DIVS2Conf = null,
    DIVT2: ?DIVT2Conf = null,
    DIVN3: ?DIVN3Conf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    DIVP3: ?DIVP3Conf = null,
    DIVQ3: ?DIVQ3Conf = null,
    DIVR3: ?DIVR3Conf = null,
    DIVS3: ?DIVS3Conf = null,
    DIVT3: ?DIVT3Conf = null,
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    HSI_DIV: ?HSIDivToUCPDConf = null,
    SPI1Mult: ?SPI1CLockSelectionConf = null,
    SPI23Mult: ?SPI23CLockSelectionConf = null,
    SAI1Mult: ?SAI1CLockSelectionConf = null,
    SAI2Mult: ?SAI2CLockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    I2C23Mult: ?I2C23CLockSelectionConf = null,
    SPDIFMult: ?SPDIFCLockSelectionConf = null,
    FMCMult: ?FmcClockSelectionConf = null,
    SDMMCMult: ?SDMMC1CLockSelectionConf = null,
    USART1Mult: ?USART1CLockSelectionConf = null,
    ADFMult: ?Adf1ClockSelectionConf = null,
    USART234578Mult: ?USART234578CLockSelectionConf = null,
    LPUART1Mult: ?LPUART1CLockSelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionConf = null,
    LPTIM23Mult: ?LPTIM23CLockSelectionConf = null,
    LPTIM45Mult: ?LPTIM45CLockSelectionConf = null,
    SPI6Mult: ?SPI6CLockSelectionConf = null,
    SPI45Mult: ?Spi45ClockSelectionConf = null,
    HSEUSBPHYDevisor: ?RCC_USBPHY_Clock_Source_FROM_HSEConf = null,
    USBPHYCLKMux: ?USBPHYCLKSourceConf = null,
    USBOCLKMux: ?USBCLockSelectionConf = null,
    FDCANMult: ?FDCANCLockSelectionConf = null,
    XSPI1Mult: ?Xspi1ClockSelectionConf = null,
    PSSIMult: ?PSSICLockSelectionConf = null,
    XSPI2Mult: ?Xspi2ClockSelectionConf = null,
    ETHPHYMult: ?ETHPHYCLockSelectionConf = null,
    ETH1Mult: ?ETH1CLockSelectionConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    CECMult: ?CECCLockSelectionConf = null,
    CSICECDevisor: ?CSI_DIVConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    HSIDiv: ?HSIDivConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSI_VALUE: ?LSI_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv1: ?RCC_MCODiv1Conf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCODiv2: ?RCC_MCODiv2Conf = null,
    CPRE: ?CPREConf = null,
    TPIU: ?TPIUConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    BMPRE: ?BMPREConf = null,
    PPRE5: ?PPRE5Conf = null,
    PPRE1: ?PPRE1Conf = null,
    PPRE2: ?PPRE2Conf = null,
    PPRE4: ?PPRE4Conf = null,
    PLLSource: ?PLLSourceConf = null,
    CKPERSourceSelection: ?CKPERSourceSelectionConf = null,
    DIVM1: ?DIVM1Conf = null,
    DIVM2: ?DIVM2Conf = null,
    DIVM3: ?DIVM3Conf = null,
    DIVN1: ?DIVN1Conf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    DIVP1: ?DIVP1Conf = null,
    DIVQ1: ?DIVQ1Conf = null,
    DIVR1: ?DIVR1Conf = null,
    DIVS1: ?DIVS1Conf = null,
    DIVT1: ?DIVT1Conf = null,
    DIVN2: ?DIVN2Conf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    DIVP2: ?DIVP2Conf = null,
    DIVQ2: ?DIVQ2Conf = null,
    DIVR2: ?DIVR2Conf = null,
    DIVS2: ?DIVS2Conf = null,
    DIVT2: ?DIVT2Conf = null,
    DIVN3: ?DIVN3Conf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    DIVP3: ?DIVP3Conf = null,
    DIVQ3: ?DIVQ3Conf = null,
    DIVR3: ?DIVR3Conf = null,
    DIVS3: ?DIVS3Conf = null,
    DIVT3: ?DIVT3Conf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    HSIDivToUCPD: ?HSIDivToUCPDConf = null,
    SPI1CLockSelection: ?SPI1CLockSelectionConf = null,
    SPI23CLockSelection: ?SPI23CLockSelectionConf = null,
    SAI1CLockSelection: ?SAI1CLockSelectionConf = null,
    SAI2CLockSelection: ?SAI2CLockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    I2C23CLockSelection: ?I2C23CLockSelectionConf = null,
    SPDIFCLockSelection: ?SPDIFCLockSelectionConf = null,
    FmcClockSelection: ?FmcClockSelectionConf = null,
    SDMMC1CLockSelection: ?SDMMC1CLockSelectionConf = null,
    USART1CLockSelection: ?USART1CLockSelectionConf = null,
    Adf1ClockSelection: ?Adf1ClockSelectionConf = null,
    USART234578CLockSelection: ?USART234578CLockSelectionConf = null,
    LPUART1CLockSelection: ?LPUART1CLockSelectionConf = null,
    LPTIM1CLockSelection: ?LPTIM1CLockSelectionConf = null,
    LPTIM23CLockSelection: ?LPTIM23CLockSelectionConf = null,
    LPTIM45CLockSelection: ?LPTIM45CLockSelectionConf = null,
    SPI6CLockSelection: ?SPI6CLockSelectionConf = null,
    Spi45ClockSelection: ?Spi45ClockSelectionConf = null,
    RCC_USBPHY_Clock_Source_FROM_HSE: ?RCC_USBPHY_Clock_Source_FROM_HSEConf = null,
    USBPHYCLKSource: ?USBPHYCLKSourceConf = null,
    USBCLockSelection: ?USBCLockSelectionConf = null,
    FDCANCLockSelection: ?FDCANCLockSelectionConf = null,
    Xspi1ClockSelection: ?Xspi1ClockSelectionConf = null,
    PSSICLockSelection: ?PSSICLockSelectionConf = null,
    Xspi2ClockSelection: ?Xspi2ClockSelectionConf = null,
    ETHPHYCLockSelection: ?ETHPHYCLockSelectionConf = null,
    ETH1CLockSelection: ?ETH1CLockSelectionConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    CECCLockSelection: ?CECCLockSelectionConf = null,
    CSI_DIV: ?CSI_DIVConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSIDiv = self.HSIDiv,
            .HSEOSC = self.HSE_VALUE,
            .LSIRC = self.LSI_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .MCO1Mult = self.RCC_MCO1Source,
            .MCO1Div = self.RCC_MCODiv1,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCODiv2,
            .CPRE = self.CPRE,
            .TPIUPrescaler = self.TPIU,
            .CortexPrescaler = self.Cortex_Div,
            .BMPRE = self.BMPRE,
            .PPRE5 = self.PPRE5,
            .PPRE1 = self.PPRE1,
            .PPRE2 = self.PPRE2,
            .PPRE4 = self.PPRE4,
            .PLLSource = self.PLLSource,
            .CKPERSource = self.CKPERSourceSelection,
            .DIVM1 = self.DIVM1,
            .DIVM2 = self.DIVM2,
            .DIVM3 = self.DIVM3,
            .DIVN1 = self.DIVN1,
            .PLLFRACN = self.PLLFRACN,
            .DIVP1 = self.DIVP1,
            .DIVQ1 = self.DIVQ1,
            .DIVR1 = self.DIVR1,
            .DIVS1 = self.DIVS1,
            .DIVT1 = self.DIVT1,
            .DIVN2 = self.DIVN2,
            .PLL2FRACN = self.PLL2FRACN,
            .DIVP2 = self.DIVP2,
            .DIVQ2 = self.DIVQ2,
            .DIVR2 = self.DIVR2,
            .DIVS2 = self.DIVS2,
            .DIVT2 = self.DIVT2,
            .DIVN3 = self.DIVN3,
            .PLL3FRACN = self.PLL3FRACN,
            .DIVP3 = self.DIVP3,
            .DIVQ3 = self.DIVQ3,
            .DIVR3 = self.DIVR3,
            .DIVS3 = self.DIVS3,
            .DIVT3 = self.DIVT3,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCClockSelection,
            .HSI_DIV = self.HSIDivToUCPD,
            .SPI1Mult = self.SPI1CLockSelection,
            .SPI23Mult = self.SPI23CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .SAI2Mult = self.SAI2CLockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C23Mult = self.I2C23CLockSelection,
            .SPDIFMult = self.SPDIFCLockSelection,
            .FMCMult = self.FmcClockSelection,
            .SDMMCMult = self.SDMMC1CLockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .ADFMult = self.Adf1ClockSelection,
            .USART234578Mult = self.USART234578CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM23Mult = self.LPTIM23CLockSelection,
            .LPTIM45Mult = self.LPTIM45CLockSelection,
            .SPI6Mult = self.SPI6CLockSelection,
            .SPI45Mult = self.Spi45ClockSelection,
            .HSEUSBPHYDevisor = self.RCC_USBPHY_Clock_Source_FROM_HSE,
            .USBPHYCLKMux = self.USBPHYCLKSource,
            .USBOCLKMux = self.USBCLockSelection,
            .FDCANMult = self.FDCANCLockSelection,
            .XSPI1Mult = self.Xspi1ClockSelection,
            .PSSIMult = self.PSSICLockSelection,
            .XSPI2Mult = self.Xspi2ClockSelection,
            .ETHPHYMult = self.ETHPHYCLockSelection,
            .ETH1Mult = self.ETH1CLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .CECMult = self.CECCLockSelection,
            .CSICECDevisor = self.CSI_DIV,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .RCC_TIM_PRescaler_Selection = self.RCC_TIM_PRescaler_Selection,
            .HSICalibrationValue = self.HSICalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const Self = @This();

    HSIRC: ClockNode,
    HSIDiv: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    CSIRC: ClockNode,
    RC48: ClockNode,
    I2S_CKIN: ClockNode,
    Dig_CKIN: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    CPRE: ClockNode,
    CPREOutput: ClockNode,
    TPIUPrescaler: ClockNode,
    TPIUOutput: ClockNode,
    CpuClockOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    BMPRE: ClockNode,
    AHBOutput: ClockNode,
    AXIClockOutput: ClockNode,
    AHB5Output: ClockNode,
    PPRE5: ClockNode,
    APB5Output: ClockNode,
    AHB1234Output: ClockNode,
    PPRE1: ClockNode,
    APB1Output: ClockNode,
    Tim1Mul: ClockNode,
    Tim1Output: ClockNode,
    PPRE2: ClockNode,
    APB2Output: ClockNode,
    Tim2Mul: ClockNode,
    Tim2Output: ClockNode,
    PPRE4: ClockNode,
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
    DIVS1: ClockNode,
    DIVS1output: ClockNode,
    DIVT1: ClockNode,
    DIVT1output: ClockNode,
    DIVN2: ClockNode,
    PLL2FRACN: ClockNode,
    DIVP2: ClockNode,
    DIVP2output: ClockNode,
    DIVQ2: ClockNode,
    DIVQ2output: ClockNode,
    DIVR2: ClockNode,
    DIVR2output: ClockNode,
    DIVS2: ClockNode,
    DIVS2output: ClockNode,
    DIVT2: ClockNode,
    DIVT2output: ClockNode,
    DIVN3: ClockNode,
    PLL3FRACN: ClockNode,
    DIVP3: ClockNode,
    DIVP3output: ClockNode,
    DIVQ3: ClockNode,
    DIVQ3output: ClockNode,
    DIVR3: ClockNode,
    DIVR3output: ClockNode,
    DIVS3: ClockNode,
    DIVS3output: ClockNode,
    DIVT3: ClockNode,
    DIVT3output: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    UCPDoutput: ClockNode,
    HSI_DIV: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI23Mult: ClockNode,
    SPI23output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C23Mult: ClockNode,
    I2C23output: ClockNode,
    SPDIFMult: ClockNode,
    SPDIFoutput: ClockNode,
    LTDCOutput: ClockNode,
    FMCMult: ClockNode,
    FMCoutput: ClockNode,
    SDMMCMult: ClockNode,
    SDMMCoutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    ADFMult: ClockNode,
    ADFoutput: ClockNode,
    USART234578Mult: ClockNode,
    USART234578output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM23Mult: ClockNode,
    LPTIM23output: ClockNode,
    LPTIM45Mult: ClockNode,
    LPTIM45output: ClockNode,
    SPI6Mult: ClockNode,
    SPI6output: ClockNode,
    SPI45Mult: ClockNode,
    SPI45output: ClockNode,
    HSEUSBPHYDevisor: ClockNode,
    USBPHYCLKMux: ClockNode,
    USBPHYCLKOutput: ClockNode,
    USBPHYRC: ClockNode,
    USBPHYRC60: ClockNode,
    USBOCLKMux: ClockNode,
    USBOFSCLKOutput: ClockNode,
    RNGOutput: ClockNode,
    DTSOutput: ClockNode,
    FDCANMult: ClockNode,
    FDCANoutput: ClockNode,
    XSPI1Mult: ClockNode,
    XSPI1output: ClockNode,
    PSSIMult: ClockNode,
    PSSIoutput: ClockNode,
    XSPI2Mult: ClockNode,
    XSPI2output: ClockNode,
    ETHPHYMult: ClockNode,
    ETHPHYoutput: ClockNode,
    ETH1Mult: ClockNode,
    ETH1output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CECMult: ClockNode,
    CECoutput: ClockNode,
    CSICECDevisor: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    RCC_TIM_PRescaler_Selection: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init(comptime config: Config) Self {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .nodetype = HSIRCval,
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
            .nodetype = HSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 24000000,
                .limit = .{ .max = @min(1_000_000_000, 50000000), .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSIRC) |val| val.get() else 32000,
                .limit = .{ .max = @min(1_000_000_000, 32600), .min = 31400 },
            },
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
        const CSIRCval = ClockNodeTypes{
            .source = .{ .value = 4000000 },
        };
        const CSIRC: ClockNode = .{
            .name = "CSIRC",
            .nodetype = CSIRCval,
        };
        const RC48val = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const RC48: ClockNode = .{
            .name = "RC48",
            .nodetype = RC48val,
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .nodetype = I2S_CKINval,
        };
        const Dig_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const Dig_CKIN: ClockNode = .{
            .name = "Dig_CKIN",
            .nodetype = Dig_CKINval,
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
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const DIVM1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM1) |val| val.get() else 32,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const DIVM1: ClockNode = .{
            .name = "DIVM1",
            .nodetype = DIVM1val,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLFRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLLFRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .nodetype = PLLFRACNval,
        };
        const DIVN1val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN1) |val| val.get() else 128,
                .limit = .{ .max = @min(1_000_000_000, 420), .min = 8 },
            },
        };
        const DIVN1: ClockNode = .{
            .name = "DIVN1",
            .nodetype = DIVN1val,
            .parents = &[_]*const ClockNode{ &DIVM1, &PLLFRACN },
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
            .nodetype = DIVP1val,
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
            .nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &DIVP1,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const DIVQ1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVQ1: ClockNode = .{
            .name = "DIVQ1",
            .nodetype = DIVQ1val,
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const MCO1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",
            .nodetype = MCO1Multval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
                &LSEOSC,
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
            .nodetype = MCO1Divval,
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO1Pinval = ClockNodeTypes{ .output = null };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .nodetype = MCO1Pinval,
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const DIVM2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM2) |val| val.get() else 32,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const DIVM2: ClockNode = .{
            .name = "DIVM2",
            .nodetype = DIVM2val,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLL2FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL2FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        const PLL2FRACN: ClockNode = .{
            .name = "PLL2FRACN",
            .nodetype = PLL2FRACNval,
        };
        const DIVN2val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN2) |val| val.get() else 128,
                .limit = .{ .max = @min(1_000_000_000, 420), .min = 8 },
            },
        };
        const DIVN2: ClockNode = .{
            .name = "DIVN2",
            .nodetype = DIVN2val,
            .parents = &[_]*const ClockNode{ &DIVM2, &PLL2FRACN },
        };
        const DIVP2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVP2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVP2: ClockNode = .{
            .name = "DIVP2",
            .nodetype = DIVP2val,
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
            .nodetype = MCO2Multval,

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
            .nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const CPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const CPRE: ClockNode = .{
            .name = "CPRE",
            .nodetype = CPREval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CPREOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        const CPREOutput: ClockNode = .{
            .name = "CPREOutput",
            .nodetype = CPREOutputval,
            .parents = &[_]*const ClockNode{&CPRE},
        };
        const TPIUPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TPIUPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        } };
        const TPIUPrescaler: ClockNode = .{
            .name = "TPIUPrescaler",
            .nodetype = TPIUPrescalerval,
            .parents = &[_]*const ClockNode{&CPREOutput},
        };
        const TPIUOutputval = ClockNodeTypes{ .output = null };
        const TPIUOutput: ClockNode = .{
            .name = "TPIUOutput",
            .nodetype = TPIUOutputval,
            .parents = &[_]*const ClockNode{&TPIUPrescaler},
        };
        const CpuClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        const CpuClockOutput: ClockNode = .{
            .name = "CpuClockOutput",
            .nodetype = CpuClockOutputval,
            .parents = &[_]*const ClockNode{&CPREOutput},
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
            .parents = &[_]*const ClockNode{&CPREOutput},
        };
        const CortexSysOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const BMPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.BMPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const BMPRE: ClockNode = .{
            .name = "BMPRE",
            .nodetype = BMPREval,
            .parents = &[_]*const ClockNode{&CPREOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&BMPRE},
        };
        const AXIClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        const AXIClockOutput: ClockNode = .{
            .name = "AXIClockOutput",
            .nodetype = AXIClockOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const AHB5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        const AHB5Output: ClockNode = .{
            .name = "AHB5Output",
            .nodetype = AHB5Outputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const PPRE5val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE5) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PPRE5: ClockNode = .{
            .name = "PPRE5",
            .nodetype = PPRE5val,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
        };
        const APB5Output: ClockNode = .{
            .name = "APB5Output",
            .nodetype = APB5Outputval,
            .parents = &[_]*const ClockNode{&PPRE5},
        };
        const AHB1234Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        const AHB1234Output: ClockNode = .{
            .name = "AHB1234Output",
            .nodetype = AHB1234Outputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const PPRE1val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PPRE1: ClockNode = .{
            .name = "PPRE1",
            .nodetype = PPRE1val,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&PPRE1},
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
            .nodetype = Tim1Mulval,
            .parents = &[_]*const ClockNode{&PPRE1},
        };
        const Tim1Outputval = ClockNodeTypes{ .output = null };
        const Tim1Output: ClockNode = .{
            .name = "Tim1Output",
            .nodetype = Tim1Outputval,
            .parents = &[_]*const ClockNode{&Tim1Mul},
        };
        const PPRE2val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE2) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PPRE2: ClockNode = .{
            .name = "PPRE2",
            .nodetype = PPRE2val,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&PPRE2},
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
            .nodetype = Tim2Mulval,
            .parents = &[_]*const ClockNode{&PPRE2},
        };
        const Tim2Outputval = ClockNodeTypes{ .output = null };
        const Tim2Output: ClockNode = .{
            .name = "Tim2Output",
            .nodetype = Tim2Outputval,
            .parents = &[_]*const ClockNode{&Tim2Mul},
        };
        const PPRE4val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE4) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PPRE4: ClockNode = .{
            .name = "PPRE4",
            .nodetype = PPRE4val,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB4Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .nodetype = APB4Outputval,
            .parents = &[_]*const ClockNode{&PPRE4},
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
            .nodetype = CKPERSourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const CKPERoutputval = ClockNodeTypes{ .output = null };
        const CKPERoutput: ClockNode = .{
            .name = "CKPERoutput",
            .nodetype = CKPERoutputval,
            .parents = &[_]*const ClockNode{&CKPERSource},
        };
        const DIVM3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM3) |val| val.get() else 32,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const DIVM3: ClockNode = .{
            .name = "DIVM3",
            .nodetype = DIVM3val,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const DIVQ1outputval = ClockNodeTypes{ .output = null };
        const DIVQ1output: ClockNode = .{
            .name = "DIVQ1output",
            .nodetype = DIVQ1outputval,
            .parents = &[_]*const ClockNode{&DIVQ1},
        };
        const DIVR1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVR1: ClockNode = .{
            .name = "DIVR1",
            .nodetype = DIVR1val,
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVR1outputval = ClockNodeTypes{ .output = null };
        const DIVR1output: ClockNode = .{
            .name = "DIVR1output",
            .nodetype = DIVR1outputval,
            .parents = &[_]*const ClockNode{&DIVR1},
        };
        const DIVS1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVS1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        const DIVS1: ClockNode = .{
            .name = "DIVS1",
            .nodetype = DIVS1val,
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVS1outputval = ClockNodeTypes{ .output = null };
        const DIVS1output: ClockNode = .{
            .name = "DIVS1output",
            .nodetype = DIVS1outputval,
            .parents = &[_]*const ClockNode{&DIVS1},
        };
        const DIVT1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVT1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        const DIVT1: ClockNode = .{
            .name = "DIVT1",
            .nodetype = DIVT1val,
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVT1outputval = ClockNodeTypes{ .output = null };
        const DIVT1output: ClockNode = .{
            .name = "DIVT1output",
            .nodetype = DIVT1outputval,
            .parents = &[_]*const ClockNode{&DIVT1},
        };
        const DIVP2outputval = ClockNodeTypes{ .output = null };
        const DIVP2output: ClockNode = .{
            .name = "DIVP2output",
            .nodetype = DIVP2outputval,
            .parents = &[_]*const ClockNode{&DIVP2},
        };
        const DIVQ2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVQ2: ClockNode = .{
            .name = "DIVQ2",
            .nodetype = DIVQ2val,
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVQ2outputval = ClockNodeTypes{ .output = null };
        const DIVQ2output: ClockNode = .{
            .name = "DIVQ2output",
            .nodetype = DIVQ2outputval,
            .parents = &[_]*const ClockNode{&DIVQ2},
        };
        const DIVR2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVR2: ClockNode = .{
            .name = "DIVR2",
            .nodetype = DIVR2val,
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVR2outputval = ClockNodeTypes{ .output = null };
        const DIVR2output: ClockNode = .{
            .name = "DIVR2output",
            .nodetype = DIVR2outputval,
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DIVS2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVS2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        const DIVS2: ClockNode = .{
            .name = "DIVS2",
            .nodetype = DIVS2val,
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVS2outputval = ClockNodeTypes{ .output = null };
        const DIVS2output: ClockNode = .{
            .name = "DIVS2output",
            .nodetype = DIVS2outputval,
            .parents = &[_]*const ClockNode{&DIVS2},
        };
        const DIVT2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVT2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        const DIVT2: ClockNode = .{
            .name = "DIVT2",
            .nodetype = DIVT2val,
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVT2outputval = ClockNodeTypes{ .output = null };
        const DIVT2output: ClockNode = .{
            .name = "DIVT2output",
            .nodetype = DIVT2outputval,
            .parents = &[_]*const ClockNode{&DIVT2},
        };
        const PLL3FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL3FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        const PLL3FRACN: ClockNode = .{
            .name = "PLL3FRACN",
            .nodetype = PLL3FRACNval,
        };
        const DIVN3val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN3) |val| val.get() else 128,
                .limit = .{ .max = @min(1_000_000_000, 420), .min = 12 },
            },
        };
        const DIVN3: ClockNode = .{
            .name = "DIVN3",
            .nodetype = DIVN3val,
            .parents = &[_]*const ClockNode{ &DIVM3, &PLL3FRACN },
        };
        const DIVP3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVP3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVP3: ClockNode = .{
            .name = "DIVP3",
            .nodetype = DIVP3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVP3outputval = ClockNodeTypes{ .output = null };
        const DIVP3output: ClockNode = .{
            .name = "DIVP3output",
            .nodetype = DIVP3outputval,
            .parents = &[_]*const ClockNode{&DIVP3},
        };
        const DIVQ3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVQ3: ClockNode = .{
            .name = "DIVQ3",
            .nodetype = DIVQ3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVQ3outputval = ClockNodeTypes{ .output = null };
        const DIVQ3output: ClockNode = .{
            .name = "DIVQ3output",
            .nodetype = DIVQ3outputval,
            .parents = &[_]*const ClockNode{&DIVQ3},
        };
        const DIVR3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const DIVR3: ClockNode = .{
            .name = "DIVR3",
            .nodetype = DIVR3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVR3outputval = ClockNodeTypes{ .output = null };
        const DIVR3output: ClockNode = .{
            .name = "DIVR3output",
            .nodetype = DIVR3outputval,
            .parents = &[_]*const ClockNode{&DIVR3},
        };
        const DIVS3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVS3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        const DIVS3: ClockNode = .{
            .name = "DIVS3",
            .nodetype = DIVS3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVS3outputval = ClockNodeTypes{ .output = null };
        const DIVS3output: ClockNode = .{
            .name = "DIVS3output",
            .nodetype = DIVS3outputval,
            .parents = &[_]*const ClockNode{&DIVS3},
        };
        const DIVT3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVT3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        const DIVT3: ClockNode = .{
            .name = "DIVT3",
            .nodetype = DIVT3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVT3outputval = ClockNodeTypes{ .output = null };
        const DIVT3output: ClockNode = .{
            .name = "DIVT3output",
            .nodetype = DIVT3outputval,
            .parents = &[_]*const ClockNode{&DIVT3},
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
        const HSI_DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSI_DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        } };
        const HSI_DIV: ClockNode = .{
            .name = "HSI_DIV",
            .nodetype = HSI_DIVval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const UCPDoutputval = ClockNodeTypes{ .output = null };
        const UCPDoutput: ClockNode = .{
            .name = "UCPDoutput",
            .nodetype = UCPDoutputval,
            .parents = &[_]*const ClockNode{&HSI_DIV},
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
            .nodetype = SPI1Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SPI1outputval = ClockNodeTypes{ .output = null };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .nodetype = SPI1outputval,
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI23Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI23Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI23Mult: ClockNode = .{
            .name = "SPI23Mult",
            .nodetype = SPI23Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SPI23outputval = ClockNodeTypes{ .output = null };
        const SPI23output: ClockNode = .{
            .name = "SPI23output",
            .nodetype = SPI23outputval,
            .parents = &[_]*const ClockNode{&SPI23Mult},
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
            .nodetype = SAI1Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SAI1outputval = ClockNodeTypes{ .output = null };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
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
                &DIVQ1,
                &DIVR2,
                &DIVR3,
                &HSIDiv,
            },
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
            .nodetype = SAI2Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
                &SPDIFMult,
            },
        };
        const SAI2outputval = ClockNodeTypes{ .output = null };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .nodetype = SAI2outputval,
            .parents = &[_]*const ClockNode{&SAI2Mult},
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
                &PPRE1,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .nodetype = I2C1outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C23Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C23Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C23Mult: ClockNode = .{
            .name = "I2C23Mult",
            .nodetype = I2C23Multval,

            .parents = &[_]*const ClockNode{
                &PPRE1,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C23outputval = ClockNodeTypes{ .output = null };
        const I2C23output: ClockNode = .{
            .name = "I2C23output",
            .nodetype = I2C23outputval,
            .parents = &[_]*const ClockNode{&I2C23Mult},
        };
        const SPDIFoutputval = ClockNodeTypes{ .output = null };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .nodetype = SPDIFoutputval,
            .parents = &[_]*const ClockNode{&SPDIFMult},
        };
        const LTDCOutputval = ClockNodeTypes{ .output = null };
        const LTDCOutput: ClockNode = .{
            .name = "LTDCOutput",
            .nodetype = LTDCOutputval,
            .parents = &[_]*const ClockNode{&DIVR3},
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
            .nodetype = FMCMultval,

            .parents = &[_]*const ClockNode{
                &AHB5Output,
                &DIVQ1,
                &DIVR2,
                &HSIRC,
            },
        };
        const FMCoutputval = ClockNodeTypes{ .output = null };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .nodetype = FMCoutputval,
            .parents = &[_]*const ClockNode{&FMCMult},
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
            .nodetype = SDMMCMultval,

            .parents = &[_]*const ClockNode{
                &DIVS2,
                &DIVT2,
            },
        };
        const SDMMCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SDMMCoutput: ClockNode = .{
            .name = "SDMMCoutput",
            .nodetype = SDMMCoutputval,
            .parents = &[_]*const ClockNode{&SDMMCMult},
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
                &PPRE2,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const USART1outputval = ClockNodeTypes{ .output = null };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const ADFMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADFMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ADFMult: ClockNode = .{
            .name = "ADFMult",
            .nodetype = ADFMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CSIRC,
                &HSIDiv,
            },
        };
        const ADFoutputval = ClockNodeTypes{ .output = null };
        const ADFoutput: ClockNode = .{
            .name = "ADFoutput",
            .nodetype = ADFoutputval,
            .parents = &[_]*const ClockNode{&ADFMult},
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
            .nodetype = USART234578Multval,

            .parents = &[_]*const ClockNode{
                &PPRE1,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const USART234578outputval = ClockNodeTypes{ .output = null };
        const USART234578output: ClockNode = .{
            .name = "USART234578output",
            .nodetype = USART234578outputval,
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
            .nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
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
                &PPRE1,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM1outputval = ClockNodeTypes{ .output = null };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM23Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM23Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM23Mult: ClockNode = .{
            .name = "LPTIM23Mult",
            .nodetype = LPTIM23Multval,

            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM23outputval = ClockNodeTypes{ .output = null };
        const LPTIM23output: ClockNode = .{
            .name = "LPTIM23output",
            .nodetype = LPTIM23outputval,
            .parents = &[_]*const ClockNode{&LPTIM23Mult},
        };
        const LPTIM45Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM45Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM45Mult: ClockNode = .{
            .name = "LPTIM45Mult",
            .nodetype = LPTIM45Multval,

            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM45outputval = ClockNodeTypes{ .output = null };
        const LPTIM45output: ClockNode = .{
            .name = "LPTIM45output",
            .nodetype = LPTIM45outputval,
            .parents = &[_]*const ClockNode{&LPTIM45Mult},
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
            .nodetype = SPI6Multval,

            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI6outputval = ClockNodeTypes{ .output = null };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .nodetype = SPI6outputval,
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
            .nodetype = SPI45Multval,

            .parents = &[_]*const ClockNode{
                &PPRE2,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI45outputval = ClockNodeTypes{ .output = null };
        const SPI45output: ClockNode = .{
            .name = "SPI45output",
            .nodetype = SPI45outputval,
            .parents = &[_]*const ClockNode{&SPI45Mult},
        };
        const HSEUSBPHYDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEUSBPHYDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const HSEUSBPHYDevisor: ClockNode = .{
            .name = "HSEUSBPHYDevisor",
            .nodetype = HSEUSBPHYDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const USBPHYCLKMuxval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBPHYCLKMux) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USBPHYCLKMux: ClockNode = .{
            .name = "USBPHYCLKMux",
            .nodetype = USBPHYCLKMuxval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &HSEUSBPHYDevisor,
                &DIVQ3,
            },
        };
        const USBPHYCLKOutputval = ClockNodeTypes{ .output = null };
        const USBPHYCLKOutput: ClockNode = .{
            .name = "USBPHYCLKOutput",
            .nodetype = USBPHYCLKOutputval,
            .parents = &[_]*const ClockNode{&USBPHYCLKMux},
        };
        const USBPHYRCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const USBPHYRC: ClockNode = .{
            .name = "USBPHYRC",
            .nodetype = USBPHYRCval,
        };
        const USBPHYRC60val = ClockNodeTypes{
            .source = .{ .value = 60000000 },
        };
        const USBPHYRC60: ClockNode = .{
            .name = "USBPHYRC60",
            .nodetype = USBPHYRC60val,
        };
        const USBOCLKMuxval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBOCLKMux) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USBOCLKMux: ClockNode = .{
            .name = "USBOCLKMux",
            .nodetype = USBOCLKMuxval,

            .parents = &[_]*const ClockNode{
                &RC48,
                &DIVQ3,
                &HSEOSC,
                &USBPHYRC,
            },
        };
        const USBOFSCLKOutputval = ClockNodeTypes{ .output = null };
        const USBOFSCLKOutput: ClockNode = .{
            .name = "USBOFSCLKOutput",
            .nodetype = USBOFSCLKOutputval,
            .parents = &[_]*const ClockNode{&USBOCLKMux},
        };
        const RNGOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const RNGOutput: ClockNode = .{
            .name = "RNGOutput",
            .nodetype = RNGOutputval,
            .parents = &[_]*const ClockNode{&RC48},
        };
        const DTSOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 90000000), .min = 0 },
        };
        const DTSOutput: ClockNode = .{
            .name = "DTSOutput",
            .nodetype = DTSOutputval,
            .parents = &[_]*const ClockNode{&LSEOSC},
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
                &HSEOSC,
                &DIVQ1,
                &DIVP2,
            },
        };
        const FDCANoutputval = ClockNodeTypes{ .output = null };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .nodetype = FDCANoutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const XSPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const XSPI1Mult: ClockNode = .{
            .name = "XSPI1Mult",
            .nodetype = XSPI1Multval,

            .parents = &[_]*const ClockNode{
                &AHB5Output,
                &DIVS2,
                &DIVT2,
            },
        };
        const XSPI1outputval = ClockNodeTypes{ .output = null };
        const XSPI1output: ClockNode = .{
            .name = "XSPI1output",
            .nodetype = XSPI1outputval,
            .parents = &[_]*const ClockNode{&XSPI1Mult},
        };
        const PSSIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.PSSIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PSSIMult: ClockNode = .{
            .name = "PSSIMult",
            .nodetype = PSSIMultval,

            .parents = &[_]*const ClockNode{
                &DIVR3,
                &CKPERSource,
            },
        };
        const PSSIoutputval = ClockNodeTypes{ .output = null };
        const PSSIoutput: ClockNode = .{
            .name = "PSSIoutput",
            .nodetype = PSSIoutputval,
            .parents = &[_]*const ClockNode{&PSSIMult},
        };
        const XSPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const XSPI2Mult: ClockNode = .{
            .name = "XSPI2Mult",
            .nodetype = XSPI2Multval,

            .parents = &[_]*const ClockNode{
                &AHB5Output,
                &DIVS2,
                &DIVT2,
            },
        };
        const XSPI2outputval = ClockNodeTypes{ .output = null };
        const XSPI2output: ClockNode = .{
            .name = "XSPI2output",
            .nodetype = XSPI2outputval,
            .parents = &[_]*const ClockNode{&XSPI2Mult},
        };
        const ETHPHYMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ETHPHYMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ETHPHYMult: ClockNode = .{
            .name = "ETHPHYMult",
            .nodetype = ETHPHYMultval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &DIVS3,
            },
        };
        const ETHPHYoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 50000000), .min = 25000000 },
        };
        const ETHPHYoutput: ClockNode = .{
            .name = "ETHPHYoutput",
            .nodetype = ETHPHYoutputval,
            .parents = &[_]*const ClockNode{&ETHPHYMult},
        };
        const ETH1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ETH1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ETH1Mult: ClockNode = .{
            .name = "ETH1Mult",
            .nodetype = ETH1Multval,

            .parents = &[_]*const ClockNode{
                &Dig_CKIN,
                &HSEOSC,
                &ETHPHYMult,
            },
        };
        const ETH1outputval = ClockNodeTypes{ .output = null };
        const ETH1output: ClockNode = .{
            .name = "ETH1output",
            .nodetype = ETH1outputval,
            .parents = &[_]*const ClockNode{&ETH1Mult},
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
                &DIVP2,
                &DIVR3,
                &CKPERSource,
            },
        };
        const ADCoutputval = ClockNodeTypes{ .output = null };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const CSICECDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CSICECDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 122;
                }
            },
        } };
        const CSICECDevisor: ClockNode = .{
            .name = "CSICECDevisor",
            .nodetype = CSICECDevisorval,
            .parents = &[_]*const ClockNode{&CSIRC},
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
                &LSEOSC,
                &LSIRC,
                &CSICECDevisor,
            },
        };
        const CECoutputval = ClockNodeTypes{ .output = null };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .nodetype = CECoutputval,
            .parents = &[_]*const ClockNode{&CECMult},
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
        return .{
            .HSIRC = HSIRC,
            .HSIDiv = HSIDiv,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .CSIRC = CSIRC,
            .RC48 = RC48,
            .I2S_CKIN = I2S_CKIN,
            .Dig_CKIN = Dig_CKIN,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .CPRE = CPRE,
            .CPREOutput = CPREOutput,
            .TPIUPrescaler = TPIUPrescaler,
            .TPIUOutput = TPIUOutput,
            .CpuClockOutput = CpuClockOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .BMPRE = BMPRE,
            .AHBOutput = AHBOutput,
            .AXIClockOutput = AXIClockOutput,
            .AHB5Output = AHB5Output,
            .PPRE5 = PPRE5,
            .APB5Output = APB5Output,
            .AHB1234Output = AHB1234Output,
            .PPRE1 = PPRE1,
            .APB1Output = APB1Output,
            .Tim1Mul = Tim1Mul,
            .Tim1Output = Tim1Output,
            .PPRE2 = PPRE2,
            .APB2Output = APB2Output,
            .Tim2Mul = Tim2Mul,
            .Tim2Output = Tim2Output,
            .PPRE4 = PPRE4,
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
            .DIVS1 = DIVS1,
            .DIVS1output = DIVS1output,
            .DIVT1 = DIVT1,
            .DIVT1output = DIVT1output,
            .DIVN2 = DIVN2,
            .PLL2FRACN = PLL2FRACN,
            .DIVP2 = DIVP2,
            .DIVP2output = DIVP2output,
            .DIVQ2 = DIVQ2,
            .DIVQ2output = DIVQ2output,
            .DIVR2 = DIVR2,
            .DIVR2output = DIVR2output,
            .DIVS2 = DIVS2,
            .DIVS2output = DIVS2output,
            .DIVT2 = DIVT2,
            .DIVT2output = DIVT2output,
            .DIVN3 = DIVN3,
            .PLL3FRACN = PLL3FRACN,
            .DIVP3 = DIVP3,
            .DIVP3output = DIVP3output,
            .DIVQ3 = DIVQ3,
            .DIVQ3output = DIVQ3output,
            .DIVR3 = DIVR3,
            .DIVR3output = DIVR3output,
            .DIVS3 = DIVS3,
            .DIVS3output = DIVS3output,
            .DIVT3 = DIVT3,
            .DIVT3output = DIVT3output,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .UCPDoutput = UCPDoutput,
            .HSI_DIV = HSI_DIV,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI23Mult = SPI23Mult,
            .SPI23output = SPI23output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C23Mult = I2C23Mult,
            .I2C23output = I2C23output,
            .SPDIFMult = SPDIFMult,
            .SPDIFoutput = SPDIFoutput,
            .LTDCOutput = LTDCOutput,
            .FMCMult = FMCMult,
            .FMCoutput = FMCoutput,
            .SDMMCMult = SDMMCMult,
            .SDMMCoutput = SDMMCoutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .ADFMult = ADFMult,
            .ADFoutput = ADFoutput,
            .USART234578Mult = USART234578Mult,
            .USART234578output = USART234578output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM23Mult = LPTIM23Mult,
            .LPTIM23output = LPTIM23output,
            .LPTIM45Mult = LPTIM45Mult,
            .LPTIM45output = LPTIM45output,
            .SPI6Mult = SPI6Mult,
            .SPI6output = SPI6output,
            .SPI45Mult = SPI45Mult,
            .SPI45output = SPI45output,
            .HSEUSBPHYDevisor = HSEUSBPHYDevisor,
            .USBPHYCLKMux = USBPHYCLKMux,
            .USBPHYCLKOutput = USBPHYCLKOutput,
            .USBPHYRC = USBPHYRC,
            .USBPHYRC60 = USBPHYRC60,
            .USBOCLKMux = USBOCLKMux,
            .USBOFSCLKOutput = USBOFSCLKOutput,
            .RNGOutput = RNGOutput,
            .DTSOutput = DTSOutput,
            .FDCANMult = FDCANMult,
            .FDCANoutput = FDCANoutput,
            .XSPI1Mult = XSPI1Mult,
            .XSPI1output = XSPI1output,
            .PSSIMult = PSSIMult,
            .PSSIoutput = PSSIoutput,
            .XSPI2Mult = XSPI2Mult,
            .XSPI2output = XSPI2output,
            .ETHPHYMult = ETHPHYMult,
            .ETHPHYoutput = ETHPHYoutput,
            .ETH1Mult = ETH1Mult,
            .ETH1output = ETH1output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CECMult = CECMult,
            .CECoutput = CECoutput,
            .CSICECDevisor = CSICECDevisor,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_Selectionval,
            .HSICalibrationValue = HSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSIDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.CSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.RC48.parents = try alloc.dupe(*const ClockNode, &.{});
        self.I2S_CKIN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.Dig_CKIN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.SysClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDiv,
            &self.CSIRC,
            &self.HSEOSC,
            &self.DIVP1,
        });
        self.SysCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysClkSource,
        });
        self.MCO1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDiv,
            &self.HSEOSC,
            &self.LSEOSC,
            &self.RC48,
            &self.DIVQ1,
        });
        self.MCO1Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO1Mult,
        });
        self.MCO1Pin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO1Div,
        });
        self.MCO2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.DIVP2,
            &self.HSEOSC,
            &self.DIVP1,
            &self.CSIRC,
            &self.LSIRC,
        });
        self.MCO2Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Mult,
        });
        self.MCO2Pin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Div,
        });
        self.CPRE.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
        });
        self.CPREOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CPRE,
        });
        self.TPIUPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CPREOutput,
        });
        self.TPIUOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TPIUPrescaler,
        });
        self.CpuClockOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CPREOutput,
        });
        self.CortexPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CPREOutput,
        });
        self.CortexSysOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CortexPrescaler,
        });
        self.BMPRE.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CPREOutput,
        });
        self.AHBOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.BMPRE,
        });
        self.AXIClockOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.AHB5Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.PPRE5.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB5Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE5,
        });
        self.AHB1234Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.PPRE1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE1,
        });
        self.Tim1Mul.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE1,
        });
        self.Tim1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.Tim1Mul,
        });
        self.PPRE2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB2Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE2,
        });
        self.Tim2Mul.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE2,
        });
        self.Tim2Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.Tim2Mul,
        });
        self.PPRE4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB4Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE4,
        });
        self.PLLSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDiv,
            &self.CSIRC,
            &self.HSEOSC,
        });
        self.CKPERSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDiv,
            &self.CSIRC,
            &self.HSEOSC,
        });
        self.CKPERoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CKPERSource,
        });
        self.DIVM1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.DIVM2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.DIVM3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.DIVN1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVM1,
            &self.PLLFRACN,
        });
        self.PLLFRACN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.DIVP1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN1,
        });
        self.DIVQ1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN1,
        });
        self.DIVQ1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ1,
        });
        self.DIVR1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN1,
        });
        self.DIVR1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVR1,
        });
        self.DIVS1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN1,
        });
        self.DIVS1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVS1,
        });
        self.DIVT1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN1,
        });
        self.DIVT1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVT1,
        });
        self.DIVN2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVM2,
            &self.PLL2FRACN,
        });
        self.PLL2FRACN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.DIVP2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN2,
        });
        self.DIVP2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVP2,
        });
        self.DIVQ2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN2,
        });
        self.DIVQ2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ2,
        });
        self.DIVR2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN2,
        });
        self.DIVR2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVR2,
        });
        self.DIVS2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN2,
        });
        self.DIVS2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVS2,
        });
        self.DIVT2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN2,
        });
        self.DIVT2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVT2,
        });
        self.DIVN3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVM3,
            &self.PLL3FRACN,
        });
        self.PLL3FRACN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.DIVP3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN3,
        });
        self.DIVP3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVP3,
        });
        self.DIVQ3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN3,
        });
        self.DIVQ3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ3,
        });
        self.DIVR3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN3,
        });
        self.DIVR3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVR3,
        });
        self.DIVS3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN3,
        });
        self.DIVS3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVS3,
        });
        self.DIVT3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVN3,
        });
        self.DIVT3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVT3,
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
        self.UCPDoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSI_DIV,
        });
        self.HSI_DIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.SPI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ1,
            &self.DIVP2,
            &self.DIVP3,
            &self.I2S_CKIN,
            &self.CKPERSource,
        });
        self.SPI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI1Mult,
        });
        self.SPI23Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ1,
            &self.DIVP2,
            &self.DIVP3,
            &self.I2S_CKIN,
            &self.CKPERSource,
        });
        self.SPI23output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI23Mult,
        });
        self.SAI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ1,
            &self.DIVP2,
            &self.DIVP3,
            &self.I2S_CKIN,
            &self.CKPERSource,
        });
        self.SAI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAI1Mult,
        });
        self.SAI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ1,
            &self.DIVP2,
            &self.DIVP3,
            &self.I2S_CKIN,
            &self.CKPERSource,
            &self.SPDIFMult,
        });
        self.SAI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAI2Mult,
        });
        self.I2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE1,
            &self.DIVR3,
            &self.HSIDiv,
            &self.CSIRC,
        });
        self.I2C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C1Mult,
        });
        self.I2C23Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE1,
            &self.DIVR3,
            &self.HSIDiv,
            &self.CSIRC,
        });
        self.I2C23output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C23Mult,
        });
        self.SPDIFMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVQ1,
            &self.DIVR2,
            &self.DIVR3,
            &self.HSIDiv,
        });
        self.SPDIFoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPDIFMult,
        });
        self.LTDCOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVR3,
        });
        self.FMCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHB5Output,
            &self.DIVQ1,
            &self.DIVR2,
            &self.HSIRC,
        });
        self.FMCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FMCMult,
        });
        self.SDMMCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVS2,
            &self.DIVT2,
        });
        self.SDMMCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SDMMCMult,
        });
        self.USART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE2,
            &self.DIVQ2,
            &self.DIVQ3,
            &self.HSIDiv,
            &self.CSIRC,
            &self.LSEOSC,
        });
        self.USART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART1Mult,
        });
        self.ADFMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.DIVP2,
            &self.DIVP3,
            &self.I2S_CKIN,
            &self.CSIRC,
            &self.HSIDiv,
        });
        self.ADFoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADFMult,
        });
        self.USART234578Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE1,
            &self.DIVQ2,
            &self.DIVQ3,
            &self.HSIDiv,
            &self.CSIRC,
            &self.LSEOSC,
        });
        self.USART234578output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART234578Mult,
        });
        self.LPUART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE4,
            &self.DIVQ2,
            &self.DIVQ3,
            &self.HSIDiv,
            &self.CSIRC,
            &self.LSEOSC,
        });
        self.LPUART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPUART1Mult,
        });
        self.LPTIM1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE1,
            &self.DIVP2,
            &self.DIVR3,
            &self.LSEOSC,
            &self.LSIRC,
            &self.CKPERSource,
        });
        self.LPTIM1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM1Mult,
        });
        self.LPTIM23Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE4,
            &self.DIVP2,
            &self.DIVR3,
            &self.LSEOSC,
            &self.LSIRC,
            &self.CKPERSource,
        });
        self.LPTIM23output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM23Mult,
        });
        self.LPTIM45Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE4,
            &self.DIVP2,
            &self.DIVR3,
            &self.LSEOSC,
            &self.LSIRC,
            &self.CKPERSource,
        });
        self.LPTIM45output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM45Mult,
        });
        self.SPI6Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE4,
            &self.DIVQ2,
            &self.DIVQ3,
            &self.HSIDiv,
            &self.CSIRC,
            &self.HSEOSC,
        });
        self.SPI6output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI6Mult,
        });
        self.SPI45Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PPRE2,
            &self.DIVQ2,
            &self.DIVQ3,
            &self.HSIDiv,
            &self.CSIRC,
            &self.HSEOSC,
        });
        self.SPI45output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI45Mult,
        });
        self.HSEUSBPHYDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.USBPHYCLKMux.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
            &self.HSEUSBPHYDevisor,
            &self.DIVQ3,
        });
        self.USBPHYCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBPHYCLKMux,
        });
        self.USBPHYRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.USBPHYRC60.parents = try alloc.dupe(*const ClockNode, &.{});
        self.USBOCLKMux.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RC48,
            &self.DIVQ3,
            &self.HSEOSC,
            &self.USBPHYRC,
        });
        self.USBOFSCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBOCLKMux,
        });
        self.RNGOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RC48,
        });
        self.DTSOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
        });
        self.FDCANMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
            &self.DIVQ1,
            &self.DIVP2,
        });
        self.FDCANoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FDCANMult,
        });
        self.XSPI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHB5Output,
            &self.DIVS2,
            &self.DIVT2,
        });
        self.XSPI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.XSPI1Mult,
        });
        self.PSSIMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVR3,
            &self.CKPERSource,
        });
        self.PSSIoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PSSIMult,
        });
        self.XSPI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHB5Output,
            &self.DIVS2,
            &self.DIVT2,
        });
        self.XSPI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.XSPI2Mult,
        });
        self.ETHPHYMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
            &self.DIVS3,
        });
        self.ETHPHYoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ETHPHYMult,
        });
        self.ETH1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.Dig_CKIN,
            &self.HSEOSC,
            &self.ETHPHYMult,
        });
        self.ETH1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ETH1Mult,
        });
        self.ADCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DIVP2,
            &self.DIVR3,
            &self.CKPERSource,
        });
        self.ADCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCMult,
        });
        self.CECMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.LSIRC,
            &self.CSICECDevisor,
        });
        self.CECoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CECMult,
        });
        self.CSICECDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CSIRC,
        });
    }
    pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
        alloc.free(self.HSIRC.parents.?);
        alloc.free(self.HSIDiv.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.CSIRC.parents.?);
        alloc.free(self.RC48.parents.?);
        alloc.free(self.I2S_CKIN.parents.?);
        alloc.free(self.Dig_CKIN.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.MCO1Mult.parents.?);
        alloc.free(self.MCO1Div.parents.?);
        alloc.free(self.MCO1Pin.parents.?);
        alloc.free(self.MCO2Mult.parents.?);
        alloc.free(self.MCO2Div.parents.?);
        alloc.free(self.MCO2Pin.parents.?);
        alloc.free(self.CPRE.parents.?);
        alloc.free(self.CPREOutput.parents.?);
        alloc.free(self.TPIUPrescaler.parents.?);
        alloc.free(self.TPIUOutput.parents.?);
        alloc.free(self.CpuClockOutput.parents.?);
        alloc.free(self.CortexPrescaler.parents.?);
        alloc.free(self.CortexSysOutput.parents.?);
        alloc.free(self.BMPRE.parents.?);
        alloc.free(self.AHBOutput.parents.?);
        alloc.free(self.AXIClockOutput.parents.?);
        alloc.free(self.AHB5Output.parents.?);
        alloc.free(self.PPRE5.parents.?);
        alloc.free(self.APB5Output.parents.?);
        alloc.free(self.AHB1234Output.parents.?);
        alloc.free(self.PPRE1.parents.?);
        alloc.free(self.APB1Output.parents.?);
        alloc.free(self.Tim1Mul.parents.?);
        alloc.free(self.Tim1Output.parents.?);
        alloc.free(self.PPRE2.parents.?);
        alloc.free(self.APB2Output.parents.?);
        alloc.free(self.Tim2Mul.parents.?);
        alloc.free(self.Tim2Output.parents.?);
        alloc.free(self.PPRE4.parents.?);
        alloc.free(self.APB4Output.parents.?);
        alloc.free(self.PLLSource.parents.?);
        alloc.free(self.CKPERSource.parents.?);
        alloc.free(self.CKPERoutput.parents.?);
        alloc.free(self.DIVM1.parents.?);
        alloc.free(self.DIVM2.parents.?);
        alloc.free(self.DIVM3.parents.?);
        alloc.free(self.DIVN1.parents.?);
        alloc.free(self.PLLFRACN.parents.?);
        alloc.free(self.DIVP1.parents.?);
        alloc.free(self.DIVQ1.parents.?);
        alloc.free(self.DIVQ1output.parents.?);
        alloc.free(self.DIVR1.parents.?);
        alloc.free(self.DIVR1output.parents.?);
        alloc.free(self.DIVS1.parents.?);
        alloc.free(self.DIVS1output.parents.?);
        alloc.free(self.DIVT1.parents.?);
        alloc.free(self.DIVT1output.parents.?);
        alloc.free(self.DIVN2.parents.?);
        alloc.free(self.PLL2FRACN.parents.?);
        alloc.free(self.DIVP2.parents.?);
        alloc.free(self.DIVP2output.parents.?);
        alloc.free(self.DIVQ2.parents.?);
        alloc.free(self.DIVQ2output.parents.?);
        alloc.free(self.DIVR2.parents.?);
        alloc.free(self.DIVR2output.parents.?);
        alloc.free(self.DIVS2.parents.?);
        alloc.free(self.DIVS2output.parents.?);
        alloc.free(self.DIVT2.parents.?);
        alloc.free(self.DIVT2output.parents.?);
        alloc.free(self.DIVN3.parents.?);
        alloc.free(self.PLL3FRACN.parents.?);
        alloc.free(self.DIVP3.parents.?);
        alloc.free(self.DIVP3output.parents.?);
        alloc.free(self.DIVQ3.parents.?);
        alloc.free(self.DIVQ3output.parents.?);
        alloc.free(self.DIVR3.parents.?);
        alloc.free(self.DIVR3output.parents.?);
        alloc.free(self.DIVS3.parents.?);
        alloc.free(self.DIVS3output.parents.?);
        alloc.free(self.DIVT3.parents.?);
        alloc.free(self.DIVT3output.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.UCPDoutput.parents.?);
        alloc.free(self.HSI_DIV.parents.?);
        alloc.free(self.SPI1Mult.parents.?);
        alloc.free(self.SPI1output.parents.?);
        alloc.free(self.SPI23Mult.parents.?);
        alloc.free(self.SPI23output.parents.?);
        alloc.free(self.SAI1Mult.parents.?);
        alloc.free(self.SAI1output.parents.?);
        alloc.free(self.SAI2Mult.parents.?);
        alloc.free(self.SAI2output.parents.?);
        alloc.free(self.I2C1Mult.parents.?);
        alloc.free(self.I2C1output.parents.?);
        alloc.free(self.I2C23Mult.parents.?);
        alloc.free(self.I2C23output.parents.?);
        alloc.free(self.SPDIFMult.parents.?);
        alloc.free(self.SPDIFoutput.parents.?);
        alloc.free(self.LTDCOutput.parents.?);
        alloc.free(self.FMCMult.parents.?);
        alloc.free(self.FMCoutput.parents.?);
        alloc.free(self.SDMMCMult.parents.?);
        alloc.free(self.SDMMCoutput.parents.?);
        alloc.free(self.USART1Mult.parents.?);
        alloc.free(self.USART1output.parents.?);
        alloc.free(self.ADFMult.parents.?);
        alloc.free(self.ADFoutput.parents.?);
        alloc.free(self.USART234578Mult.parents.?);
        alloc.free(self.USART234578output.parents.?);
        alloc.free(self.LPUART1Mult.parents.?);
        alloc.free(self.LPUART1output.parents.?);
        alloc.free(self.LPTIM1Mult.parents.?);
        alloc.free(self.LPTIM1output.parents.?);
        alloc.free(self.LPTIM23Mult.parents.?);
        alloc.free(self.LPTIM23output.parents.?);
        alloc.free(self.LPTIM45Mult.parents.?);
        alloc.free(self.LPTIM45output.parents.?);
        alloc.free(self.SPI6Mult.parents.?);
        alloc.free(self.SPI6output.parents.?);
        alloc.free(self.SPI45Mult.parents.?);
        alloc.free(self.SPI45output.parents.?);
        alloc.free(self.HSEUSBPHYDevisor.parents.?);
        alloc.free(self.USBPHYCLKMux.parents.?);
        alloc.free(self.USBPHYCLKOutput.parents.?);
        alloc.free(self.USBPHYRC.parents.?);
        alloc.free(self.USBPHYRC60.parents.?);
        alloc.free(self.USBOCLKMux.parents.?);
        alloc.free(self.USBOFSCLKOutput.parents.?);
        alloc.free(self.RNGOutput.parents.?);
        alloc.free(self.DTSOutput.parents.?);
        alloc.free(self.FDCANMult.parents.?);
        alloc.free(self.FDCANoutput.parents.?);
        alloc.free(self.XSPI1Mult.parents.?);
        alloc.free(self.XSPI1output.parents.?);
        alloc.free(self.PSSIMult.parents.?);
        alloc.free(self.PSSIoutput.parents.?);
        alloc.free(self.XSPI2Mult.parents.?);
        alloc.free(self.XSPI2output.parents.?);
        alloc.free(self.ETHPHYMult.parents.?);
        alloc.free(self.ETHPHYoutput.parents.?);
        alloc.free(self.ETH1Mult.parents.?);
        alloc.free(self.ETH1output.parents.?);
        alloc.free(self.ADCMult.parents.?);
        alloc.free(self.ADCoutput.parents.?);
        alloc.free(self.CECMult.parents.?);
        alloc.free(self.CECoutput.parents.?);
        alloc.free(self.CSICECDevisor.parents.?);
    }
    pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        self.HSIRC.nodetype = HSIRCval;
        const HSIDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSIDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.HSIDiv.nodetype = HSIDivval;
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 24000000,
                .limit = .{ .max = @min(1_000_000_000, 50000000), .min = 4000000 },
            },
        };
        self.HSEOSC.nodetype = HSEOSCval;
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSIRC) |val| val.get() else 32000,
                .limit = .{ .max = @min(1_000_000_000, 32600), .min = 31400 },
            },
        };
        self.LSIRC.nodetype = LSIRCval;
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 0 },
            },
        };
        self.LSEOSC.nodetype = LSEOSCval;
        const CSIRCval = ClockNodeTypes{
            .source = .{ .value = 4000000 },
        };
        self.CSIRC.nodetype = CSIRCval;
        const RC48val = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        self.RC48.nodetype = RC48val;
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        self.I2S_CKIN.nodetype = I2S_CKINval;
        const Dig_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        self.Dig_CKIN.nodetype = Dig_CKINval;
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
        const DIVM1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM1) |val| val.get() else 32,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.DIVM1.nodetype = DIVM1val;
        const PLLFRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLLFRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        self.PLLFRACN.nodetype = PLLFRACNval;
        const DIVN1val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN1) |val| val.get() else 128,
                .limit = .{ .max = @min(1_000_000_000, 420), .min = 8 },
            },
        };
        self.DIVN1.nodetype = DIVN1val;
        const DIVP1val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.DIVP1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.DIVP1.nodetype = DIVP1val;
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
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        self.SysCLKOutput.nodetype = SysCLKOutputval;
        const DIVQ1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVQ1.nodetype = DIVQ1val;
        const MCO1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
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
        const MCO1Pinval = ClockNodeTypes{ .output = null };
        self.MCO1Pin.nodetype = MCO1Pinval;
        const DIVM2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM2) |val| val.get() else 32,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.DIVM2.nodetype = DIVM2val;
        const PLL2FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL2FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        self.PLL2FRACN.nodetype = PLL2FRACNval;
        const DIVN2val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN2) |val| val.get() else 128,
                .limit = .{ .max = @min(1_000_000_000, 420), .min = 8 },
            },
        };
        self.DIVN2.nodetype = DIVN2val;
        const DIVP2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVP2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVP2.nodetype = DIVP2val;
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
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        self.MCO2Pin.nodetype = MCO2Pinval;
        const CPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.CPRE.nodetype = CPREval;
        const CPREOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        self.CPREOutput.nodetype = CPREOutputval;
        const TPIUPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TPIUPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        } };
        self.TPIUPrescaler.nodetype = TPIUPrescalerval;
        const TPIUOutputval = ClockNodeTypes{ .output = null };
        self.TPIUOutput.nodetype = TPIUOutputval;
        const CpuClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        self.CpuClockOutput.nodetype = CpuClockOutputval;
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
        const CortexSysOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 600000000), .min = 0 },
        };
        self.CortexSysOutput.nodetype = CortexSysOutputval;
        const BMPREval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.BMPRE) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.BMPRE.nodetype = BMPREval;
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        self.AHBOutput.nodetype = AHBOutputval;
        const AXIClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        self.AXIClockOutput.nodetype = AXIClockOutputval;
        const AHB5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        self.AHB5Output.nodetype = AHB5Outputval;
        const PPRE5val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE5) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PPRE5.nodetype = PPRE5val;
        const APB5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
        };
        self.APB5Output.nodetype = APB5Outputval;
        const AHB1234Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 300000000), .min = 0 },
        };
        self.AHB1234Output.nodetype = AHB1234Outputval;
        const PPRE1val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PPRE1.nodetype = PPRE1val;
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
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
        self.Tim1Mul.nodetype = Tim1Mulval;
        const Tim1Outputval = ClockNodeTypes{ .output = null };
        self.Tim1Output.nodetype = Tim1Outputval;
        const PPRE2val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE2) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PPRE2.nodetype = PPRE2val;
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
        };
        self.APB2Output.nodetype = APB2Outputval;
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
        self.Tim2Mul.nodetype = Tim2Mulval;
        const Tim2Outputval = ClockNodeTypes{ .output = null };
        self.Tim2Output.nodetype = Tim2Outputval;
        const PPRE4val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PPRE4) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PPRE4.nodetype = PPRE4val;
        const APB4Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 150000000), .min = 0 },
        };
        self.APB4Output.nodetype = APB4Outputval;
        const CKPERSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.CKPERSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.CKPERSource.nodetype = CKPERSourceval;
        const CKPERoutputval = ClockNodeTypes{ .output = null };
        self.CKPERoutput.nodetype = CKPERoutputval;
        const DIVM3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVM3) |val| val.get() else 32,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.DIVM3.nodetype = DIVM3val;
        const DIVQ1outputval = ClockNodeTypes{ .output = null };
        self.DIVQ1output.nodetype = DIVQ1outputval;
        const DIVR1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVR1.nodetype = DIVR1val;
        const DIVR1outputval = ClockNodeTypes{ .output = null };
        self.DIVR1output.nodetype = DIVR1outputval;
        const DIVS1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVS1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        self.DIVS1.nodetype = DIVS1val;
        const DIVS1outputval = ClockNodeTypes{ .output = null };
        self.DIVS1output.nodetype = DIVS1outputval;
        const DIVT1val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVT1) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        self.DIVT1.nodetype = DIVT1val;
        const DIVT1outputval = ClockNodeTypes{ .output = null };
        self.DIVT1output.nodetype = DIVT1outputval;
        const DIVP2outputval = ClockNodeTypes{ .output = null };
        self.DIVP2output.nodetype = DIVP2outputval;
        const DIVQ2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVQ2.nodetype = DIVQ2val;
        const DIVQ2outputval = ClockNodeTypes{ .output = null };
        self.DIVQ2output.nodetype = DIVQ2outputval;
        const DIVR2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVR2.nodetype = DIVR2val;
        const DIVR2outputval = ClockNodeTypes{ .output = null };
        self.DIVR2output.nodetype = DIVR2outputval;
        const DIVS2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVS2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        self.DIVS2.nodetype = DIVS2val;
        const DIVS2outputval = ClockNodeTypes{ .output = null };
        self.DIVS2output.nodetype = DIVS2outputval;
        const DIVT2val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVT2) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        self.DIVT2.nodetype = DIVT2val;
        const DIVT2outputval = ClockNodeTypes{ .output = null };
        self.DIVT2output.nodetype = DIVT2outputval;
        const PLL3FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL3FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        self.PLL3FRACN.nodetype = PLL3FRACNval;
        const DIVN3val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.DIVN3) |val| val.get() else 128,
                .limit = .{ .max = @min(1_000_000_000, 420), .min = 12 },
            },
        };
        self.DIVN3.nodetype = DIVN3val;
        const DIVP3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVP3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVP3.nodetype = DIVP3val;
        const DIVP3outputval = ClockNodeTypes{ .output = null };
        self.DIVP3output.nodetype = DIVP3outputval;
        const DIVQ3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVQ3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVQ3.nodetype = DIVQ3val;
        const DIVQ3outputval = ClockNodeTypes{ .output = null };
        self.DIVQ3output.nodetype = DIVQ3outputval;
        const DIVR3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVR3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.DIVR3.nodetype = DIVR3val;
        const DIVR3outputval = ClockNodeTypes{ .output = null };
        self.DIVR3output.nodetype = DIVR3outputval;
        const DIVS3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVS3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        self.DIVS3.nodetype = DIVS3val;
        const DIVS3outputval = ClockNodeTypes{ .output = null };
        self.DIVS3output.nodetype = DIVS3outputval;
        const DIVT3val = ClockNodeTypes{
            .div = .{
                .value = if (config.DIVT3) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 8), .min = 1 },
            },
        };
        self.DIVT3.nodetype = DIVT3val;
        const DIVT3outputval = ClockNodeTypes{ .output = null };
        self.DIVT3output.nodetype = DIVT3outputval;
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
        const HSI_DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSI_DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        } };
        self.HSI_DIV.nodetype = HSI_DIVval;
        const UCPDoutputval = ClockNodeTypes{ .output = null };
        self.UCPDoutput.nodetype = UCPDoutputval;
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI1Mult.nodetype = SPI1Multval;
        const SPI1outputval = ClockNodeTypes{ .output = null };
        self.SPI1output.nodetype = SPI1outputval;
        const SPI23Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI23Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI23Mult.nodetype = SPI23Multval;
        const SPI23outputval = ClockNodeTypes{ .output = null };
        self.SPI23output.nodetype = SPI23outputval;
        const SAI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SAI1Mult.nodetype = SAI1Multval;
        const SAI1outputval = ClockNodeTypes{ .output = null };
        self.SAI1output.nodetype = SAI1outputval;
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
        const SAI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SAI2Mult.nodetype = SAI2Multval;
        const SAI2outputval = ClockNodeTypes{ .output = null };
        self.SAI2output.nodetype = SAI2outputval;
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
        const I2C23Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C23Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C23Mult.nodetype = I2C23Multval;
        const I2C23outputval = ClockNodeTypes{ .output = null };
        self.I2C23output.nodetype = I2C23outputval;
        const SPDIFoutputval = ClockNodeTypes{ .output = null };
        self.SPDIFoutput.nodetype = SPDIFoutputval;
        const LTDCOutputval = ClockNodeTypes{ .output = null };
        self.LTDCOutput.nodetype = LTDCOutputval;
        const FMCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FMCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.FMCMult.nodetype = FMCMultval;
        const FMCoutputval = ClockNodeTypes{ .output = null };
        self.FMCoutput.nodetype = FMCoutputval;
        const SDMMCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SDMMCMult.nodetype = SDMMCMultval;
        const SDMMCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SDMMCoutput.nodetype = SDMMCoutputval;
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
        const ADFMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADFMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ADFMult.nodetype = ADFMultval;
        const ADFoutputval = ClockNodeTypes{ .output = null };
        self.ADFoutput.nodetype = ADFoutputval;
        const USART234578Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART234578Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART234578Mult.nodetype = USART234578Multval;
        const USART234578outputval = ClockNodeTypes{ .output = null };
        self.USART234578output.nodetype = USART234578outputval;
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
        const LPTIM23Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM23Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM23Mult.nodetype = LPTIM23Multval;
        const LPTIM23outputval = ClockNodeTypes{ .output = null };
        self.LPTIM23output.nodetype = LPTIM23outputval;
        const LPTIM45Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM45Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM45Mult.nodetype = LPTIM45Multval;
        const LPTIM45outputval = ClockNodeTypes{ .output = null };
        self.LPTIM45output.nodetype = LPTIM45outputval;
        const SPI6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI6Mult.nodetype = SPI6Multval;
        const SPI6outputval = ClockNodeTypes{ .output = null };
        self.SPI6output.nodetype = SPI6outputval;
        const SPI45Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI45Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI45Mult.nodetype = SPI45Multval;
        const SPI45outputval = ClockNodeTypes{ .output = null };
        self.SPI45output.nodetype = SPI45outputval;
        const HSEUSBPHYDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEUSBPHYDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.HSEUSBPHYDevisor.nodetype = HSEUSBPHYDevisorval;
        const USBPHYCLKMuxval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBPHYCLKMux) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USBPHYCLKMux.nodetype = USBPHYCLKMuxval;
        const USBPHYCLKOutputval = ClockNodeTypes{ .output = null };
        self.USBPHYCLKOutput.nodetype = USBPHYCLKOutputval;
        const USBPHYRCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        self.USBPHYRC.nodetype = USBPHYRCval;
        const USBPHYRC60val = ClockNodeTypes{
            .source = .{ .value = 60000000 },
        };
        self.USBPHYRC60.nodetype = USBPHYRC60val;
        const USBOCLKMuxval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBOCLKMux) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USBOCLKMux.nodetype = USBOCLKMuxval;
        const USBOFSCLKOutputval = ClockNodeTypes{ .output = null };
        self.USBOFSCLKOutput.nodetype = USBOFSCLKOutputval;
        const RNGOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.RNGOutput.nodetype = RNGOutputval;
        const DTSOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 90000000), .min = 0 },
        };
        self.DTSOutput.nodetype = DTSOutputval;
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
        const XSPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.XSPI1Mult.nodetype = XSPI1Multval;
        const XSPI1outputval = ClockNodeTypes{ .output = null };
        self.XSPI1output.nodetype = XSPI1outputval;
        const PSSIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.PSSIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PSSIMult.nodetype = PSSIMultval;
        const PSSIoutputval = ClockNodeTypes{ .output = null };
        self.PSSIoutput.nodetype = PSSIoutputval;
        const XSPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.XSPI2Mult.nodetype = XSPI2Multval;
        const XSPI2outputval = ClockNodeTypes{ .output = null };
        self.XSPI2output.nodetype = XSPI2outputval;
        const ETHPHYMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ETHPHYMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ETHPHYMult.nodetype = ETHPHYMultval;
        const ETHPHYoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 50000000), .min = 25000000 },
        };
        self.ETHPHYoutput.nodetype = ETHPHYoutputval;
        const ETH1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ETH1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ETH1Mult.nodetype = ETH1Multval;
        const ETH1outputval = ClockNodeTypes{ .output = null };
        self.ETH1output.nodetype = ETH1outputval;
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
        const ADCoutputval = ClockNodeTypes{ .output = null };
        self.ADCoutput.nodetype = ADCoutputval;
        const CSICECDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CSICECDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 122;
                }
            },
        } };
        self.CSICECDevisor.nodetype = CSICECDevisorval;
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
    }
};
