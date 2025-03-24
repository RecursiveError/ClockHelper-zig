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
    HSIDiv,
    HSEOSC,
    LSEOSC,
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
pub const CPREConf = enum {
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
pub const TPIUPrescalerConf = enum {
    const this = @This();
    DIV3,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV3 => 3,
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
pub const BMPREConf = enum {
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
pub const PPRE5Conf = enum {
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
pub const PPRE1Conf = enum {
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
pub const PPRE2Conf = enum {
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
pub const PPRE4Conf = enum {
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
    pub fn get(comptime self: this) comptime_float {
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
pub const DIVS1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVS1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVS1 is 1\n");
        } else if (val > 8) {
            @compileError("min value for DIVS1 is 8\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVT1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVT1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVT1 is 1\n");
        } else if (val > 8) {
            @compileError("min value for DIVT1 is 8\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8;
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
pub const DIVS2Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVS2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVS2 is 1\n");
        } else if (val > 8) {
            @compileError("min value for DIVS2 is 8\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVT2Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVT2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVT2 is 1\n");
        } else if (val > 8) {
            @compileError("min value for DIVT2 is 8\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVN3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVN3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 12) {
            @compileError("min value for DIVN3 is 12\n");
        } else if (val > 420) {
            @compileError("min value for DIVN3 is 420\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 420;
    }

    pub fn min() comptime_int {
        return 12;
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
pub const DIVS3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVS3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVS3 is 1\n");
        } else if (val > 8) {
            @compileError("min value for DIVS3 is 8\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const DIVT3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVT3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVT3 is 1\n");
        } else if (val > 8) {
            @compileError("min value for DIVT3 is 8\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 8;
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
pub const HSI_DIVConf = enum {
    const this = @This();
    DIV4,
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV2,
    pub fn get(comptime self: this) comptime_float {
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
    const this = @This();
    DIV122,
    pub fn get(comptime self: this) comptime_float {
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
        const Dig_CKINType = struct {
            pub fn get(_: *const Dig_CKINType) comptime_int {
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
                } else if (from_input > 600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MCO1MultType = struct {
            value: MCO1MultConf,
            pub fn get(comptime self: MCO1MultType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .HSEOSC => HSEOSC.get(),
                    .LSEOSC => LSEOSC.get(),
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
        const CPREType = struct {
            value: CPREConf,

            pub fn get(self: *const CPREType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for CPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CPREOutputType = struct {
            pub fn get(_: *const CPREOutputType) comptime_int {
                const from_input = CPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CPRE on CPREOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CPRE on CPREOutput | recive {d} max 600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const TPIUPrescalerType = struct {
            value: TPIUPrescalerConf,

            pub fn get(self: *const TPIUPrescalerType) comptime_int {
                if (!@hasDecl(this, "CPREOutput")) {
                    @compileError("No Input CPREOutput for TPIUPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.CPREOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const TPIUOutputType = struct {
            pub fn get(_: *const TPIUOutputType) comptime_int {
                return TPIUPrescaler.get();
            }
        };
        const CpuClockOutputType = struct {
            pub fn get(_: *const CpuClockOutputType) comptime_int {
                const from_input = CPREOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CPREOutput on CpuClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CPREOutput on CpuClockOutput | recive {d} max 600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CortexPrescalerType = struct {
            value: CortexPrescalerConf,

            pub fn get(self: *const CortexPrescalerType) comptime_int {
                if (!@hasDecl(this, "CPREOutput")) {
                    @compileError("No Input CPREOutput for CortexPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.CPREOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                const from_input = CortexPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CortexPrescaler on CortexSysOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CortexPrescaler on CortexSysOutput | recive {d} max 600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const BMPREType = struct {
            value: BMPREConf,

            pub fn get(self: *const BMPREType) comptime_int {
                if (!@hasDecl(this, "CPREOutput")) {
                    @compileError("No Input CPREOutput for BMPRE\n");
                }
                const from_input: comptime_float = @floatFromInt(this.CPREOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = BMPRE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from BMPRE on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 300000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from BMPRE on AHBOutput | recive {d} max 300000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AXIClockOutputType = struct {
            pub fn get(_: *const AXIClockOutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on AXIClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 300000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AXIClockOutput | recive {d} max 300000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AHB5OutputType = struct {
            pub fn get(_: *const AHB5OutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on AHB5Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 300000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AHB5Output | recive {d} max 300000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PPRE5Type = struct {
            value: PPRE5Conf,

            pub fn get(self: *const PPRE5Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for PPRE5\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB5OutputType = struct {
            pub fn get(_: *const APB5OutputType) comptime_int {
                const from_input = PPRE5.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PPRE5 on APB5Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PPRE5 on APB5Output | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AHB1234OutputType = struct {
            pub fn get(_: *const AHB1234OutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on AHB1234Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 300000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on AHB1234Output | recive {d} max 300000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PPRE1Type = struct {
            value: PPRE1Conf,

            pub fn get(self: *const PPRE1Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for PPRE1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB1OutputType = struct {
            pub fn get(_: *const APB1OutputType) comptime_int {
                const from_input = PPRE1.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PPRE1 on APB1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PPRE1 on APB1Output | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const Tim1MulType = struct {
            pub fn get(_: *const Tim1MulType) comptime_int {
                if (!@hasDecl(this, "PPRE1")) {
                    @compileError("No Input PPRE1 for Tim1Mul\n");
                }
                const from_input = this.PPRE1.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim1OutputType = struct {
            pub fn get(_: *const Tim1OutputType) comptime_int {
                return Tim1Mul.get();
            }
        };
        const PPRE2Type = struct {
            value: PPRE2Conf,

            pub fn get(self: *const PPRE2Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for PPRE2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB2OutputType = struct {
            pub fn get(_: *const APB2OutputType) comptime_int {
                const from_input = PPRE2.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PPRE2 on APB2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PPRE2 on APB2Output | recive {d} max 150000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const Tim2MulType = struct {
            pub fn get(_: *const Tim2MulType) comptime_int {
                if (!@hasDecl(this, "PPRE2")) {
                    @compileError("No Input PPRE2 for Tim2Mul\n");
                }
                const from_input = this.PPRE2.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim2OutputType = struct {
            pub fn get(_: *const Tim2OutputType) comptime_int {
                return Tim2Mul.get();
            }
        };
        const PPRE4Type = struct {
            value: PPRE4Conf,

            pub fn get(self: *const PPRE4Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for PPRE4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB4OutputType = struct {
            pub fn get(_: *const APB4OutputType) comptime_int {
                const from_input = PPRE4.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PPRE4 on APB4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 150000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PPRE4 on APB4Output | recive {d} max 150000000\n", .{from_input}));
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
        const DIVS1Type = struct {
            value: DIVS1Conf,

            pub fn get(self: *const DIVS1Type) comptime_int {
                if (!@hasDecl(this, "DIVN1")) {
                    @compileError("No Input DIVN1 for DIVS1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVS1outputType = struct {
            pub fn get(_: *const DIVS1outputType) comptime_int {
                return DIVS1.get();
            }
        };
        const DIVT1Type = struct {
            value: DIVT1Conf,

            pub fn get(self: *const DIVT1Type) comptime_int {
                if (!@hasDecl(this, "DIVN1")) {
                    @compileError("No Input DIVN1 for DIVT1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVT1outputType = struct {
            pub fn get(_: *const DIVT1outputType) comptime_int {
                return DIVT1.get();
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
        const DIVS2Type = struct {
            value: DIVS2Conf,

            pub fn get(self: *const DIVS2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2")) {
                    @compileError("No Input DIVN2 for DIVS2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVS2outputType = struct {
            pub fn get(_: *const DIVS2outputType) comptime_int {
                return DIVS2.get();
            }
        };
        const DIVT2Type = struct {
            value: DIVT2Conf,

            pub fn get(self: *const DIVT2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2")) {
                    @compileError("No Input DIVN2 for DIVT2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVT2outputType = struct {
            pub fn get(_: *const DIVT2outputType) comptime_int {
                return DIVT2.get();
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

        const DIVR3outputType = struct {
            pub fn get(_: *const DIVR3outputType) comptime_int {
                return DIVR3.get();
            }
        };
        const DIVS3Type = struct {
            value: DIVS3Conf,

            pub fn get(self: *const DIVS3Type) comptime_int {
                if (!@hasDecl(this, "DIVN3")) {
                    @compileError("No Input DIVN3 for DIVS3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVS3outputType = struct {
            pub fn get(_: *const DIVS3outputType) comptime_int {
                return DIVS3.get();
            }
        };
        const DIVT3Type = struct {
            value: DIVT3Conf,

            pub fn get(self: *const DIVT3Type) comptime_int {
                if (!@hasDecl(this, "DIVN3")) {
                    @compileError("No Input DIVN3 for DIVT3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVT3outputType = struct {
            pub fn get(_: *const DIVT3outputType) comptime_int {
                return DIVT3.get();
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
        const UCPDoutputType = struct {
            pub fn get(_: *const UCPDoutputType) comptime_int {
                return HSI_DIV.get();
            }
        };
        const HSI_DIVType = struct {
            value: HSI_DIVConf,

            pub fn get(self: *const HSI_DIVType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSI_DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const SPI1MultType = struct {
            value: SPI1MultConf,
            pub fn get(comptime self: SPI1MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const SPI1outputType = struct {
            pub fn get(_: *const SPI1outputType) comptime_int {
                return SPI1Mult.get();
            }
        };
        const SPI23MultType = struct {
            value: SPI23MultConf,
            pub fn get(comptime self: SPI23MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ1 => DIVQ1.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const SPI23outputType = struct {
            pub fn get(_: *const SPI23outputType) comptime_int {
                return SPI23Mult.get();
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
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                return SAI1Mult.get();
            }
        };
        const SAI2MultType = struct {
            value: SAI2MultConf,
            pub fn get(comptime self: SAI2MultType) comptime_int {
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
        const SAI2outputType = struct {
            pub fn get(_: *const SAI2outputType) comptime_int {
                return SAI2Mult.get();
            }
        };
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .PPRE1 => PPRE1.get(),
                    .DIVR3 => DIVR3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C1outputType = struct {
            pub fn get(_: *const I2C1outputType) comptime_int {
                return I2C1Mult.get();
            }
        };
        const I2C23MultType = struct {
            value: I2C23MultConf,
            pub fn get(comptime self: I2C23MultType) comptime_int {
                return switch (self.value) {
                    .PPRE1 => PPRE1.get(),
                    .DIVR3 => DIVR3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C23outputType = struct {
            pub fn get(_: *const I2C23outputType) comptime_int {
                return I2C23Mult.get();
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
        const LTDCOutputType = struct {
            pub fn get(_: *const LTDCOutputType) comptime_int {
                return DIVR3.get();
            }
        };
        const FMCMultType = struct {
            value: FMCMultConf,
            pub fn get(comptime self: FMCMultType) comptime_int {
                return switch (self.value) {
                    .AHB5Output => AHB5Output.get(),
                    .DIVQ1 => DIVQ1.get(),
                    .DIVR2 => DIVR2.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const FMCoutputType = struct {
            pub fn get(_: *const FMCoutputType) comptime_int {
                return FMCMult.get();
            }
        };
        const SDMMCMultType = struct {
            value: SDMMCMultConf,
            pub fn get(comptime self: SDMMCMultType) comptime_int {
                return switch (self.value) {
                    .DIVS2 => DIVS2.get(),
                    .DIVT2 => DIVT2.get(),
                };
            }
        };
        const SDMMCoutputType = struct {
            pub fn get(_: *const SDMMCoutputType) comptime_int {
                const from_input = SDMMCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMCMult on SDMMCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMCMult on SDMMCoutput | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART1MultType = struct {
            value: USART1MultConf,
            pub fn get(comptime self: USART1MultType) comptime_int {
                return switch (self.value) {
                    .PPRE2 => PPRE2.get(),
                    .DIVQ2 => DIVQ2.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART1outputType = struct {
            pub fn get(_: *const USART1outputType) comptime_int {
                return USART1Mult.get();
            }
        };
        const ADFMultType = struct {
            value: ADFMultConf,
            pub fn get(comptime self: ADFMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVP3 => DIVP3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CSIRC => CSIRC.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const ADFoutputType = struct {
            pub fn get(_: *const ADFoutputType) comptime_int {
                return ADFMult.get();
            }
        };
        const USART234578MultType = struct {
            value: USART234578MultConf,
            pub fn get(comptime self: USART234578MultType) comptime_int {
                return switch (self.value) {
                    .PPRE1 => PPRE1.get(),
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
                    .PPRE4 => PPRE4.get(),
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
                    .PPRE1 => PPRE1.get(),
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
        const LPTIM23MultType = struct {
            value: LPTIM23MultConf,
            pub fn get(comptime self: LPTIM23MultType) comptime_int {
                return switch (self.value) {
                    .PPRE4 => PPRE4.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVR3 => DIVR3.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const LPTIM23outputType = struct {
            pub fn get(_: *const LPTIM23outputType) comptime_int {
                return LPTIM23Mult.get();
            }
        };
        const LPTIM45MultType = struct {
            value: LPTIM45MultConf,
            pub fn get(comptime self: LPTIM45MultType) comptime_int {
                return switch (self.value) {
                    .PPRE4 => PPRE4.get(),
                    .DIVP2 => DIVP2.get(),
                    .DIVR3 => DIVR3.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const LPTIM45outputType = struct {
            pub fn get(_: *const LPTIM45outputType) comptime_int {
                return LPTIM45Mult.get();
            }
        };
        const SPI6MultType = struct {
            value: SPI6MultConf,
            pub fn get(comptime self: SPI6MultType) comptime_int {
                return switch (self.value) {
                    .PPRE4 => PPRE4.get(),
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
        const SPI45MultType = struct {
            value: SPI45MultConf,
            pub fn get(comptime self: SPI45MultType) comptime_int {
                return switch (self.value) {
                    .PPRE2 => PPRE2.get(),
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
        const HSEUSBPHYDevisorType = struct {
            value: HSEUSBPHYDevisorConf,

            pub fn get(self: *const HSEUSBPHYDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSEUSBPHYDevisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const USBPHYCLKMuxType = struct {
            value: USBPHYCLKMuxConf,
            pub fn get(comptime self: USBPHYCLKMuxType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .HSEUSBPHYDevisor => HSEUSBPHYDevisor.get(),
                    .DIVQ3 => DIVQ3.get(),
                };
            }
        };
        const USBPHYCLKOutputType = struct {
            pub fn get(_: *const USBPHYCLKOutputType) comptime_int {
                return USBPHYCLKMux.get();
            }
        };
        const USBPHYRCType = struct {
            pub fn get(_: *const USBPHYRCType) comptime_int {
                return 48000000;
            }
        };
        const USBPHYRC60Type = struct {
            pub fn get(_: *const USBPHYRC60Type) comptime_int {
                return 60000000;
            }
        };
        const USBOCLKMuxType = struct {
            value: USBOCLKMuxConf,
            pub fn get(comptime self: USBOCLKMuxType) comptime_int {
                return switch (self.value) {
                    .RC48 => RC48.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSEOSC => HSEOSC.get(),
                    .USBPHYRC => USBPHYRC.get(),
                };
            }
        };
        const USBOFSCLKOutputType = struct {
            pub fn get(_: *const USBOFSCLKOutputType) comptime_int {
                return USBOCLKMux.get();
            }
        };
        const RNGOutputType = struct {
            pub fn get(_: *const RNGOutputType) comptime_int {
                const from_input = RC48.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RC48 on RNGOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RC48 on RNGOutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DTSOutputType = struct {
            pub fn get(_: *const DTSOutputType) comptime_int {
                const from_input = LSEOSC.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LSEOSC on DTSOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 90000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LSEOSC on DTSOutput | recive {d} max 90000000\n", .{from_input}));
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
                    .DIVP2 => DIVP2.get(),
                };
            }
        };
        const FDCANoutputType = struct {
            pub fn get(_: *const FDCANoutputType) comptime_int {
                return FDCANMult.get();
            }
        };
        const XSPI1MultType = struct {
            value: XSPI1MultConf,
            pub fn get(comptime self: XSPI1MultType) comptime_int {
                return switch (self.value) {
                    .AHB5Output => AHB5Output.get(),
                    .DIVS2 => DIVS2.get(),
                    .DIVT2 => DIVT2.get(),
                };
            }
        };
        const XSPI1outputType = struct {
            pub fn get(_: *const XSPI1outputType) comptime_int {
                return XSPI1Mult.get();
            }
        };
        const PSSIMultType = struct {
            value: PSSIMultConf,
            pub fn get(comptime self: PSSIMultType) comptime_int {
                return switch (self.value) {
                    .DIVR3 => DIVR3.get(),
                    .CKPERSource => CKPERSource.get(),
                };
            }
        };
        const PSSIoutputType = struct {
            pub fn get(_: *const PSSIoutputType) comptime_int {
                return PSSIMult.get();
            }
        };
        const XSPI2MultType = struct {
            value: XSPI2MultConf,
            pub fn get(comptime self: XSPI2MultType) comptime_int {
                return switch (self.value) {
                    .AHB5Output => AHB5Output.get(),
                    .DIVS2 => DIVS2.get(),
                    .DIVT2 => DIVT2.get(),
                };
            }
        };
        const XSPI2outputType = struct {
            pub fn get(_: *const XSPI2outputType) comptime_int {
                return XSPI2Mult.get();
            }
        };
        const ETHPHYMultType = struct {
            value: ETHPHYMultConf,
            pub fn get(comptime self: ETHPHYMultType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .DIVS3 => DIVS3.get(),
                };
            }
        };
        const ETHPHYoutputType = struct {
            pub fn get(_: *const ETHPHYoutputType) comptime_int {
                const from_input = ETHPHYMult.get();
                if (from_input < 25000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ETHPHYMult on ETHPHYoutput | recive {d} min 25000000\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ETHPHYMult on ETHPHYoutput | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ETH1MultType = struct {
            value: ETH1MultConf,
            pub fn get(comptime self: ETH1MultType) comptime_int {
                return switch (self.value) {
                    .Dig_CKIN => Dig_CKIN.get(),
                    .HSEOSC => HSEOSC.get(),
                    .ETHPHYMult => ETHPHYMult.get(),
                };
            }
        };
        const ETH1outputType = struct {
            pub fn get(_: *const ETH1outputType) comptime_int {
                return ETH1Mult.get();
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
                return ADCMult.get();
            }
        };
        const CECMultType = struct {
            value: CECMultConf,
            pub fn get(comptime self: CECMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CSICECDevisor => CSICECDevisor.get(),
                };
            }
        };
        const CECoutputType = struct {
            pub fn get(_: *const CECoutputType) comptime_int {
                return CECMult.get();
            }
        };
        const CSICECDevisorType = struct {
            value: CSICECDevisorConf,

            pub fn get(self: *const CSICECDevisorType) comptime_int {
                if (!@hasDecl(this, "CSIRC")) {
                    @compileError("No Input CSIRC for CSICECDevisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.CSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
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
        const Dig_CKIN = Dig_CKINType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const MCO1Mult = MCO1MultType{ .value = conf.MCO1Mult };
        const MCO1Div = MCO1DivType{ .value = conf.MCO1Div };
        pub const MCO1Pin = MCO1PinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const CPRE = CPREType{ .value = conf.CPRE };
        pub const CPREOutput = CPREOutputType{};
        const TPIUPrescaler = TPIUPrescalerType{ .value = conf.TPIUPrescaler };
        pub const TPIUOutput = TPIUOutputType{};
        pub const CpuClockOutput = CpuClockOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        const BMPRE = BMPREType{ .value = conf.BMPRE };
        pub const AHBOutput = AHBOutputType{};
        pub const AXIClockOutput = AXIClockOutputType{};
        pub const AHB5Output = AHB5OutputType{};
        const PPRE5 = PPRE5Type{ .value = conf.PPRE5 };
        pub const APB5Output = APB5OutputType{};
        pub const AHB1234Output = AHB1234OutputType{};
        const PPRE1 = PPRE1Type{ .value = conf.PPRE1 };
        pub const APB1Output = APB1OutputType{};
        const Tim1Mul = Tim1MulType{};
        pub const Tim1Output = Tim1OutputType{};
        const PPRE2 = PPRE2Type{ .value = conf.PPRE2 };
        pub const APB2Output = APB2OutputType{};
        const Tim2Mul = Tim2MulType{};
        pub const Tim2Output = Tim2OutputType{};
        const PPRE4 = PPRE4Type{ .value = conf.PPRE4 };
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
        const DIVS1 = DIVS1Type{ .value = conf.DIVS1 };
        pub const DIVS1output = DIVS1outputType{};
        const DIVT1 = DIVT1Type{ .value = conf.DIVT1 };
        pub const DIVT1output = DIVT1outputType{};
        const DIVN2 = DIVN2Type{ .value = conf.DIVN2 };
        const PLL2FRACN = PLL2FRACNType{ .value = conf.PLL2FRACN };
        const DIVP2 = DIVP2Type{ .value = conf.DIVP2 };
        pub const DIVP2output = DIVP2outputType{};
        const DIVQ2 = DIVQ2Type{ .value = conf.DIVQ2 };
        pub const DIVQ2output = DIVQ2outputType{};
        const DIVR2 = DIVR2Type{ .value = conf.DIVR2 };
        pub const DIVR2output = DIVR2outputType{};
        const DIVS2 = DIVS2Type{ .value = conf.DIVS2 };
        pub const DIVS2output = DIVS2outputType{};
        const DIVT2 = DIVT2Type{ .value = conf.DIVT2 };
        pub const DIVT2output = DIVT2outputType{};
        const DIVN3 = DIVN3Type{ .value = conf.DIVN3 };
        const PLL3FRACN = PLL3FRACNType{ .value = conf.PLL3FRACN };
        const DIVP3 = DIVP3Type{ .value = conf.DIVP3 };
        pub const DIVP3output = DIVP3outputType{};
        const DIVQ3 = DIVQ3Type{ .value = conf.DIVQ3 };
        pub const DIVQ3output = DIVQ3outputType{};
        const DIVR3 = DIVR3Type{ .value = conf.DIVR3 };
        pub const DIVR3output = DIVR3outputType{};
        const DIVS3 = DIVS3Type{ .value = conf.DIVS3 };
        pub const DIVS3output = DIVS3outputType{};
        const DIVT3 = DIVT3Type{ .value = conf.DIVT3 };
        pub const DIVT3output = DIVT3outputType{};
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        pub const UCPDoutput = UCPDoutputType{};
        const HSI_DIV = HSI_DIVType{ .value = conf.HSI_DIV };
        const SPI1Mult = SPI1MultType{ .value = conf.SPI1Mult };
        pub const SPI1output = SPI1outputType{};
        const SPI23Mult = SPI23MultType{ .value = conf.SPI23Mult };
        pub const SPI23output = SPI23outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        const SAI2Mult = SAI2MultType{ .value = conf.SAI2Mult };
        pub const SAI2output = SAI2outputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I2C23Mult = I2C23MultType{ .value = conf.I2C23Mult };
        pub const I2C23output = I2C23outputType{};
        const SPDIFMult = SPDIFMultType{ .value = conf.SPDIFMult };
        pub const SPDIFoutput = SPDIFoutputType{};
        pub const LTDCOutput = LTDCOutputType{};
        const FMCMult = FMCMultType{ .value = conf.FMCMult };
        pub const FMCoutput = FMCoutputType{};
        const SDMMCMult = SDMMCMultType{ .value = conf.SDMMCMult };
        pub const SDMMCoutput = SDMMCoutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const ADFMult = ADFMultType{ .value = conf.ADFMult };
        pub const ADFoutput = ADFoutputType{};
        const USART234578Mult = USART234578MultType{ .value = conf.USART234578Mult };
        pub const USART234578output = USART234578outputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const LPTIM23Mult = LPTIM23MultType{ .value = conf.LPTIM23Mult };
        pub const LPTIM23output = LPTIM23outputType{};
        const LPTIM45Mult = LPTIM45MultType{ .value = conf.LPTIM45Mult };
        pub const LPTIM45output = LPTIM45outputType{};
        const SPI6Mult = SPI6MultType{ .value = conf.SPI6Mult };
        pub const SPI6output = SPI6outputType{};
        const SPI45Mult = SPI45MultType{ .value = conf.SPI45Mult };
        pub const SPI45output = SPI45outputType{};
        const HSEUSBPHYDevisor = HSEUSBPHYDevisorType{ .value = conf.HSEUSBPHYDevisor };
        const USBPHYCLKMux = USBPHYCLKMuxType{ .value = conf.USBPHYCLKMux };
        pub const USBPHYCLKOutput = USBPHYCLKOutputType{};
        const USBPHYRC = USBPHYRCType{};
        const USBPHYRC60 = USBPHYRC60Type{};
        const USBOCLKMux = USBOCLKMuxType{ .value = conf.USBOCLKMux };
        pub const USBOFSCLKOutput = USBOFSCLKOutputType{};
        pub const RNGOutput = RNGOutputType{};
        pub const DTSOutput = DTSOutputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANoutput = FDCANoutputType{};
        const XSPI1Mult = XSPI1MultType{ .value = conf.XSPI1Mult };
        pub const XSPI1output = XSPI1outputType{};
        const PSSIMult = PSSIMultType{ .value = conf.PSSIMult };
        pub const PSSIoutput = PSSIoutputType{};
        const XSPI2Mult = XSPI2MultType{ .value = conf.XSPI2Mult };
        pub const XSPI2output = XSPI2outputType{};
        const ETHPHYMult = ETHPHYMultType{ .value = conf.ETHPHYMult };
        pub const ETHPHYoutput = ETHPHYoutputType{};
        const ETH1Mult = ETH1MultType{ .value = conf.ETH1Mult };
        pub const ETH1output = ETH1outputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const CECMult = CECMultType{ .value = conf.CECMult };
        pub const CECoutput = CECoutputType{};
        const CSICECDevisor = CSICECDevisorType{ .value = conf.CSICECDevisor };

        pub fn validate() void {
            _ = CPREOutput.get();
            _ = TPIUOutput.get();
            _ = CpuClockOutput.get();
            _ = CortexSysOutput.get();
            _ = AHBOutput.get();
            _ = AXIClockOutput.get();
            _ = AHB5Output.get();
            _ = APB5Output.get();
            _ = AHB1234Output.get();
            _ = APB1Output.get();
            _ = APB2Output.get();
            _ = APB4Output.get();
            _ = SPI1output.get();
            _ = SPI23output.get();
            _ = SAI1output.get();
            _ = SAI2output.get();
            _ = I2C1output.get();
            _ = I2C23output.get();
            _ = SPDIFoutput.get();
            _ = LTDCOutput.get();
            _ = FMCoutput.get();
            _ = SDMMCoutput.get();
            _ = USART1output.get();
            _ = ADFoutput.get();
            _ = USART234578output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM23output.get();
            _ = LPTIM45output.get();
            _ = SPI6output.get();
            _ = SPI45output.get();
            _ = USBPHYCLKOutput.get();
            _ = USBOFSCLKOutput.get();
            _ = FDCANoutput.get();
            _ = XSPI1output.get();
            _ = PSSIoutput.get();
            _ = XSPI2output.get();
            _ = ETHPHYoutput.get();
            _ = ETH1output.get();
            _ = ADCoutput.get();
            _ = CECoutput.get();
        }
    };

    return ClockStruct;
}
