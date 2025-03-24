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
pub const traceClkSourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
    DIVR1,
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
pub const DSIMultConf = enum {
    DIVQ2,
    DSIPHYPrescaler,
};
pub const DSITXPrescalerConf = enum(comptime_int) {
    _,
    pub fn get(num: DSITXPrescalerConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DSITXPrescaler is 1\n");
        } else if (val > 32) {
            @compileError("min value for DSITXPrescaler is 32\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 32;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLLDSIIDFConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
        };
    }
};
pub const PLLDSINDIVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLDSINDIVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 10) {
            @compileError("min value for PLLDSINDIV is 10\n");
        } else if (val > 125) {
            @compileError("min value for PLLDSINDIV is 125\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 125;
    }

    pub fn min() comptime_int {
        return 10;
    }
};
pub const PLLDSIODFConf = enum {
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
pub const D1CPREConf = enum {
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
pub const D1PPREConf = enum {
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
pub const D2PPRE1Conf = enum {
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
pub const D2PPRE2Conf = enum {
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
pub const D3PPREConf = enum {
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
        if (val < 4) {
            @compileError("min value for DIVN1 is 4\n");
        } else if (val > 512) {
            @compileError("min value for DIVN1 is 512\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 512;
    }

    pub fn min() comptime_int {
        return 4;
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
        if (val < 4) {
            @compileError("min value for DIVN2 is 4\n");
        } else if (val > 512) {
            @compileError("min value for DIVN2 is 512\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 512;
    }

    pub fn min() comptime_int {
        return 4;
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
        if (val < 4) {
            @compileError("min value for DIVN3 is 4\n");
        } else if (val > 512) {
            @compileError("min value for DIVN3 is 512\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 512;
    }

    pub fn min() comptime_int {
        return 4;
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
pub const SAI23MultConf = enum {
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
pub const SAI4BMultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
};
pub const SAI4AMultConf = enum {
    DIVQ1,
    DIVP2,
    DIVP3,
    I2S_CKIN,
    CKPERSource,
};
pub const RNGMultConf = enum {
    RC48,
    DIVQ1,
    LSEOSC,
    LSIRC,
};
pub const I2C123MultConf = enum {
    D2PPRE1,
    DIVR3,
    HSIDiv,
    CSIRC,
};
pub const I2C4MultConf = enum {
    D3PPRE,
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
    D2PPRE1,
    HSIDiv,
};
pub const SDMMCMultConf = enum {
    DIVQ1,
    DIVR2,
};
pub const DFSDMMultConf = enum {
    D2PPRE2,
    SysCLKOutput,
};
pub const USART16MultConf = enum {
    D2PPRE2,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const USART234578MultConf = enum {
    D2PPRE1,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    D1PPRE,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    D2PPRE1,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const LPTIM345MultConf = enum {
    D3PPRE,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const LPTIM2MultConf = enum {
    D3PPRE,
    DIVP2,
    DIVR3,
    LSEOSC,
    LSIRC,
    CKPERSource,
};
pub const SPI6MultConf = enum {
    D3PPRE,
    DIVQ2,
    DIVQ3,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const SPI45MultConf = enum {
    D2PPRE2,
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
pub const HrtimMultConf = enum {
    Tim2Output,
    D1CPRE,
};
pub const Config = struct {
    HSIDiv: HSIDivConf = .DIV1,
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    traceClkSource: traceClkSourceConf = .HSIDiv,
    SysClkSource: SysClkSourceConf = .HSIDiv,
    MCO1Mult: MCO1MultConf = .HSIDiv,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    DSIMult: DSIMultConf = .DSIPHYPrescaler,
    DSITXPrescaler: DSITXPrescalerConf = @enumFromInt(4),
    PLLDSIIDF: PLLDSIIDFConf = .DIV1,
    PLLDSINDIV: PLLDSINDIVConf = @enumFromInt(20),
    PLLDSIODF: PLLDSIODFConf = .DIV1,
    D1CPRE: D1CPREConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    HPRE: HPREConf = .DIV1,
    D1PPRE: D1PPREConf = .DIV1,
    D2PPRE1: D2PPRE1Conf = .DIV1,
    D2PPRE2: D2PPRE2Conf = .DIV1,
    D3PPRE: D3PPREConf = .DIV1,
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
    DIVP3: DIVP3Conf = @enumFromInt(2),
    PLL3FRACN: PLL3FRACNConf = @enumFromInt(0),
    DIVQ3: DIVQ3Conf = @enumFromInt(2),
    DIVR3: DIVR3Conf = @enumFromInt(2),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    SPI123Mult: SPI123MultConf = .DIVQ1,
    SAI23Mult: SAI23MultConf = .DIVQ1,
    SAI1Mult: SAI1MultConf = .DIVQ1,
    SAI4BMult: SAI4BMultConf = .DIVQ1,
    SAI4AMult: SAI4AMultConf = .DIVQ1,
    RNGMult: RNGMultConf = .RC48,
    I2C123Mult: I2C123MultConf = .D2PPRE1,
    I2C4Mult: I2C4MultConf = .D3PPRE,
    SPDIFMult: SPDIFMultConf = .DIVQ1,
    QSPIMult: QSPIMultConf = .HCLK3Output,
    FMCMult: FMCMultConf = .HCLK3Output,
    SWPMult: SWPMultConf = .D2PPRE1,
    SDMMCMult: SDMMCMultConf = .DIVQ1,
    DFSDMMult: DFSDMMultConf = .D2PPRE2,
    USART16Mult: USART16MultConf = .D2PPRE2,
    USART234578Mult: USART234578MultConf = .D2PPRE1,
    LPUART1Mult: LPUART1MultConf = .D1PPRE,
    LPTIM1Mult: LPTIM1MultConf = .D2PPRE1,
    LPTIM345Mult: LPTIM345MultConf = .D3PPRE,
    LPTIM2Mult: LPTIM2MultConf = .D3PPRE,
    SPI6Mult: SPI6MultConf = .D3PPRE,
    SPI45Mult: SPI45MultConf = .D2PPRE2,
    USBMult: USBMultConf = .DIVQ1,
    FDCANMult: FDCANMultConf = .DIVQ1,
    ADCMult: ADCMultConf = .DIVP2,
    CECMult: CECMultConf = .LSIRC,
    HrtimMult: HrtimMultConf = .Tim2Output,
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
                } else if (from_input > 480000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 480000000\n", .{from_input}));
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
        const DSIPHYPrescalerType = struct {
            pub fn get(_: *const DSIPHYPrescalerType) comptime_int {
                if (!@hasDecl(this, "PLLDSIODF")) {
                    @compileError("No Input PLLDSIODF for DSIPHYPrescaler\n");
                }
                const from_input = this.PLLDSIODF.get();
                const div = 8;
                return (from_input / div);
            }
        };

        const DSIMultType = struct {
            value: DSIMultConf,
            pub fn get(comptime self: DSIMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ2 => DIVQ2.get(),
                    .DSIPHYPrescaler => DSIPHYPrescaler.get(),
                };
            }
        };
        const DSIoutputType = struct {
            pub fn get(_: *const DSIoutputType) comptime_int {
                const from_input = DSIMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DSIMult on DSIoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 62000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DSIMult on DSIoutput | recive {d} max 62000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DSITXPrescalerType = struct {
            value: DSITXPrescalerConf,

            pub fn get(self: *const DSITXPrescalerType) comptime_int {
                if (!@hasDecl(this, "DSIMult")) {
                    @compileError("No Input DSIMult for DSITXPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DSIMult.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DSITXCLKEscType = struct {
            pub fn get(_: *const DSITXCLKEscType) comptime_int {
                const from_input = DSITXPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DSITXPrescaler on DSITXCLKEsc | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 20000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DSITXPrescaler on DSITXCLKEsc | recive {d} max 20000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLLDSIIDFType = struct {
            value: PLLDSIIDFConf,

            pub fn get(self: *const PLLDSIIDFType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for PLLDSIIDF\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLDSIMultiplicatorType = struct {
            pub fn get(_: *const PLLDSIMultiplicatorType) comptime_int {
                if (!@hasDecl(this, "PLLDSIIDF")) {
                    @compileError("No Input PLLDSIIDF for PLLDSIMultiplicator\n");
                }
                const from_input = this.PLLDSIIDF.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const PLLDSINDIVType = struct {
            value: PLLDSINDIVConf,

            pub fn get(self: *const PLLDSINDIVType) comptime_int {
                if (!@hasDecl(this, "PLLDSIMultiplicator")) {
                    @compileError("No Input PLLDSIMultiplicator for PLLDSINDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLDSIMultiplicator.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const VCOoutputType = struct {
            pub fn get(_: *const VCOoutputType) comptime_int {
                const from_input = PLLDSINDIV.get();
                if (from_input < 1000000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLDSINDIV on VCOoutput | recive {d} min 1000000000\n", .{from_input}));
                } else if (from_input > 2000000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLDSINDIV on VCOoutput | recive {d} max 2000000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLLDSIDevisorType = struct {
            pub fn get(_: *const PLLDSIDevisorType) comptime_int {
                if (!@hasDecl(this, "VCOoutput")) {
                    @compileError("No Input VCOoutput for PLLDSIDevisor\n");
                }
                const from_input = this.VCOoutput.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const PLLDSIODFType = struct {
            value: PLLDSIODFConf,

            pub fn get(self: *const PLLDSIODFType) comptime_int {
                if (!@hasDecl(this, "PLLDSIDevisor")) {
                    @compileError("No Input PLLDSIDevisor for PLLDSIODF\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLDSIDevisor.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLDSIoutputType = struct {
            pub fn get(_: *const PLLDSIoutputType) comptime_int {
                const from_input = PLLDSIODF.get();
                if (from_input < 62500000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLDSIODF on PLLDSIoutput | recive {d} min 62500000\n", .{from_input}));
                } else if (from_input > 1000000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLDSIODF on PLLDSIoutput | recive {d} max 1000000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const D1CPREType = struct {
            value: D1CPREConf,

            pub fn get(self: *const D1CPREType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for D1CPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const D1CPREOutputType = struct {
            pub fn get(_: *const D1CPREOutputType) comptime_int {
                const from_input = D1CPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from D1CPRE on D1CPREOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 480000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from D1CPRE on D1CPREOutput | recive {d} max 480000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CpuClockOutputType = struct {
            pub fn get(_: *const CpuClockOutputType) comptime_int {
                const from_input = D1CPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from D1CPRE on CpuClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 480000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from D1CPRE on CpuClockOutput | recive {d} max 480000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CortexPrescalerType = struct {
            value: CortexPrescalerConf,

            pub fn get(self: *const CortexPrescalerType) comptime_int {
                if (!@hasDecl(this, "D1CPRE")) {
                    @compileError("No Input D1CPRE for CortexPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.D1CPRE.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                const from_input = CortexPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CortexPrescaler on CortexSysOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 480000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CortexPrescaler on CortexSysOutput | recive {d} max 480000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HPREType = struct {
            value: HPREConf,

            pub fn get(self: *const HPREType) comptime_int {
                if (!@hasDecl(this, "D1CPRE")) {
                    @compileError("No Input D1CPRE for HPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.D1CPRE.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = HPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from HPRE on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 240000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from HPRE on AHBOutput | recive {d} max 240000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AXIClockOutputType = struct {
            pub fn get(_: *const AXIClockOutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on AXIClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 240000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AXIClockOutput | recive {d} max 240000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HCLK3OutputType = struct {
            pub fn get(_: *const HCLK3OutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on HCLK3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 240000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on HCLK3Output | recive {d} max 240000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const D1PPREType = struct {
            value: D1PPREConf,

            pub fn get(self: *const D1PPREType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for D1PPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB3OutputType = struct {
            pub fn get(_: *const APB3OutputType) comptime_int {
                const from_input = D1PPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from D1PPRE on APB3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from D1PPRE on APB3Output | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const D2PPRE1Type = struct {
            value: D2PPRE1Conf,

            pub fn get(self: *const D2PPRE1Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for D2PPRE1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const Tim1MulType = struct {
            pub fn get(_: *const Tim1MulType) comptime_int {
                if (!@hasDecl(this, "D2PPRE1")) {
                    @compileError("No Input D2PPRE1 for Tim1Mul\n");
                }
                const from_input = this.D2PPRE1.get();
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
                } else if (from_input > 240000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AHB12Output | recive {d} max 240000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1OutputType = struct {
            pub fn get(_: *const APB1OutputType) comptime_int {
                const from_input = D2PPRE1.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from D2PPRE1 on APB1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from D2PPRE1 on APB1Output | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const D2PPRE2Type = struct {
            value: D2PPRE2Conf,

            pub fn get(self: *const D2PPRE2Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for D2PPRE2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB2OutputType = struct {
            pub fn get(_: *const APB2OutputType) comptime_int {
                const from_input = D2PPRE2.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from D2PPRE2 on APB2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from D2PPRE2 on APB2Output | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const Tim2MulType = struct {
            pub fn get(_: *const Tim2MulType) comptime_int {
                if (!@hasDecl(this, "D2PPRE2")) {
                    @compileError("No Input D2PPRE2 for Tim2Mul\n");
                }
                const from_input = this.D2PPRE2.get();
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
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on AHB4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 240000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AHB4Output | recive {d} max 240000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const D3PPREType = struct {
            value: D3PPREConf,

            pub fn get(self: *const D3PPREType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for D3PPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB4OutputType = struct {
            pub fn get(_: *const APB4OutputType) comptime_int {
                const from_input = D3PPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from D3PPRE on APB4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from D3PPRE on APB4Output | recive {d} max 120000000\n", .{from_input}));
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

        const PLL3FRACNType = struct {
            value: PLL3FRACNConf,
            pub fn get(comptime self: PLL3FRACNType) comptime_int {
                return self.value.get();
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
                const from_input = DIVR3.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DIVR3 on LTDCOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DIVR3 on LTDCOutput | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = RTCClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RTCClkSource on RTCOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RTCClkSource on RTCOutput | recive {d} max 1000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
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
                const from_input = SPI123Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI123Mult on SPI123output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI123Mult on SPI123output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI23MultType = struct {
            value: SAI23MultConf,
            pub fn get(comptime self: SAI23MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const SAI23outputType = struct {
            pub fn get(_: *const SAI23outputType) comptime_int {
                const from_input = SAI23Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI23Mult on SAI23output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI23Mult on SAI23output | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = SAI1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI1Mult on DFSDMACLKoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 250000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI1Mult on DFSDMACLKoutput | recive {d} max 250000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                const from_input = SAI1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI1Mult on SAI1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI1Mult on SAI1output | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI4BMultType = struct {
            value: SAI4BMultConf,
            pub fn get(comptime self: SAI4BMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const SAI4BoutputType = struct {
            pub fn get(_: *const SAI4BoutputType) comptime_int {
                const from_input = SAI4BMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI4BMult on SAI4Boutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI4BMult on SAI4Boutput | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI4AMultType = struct {
            value: SAI4AMultConf,
            pub fn get(comptime self: SAI4AMultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const SAI4AoutputType = struct {
            pub fn get(_: *const SAI4AoutputType) comptime_int {
                const from_input = SAI4AMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI4AMult on SAI4Aoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI4AMult on SAI4Aoutput | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = RNGMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RNGMult on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 250000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RNGMult on RNGoutput | recive {d} max 250000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const I2C123MultType = struct {
            value: I2C123MultConf,
            pub fn get(comptime self: I2C123MultType) comptime_int {
                return switch (self.value) {
                    .D2PPRE1 => D2PPRE1.get(),
                    .DIVR3 => DIVR3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C123outputType = struct {
            pub fn get(_: *const I2C123outputType) comptime_int {
                const from_input = I2C123Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from I2C123Mult on I2C123output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from I2C123Mult on I2C123output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const I2C4MultType = struct {
            value: I2C4MultConf,
            pub fn get(comptime self: I2C4MultType) comptime_int {
                return switch (self.value) {
                    .D3PPRE => D3PPRE.get(),
                    .DIVR3 => DIVR3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C4outputType = struct {
            pub fn get(_: *const I2C4outputType) comptime_int {
                const from_input = I2C4Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from I2C4Mult on I2C4output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from I2C4Mult on I2C4output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = SPDIFMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPDIFMult on SPDIFoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 250000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPDIFMult on SPDIFoutput | recive {d} max 250000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = QSPIMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from QSPIMult on QSPIoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 250000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from QSPIMult on QSPIoutput | recive {d} max 250000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = FMCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from FMCMult on FMCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 300000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from FMCMult on FMCoutput | recive {d} max 300000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SWPMultType = struct {
            value: SWPMultConf,
            pub fn get(comptime self: SWPMultType) comptime_int {
                return switch (self.value) {
                    .D2PPRE1 => D2PPRE1.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const SWPoutputType = struct {
            pub fn get(_: *const SWPoutputType) comptime_int {
                const from_input = SWPMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SWPMult on SWPoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SWPMult on SWPoutput | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = SDMMCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMCMult on SDMMCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 250000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMCMult on SDMMCoutput | recive {d} max 250000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DFSDMMultType = struct {
            value: DFSDMMultConf,
            pub fn get(comptime self: DFSDMMultType) comptime_int {
                return switch (self.value) {
                    .D2PPRE2 => D2PPRE2.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const DFSDMoutputType = struct {
            pub fn get(_: *const DFSDMoutputType) comptime_int {
                const from_input = DFSDMMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DFSDMMult on DFSDMoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 250000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DFSDMMult on DFSDMoutput | recive {d} max 250000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART16MultType = struct {
            value: USART16MultConf,
            pub fn get(comptime self: USART16MultType) comptime_int {
                return switch (self.value) {
                    .D2PPRE2 => D2PPRE2.get(),
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
                const from_input = USART16Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART16Mult on USART16output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART16Mult on USART16output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART234578MultType = struct {
            value: USART234578MultConf,
            pub fn get(comptime self: USART234578MultType) comptime_int {
                return switch (self.value) {
                    .D2PPRE1 => D2PPRE1.get(),
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
                const from_input = USART234578Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART234578Mult on USART234578output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART234578Mult on USART234578output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .D1PPRE => D1PPRE.get(),
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
                const from_input = LPUART1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPUART1Mult on LPUART1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPUART1Mult on LPUART1output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM1MultType = struct {
            value: LPTIM1MultConf,
            pub fn get(comptime self: LPTIM1MultType) comptime_int {
                return switch (self.value) {
                    .D2PPRE1 => D2PPRE1.get(),
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
                const from_input = LPTIM1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM1Mult on LPTIM1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM1Mult on LPTIM1output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM345MultType = struct {
            value: LPTIM345MultConf,
            pub fn get(comptime self: LPTIM345MultType) comptime_int {
                return switch (self.value) {
                    .D3PPRE => D3PPRE.get(),
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
                const from_input = LPTIM345Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM345Mult on LPTIM345output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM345Mult on LPTIM345output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM2MultType = struct {
            value: LPTIM2MultConf,
            pub fn get(comptime self: LPTIM2MultType) comptime_int {
                return switch (self.value) {
                    .D3PPRE => D3PPRE.get(),
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
                const from_input = LPTIM2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM2Mult on LPTIM2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM2Mult on LPTIM2output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI6MultType = struct {
            value: SPI6MultConf,
            pub fn get(comptime self: SPI6MultType) comptime_int {
                return switch (self.value) {
                    .D3PPRE => D3PPRE.get(),
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
                const from_input = SPI6Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI6Mult on SPI6output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI6Mult on SPI6output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI45MultType = struct {
            value: SPI45MultConf,
            pub fn get(comptime self: SPI45MultType) comptime_int {
                return switch (self.value) {
                    .D2PPRE2 => D2PPRE2.get(),
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
                const from_input = SPI45Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI45Mult on SPI45output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI45Mult on SPI45output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
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
                } else if (from_input > 66000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USBMult on USBoutput | recive {d} max 66000000\n", .{from_input}));
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
                const from_input = FDCANMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from FDCANMult on FDCANoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from FDCANMult on FDCANoutput | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
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
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCMult on ADCoutput | recive {d} max 100000000\n", .{from_input}));
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
        const HrtimMultType = struct {
            value: HrtimMultConf,
            pub fn get(comptime self: HrtimMultType) comptime_int {
                return switch (self.value) {
                    .Tim2Output => Tim2Output.get(),
                    .D1CPRE => D1CPRE.get(),
                };
            }
        };
        const HRTIMoutputType = struct {
            pub fn get(_: *const HRTIMoutputType) comptime_int {
                const from_input = HrtimMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from HrtimMult on HRTIMoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 480000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from HrtimMult on HRTIMoutput | recive {d} max 480000000\n", .{from_input}));
                }
                return from_input;
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
        const traceClkSource = traceClkSourceType{ .value = conf.traceClkSource };
        pub const TraceCLKOutput = TraceCLKOutputType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const MCO1Mult = MCO1MultType{ .value = conf.MCO1Mult };
        const MCO1Div = MCO1DivType{ .value = conf.MCO1Div };
        pub const MCO1Pin = MCO1PinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const DSIPHYPrescaler = DSIPHYPrescalerType{};
        const DSIMult = DSIMultType{ .value = conf.DSIMult };
        pub const DSIoutput = DSIoutputType{};
        const DSITXPrescaler = DSITXPrescalerType{ .value = conf.DSITXPrescaler };
        pub const DSITXCLKEsc = DSITXCLKEscType{};
        const PLLDSIIDF = PLLDSIIDFType{ .value = conf.PLLDSIIDF };
        const PLLDSIMultiplicator = PLLDSIMultiplicatorType{};
        const PLLDSINDIV = PLLDSINDIVType{ .value = conf.PLLDSINDIV };
        pub const VCOoutput = VCOoutputType{};
        const PLLDSIDevisor = PLLDSIDevisorType{};
        const PLLDSIODF = PLLDSIODFType{ .value = conf.PLLDSIODF };
        pub const PLLDSIoutput = PLLDSIoutputType{};
        const D1CPRE = D1CPREType{ .value = conf.D1CPRE };
        pub const D1CPREOutput = D1CPREOutputType{};
        pub const CpuClockOutput = CpuClockOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        const HPRE = HPREType{ .value = conf.HPRE };
        pub const AHBOutput = AHBOutputType{};
        pub const AXIClockOutput = AXIClockOutputType{};
        pub const HCLK3Output = HCLK3OutputType{};
        const D1PPRE = D1PPREType{ .value = conf.D1PPRE };
        pub const APB3Output = APB3OutputType{};
        const D2PPRE1 = D2PPRE1Type{ .value = conf.D2PPRE1 };
        const Tim1Mul = Tim1MulType{};
        pub const Tim1Output = Tim1OutputType{};
        pub const AHB12Output = AHB12OutputType{};
        pub const APB1Output = APB1OutputType{};
        const D2PPRE2 = D2PPRE2Type{ .value = conf.D2PPRE2 };
        pub const APB2Output = APB2OutputType{};
        const Tim2Mul = Tim2MulType{};
        pub const Tim2Output = Tim2OutputType{};
        pub const AHB4Output = AHB4OutputType{};
        const D3PPRE = D3PPREType{ .value = conf.D3PPRE };
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
        const DIVP3 = DIVP3Type{ .value = conf.DIVP3 };
        const PLL3FRACN = PLL3FRACNType{ .value = conf.PLL3FRACN };
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
        const SPI123Mult = SPI123MultType{ .value = conf.SPI123Mult };
        pub const SPI123output = SPI123outputType{};
        const SAI23Mult = SAI23MultType{ .value = conf.SAI23Mult };
        pub const SAI23output = SAI23outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const DFSDMACLKoutput = DFSDMACLKoutputType{};
        pub const SAI1output = SAI1outputType{};
        const SAI4BMult = SAI4BMultType{ .value = conf.SAI4BMult };
        pub const SAI4Boutput = SAI4BoutputType{};
        const SAI4AMult = SAI4AMultType{ .value = conf.SAI4AMult };
        pub const SAI4Aoutput = SAI4AoutputType{};
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
        const HrtimMult = HrtimMultType{ .value = conf.HrtimMult };
        pub const HRTIMoutput = HRTIMoutputType{};

        pub fn validate() void {
            _ = DSIoutput.get();
            _ = DSITXCLKEsc.get();
            _ = D1CPREOutput.get();
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
            _ = SAI23output.get();
            _ = DFSDMACLKoutput.get();
            _ = SAI1output.get();
            _ = SAI4Boutput.get();
            _ = SAI4Aoutput.get();
            _ = RNGoutput.get();
            _ = I2C123output.get();
            _ = I2C4output.get();
            _ = SPDIFoutput.get();
            _ = QSPIoutput.get();
            _ = FMCoutput.get();
            _ = SWPoutput.get();
            _ = SDMMCoutput.get();
            _ = DFSDMoutput.get();
            _ = USART16output.get();
            _ = USART234578output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM345output.get();
            _ = LPTIM2output.get();
            _ = SPI6output.get();
            _ = SPI45output.get();
            _ = USBoutput.get();
            _ = FDCANoutput.get();
            _ = ADCoutput.get();
            _ = CECoutput.get();
            _ = HRTIMoutput.get();
        }
    };

    return ClockStruct;
}
