const std = @import("std");

pub const HSISYSConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
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
pub const SysClkSourceConf = enum {
    LSEOSC,
    HSISYS,
    HSEOSC,
    PLLR,
    LSIRC,
};
pub const PLLSourceConf = enum {
    HSIRC,
    HSEOSC,
};
pub const PLLMConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
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
        };
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const USART1MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const USART2MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const I2S1MultConf = enum {
    SysCLKOutput,
    PLLP,
    HSIRC,
    I2S_CKIN,
};
pub const I2S2MultConf = enum {
    SysCLKOutput,
    PLLP,
    HSIRC,
    I2S_CKIN,
};
pub const USART3MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    APBPrescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const LPTIM2MultConf = enum {
    APBPrescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const LPUART2MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const CECMultConf = enum {
    HSICECCDevisor,
    LSEOSC,
};
pub const TIM1MultConf = enum {
    TimPrescalerAPB,
    PLLQ,
};
pub const TIM15MultConf = enum {
    TimPrescalerAPB,
    PLLQ,
};
pub const ADCMultConf = enum {
    SysCLKOutput,
    HSIRC,
    PLLP,
};
pub const RNGDIVConf = enum {
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
pub const CK48MultConf = enum {
    SysCLKOutput,
    PLLQ,
    RNGHSIDiv,
};
pub const I2C1MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIRC,
};
pub const I2C2MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIRC,
};
pub const FDCANMultConf = enum {
    APBPrescaler,
    PLLQ,
    HSEOSC,
};
pub const USBMultConf = enum {
    HSI48RC,
    PLLQ,
    HSEOSC,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRC,
    PLLR,
    SysCLKOutput,
    HSI48RC,
    PLLP,
    PLLQ,
    RTCClkSource,
    RTCWkupOutput,
};
pub const MCODivConf = enum {
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
    DIV1024,
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
            .DIV1024 => 1024,
        };
    }
};
pub const MCO2MultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRC,
    PLLR,
    SysCLKOutput,
    HSI48RC,
    PLLP,
    PLLQ,
    RTCClkSource,
    RTCWkupOutput,
};
pub const MCO2DivConf = enum {
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
    DIV1024,
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
            .DIV1024 => 1024,
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
pub const APBPrescalerConf = enum {
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
        } else if (val > 86) {
            @compileError("min value for PLLN is 86\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 86;
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
    DIV32,
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
        };
    }
};
pub const PLLQConf = enum {
    const this = @This();
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
        };
    }
};
pub const PLLRConf = enum {
    const this = @This();
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
        };
    }
};
pub const Config = struct {
    HSISYS: HSISYSConf = .DIV1,
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSISYS,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = .DIV1,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    USART1Mult: USART1MultConf = .APBPrescaler,
    USART2Mult: USART2MultConf = .APBPrescaler,
    I2S1Mult: I2S1MultConf = .SysCLKOutput,
    I2S2Mult: I2S2MultConf = .SysCLKOutput,
    USART3Mult: USART3MultConf = .APBPrescaler,
    LPUART1Mult: LPUART1MultConf = .APBPrescaler,
    LPTIM1Mult: LPTIM1MultConf = .APBPrescaler,
    LPTIM2Mult: LPTIM2MultConf = .APBPrescaler,
    LPUART2Mult: LPUART2MultConf = .APBPrescaler,
    CECMult: CECMultConf = .HSICECCDevisor,
    TIM1Mult: TIM1MultConf = .TimPrescalerAPB,
    TIM15Mult: TIM15MultConf = .TimPrescalerAPB,
    ADCMult: ADCMultConf = .SysCLKOutput,
    RNGDIV: RNGDIVConf = .DIV1,
    CK48Mult: CK48MultConf = .RNGHSIDiv,
    I2C1Mult: I2C1MultConf = .APBPrescaler,
    I2C2Mult: I2C2MultConf = .APBPrescaler,
    FDCANMult: FDCANMultConf = .APBPrescaler,
    USBMult: USBMultConf = .HSI48RC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIRC,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APBPrescaler: APBPrescalerConf = .DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = .DIV2,
    PLLR: PLLRConf = .DIV2,
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 16000000;
            }
        };
        const HSISYSType = struct {
            value: HSISYSConf,

            pub fn get(self: *const HSISYSType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSISYS\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
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
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .HSISYS => HSISYS.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLR => PLLR.get(),
                    .LSIRC => LSIRC.get(),
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
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
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
        const RTCWkupOutputType = struct {
            pub fn get(_: *const RTCWkupOutputType) comptime_int {
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
                    .APBPrescaler => APBPrescaler.get(),
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
                    .APBPrescaler => APBPrescaler.get(),
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
        const I2S1MultType = struct {
            value: I2S1MultConf,
            pub fn get(comptime self: I2S1MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLLP => PLLP.get(),
                    .HSIRC => HSIRC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const I2S1outputType = struct {
            pub fn get(_: *const I2S1outputType) comptime_int {
                return I2S1Mult.get();
            }
        };
        const I2S2MultType = struct {
            value: I2S2MultConf,
            pub fn get(comptime self: I2S2MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLLP => PLLP.get(),
                    .HSIRC => HSIRC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const I2S2outputType = struct {
            pub fn get(_: *const I2S2outputType) comptime_int {
                return I2S2Mult.get();
            }
        };
        const USART3MultType = struct {
            value: USART3MultConf,
            pub fn get(comptime self: USART3MultType) comptime_int {
                return switch (self.value) {
                    .APBPrescaler => APBPrescaler.get(),
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
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .APBPrescaler => APBPrescaler.get(),
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
                    .APBPrescaler => APBPrescaler.get(),
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
                    .APBPrescaler => APBPrescaler.get(),
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
        const LPUART2MultType = struct {
            value: LPUART2MultConf,
            pub fn get(comptime self: LPUART2MultType) comptime_int {
                return switch (self.value) {
                    .APBPrescaler => APBPrescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPUART2outputType = struct {
            pub fn get(_: *const LPUART2outputType) comptime_int {
                return LPUART2Mult.get();
            }
        };
        const HSICECCDevisorType = struct {
            pub fn get(_: *const HSICECCDevisorType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSICECCDevisor\n");
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
                    .HSICECCDevisor => HSICECCDevisor.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const CECoutputType = struct {
            pub fn get(_: *const CECoutputType) comptime_int {
                return CECMult.get();
            }
        };
        const TIM1MultType = struct {
            value: TIM1MultConf,
            pub fn get(comptime self: TIM1MultType) comptime_int {
                return switch (self.value) {
                    .TimPrescalerAPB => TimPrescalerAPB.get(),
                    .PLLQ => PLLQ.get(),
                };
            }
        };
        const TIM1outputType = struct {
            pub fn get(_: *const TIM1outputType) comptime_int {
                const from_input = TIM1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from TIM1Mult on TIM1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 128000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from TIM1Mult on TIM1output | recive {d} max 128000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const TIM15MultType = struct {
            value: TIM15MultConf,
            pub fn get(comptime self: TIM15MultType) comptime_int {
                return switch (self.value) {
                    .TimPrescalerAPB => TimPrescalerAPB.get(),
                    .PLLQ => PLLQ.get(),
                };
            }
        };
        const TIM15outputType = struct {
            pub fn get(_: *const TIM15outputType) comptime_int {
                return TIM15Mult.get();
            }
        };
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .PLLP => PLLP.get(),
                };
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                const from_input = ADCMult.get();
                if (from_input < 140000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADCMult on ADCoutput | recive {d} min 140000\n", .{from_input}));
                } else if (from_input > 80000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCMult on ADCoutput | recive {d} max 80000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const RNGDIVType = struct {
            value: RNGDIVConf,

            pub fn get(self: *const RNGDIVType) comptime_int {
                if (!@hasDecl(this, "CK48Mult")) {
                    @compileError("No Input CK48Mult for RNGDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.CK48Mult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const RNGHSIDivType = struct {
            pub fn get(_: *const RNGHSIDivType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for RNGHSIDiv\n");
                }
                const from_input = this.HSIRC.get();
                const div = 8;
                return (from_input / div);
            }
        };

        const CK48MultType = struct {
            value: CK48MultConf,
            pub fn get(comptime self: CK48MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLLQ => PLLQ.get(),
                    .RNGHSIDiv => RNGHSIDiv.get(),
                };
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                const from_input = RNGoutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RNGoutput on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RNGoutput on RNGoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .APBPrescaler => APBPrescaler.get(),
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
                    .APBPrescaler => APBPrescaler.get(),
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
        const FDCANMultType = struct {
            value: FDCANMultConf,
            pub fn get(comptime self: FDCANMultType) comptime_int {
                return switch (self.value) {
                    .APBPrescaler => APBPrescaler.get(),
                    .PLLQ => PLLQ.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const FDCANoutputType = struct {
            pub fn get(_: *const FDCANoutputType) comptime_int {
                return FDCANMult.get();
            }
        };
        const USBMultType = struct {
            value: USBMultConf,
            pub fn get(comptime self: USBMultType) comptime_int {
                return switch (self.value) {
                    .HSI48RC => HSI48RC.get(),
                    .PLLQ => PLLQ.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                return USBMult.get();
            }
        };
        const I2S_CKINType = struct {
            pub fn get(_: *const I2S_CKINType) comptime_int {
                return 48000;
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
                    .HSI48RC => HSI48RC.get(),
                    .PLLP => PLLP.get(),
                    .PLLQ => PLLQ.get(),
                    .RTCClkSource => RTCClkSource.get(),
                    .RTCWkupOutput => RTCWkupOutput.get(),
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
        const MCO2MultType = struct {
            value: MCO2MultConf,
            pub fn get(comptime self: MCO2MultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .PLLR => PLLR.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSI48RC => HSI48RC.get(),
                    .PLLP => PLLP.get(),
                    .PLLQ => PLLQ.get(),
                    .RTCClkSource => RTCClkSource.get(),
                    .RTCWkupOutput => RTCWkupOutput.get(),
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
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 64000000\n", .{from_input}));
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
        const APBPrescalerType = struct {
            value: APBPrescalerConf,

            pub fn get(self: *const APBPrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for APBPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APBOutputType = struct {
            pub fn get(_: *const APBOutputType) comptime_int {
                const from_input = APBPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APBPrescaler on APBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APBPrescaler on APBOutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const TimPrescalerAPBType = struct {
            pub fn get(_: *const TimPrescalerAPBType) comptime_int {
                if (!@hasDecl(this, "APBPrescaler")) {
                    @compileError("No Input APBPrescaler for TimPrescalerAPB\n");
                }
                const from_input = this.APBPrescaler.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const TimPrescOut1Type = struct {
            pub fn get(_: *const TimPrescOut1Type) comptime_int {
                return TimPrescalerAPB.get();
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

        const PLLPoutputType = struct {
            pub fn get(_: *const PLLPoutputType) comptime_int {
                const from_input = PLLP.get();
                if (from_input < 3090000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLP on PLLPoutput | recive {d} min 3090000\n", .{from_input}));
                } else if (from_input > 40000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLP on PLLPoutput | recive {d} max 40000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = PLLQ.get();
                if (from_input < 12000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLQ on PLLQoutput | recive {d} min 12000000\n", .{from_input}));
                } else if (from_input > 128000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLQ on PLLQoutput | recive {d} max 128000000\n", .{from_input}));
                }
                return from_input;
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

        const HSIRC = HSIRCType{};
        const HSISYS = HSISYSType{ .value = conf.HSISYS };
        const HSI48RC = HSI48RCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLLM = PLLMType{ .value = conf.PLLM };
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const RTCWkupOutput = RTCWkupOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART2Mult = USART2MultType{ .value = conf.USART2Mult };
        pub const USART2output = USART2outputType{};
        const I2S1Mult = I2S1MultType{ .value = conf.I2S1Mult };
        pub const I2S1output = I2S1outputType{};
        const I2S2Mult = I2S2MultType{ .value = conf.I2S2Mult };
        pub const I2S2output = I2S2outputType{};
        const USART3Mult = USART3MultType{ .value = conf.USART3Mult };
        pub const USART3output = USART3outputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const LPTIM2Mult = LPTIM2MultType{ .value = conf.LPTIM2Mult };
        pub const LPTIM2output = LPTIM2outputType{};
        const LPUART2Mult = LPUART2MultType{ .value = conf.LPUART2Mult };
        pub const LPUART2output = LPUART2outputType{};
        const HSICECCDevisor = HSICECCDevisorType{};
        const CECMult = CECMultType{ .value = conf.CECMult };
        pub const CECoutput = CECoutputType{};
        const TIM1Mult = TIM1MultType{ .value = conf.TIM1Mult };
        pub const TIM1output = TIM1outputType{};
        const TIM15Mult = TIM15MultType{ .value = conf.TIM15Mult };
        pub const TIM15output = TIM15outputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const RNGDIV = RNGDIVType{ .value = conf.RNGDIV };
        const RNGHSIDiv = RNGHSIDivType{};
        const CK48Mult = CK48MultType{ .value = conf.CK48Mult };
        pub const RNGoutput = RNGoutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2output = I2C2outputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANoutput = FDCANoutputType{};
        const USBMult = USBMultType{ .value = conf.USBMult };
        pub const USBoutput = USBoutputType{};
        const I2S_CKIN = I2S_CKINType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const LSCOMult = LSCOMultType{ .value = conf.LSCOMult };
        pub const LSCOOutput = LSCOOutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const PWRCLKoutput = PWRCLKoutputType{};
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const APBPrescaler = APBPrescalerType{ .value = conf.APBPrescaler };
        pub const APBOutput = APBOutputType{};
        const TimPrescalerAPB = TimPrescalerAPBType{};
        pub const TimPrescOut1 = TimPrescOut1Type{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLP = PLLPType{ .value = conf.PLLP };
        pub const PLLPoutput = PLLPoutputType{};
        const PLLQ = PLLQType{ .value = conf.PLLQ };
        pub const PLLQoutput = PLLQoutputType{};
        const PLLR = PLLRType{ .value = conf.PLLR };

        pub fn validate() void {
            _ = USART1output.get();
            _ = USART2output.get();
            _ = I2S1output.get();
            _ = I2S2output.get();
            _ = USART3output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM2output.get();
            _ = LPUART2output.get();
            _ = CECoutput.get();
            _ = TIM1output.get();
            _ = TIM15output.get();
            _ = ADCoutput.get();
            _ = RNGoutput.get();
            _ = I2C1output.get();
            _ = I2C2output.get();
            _ = FDCANoutput.get();
            _ = USBoutput.get();
            _ = PWRCLKoutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APBOutput.get();
            _ = TimPrescOut1.get();
        }
    };

    return ClockStruct;
}
