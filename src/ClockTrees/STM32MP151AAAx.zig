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
        } else if (val > 48000000) {
            @compileError("min value for HSEOSC is 48000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 48000000;
    }

    pub fn min() comptime_int {
        return 4000000;
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
    DIVP3,
};
pub const MPUMultConf = enum {
    DIVP1,
    MPUDIV,
    HSEOSC,
    HSIDiv,
};
pub const CKPERMultConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const AXIMultConf = enum {
    HSEOSC,
    HSIDiv,
    DIVP2,
};
pub const AXIDIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
        };
    }
};
pub const APB4DIVConf = enum {
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
pub const APB5DIVConf = enum {
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
pub const MCO1MultConf = enum {
    HSIDiv,
    HSEOSC,
    CSIRC,
    LSIRC,
    LSEOSC,
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
    DIV16,
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
            .DIV16 => 16,
        };
    }
};
pub const MCO2MultConf = enum {
    MPUMult,
    AXIDIV,
    SysCLKOutput,
    DIVP4,
    HSEOSC,
    HSIDiv,
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
    DIV16,
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
            .DIV16 => 16,
        };
    }
};
pub const MCUDIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
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
            .DIV32 => 32,
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
pub const APB3DIVConf = enum {
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
pub const APB1DIVConf = enum {
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
pub const APB2DIVConf = enum {
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
pub const PLL12SourceConf = enum {
    HSIDiv,
    HSEOSC,
};
pub const DIVM1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVM1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVM1 is 1\n");
        } else if (val > 64) {
            @compileError("min value for DIVM1 is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
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
        } else if (val > 64) {
            @compileError("min value for DIVM2 is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLL3SourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const DIVM3Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVM3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVM3 is 1\n");
        } else if (val > 64) {
            @compileError("min value for DIVM3 is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLL4SourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const DIVM4Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVM4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVM4 is 1\n");
        } else if (val > 64) {
            @compileError("min value for DIVM4 is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const MPUDIVConf = enum {
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
pub const PLL1FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL1FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL1FRACV is 0\n");
        } else if (val > 8191) {
            @compileError("min value for PLL1FRACV is 8191\n");
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
pub const DIVP1Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVP1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVP1 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVP1 is 128\n");
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
pub const PLL2FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL2FRACV is 0\n");
        } else if (val > 8191) {
            @compileError("min value for PLL2FRACV is 8191\n");
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
pub const PLL3FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL3FRACV is 0\n");
        } else if (val > 8191) {
            @compileError("min value for PLL3FRACV is 8191\n");
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
pub const DIVN4Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVN4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4) {
            @compileError("min value for DIVN4 is 4\n");
        } else if (val > 512) {
            @compileError("min value for DIVN4 is 512\n");
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
pub const PLL4FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL4FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL4FRACV is 0\n");
        } else if (val > 8191) {
            @compileError("min value for PLL4FRACV is 8191\n");
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
pub const DIVP4Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVP4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVP4 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVP4 is 128\n");
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
pub const DIVQ4Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVQ4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVQ4 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVQ4 is 128\n");
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
pub const DIVR4Conf = enum(comptime_int) {
    _,
    pub fn get(num: DIVR4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for DIVR4 is 1\n");
        } else if (val > 128) {
            @compileError("min value for DIVR4 is 128\n");
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
pub const DSIMultConf = enum {
    PLL4DSIInput,
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
pub const HSERTCDevisorConf = enum(comptime_int) {
    _,
    pub fn get(num: HSERTCDevisorConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for HSERTCDevisor is 1\n");
        } else if (val > 64) {
            @compileError("min value for HSERTCDevisor is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const I2C12MultConf = enum {
    APB1DIV,
    DIVR4,
    HSIDiv,
    CSIRC,
};
pub const I2C35MultConf = enum {
    APB1DIV,
    DIVR4,
    HSIDiv,
    CSIRC,
};
pub const I2C46MultConf = enum {
    APB5DIV,
    DIVQ3,
    HSIDiv,
    CSIRC,
};
pub const SPDIFMultConf = enum {
    DIVP4,
    DIVQ3,
    HSIDiv,
};
pub const QSPIMultConf = enum {
    AXIOutput,
    DIVP4,
    DIVR3,
    CKPERCLKOutput,
};
pub const FMCMultConf = enum {
    AXIOutput,
    DIVR3,
    DIVP4,
    CKPERCLKOutput,
};
pub const SDMMC12MultConf = enum {
    Hclk6Output,
    DIVR3,
    DIVP4,
    HSIDiv,
};
pub const SDMMC3MultConf = enum {
    AHBOutput,
    DIVR3,
    DIVP4,
    HSIDiv,
};
pub const STGENMultConf = enum {
    HSIDiv,
    HSEOSC,
};
pub const LPTIM45MultConf = enum {
    APB3DIV,
    DIVP4,
    DIVQ3,
    LSEOSC,
    LSIRC,
    CKPERCLKOutput,
};
pub const LPTIM23MultConf = enum {
    APB3DIV,
    DIVQ4,
    CKPERCLKOutput,
    LSEOSC,
    LSIRC,
};
pub const LPTIM1MultConf = enum {
    APB1DIV,
    DIVP4,
    DIVQ3,
    LSEOSC,
    LSIRC,
    CKPERCLKOutput,
};
pub const USART1MultConf = enum {
    APB5DIV,
    DIVQ4,
    DIVQ3,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const USART24MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const USART35MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const USART6MultConf = enum {
    APB2DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const UART78MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const RNG1MultConf = enum {
    CSIRC,
    DIVR4,
    LSEOSC,
    LSIRC,
};
pub const RNG2MultConf = enum {
    CSIRC,
    DIVR4,
    LSEOSC,
    LSIRC,
};
pub const SPI6MultConf = enum {
    APB5DIV,
    DIVQ4,
    DIVQ3,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const SPI45MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const SAI2MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    SPDIFMult,
    DIVR3,
};
pub const SAI4MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const SPI1MultConf = enum {
    DIVP4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const SPI23MultConf = enum {
    DIVP4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const SAI1MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const SAI3MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const FDCANMultConf = enum {
    HSEOSC,
    DIVQ3,
    DIVQ4,
    DIVR4,
};
pub const ETH1MultConf = enum {
    DIVP4,
    DIVQ3,
};
pub const ADCMultConf = enum {
    DIVR4,
    CKPERCLKOutput,
    DIVQ3,
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
pub const CECMultConf = enum {
    CSICECDevisor,
    LSEOSC,
    LSIRC,
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
    HSEUSBPHYDevisor,
    HSEOSC,
    DIVR4,
};
pub const USBOCLKMuxConf = enum {
    DIVR4,
    USBPHYRC,
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
pub const Config = struct {
    HSIDiv: HSIDivConf = .DIV1,
    HSEOSC: HSEOSCConf = @enumFromInt(24000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIDiv,
    MPUMult: MPUMultConf = .HSIDiv,
    CKPERMult: CKPERMultConf = .HSIDiv,
    AXIMult: AXIMultConf = .HSIDiv,
    AXIDIV: AXIDIVConf = .DIV1,
    APB4DIV: APB4DIVConf = .DIV1,
    APB5DIV: APB5DIVConf = .DIV1,
    MCO1Mult: MCO1MultConf = .HSIDiv,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .MPUMult,
    MCO2Div: MCO2DivConf = .DIV1,
    MCUDIV: MCUDIVConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB3DIV: APB3DIVConf = .DIV1,
    APB1DIV: APB1DIVConf = .DIV1,
    APB2DIV: APB2DIVConf = .DIV1,
    PLL12Source: PLL12SourceConf = .HSIDiv,
    DIVM1: DIVM1Conf = @enumFromInt(32),
    DIVM2: DIVM2Conf = @enumFromInt(32),
    PLL3Source: PLL3SourceConf = .HSIDiv,
    DIVM3: DIVM3Conf = @enumFromInt(32),
    PLL4Source: PLL4SourceConf = .HSIDiv,
    DIVM4: DIVM4Conf = @enumFromInt(32),
    MPUDIV: MPUDIVConf = .DIV2,
    DIVN1: DIVN1Conf = @enumFromInt(25),
    PLL1FRACV: PLL1FRACVConf = @enumFromInt(0),
    DIVP1: DIVP1Conf = @enumFromInt(1),
    DIVQ1: DIVQ1Conf = @enumFromInt(2),
    DIVR1: DIVR1Conf = @enumFromInt(2),
    DIVN2: DIVN2Conf = @enumFromInt(25),
    PLL2FRACV: PLL2FRACVConf = @enumFromInt(0),
    DIVP2: DIVP2Conf = @enumFromInt(2),
    DIVQ2: DIVQ2Conf = @enumFromInt(2),
    DIVR2: DIVR2Conf = @enumFromInt(2),
    DIVN3: DIVN3Conf = @enumFromInt(25),
    PLL3FRACV: PLL3FRACVConf = @enumFromInt(0),
    DIVP3: DIVP3Conf = @enumFromInt(2),
    DIVQ3: DIVQ3Conf = @enumFromInt(2),
    DIVR3: DIVR3Conf = @enumFromInt(2),
    DIVN4: DIVN4Conf = @enumFromInt(25),
    PLL4FRACV: PLL4FRACVConf = @enumFromInt(0),
    DIVP4: DIVP4Conf = @enumFromInt(2),
    DIVQ4: DIVQ4Conf = @enumFromInt(2),
    DIVR4: DIVR4Conf = @enumFromInt(2),
    DSIMult: DSIMultConf = .DSIPHYPrescaler,
    DSITXPrescaler: DSITXPrescalerConf = @enumFromInt(4),
    HSERTCDevisor: HSERTCDevisorConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    I2C12Mult: I2C12MultConf = .APB1DIV,
    I2C35Mult: I2C35MultConf = .APB1DIV,
    I2C46Mult: I2C46MultConf = .APB5DIV,
    SPDIFMult: SPDIFMultConf = .DIVP4,
    QSPIMult: QSPIMultConf = .AXIOutput,
    FMCMult: FMCMultConf = .AXIOutput,
    SDMMC12Mult: SDMMC12MultConf = .Hclk6Output,
    SDMMC3Mult: SDMMC3MultConf = .AHBOutput,
    STGENMult: STGENMultConf = .HSIDiv,
    LPTIM45Mult: LPTIM45MultConf = .APB3DIV,
    LPTIM23Mult: LPTIM23MultConf = .APB3DIV,
    LPTIM1Mult: LPTIM1MultConf = .APB1DIV,
    USART1Mult: USART1MultConf = .APB5DIV,
    USART24Mult: USART24MultConf = .APB1DIV,
    USART35Mult: USART35MultConf = .APB1DIV,
    USART6Mult: USART6MultConf = .APB2DIV,
    UART78Mult: UART78MultConf = .APB1DIV,
    RNG1Mult: RNG1MultConf = .CSIRC,
    RNG2Mult: RNG2MultConf = .CSIRC,
    SPI6Mult: SPI6MultConf = .APB5DIV,
    SPI45Mult: SPI45MultConf = .APB1DIV,
    SAI2Mult: SAI2MultConf = .DIVQ4,
    SAI4Mult: SAI4MultConf = .DIVQ4,
    SPI1Mult: SPI1MultConf = .DIVP4,
    SPI23Mult: SPI23MultConf = .DIVP4,
    SAI1Mult: SAI1MultConf = .DIVQ4,
    SAI3Mult: SAI3MultConf = .DIVQ4,
    FDCANMult: FDCANMultConf = .HSEOSC,
    ETH1Mult: ETH1MultConf = .DIVP4,
    ADCMult: ADCMultConf = .DIVR4,
    CSICECDevisor: CSICECDevisorConf = .DIV122,
    CECMult: CECMultConf = .LSEOSC,
    HSEUSBPHYDevisor: HSEUSBPHYDevisorConf = .DIV2,
    USBPHYCLKMux: USBPHYCLKMuxConf = .DIVR4,
    USBOCLKMux: USBOCLKMuxConf = .DIVR4,
    PLLDSIIDF: PLLDSIIDFConf = .DIV1,
    PLLDSINDIV: PLLDSINDIVConf = @enumFromInt(20),
    PLLDSIODF: PLLDSIODFConf = .DIV1,
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
            pub fn get(_: *const LSIRCType) comptime_int {
                return 32000;
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
                    .DIVP3 => DIVP3.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 209000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 209000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MPUMultType = struct {
            value: MPUMultConf,
            pub fn get(comptime self: MPUMultType) comptime_int {
                return switch (self.value) {
                    .DIVP1 => DIVP1.get(),
                    .MPUDIV => MPUDIV.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const MPUCLKOutputType = struct {
            pub fn get(_: *const MPUCLKOutputType) comptime_int {
                const from_input = MPUMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MPUMult on MPUCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 650000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MPUMult on MPUCLKOutput | recive {d} max 650000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CKPERMultType = struct {
            value: CKPERMultConf,
            pub fn get(comptime self: CKPERMultType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const CKPERCLKOutputType = struct {
            pub fn get(_: *const CKPERCLKOutputType) comptime_int {
                return CKPERMult.get();
            }
        };
        const AXIMultType = struct {
            value: AXIMultConf,
            pub fn get(comptime self: AXIMultType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .HSIDiv => HSIDiv.get(),
                    .DIVP2 => DIVP2.get(),
                };
            }
        };
        const AXICLKOutputType = struct {
            pub fn get(_: *const AXICLKOutputType) comptime_int {
                const from_input = AXIMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AXIMult on AXICLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 266500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AXIMult on AXICLKOutput | recive {d} max 266500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DACCLKOutputType = struct {
            pub fn get(_: *const DACCLKOutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const AXIDIVType = struct {
            value: AXIDIVConf,

            pub fn get(self: *const AXIDIVType) comptime_int {
                if (!@hasDecl(this, "AXICLKOutput")) {
                    @compileError("No Input AXICLKOutput for AXIDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AXICLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const AXIOutputType = struct {
            pub fn get(_: *const AXIOutputType) comptime_int {
                const from_input = AXIDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AXIDIV on AXIOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 266500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AXIDIV on AXIOutput | recive {d} max 266500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const Hclk5OutputType = struct {
            pub fn get(_: *const Hclk5OutputType) comptime_int {
                const from_input = AXIDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AXIDIV on Hclk5Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 266500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AXIDIV on Hclk5Output | recive {d} max 266500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const Hclk6OutputType = struct {
            pub fn get(_: *const Hclk6OutputType) comptime_int {
                const from_input = AXIDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AXIDIV on Hclk6Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 266500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AXIDIV on Hclk6Output | recive {d} max 266500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB4DIVType = struct {
            value: APB4DIVConf,

            pub fn get(self: *const APB4DIVType) comptime_int {
                if (!@hasDecl(this, "AXIDIV")) {
                    @compileError("No Input AXIDIV for APB4DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AXIDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB4DIVOutputType = struct {
            pub fn get(_: *const APB4DIVOutputType) comptime_int {
                const from_input = APB4DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB4DIV on APB4DIVOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB4DIV on APB4DIVOutput | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB5DIVType = struct {
            value: APB5DIVConf,

            pub fn get(self: *const APB5DIVType) comptime_int {
                if (!@hasDecl(this, "AXIDIV")) {
                    @compileError("No Input AXIDIV for APB5DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AXIDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB5DIVOutputType = struct {
            pub fn get(_: *const APB5DIVOutputType) comptime_int {
                const from_input = APB5DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB5DIV on APB5DIVOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 67000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB5DIV on APB5DIVOutput | recive {d} max 67000000\n", .{from_input}));
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
                    .CSIRC => CSIRC.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
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
                    .MPUMult => MPUMult.get(),
                    .AXIDIV => AXIDIV.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .DIVP4 => DIVP4.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIDiv => HSIDiv.get(),
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
        const MCUDIVType = struct {
            value: MCUDIVConf,

            pub fn get(self: *const MCUDIVType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for MCUDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CortexPrescalerType = struct {
            value: CortexPrescalerConf,

            pub fn get(self: *const CortexPrescalerType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for CortexPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                return CortexPrescaler.get();
            }
        };
        const McuClockOutputType = struct {
            pub fn get(_: *const McuClockOutputType) comptime_int {
                const from_input = MCUDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MCUDIV on McuClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 209000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MCUDIV on McuClockOutput | recive {d} max 209000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB3DIVType = struct {
            value: APB3DIVConf,

            pub fn get(self: *const APB3DIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APB3DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB3OutputType = struct {
            pub fn get(_: *const APB3OutputType) comptime_int {
                const from_input = APB3DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB3DIV on APB3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB3DIV on APB3Output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1DIVType = struct {
            value: APB1DIVConf,

            pub fn get(self: *const APB1DIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APB1DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const Tim1MulType = struct {
            pub fn get(_: *const Tim1MulType) comptime_int {
                if (!@hasDecl(this, "APB1DIV")) {
                    @compileError("No Input APB1DIV for Tim1Mul\n");
                }
                const from_input = this.APB1DIV.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim1OutputType = struct {
            pub fn get(_: *const Tim1OutputType) comptime_int {
                const from_input = Tim1Mul.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from Tim1Mul on Tim1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 209000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from Tim1Mul on Tim1Output | recive {d} max 209000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = MCUDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MCUDIV on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 209000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MCUDIV on AHBOutput | recive {d} max 209000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1OutputType = struct {
            pub fn get(_: *const APB1OutputType) comptime_int {
                const from_input = APB1DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB1DIV on APB1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1DIV on APB1Output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB2DIVType = struct {
            value: APB2DIVConf,

            pub fn get(self: *const APB2DIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APB2DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const Tim2MulType = struct {
            pub fn get(_: *const Tim2MulType) comptime_int {
                if (!@hasDecl(this, "APB2DIV")) {
                    @compileError("No Input APB2DIV for Tim2Mul\n");
                }
                const from_input = this.APB2DIV.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim2OutputType = struct {
            pub fn get(_: *const Tim2OutputType) comptime_int {
                const from_input = Tim2Mul.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from Tim2Mul on Tim2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 209000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from Tim2Mul on Tim2Output | recive {d} max 209000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB2OutputType = struct {
            pub fn get(_: *const APB2OutputType) comptime_int {
                const from_input = APB2DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB2DIV on APB2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2DIV on APB2Output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DFSDM1OutputType = struct {
            pub fn get(_: *const DFSDM1OutputType) comptime_int {
                return MCUDIV.get();
            }
        };
        const PLL12SourceType = struct {
            value: PLL12SourceConf,
            pub fn get(comptime self: PLL12SourceType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const DIVM1Type = struct {
            value: DIVM1Conf,

            pub fn get(self: *const DIVM1Type) comptime_int {
                if (!@hasDecl(this, "PLL12Source")) {
                    @compileError("No Input PLL12Source for DIVM1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL12Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVM2Type = struct {
            value: DIVM2Conf,

            pub fn get(self: *const DIVM2Type) comptime_int {
                if (!@hasDecl(this, "PLL12Source")) {
                    @compileError("No Input PLL12Source for DIVM2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL12Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL3SourceType = struct {
            value: PLL3SourceConf,
            pub fn get(comptime self: PLL3SourceType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const DIVM3Type = struct {
            value: DIVM3Conf,

            pub fn get(self: *const DIVM3Type) comptime_int {
                if (!@hasDecl(this, "PLL3Source")) {
                    @compileError("No Input PLL3Source for DIVM3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL4SourceType = struct {
            value: PLL4SourceConf,
            pub fn get(comptime self: PLL4SourceType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const DIVM4Type = struct {
            value: DIVM4Conf,

            pub fn get(self: *const DIVM4Type) comptime_int {
                if (!@hasDecl(this, "PLL4Source")) {
                    @compileError("No Input PLL4Source for DIVM4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL4Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const MPUDIVType = struct {
            value: MPUDIVConf,

            pub fn get(self: *const MPUDIVType) comptime_int {
                if (!@hasDecl(this, "DIVP1")) {
                    @compileError("No Input DIVP1 for MPUDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVP1.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const FreqCk1Type = struct {
            pub fn get(_: *const FreqCk1Type) comptime_int {
                if (!@hasDecl(this, "DIVM1")) {
                    @compileError("No Input DIVM1 for FreqCk1\n");
                }
                const from_input = this.DIVM1.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const DIVN1Type = struct {
            value: DIVN1Conf,

            pub fn get(self: *const DIVN1Type) comptime_int {
                if (!@hasDecl(this, "FreqCk1")) {
                    @compileError("No Input FreqCk1 for DIVN1\n");
                } else if (!@hasDecl(this, "PLL1FRACV")) {
                    @compileError("No fractional  value: PLL1FRACV for DIVN1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FreqCk1.get());
                const frac: comptime_float = @floatFromInt(this.PLL1FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL1FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL1FRACVType = struct {
            value: PLL1FRACVConf,
            pub fn get(comptime self: PLL1FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const DIVN1Mul2Div2Type = struct {
            pub fn get(_: *const DIVN1Mul2Div2Type) comptime_int {
                if (!@hasDecl(this, "DIVN1")) {
                    @compileError("No Input DIVN1 for DIVN1Mul2Div2\n");
                }
                const from_input = this.DIVN1.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const DIVP1Type = struct {
            value: DIVP1Conf,

            pub fn get(self: *const DIVP1Type) comptime_int {
                if (!@hasDecl(this, "DIVN1Mul2Div2")) {
                    @compileError("No Input DIVN1Mul2Div2 for DIVP1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1Mul2Div2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVQ1Type = struct {
            value: DIVQ1Conf,

            pub fn get(self: *const DIVQ1Type) comptime_int {
                if (!@hasDecl(this, "DIVN1Mul2Div2")) {
                    @compileError("No Input DIVN1Mul2Div2 for DIVQ1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1Mul2Div2.get());
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
                if (!@hasDecl(this, "DIVN1Mul2Div2")) {
                    @compileError("No Input DIVN1Mul2Div2 for DIVR1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN1Mul2Div2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVR1outputType = struct {
            pub fn get(_: *const DIVR1outputType) comptime_int {
                return DIVR1.get();
            }
        };
        const FreqCk2Type = struct {
            pub fn get(_: *const FreqCk2Type) comptime_int {
                if (!@hasDecl(this, "DIVM2")) {
                    @compileError("No Input DIVM2 for FreqCk2\n");
                }
                const from_input = this.DIVM2.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const DIVN2Type = struct {
            value: DIVN2Conf,

            pub fn get(self: *const DIVN2Type) comptime_int {
                if (!@hasDecl(this, "FreqCk2")) {
                    @compileError("No Input FreqCk2 for DIVN2\n");
                } else if (!@hasDecl(this, "PLL2FRACV")) {
                    @compileError("No fractional  value: PLL2FRACV for DIVN2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FreqCk2.get());
                const frac: comptime_float = @floatFromInt(this.PLL2FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL2FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL2FRACVType = struct {
            value: PLL2FRACVConf,
            pub fn get(comptime self: PLL2FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const DIVN2Mul2Div2Type = struct {
            pub fn get(_: *const DIVN2Mul2Div2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2")) {
                    @compileError("No Input DIVN2 for DIVN2Mul2Div2\n");
                }
                const from_input = this.DIVN2.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const DIVP2Type = struct {
            value: DIVP2Conf,

            pub fn get(self: *const DIVP2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2Mul2Div2")) {
                    @compileError("No Input DIVN2Mul2Div2 for DIVP2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2Mul2Div2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVQ2Type = struct {
            value: DIVQ2Conf,

            pub fn get(self: *const DIVQ2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2Mul2Div2")) {
                    @compileError("No Input DIVN2Mul2Div2 for DIVQ2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2Mul2Div2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVQ2outputType = struct {
            pub fn get(_: *const DIVQ2outputType) comptime_int {
                const from_input = DIVQ2.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DIVQ2 on DIVQ2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 533000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DIVQ2 on DIVQ2output | recive {d} max 533000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DIVR2Type = struct {
            value: DIVR2Conf,

            pub fn get(self: *const DIVR2Type) comptime_int {
                if (!@hasDecl(this, "DIVN2Mul2Div2")) {
                    @compileError("No Input DIVN2Mul2Div2 for DIVR2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN2Mul2Div2.get());
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
                } else if (!@hasDecl(this, "PLL3FRACV")) {
                    @compileError("No fractional  value: PLL3FRACV for DIVN3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVM3.get());
                const frac: comptime_float = @floatFromInt(this.PLL3FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL3FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL3FRACVType = struct {
            value: PLL3FRACVConf,
            pub fn get(comptime self: PLL3FRACVType) comptime_int {
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
                const from_input = DIVQ4.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DIVQ4 on LTDCOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 90000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DIVQ4 on LTDCOutput | recive {d} max 90000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DIVR3outputType = struct {
            pub fn get(_: *const DIVR3outputType) comptime_int {
                return DIVR3.get();
            }
        };
        const DIVN4Type = struct {
            value: DIVN4Conf,

            pub fn get(self: *const DIVN4Type) comptime_int {
                if (!@hasDecl(this, "DIVM4")) {
                    @compileError("No Input DIVM4 for DIVN4\n");
                } else if (!@hasDecl(this, "PLL4FRACV")) {
                    @compileError("No fractional  value: PLL4FRACV for DIVN4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVM4.get());
                const frac: comptime_float = @floatFromInt(this.PLL4FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL4FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL4FRACVType = struct {
            value: PLL4FRACVConf,
            pub fn get(comptime self: PLL4FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const DIVP4Type = struct {
            value: DIVP4Conf,

            pub fn get(self: *const DIVP4Type) comptime_int {
                if (!@hasDecl(this, "DIVN4")) {
                    @compileError("No Input DIVN4 for DIVP4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN4.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVP4outputType = struct {
            pub fn get(_: *const DIVP4outputType) comptime_int {
                return DIVP4.get();
            }
        };
        const PLL4DSIInputType = struct {
            pub fn get(_: *const PLL4DSIInputType) comptime_int {
                return DIVP4.get();
            }
        };
        const DIVQ4Type = struct {
            value: DIVQ4Conf,

            pub fn get(self: *const DIVQ4Type) comptime_int {
                if (!@hasDecl(this, "DIVN4")) {
                    @compileError("No Input DIVN4 for DIVQ4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN4.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVQ4outputType = struct {
            pub fn get(_: *const DIVQ4outputType) comptime_int {
                return DIVQ4.get();
            }
        };
        const DIVR4Type = struct {
            value: DIVR4Conf,

            pub fn get(self: *const DIVR4Type) comptime_int {
                if (!@hasDecl(this, "DIVN4")) {
                    @compileError("No Input DIVN4 for DIVR4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.DIVN4.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const DIVR4outputType = struct {
            pub fn get(_: *const DIVR4outputType) comptime_int {
                return DIVR4.get();
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
                    .PLL4DSIInput => PLL4DSIInput.get(),
                    .DSIPHYPrescaler => DSIPHYPrescaler.get(),
                };
            }
        };
        const DSIoutputType = struct {
            pub fn get(_: *const DSIoutputType) comptime_int {
                const from_input = DSIMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DSIMult on DSIoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DSIMult on DSIoutput | recive {d} max 125000000\n", .{from_input}));
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
        const DSIPixelType = struct {
            pub fn get(_: *const DSIPixelType) comptime_int {
                const from_input = DIVQ4.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DIVQ4 on DSIPixel | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 90000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DIVQ4 on DSIPixel | recive {d} max 90000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HSERTCDevisorType = struct {
            value: HSERTCDevisorConf,

            pub fn get(self: *const HSERTCDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSERTCDevisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
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
                } else if (from_input > 4000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RTCClkSource on RTCOutput | recive {d} max 4000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const I2C12MultType = struct {
            value: I2C12MultConf,
            pub fn get(comptime self: I2C12MultType) comptime_int {
                return switch (self.value) {
                    .APB1DIV => APB1DIV.get(),
                    .DIVR4 => DIVR4.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C12outputType = struct {
            pub fn get(_: *const I2C12outputType) comptime_int {
                const from_input = I2C12Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from I2C12Mult on I2C12output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from I2C12Mult on I2C12output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const I2C35MultType = struct {
            value: I2C35MultConf,
            pub fn get(comptime self: I2C35MultType) comptime_int {
                return switch (self.value) {
                    .APB1DIV => APB1DIV.get(),
                    .DIVR4 => DIVR4.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C35outputType = struct {
            pub fn get(_: *const I2C35outputType) comptime_int {
                const from_input = I2C35Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from I2C35Mult on I2C35output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from I2C35Mult on I2C35output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const I2C46MultType = struct {
            value: I2C46MultConf,
            pub fn get(comptime self: I2C46MultType) comptime_int {
                return switch (self.value) {
                    .APB5DIV => APB5DIV.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                    .CSIRC => CSIRC.get(),
                };
            }
        };
        const I2C46outputType = struct {
            pub fn get(_: *const I2C46outputType) comptime_int {
                const from_input = I2C46Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from I2C46Mult on I2C46output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from I2C46Mult on I2C46output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPDIFMultType = struct {
            value: SPDIFMultConf,
            pub fn get(comptime self: SPDIFMultType) comptime_int {
                return switch (self.value) {
                    .DIVP4 => DIVP4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const SPDIFoutputType = struct {
            pub fn get(_: *const SPDIFoutputType) comptime_int {
                const from_input = SPDIFMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPDIFMult on SPDIFoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPDIFMult on SPDIFoutput | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const QSPIMultType = struct {
            value: QSPIMultConf,
            pub fn get(comptime self: QSPIMultType) comptime_int {
                return switch (self.value) {
                    .AXIOutput => AXIOutput.get(),
                    .DIVP4 => DIVP4.get(),
                    .DIVR3 => DIVR3.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                };
            }
        };
        const QSPIoutputType = struct {
            pub fn get(_: *const QSPIoutputType) comptime_int {
                const from_input = QSPIMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from QSPIMult on QSPIoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 266500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from QSPIMult on QSPIoutput | recive {d} max 266500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FMCMultType = struct {
            value: FMCMultConf,
            pub fn get(comptime self: FMCMultType) comptime_int {
                return switch (self.value) {
                    .AXIOutput => AXIOutput.get(),
                    .DIVR3 => DIVR3.get(),
                    .DIVP4 => DIVP4.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                };
            }
        };
        const FMCoutputType = struct {
            pub fn get(_: *const FMCoutputType) comptime_int {
                const from_input = FMCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from FMCMult on FMCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 266500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from FMCMult on FMCoutput | recive {d} max 266500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SDMMC12MultType = struct {
            value: SDMMC12MultConf,
            pub fn get(comptime self: SDMMC12MultType) comptime_int {
                return switch (self.value) {
                    .Hclk6Output => Hclk6Output.get(),
                    .DIVR3 => DIVR3.get(),
                    .DIVP4 => DIVP4.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const SDMMC12outputType = struct {
            pub fn get(_: *const SDMMC12outputType) comptime_int {
                const from_input = SDMMC12Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMC12Mult on SDMMC12output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMC12Mult on SDMMC12output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SDMMC3MultType = struct {
            value: SDMMC3MultConf,
            pub fn get(comptime self: SDMMC3MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .DIVR3 => DIVR3.get(),
                    .DIVP4 => DIVP4.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const SDMMC3outputType = struct {
            pub fn get(_: *const SDMMC3outputType) comptime_int {
                const from_input = SDMMC3Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMC3Mult on SDMMC3output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 209000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMC3Mult on SDMMC3output | recive {d} max 209000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const STGENMultType = struct {
            value: STGENMultConf,
            pub fn get(comptime self: STGENMultType) comptime_int {
                return switch (self.value) {
                    .HSIDiv => HSIDiv.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const STGENoutputType = struct {
            pub fn get(_: *const STGENoutputType) comptime_int {
                const from_input = STGENMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from STGENMult on STGENoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from STGENMult on STGENoutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM45MultType = struct {
            value: LPTIM45MultConf,
            pub fn get(comptime self: LPTIM45MultType) comptime_int {
                return switch (self.value) {
                    .APB3DIV => APB3DIV.get(),
                    .DIVP4 => DIVP4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                };
            }
        };
        const LPTIM45outputType = struct {
            pub fn get(_: *const LPTIM45outputType) comptime_int {
                const from_input = LPTIM45Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM45Mult on LPTIM45output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM45Mult on LPTIM45output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM23MultType = struct {
            value: LPTIM23MultConf,
            pub fn get(comptime self: LPTIM23MultType) comptime_int {
                return switch (self.value) {
                    .APB3DIV => APB3DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const LPTIM23outputType = struct {
            pub fn get(_: *const LPTIM23outputType) comptime_int {
                const from_input = LPTIM23Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM23Mult on LPTIM23output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM23Mult on LPTIM23output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM1MultType = struct {
            value: LPTIM1MultConf,
            pub fn get(comptime self: LPTIM1MultType) comptime_int {
                return switch (self.value) {
                    .APB1DIV => APB1DIV.get(),
                    .DIVP4 => DIVP4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                };
            }
        };
        const LPTIM1outputType = struct {
            pub fn get(_: *const LPTIM1outputType) comptime_int {
                const from_input = LPTIM1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM1Mult on LPTIM1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM1Mult on LPTIM1output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART1MultType = struct {
            value: USART1MultConf,
            pub fn get(comptime self: USART1MultType) comptime_int {
                return switch (self.value) {
                    .APB5DIV => APB5DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .HSEOSC => HSEOSC.get(),
                    .CSIRC => CSIRC.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const USART1outputType = struct {
            pub fn get(_: *const USART1outputType) comptime_int {
                const from_input = USART1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART1Mult on USART1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART1Mult on USART1output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART24MultType = struct {
            value: USART24MultConf,
            pub fn get(comptime self: USART24MultType) comptime_int {
                return switch (self.value) {
                    .APB1DIV => APB1DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
                    .HSEOSC => HSEOSC.get(),
                    .CSIRC => CSIRC.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const USART24outputType = struct {
            pub fn get(_: *const USART24outputType) comptime_int {
                const from_input = USART24Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART24Mult on USART24output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART24Mult on USART24output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART35MultType = struct {
            value: USART35MultConf,
            pub fn get(comptime self: USART35MultType) comptime_int {
                return switch (self.value) {
                    .APB1DIV => APB1DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
                    .HSEOSC => HSEOSC.get(),
                    .CSIRC => CSIRC.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const USART35outputType = struct {
            pub fn get(_: *const USART35outputType) comptime_int {
                const from_input = USART35Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART35Mult on USART35output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART35Mult on USART35output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART6MultType = struct {
            value: USART6MultConf,
            pub fn get(comptime self: USART6MultType) comptime_int {
                return switch (self.value) {
                    .APB2DIV => APB2DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
                    .HSEOSC => HSEOSC.get(),
                    .CSIRC => CSIRC.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const USART6outputType = struct {
            pub fn get(_: *const USART6outputType) comptime_int {
                const from_input = USART6Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART6Mult on USART6output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART6Mult on USART6output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const UART78MultType = struct {
            value: UART78MultConf,
            pub fn get(comptime self: UART78MultType) comptime_int {
                return switch (self.value) {
                    .APB1DIV => APB1DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
                    .HSEOSC => HSEOSC.get(),
                    .CSIRC => CSIRC.get(),
                    .HSIDiv => HSIDiv.get(),
                };
            }
        };
        const USART78outputType = struct {
            pub fn get(_: *const USART78outputType) comptime_int {
                const from_input = UART78Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from UART78Mult on USART78output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 104500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from UART78Mult on USART78output | recive {d} max 104500000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const RNG1MultType = struct {
            value: RNG1MultConf,
            pub fn get(comptime self: RNG1MultType) comptime_int {
                return switch (self.value) {
                    .CSIRC => CSIRC.get(),
                    .DIVR4 => DIVR4.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const RNG1outputType = struct {
            pub fn get(_: *const RNG1outputType) comptime_int {
                const from_input = RNG1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RNG1Mult on RNG1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RNG1Mult on RNG1output | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const RNG2MultType = struct {
            value: RNG2MultConf,
            pub fn get(comptime self: RNG2MultType) comptime_int {
                return switch (self.value) {
                    .CSIRC => CSIRC.get(),
                    .DIVR4 => DIVR4.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const RNG2outputType = struct {
            pub fn get(_: *const RNG2outputType) comptime_int {
                const from_input = RNG2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RNG2Mult on RNG2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RNG2Mult on RNG2output | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI6MultType = struct {
            value: SPI6MultConf,
            pub fn get(comptime self: SPI6MultType) comptime_int {
                return switch (self.value) {
                    .APB5DIV => APB5DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
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
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI6Mult on SPI6output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI45MultType = struct {
            value: SPI45MultConf,
            pub fn get(comptime self: SPI45MultType) comptime_int {
                return switch (self.value) {
                    .APB1DIV => APB1DIV.get(),
                    .DIVQ4 => DIVQ4.get(),
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
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI45Mult on SPI45output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI2MultType = struct {
            value: SAI2MultConf,
            pub fn get(comptime self: SAI2MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ4 => DIVQ4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .SPDIFMult => SPDIFMult.get(),
                    .DIVR3 => DIVR3.get(),
                };
            }
        };
        const SAI2outputType = struct {
            pub fn get(_: *const SAI2outputType) comptime_int {
                const from_input = SAI2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI2Mult on SAI2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI2Mult on SAI2output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI4MultType = struct {
            value: SAI4MultConf,
            pub fn get(comptime self: SAI4MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ4 => DIVQ4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .DIVR3 => DIVR3.get(),
                };
            }
        };
        const SAI4outputType = struct {
            pub fn get(_: *const SAI4outputType) comptime_int {
                const from_input = SAI4Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI4Mult on SAI4output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI4Mult on SAI4output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI1MultType = struct {
            value: SPI1MultConf,
            pub fn get(comptime self: SPI1MultType) comptime_int {
                return switch (self.value) {
                    .DIVP4 => DIVP4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .DIVR3 => DIVR3.get(),
                };
            }
        };
        const SPI1outputType = struct {
            pub fn get(_: *const SPI1outputType) comptime_int {
                const from_input = SPI1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI1Mult on SPI1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI1Mult on SPI1output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI23MultType = struct {
            value: SPI23MultConf,
            pub fn get(comptime self: SPI23MultType) comptime_int {
                return switch (self.value) {
                    .DIVP4 => DIVP4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .DIVR3 => DIVR3.get(),
                };
            }
        };
        const SPI23outputType = struct {
            pub fn get(_: *const SPI23outputType) comptime_int {
                const from_input = SPI23Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI23Mult on SPI23output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI23Mult on SPI23output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI1MultType = struct {
            value: SAI1MultConf,
            pub fn get(comptime self: SAI1MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ4 => DIVQ4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .DIVR3 => DIVR3.get(),
                };
            }
        };
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                const from_input = SAI1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI1Mult on SAI1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI1Mult on SAI1output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DFSDF1AudiooutputType = struct {
            pub fn get(_: *const DFSDF1AudiooutputType) comptime_int {
                return SAI1Mult.get();
            }
        };
        const SAI3MultType = struct {
            value: SAI3MultConf,
            pub fn get(comptime self: SAI3MultType) comptime_int {
                return switch (self.value) {
                    .DIVQ4 => DIVQ4.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .DIVR3 => DIVR3.get(),
                };
            }
        };
        const SAI3outputType = struct {
            pub fn get(_: *const SAI3outputType) comptime_int {
                const from_input = SAI3Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI3Mult on SAI3output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI3Mult on SAI3output | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FDCANMultType = struct {
            value: FDCANMultConf,
            pub fn get(comptime self: FDCANMultType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .DIVQ3 => DIVQ3.get(),
                    .DIVQ4 => DIVQ4.get(),
                    .DIVR4 => DIVR4.get(),
                };
            }
        };
        const FDCANoutputType = struct {
            pub fn get(_: *const FDCANoutputType) comptime_int {
                const from_input = FDCANMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from FDCANMult on FDCANoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from FDCANMult on FDCANoutput | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ETH1MultType = struct {
            value: ETH1MultConf,
            pub fn get(comptime self: ETH1MultType) comptime_int {
                return switch (self.value) {
                    .DIVP4 => DIVP4.get(),
                    .DIVQ3 => DIVQ3.get(),
                };
            }
        };
        const ETH1outputType = struct {
            pub fn get(_: *const ETH1outputType) comptime_int {
                const from_input = ETH1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ETH1Mult on ETH1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ETH1Mult on ETH1output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .DIVR4 => DIVR4.get(),
                    .CKPERCLKOutput => CKPERCLKOutput.get(),
                    .DIVQ3 => DIVQ3.get(),
                };
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                const from_input = ADCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADCMult on ADCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133250000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCMult on ADCoutput | recive {d} max 133250000\n", .{from_input}));
                }
                return from_input;
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

        const CECMultType = struct {
            value: CECMultConf,
            pub fn get(comptime self: CECMultType) comptime_int {
                return switch (self.value) {
                    .CSICECDevisor => CSICECDevisor.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const CECoutputType = struct {
            pub fn get(_: *const CECoutputType) comptime_int {
                const from_input = CECMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CECMult on CECoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CECMult on CECoutput | recive {d} max 1000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DDRPHYCType = struct {
            pub fn get(_: *const DDRPHYCType) comptime_int {
                return DIVR2.get();
            }
        };
        const PUBLType = struct {
            pub fn get(_: *const PUBLType) comptime_int {
                return DIVR2.get();
            }
        };
        const DDRCType = struct {
            pub fn get(_: *const DDRCType) comptime_int {
                return DIVR2.get();
            }
        };
        const DDRPERFMType = struct {
            pub fn get(_: *const DDRPERFMType) comptime_int {
                return DIVR2.get();
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
                    .HSEUSBPHYDevisor => HSEUSBPHYDevisor.get(),
                    .HSEOSC => HSEOSC.get(),
                    .DIVR4 => DIVR4.get(),
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
        const USBOCLKMuxType = struct {
            value: USBOCLKMuxConf,
            pub fn get(comptime self: USBOCLKMuxType) comptime_int {
                return switch (self.value) {
                    .DIVR4 => DIVR4.get(),
                    .USBPHYRC => USBPHYRC.get(),
                };
            }
        };
        const USBOFSCLKOutputType = struct {
            pub fn get(_: *const USBOFSCLKOutputType) comptime_int {
                const from_input = USBOCLKMux.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USBOCLKMux on USBOFSCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USBOCLKMux on USBOFSCLKOutput | recive {d} max 50000000\n", .{from_input}));
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
        const HSIRC = HSIRCType{};
        const HSIDiv = HSIDivType{ .value = conf.HSIDiv };
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const CSIRC = CSIRCType{};
        const I2S_CKIN = I2S_CKINType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const MPUMult = MPUMultType{ .value = conf.MPUMult };
        pub const MPUCLKOutput = MPUCLKOutputType{};
        const CKPERMult = CKPERMultType{ .value = conf.CKPERMult };
        pub const CKPERCLKOutput = CKPERCLKOutputType{};
        const AXIMult = AXIMultType{ .value = conf.AXIMult };
        pub const AXICLKOutput = AXICLKOutputType{};
        pub const DACCLKOutput = DACCLKOutputType{};
        const AXIDIV = AXIDIVType{ .value = conf.AXIDIV };
        pub const AXIOutput = AXIOutputType{};
        pub const Hclk5Output = Hclk5OutputType{};
        pub const Hclk6Output = Hclk6OutputType{};
        const APB4DIV = APB4DIVType{ .value = conf.APB4DIV };
        pub const APB4DIVOutput = APB4DIVOutputType{};
        const APB5DIV = APB5DIVType{ .value = conf.APB5DIV };
        pub const APB5DIVOutput = APB5DIVOutputType{};
        const MCO1Mult = MCO1MultType{ .value = conf.MCO1Mult };
        const MCO1Div = MCO1DivType{ .value = conf.MCO1Div };
        pub const MCO1Pin = MCO1PinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const MCUDIV = MCUDIVType{ .value = conf.MCUDIV };
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        pub const McuClockOutput = McuClockOutputType{};
        const APB3DIV = APB3DIVType{ .value = conf.APB3DIV };
        pub const APB3Output = APB3OutputType{};
        const APB1DIV = APB1DIVType{ .value = conf.APB1DIV };
        const Tim1Mul = Tim1MulType{};
        pub const Tim1Output = Tim1OutputType{};
        pub const AHBOutput = AHBOutputType{};
        pub const APB1Output = APB1OutputType{};
        const APB2DIV = APB2DIVType{ .value = conf.APB2DIV };
        const Tim2Mul = Tim2MulType{};
        pub const Tim2Output = Tim2OutputType{};
        pub const APB2Output = APB2OutputType{};
        pub const DFSDM1Output = DFSDM1OutputType{};
        const PLL12Source = PLL12SourceType{ .value = conf.PLL12Source };
        const DIVM1 = DIVM1Type{ .value = conf.DIVM1 };
        const DIVM2 = DIVM2Type{ .value = conf.DIVM2 };
        const PLL3Source = PLL3SourceType{ .value = conf.PLL3Source };
        const DIVM3 = DIVM3Type{ .value = conf.DIVM3 };
        const PLL4Source = PLL4SourceType{ .value = conf.PLL4Source };
        const DIVM4 = DIVM4Type{ .value = conf.DIVM4 };
        const MPUDIV = MPUDIVType{ .value = conf.MPUDIV };
        const FreqCk1 = FreqCk1Type{};
        const DIVN1 = DIVN1Type{ .value = conf.DIVN1 };
        const PLL1FRACV = PLL1FRACVType{ .value = conf.PLL1FRACV };
        const DIVN1Mul2Div2 = DIVN1Mul2Div2Type{};
        const DIVP1 = DIVP1Type{ .value = conf.DIVP1 };
        const DIVQ1 = DIVQ1Type{ .value = conf.DIVQ1 };
        pub const DIVQ1output = DIVQ1outputType{};
        const DIVR1 = DIVR1Type{ .value = conf.DIVR1 };
        pub const DIVR1output = DIVR1outputType{};
        const FreqCk2 = FreqCk2Type{};
        const DIVN2 = DIVN2Type{ .value = conf.DIVN2 };
        const PLL2FRACV = PLL2FRACVType{ .value = conf.PLL2FRACV };
        const DIVN2Mul2Div2 = DIVN2Mul2Div2Type{};
        const DIVP2 = DIVP2Type{ .value = conf.DIVP2 };
        const DIVQ2 = DIVQ2Type{ .value = conf.DIVQ2 };
        pub const DIVQ2output = DIVQ2outputType{};
        const DIVR2 = DIVR2Type{ .value = conf.DIVR2 };
        pub const DIVR2output = DIVR2outputType{};
        const DIVN3 = DIVN3Type{ .value = conf.DIVN3 };
        const PLL3FRACV = PLL3FRACVType{ .value = conf.PLL3FRACV };
        const DIVP3 = DIVP3Type{ .value = conf.DIVP3 };
        const DIVQ3 = DIVQ3Type{ .value = conf.DIVQ3 };
        pub const DIVQ3output = DIVQ3outputType{};
        const DIVR3 = DIVR3Type{ .value = conf.DIVR3 };
        pub const LTDCOutput = LTDCOutputType{};
        pub const DIVR3output = DIVR3outputType{};
        const DIVN4 = DIVN4Type{ .value = conf.DIVN4 };
        const PLL4FRACV = PLL4FRACVType{ .value = conf.PLL4FRACV };
        const DIVP4 = DIVP4Type{ .value = conf.DIVP4 };
        pub const DIVP4output = DIVP4outputType{};
        pub const PLL4DSIInput = PLL4DSIInputType{};
        const DIVQ4 = DIVQ4Type{ .value = conf.DIVQ4 };
        pub const DIVQ4output = DIVQ4outputType{};
        const DIVR4 = DIVR4Type{ .value = conf.DIVR4 };
        pub const DIVR4output = DIVR4outputType{};
        const DSIPHYPrescaler = DSIPHYPrescalerType{};
        const DSIMult = DSIMultType{ .value = conf.DSIMult };
        pub const DSIoutput = DSIoutputType{};
        const DSITXPrescaler = DSITXPrescalerType{ .value = conf.DSITXPrescaler };
        pub const DSITXCLKEsc = DSITXCLKEscType{};
        pub const DSIPixel = DSIPixelType{};
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const I2C12Mult = I2C12MultType{ .value = conf.I2C12Mult };
        pub const I2C12output = I2C12outputType{};
        const I2C35Mult = I2C35MultType{ .value = conf.I2C35Mult };
        pub const I2C35output = I2C35outputType{};
        const I2C46Mult = I2C46MultType{ .value = conf.I2C46Mult };
        pub const I2C46output = I2C46outputType{};
        const SPDIFMult = SPDIFMultType{ .value = conf.SPDIFMult };
        pub const SPDIFoutput = SPDIFoutputType{};
        const QSPIMult = QSPIMultType{ .value = conf.QSPIMult };
        pub const QSPIoutput = QSPIoutputType{};
        const FMCMult = FMCMultType{ .value = conf.FMCMult };
        pub const FMCoutput = FMCoutputType{};
        const SDMMC12Mult = SDMMC12MultType{ .value = conf.SDMMC12Mult };
        pub const SDMMC12output = SDMMC12outputType{};
        const SDMMC3Mult = SDMMC3MultType{ .value = conf.SDMMC3Mult };
        pub const SDMMC3output = SDMMC3outputType{};
        const STGENMult = STGENMultType{ .value = conf.STGENMult };
        pub const STGENoutput = STGENoutputType{};
        const LPTIM45Mult = LPTIM45MultType{ .value = conf.LPTIM45Mult };
        pub const LPTIM45output = LPTIM45outputType{};
        const LPTIM23Mult = LPTIM23MultType{ .value = conf.LPTIM23Mult };
        pub const LPTIM23output = LPTIM23outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART24Mult = USART24MultType{ .value = conf.USART24Mult };
        pub const USART24output = USART24outputType{};
        const USART35Mult = USART35MultType{ .value = conf.USART35Mult };
        pub const USART35output = USART35outputType{};
        const USART6Mult = USART6MultType{ .value = conf.USART6Mult };
        pub const USART6output = USART6outputType{};
        const UART78Mult = UART78MultType{ .value = conf.UART78Mult };
        pub const USART78output = USART78outputType{};
        const RNG1Mult = RNG1MultType{ .value = conf.RNG1Mult };
        pub const RNG1output = RNG1outputType{};
        const RNG2Mult = RNG2MultType{ .value = conf.RNG2Mult };
        pub const RNG2output = RNG2outputType{};
        const SPI6Mult = SPI6MultType{ .value = conf.SPI6Mult };
        pub const SPI6output = SPI6outputType{};
        const SPI45Mult = SPI45MultType{ .value = conf.SPI45Mult };
        pub const SPI45output = SPI45outputType{};
        const SAI2Mult = SAI2MultType{ .value = conf.SAI2Mult };
        pub const SAI2output = SAI2outputType{};
        const SAI4Mult = SAI4MultType{ .value = conf.SAI4Mult };
        pub const SAI4output = SAI4outputType{};
        const SPI1Mult = SPI1MultType{ .value = conf.SPI1Mult };
        pub const SPI1output = SPI1outputType{};
        const SPI23Mult = SPI23MultType{ .value = conf.SPI23Mult };
        pub const SPI23output = SPI23outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        pub const DFSDF1Audiooutput = DFSDF1AudiooutputType{};
        const SAI3Mult = SAI3MultType{ .value = conf.SAI3Mult };
        pub const SAI3output = SAI3outputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANoutput = FDCANoutputType{};
        const ETH1Mult = ETH1MultType{ .value = conf.ETH1Mult };
        pub const ETH1output = ETH1outputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const CSICECDevisor = CSICECDevisorType{ .value = conf.CSICECDevisor };
        const CECMult = CECMultType{ .value = conf.CECMult };
        pub const CECoutput = CECoutputType{};
        pub const DDRPHYC = DDRPHYCType{};
        pub const PUBL = PUBLType{};
        pub const DDRC = DDRCType{};
        pub const DDRPERFM = DDRPERFMType{};
        const HSEUSBPHYDevisor = HSEUSBPHYDevisorType{ .value = conf.HSEUSBPHYDevisor };
        const USBPHYCLKMux = USBPHYCLKMuxType{ .value = conf.USBPHYCLKMux };
        pub const USBPHYCLKOutput = USBPHYCLKOutputType{};
        const USBPHYRC = USBPHYRCType{};
        const USBOCLKMux = USBOCLKMuxType{ .value = conf.USBOCLKMux };
        pub const USBOFSCLKOutput = USBOFSCLKOutputType{};
        const PLLDSIIDF = PLLDSIIDFType{ .value = conf.PLLDSIIDF };
        const PLLDSIMultiplicator = PLLDSIMultiplicatorType{};
        const PLLDSINDIV = PLLDSINDIVType{ .value = conf.PLLDSINDIV };
        pub const VCOoutput = VCOoutputType{};
        const PLLDSIDevisor = PLLDSIDevisorType{};
        const PLLDSIODF = PLLDSIODFType{ .value = conf.PLLDSIODF };
        pub const PLLDSIoutput = PLLDSIoutputType{};

        pub fn validate() void {
            _ = SysCLKOutput.get();
            _ = MPUCLKOutput.get();
            _ = CKPERCLKOutput.get();
            _ = AXICLKOutput.get();
            _ = AXIOutput.get();
            _ = Hclk5Output.get();
            _ = Hclk6Output.get();
            _ = APB4DIVOutput.get();
            _ = APB5DIVOutput.get();
            _ = CortexSysOutput.get();
            _ = McuClockOutput.get();
            _ = APB3Output.get();
            _ = Tim1Output.get();
            _ = AHBOutput.get();
            _ = APB1Output.get();
            _ = Tim2Output.get();
            _ = APB2Output.get();
            _ = DFSDM1Output.get();
            _ = DIVQ2output.get();
            _ = LTDCOutput.get();
            _ = DSIoutput.get();
            _ = DSITXCLKEsc.get();
            _ = DSIPixel.get();
            _ = I2C12output.get();
            _ = I2C35output.get();
            _ = I2C46output.get();
            _ = SPDIFoutput.get();
            _ = QSPIoutput.get();
            _ = FMCoutput.get();
            _ = SDMMC12output.get();
            _ = SDMMC3output.get();
            _ = STGENoutput.get();
            _ = LPTIM45output.get();
            _ = LPTIM23output.get();
            _ = LPTIM1output.get();
            _ = USART1output.get();
            _ = USART24output.get();
            _ = USART35output.get();
            _ = USART6output.get();
            _ = USART78output.get();
            _ = RNG1output.get();
            _ = RNG2output.get();
            _ = SPI6output.get();
            _ = SPI45output.get();
            _ = SAI2output.get();
            _ = SAI4output.get();
            _ = SPI1output.get();
            _ = SPI23output.get();
            _ = SAI1output.get();
            _ = DFSDF1Audiooutput.get();
            _ = SAI3output.get();
            _ = FDCANoutput.get();
            _ = ETH1output.get();
            _ = ADCoutput.get();
            _ = CECoutput.get();
            _ = DDRC.get();
            _ = DDRPERFM.get();
            _ = USBPHYCLKOutput.get();
            _ = USBOFSCLKOutput.get();
        }
    };

    return ClockStruct;
}
