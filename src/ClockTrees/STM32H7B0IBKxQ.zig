const std = @import("std");

pub const HSIDivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
        };
    }
};
pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4000000) {
            @compileError("min value for HSEOSC is 4000000\n");
        } else if (val > 50000000) {
            @compileError("min value for HSEOSC is 50000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 50000000;
    }

    pub fn min() comptime_int {
        return 4000000;
    }
};
pub const LSIRCConf = enum(comptime_int) {
    _,
    pub fn get(num: LSIRCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 31400) {
            @compileError("min value for LSIRC is 31400\n");
        } else if (val > 32600) {
            @compileError("min value for LSIRC is 32600\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 32600;
    }

    pub fn min() comptime_int {
        return 31400;
    }
};
pub const LSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: LSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for LSEOSC is 0\n");
        } else if (val > 1000000) {
            @compileError("min value for LSEOSC is 1000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 1000000;
    }

    pub fn min() comptime_int {
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
    const this = @This();
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
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
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
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV64,
    DIV128,
    DIV256,
    DIV512,
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV1,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV8 => 8,
        };
    }
};
pub const HPREConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV64,
    DIV128,
    DIV256,
    DIV512,
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
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
pub const DIVM1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVM1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVM1 is 1\n");
        } else if (val > 63) {
            @compileError("min value for DIVM1 is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVM2Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVM2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVM2 is 1\n");
        } else if (val > 63) {
            @compileError("min value for DIVM2 is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVM3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVM3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVM3 is 1\n");
        } else if (val > 63) {
            @compileError("min value for DIVM3 is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVN1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVN1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for DIVN1 is 8\n");
        } else if (val > 420) {
            @compileError("min value for DIVN1 is 420\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 420;
    }

    pub fn min() comptime_int {
        return 8;
    }
};
pub const PLLFRACNConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLFRACNConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLLFRACN is 0\n");
        } else if (val > 8191) {
            @compileError("min value for PLLFRACN is 8191\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8191;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const DIVP1Conf = enum {
    const this = @This();
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
    pub fn get(comptime self: this) comptime_float {
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
pub const DIVQ1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVQ1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVQ1 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVQ1 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVR1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVR1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVR1 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVR1 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVN2Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVN2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for DIVN2 is 8\n");
        } else if (val > 420) {
            @compileError("min value for DIVN2 is 420\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 420;
    }

    pub fn min() comptime_int {
        return 8;
    }
};
pub const PLL2FRACNConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2FRACNConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL2FRACN is 0\n");
        } else if (val > 8191) {
            @compileError("min value for PLL2FRACN is 8191\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8191;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const DIVP2Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVP2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVP2 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVP2 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVQ2Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVQ2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVQ2 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVQ2 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVR2Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVR2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVR2 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVR2 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVN3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVN3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for DIVN3 is 8\n");
        } else if (val > 420) {
            @compileError("min value for DIVN3 is 420\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 420;
    }

    pub fn min() comptime_int {
        return 8;
    }
};
pub const PLL3FRACNConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3FRACNConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL3FRACN is 0\n");
        } else if (val > 8191) {
            @compileError("min value for PLL3FRACN is 8191\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8191;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const DIVP3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVP3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVP3 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVP3 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVQ3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVQ3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVQ3 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVQ3 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVR3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVR3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVR3 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVR3 is 128\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 128;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const HSERTCDevisorConf = enum {
    const this = @This();
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
    pub fn get(comptime self: this) comptime_float {
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

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 64000000;
            }
        };
        const HSIDivType = struct {
            value: HSIDivConf,

            pub fn get(self: *const HSIDivType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSIDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const HSEOSCType = struct {
            value: HSEOSCConf,
            pub fn get(comptime self: HSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const LSIRCType = struct {
            value: LSIRCConf,
            pub fn get(comptime self: LSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const LSEOSCType = struct {
            value: LSEOSCConf,
            pub fn get(comptime self: LSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const CSIRCType = struct {
            pub fn get(_: *const CSIRCType) comptime_int {
                return 4000000;
            }
        };
        const RC48Type = struct {
            pub fn get(_: *const RC48Type) comptime_int {
                return 48000000;
            }
        };
        const I2S_CKINType = struct {
            pub fn get(_: *const I2S_CKINType) comptime_int {
                return 12288000;
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .DIVP1 => DIVP1.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MCO1MultType = struct {
            value: MCO1MultConf,
            pub fn get(comptime self: MCO1MultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIDiv => HSIDiv.get(),
                    .RC48 => RC48.get(),
                    .DIVQ1 => DIVQ1.get(),
                };
            }
        };
        const MCO1DivType = struct {
            value: MCO1DivConf,

            pub fn get(self: *const MCO1DivType) comptime_int {
                if (!@hasDecl(this, "MCO1Mult")) {
                    @compileError("No Input MCO1Mult for MCO1Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCO1Mult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCO1PinType = struct {
            pub fn get(_: *const MCO1PinType) comptime_int {
                return MCO1Div.get();
            }
        };
        const MCO2MultType = struct {
            value: MCO2MultConf,
            pub fn get(comptime self: MCO2MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .DIVP2 => DIVP2.get(),
                    .HSEOSC => HSEOSC.get(),
                    .DIVP1 => DIVP1.get(),
                    .CSIRC => CSIRC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const MCO2DivType = struct {
            value: MCO2DivConf,

            pub fn get(self: *const MCO2DivType) comptime_int {
                if (!@hasDecl(this, "MCO2Mult")) {
                    @compileError("No Input MCO2Mult for MCO2Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCO2Mult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCO2PinType = struct {
            pub fn get(_: *const MCO2PinType) comptime_int {
                return MCO2Div.get();
            }
        };
        const traceClkSourceType = struct {
            value: traceClkSourceConf,
            pub fn get(comptime self: traceClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .DIVR1 => DIVR1.get(),
                };
            }
        };
        const TraceCLKOutputType = struct {
            pub fn get(_: *const TraceCLKOutputType) comptime_int {
                return traceClkSource.get();
            }
        };
        const CDCPREType = struct {
            value: CDCPREConf,

            pub fn get(self: *const CDCPREType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for CDCPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CDCPREOutputType = struct {
            pub fn get(_: *const CDCPREOutputType) comptime_int {
                const from_input = CDCPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CDCPRE on CDCPREOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CDCPRE on CDCPREOutput | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CpuClockOutputType = struct {
            pub fn get(_: *const CpuClockOutputType) comptime_int {
                const from_input = CDCPREOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CDCPREOutput on CpuClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CDCPREOutput on CpuClockOutput | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CortexPrescalerType = struct {
            value: CortexPrescalerConf,

            pub fn get(self: *const CortexPrescalerType) comptime_int {
                if (!@hasDecl(this, "CDCPREOutput")) {
                    @compileError("No Input CDCPREOutput for CortexPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.CDCPREOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                const from_input = CortexPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CortexPrescaler on CortexSysOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CortexPrescaler on CortexSysOutput | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HPREType = struct {
            value: HPREConf,

            pub fn get(self: *const HPREType) comptime_int {
                if (!@hasDecl(this, "CDCPREOutput")) {
                    @compileError("No Input CDCPREOutput for HPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.CDCPREOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = HPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from HPRE on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from HPRE on AHBOutput | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AXIClockOutputType = struct {
            pub fn get(_: *const AXIClockOutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on AXIClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AXIClockOutput | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HCLK3OutputType = struct {
            pub fn get(_: *const HCLK3OutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on HCLK3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on HCLK3Output | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CDPPREType = struct {
            value: CDPPREConf,

            pub fn get(self: *const CDPPREType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for CDPPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB3OutputType = struct {
            pub fn get(_: *const APB3OutputType) comptime_int {
                const from_input = CDPPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CDPPRE on APB3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 140000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CDPPRE on APB3Output | recive {d} max 140000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CDPPRE1Type = struct {
            value: CDPPRE1Conf,

            pub fn get(self: *const CDPPRE1Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for CDPPRE1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const Tim1MulType = struct {
            pub fn get(_: *const Tim1MulType) comptime_int {
                if (!@hasDecl(this, "CDPPRE1")) {
                    @compileError("No Input CDPPRE1 for Tim1Mul\n");
                }
                const from_input = this.CDPPRE1.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim1OutputType = struct {
            pub fn get(_: *const Tim1OutputType) comptime_int {
                return Tim1Mul.get();
            }
        };
        const AHB12OutputType = struct {
            pub fn get(_: *const AHB12OutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on AHB12Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 280000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AHB12Output | recive {d} max 280000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1OutputType = struct {
            pub fn get(_: *const APB1OutputType) comptime_int {
                const from_input = CDPPRE1.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CDPPRE1 on APB1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 140000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CDPPRE1 on APB1Output | recive {d} max 140000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CDPPRE2Type = struct {
            value: CDPPRE2Conf,

            pub fn get(self: *const CDPPRE2Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for CDPPRE2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB2OutputType = struct {
            pub fn get(_: *const APB2OutputType) comptime_int {
                const from_input = CDPPRE2.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CDPPRE2 on APB2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 140000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CDPPRE2 on APB2Output | recive {d} max 140000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const Tim2MulType = struct {
            pub fn get(_: *const Tim2MulType) comptime_int {
                if (!@hasDecl(this, "CDPPRE2")) {
                    @compileError("No Input CDPPRE2 for Tim2Mul\n");
                }
                const from_input = this.CDPPRE2.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim2OutputType = struct {
            pub fn get(_: *const Tim2OutputType) comptime_int {
                return Tim2Mul.get();
            }
        };
        const AHB4OutputType = struct {
            pub fn get(_: *const AHB4OutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const SRDPPREType = struct {
            value: SRDPPREConf,

            pub fn get(self: *const SRDPPREType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for SRDPPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB4OutputType = struct {
            pub fn get(_: *const APB4OutputType) comptime_int {
                const from_input = SRDPPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SRDPPRE on APB4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 140000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SRDPPRE on APB4Output | recive {d} max 140000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const CKPERSourceType = struct {
            value: CKPERSourceConf,
            pub fn get(comptime self: CKPERSourceType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const CKPERoutputType = struct {
            pub fn get(_: *const CKPERoutputType) comptime_int {
                return CKPERSource.get();
            }
        };
        const DIVM1Type = struct {
            value: DIVM1Conf,

            pub fn get(self: *const DIVM1Type) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for DIVM1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVM2Type = struct {
            value: DIVM2Conf,

            pub fn get(self: *const DIVM2Type) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for DIVM2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVM3Type = struct {
            value: DIVM3Conf,

            pub fn get(self: *const DIVM3Type) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for DIVM3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVN1Type = struct {
            value: DIVN1Conf,

            pub fn get(self: *const DIVN1Type) comptime_int {
                if (!@hasDecl(this, "DIVM1")) {
                    @compileError("No Input DIVM1 for DIVN1\n");
                } else if (!@hasDecl(this, "PLLFRACN")) {
                    @compileError("No fractional  value: PLLFRACN for DIVN1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVM1.get());
                const frac: comptime_float = @floatFromInt(this.PLLFRACN.get());
                const max_frac: comptime_float = @floatFromInt(this.PLLFRACN.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLLFRACNType = struct {
            value: PLLFRACNConf,
            pub fn get(comptime self: PLLFRACNType) comptime_int {
                return self.value.get();
            }
        };
        const DIVP1Type = struct {
            value: DIVP1Conf,

            pub fn get(self: *const DIVP1Type) comptime_int {
                if (!@hasDecl(this, "DIVN1")) {
                    @compileError("No Input DIVN1 for DIVP1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const DIVQ1Type = struct {
            value: DIVQ1Conf,

            pub fn get(self: *const DIVQ1Type) comptime_int {
                if (!@hasDecl(this, "DIVN1")) {
                    @compileError("No Input DIVN1 for DIVQ1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVQ1outputType = struct {
            pub fn get(_: *const DIVQ1outputType) comptime_int {
                return DIVQ1.get();
            }
        };
        const DIVR1Type = struct {
            value: DIVR1Conf,

            pub fn get(self: *const DIVR1Type) comptime_int {
                if (!@hasDecl(this, "DIVN1")) {
                    @compileError("No Input DIVN1 for DIVR1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVR1outputType = struct {
            pub fn get(_: *const DIVR1outputType) comptime_int {
                return DIVR1.get();
            }
        };
        const DIVN2Type = struct {
            value: DIVN2Conf,

            pub fn get(self: *const DIVN2Type) comptime_int {
                if (!@hasDecl(this, "DIVM2")) {
                    @compileError("No Input DIVM2 for DIVN2\n");
                } else if (!@hasDecl(this, "PLL2FRACN")) {
                    @compileError("No fractional  value: PLL2FRACN for DIVN2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVM2.get());
                const frac: comptime_float = @floatFromInt(this.PLL2FRACN.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL2FRACN.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL2FRACNType = struct {
            value: PLL2FRACNConf,
            pub fn get(comptime self: PLL2FRACNType) comptime_int {
                return self.value.get();
            }
        };
        const DIVP2Type = struct {
            value: DIVP2Conf,

            pub fn get(self: *const DIVP2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2")) {
                    @compileError("No Input DIVN2 for DIVP2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVP2outputType = struct {
            pub fn get(_: *const DIVP2outputType) comptime_int {
                return DIVP2.get();
            }
        };
        const DIVQ2Type = struct {
            value: DIVQ2Conf,

            pub fn get(self: *const DIVQ2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2")) {
                    @compileError("No Input DIVN2 for DIVQ2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVQ2outputType = struct {
            pub fn get(_: *const DIVQ2outputType) comptime_int {
                return DIVQ2.get();
            }
        };
        const DIVR2Type = struct {
            value: DIVR2Conf,

            pub fn get(self: *const DIVR2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2")) {
                    @compileError("No Input DIVN2 for DIVR2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVR2outputType = struct {
            pub fn get(_: *const DIVR2outputType) comptime_int {
                return DIVR2.get();
            }
        };
        const DIVN3Type = struct {
            value: DIVN3Conf,

            pub fn get(self: *const DIVN3Type) comptime_int {
                if (!@hasDecl(this, "DIVM3")) {
                    @compileError("No Input DIVM3 for DIVN3\n");
                } else if (!@hasDecl(this, "PLL3FRACN")) {
                    @compileError("No fractional  value: PLL3FRACN for DIVN3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVM3.get());
                const frac: comptime_float = @floatFromInt(this.PLL3FRACN.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL3FRACN.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL3FRACNType = struct {
            value: PLL3FRACNConf,
            pub fn get(comptime self: PLL3FRACNType) comptime_int {
                return self.value.get();
            }
        };
        const DIVP3Type = struct {
            value: DIVP3Conf,

            pub fn get(self: *const DIVP3Type) comptime_int {
                if (!@hasDecl(this, "DIVN3")) {
                    @compileError("No Input DIVN3 for DIVP3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVP3outputType = struct {
            pub fn get(_: *const DIVP3outputType) comptime_int {
                return DIVP3.get();
            }
        };
        const DIVQ3Type = struct {
            value: DIVQ3Conf,

            pub fn get(self: *const DIVQ3Type) comptime_int {
                if (!@hasDecl(this, "DIVN3")) {
                    @compileError("No Input DIVN3 for DIVQ3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVQ3outputType = struct {
            pub fn get(_: *const DIVQ3outputType) comptime_int {
                return DIVQ3.get();
            }
        };
        const DIVR3Type = struct {
            value: DIVR3Conf,

            pub fn get(self: *const DIVR3Type) comptime_int {
                if (!@hasDecl(this, "DIVN3")) {
                    @compileError("No Input DIVN3 for DIVR3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const LTDCOutputType = struct {
            pub fn get(_: *const LTDCOutputType) comptime_int {
                return DIVR3.get();
            }
        };
        const DIVR3outputType = struct {
            pub fn get(_: *const DIVR3outputType) comptime_int {
                return DIVR3.get();
            }
        };
        const HSERTCDevisorType = struct {
            value: HSERTCDevisorConf,

            pub fn get(self: *const HSERTCDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSERTCDevisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const RTCClkSourceType = struct {
            value: RTCClkSourceConf,
            pub fn get(comptime self: RTCClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSERTCDevisor => HSERTCDevisor.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const RTCOutputType = struct {
            pub fn get(_: *const RTCOutputType) comptime_int {
                return RTCClkSource.get();
            }
        };
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const DAC1OutputType = struct {
            pub fn get(_: *const DAC1OutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const DAC2OutputType = struct {
            pub fn get(_: *const DAC2OutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const SPI123MultType = struct {
            value: SPI123MultConf,
            pub fn get(comptime self: SPI123MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const SPI123outputType = struct {
            pub fn get(_: *const SPI123outputType) comptime_int {
                return SPI123Mult.get();
            }
        };
        const SAI1MultType = struct {
            value: SAI1MultConf,
            pub fn get(comptime self: SAI1MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const DFSDMACLKoutputType = struct {
            pub fn get(_: *const DFSDMACLKoutputType) comptime_int {
                return SAI1Mult.get();
            }
        };
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                return SAI1Mult.get();
            }
        };
        const SAI2BMultType = struct {
            value: SAI2BMultConf,
            pub fn get(comptime self: SAI2BMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                    .SPDIFMult => SPDIFMult.get(),
                };
            }
        };
        const SAI2BoutputType = struct {
            pub fn get(_: *const SAI2BoutputType) comptime_int {
                return SAI2BMult.get();
            }
        };
        const SAI2AMultType = struct {
            value: SAI2AMultConf,
            pub fn get(comptime self: SAI2AMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                    .SPDIFMult => SPDIFMult.get(),
                };
            }
        };
        const SAI2AoutputType = struct {
            pub fn get(_: *const SAI2AoutputType) comptime_int {
                return SAI2AMult.get();
            }
        };
        const RNGMultType = struct {
            value: RNGMultConf,
            pub fn get(comptime self: RNGMultType) comptime_int {
                return switch (self.value) {
                    .RC48 => RC48.get(),
                    .DIVQ1 => DIVQ1.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                return RNGMult.get();
            }
        };
        const I2C123MultType = struct {
            value: I2C123MultConf,
            pub fn get(comptime self: I2C123MultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE1 => CDPPRE1.get(),
                    .DIVR3 => DIVR3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C123outputType = struct {
            pub fn get(_: *const I2C123outputType) comptime_int {
                return I2C123Mult.get();
            }
        };
        const I2C4MultType = struct {
            value: I2C4MultConf,
            pub fn get(comptime self: I2C4MultType) comptime_int {
                return switch (self.value) {
                    .SRDPPRE => SRDPPRE.get(),
                    .DIVR3 => DIVR3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C4outputType = struct {
            pub fn get(_: *const I2C4outputType) comptime_int {
                return I2C4Mult.get();
            }
        };
        const SPDIFMultType = struct {
            value: SPDIFMultConf,
            pub fn get(comptime self: SPDIFMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVR2 => DIVR2.get(),
                    .DIVR3 => DIVR3.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const SPDIFoutputType = struct {
            pub fn get(_: *const SPDIFoutputType) comptime_int {
                return SPDIFMult.get();
            }
        };
        const QSPIMultType = struct {
            value: QSPIMultConf,
            pub fn get(comptime self: QSPIMultType) comptime_int {
                return switch (self.value) {
                    .HCLK3Output => HCLK3Output.get(),
                    .DIVQ1 => DIVQ1.get(),
                    .DIVR2 => DIVR2.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const QSPIoutputType = struct {
            pub fn get(_: *const QSPIoutputType) comptime_int {
                return QSPIMult.get();
            }
        };
        const FMCMultType = struct {
            value: FMCMultConf,
            pub fn get(comptime self: FMCMultType) comptime_int {
                return switch (self.value) {
                    .HCLK3Output => HCLK3Output.get(),
                    .DIVQ1 => DIVQ1.get(),
                    .DIVR2 => DIVR2.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const FMCoutputType = struct {
            pub fn get(_: *const FMCoutputType) comptime_int {
                return FMCMult.get();
            }
        };
        const SWPMultType = struct {
            value: SWPMultConf,
            pub fn get(comptime self: SWPMultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE1 => CDPPRE1.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const SWPoutputType = struct {
            pub fn get(_: *const SWPoutputType) comptime_int {
                return SWPMult.get();
            }
        };
        const SDMMCMultType = struct {
            value: SDMMCMultConf,
            pub fn get(comptime self: SDMMCMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVR2 => DIVR2.get(),
                };
            }
        };
        const SDMMCoutputType = struct {
            pub fn get(_: *const SDMMCoutputType) comptime_int {
                return SDMMCMult.get();
            }
        };
        const DFSDMMultType = struct {
            value: DFSDMMultConf,
            pub fn get(comptime self: DFSDMMultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE2 => CDPPRE2.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const DFSDMoutputType = struct {
            pub fn get(_: *const DFSDMoutputType) comptime_int {
                return DFSDMMult.get();
            }
        };
        const DFSDM2MultType = struct {
            value: DFSDM2MultConf,
            pub fn get(comptime self: DFSDM2MultType) comptime_int {
                return switch (self.value) {
                    .SRDPPRE => SRDPPRE.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const DFSDM2outputType = struct {
            pub fn get(_: *const DFSDM2outputType) comptime_int {
                return DFSDM2Mult.get();
            }
        };
        const USART16MultType = struct {
            value: USART16MultConf,
            pub fn get(comptime self: USART16MultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE2 => CDPPRE2.get(),
                    .DIVQ2 => DIVQ2.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART16outputType = struct {
            pub fn get(_: *const USART16outputType) comptime_int {
                return USART16Mult.get();
            }
        };
        const USART234578MultType = struct {
            value: USART234578MultConf,
            pub fn get(comptime self: USART234578MultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE1 => CDPPRE1.get(),
                    .DIVQ2 => DIVQ2.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART234578outputType = struct {
            pub fn get(_: *const USART234578outputType) comptime_int {
                return USART234578Mult.get();
            }
        };
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE => CDPPRE.get(),
                    .DIVQ2 => DIVQ2.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPUART1outputType = struct {
            pub fn get(_: *const LPUART1outputType) comptime_int {
                return LPUART1Mult.get();
            }
        };
        const LPTIM1MultType = struct {
            value: LPTIM1MultConf,
            pub fn get(comptime self: LPTIM1MultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE1 => CDPPRE1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVR3 => DIVR3.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const LPTIM1outputType = struct {
            pub fn get(_: *const LPTIM1outputType) comptime_int {
                return LPTIM1Mult.get();
            }
        };
        const LPTIM345MultType = struct {
            value: LPTIM345MultConf,
            pub fn get(comptime self: LPTIM345MultType) comptime_int {
                return switch (self.value) {
                    .SRDPPRE => SRDPPRE.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVR3 => DIVR3.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const LPTIM345outputType = struct {
            pub fn get(_: *const LPTIM345outputType) comptime_int {
                return LPTIM345Mult.get();
            }
        };
        const LPTIM2MultType = struct {
            value: LPTIM2MultConf,
            pub fn get(comptime self: LPTIM2MultType) comptime_int {
                return switch (self.value) {
                    .SRDPPRE => SRDPPRE.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVR3 => DIVR3.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const LPTIM2outputType = struct {
            pub fn get(_: *const LPTIM2outputType) comptime_int {
                return LPTIM2Mult.get();
            }
        };
        const SPI6MultType = struct {
            value: SPI6MultConf,
            pub fn get(comptime self: SPI6MultType) comptime_int {
                return switch (self.value) {
                    .SRDPPRE => SRDPPRE.get(),
                    .DIVQ2 => DIVQ2.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const SPI6outputType = struct {
            pub fn get(_: *const SPI6outputType) comptime_int {
                return SPI6Mult.get();
            }
        };
        const DFSDM2ACLKoutputType = struct {
            pub fn get(_: *const DFSDM2ACLKoutputType) comptime_int {
                return SPI6Mult.get();
            }
        };
        const SPI45MultType = struct {
            value: SPI45MultConf,
            pub fn get(comptime self: SPI45MultType) comptime_int {
                return switch (self.value) {
                    .CDPPRE1 => CDPPRE1.get(),
                    .DIVQ2 => DIVQ2.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const SPI45outputType = struct {
            pub fn get(_: *const SPI45outputType) comptime_int {
                return SPI45Mult.get();
            }
        };
        const USBMultType = struct {
            value: USBMultConf,
            pub fn get(comptime self: USBMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .RC48 => RC48.get(),
                };
            }
        };
        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                const from_input = USBMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USBMult on USBoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USBMult on USBoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FDCANMultType = struct {
            value: FDCANMultConf,
            pub fn get(comptime self: FDCANMultType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .DIVQ1 => DIVQ1.get(),
                    .DIVQ2 => DIVQ2.get(),
                };
            }
        };
        const FDCANoutputType = struct {
            pub fn get(_: *const FDCANoutputType) comptime_int {
                return FDCANMult.get();
            }
        };
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .DIVP2 => DIVP2.get(),
                    .DIVR3 => DIVR3.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                const from_input = ADCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADCMult on ADCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCMult on ADCoutput | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CECMultType = struct {
            value: CECMultConf,
            pub fn get(comptime self: CECMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const CECoutputType = struct {
            pub fn get(_: *const CECoutputType) comptime_int {
                return CECMult.get();
            }
        };
        const HSIRC = HSIRCType{};
        const HSIDiv = HSIDivType{ .value = conf.HSIDiv };
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{ .value = conf.LSIRC };
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const CSIRC = CSIRCType{};
        const RC48 = RC48Type{};
        const I2S_CKIN = I2S_CKINType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const MCO1Mult = MCO1MultType{ .value = conf.MCO1Mult };
        const MCO1Div = MCO1DivType{ .value = conf.MCO1Div };
        pub const MCO1Pin = MCO1PinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const traceClkSource = traceClkSourceType{ .value = conf.traceClkSource };
        pub const TraceCLKOutput = TraceCLKOutputType{};
        const CDCPRE = CDCPREType{ .value = conf.CDCPRE };
        pub const CDCPREOutput = CDCPREOutputType{};
        pub const CpuClockOutput = CpuClockOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        const HPRE = HPREType{ .value = conf.HPRE };
        pub const AHBOutput = AHBOutputType{};
        pub const AXIClockOutput = AXIClockOutputType{};
        pub const HCLK3Output = HCLK3OutputType{};
        const CDPPRE = CDPPREType{ .value = conf.CDPPRE };
        pub const APB3Output = APB3OutputType{};
        const CDPPRE1 = CDPPRE1Type{ .value = conf.CDPPRE1 };
        const Tim1Mul = Tim1MulType{};
        pub const Tim1Output = Tim1OutputType{};
        pub const AHB12Output = AHB12OutputType{};
        pub const APB1Output = APB1OutputType{};
        const CDPPRE2 = CDPPRE2Type{ .value = conf.CDPPRE2 };
        pub const APB2Output = APB2OutputType{};
        const Tim2Mul = Tim2MulType{};
        pub const Tim2Output = Tim2OutputType{};
        pub const AHB4Output = AHB4OutputType{};
        const SRDPPRE = SRDPPREType{ .value = conf.SRDPPRE };
        pub const APB4Output = APB4OutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const CKPERSource = CKPERSourceType{ .value = conf.CKPERSource };
        pub const CKPERoutput = CKPERoutputType{};
        const DIVM1 = DIVM1Type{ .value = conf.DIVM1 };
        const DIVM2 = DIVM2Type{ .value = conf.DIVM2 };
        const DIVM3 = DIVM3Type{ .value = conf.DIVM3 };
        const DIVN1 = DIVN1Type{ .value = conf.DIVN1 };
        const PLLFRACN = PLLFRACNType{ .value = conf.PLLFRACN };
        const DIVP1 = DIVP1Type{ .value = conf.DIVP1 };
        const DIVQ1 = DIVQ1Type{ .value = conf.DIVQ1 };
        pub const DIVQ1output = DIVQ1outputType{};
        const DIVR1 = DIVR1Type{ .value = conf.DIVR1 };
        pub const DIVR1output = DIVR1outputType{};
        const DIVN2 = DIVN2Type{ .value = conf.DIVN2 };
        const PLL2FRACN = PLL2FRACNType{ .value = conf.PLL2FRACN };
        const DIVP2 = DIVP2Type{ .value = conf.DIVP2 };
        pub const DIVP2output = DIVP2outputType{};
        const DIVQ2 = DIVQ2Type{ .value = conf.DIVQ2 };
        pub const DIVQ2output = DIVQ2outputType{};
        const DIVR2 = DIVR2Type{ .value = conf.DIVR2 };
        pub const DIVR2output = DIVR2outputType{};
        const DIVN3 = DIVN3Type{ .value = conf.DIVN3 };
        const PLL3FRACN = PLL3FRACNType{ .value = conf.PLL3FRACN };
        const DIVP3 = DIVP3Type{ .value = conf.DIVP3 };
        pub const DIVP3output = DIVP3outputType{};
        const DIVQ3 = DIVQ3Type{ .value = conf.DIVQ3 };
        pub const DIVQ3output = DIVQ3outputType{};
        const DIVR3 = DIVR3Type{ .value = conf.DIVR3 };
        pub const LTDCOutput = LTDCOutputType{};
        pub const DIVR3output = DIVR3outputType{};
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        pub const DAC1Output = DAC1OutputType{};
        pub const DAC2Output = DAC2OutputType{};
        const SPI123Mult = SPI123MultType{ .value = conf.SPI123Mult };
        pub const SPI123output = SPI123outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const DFSDMACLKoutput = DFSDMACLKoutputType{};
        pub const SAI1output = SAI1outputType{};
        const SAI2BMult = SAI2BMultType{ .value = conf.SAI2BMult };
        pub const SAI2Boutput = SAI2BoutputType{};
        const SAI2AMult = SAI2AMultType{ .value = conf.SAI2AMult };
        pub const SAI2Aoutput = SAI2AoutputType{};
        const RNGMult = RNGMultType{ .value = conf.RNGMult };
        pub const RNGoutput = RNGoutputType{};
        const I2C123Mult = I2C123MultType{ .value = conf.I2C123Mult };
        pub const I2C123output = I2C123outputType{};
        const I2C4Mult = I2C4MultType{ .value = conf.I2C4Mult };
        pub const I2C4output = I2C4outputType{};
        const SPDIFMult = SPDIFMultType{ .value = conf.SPDIFMult };
        pub const SPDIFoutput = SPDIFoutputType{};
        const QSPIMult = QSPIMultType{ .value = conf.QSPIMult };
        pub const QSPIoutput = QSPIoutputType{};
        const FMCMult = FMCMultType{ .value = conf.FMCMult };
        pub const FMCoutput = FMCoutputType{};
        const SWPMult = SWPMultType{ .value = conf.SWPMult };
        pub const SWPoutput = SWPoutputType{};
        const SDMMCMult = SDMMCMultType{ .value = conf.SDMMCMult };
        pub const SDMMCoutput = SDMMCoutputType{};
        const DFSDMMult = DFSDMMultType{ .value = conf.DFSDMMult };
        pub const DFSDMoutput = DFSDMoutputType{};
        const DFSDM2Mult = DFSDM2MultType{ .value = conf.DFSDM2Mult };
        pub const DFSDM2output = DFSDM2outputType{};
        const USART16Mult = USART16MultType{ .value = conf.USART16Mult };
        pub const USART16output = USART16outputType{};
        const USART234578Mult = USART234578MultType{ .value = conf.USART234578Mult };
        pub const USART234578output = USART234578outputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const LPTIM345Mult = LPTIM345MultType{ .value = conf.LPTIM345Mult };
        pub const LPTIM345output = LPTIM345outputType{};
        const LPTIM2Mult = LPTIM2MultType{ .value = conf.LPTIM2Mult };
        pub const LPTIM2output = LPTIM2outputType{};
        const SPI6Mult = SPI6MultType{ .value = conf.SPI6Mult };
        pub const SPI6output = SPI6outputType{};
        pub const DFSDM2ACLKoutput = DFSDM2ACLKoutputType{};
        const SPI45Mult = SPI45MultType{ .value = conf.SPI45Mult };
        pub const SPI45output = SPI45outputType{};
        const USBMult = USBMultType{ .value = conf.USBMult };
        pub const USBoutput = USBoutputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANoutput = FDCANoutputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const CECMult = CECMultType{ .value = conf.CECMult };
        pub const CECoutput = CECoutputType{};

        pub fn validate() void {
            _ = CDCPREOutput.get();
            _ = CpuClockOutput.get();
            _ = CortexSysOutput.get();
            _ = AHBOutput.get();
            _ = AXIClockOutput.get();
            _ = HCLK3Output.get();
            _ = APB3Output.get();
            _ = AHB12Output.get();
            _ = APB1Output.get();
            _ = APB2Output.get();
            _ = AHB4Output.get();
            _ = APB4Output.get();
            _ = LTDCOutput.get();
            _ = SPI123output.get();
            _ = DFSDMACLKoutput.get();
            _ = SAI1output.get();
            _ = SAI2Boutput.get();
            _ = SAI2Aoutput.get();
            _ = RNGoutput.get();
            _ = I2C123output.get();
            _ = I2C4output.get();
            _ = SPDIFoutput.get();
            _ = QSPIoutput.get();
            _ = FMCoutput.get();
            _ = SWPoutput.get();
            _ = SDMMCoutput.get();
            _ = DFSDMoutput.get();
            _ = DFSDM2output.get();
            _ = USART16output.get();
            _ = USART234578output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM345output.get();
            _ = LPTIM2output.get();
            _ = SPI6output.get();
            _ = DFSDM2ACLKoutput.get();
            _ = SPI45output.get();
            _ = USBoutput.get();
            _ = FDCANoutput.get();
            _ = ADCoutput.get();
            _ = CECoutput.get();
        }
    };

    return ClockStruct;
}
