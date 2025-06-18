const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSIDivConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
        };
    }
};
pub const HSEOSCConf = enum(u32) {
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
pub const LSIRCConf = enum(u32) {
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
pub const LSEOSCConf = enum(u32) {
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
pub const SysClkSourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
    DIVP1,
};
pub const MCO1MultConf = enum {
    HSIDiv,
    HSEOSC,
    LSEOSC,
    RC48,
    DIVQ1,
};
pub const MCO1DivConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
        };
    }
};
pub const MCO2MultConf = enum {
    SysCLKOutput,
    DIVP2,
    HSEOSC,
    DIVP1,
    CSIRC,
    LSIRC,
};
pub const MCO2DivConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
        };
    }
};
pub const CPREConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV64,
    DIV128,
    DIV256,
    DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
            .DIV512 => 512,
        };
    }
};
pub const TPIUPrescalerConf = enum {
    DIV3,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV3 => 3,
        };
    }
};
pub const CortexPrescalerConf = enum {
    DIV1,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV8 => 8,
        };
    }
};
pub const BMPREConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV64,
    DIV128,
    DIV256,
    DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
            .DIV512 => 512,
        };
    }
};
pub const PPRE5Conf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const PPRE1Conf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const PPRE2Conf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const PPRE4Conf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const PLLSourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const CKPERSourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const DIVM1Conf = enum(u32) {
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
pub const DIVM2Conf = enum(u32) {
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
pub const DIVM3Conf = enum(u32) {
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
pub const DIVN1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 420;
    }

    pub fn min() f32 {
        return 8;
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
pub const DIVP1Conf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    DIV10,
    DIV12,
    DIV14,
    DIV16,
    DIV18,
    DIV20,
    DIV22,
    DIV24,
    DIV26,
    DIV28,
    DIV30,
    DIV32,
    DIV34,
    DIV36,
    DIV38,
    DIV40,
    DIV42,
    DIV44,
    DIV46,
    DIV48,
    DIV50,
    DIV52,
    DIV54,
    DIV56,
    DIV58,
    DIV60,
    DIV62,
    DIV64,
    DIV66,
    DIV68,
    DIV70,
    DIV72,
    DIV74,
    DIV76,
    DIV78,
    DIV80,
    DIV82,
    DIV84,
    DIV86,
    DIV88,
    DIV90,
    DIV92,
    DIV94,
    DIV96,
    DIV98,
    DIV100,
    DIV102,
    DIV104,
    DIV106,
    DIV108,
    DIV110,
    DIV112,
    DIV114,
    DIV116,
    DIV118,
    DIV120,
    DIV122,
    DIV124,
    DIV126,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
            .DIV10 => 10,
            .DIV12 => 12,
            .DIV14 => 14,
            .DIV16 => 16,
            .DIV18 => 18,
            .DIV20 => 20,
            .DIV22 => 22,
            .DIV24 => 24,
            .DIV26 => 26,
            .DIV28 => 28,
            .DIV30 => 30,
            .DIV32 => 32,
            .DIV34 => 34,
            .DIV36 => 36,
            .DIV38 => 38,
            .DIV40 => 40,
            .DIV42 => 42,
            .DIV44 => 44,
            .DIV46 => 46,
            .DIV48 => 48,
            .DIV50 => 50,
            .DIV52 => 52,
            .DIV54 => 54,
            .DIV56 => 56,
            .DIV58 => 58,
            .DIV60 => 60,
            .DIV62 => 62,
            .DIV64 => 64,
            .DIV66 => 66,
            .DIV68 => 68,
            .DIV70 => 70,
            .DIV72 => 72,
            .DIV74 => 74,
            .DIV76 => 76,
            .DIV78 => 78,
            .DIV80 => 80,
            .DIV82 => 82,
            .DIV84 => 84,
            .DIV86 => 86,
            .DIV88 => 88,
            .DIV90 => 90,
            .DIV92 => 92,
            .DIV94 => 94,
            .DIV96 => 96,
            .DIV98 => 98,
            .DIV100 => 100,
            .DIV102 => 102,
            .DIV104 => 104,
            .DIV106 => 106,
            .DIV108 => 108,
            .DIV110 => 110,
            .DIV112 => 112,
            .DIV114 => 114,
            .DIV116 => 116,
            .DIV118 => 118,
            .DIV120 => 120,
            .DIV122 => 122,
            .DIV124 => 124,
            .DIV126 => 126,
            .DIV128 => 128,
        };
    }
};
pub const DIVQ1Conf = enum(u32) {
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
pub const DIVR1Conf = enum(u32) {
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
pub const DIVS1Conf = enum(u32) {
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
pub const DIVT1Conf = enum(u32) {
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
pub const DIVN2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 420;
    }

    pub fn min() f32 {
        return 8;
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
pub const DIVP2Conf = enum(u32) {
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
pub const DIVQ2Conf = enum(u32) {
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
pub const DIVR2Conf = enum(u32) {
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
pub const DIVS2Conf = enum(u32) {
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
pub const DIVT2Conf = enum(u32) {
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
pub const DIVN3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 420;
    }

    pub fn min() f32 {
        return 12;
    }
};
pub const PLL3FRACNConf = enum(u32) {
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
pub const DIVP3Conf = enum(u32) {
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
pub const DIVQ3Conf = enum(u32) {
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
pub const DIVR3Conf = enum(u32) {
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
pub const DIVS3Conf = enum(u32) {
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
pub const DIVT3Conf = enum(u32) {
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
pub const HSERTCDevisorConf = enum {
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    DIV16,
    DIV17,
    DIV18,
    DIV19,
    DIV20,
    DIV21,
    DIV22,
    DIV23,
    DIV24,
    DIV25,
    DIV26,
    DIV27,
    DIV28,
    DIV29,
    DIV30,
    DIV31,
    DIV32,
    DIV33,
    DIV34,
    DIV35,
    DIV36,
    DIV37,
    DIV38,
    DIV39,
    DIV40,
    DIV41,
    DIV42,
    DIV43,
    DIV44,
    DIV45,
    DIV46,
    DIV47,
    DIV48,
    DIV49,
    DIV50,
    DIV51,
    DIV52,
    DIV53,
    DIV54,
    DIV55,
    DIV56,
    DIV57,
    DIV58,
    DIV59,
    DIV60,
    DIV61,
    DIV62,
    DIV63,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
            .DIV16 => 16,
            .DIV17 => 17,
            .DIV18 => 18,
            .DIV19 => 19,
            .DIV20 => 20,
            .DIV21 => 21,
            .DIV22 => 22,
            .DIV23 => 23,
            .DIV24 => 24,
            .DIV25 => 25,
            .DIV26 => 26,
            .DIV27 => 27,
            .DIV28 => 28,
            .DIV29 => 29,
            .DIV30 => 30,
            .DIV31 => 31,
            .DIV32 => 32,
            .DIV33 => 33,
            .DIV34 => 34,
            .DIV35 => 35,
            .DIV36 => 36,
            .DIV37 => 37,
            .DIV38 => 38,
            .DIV39 => 39,
            .DIV40 => 40,
            .DIV41 => 41,
            .DIV42 => 42,
            .DIV43 => 43,
            .DIV44 => 44,
            .DIV45 => 45,
            .DIV46 => 46,
            .DIV47 => 47,
            .DIV48 => 48,
            .DIV49 => 49,
            .DIV50 => 50,
            .DIV51 => 51,
            .DIV52 => 52,
            .DIV53 => 53,
            .DIV54 => 54,
            .DIV55 => 55,
            .DIV56 => 56,
            .DIV57 => 57,
            .DIV58 => 58,
            .DIV59 => 59,
            .DIV60 => 60,
            .DIV61 => 61,
            .DIV62 => 62,
            .DIV63 => 63,
        };
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const HSI_DIVConf = enum {
    DIV4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV4 => 4,
        };
    }
};
pub const SPI1MultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
};
pub const SPI23MultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
};
pub const SAI1MultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
};
pub const SAI2MultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
    SPDIFMult,
};
pub const I2C1MultConf = enum {
    PPRE1,
    DIVR3,
    HSIDiv,
    CSIRC,
};
pub const I2C23MultConf = enum {
    PPRE1,
    DIVR3,
    HSIDiv,
    CSIRC,
};
pub const SPDIFMultConf = enum {
    DIVQ1,
    DIVR2,
    DIVR3,
    HSIDiv,
};
pub const FMCMultConf = enum {
    AHB5Output,
    DIVQ1,
    DIVR2,
    HSIRC,
};
pub const SDMMCMultConf = enum {
    DIVS2,
    DIVT2,
};
pub const USART1MultConf = enum {
    PPRE2,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const ADFMultConf = enum {
    AHBOutput,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CSIRC,
    HSIDiv,
};
pub const USART234578MultConf = enum {
    PPRE1,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    PPRE4,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    PPRE1,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const LPTIM23MultConf = enum {
    PPRE4,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const LPTIM45MultConf = enum {
    PPRE4,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const SPI6MultConf = enum {
    PPRE4,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const SPI45MultConf = enum {
    PPRE2,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const HSEUSBPHYDevisorConf = enum {
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
        };
    }
};
pub const USBPHYCLKMuxConf = enum {
    HSEOSC,
    HSEUSBPHYDevisor,
    DIVQ3,
};
pub const USBOCLKMuxConf = enum {
    RC48,
    DIVQ3,
    HSEOSC,
    USBPHYRC,
};
pub const FDCANMultConf = enum {
    HSEOSC,
    DIVQ1,
    DIVP2,
};
pub const XSPI1MultConf = enum {
    AHB5Output,
    DIVS2,
    DIVT2,
};
pub const PSSIMultConf = enum {
    DIVR3,
    CKPERSource,
};
pub const XSPI2MultConf = enum {
    AHB5Output,
    DIVS2,
    DIVT2,
};
pub const ETHPHYMultConf = enum {
    HSEOSC,
    DIVS3,
};
pub const ETH1MultConf = enum {
    Dig_CKIN,
    HSEOSC,
    ETHPHYMult,
};
pub const ADCMultConf = enum {
    DIVP2,
    DIVR3,
    CKPERSource,
};
pub const CECMultConf = enum {
    LSEOSC,
    LSIRC,
    CSICECDevisor,
};
pub const CSICECDevisorConf = enum {
    DIV122,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV122 => 122,
        };
    }
};
pub const Config = struct {
    HSIDiv: HSIDivConf = .DIV1,
    HSEOSC: HSEOSCConf = @enumFromInt(24000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIDiv,
    MCO1Mult: MCO1MultConf = .HSIDiv,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    CPRE: CPREConf = .DIV1,
    TPIUPrescaler: TPIUPrescalerConf = .DIV3,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    BMPRE: BMPREConf = .DIV1,
    PPRE5: PPRE5Conf = .DIV1,
    PPRE1: PPRE1Conf = .DIV1,
    PPRE2: PPRE2Conf = .DIV1,
    PPRE4: PPRE4Conf = .DIV1,
    PLLSource: PLLSourceConf = .HSIDiv,
    CKPERSource: CKPERSourceConf = .HSIDiv,
    DIVM1: DIVM1Conf = @enumFromInt(32),
    DIVM2: DIVM2Conf = @enumFromInt(32),
    DIVM3: DIVM3Conf = @enumFromInt(32),
    DIVN1: DIVN1Conf = @enumFromInt(128),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    DIVP1: DIVP1Conf = .DIV2,
    DIVQ1: DIVQ1Conf = @enumFromInt(2),
    DIVR1: DIVR1Conf = @enumFromInt(2),
    DIVS1: DIVS1Conf = @enumFromInt(2),
    DIVT1: DIVT1Conf = @enumFromInt(2),
    DIVN2: DIVN2Conf = @enumFromInt(128),
    PLL2FRACN: PLL2FRACNConf = @enumFromInt(0),
    DIVP2: DIVP2Conf = @enumFromInt(2),
    DIVQ2: DIVQ2Conf = @enumFromInt(2),
    DIVR2: DIVR2Conf = @enumFromInt(2),
    DIVS2: DIVS2Conf = @enumFromInt(2),
    DIVT2: DIVT2Conf = @enumFromInt(2),
    DIVN3: DIVN3Conf = @enumFromInt(128),
    PLL3FRACN: PLL3FRACNConf = @enumFromInt(0),
    DIVP3: DIVP3Conf = @enumFromInt(2),
    DIVQ3: DIVQ3Conf = @enumFromInt(2),
    DIVR3: DIVR3Conf = @enumFromInt(2),
    DIVS3: DIVS3Conf = @enumFromInt(2),
    DIVT3: DIVT3Conf = @enumFromInt(2),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    HSI_DIV: HSI_DIVConf = .DIV4,
    SPI1Mult: SPI1MultConf = .DIVQ1,
    SPI23Mult: SPI23MultConf = .DIVQ1,
    SAI1Mult: SAI1MultConf = .DIVQ1,
    SAI2Mult: SAI2MultConf = .DIVQ1,
    I2C1Mult: I2C1MultConf = .PPRE1,
    I2C23Mult: I2C23MultConf = .PPRE1,
    SPDIFMult: SPDIFMultConf = .DIVQ1,
    FMCMult: FMCMultConf = .AHB5Output,
    SDMMCMult: SDMMCMultConf = .DIVS2,
    USART1Mult: USART1MultConf = .PPRE2,
    ADFMult: ADFMultConf = .AHBOutput,
    USART234578Mult: USART234578MultConf = .PPRE1,
    LPUART1Mult: LPUART1MultConf = .PPRE4,
    LPTIM1Mult: LPTIM1MultConf = .PPRE1,
    LPTIM23Mult: LPTIM23MultConf = .PPRE4,
    LPTIM45Mult: LPTIM45MultConf = .PPRE4,
    SPI6Mult: SPI6MultConf = .PPRE4,
    SPI45Mult: SPI45MultConf = .PPRE2,
    HSEUSBPHYDevisor: HSEUSBPHYDevisorConf = .DIV2,
    USBPHYCLKMux: USBPHYCLKMuxConf = .HSEOSC,
    USBOCLKMux: USBOCLKMuxConf = .RC48,
    FDCANMult: FDCANMultConf = .HSEOSC,
    XSPI1Mult: XSPI1MultConf = .AHB5Output,
    PSSIMult: PSSIMultConf = .DIVR3,
    XSPI2Mult: XSPI2MultConf = .AHB5Output,
    ETHPHYMult: ETHPHYMultConf = .HSEOSC,
    ETH1Mult: ETH1MultConf = .Dig_CKIN,
    ADCMult: ADCMultConf = .DIVP2,
    CECMult: CECMultConf = .LSEOSC,
    CSICECDevisor: CSICECDevisorConf = .DIV122,
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

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 64000000 } },
        };
        const HSIDiv: ClockNode = .{
            .name = "HSIDiv",
            .Nodetype = .{ .div = .{ .value = config.HSIDiv.get() } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 50000000, .min = 4000000 },
            } },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 32600, .min = 31400 },
            } },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 0 },
            } },
        };
        const CSIRC: ClockNode = .{
            .name = "CSIRC",
            .Nodetype = .{ .source = .{ .value = 4000000 } },
        };
        const RC48: ClockNode = .{
            .name = "RC48",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const Dig_CKIN: ClockNode = .{
            .name = "Dig_CKIN",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const DIVM1: ClockNode = .{
            .name = "DIVM1",
            .Nodetype = .{ .div = .{ .value = config.DIVM1.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLLFRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN1: ClockNode = .{
            .name = "DIVN1",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN1.get(), .limit = .{ .max = 420, .min = 8 } } },
            .parents = &[_]*const ClockNode{ &DIVM1, &PLLFRACN },
        };
        const DIVP1: ClockNode = .{
            .name = "DIVP1",
            .Nodetype = .{ .div = .{ .value = config.DIVP1.get() } },
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &DIVP1,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const DIVQ1: ClockNode = .{
            .name = "DIVQ1",
            .Nodetype = .{ .div = .{ .value = config.DIVQ1.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO1Mult) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
                &LSEOSC,
                &RC48,
                &DIVQ1,
            },
        };
        const MCO1Div: ClockNode = .{
            .name = "MCO1Div",
            .Nodetype = .{ .div = .{ .value = config.MCO1Div.get() } },
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const DIVM2: ClockNode = .{
            .name = "DIVM2",
            .Nodetype = .{ .div = .{ .value = config.DIVM2.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLL2FRACN: ClockNode = .{
            .name = "PLL2FRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLL2FRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN2: ClockNode = .{
            .name = "DIVN2",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN2.get(), .limit = .{ .max = 420, .min = 8 } } },
            .parents = &[_]*const ClockNode{ &DIVM2, &PLL2FRACN },
        };
        const DIVP2: ClockNode = .{
            .name = "DIVP2",
            .Nodetype = .{ .div = .{ .value = config.DIVP2.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO2Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &DIVP2,
                &HSEOSC,
                &DIVP1,
                &CSIRC,
                &LSIRC,
            },
        };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .Nodetype = .{ .div = .{ .value = config.MCO2Div.get() } },
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const CPRE: ClockNode = .{
            .name = "CPRE",
            .Nodetype = .{ .div = .{ .value = config.CPRE.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CPREOutput: ClockNode = .{
            .name = "CPREOutput",
            .Nodetype = .{ .output = .{ .max = 600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CPRE},
        };
        const TPIUPrescaler: ClockNode = .{
            .name = "TPIUPrescaler",
            .Nodetype = .{ .div = .{ .value = config.TPIUPrescaler.get() } },
            .parents = &[_]*const ClockNode{&CPREOutput},
        };
        const TPIUOutput: ClockNode = .{
            .name = "TPIUOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TPIUPrescaler},
        };
        const CpuClockOutput: ClockNode = .{
            .name = "CpuClockOutput",
            .Nodetype = .{ .output = .{ .max = 600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CPREOutput},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = config.CortexPrescaler.get() } },
            .parents = &[_]*const ClockNode{&CPREOutput},
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = .{ .max = 600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const BMPRE: ClockNode = .{
            .name = "BMPRE",
            .Nodetype = .{ .div = .{ .value = config.BMPRE.get() } },
            .parents = &[_]*const ClockNode{&CPREOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 300000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&BMPRE},
        };
        const AXIClockOutput: ClockNode = .{
            .name = "AXIClockOutput",
            .Nodetype = .{ .output = .{ .max = 300000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const AHB5Output: ClockNode = .{
            .name = "AHB5Output",
            .Nodetype = .{ .output = .{ .max = 300000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const PPRE5: ClockNode = .{
            .name = "PPRE5",
            .Nodetype = .{ .div = .{ .value = config.PPRE5.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB5Output: ClockNode = .{
            .name = "APB5Output",
            .Nodetype = .{ .output = .{ .max = 150000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&PPRE5},
        };
        const AHB1234Output: ClockNode = .{
            .name = "AHB1234Output",
            .Nodetype = .{ .output = .{ .max = 300000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const PPRE1: ClockNode = .{
            .name = "PPRE1",
            .Nodetype = .{ .div = .{ .value = config.PPRE1.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 150000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&PPRE1},
        };
        const Tim1Mul: ClockNode = .{
            .name = "Tim1Mul",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PPRE1},
        };
        const Tim1Output: ClockNode = .{
            .name = "Tim1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&Tim1Mul},
        };
        const PPRE2: ClockNode = .{
            .name = "PPRE2",
            .Nodetype = .{ .div = .{ .value = config.PPRE2.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 150000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&PPRE2},
        };
        const Tim2Mul: ClockNode = .{
            .name = "Tim2Mul",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PPRE2},
        };
        const Tim2Output: ClockNode = .{
            .name = "Tim2Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&Tim2Mul},
        };
        const PPRE4: ClockNode = .{
            .name = "PPRE4",
            .Nodetype = .{ .div = .{ .value = config.PPRE4.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .Nodetype = .{ .output = .{ .max = 150000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&PPRE4},
        };
        const CKPERSource: ClockNode = .{
            .name = "CKPERSource",

            .Nodetype = .{ .multi = @intFromEnum(config.CKPERSource) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const CKPERoutput: ClockNode = .{
            .name = "CKPERoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CKPERSource},
        };
        const DIVM3: ClockNode = .{
            .name = "DIVM3",
            .Nodetype = .{ .div = .{ .value = config.DIVM3.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const DIVQ1output: ClockNode = .{
            .name = "DIVQ1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVQ1},
        };
        const DIVR1: ClockNode = .{
            .name = "DIVR1",
            .Nodetype = .{ .div = .{ .value = config.DIVR1.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVR1output: ClockNode = .{
            .name = "DIVR1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR1},
        };
        const DIVS1: ClockNode = .{
            .name = "DIVS1",
            .Nodetype = .{ .div = .{ .value = config.DIVS1.get(), .limit = .{ .max = 8, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVS1output: ClockNode = .{
            .name = "DIVS1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVS1},
        };
        const DIVT1: ClockNode = .{
            .name = "DIVT1",
            .Nodetype = .{ .div = .{ .value = config.DIVT1.get(), .limit = .{ .max = 8, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVT1output: ClockNode = .{
            .name = "DIVT1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVT1},
        };
        const DIVP2output: ClockNode = .{
            .name = "DIVP2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVP2},
        };
        const DIVQ2: ClockNode = .{
            .name = "DIVQ2",
            .Nodetype = .{ .div = .{ .value = config.DIVQ2.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVQ2output: ClockNode = .{
            .name = "DIVQ2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVQ2},
        };
        const DIVR2: ClockNode = .{
            .name = "DIVR2",
            .Nodetype = .{ .div = .{ .value = config.DIVR2.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVR2output: ClockNode = .{
            .name = "DIVR2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DIVS2: ClockNode = .{
            .name = "DIVS2",
            .Nodetype = .{ .div = .{ .value = config.DIVS2.get(), .limit = .{ .max = 8, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVS2output: ClockNode = .{
            .name = "DIVS2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVS2},
        };
        const DIVT2: ClockNode = .{
            .name = "DIVT2",
            .Nodetype = .{ .div = .{ .value = config.DIVT2.get(), .limit = .{ .max = 8, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVT2output: ClockNode = .{
            .name = "DIVT2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVT2},
        };
        const PLL3FRACN: ClockNode = .{
            .name = "PLL3FRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLL3FRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN3: ClockNode = .{
            .name = "DIVN3",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN3.get(), .limit = .{ .max = 420, .min = 12 } } },
            .parents = &[_]*const ClockNode{ &DIVM3, &PLL3FRACN },
        };
        const DIVP3: ClockNode = .{
            .name = "DIVP3",
            .Nodetype = .{ .div = .{ .value = config.DIVP3.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVP3output: ClockNode = .{
            .name = "DIVP3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVP3},
        };
        const DIVQ3: ClockNode = .{
            .name = "DIVQ3",
            .Nodetype = .{ .div = .{ .value = config.DIVQ3.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVQ3output: ClockNode = .{
            .name = "DIVQ3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVQ3},
        };
        const DIVR3: ClockNode = .{
            .name = "DIVR3",
            .Nodetype = .{ .div = .{ .value = config.DIVR3.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVR3output: ClockNode = .{
            .name = "DIVR3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR3},
        };
        const DIVS3: ClockNode = .{
            .name = "DIVS3",
            .Nodetype = .{ .div = .{ .value = config.DIVS3.get(), .limit = .{ .max = 8, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVS3output: ClockNode = .{
            .name = "DIVS3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVS3},
        };
        const DIVT3: ClockNode = .{
            .name = "DIVT3",
            .Nodetype = .{ .div = .{ .value = config.DIVT3.get(), .limit = .{ .max = 8, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVT3output: ClockNode = .{
            .name = "DIVT3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVT3},
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSERTCDevisor.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.RTCClkSource) },
            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const HSI_DIV: ClockNode = .{
            .name = "HSI_DIV",
            .Nodetype = .{ .div = .{ .value = config.HSI_DIV.get() } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const UCPDoutput: ClockNode = .{
            .name = "UCPDoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSI_DIV},
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI1Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI23Mult: ClockNode = .{
            .name = "SPI23Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI23Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SPI23output: ClockNode = .{
            .name = "SPI23output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI23Mult},
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SPDIFMult: ClockNode = .{
            .name = "SPDIFMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPDIFMult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVR2,
                &DIVR3,
                &HSIDiv,
            },
        };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI2Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
                &SPDIFMult,
            },
        };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE1,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C23Mult: ClockNode = .{
            .name = "I2C23Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C23Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE1,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C23output: ClockNode = .{
            .name = "I2C23output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C23Mult},
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPDIFMult},
        };
        const LTDCOutput: ClockNode = .{
            .name = "LTDCOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR3},
        };
        const FMCMult: ClockNode = .{
            .name = "FMCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FMCMult) },
            .parents = &[_]*const ClockNode{
                &AHB5Output,
                &DIVQ1,
                &DIVR2,
                &HSIRC,
            },
        };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FMCMult},
        };
        const SDMMCMult: ClockNode = .{
            .name = "SDMMCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMCMult) },
            .parents = &[_]*const ClockNode{
                &DIVS2,
                &DIVT2,
            },
        };
        const SDMMCoutput: ClockNode = .{
            .name = "SDMMCoutput",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMCMult},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE2,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const ADFMult: ClockNode = .{
            .name = "ADFMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADFMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CSIRC,
                &HSIDiv,
            },
        };
        const ADFoutput: ClockNode = .{
            .name = "ADFoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADFMult},
        };
        const USART234578Mult: ClockNode = .{
            .name = "USART234578Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART234578Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE1,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const USART234578output: ClockNode = .{
            .name = "USART234578output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART234578Mult},
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUART1Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM1Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE1,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM23Mult: ClockNode = .{
            .name = "LPTIM23Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM23Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM23output: ClockNode = .{
            .name = "LPTIM23output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM23Mult},
        };
        const LPTIM45Mult: ClockNode = .{
            .name = "LPTIM45Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM45Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM45output: ClockNode = .{
            .name = "LPTIM45output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM45Mult},
        };
        const SPI6Mult: ClockNode = .{
            .name = "SPI6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI6Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE4,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI6Mult},
        };
        const SPI45Mult: ClockNode = .{
            .name = "SPI45Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI45Mult) },
            .parents = &[_]*const ClockNode{
                &PPRE2,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI45output: ClockNode = .{
            .name = "SPI45output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI45Mult},
        };
        const HSEUSBPHYDevisor: ClockNode = .{
            .name = "HSEUSBPHYDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSEUSBPHYDevisor.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const USBPHYCLKMux: ClockNode = .{
            .name = "USBPHYCLKMux",

            .Nodetype = .{ .multi = @intFromEnum(config.USBPHYCLKMux) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &HSEUSBPHYDevisor,
                &DIVQ3,
            },
        };
        const USBPHYCLKOutput: ClockNode = .{
            .name = "USBPHYCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USBPHYCLKMux},
        };
        const USBPHYRC: ClockNode = .{
            .name = "USBPHYRC",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const USBPHYRC60: ClockNode = .{
            .name = "USBPHYRC60",
            .Nodetype = .{ .source = .{ .value = 60000000 } },
        };
        const USBOCLKMux: ClockNode = .{
            .name = "USBOCLKMux",

            .Nodetype = .{ .multi = @intFromEnum(config.USBOCLKMux) },
            .parents = &[_]*const ClockNode{
                &RC48,
                &DIVQ3,
                &HSEOSC,
                &USBPHYRC,
            },
        };
        const USBOFSCLKOutput: ClockNode = .{
            .name = "USBOFSCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USBOCLKMux},
        };
        const RNGOutput: ClockNode = .{
            .name = "RNGOutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RC48},
        };
        const DTSOutput: ClockNode = .{
            .name = "DTSOutput",
            .Nodetype = .{ .output = .{ .max = 90000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LSEOSC},
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FDCANMult) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &DIVQ1,
                &DIVP2,
            },
        };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const XSPI1Mult: ClockNode = .{
            .name = "XSPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.XSPI1Mult) },
            .parents = &[_]*const ClockNode{
                &AHB5Output,
                &DIVS2,
                &DIVT2,
            },
        };
        const XSPI1output: ClockNode = .{
            .name = "XSPI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&XSPI1Mult},
        };
        const PSSIMult: ClockNode = .{
            .name = "PSSIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.PSSIMult) },
            .parents = &[_]*const ClockNode{
                &DIVR3,
                &CKPERSource,
            },
        };
        const PSSIoutput: ClockNode = .{
            .name = "PSSIoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PSSIMult},
        };
        const XSPI2Mult: ClockNode = .{
            .name = "XSPI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.XSPI2Mult) },
            .parents = &[_]*const ClockNode{
                &AHB5Output,
                &DIVS2,
                &DIVT2,
            },
        };
        const XSPI2output: ClockNode = .{
            .name = "XSPI2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&XSPI2Mult},
        };
        const ETHPHYMult: ClockNode = .{
            .name = "ETHPHYMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ETHPHYMult) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &DIVS3,
            },
        };
        const ETHPHYoutput: ClockNode = .{
            .name = "ETHPHYoutput",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 25000000 } },
            .parents = &[_]*const ClockNode{&ETHPHYMult},
        };
        const ETH1Mult: ClockNode = .{
            .name = "ETH1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.ETH1Mult) },
            .parents = &[_]*const ClockNode{
                &Dig_CKIN,
                &HSEOSC,
                &ETHPHYMult,
            },
        };
        const ETH1output: ClockNode = .{
            .name = "ETH1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ETH1Mult},
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &DIVP2,
                &DIVR3,
                &CKPERSource,
            },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const CSICECDevisor: ClockNode = .{
            .name = "CSICECDevisor",
            .Nodetype = .{ .div = .{ .value = config.CSICECDevisor.get() } },
            .parents = &[_]*const ClockNode{&CSIRC},
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CECMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &CSICECDevisor,
            },
        };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CECMult},
        };
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
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.CPREOutput.get_comptime();
        _ = self.TPIUOutput.get_comptime();
        _ = self.CpuClockOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.AXIClockOutput.get_comptime();
        _ = self.AHB5Output.get_comptime();
        _ = self.APB5Output.get_comptime();
        _ = self.AHB1234Output.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.APB4Output.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI23output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C23output.get_comptime();
        _ = self.SPDIFoutput.get_comptime();
        _ = self.LTDCOutput.get_comptime();
        _ = self.FMCoutput.get_comptime();
        _ = self.SDMMCoutput.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.ADFoutput.get_comptime();
        _ = self.USART234578output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM23output.get_comptime();
        _ = self.LPTIM45output.get_comptime();
        _ = self.SPI6output.get_comptime();
        _ = self.SPI45output.get_comptime();
        _ = self.USBPHYCLKOutput.get_comptime();
        _ = self.USBOFSCLKOutput.get_comptime();
        _ = self.FDCANoutput.get_comptime();
        _ = self.XSPI1output.get_comptime();
        _ = self.PSSIoutput.get_comptime();
        _ = self.XSPI2output.get_comptime();
        _ = self.ETHPHYoutput.get_comptime();
        _ = self.ETH1output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.CECoutput.get_comptime();
    }
};
