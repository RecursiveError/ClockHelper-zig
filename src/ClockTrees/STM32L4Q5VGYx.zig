const std = @import("std");

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
        if (val < 1000) {
            @compileError("min value for LSEOSC is 1000\n");
        } else if (val > 1000000) {
            @compileError("min value for LSEOSC is 1000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 1000000;
    }

    pub fn min() comptime_int {
        return 1000;
    }
};
pub const MSIRCConf = enum {
    const this = @This();
    CLOCK_100,
    CLOCK_200,
    CLOCK_400,
    CLOCK_800,
    CLOCK_1000,
    CLOCK_2000,
    CLOCK_4000,
    CLOCK_8000,
    CLOCK_16000,
    CLOCK_24000,
    CLOCK_32000,
    CLOCK_48000,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .CLOCK_100 => 100,
            .CLOCK_200 => 200,
            .CLOCK_400 => 400,
            .CLOCK_800 => 800,
            .CLOCK_1000 => 1000,
            .CLOCK_2000 => 2000,
            .CLOCK_4000 => 4000,
            .CLOCK_8000 => 8000,
            .CLOCK_16000 => 16000,
            .CLOCK_24000 => 24000,
            .CLOCK_32000 => 32000,
            .CLOCK_48000 => 48000,
        };
    }
};
pub const SysClkSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
    PLLR,
};
pub const PLLSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const PLLM1Conf = enum(comptime_int) {
    _,
    pub fn get(num: PLLM1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLM1 is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLLM1 is 16\n");
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
pub const PLLM2Conf = enum(comptime_int) {
    _,
    pub fn get(num: PLLM2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLM2 is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLLM2 is 16\n");
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
pub const PLLM3Conf = enum(comptime_int) {
    _,
    pub fn get(num: PLLM3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLM3 is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLLM3 is 16\n");
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
    LSIRC,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const USART2MultConf = enum {
    APB1Prescaler,
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
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    APB1Prescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const LPTIM2MultConf = enum {
    APB1Prescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const DFSDMMultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
};
pub const ADCMultConf = enum {
    PLLSAI1R,
    SysCLKOutput,
};
pub const CK48MultConf = enum {
    PLLSAI1Q,
    PLLQ,
    MSIRC,
    HSI48RC,
};
pub const SDMMC1MultConf = enum {
    PLLP,
    CK48Mult,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const I2C2MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const I2C3MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const SAI1MultConf = enum {
    PLLSAI1P,
    PLLSAI2P,
    PLLP,
    SAI1_EXT,
    HSIRC,
};
pub const SAI2MultConf = enum {
    PLLSAI1P,
    PLLSAI2P,
    PLLP,
    SAI2_EXT,
    HSIRC,
};
pub const I2C4MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const OCTOSPIMMultConf = enum {
    MSIRC,
    SysCLKOutput,
    PLLQ,
};
pub const DFSDMAudioMultConf = enum {
    MSIRC,
    HSIRC,
    SAI1Mult,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRC,
    PLLR,
    SysCLKOutput,
    MSIRC,
    HSI48RC,
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
    LSIRC,
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
pub const PLLNConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLNConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for PLLN is 8\n");
        } else if (val > 127) {
            @compileError("min value for PLLN is 127\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 127;
    }

    pub fn min() comptime_int {
        return 8;
    }
};
pub const PLLPConf = enum {
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
        };
    }
};
pub const PLLQConf = enum {
    const this = @This();
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
        };
    }
};
pub const PLLRConf = enum {
    const this = @This();
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
        };
    }
};
pub const PLLSAI1NConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAI1NConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for PLLSAI1N is 8\n");
        } else if (val > 127) {
            @compileError("min value for PLLSAI1N is 127\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 127;
    }

    pub fn min() comptime_int {
        return 8;
    }
};
pub const PLLSAI1PConf = enum {
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
        };
    }
};
pub const PLLSAI1QConf = enum {
    const this = @This();
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
        };
    }
};
pub const PLLSAI1RConf = enum {
    const this = @This();
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
        };
    }
};
pub const PLLSAI2NConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAI2NConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for PLLSAI2N is 8\n");
        } else if (val > 127) {
            @compileError("min value for PLLSAI2N is 127\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 127;
    }

    pub fn min() comptime_int {
        return 8;
    }
};
pub const PLLSAI2PConf = enum {
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
        };
    }
};
pub const PLLSAI2QConf = enum {
    const this = @This();
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
        };
    }
};
pub const PLLSAI2RConf = enum {
    const this = @This();
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
        };
    }
};
pub const PLLSAI2RDIVIDERConf = enum {
    const this = @This();
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .CLOCK_4000,
    SysClkSource: SysClkSourceConf = .MSIRC,
    PLLSource: PLLSourceConf = .MSIRC,
    PLLM1: PLLM1Conf = @enumFromInt(1),
    PLLM2: PLLM2Conf = @enumFromInt(1),
    PLLM3: PLLM3Conf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB1Prescaler,
    LPTIM1Mult: LPTIM1MultConf = .APB1Prescaler,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    DFSDMMult: DFSDMMultConf = .APB1Prescaler,
    ADCMult: ADCMultConf = .PLLSAI1R,
    CK48Mult: CK48MultConf = .PLLSAI1Q,
    SDMMC1Mult: SDMMC1MultConf = .PLLP,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB1Prescaler,
    SAI1Mult: SAI1MultConf = .PLLSAI1P,
    SAI2Mult: SAI2MultConf = .PLLSAI1P,
    I2C4Mult: I2C4MultConf = .APB1Prescaler,
    OCTOSPIMMult: OCTOSPIMMultConf = .SysCLKOutput,
    DFSDMAudioMult: DFSDMAudioMultConf = .MSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIRC,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = .DIV2,
    PLLR: PLLRConf = .DIV2,
    PLLSAI1N: PLLSAI1NConf = @enumFromInt(8),
    PLLSAI1P: PLLSAI1PConf = .DIV2,
    PLLSAI1Q: PLLSAI1QConf = .DIV2,
    PLLSAI1R: PLLSAI1RConf = .DIV2,
    PLLSAI2N: PLLSAI2NConf = @enumFromInt(8),
    PLLSAI2P: PLLSAI2PConf = .DIV2,
    PLLSAI2Q: PLLSAI2QConf = .DIV2,
    PLLSAI2R: PLLSAI2RConf = .DIV2,
    PLLSAI2RDIVIDER: PLLSAI2RDIVIDERConf = .DIV2,
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
        const MSIRCType = struct {
            value: MSIRCConf,
            pub fn get(comptime self: MSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const SAI1_EXTType = struct {
            pub fn get(_: *const SAI1_EXTType) comptime_int {
                return 2097000;
            }
        };
        const SAI2_EXTType = struct {
            pub fn get(_: *const SAI2_EXTType) comptime_int {
                return 2097000;
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLR => PLLR.get(),
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
        const PLLM1Type = struct {
            value: PLLM1Conf,

            pub fn get(self: *const PLLM1Type) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for PLLM1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLM2Type = struct {
            value: PLLM2Conf,

            pub fn get(self: *const PLLM2Type) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for PLLM2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLM3Type = struct {
            value: PLLM3Conf,

            pub fn get(self: *const PLLM3Type) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for PLLM3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
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
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const RTCOutputType = struct {
            pub fn get(_: *const RTCOutputType) comptime_int {
                return RTCClkSource.get();
            }
        };
        const LCDOutputType = struct {
            pub fn get(_: *const LCDOutputType) comptime_int {
                return RTCClkSource.get();
            }
        };
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
                return LSIRC.get();
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
        const USART2MultType = struct {
            value: USART2MultConf,
            pub fn get(comptime self: USART2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART2outputType = struct {
            pub fn get(_: *const USART2outputType) comptime_int {
                return USART2Mult.get();
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
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
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
                    .APB1Prescaler => APB1Prescaler.get(),
                    .LSIRC => LSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPTIM1outputType = struct {
            pub fn get(_: *const LPTIM1outputType) comptime_int {
                return LPTIM1Mult.get();
            }
        };
        const LPTIM2MultType = struct {
            value: LPTIM2MultConf,
            pub fn get(comptime self: LPTIM2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .LSIRC => LSIRC.get(),
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
        const DFSDMMultType = struct {
            value: DFSDMMultConf,
            pub fn get(comptime self: DFSDMMultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const DFSDMoutputType = struct {
            pub fn get(_: *const DFSDMoutputType) comptime_int {
                return DFSDMMult.get();
            }
        };
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .PLLSAI1R => PLLSAI1R.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                const from_input = ADCMult.get();
                if (from_input < 1400000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADCMult on ADCoutput | recive {d} min 1400000\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCMult on ADCoutput | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CK48MultType = struct {
            value: CK48MultConf,
            pub fn get(comptime self: CK48MultType) comptime_int {
                return switch (self.value) {
                    .PLLSAI1Q => PLLSAI1Q.get(),
                    .PLLQ => PLLQ.get(),
                    .MSIRC => MSIRC.get(),
                    .HSI48RC => HSI48RC.get(),
                };
            }
        };
        const CK48outputType = struct {
            pub fn get(_: *const CK48outputType) comptime_int {
                const from_input = CK48Mult.get();
                if (from_input < 47880000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CK48Mult on CK48output | recive {d} min 47880000\n", .{from_input}));
                } else if (from_input > 48120000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CK48Mult on CK48output | recive {d} max 48120000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                const from_input = CK48Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CK48Mult on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CK48Mult on RNGoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SDMMC1MultType = struct {
            value: SDMMC1MultConf,
            pub fn get(comptime self: SDMMC1MultType) comptime_int {
                return switch (self.value) {
                    .PLLP => PLLP.get(),
                    .CK48Mult => CK48Mult.get(),
                };
            }
        };
        const SDMMCC1OutputType = struct {
            pub fn get(_: *const SDMMCC1OutputType) comptime_int {
                return SDMMC1Mult.get();
            }
        };
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
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
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
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
                    .PLLSAI1P => PLLSAI1P.get(),
                    .PLLSAI2P => PLLSAI2P.get(),
                    .PLLP => PLLP.get(),
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
        const SAI2MultType = struct {
            value: SAI2MultConf,
            pub fn get(comptime self: SAI2MultType) comptime_int {
                return switch (self.value) {
                    .PLLSAI1P => PLLSAI1P.get(),
                    .PLLSAI2P => PLLSAI2P.get(),
                    .PLLP => PLLP.get(),
                    .SAI2_EXT => SAI2_EXT.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const SAI2outputType = struct {
            pub fn get(_: *const SAI2outputType) comptime_int {
                return SAI2Mult.get();
            }
        };
        const I2C4MultType = struct {
            value: I2C4MultConf,
            pub fn get(comptime self: I2C4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const I2C4outputType = struct {
            pub fn get(_: *const I2C4outputType) comptime_int {
                return I2C4Mult.get();
            }
        };
        const OCTOSPIMMultType = struct {
            value: OCTOSPIMMultConf,
            pub fn get(comptime self: OCTOSPIMMultType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLLQ => PLLQ.get(),
                };
            }
        };
        const OCTOSPIMoutputType = struct {
            pub fn get(_: *const OCTOSPIMoutputType) comptime_int {
                return OCTOSPIMMult.get();
            }
        };
        const DFSDMAudioMultType = struct {
            value: DFSDMAudioMultConf,
            pub fn get(comptime self: DFSDMAudioMultType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .SAI1Mult => SAI1Mult.get(),
                };
            }
        };
        const DFSDMAudiooutputType = struct {
            pub fn get(_: *const DFSDMAudiooutputType) comptime_int {
                return DFSDMAudioMult.get();
            }
        };
        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .PLLR => PLLR.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MSIRC => MSIRC.get(),
                    .HSI48RC => HSI48RC.get(),
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
                    .LSIRC => LSIRC.get(),
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

        const PWRCLKoutputType = struct {
            pub fn get(_: *const PWRCLKoutputType) comptime_int {
                return SysCLKOutput.get();
            }
        };
        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = AHBPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBPrescaler on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
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

        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                return CortexPrescaler.get();
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
                const from_input = APB1Prescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB1Prescaler on APB1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = APB2Prescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB2Prescaler on APB2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
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
        const PLLNType = struct {
            value: PLLNConf,

            pub fn get(self: *const PLLNType) comptime_int {
                if (!@hasDecl(this, "PLLM1")) {
                    @compileError("No Input PLLM1 for PLLN\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLM1.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLLPType = struct {
            value: PLLPConf,

            pub fn get(self: *const PLLPType) comptime_int {
                if (!@hasDecl(this, "PLLN")) {
                    @compileError("No Input PLLN for PLLP\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLN.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLPoutputType = struct {
            pub fn get(_: *const PLLPoutputType) comptime_int {
                return PLLP.get();
            }
        };
        const PLLQType = struct {
            value: PLLQConf,

            pub fn get(self: *const PLLQType) comptime_int {
                if (!@hasDecl(this, "PLLN")) {
                    @compileError("No Input PLLN for PLLQ\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLN.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLQoutputType = struct {
            pub fn get(_: *const PLLQoutputType) comptime_int {
                return PLLQ.get();
            }
        };
        const PLLRType = struct {
            value: PLLRConf,

            pub fn get(self: *const PLLRType) comptime_int {
                if (!@hasDecl(this, "PLLN")) {
                    @compileError("No Input PLLN for PLLR\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLN.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1NType = struct {
            value: PLLSAI1NConf,

            pub fn get(self: *const PLLSAI1NType) comptime_int {
                if (!@hasDecl(this, "PLLM2")) {
                    @compileError("No Input PLLM2 for PLLSAI1N\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLM2.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLLSAI1PType = struct {
            value: PLLSAI1PConf,

            pub fn get(self: *const PLLSAI1PType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1N")) {
                    @compileError("No Input PLLSAI1N for PLLSAI1P\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1PoutputType = struct {
            pub fn get(_: *const PLLSAI1PoutputType) comptime_int {
                return PLLSAI1P.get();
            }
        };
        const PLLSAI1QType = struct {
            value: PLLSAI1QConf,

            pub fn get(self: *const PLLSAI1QType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1N")) {
                    @compileError("No Input PLLSAI1N for PLLSAI1Q\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1QoutputType = struct {
            pub fn get(_: *const PLLSAI1QoutputType) comptime_int {
                return PLLSAI1Q.get();
            }
        };
        const PLLSAI1RType = struct {
            value: PLLSAI1RConf,

            pub fn get(self: *const PLLSAI1RType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1N")) {
                    @compileError("No Input PLLSAI1N for PLLSAI1R\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1RoutputType = struct {
            pub fn get(_: *const PLLSAI1RoutputType) comptime_int {
                return PLLSAI1R.get();
            }
        };
        const PLLSAI2NType = struct {
            value: PLLSAI2NConf,

            pub fn get(self: *const PLLSAI2NType) comptime_int {
                if (!@hasDecl(this, "PLLM3")) {
                    @compileError("No Input PLLM3 for PLLSAI2N\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLM3.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLLSAI2PType = struct {
            value: PLLSAI2PConf,

            pub fn get(self: *const PLLSAI2PType) comptime_int {
                if (!@hasDecl(this, "PLLSAI2N")) {
                    @compileError("No Input PLLSAI2N for PLLSAI2P\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI2N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI2PoutputType = struct {
            pub fn get(_: *const PLLSAI2PoutputType) comptime_int {
                return PLLSAI2P.get();
            }
        };
        const PLLSAI2QType = struct {
            value: PLLSAI2QConf,

            pub fn get(self: *const PLLSAI2QType) comptime_int {
                if (!@hasDecl(this, "PLLSAI2N")) {
                    @compileError("No Input PLLSAI2N for PLLSAI2Q\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI2N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI2QoutputType = struct {
            pub fn get(_: *const PLLSAI2QoutputType) comptime_int {
                return PLLSAI2Q.get();
            }
        };
        const PLLSAI2RType = struct {
            value: PLLSAI2RConf,

            pub fn get(self: *const PLLSAI2RType) comptime_int {
                if (!@hasDecl(this, "PLLSAI2N")) {
                    @compileError("No Input PLLSAI2N for PLLSAI2R\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI2N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI2RoutputType = struct {
            pub fn get(_: *const PLLSAI2RoutputType) comptime_int {
                return PLLSAI2R.get();
            }
        };
        const PLLSAI2RDIVIDERType = struct {
            value: PLLSAI2RDIVIDERConf,

            pub fn get(self: *const PLLSAI2RDIVIDERType) comptime_int {
                if (!@hasDecl(this, "PLLSAI2R")) {
                    @compileError("No Input PLLSAI2R for PLLSAI2RDIVIDER\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI2R.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const LTDCCLKType = struct {
            pub fn get(_: *const LTDCCLKType) comptime_int {
                const from_input = PLLSAI2RDIVIDER.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLSAI2RDIVIDER on LTDCCLK | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 120000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLSAI2RDIVIDER on LTDCCLK | recive {d} max 120000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HSIRC = HSIRCType{};
        pub const CRSCLKoutput = CRSCLKoutputType{};
        const HSI48RC = HSI48RCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const MSIRC = MSIRCType{ .value = conf.MSIRC };
        const SAI1_EXT = SAI1_EXTType{};
        const SAI2_EXT = SAI2_EXTType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLLM1 = PLLM1Type{ .value = conf.PLLM1 };
        const PLLM2 = PLLM2Type{ .value = conf.PLLM2 };
        const PLLM3 = PLLM3Type{ .value = conf.PLLM3 };
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const LCDOutput = LCDOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART2Mult = USART2MultType{ .value = conf.USART2Mult };
        pub const USART2output = USART2outputType{};
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
        const DFSDMMult = DFSDMMultType{ .value = conf.DFSDMMult };
        pub const DFSDMoutput = DFSDMoutputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const CK48Mult = CK48MultType{ .value = conf.CK48Mult };
        pub const CK48output = CK48outputType{};
        pub const RNGoutput = RNGoutputType{};
        const SDMMC1Mult = SDMMC1MultType{ .value = conf.SDMMC1Mult };
        pub const SDMMCC1Output = SDMMCC1OutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2output = I2C2outputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3output = I2C3outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        const SAI2Mult = SAI2MultType{ .value = conf.SAI2Mult };
        pub const SAI2output = SAI2outputType{};
        const I2C4Mult = I2C4MultType{ .value = conf.I2C4Mult };
        pub const I2C4output = I2C4outputType{};
        const OCTOSPIMMult = OCTOSPIMMultType{ .value = conf.OCTOSPIMMult };
        pub const OCTOSPIMoutput = OCTOSPIMoutputType{};
        const DFSDMAudioMult = DFSDMAudioMultType{ .value = conf.DFSDMAudioMult };
        pub const DFSDMAudiooutput = DFSDMAudiooutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const LSCOMult = LSCOMultType{ .value = conf.LSCOMult };
        pub const LSCOOutput = LSCOOutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const PWRCLKoutput = PWRCLKoutputType{};
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const APB1Prescaler = APB1PrescalerType{ .value = conf.APB1Prescaler };
        pub const APB1Output = APB1OutputType{};
        const TimPrescalerAPB1 = TimPrescalerAPB1Type{};
        pub const TimPrescOut1 = TimPrescOut1Type{};
        const APB2Prescaler = APB2PrescalerType{ .value = conf.APB2Prescaler };
        pub const APB2Output = APB2OutputType{};
        const TimPrescalerAPB2 = TimPrescalerAPB2Type{};
        pub const TimPrescOut2 = TimPrescOut2Type{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLP = PLLPType{ .value = conf.PLLP };
        pub const PLLPoutput = PLLPoutputType{};
        const PLLQ = PLLQType{ .value = conf.PLLQ };
        pub const PLLQoutput = PLLQoutputType{};
        const PLLR = PLLRType{ .value = conf.PLLR };
        const PLLSAI1N = PLLSAI1NType{ .value = conf.PLLSAI1N };
        const PLLSAI1P = PLLSAI1PType{ .value = conf.PLLSAI1P };
        pub const PLLSAI1Poutput = PLLSAI1PoutputType{};
        const PLLSAI1Q = PLLSAI1QType{ .value = conf.PLLSAI1Q };
        pub const PLLSAI1Qoutput = PLLSAI1QoutputType{};
        const PLLSAI1R = PLLSAI1RType{ .value = conf.PLLSAI1R };
        pub const PLLSAI1Routput = PLLSAI1RoutputType{};
        const PLLSAI2N = PLLSAI2NType{ .value = conf.PLLSAI2N };
        const PLLSAI2P = PLLSAI2PType{ .value = conf.PLLSAI2P };
        pub const PLLSAI2Poutput = PLLSAI2PoutputType{};
        const PLLSAI2Q = PLLSAI2QType{ .value = conf.PLLSAI2Q };
        pub const PLLSAI2Qoutput = PLLSAI2QoutputType{};
        const PLLSAI2R = PLLSAI2RType{ .value = conf.PLLSAI2R };
        pub const PLLSAI2Routput = PLLSAI2RoutputType{};
        const PLLSAI2RDIVIDER = PLLSAI2RDIVIDERType{ .value = conf.PLLSAI2RDIVIDER };
        pub const LTDCCLK = LTDCCLKType{};

        pub fn validate() void {
            _ = CRSCLKoutput.get();
            _ = RTCOutput.get();
            _ = IWDGOutput.get();
            _ = USART1output.get();
            _ = USART2output.get();
            _ = USART3output.get();
            _ = UART4output.get();
            _ = UART5output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM2output.get();
            _ = DFSDMoutput.get();
            _ = ADCoutput.get();
            _ = CK48output.get();
            _ = RNGoutput.get();
            _ = SDMMCC1Output.get();
            _ = I2C1output.get();
            _ = I2C2output.get();
            _ = I2C3output.get();
            _ = SAI1output.get();
            _ = SAI2output.get();
            _ = I2C4output.get();
            _ = OCTOSPIMoutput.get();
            _ = DFSDMAudiooutput.get();
            _ = PWRCLKoutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = TimPrescOut2.get();
            _ = LTDCCLK.get();
        }
    };

    return ClockStruct;
}
