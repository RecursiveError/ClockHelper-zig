const std = @import("std");

pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4000000) {
            @compileError("min value for HSEOSC is 4000000\n");
        } else if (val > 26000000) {
            @compileError("min value for HSEOSC is 26000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 26000000;
    }

    pub fn min() comptime_int {
        return 4000000;
    }
};
pub const LSIRCConf = enum(comptime_int) {
    _,
    pub fn get(num: LSIRCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 17000) {
            @compileError("min value for LSIRC is 17000\n");
        } else if (val > 47000) {
            @compileError("min value for LSIRC is 47000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 47000;
    }

    pub fn min() comptime_int {
        return 17000;
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
    HSIRC,
    HSEOSC,
    PLLP,
};
pub const PLLSourceConf = enum {
    HSIRC,
    HSEOSC,
};
pub const PLLMConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLMConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLM is 2\n");
        } else if (val > 63) {
            @compileError("min value for PLLM is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 2;
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
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
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
pub const I2C4MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const PLL48MultConf = enum {
    PLLQ,
    PLLSAIP,
};
pub const SAI1MultConf = enum {
    PLLSAIQDiv,
    PLLI2SQDiv,
    I2S_CKIN,
    PLLSource,
};
pub const SAI2MultConf = enum {
    PLLSAIQDiv,
    PLLI2SQDiv,
    I2S_CKIN,
    PLLSource,
};
pub const DFSDMAudioMultConf = enum {
    SAI1Mult,
    SAI2Mult,
};
pub const SDMMCMultConf = enum {
    PLL48Mult,
    SysCLKOutput,
};
pub const SDMMC2MultConf = enum {
    PLL48Mult,
    SysCLKOutput,
};
pub const I2SMultConf = enum {
    PLLI2SR,
    I2S_CKIN,
};
pub const MCO1MultConf = enum {
    LSEOSC,
    HSEOSC,
    HSIRC,
    PLLP,
};
pub const MCO1DivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
        };
    }
};
pub const MCO2MultConf = enum {
    SysClkSource,
    PLLI2SR,
    HSEOSC,
    PLLP,
};
pub const MCO2DivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
        };
    }
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
pub const USART6MultConf = enum {
    APB2Prescaler,
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
pub const UART7MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const UART8MultConf = enum {
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
pub const CECMultConf = enum {
    HSIDivCEC,
    LSEOSC,
};
pub const DFSDMMultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
};
pub const PLLNConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLNConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 50) {
            @compileError("min value for PLLN is 50\n");
        } else if (val > 432) {
            @compileError("min value for PLLN is 432\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 432;
    }

    pub fn min() comptime_int {
        return 50;
    }
};
pub const PLLPConf = enum {
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
pub const PLLQConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLQConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLQ is 2\n");
        } else if (val > 15) {
            @compileError("min value for PLLQ is 15\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 15;
    }

    pub fn min() comptime_int {
        return 2;
    }
};
pub const PLLRConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLRConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLR is 2\n");
        } else if (val > 7) {
            @compileError("min value for PLLR is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 2;
    }
};
pub const PLLSAINConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAINConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 50) {
            @compileError("min value for PLLSAIN is 50\n");
        } else if (val > 432) {
            @compileError("min value for PLLSAIN is 432\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 432;
    }

    pub fn min() comptime_int {
        return 50;
    }
};
pub const PLLSAIPConf = enum {
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
pub const PLLSAIQConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAIQConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLSAIQ is 2\n");
        } else if (val > 15) {
            @compileError("min value for PLLSAIQ is 15\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 15;
    }

    pub fn min() comptime_int {
        return 2;
    }
};
pub const PLLSAIQDivConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAIQDivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLSAIQDiv is 1\n");
        } else if (val > 32) {
            @compileError("min value for PLLSAIQDiv is 32\n");
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
pub const PLLSAIRConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAIRConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLSAIR is 2\n");
        } else if (val > 7) {
            @compileError("min value for PLLSAIR is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 2;
    }
};
pub const PLLSAIRDivConf = enum {
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
pub const PLLI2SNConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLI2SNConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 50) {
            @compileError("min value for PLLI2SN is 50\n");
        } else if (val > 432) {
            @compileError("min value for PLLI2SN is 432\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 432;
    }

    pub fn min() comptime_int {
        return 50;
    }
};
pub const PLLI2SPConf = enum {
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
pub const PLLI2SQConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLI2SQConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLI2SQ is 2\n");
        } else if (val > 15) {
            @compileError("min value for PLLI2SQ is 15\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 15;
    }

    pub fn min() comptime_int {
        return 2;
    }
};
pub const PLLI2SQDivConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLI2SQDivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLI2SQDiv is 1\n");
        } else if (val > 32) {
            @compileError("min value for PLLI2SQDiv is 32\n");
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
pub const PLLI2SRConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLI2SRConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLI2SR is 2\n");
        } else if (val > 7) {
            @compileError("min value for PLLI2SR is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 2;
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIRC,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(16),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB1Prescaler,
    I2C4Mult: I2C4MultConf = .APB1Prescaler,
    PLL48Mult: PLL48MultConf = .PLLQ,
    SAI1Mult: SAI1MultConf = .PLLSAIQDiv,
    SAI2Mult: SAI2MultConf = .PLLSAIQDiv,
    DFSDMAudioMult: DFSDMAudioMultConf = .SAI1Mult,
    SDMMCMult: SDMMCMultConf = .SysCLKOutput,
    SDMMC2Mult: SDMMC2MultConf = .SysCLKOutput,
    I2SMult: I2SMultConf = .PLLI2SR,
    MCO1Mult: MCO1MultConf = .HSIRC,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysClkSource,
    MCO2Div: MCO2DivConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    USART6Mult: USART6MultConf = .APB2Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    UART7Mult: UART7MultConf = .APB1Prescaler,
    UART8Mult: UART8MultConf = .APB1Prescaler,
    LPTIM1Mult: LPTIM1MultConf = .APB1Prescaler,
    CECMult: CECMultConf = .HSIDivCEC,
    DFSDMMult: DFSDMMultConf = .APB2Prescaler,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = @enumFromInt(2),
    PLLR: PLLRConf = @enumFromInt(2),
    PLLSAIN: PLLSAINConf = @enumFromInt(192),
    PLLSAIP: PLLSAIPConf = .DIV2,
    PLLSAIQ: PLLSAIQConf = @enumFromInt(2),
    PLLSAIQDiv: PLLSAIQDivConf = @enumFromInt(1),
    PLLSAIR: PLLSAIRConf = @enumFromInt(2),
    PLLSAIRDiv: PLLSAIRDivConf = .DIV2,
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SP: PLLI2SPConf = .DIV2,
    PLLI2SQ: PLLI2SQConf = @enumFromInt(2),
    PLLI2SQDiv: PLLI2SQDivConf = @enumFromInt(1),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 16000000;
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
        const I2S_CKINType = struct {
            pub fn get(_: *const I2S_CKINType) comptime_int {
                return 12288000;
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLP => PLLP.get(),
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
        const PLL48MultType = struct {
            value: PLL48MultConf,
            pub fn get(comptime self: PLL48MultType) comptime_int {
                return switch (self.value) {
                    .PLLQ => PLLQ.get(),
                    .PLLSAIP => PLLSAIP.get(),
                };
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                const from_input = PLL48Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLL48Mult on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLL48Mult on RNGoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                return PLL48Mult.get();
            }
        };
        const SPDIFoutputType = struct {
            pub fn get(_: *const SPDIFoutputType) comptime_int {
                const from_input = PLLI2SP.get();
                if (from_input < 5632000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLI2SP on SPDIFoutput | recive {d} min 5632000\n", .{from_input}));
                } else if (from_input > 0) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLI2SP on SPDIFoutput | recive {d} max 0\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI1MultType = struct {
            value: SAI1MultConf,
            pub fn get(comptime self: SAI1MultType) comptime_int {
                return switch (self.value) {
                    .PLLSAIQDiv => PLLSAIQDiv.get(),
                    .PLLI2SQDiv => PLLI2SQDiv.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .PLLSource => PLLSource.get(),
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
                    .PLLSAIQDiv => PLLSAIQDiv.get(),
                    .PLLI2SQDiv => PLLI2SQDiv.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .PLLSource => PLLSource.get(),
                };
            }
        };
        const SAI2outputType = struct {
            pub fn get(_: *const SAI2outputType) comptime_int {
                return SAI2Mult.get();
            }
        };
        const DFSDMAudioMultType = struct {
            value: DFSDMAudioMultConf,
            pub fn get(comptime self: DFSDMAudioMultType) comptime_int {
                return switch (self.value) {
                    .SAI1Mult => SAI1Mult.get(),
                    .SAI2Mult => SAI2Mult.get(),
                };
            }
        };
        const DFSDMAudiooutputType = struct {
            pub fn get(_: *const DFSDMAudiooutputType) comptime_int {
                return DFSDMAudioMult.get();
            }
        };
        const SDMMCMultType = struct {
            value: SDMMCMultConf,
            pub fn get(comptime self: SDMMCMultType) comptime_int {
                return switch (self.value) {
                    .PLL48Mult => PLL48Mult.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const SDMMCoutputType = struct {
            pub fn get(_: *const SDMMCoutputType) comptime_int {
                const from_input = SDMMCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMCMult on SDMMCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMCMult on SDMMCoutput | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SDMMC2MultType = struct {
            value: SDMMC2MultConf,
            pub fn get(comptime self: SDMMC2MultType) comptime_int {
                return switch (self.value) {
                    .PLL48Mult => PLL48Mult.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const SDMMC2outputType = struct {
            pub fn get(_: *const SDMMC2outputType) comptime_int {
                const from_input = SDMMC2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMC2Mult on SDMMC2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMC2Mult on SDMMC2output | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const I2SMultType = struct {
            value: I2SMultConf,
            pub fn get(comptime self: I2SMultType) comptime_int {
                return switch (self.value) {
                    .PLLI2SR => PLLI2SR.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const I2SoutputType = struct {
            pub fn get(_: *const I2SoutputType) comptime_int {
                return I2SMult.get();
            }
        };
        const EthernetPtpOutputType = struct {
            pub fn get(_: *const EthernetPtpOutputType) comptime_int {
                return AHBPrescaler.get();
            }
        };
        const MCO1MultType = struct {
            value: MCO1MultConf,
            pub fn get(comptime self: MCO1MultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .PLLP => PLLP.get(),
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
                    .SysClkSource => SysClkSource.get(),
                    .PLLI2SR => PLLI2SR.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLP => PLLP.get(),
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
                const from_input = AHBPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBPrescaler on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 216000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 216000000\n", .{from_input}));
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
                } else if (from_input > 54000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 54000000\n", .{from_input}));
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
                } else if (from_input > 108000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 108000000\n", .{from_input}));
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
        const USART6MultType = struct {
            value: USART6MultConf,
            pub fn get(comptime self: USART6MultType) comptime_int {
                return switch (self.value) {
                    .APB2Prescaler => APB2Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART6outputType = struct {
            pub fn get(_: *const USART6outputType) comptime_int {
                return USART6Mult.get();
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
        const UART7MultType = struct {
            value: UART7MultConf,
            pub fn get(comptime self: UART7MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const UART7outputType = struct {
            pub fn get(_: *const UART7outputType) comptime_int {
                return UART7Mult.get();
            }
        };
        const UART8MultType = struct {
            value: UART8MultConf,
            pub fn get(comptime self: UART8MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const UART8outputType = struct {
            pub fn get(_: *const UART8outputType) comptime_int {
                return UART8Mult.get();
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
        const LPTIM1OutputType = struct {
            pub fn get(_: *const LPTIM1OutputType) comptime_int {
                return LPTIM1Mult.get();
            }
        };
        const HSIDivCECType = struct {
            pub fn get(_: *const HSIDivCECType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSIDivCEC\n");
                }
                const from_input = this.HSIRC.get();
                const div = 488;
                return (from_input / div);
            }
        };

        const CECMultType = struct {
            value: CECMultConf,
            pub fn get(comptime self: CECMultType) comptime_int {
                return switch (self.value) {
                    .HSIDivCEC => HSIDivCEC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const CECOutputType = struct {
            pub fn get(_: *const CECOutputType) comptime_int {
                return CECMult.get();
            }
        };
        const DFSDMMultType = struct {
            value: DFSDMMultConf,
            pub fn get(comptime self: DFSDMMultType) comptime_int {
                return switch (self.value) {
                    .APB2Prescaler => APB2Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const DFSDMoutputType = struct {
            pub fn get(_: *const DFSDMoutputType) comptime_int {
                return DFSDMMult.get();
            }
        };
        const PLLNType = struct {
            value: PLLNConf,

            pub fn get(self: *const PLLNType) comptime_int {
                if (!@hasDecl(this, "PLLM")) {
                    @compileError("No Input PLLM for PLLN\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLM.get());
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

        const PLLQType = struct {
            value: PLLQConf,

            pub fn get(self: *const PLLQType) comptime_int {
                if (!@hasDecl(this, "PLLN")) {
                    @compileError("No Input PLLN for PLLQ\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLN.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
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
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLRoutputType = struct {
            pub fn get(_: *const PLLRoutputType) comptime_int {
                return PLLR.get();
            }
        };
        const PLLSAINType = struct {
            value: PLLSAINConf,

            pub fn get(self: *const PLLSAINType) comptime_int {
                if (!@hasDecl(this, "PLLM")) {
                    @compileError("No Input PLLM for PLLSAIN\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLM.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLLSAIPType = struct {
            value: PLLSAIPConf,

            pub fn get(self: *const PLLSAIPType) comptime_int {
                if (!@hasDecl(this, "PLLSAIN")) {
                    @compileError("No Input PLLSAIN for PLLSAIP\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAIN.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAIoutputType = struct {
            pub fn get(_: *const PLLSAIoutputType) comptime_int {
                return PLLSAIP.get();
            }
        };
        const PLLSAIQType = struct {
            value: PLLSAIQConf,

            pub fn get(self: *const PLLSAIQType) comptime_int {
                if (!@hasDecl(this, "PLLSAIN")) {
                    @compileError("No Input PLLSAIN for PLLSAIQ\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAIN.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLSAIQDivType = struct {
            value: PLLSAIQDivConf,

            pub fn get(self: *const PLLSAIQDivType) comptime_int {
                if (!@hasDecl(this, "PLLSAIQ")) {
                    @compileError("No Input PLLSAIQ for PLLSAIQDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAIQ.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLSAIRType = struct {
            value: PLLSAIRConf,

            pub fn get(self: *const PLLSAIRType) comptime_int {
                if (!@hasDecl(this, "PLLSAIN")) {
                    @compileError("No Input PLLSAIN for PLLSAIR\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAIN.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLSAIRDivType = struct {
            value: PLLSAIRDivConf,

            pub fn get(self: *const PLLSAIRDivType) comptime_int {
                if (!@hasDecl(this, "PLLSAIR")) {
                    @compileError("No Input PLLSAIR for PLLSAIRDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAIR.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLI2SNType = struct {
            value: PLLI2SNConf,

            pub fn get(self: *const PLLI2SNType) comptime_int {
                if (!@hasDecl(this, "PLLM")) {
                    @compileError("No Input PLLM for PLLI2SN\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLM.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLLI2SPType = struct {
            value: PLLI2SPConf,

            pub fn get(self: *const PLLI2SPType) comptime_int {
                if (!@hasDecl(this, "PLLI2SN")) {
                    @compileError("No Input PLLI2SN for PLLI2SP\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLI2SN.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLI2SQType = struct {
            value: PLLI2SQConf,

            pub fn get(self: *const PLLI2SQType) comptime_int {
                if (!@hasDecl(this, "PLLI2SN")) {
                    @compileError("No Input PLLI2SN for PLLI2SQ\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLI2SN.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLI2SQDivType = struct {
            value: PLLI2SQDivConf,

            pub fn get(self: *const PLLI2SQDivType) comptime_int {
                if (!@hasDecl(this, "PLLI2SQ")) {
                    @compileError("No Input PLLI2SQ for PLLI2SQDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLI2SQ.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLI2SRType = struct {
            value: PLLI2SRConf,

            pub fn get(self: *const PLLI2SRType) comptime_int {
                if (!@hasDecl(this, "PLLI2SN")) {
                    @compileError("No Input PLLI2SN for PLLI2SR\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLI2SN.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLI2SRoutputType = struct {
            pub fn get(_: *const PLLI2SRoutputType) comptime_int {
                return PLLI2SR.get();
            }
        };
        const HSIRC = HSIRCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{ .value = conf.LSIRC };
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const I2S_CKIN = I2S_CKINType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLLM = PLLMType{ .value = conf.PLLM };
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2output = I2C2outputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3output = I2C3outputType{};
        const I2C4Mult = I2C4MultType{ .value = conf.I2C4Mult };
        pub const I2C4output = I2C4outputType{};
        const PLL48Mult = PLL48MultType{ .value = conf.PLL48Mult };
        pub const RNGoutput = RNGoutputType{};
        pub const USBoutput = USBoutputType{};
        pub const SPDIFoutput = SPDIFoutputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        const SAI2Mult = SAI2MultType{ .value = conf.SAI2Mult };
        pub const SAI2output = SAI2outputType{};
        const DFSDMAudioMult = DFSDMAudioMultType{ .value = conf.DFSDMAudioMult };
        pub const DFSDMAudiooutput = DFSDMAudiooutputType{};
        const SDMMCMult = SDMMCMultType{ .value = conf.SDMMCMult };
        pub const SDMMCoutput = SDMMCoutputType{};
        const SDMMC2Mult = SDMMC2MultType{ .value = conf.SDMMC2Mult };
        pub const SDMMC2output = SDMMC2outputType{};
        const I2SMult = I2SMultType{ .value = conf.I2SMult };
        pub const I2Soutput = I2SoutputType{};
        pub const EthernetPtpOutput = EthernetPtpOutputType{};
        const MCO1Mult = MCO1MultType{ .value = conf.MCO1Mult };
        const MCO1Div = MCO1DivType{ .value = conf.MCO1Div };
        pub const MCO1Pin = MCO1PinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
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
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART2Mult = USART2MultType{ .value = conf.USART2Mult };
        pub const USART2output = USART2outputType{};
        const USART3Mult = USART3MultType{ .value = conf.USART3Mult };
        pub const USART3output = USART3outputType{};
        const USART6Mult = USART6MultType{ .value = conf.USART6Mult };
        pub const USART6output = USART6outputType{};
        const UART4Mult = UART4MultType{ .value = conf.UART4Mult };
        pub const UART4output = UART4outputType{};
        const UART5Mult = UART5MultType{ .value = conf.UART5Mult };
        pub const UART5output = UART5outputType{};
        const UART7Mult = UART7MultType{ .value = conf.UART7Mult };
        pub const UART7output = UART7outputType{};
        const UART8Mult = UART8MultType{ .value = conf.UART8Mult };
        pub const UART8output = UART8outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1Output = LPTIM1OutputType{};
        const HSIDivCEC = HSIDivCECType{};
        const CECMult = CECMultType{ .value = conf.CECMult };
        pub const CECOutput = CECOutputType{};
        const DFSDMMult = DFSDMMultType{ .value = conf.DFSDMMult };
        pub const DFSDMoutput = DFSDMoutputType{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLP = PLLPType{ .value = conf.PLLP };
        const PLLQ = PLLQType{ .value = conf.PLLQ };
        pub const PLLQoutput = PLLQoutputType{};
        const PLLR = PLLRType{ .value = conf.PLLR };
        pub const PLLRoutput = PLLRoutputType{};
        const PLLSAIN = PLLSAINType{ .value = conf.PLLSAIN };
        const PLLSAIP = PLLSAIPType{ .value = conf.PLLSAIP };
        pub const PLLSAIoutput = PLLSAIoutputType{};
        const PLLSAIQ = PLLSAIQType{ .value = conf.PLLSAIQ };
        const PLLSAIQDiv = PLLSAIQDivType{ .value = conf.PLLSAIQDiv };
        const PLLSAIR = PLLSAIRType{ .value = conf.PLLSAIR };
        const PLLSAIRDiv = PLLSAIRDivType{ .value = conf.PLLSAIRDiv };
        const PLLI2SN = PLLI2SNType{ .value = conf.PLLI2SN };
        const PLLI2SP = PLLI2SPType{ .value = conf.PLLI2SP };
        const PLLI2SQ = PLLI2SQType{ .value = conf.PLLI2SQ };
        const PLLI2SQDiv = PLLI2SQDivType{ .value = conf.PLLI2SQDiv };
        const PLLI2SR = PLLI2SRType{ .value = conf.PLLI2SR };
        pub const PLLI2SRoutput = PLLI2SRoutputType{};

        pub fn validate() void {
            _ = I2C1output.get();
            _ = I2C2output.get();
            _ = I2C3output.get();
            _ = I2C4output.get();
            _ = RNGoutput.get();
            _ = USBoutput.get();
            _ = SPDIFoutput.get();
            _ = SAI1output.get();
            _ = SAI2output.get();
            _ = DFSDMAudiooutput.get();
            _ = SDMMCoutput.get();
            _ = SDMMC2output.get();
            _ = I2Soutput.get();
            _ = EthernetPtpOutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = TimPrescOut2.get();
            _ = USART1output.get();
            _ = USART2output.get();
            _ = USART3output.get();
            _ = USART6output.get();
            _ = UART4output.get();
            _ = UART5output.get();
            _ = UART7output.get();
            _ = UART8output.get();
            _ = LPTIM1Output.get();
            _ = CECOutput.get();
            _ = DFSDMoutput.get();
        }
    };

    return ClockStruct;
}
