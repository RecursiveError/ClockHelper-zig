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
    LSEOSC,
    HSEOSC,
    HSIDiv,
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
pub const traceClkSourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
    DIVR1,
};
pub const CDCPREConf = enum {
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
pub const HPREConf = enum {
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
pub const CDPPREConf = enum {
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
pub const CDPPRE1Conf = enum {
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
pub const CDPPRE2Conf = enum {
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
pub const SRDPPREConf = enum {
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
        return 8;
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
pub const SPI123MultConf = enum {
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
pub const SAI2BMultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
    SPDIFMult,
};
pub const SAI2AMultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
    SPDIFMult,
};
pub const RNGMultConf = enum {
    RC48,
    DIVQ1,
    LSEOSC,
    LSIRC,
};
pub const I2C123MultConf = enum {
    CDPPRE1,
    DIVR3,
    HSIDiv,
    CSIRC,
};
pub const I2C4MultConf = enum {
    SRDPPRE,
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
pub const QSPIMultConf = enum {
    HCLK3Output,
    DIVQ1,
    DIVR2,
    CKPERSource,
};
pub const FMCMultConf = enum {
    HCLK3Output,
    DIVQ1,
    DIVR2,
    CKPERSource,
};
pub const SWPMultConf = enum {
    CDPPRE1,
    HSIDiv,
};
pub const SDMMCMultConf = enum {
    DIVQ1,
    DIVR2,
};
pub const DFSDMMultConf = enum {
    CDPPRE2,
    SysCLKOutput,
};
pub const DFSDM2MultConf = enum {
    SRDPPRE,
    SysCLKOutput,
};
pub const USART16MultConf = enum {
    CDPPRE2,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const USART234578MultConf = enum {
    CDPPRE1,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    CDPPRE,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    CDPPRE1,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const LPTIM345MultConf = enum {
    SRDPPRE,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const LPTIM2MultConf = enum {
    SRDPPRE,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const SPI6MultConf = enum {
    SRDPPRE,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const SPI45MultConf = enum {
    CDPPRE1,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const USBMultConf = enum {
    DIVQ1,
    DIVQ3,
    RC48,
};
pub const FDCANMultConf = enum {
    HSEOSC,
    DIVQ1,
    DIVQ2,
};
pub const ADCMultConf = enum {
    DIVP2,
    DIVR3,
    CKPERSource,
};
pub const CECMultConf = enum {
    LSEOSC,
    LSIRC,
    CSIRC,
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
    traceClkSource: traceClkSourceConf = .HSIDiv,
    CDCPRE: CDCPREConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    HPRE: HPREConf = .DIV1,
    CDPPRE: CDPPREConf = .DIV1,
    CDPPRE1: CDPPRE1Conf = .DIV1,
    CDPPRE2: CDPPRE2Conf = .DIV1,
    SRDPPRE: SRDPPREConf = .DIV1,
    PLLSource: PLLSourceConf = .HSIDiv,
    CKPERSource: CKPERSourceConf = .HSIDiv,
    DIVM1: DIVM1Conf = @enumFromInt(32),
    DIVM2: DIVM2Conf = @enumFromInt(32),
    DIVM3: DIVM3Conf = @enumFromInt(32),
    DIVN1: DIVN1Conf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    DIVP1: DIVP1Conf = .DIV2,
    DIVQ1: DIVQ1Conf = @enumFromInt(2),
    DIVR1: DIVR1Conf = @enumFromInt(2),
    DIVN2: DIVN2Conf = @enumFromInt(129),
    PLL2FRACN: PLL2FRACNConf = @enumFromInt(0),
    DIVP2: DIVP2Conf = @enumFromInt(2),
    DIVQ2: DIVQ2Conf = @enumFromInt(2),
    DIVR2: DIVR2Conf = @enumFromInt(2),
    DIVN3: DIVN3Conf = @enumFromInt(129),
    PLL3FRACN: PLL3FRACNConf = @enumFromInt(0),
    DIVP3: DIVP3Conf = @enumFromInt(2),
    DIVQ3: DIVQ3Conf = @enumFromInt(2),
    DIVR3: DIVR3Conf = @enumFromInt(2),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    SPI123Mult: SPI123MultConf = .DIVQ1,
    SAI1Mult: SAI1MultConf = .DIVQ1,
    SAI2BMult: SAI2BMultConf = .DIVQ1,
    SAI2AMult: SAI2AMultConf = .DIVQ1,
    RNGMult: RNGMultConf = .RC48,
    I2C123Mult: I2C123MultConf = .CDPPRE1,
    I2C4Mult: I2C4MultConf = .SRDPPRE,
    SPDIFMult: SPDIFMultConf = .DIVQ1,
    QSPIMult: QSPIMultConf = .HCLK3Output,
    FMCMult: FMCMultConf = .HCLK3Output,
    SWPMult: SWPMultConf = .CDPPRE1,
    SDMMCMult: SDMMCMultConf = .DIVQ1,
    DFSDMMult: DFSDMMultConf = .CDPPRE2,
    DFSDM2Mult: DFSDM2MultConf = .SRDPPRE,
    USART16Mult: USART16MultConf = .CDPPRE2,
    USART234578Mult: USART234578MultConf = .CDPPRE1,
    LPUART1Mult: LPUART1MultConf = .CDPPRE,
    LPTIM1Mult: LPTIM1MultConf = .CDPPRE1,
    LPTIM345Mult: LPTIM345MultConf = .SRDPPRE,
    LPTIM2Mult: LPTIM2MultConf = .SRDPPRE,
    SPI6Mult: SPI6MultConf = .SRDPPRE,
    SPI45Mult: SPI45MultConf = .CDPPRE1,
    USBMult: USBMultConf = .DIVQ1,
    FDCANMult: FDCANMultConf = .DIVQ1,
    ADCMult: ADCMultConf = .DIVP2,
    CECMult: CECMultConf = .LSIRC,
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
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    traceClkSource: ClockNode,
    TraceCLKOutput: ClockNode,
    CDCPRE: ClockNode,
    CDCPREOutput: ClockNode,
    CpuClockOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    HPRE: ClockNode,
    AHBOutput: ClockNode,
    AXIClockOutput: ClockNode,
    HCLK3Output: ClockNode,
    CDPPRE: ClockNode,
    APB3Output: ClockNode,
    CDPPRE1: ClockNode,
    Tim1Mul: ClockNode,
    Tim1Output: ClockNode,
    AHB12Output: ClockNode,
    APB1Output: ClockNode,
    CDPPRE2: ClockNode,
    APB2Output: ClockNode,
    Tim2Mul: ClockNode,
    Tim2Output: ClockNode,
    AHB4Output: ClockNode,
    SRDPPRE: ClockNode,
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
    PLL3FRACN: ClockNode,
    DIVP3: ClockNode,
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
    DAC1Output: ClockNode,
    DAC2Output: ClockNode,
    SPI123Mult: ClockNode,
    SPI123output: ClockNode,
    SAI1Mult: ClockNode,
    DFSDMACLKoutput: ClockNode,
    SAI1output: ClockNode,
    SAI2BMult: ClockNode,
    SAI2Boutput: ClockNode,
    SAI2AMult: ClockNode,
    SAI2Aoutput: ClockNode,
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
    DFSDM2Mult: ClockNode,
    DFSDM2output: ClockNode,
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
    DFSDM2ACLKoutput: ClockNode,
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
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
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
                &LSEOSC,
                &HSEOSC,
                &HSIDiv,
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
        const DIVR1: ClockNode = .{
            .name = "DIVR1",
            .Nodetype = .{ .div = .{ .value = config.DIVR1.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const traceClkSource: ClockNode = .{
            .name = "traceClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.traceClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &DIVR1,
            },
        };
        const TraceCLKOutput: ClockNode = .{
            .name = "TraceCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&traceClkSource},
        };
        const CDCPRE: ClockNode = .{
            .name = "CDCPRE",
            .Nodetype = .{ .div = .{ .value = config.CDCPRE.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CDCPREOutput: ClockNode = .{
            .name = "CDCPREOutput",
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CDCPRE},
        };
        const CpuClockOutput: ClockNode = .{
            .name = "CpuClockOutput",
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CDCPREOutput},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = config.CortexPrescaler.get() } },
            .parents = &[_]*const ClockNode{&CDCPREOutput},
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const HPRE: ClockNode = .{
            .name = "HPRE",
            .Nodetype = .{ .div = .{ .value = config.HPRE.get() } },
            .parents = &[_]*const ClockNode{&CDCPREOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&HPRE},
        };
        const AXIClockOutput: ClockNode = .{
            .name = "AXIClockOutput",
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const HCLK3Output: ClockNode = .{
            .name = "HCLK3Output",
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CDPPRE: ClockNode = .{
            .name = "CDPPRE",
            .Nodetype = .{ .div = .{ .value = config.CDPPRE.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = .{ .output = .{ .max = 140000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CDPPRE},
        };
        const CDPPRE1: ClockNode = .{
            .name = "CDPPRE1",
            .Nodetype = .{ .div = .{ .value = config.CDPPRE1.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const Tim1Mul: ClockNode = .{
            .name = "Tim1Mul",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&CDPPRE1},
        };
        const Tim1Output: ClockNode = .{
            .name = "Tim1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&Tim1Mul},
        };
        const AHB12Output: ClockNode = .{
            .name = "AHB12Output",
            .Nodetype = .{ .output = .{ .max = 280000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 140000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CDPPRE1},
        };
        const CDPPRE2: ClockNode = .{
            .name = "CDPPRE2",
            .Nodetype = .{ .div = .{ .value = config.CDPPRE2.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 140000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CDPPRE2},
        };
        const Tim2Mul: ClockNode = .{
            .name = "Tim2Mul",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&CDPPRE2},
        };
        const Tim2Output: ClockNode = .{
            .name = "Tim2Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&Tim2Mul},
        };
        const AHB4Output: ClockNode = .{
            .name = "AHB4Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const SRDPPRE: ClockNode = .{
            .name = "SRDPPRE",
            .Nodetype = .{ .div = .{ .value = config.SRDPPRE.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .Nodetype = .{ .output = .{ .max = 140000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SRDPPRE},
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
        const DIVR1output: ClockNode = .{
            .name = "DIVR1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR1},
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
        const PLL3FRACN: ClockNode = .{
            .name = "PLL3FRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLL3FRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN3: ClockNode = .{
            .name = "DIVN3",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN3.get(), .limit = .{ .max = 420, .min = 8 } } },
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
        const LTDCOutput: ClockNode = .{
            .name = "LTDCOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR3},
        };
        const DIVR3output: ClockNode = .{
            .name = "DIVR3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR3},
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
        const DAC1Output: ClockNode = .{
            .name = "DAC1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const DAC2Output: ClockNode = .{
            .name = "DAC2Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const SPI123Mult: ClockNode = .{
            .name = "SPI123Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI123Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
            },
        };
        const SPI123output: ClockNode = .{
            .name = "SPI123output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI123Mult},
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
        const DFSDMACLKoutput: ClockNode = .{
            .name = "DFSDMACLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1Mult},
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
        const SAI2BMult: ClockNode = .{
            .name = "SAI2BMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI2BMult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
                &SPDIFMult,
            },
        };
        const SAI2Boutput: ClockNode = .{
            .name = "SAI2Boutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI2BMult},
        };
        const SAI2AMult: ClockNode = .{
            .name = "SAI2AMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI2AMult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVP2,
                &DIVP3,
                &I2S_CKIN,
                &CKPERSource,
                &SPDIFMult,
            },
        };
        const SAI2Aoutput: ClockNode = .{
            .name = "SAI2Aoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI2AMult},
        };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",

            .Nodetype = .{ .multi = @intFromEnum(config.RNGMult) },
            .parents = &[_]*const ClockNode{
                &RC48,
                &DIVQ1,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const I2C123Mult: ClockNode = .{
            .name = "I2C123Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C123Mult) },
            .parents = &[_]*const ClockNode{
                &CDPPRE1,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C123output: ClockNode = .{
            .name = "I2C123output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C123Mult},
        };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C4Mult) },
            .parents = &[_]*const ClockNode{
                &SRDPPRE,
                &DIVR3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPDIFMult},
        };
        const QSPIMult: ClockNode = .{
            .name = "QSPIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.QSPIMult) },
            .parents = &[_]*const ClockNode{
                &HCLK3Output,
                &DIVQ1,
                &DIVR2,
                &CKPERSource,
            },
        };
        const QSPIoutput: ClockNode = .{
            .name = "QSPIoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&QSPIMult},
        };
        const FMCMult: ClockNode = .{
            .name = "FMCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FMCMult) },
            .parents = &[_]*const ClockNode{
                &HCLK3Output,
                &DIVQ1,
                &DIVR2,
                &CKPERSource,
            },
        };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FMCMult},
        };
        const SWPMult: ClockNode = .{
            .name = "SWPMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SWPMult) },
            .parents = &[_]*const ClockNode{
                &CDPPRE1,
                &HSIDiv,
            },
        };
        const SWPoutput: ClockNode = .{
            .name = "SWPoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SWPMult},
        };
        const SDMMCMult: ClockNode = .{
            .name = "SDMMCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMCMult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVR2,
            },
        };
        const SDMMCoutput: ClockNode = .{
            .name = "SDMMCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SDMMCMult},
        };
        const DFSDMMult: ClockNode = .{
            .name = "DFSDMMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DFSDMMult) },
            .parents = &[_]*const ClockNode{
                &CDPPRE2,
                &SysCLKOutput,
            },
        };
        const DFSDMoutput: ClockNode = .{
            .name = "DFSDMoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DFSDMMult},
        };
        const DFSDM2Mult: ClockNode = .{
            .name = "DFSDM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.DFSDM2Mult) },
            .parents = &[_]*const ClockNode{
                &SRDPPRE,
                &SysCLKOutput,
            },
        };
        const DFSDM2output: ClockNode = .{
            .name = "DFSDM2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DFSDM2Mult},
        };
        const USART16Mult: ClockNode = .{
            .name = "USART16Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART16Mult) },
            .parents = &[_]*const ClockNode{
                &CDPPRE2,
                &DIVQ2,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &LSEOSC,
            },
        };
        const USART16output: ClockNode = .{
            .name = "USART16output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART16Mult},
        };
        const USART234578Mult: ClockNode = .{
            .name = "USART234578Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART234578Mult) },
            .parents = &[_]*const ClockNode{
                &CDPPRE1,
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
                &CDPPRE,
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
                &CDPPRE1,
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
        const LPTIM345Mult: ClockNode = .{
            .name = "LPTIM345Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM345Mult) },
            .parents = &[_]*const ClockNode{
                &SRDPPRE,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM345output: ClockNode = .{
            .name = "LPTIM345output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM345Mult},
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM2Mult) },
            .parents = &[_]*const ClockNode{
                &SRDPPRE,
                &DIVP2,
                &DIVR3,
                &LSEOSC,
                &LSIRC,
                &CKPERSource,
            },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const SPI6Mult: ClockNode = .{
            .name = "SPI6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI6Mult) },
            .parents = &[_]*const ClockNode{
                &SRDPPRE,
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
        const DFSDM2ACLKoutput: ClockNode = .{
            .name = "DFSDM2ACLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI6Mult},
        };
        const SPI45Mult: ClockNode = .{
            .name = "SPI45Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI45Mult) },
            .parents = &[_]*const ClockNode{
                &CDPPRE1,
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
        const USBMult: ClockNode = .{
            .name = "USBMult",

            .Nodetype = .{ .multi = @intFromEnum(config.USBMult) },
            .parents = &[_]*const ClockNode{
                &DIVQ1,
                &DIVQ3,
                &RC48,
            },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FDCANMult) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &DIVQ1,
                &DIVQ2,
            },
        };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FDCANMult},
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
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CECMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &CSIRC,
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
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .traceClkSource = traceClkSource,
            .TraceCLKOutput = TraceCLKOutput,
            .CDCPRE = CDCPRE,
            .CDCPREOutput = CDCPREOutput,
            .CpuClockOutput = CpuClockOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .HPRE = HPRE,
            .AHBOutput = AHBOutput,
            .AXIClockOutput = AXIClockOutput,
            .HCLK3Output = HCLK3Output,
            .CDPPRE = CDPPRE,
            .APB3Output = APB3Output,
            .CDPPRE1 = CDPPRE1,
            .Tim1Mul = Tim1Mul,
            .Tim1Output = Tim1Output,
            .AHB12Output = AHB12Output,
            .APB1Output = APB1Output,
            .CDPPRE2 = CDPPRE2,
            .APB2Output = APB2Output,
            .Tim2Mul = Tim2Mul,
            .Tim2Output = Tim2Output,
            .AHB4Output = AHB4Output,
            .SRDPPRE = SRDPPRE,
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
            .PLL3FRACN = PLL3FRACN,
            .DIVP3 = DIVP3,
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
            .DAC1Output = DAC1Output,
            .DAC2Output = DAC2Output,
            .SPI123Mult = SPI123Mult,
            .SPI123output = SPI123output,
            .SAI1Mult = SAI1Mult,
            .DFSDMACLKoutput = DFSDMACLKoutput,
            .SAI1output = SAI1output,
            .SAI2BMult = SAI2BMult,
            .SAI2Boutput = SAI2Boutput,
            .SAI2AMult = SAI2AMult,
            .SAI2Aoutput = SAI2Aoutput,
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
            .DFSDM2Mult = DFSDM2Mult,
            .DFSDM2output = DFSDM2output,
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
            .DFSDM2ACLKoutput = DFSDM2ACLKoutput,
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
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.CDCPREOutput.get_comptime();
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
        _ = self.DFSDMACLKoutput.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI2Boutput.get_comptime();
        _ = self.SAI2Aoutput.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.I2C123output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.SPDIFoutput.get_comptime();
        _ = self.QSPIoutput.get_comptime();
        _ = self.FMCoutput.get_comptime();
        _ = self.SWPoutput.get_comptime();
        _ = self.SDMMCoutput.get_comptime();
        _ = self.DFSDMoutput.get_comptime();
        _ = self.DFSDM2output.get_comptime();
        _ = self.USART16output.get_comptime();
        _ = self.USART234578output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM345output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.SPI6output.get_comptime();
        _ = self.DFSDM2ACLKoutput.get_comptime();
        _ = self.SPI45output.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.FDCANoutput.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.CECoutput.get_comptime();
    }
};
