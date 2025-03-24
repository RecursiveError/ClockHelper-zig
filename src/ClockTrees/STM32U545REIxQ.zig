const std = @import("std");

pub const SAESMultConf = enum {
    SHSIRC,
    SHSIDiv,
};
pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4000000) {
            @compileError("min value for HSEOSC is 4000000\n");
        } else if (val > 55000000) {
            @compileError("min value for HSEOSC is 55000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 55000000;
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
pub const LSIDIVConf = enum {
    const this = @This();
    DIV1,
    DIV128,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV128 => 128,
        };
    }
};
pub const LSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: LSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 5000) {
            @compileError("min value for LSEOSC is 5000\n");
        } else if (val > 40000) {
            @compileError("min value for LSEOSC is 40000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 40000;
    }

    pub fn min() comptime_int {
        return 5000;
    }
};
pub const MSIRCConf = enum {
    const this = @This();
    CLOCK_48000,
    CLOCK_24000,
    CLOCK_16000,
    CLOCK_12000,
    CLOCK_4000,
    CLOCK_2000,
    CLOCK_1330,
    CLOCK_1000,
    CLOCK_3072,
    CLOCK_1536,
    CLOCK_1024,
    CLOCK_768,
    CLOCK_400,
    CLOCK_200,
    CLOCK_133,
    CLOCK_100,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .CLOCK_48000 => 48000,
            .CLOCK_24000 => 24000,
            .CLOCK_16000 => 16000,
            .CLOCK_12000 => 12000,
            .CLOCK_4000 => 4000,
            .CLOCK_2000 => 2000,
            .CLOCK_1330 => 1330,
            .CLOCK_1000 => 1000,
            .CLOCK_3072 => 3072,
            .CLOCK_1536 => 1536,
            .CLOCK_1024 => 1024,
            .CLOCK_768 => 768,
            .CLOCK_400 => 400,
            .CLOCK_200 => 200,
            .CLOCK_133 => 133,
            .CLOCK_100 => 100,
        };
    }
};
pub const MSIKRCConf = enum {
    const this = @This();
    CLOCK_48000,
    CLOCK_24000,
    CLOCK_16000,
    CLOCK_12000,
    CLOCK_4000,
    CLOCK_2000,
    CLOCK_1330,
    CLOCK_1000,
    CLOCK_3072,
    CLOCK_1536,
    CLOCK_1024,
    CLOCK_768,
    CLOCK_400,
    CLOCK_200,
    CLOCK_133,
    CLOCK_100,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .CLOCK_48000 => 48000,
            .CLOCK_24000 => 24000,
            .CLOCK_16000 => 16000,
            .CLOCK_12000 => 12000,
            .CLOCK_4000 => 4000,
            .CLOCK_2000 => 2000,
            .CLOCK_1330 => 1330,
            .CLOCK_1000 => 1000,
            .CLOCK_3072 => 3072,
            .CLOCK_1536 => 1536,
            .CLOCK_1024 => 1024,
            .CLOCK_768 => 768,
            .CLOCK_400 => 400,
            .CLOCK_200 => 200,
            .CLOCK_133 => 133,
            .CLOCK_100 => 100,
        };
    }
};
pub const SysClkSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
    PLL1R,
};
pub const PLLSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const PLL2SourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const PLL3SourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const PLLMConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLMConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLM is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLLM is 16\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLL2MConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2MConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL2M is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLL2M is 16\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLL3MConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3MConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL3M is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLL3M is 16\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIDIV,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const USART3MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const UART4MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const UART5MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    APB3Output,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    MSIKRC,
};
pub const LPTIM1MultConf = enum {
    MSIKRC,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const LPTIM2MultConf = enum {
    APB1Prescaler,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const DACMultConf = enum {
    LSEOSC,
    LSIDIV,
};
pub const ADCMultConf = enum {
    AHBOutput,
    SysCLKOutput,
    PLL2R,
    HSEOSC,
    HSIRC,
    MSIKRC,
};
pub const CK48MultConf = enum {
    PLL2Q,
    PLL1Q,
    MSIKRC,
    HSI48RC,
};
pub const SDMMC1MultConf = enum {
    PLL1P,
    CK48Mult,
};
pub const FDCANMultConf = enum {
    PLL1Q,
    PLL2P,
    HSEOSC,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    MSIKRC,
};
pub const I2C2MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    MSIKRC,
};
pub const I2C3MultConf = enum {
    APB3Output,
    SysCLKOutput,
    HSIRC,
    MSIKRC,
};
pub const SAI1MultConf = enum {
    PLL2P,
    PLL3P,
    PLL1P,
    SAI1_EXT,
    HSIRC,
};
pub const I2C4MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    MSIKRC,
};
pub const MDF1MultConf = enum {
    AHBOutput,
    PLL1P,
    PLL3Q,
    SAI1_EXT,
    MSIKRC,
};
pub const ADF1MultConf = enum {
    AHBOutput,
    PLL1P,
    PLL3Q,
    SAI1_EXT,
    MSIKRC,
};
pub const OCTOSPIMMultConf = enum {
    MSIKRC,
    SysCLKOutput,
    PLL1Q,
    PLL2Q,
};
pub const LPTIM3MultConf = enum {
    MSIKRC,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const RNGMultConf = enum {
    HSI48RC,
    HSI48DivToRNG,
    HSIRC,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIDIV,
    HSEOSC,
    HSIRC,
    PLL1R,
    SysCLKOutput,
    MSIRC,
    HSI48RC,
    MSIKRC,
};
pub const MCODivConf = enum {
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
pub const LSCOMultConf = enum {
    LSIDIV,
    LSEOSC,
};
pub const AHBPrescalerConf = enum {
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
pub const CortexCLockSelectionConf = enum {
    CortexPrescaler,
    LSEOSC,
    LSIDIV,
};
pub const APB1PrescalerConf = enum {
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
pub const APB2PrescalerConf = enum {
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
pub const APB3PrescalerConf = enum {
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
pub const SPI1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRC,
    MSIKRC,
};
pub const SPI3MultConf = enum {
    APB3Output,
    SysCLKOutput,
    HSIRC,
    MSIKRC,
};
pub const SPI2MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    MSIKRC,
};
pub const PLLNConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLNConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4) {
            @compileError("min value for PLLN is 4\n");
        } else if (val > 512) {
            @compileError("min value for PLLN is 512\n");
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
pub const PLL1PConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL1PConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL1P is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL1P is 128\n");
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
pub const PLL1QConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL1QConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL1Q is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL1Q is 128\n");
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
pub const PLL1RConf = enum {
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
pub const PLL2NConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2NConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4) {
            @compileError("min value for PLL2N is 4\n");
        } else if (val > 512) {
            @compileError("min value for PLL2N is 512\n");
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
pub const PLL2PConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2PConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL2P is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL2P is 128\n");
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
pub const PLL2QConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2QConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL2Q is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL2Q is 128\n");
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
pub const PLL2RConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2RConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL2R is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL2R is 128\n");
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
pub const PLL3NConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3NConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4) {
            @compileError("min value for PLL3N is 4\n");
        } else if (val > 512) {
            @compileError("min value for PLL3N is 512\n");
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
pub const PLL3PConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3PConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL3P is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL3P is 128\n");
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
pub const PLL3QConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3QConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL3Q is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL3Q is 128\n");
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
pub const PLL3RConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3RConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL3R is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL3R is 128\n");
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
pub const Config = struct {
    SAESMult: SAESMultConf = .SHSIRC,
    HSEOSC: HSEOSCConf = @enumFromInt(16000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSIDIV: LSIDIVConf = .DIV1,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .CLOCK_4000,
    MSIKRC: MSIKRCConf = .CLOCK_4000,
    SysClkSource: SysClkSourceConf = .MSIRC,
    PLLSource: PLLSourceConf = .MSIRC,
    PLL2Source: PLL2SourceConf = .MSIRC,
    PLL3Source: PLL3SourceConf = .MSIRC,
    PLLM: PLLMConf = @enumFromInt(1),
    PLL2M: PLL2MConf = @enumFromInt(1),
    PLL3M: PLL3MConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIDIV,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB3Output,
    LPTIM1Mult: LPTIM1MultConf = .MSIKRC,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    DACMult: DACMultConf = .LSIDIV,
    ADCMult: ADCMultConf = .HSIRC,
    CK48Mult: CK48MultConf = .HSI48RC,
    SDMMC1Mult: SDMMC1MultConf = .PLL1P,
    FDCANMult: FDCANMultConf = .PLL1Q,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB3Output,
    SAI1Mult: SAI1MultConf = .PLL2P,
    I2C4Mult: I2C4MultConf = .APB1Prescaler,
    MDF1Mult: MDF1MultConf = .AHBOutput,
    ADF1Mult: ADF1MultConf = .AHBOutput,
    OCTOSPIMMult: OCTOSPIMMultConf = .SysCLKOutput,
    LPTIM3Mult: LPTIM3MultConf = .MSIKRC,
    RNGMult: RNGMultConf = .HSI48RC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIDIV,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    CortexCLockSelection: CortexCLockSelectionConf = .CortexPrescaler,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    APB3Prescaler: APB3PrescalerConf = .DIV1,
    SPI1Mult: SPI1MultConf = .SysCLKOutput,
    SPI3Mult: SPI3MultConf = .SysCLKOutput,
    SPI2Mult: SPI2MultConf = .SysCLKOutput,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = @enumFromInt(2),
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = .DIV2,
    PLL2N: PLL2NConf = @enumFromInt(129),
    PLL2FRACN: PLL2FRACNConf = @enumFromInt(0),
    PLL2P: PLL2PConf = @enumFromInt(2),
    PLL2Q: PLL2QConf = @enumFromInt(2),
    PLL2R: PLL2RConf = @enumFromInt(2),
    PLL3N: PLL3NConf = @enumFromInt(129),
    PLL3FRACN: PLL3FRACNConf = @enumFromInt(0),
    PLL3P: PLL3PConf = @enumFromInt(2),
    PLL3Q: PLL3QConf = @enumFromInt(2),
    PLL3R: PLL3RConf = @enumFromInt(2),
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 16000000;
            }
        };
        const CRSCLKoutputType = struct {
            pub fn get(_: *const CRSCLKoutputType) comptime_int {
                return HSI48RC.get();
            }
        };
        const HSI48RCType = struct {
            pub fn get(_: *const HSI48RCType) comptime_int {
                return 48000000;
            }
        };
        const SHSIRCType = struct {
            pub fn get(_: *const SHSIRCType) comptime_int {
                return 48000000;
            }
        };
        const SHSIDivType = struct {
            pub fn get(_: *const SHSIDivType) comptime_int {
                if (!@hasDecl(this, "SHSIRC")) {
                    @compileError("No Input SHSIRC for SHSIDiv\n");
                }
                const from_input = this.SHSIRC.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const SAESMultType = struct {
            value: SAESMultConf,
            pub fn get(comptime self: SAESMultType) comptime_int {
                return switch (self.value) {
                    .SHSIRC => SHSIRC.get(),
                    .SHSIDiv => SHSIDiv.get(),
                };
            }
        };
        const SAESoutputType = struct {
            pub fn get(_: *const SAESoutputType) comptime_int {
                return SAESMult.get();
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
        const LSIDIVType = struct {
            value: LSIDIVConf,

            pub fn get(self: *const LSIDIVType) comptime_int {
                if (!@hasDecl(this, "LSIRC")) {
                    @compileError("No Input LSIRC for LSIDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.LSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const LSEOSCType = struct {
            value: LSEOSCConf,
            pub fn get(comptime self: LSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const MSIRCType = struct {
            value: MSIRCConf,
            pub fn get(comptime self: MSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const MSIKRCType = struct {
            value: MSIKRCConf,
            pub fn get(comptime self: MSIKRCType) comptime_int {
                return self.value.get();
            }
        };
        const SAI1_EXTType = struct {
            pub fn get(_: *const SAI1_EXTType) comptime_int {
                return 48000;
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLL1R => PLL1R.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                return SysClkSource.get();
            }
        };
        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const PLL2SourceType = struct {
            value: PLL2SourceConf,
            pub fn get(comptime self: PLL2SourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const PLL3SourceType = struct {
            value: PLL3SourceConf,
            pub fn get(comptime self: PLL3SourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const PLLMType = struct {
            value: PLLMConf,

            pub fn get(self: *const PLLMType) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for PLLM\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL2MType = struct {
            value: PLL2MConf,

            pub fn get(self: *const PLL2MType) comptime_int {
                if (!@hasDecl(this, "PLL2Source")) {
                    @compileError("No Input PLL2Source for PLL2M\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL2Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL3MType = struct {
            value: PLL3MConf,

            pub fn get(self: *const PLL3MType) comptime_int {
                if (!@hasDecl(this, "PLL3Source")) {
                    @compileError("No Input PLL3Source for PLL3M\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const HSERTCDevisorType = struct {
            pub fn get(_: *const HSERTCDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSERTCDevisor\n");
                }
                const from_input = this.HSEOSC.get();
                const div = 32;
                return (from_input / div);
            }
        };

        const RTCClkSourceType = struct {
            value: RTCClkSourceConf,
            pub fn get(comptime self: RTCClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSERTCDevisor => HSERTCDevisor.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIDIV => LSIDIV.get(),
                };
            }
        };
        const RTCOutputType = struct {
            pub fn get(_: *const RTCOutputType) comptime_int {
                const from_input = RTCClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RTCClkSource on RTCOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1562500) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RTCClkSource on RTCOutput | recive {d} max 1562500\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
                return LSIDIV.get();
            }
        };
        const USART1MultType = struct {
            value: USART1MultConf,
            pub fn get(comptime self: USART1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Prescaler => APB2Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART1outputType = struct {
            pub fn get(_: *const USART1outputType) comptime_int {
                return USART1Mult.get();
            }
        };
        const USART3MultType = struct {
            value: USART3MultConf,
            pub fn get(comptime self: USART3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART3outputType = struct {
            pub fn get(_: *const USART3outputType) comptime_int {
                return USART3Mult.get();
            }
        };
        const UART4MultType = struct {
            value: UART4MultConf,
            pub fn get(comptime self: UART4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const UART4outputType = struct {
            pub fn get(_: *const UART4outputType) comptime_int {
                return UART4Mult.get();
            }
        };
        const UART5MultType = struct {
            value: UART5MultConf,
            pub fn get(comptime self: UART5MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const UART5outputType = struct {
            pub fn get(_: *const UART5outputType) comptime_int {
                return UART5Mult.get();
            }
        };
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .APB3Output => APB3Output.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIKRC => MSIKRC.get(),
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
                    .MSIKRC => MSIKRC.get(),
                    .LSIDIV => LSIDIV.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPTIM1outputType = struct {
            pub fn get(_: *const LPTIM1outputType) comptime_int {
                const from_input = LPTIM1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM1Mult on LPTIM1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM1Mult on LPTIM1output | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM2MultType = struct {
            value: LPTIM2MultConf,
            pub fn get(comptime self: LPTIM2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .LSIDIV => LSIDIV.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPTIM2outputType = struct {
            pub fn get(_: *const LPTIM2outputType) comptime_int {
                return LPTIM2Mult.get();
            }
        };
        const DACMultType = struct {
            value: DACMultConf,
            pub fn get(comptime self: DACMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIDIV => LSIDIV.get(),
                };
            }
        };
        const DACoutputType = struct {
            pub fn get(_: *const DACoutputType) comptime_int {
                return DACMult.get();
            }
        };
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLL2R => PLL2R.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                return ADCMult.get();
            }
        };
        const CK48MultType = struct {
            value: CK48MultConf,
            pub fn get(comptime self: CK48MultType) comptime_int {
                return switch (self.value) {
                    .PLL2Q => PLL2Q.get(),
                    .PLL1Q => PLL1Q.get(),
                    .MSIKRC => MSIKRC.get(),
                    .HSI48RC => HSI48RC.get(),
                };
            }
        };
        const CK48outputType = struct {
            pub fn get(_: *const CK48outputType) comptime_int {
                const from_input = CK48Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CK48Mult on CK48output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CK48Mult on CK48output | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                return CK48Mult.get();
            }
        };
        const SDMMC1MultType = struct {
            value: SDMMC1MultConf,
            pub fn get(comptime self: SDMMC1MultType) comptime_int {
                return switch (self.value) {
                    .PLL1P => PLL1P.get(),
                    .CK48Mult => CK48Mult.get(),
                };
            }
        };
        const SDMMCC1OutputType = struct {
            pub fn get(_: *const SDMMCC1OutputType) comptime_int {
                const from_input = SDMMC1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMC1Mult on SDMMCC1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 55000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMC1Mult on SDMMCC1Output | recive {d} max 55000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FDCANMultType = struct {
            value: FDCANMultConf,
            pub fn get(comptime self: FDCANMultType) comptime_int {
                return switch (self.value) {
                    .PLL1Q => PLL1Q.get(),
                    .PLL2P => PLL2P.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const FDCANOutputType = struct {
            pub fn get(_: *const FDCANOutputType) comptime_int {
                return FDCANMult.get();
            }
        };
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const I2C1outputType = struct {
            pub fn get(_: *const I2C1outputType) comptime_int {
                return I2C1Mult.get();
            }
        };
        const I2C2MultType = struct {
            value: I2C2MultConf,
            pub fn get(comptime self: I2C2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const I2C2outputType = struct {
            pub fn get(_: *const I2C2outputType) comptime_int {
                return I2C2Mult.get();
            }
        };
        const I2C3MultType = struct {
            value: I2C3MultConf,
            pub fn get(comptime self: I2C3MultType) comptime_int {
                return switch (self.value) {
                    .APB3Output => APB3Output.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const I2C3outputType = struct {
            pub fn get(_: *const I2C3outputType) comptime_int {
                return I2C3Mult.get();
            }
        };
        const SAI1MultType = struct {
            value: SAI1MultConf,
            pub fn get(comptime self: SAI1MultType) comptime_int {
                return switch (self.value) {
                    .PLL2P => PLL2P.get(),
                    .PLL3P => PLL3P.get(),
                    .PLL1P => PLL1P.get(),
                    .SAI1_EXT => SAI1_EXT.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                return SAI1Mult.get();
            }
        };
        const I2C4MultType = struct {
            value: I2C4MultConf,
            pub fn get(comptime self: I2C4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const I2C4outputType = struct {
            pub fn get(_: *const I2C4outputType) comptime_int {
                return I2C4Mult.get();
            }
        };
        const MDF1MultType = struct {
            value: MDF1MultConf,
            pub fn get(comptime self: MDF1MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .PLL1P => PLL1P.get(),
                    .PLL3Q => PLL3Q.get(),
                    .SAI1_EXT => SAI1_EXT.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const MDF1outputType = struct {
            pub fn get(_: *const MDF1outputType) comptime_int {
                return MDF1Mult.get();
            }
        };
        const ADF1MultType = struct {
            value: ADF1MultConf,
            pub fn get(comptime self: ADF1MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .PLL1P => PLL1P.get(),
                    .PLL3Q => PLL3Q.get(),
                    .SAI1_EXT => SAI1_EXT.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const ADF1outputType = struct {
            pub fn get(_: *const ADF1outputType) comptime_int {
                return ADF1Mult.get();
            }
        };
        const OCTOSPIMMultType = struct {
            value: OCTOSPIMMultConf,
            pub fn get(comptime self: OCTOSPIMMultType) comptime_int {
                return switch (self.value) {
                    .MSIKRC => MSIKRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLL1Q => PLL1Q.get(),
                    .PLL2Q => PLL2Q.get(),
                };
            }
        };
        const OCTOSPIMoutputType = struct {
            pub fn get(_: *const OCTOSPIMoutputType) comptime_int {
                return OCTOSPIMMult.get();
            }
        };
        const LPTIM3MultType = struct {
            value: LPTIM3MultConf,
            pub fn get(comptime self: LPTIM3MultType) comptime_int {
                return switch (self.value) {
                    .MSIKRC => MSIKRC.get(),
                    .LSIDIV => LSIDIV.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPTIM3outputType = struct {
            pub fn get(_: *const LPTIM3outputType) comptime_int {
                return LPTIM3Mult.get();
            }
        };
        const HSI48DivToRNGType = struct {
            pub fn get(_: *const HSI48DivToRNGType) comptime_int {
                if (!@hasDecl(this, "HSI48RC")) {
                    @compileError("No Input HSI48RC for HSI48DivToRNG\n");
                }
                const from_input = this.HSI48RC.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const RNGMultType = struct {
            value: RNGMultConf,
            pub fn get(comptime self: RNGMultType) comptime_int {
                return switch (self.value) {
                    .HSI48RC => HSI48RC.get(),
                    .HSI48DivToRNG => HSI48DivToRNG.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                const from_input = RNGMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RNGMult on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RNGMult on RNGoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIDIV => LSIDIV.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .PLL1R => PLL1R.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MSIRC => MSIRC.get(),
                    .HSI48RC => HSI48RC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const MCODivType = struct {
            value: MCODivConf,

            pub fn get(self: *const MCODivType) comptime_int {
                if (!@hasDecl(this, "MCOMult")) {
                    @compileError("No Input MCOMult for MCODiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCOMult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCOPinType = struct {
            pub fn get(_: *const MCOPinType) comptime_int {
                return MCODiv.get();
            }
        };
        const LSCOMultType = struct {
            value: LSCOMultConf,
            pub fn get(comptime self: LSCOMultType) comptime_int {
                return switch (self.value) {
                    .LSIDIV => LSIDIV.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LSCOOutputType = struct {
            pub fn get(_: *const LSCOOutputType) comptime_int {
                return LSCOMult.get();
            }
        };
        const AHBPrescalerType = struct {
            value: AHBPrescalerConf,

            pub fn get(self: *const AHBPrescalerType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for AHBPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                return AHBPrescaler.get();
            }
        };
        const HCLKOutputType = struct {
            pub fn get(_: *const HCLKOutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const CortexPrescalerType = struct {
            value: CortexPrescalerConf,

            pub fn get(self: *const CortexPrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for CortexPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CortexCLockSelectionType = struct {
            value: CortexCLockSelectionConf,
            pub fn get(comptime self: CortexCLockSelectionType) comptime_int {
                return switch (self.value) {
                    .CortexPrescaler => CortexPrescaler.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIDIV => LSIDIV.get(),
                };
            }
        };
        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                return CortexCLockSelection.get();
            }
        };
        const FCLKCortexOutputType = struct {
            pub fn get(_: *const FCLKCortexOutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const APB1PrescalerType = struct {
            value: APB1PrescalerConf,

            pub fn get(self: *const APB1PrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for APB1Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB1OutputType = struct {
            pub fn get(_: *const APB1OutputType) comptime_int {
                return APB1Prescaler.get();
            }
        };
        const TimPrescalerAPB1Type = struct {
            pub fn get(_: *const TimPrescalerAPB1Type) comptime_int {
                if (!@hasDecl(this, "APB1Prescaler")) {
                    @compileError("No Input APB1Prescaler for TimPrescalerAPB1\n");
                }
                const from_input = this.APB1Prescaler.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const TimPrescOut1Type = struct {
            pub fn get(_: *const TimPrescOut1Type) comptime_int {
                return TimPrescalerAPB1.get();
            }
        };
        const APB2PrescalerType = struct {
            value: APB2PrescalerConf,

            pub fn get(self: *const APB2PrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for APB2Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB2OutputType = struct {
            pub fn get(_: *const APB2OutputType) comptime_int {
                return APB2Prescaler.get();
            }
        };
        const APB3PrescalerType = struct {
            value: APB3PrescalerConf,

            pub fn get(self: *const APB3PrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for APB3Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB3OutputType = struct {
            pub fn get(_: *const APB3OutputType) comptime_int {
                return APB3Prescaler.get();
            }
        };
        const TimPrescalerAPB2Type = struct {
            pub fn get(_: *const TimPrescalerAPB2Type) comptime_int {
                if (!@hasDecl(this, "APB2Prescaler")) {
                    @compileError("No Input APB2Prescaler for TimPrescalerAPB2\n");
                }
                const from_input = this.APB2Prescaler.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const TimPrescOut2Type = struct {
            pub fn get(_: *const TimPrescOut2Type) comptime_int {
                return TimPrescalerAPB2.get();
            }
        };
        const SPI1MultType = struct {
            value: SPI1MultConf,
            pub fn get(comptime self: SPI1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Prescaler => APB2Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const SPI1outputType = struct {
            pub fn get(_: *const SPI1outputType) comptime_int {
                return SPI1Mult.get();
            }
        };
        const SPI3MultType = struct {
            value: SPI3MultConf,
            pub fn get(comptime self: SPI3MultType) comptime_int {
                return switch (self.value) {
                    .APB3Output => APB3Output.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const SPI3outputType = struct {
            pub fn get(_: *const SPI3outputType) comptime_int {
                return SPI3Mult.get();
            }
        };
        const SPI2MultType = struct {
            value: SPI2MultConf,
            pub fn get(comptime self: SPI2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIKRC => MSIKRC.get(),
                };
            }
        };
        const SPI2outputType = struct {
            pub fn get(_: *const SPI2outputType) comptime_int {
                return SPI2Mult.get();
            }
        };
        const PLLNType = struct {
            value: PLLNConf,

            pub fn get(self: *const PLLNType) comptime_int {
                if (!@hasDecl(this, "PLLM")) {
                    @compileError("No Input PLLM for PLLN\n");
                } else if (!@hasDecl(this, "PLLFRACN")) {
                    @compileError("No fractional  value: PLLFRACN for PLLN\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLM.get());
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
        const PLL1PType = struct {
            value: PLL1PConf,

            pub fn get(self: *const PLL1PType) comptime_int {
                if (!@hasDecl(this, "PLLN")) {
                    @compileError("No Input PLLN for PLL1P\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLN.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLPoutputType = struct {
            pub fn get(_: *const PLLPoutputType) comptime_int {
                return PLL1P.get();
            }
        };
        const PLL1QType = struct {
            value: PLL1QConf,

            pub fn get(self: *const PLL1QType) comptime_int {
                if (!@hasDecl(this, "PLLN")) {
                    @compileError("No Input PLLN for PLL1Q\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLN.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLQoutputType = struct {
            pub fn get(_: *const PLLQoutputType) comptime_int {
                return PLL1Q.get();
            }
        };
        const PLL1RType = struct {
            value: PLL1RConf,

            pub fn get(self: *const PLL1RType) comptime_int {
                if (!@hasDecl(this, "PLLN")) {
                    @compileError("No Input PLLN for PLL1R\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLN.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLL2NType = struct {
            value: PLL2NConf,

            pub fn get(self: *const PLL2NType) comptime_int {
                if (!@hasDecl(this, "PLL2M")) {
                    @compileError("No Input PLL2M for PLL2N\n");
                } else if (!@hasDecl(this, "PLL2FRACN")) {
                    @compileError("No fractional  value: PLL2FRACN for PLL2N\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL2M.get());
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
        const PLL2PType = struct {
            value: PLL2PConf,

            pub fn get(self: *const PLL2PType) comptime_int {
                if (!@hasDecl(this, "PLL2N")) {
                    @compileError("No Input PLL2N for PLL2P\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL2N.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL2PoutputType = struct {
            pub fn get(_: *const PLL2PoutputType) comptime_int {
                return PLL2P.get();
            }
        };
        const PLL2QType = struct {
            value: PLL2QConf,

            pub fn get(self: *const PLL2QType) comptime_int {
                if (!@hasDecl(this, "PLL2N")) {
                    @compileError("No Input PLL2N for PLL2Q\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL2N.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL2QoutputType = struct {
            pub fn get(_: *const PLL2QoutputType) comptime_int {
                return PLL2Q.get();
            }
        };
        const PLL2RType = struct {
            value: PLL2RConf,

            pub fn get(self: *const PLL2RType) comptime_int {
                if (!@hasDecl(this, "PLL2N")) {
                    @compileError("No Input PLL2N for PLL2R\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL2N.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL2RoutputType = struct {
            pub fn get(_: *const PLL2RoutputType) comptime_int {
                return PLL2R.get();
            }
        };
        const PLL3NType = struct {
            value: PLL3NConf,

            pub fn get(self: *const PLL3NType) comptime_int {
                if (!@hasDecl(this, "PLL3M")) {
                    @compileError("No Input PLL3M for PLL3N\n");
                } else if (!@hasDecl(this, "PLL3FRACN")) {
                    @compileError("No fractional  value: PLL3FRACN for PLL3N\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3M.get());
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
        const PLL3PType = struct {
            value: PLL3PConf,

            pub fn get(self: *const PLL3PType) comptime_int {
                if (!@hasDecl(this, "PLL3N")) {
                    @compileError("No Input PLL3N for PLL3P\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3N.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL3PoutputType = struct {
            pub fn get(_: *const PLL3PoutputType) comptime_int {
                return PLL3P.get();
            }
        };
        const PLL3QType = struct {
            value: PLL3QConf,

            pub fn get(self: *const PLL3QType) comptime_int {
                if (!@hasDecl(this, "PLL3N")) {
                    @compileError("No Input PLL3N for PLL3Q\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3N.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL3QoutputType = struct {
            pub fn get(_: *const PLL3QoutputType) comptime_int {
                return PLL3Q.get();
            }
        };
        const PLL3RType = struct {
            value: PLL3RConf,

            pub fn get(self: *const PLL3RType) comptime_int {
                if (!@hasDecl(this, "PLL3N")) {
                    @compileError("No Input PLL3N for PLL3R\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3N.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL3RoutputType = struct {
            pub fn get(_: *const PLL3RoutputType) comptime_int {
                return PLL3R.get();
            }
        };
        const HSIRC = HSIRCType{};
        pub const CRSCLKoutput = CRSCLKoutputType{};
        const HSI48RC = HSI48RCType{};
        const SHSIRC = SHSIRCType{};
        const SHSIDiv = SHSIDivType{};
        const SAESMult = SAESMultType{ .value = conf.SAESMult };
        pub const SAESoutput = SAESoutputType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{ .value = conf.LSIRC };
        const LSIDIV = LSIDIVType{ .value = conf.LSIDIV };
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const MSIRC = MSIRCType{ .value = conf.MSIRC };
        const MSIKRC = MSIKRCType{ .value = conf.MSIKRC };
        const SAI1_EXT = SAI1_EXTType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLL2Source = PLL2SourceType{ .value = conf.PLL2Source };
        const PLL3Source = PLL3SourceType{ .value = conf.PLL3Source };
        const PLLM = PLLMType{ .value = conf.PLLM };
        const PLL2M = PLL2MType{ .value = conf.PLL2M };
        const PLL3M = PLL3MType{ .value = conf.PLL3M };
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART3Mult = USART3MultType{ .value = conf.USART3Mult };
        pub const USART3output = USART3outputType{};
        const UART4Mult = UART4MultType{ .value = conf.UART4Mult };
        pub const UART4output = UART4outputType{};
        const UART5Mult = UART5MultType{ .value = conf.UART5Mult };
        pub const UART5output = UART5outputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const LPTIM2Mult = LPTIM2MultType{ .value = conf.LPTIM2Mult };
        pub const LPTIM2output = LPTIM2outputType{};
        const DACMult = DACMultType{ .value = conf.DACMult };
        pub const DACoutput = DACoutputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const CK48Mult = CK48MultType{ .value = conf.CK48Mult };
        pub const CK48output = CK48outputType{};
        pub const USBoutput = USBoutputType{};
        const SDMMC1Mult = SDMMC1MultType{ .value = conf.SDMMC1Mult };
        pub const SDMMCC1Output = SDMMCC1OutputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANOutput = FDCANOutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2output = I2C2outputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3output = I2C3outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        const I2C4Mult = I2C4MultType{ .value = conf.I2C4Mult };
        pub const I2C4output = I2C4outputType{};
        const MDF1Mult = MDF1MultType{ .value = conf.MDF1Mult };
        pub const MDF1output = MDF1outputType{};
        const ADF1Mult = ADF1MultType{ .value = conf.ADF1Mult };
        pub const ADF1output = ADF1outputType{};
        const OCTOSPIMMult = OCTOSPIMMultType{ .value = conf.OCTOSPIMMult };
        pub const OCTOSPIMoutput = OCTOSPIMoutputType{};
        const LPTIM3Mult = LPTIM3MultType{ .value = conf.LPTIM3Mult };
        pub const LPTIM3output = LPTIM3outputType{};
        const HSI48DivToRNG = HSI48DivToRNGType{};
        const RNGMult = RNGMultType{ .value = conf.RNGMult };
        pub const RNGoutput = RNGoutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const LSCOMult = LSCOMultType{ .value = conf.LSCOMult };
        pub const LSCOOutput = LSCOOutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        const CortexCLockSelection = CortexCLockSelectionType{ .value = conf.CortexCLockSelection };
        pub const CortexSysOutput = CortexSysOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const APB1Prescaler = APB1PrescalerType{ .value = conf.APB1Prescaler };
        pub const APB1Output = APB1OutputType{};
        const TimPrescalerAPB1 = TimPrescalerAPB1Type{};
        pub const TimPrescOut1 = TimPrescOut1Type{};
        const APB2Prescaler = APB2PrescalerType{ .value = conf.APB2Prescaler };
        pub const APB2Output = APB2OutputType{};
        const APB3Prescaler = APB3PrescalerType{ .value = conf.APB3Prescaler };
        pub const APB3Output = APB3OutputType{};
        const TimPrescalerAPB2 = TimPrescalerAPB2Type{};
        pub const TimPrescOut2 = TimPrescOut2Type{};
        const SPI1Mult = SPI1MultType{ .value = conf.SPI1Mult };
        pub const SPI1output = SPI1outputType{};
        const SPI3Mult = SPI3MultType{ .value = conf.SPI3Mult };
        pub const SPI3output = SPI3outputType{};
        const SPI2Mult = SPI2MultType{ .value = conf.SPI2Mult };
        pub const SPI2output = SPI2outputType{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLFRACN = PLLFRACNType{ .value = conf.PLLFRACN };
        const PLL1P = PLL1PType{ .value = conf.PLL1P };
        pub const PLLPoutput = PLLPoutputType{};
        const PLL1Q = PLL1QType{ .value = conf.PLL1Q };
        pub const PLLQoutput = PLLQoutputType{};
        const PLL1R = PLL1RType{ .value = conf.PLL1R };
        const PLL2N = PLL2NType{ .value = conf.PLL2N };
        const PLL2FRACN = PLL2FRACNType{ .value = conf.PLL2FRACN };
        const PLL2P = PLL2PType{ .value = conf.PLL2P };
        pub const PLL2Poutput = PLL2PoutputType{};
        const PLL2Q = PLL2QType{ .value = conf.PLL2Q };
        pub const PLL2Qoutput = PLL2QoutputType{};
        const PLL2R = PLL2RType{ .value = conf.PLL2R };
        pub const PLL2Routput = PLL2RoutputType{};
        const PLL3N = PLL3NType{ .value = conf.PLL3N };
        const PLL3FRACN = PLL3FRACNType{ .value = conf.PLL3FRACN };
        const PLL3P = PLL3PType{ .value = conf.PLL3P };
        pub const PLL3Poutput = PLL3PoutputType{};
        const PLL3Q = PLL3QType{ .value = conf.PLL3Q };
        pub const PLL3Qoutput = PLL3QoutputType{};
        const PLL3R = PLL3RType{ .value = conf.PLL3R };
        pub const PLL3Routput = PLL3RoutputType{};

        pub fn validate() void {
            _ = CRSCLKoutput.get();
            _ = SAESoutput.get();
            _ = RTCOutput.get();
            _ = IWDGOutput.get();
            _ = USART1output.get();
            _ = USART3output.get();
            _ = UART4output.get();
            _ = UART5output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM2output.get();
            _ = DACoutput.get();
            _ = ADCoutput.get();
            _ = CK48output.get();
            _ = USBoutput.get();
            _ = SDMMCC1Output.get();
            _ = FDCANOutput.get();
            _ = I2C1output.get();
            _ = I2C2output.get();
            _ = I2C3output.get();
            _ = SAI1output.get();
            _ = I2C4output.get();
            _ = MDF1output.get();
            _ = ADF1output.get();
            _ = OCTOSPIMoutput.get();
            _ = LPTIM3output.get();
            _ = RNGoutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = APB3Output.get();
            _ = TimPrescOut2.get();
            _ = SPI1output.get();
            _ = SPI3output.get();
            _ = SPI2output.get();
        }
    };

    return ClockStruct;
}
