const std = @import("std");

pub const HseDivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
        };
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
pub const LSIOutConf = enum {
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
pub const RSTClkSourceConf = enum {
    HSERSTDevisor,
    LSEOSC,
    LSIOut,
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HseDiv,
    PLL1R,
};
pub const PLLSourceConf = enum {
    HSIRC,
    HseDiv,
};
pub const PLLMConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLMConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLM is 1\n");
        } else if (val > 8) {
            @compileError("min value for PLLM is 8\n");
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
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIOut,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    APB7Output,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    APB7Output,
    LSIOut,
    HSIRC,
    LSEOSC,
};
pub const ADCMultConf = enum {
    AHBOutput,
    SysCLKOutput,
    HSEOSC,
    HSIRC,
    PLL1P,
};
pub const ASMultConf = enum {
    PLL1P,
    PLL1Q,
};
pub const I2C3MultConf = enum {
    APB7Output,
    SysCLKOutput,
    HSIRC,
};
pub const RNGMultConf = enum {
    LSEOSC,
    pllqDivToRNG,
    HSIRC,
    LSIOut,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIOut,
    HSEOSC,
    HSIRC,
    PLL1R,
    SysCLKOutput,
    PLL1P,
    PLL1Q,
    AHB5Output,
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
    LSIOut,
    LSEOSC,
};
pub const AHB5PrescalerConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
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
pub const CortexCLockSelectionConf = enum {
    CortexPrescaler,
    LSEOSC,
    LSIOut,
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
pub const APB7PrescalerConf = enum {
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
pub const SPI3MultConf = enum {
    APB7Output,
    SysCLKOutput,
    HSIRC,
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
pub const PLL1PConf = enum {
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
pub const PLL1RConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL1RConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLL1R is 1\n");
        } else if (val > 128) {
            @compileError("min value for PLL1R is 128\n");
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
    HseDiv: HseDivConf = .DIV1,
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSIOut: LSIOutConf = .DIV1,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RSTClkSource: RSTClkSourceConf = .HSERSTDevisor,
    SysClkSource: SysClkSourceConf = .HSIRC,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIOut,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB7Output,
    LPTIM1Mult: LPTIM1MultConf = .APB7Output,
    ADCMult: ADCMultConf = .AHBOutput,
    ASMult: ASMultConf = .PLL1P,
    I2C3Mult: I2C3MultConf = .APB7Output,
    RNGMult: RNGMultConf = .HSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIOut,
    AHB5Prescaler: AHB5PrescalerConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexCLockSelection: CortexCLockSelectionConf = .CortexPrescaler,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    APB7Prescaler: APB7PrescalerConf = .DIV1,
    SPI3Mult: SPI3MultConf = .APB7Output,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = .DIV2,
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = @enumFromInt(2),
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
            pub fn get(_: *const HSEOSCType) comptime_int {
                return 16000000;
            }
        };
        const HseDivType = struct {
            value: HseDivConf,

            pub fn get(self: *const HseDivType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HseDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const LSIRCType = struct {
            value: LSIRCConf,
            pub fn get(comptime self: LSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const LSIOutType = struct {
            value: LSIOutConf,

            pub fn get(self: *const LSIOutType) comptime_int {
                if (!@hasDecl(this, "LSIRC")) {
                    @compileError("No Input LSIRC for LSIOut\n");
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
        const SAI1_EXTType = struct {
            pub fn get(_: *const SAI1_EXTType) comptime_int {
                return 48000;
            }
        };
        const HSERSTDevisorType = struct {
            pub fn get(_: *const HSERSTDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSERSTDevisor\n");
                }
                const from_input = this.HSEOSC.get();
                const div = 1000;
                return (from_input / div);
            }
        };

        const RSTClkSourceType = struct {
            value: RSTClkSourceConf,
            pub fn get(comptime self: RSTClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSERSTDevisor => HSERSTDevisor.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIOut => LSIOut.get(),
                };
            }
        };
        const RSTOutputType = struct {
            pub fn get(_: *const RSTOutputType) comptime_int {
                return RSTClkSource.get();
            }
        };
        const RSTRFOutputType = struct {
            pub fn get(_: *const RSTRFOutputType) comptime_int {
                return HSEOSC.get();
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HseDiv => HseDiv.get(),
                    .PLL1R => PLL1R.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HseDiv => HseDiv.get(),
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
                    .LSIOut => LSIOut.get(),
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
                return LSIOut.get();
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
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .APB7Output => APB7Output.get(),
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
                    .APB7Output => APB7Output.get(),
                    .LSIOut => LSIOut.get(),
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
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .PLL1P => PLL1P.get(),
                };
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                return ADCMult.get();
            }
        };
        const ASMultType = struct {
            value: ASMultConf,
            pub fn get(comptime self: ASMultType) comptime_int {
                return switch (self.value) {
                    .PLL1P => PLL1P.get(),
                    .PLL1Q => PLL1Q.get(),
                };
            }
        };
        const ASoutputType = struct {
            pub fn get(_: *const ASoutputType) comptime_int {
                return ASMult.get();
            }
        };
        const I2C3MultType = struct {
            value: I2C3MultConf,
            pub fn get(comptime self: I2C3MultType) comptime_int {
                return switch (self.value) {
                    .APB7Output => APB7Output.get(),
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
        const pllqDivToRNGType = struct {
            pub fn get(_: *const pllqDivToRNGType) comptime_int {
                if (!@hasDecl(this, "PLL1Q")) {
                    @compileError("No Input PLL1Q for pllqDivToRNG\n");
                }
                const from_input = this.PLL1Q.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const RNGMultType = struct {
            value: RNGMultConf,
            pub fn get(comptime self: RNGMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .pllqDivToRNG => pllqDivToRNG.get(),
                    .HSIRC => HSIRC.get(),
                    .LSIOut => LSIOut.get(),
                };
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                return RNGMult.get();
            }
        };
        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIOut => LSIOut.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .PLL1R => PLL1R.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLL1P => PLL1P.get(),
                    .PLL1Q => PLL1Q.get(),
                    .AHB5Output => AHB5Output.get(),
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
                    .LSIOut => LSIOut.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LSCOOutputType = struct {
            pub fn get(_: *const LSCOOutputType) comptime_int {
                return LSCOMult.get();
            }
        };
        const AHB5PrescalerType = struct {
            value: AHB5PrescalerConf,

            pub fn get(self: *const AHB5PrescalerType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for AHB5Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const AHB5OutputType = struct {
            pub fn get(_: *const AHB5OutputType) comptime_int {
                const from_input = AHB5Prescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHB5Prescaler on AHB5Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 32000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHB5Prescaler on AHB5Output | recive {d} max 32000000\n", .{from_input}));
                }
                return from_input;
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
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HCLKOutputType = struct {
            pub fn get(_: *const HCLKOutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on HCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on HCLKOutput | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HCLK4OutputType = struct {
            pub fn get(_: *const HCLK4OutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on HCLK4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on HCLK4Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CortexPrescalerType = struct {
            pub fn get(_: *const CortexPrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for CortexPrescaler\n");
                }
                const from_input = this.AHBOutput.get();
                const div = 8;
                return (from_input / div);
            }
        };

        const CortexCLockSelectionType = struct {
            value: CortexCLockSelectionConf,
            pub fn get(comptime self: CortexCLockSelectionType) comptime_int {
                return switch (self.value) {
                    .CortexPrescaler => CortexPrescaler.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIOut => LSIOut.get(),
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
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on FCLKCortexOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on FCLKCortexOutput | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
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
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 100000000\n", .{from_input}));
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
                const from_input = TimPrescalerAPB1.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from TimPrescalerAPB1 on TimPrescOut1 | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from TimPrescalerAPB1 on TimPrescOut1 | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
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
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB7PrescalerType = struct {
            value: APB7PrescalerConf,

            pub fn get(self: *const APB7PrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for APB7Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB7OutputType = struct {
            pub fn get(_: *const APB7OutputType) comptime_int {
                const from_input = APB7Prescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB7Prescaler on APB7Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB7Prescaler on APB7Output | recive {d} max 100000000\n", .{from_input}));
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
                const from_input = TimPrescalerAPB2.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from TimPrescalerAPB2 on TimPrescOut2 | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from TimPrescalerAPB2 on TimPrescOut2 | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI3MultType = struct {
            value: SPI3MultConf,
            pub fn get(comptime self: SPI3MultType) comptime_int {
                return switch (self.value) {
                    .APB7Output => APB7Output.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const SPI3outputType = struct {
            pub fn get(_: *const SPI3outputType) comptime_int {
                return SPI3Mult.get();
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
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
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
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const HSIRC = HSIRCType{};
        const HSEOSC = HSEOSCType{};
        const HseDiv = HseDivType{ .value = conf.HseDiv };
        const LSIRC = LSIRCType{ .value = conf.LSIRC };
        const LSIOut = LSIOutType{ .value = conf.LSIOut };
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const SAI1_EXT = SAI1_EXTType{};
        const HSERSTDevisor = HSERSTDevisorType{};
        const RSTClkSource = RSTClkSourceType{ .value = conf.RSTClkSource };
        pub const RSTOutput = RSTOutputType{};
        pub const RSTRFOutput = RSTRFOutputType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLLM = PLLMType{ .value = conf.PLLM };
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const ASMult = ASMultType{ .value = conf.ASMult };
        pub const ASoutput = ASoutputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3output = I2C3outputType{};
        const pllqDivToRNG = pllqDivToRNGType{};
        const RNGMult = RNGMultType{ .value = conf.RNGMult };
        pub const RNGoutput = RNGoutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const LSCOMult = LSCOMultType{ .value = conf.LSCOMult };
        pub const LSCOOutput = LSCOOutputType{};
        const AHB5Prescaler = AHB5PrescalerType{ .value = conf.AHB5Prescaler };
        pub const AHB5Output = AHB5OutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        pub const HCLK4Output = HCLK4OutputType{};
        const CortexPrescaler = CortexPrescalerType{};
        const CortexCLockSelection = CortexCLockSelectionType{ .value = conf.CortexCLockSelection };
        pub const CortexSysOutput = CortexSysOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const APB1Prescaler = APB1PrescalerType{ .value = conf.APB1Prescaler };
        pub const APB1Output = APB1OutputType{};
        const TimPrescalerAPB1 = TimPrescalerAPB1Type{};
        pub const TimPrescOut1 = TimPrescOut1Type{};
        const APB2Prescaler = APB2PrescalerType{ .value = conf.APB2Prescaler };
        pub const APB2Output = APB2OutputType{};
        const APB7Prescaler = APB7PrescalerType{ .value = conf.APB7Prescaler };
        pub const APB7Output = APB7OutputType{};
        const TimPrescalerAPB2 = TimPrescalerAPB2Type{};
        pub const TimPrescOut2 = TimPrescOut2Type{};
        const SPI3Mult = SPI3MultType{ .value = conf.SPI3Mult };
        pub const SPI3output = SPI3outputType{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLFRACN = PLLFRACNType{ .value = conf.PLLFRACN };
        const PLL1P = PLL1PType{ .value = conf.PLL1P };
        pub const PLLPoutput = PLLPoutputType{};
        const PLL1Q = PLL1QType{ .value = conf.PLL1Q };
        pub const PLLQoutput = PLLQoutputType{};
        const PLL1R = PLL1RType{ .value = conf.PLL1R };

        pub fn validate() void {
            _ = RSTOutput.get();
            _ = RSTRFOutput.get();
            _ = RTCOutput.get();
            _ = IWDGOutput.get();
            _ = USART1output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = ADCoutput.get();
            _ = ASoutput.get();
            _ = I2C3output.get();
            _ = RNGoutput.get();
            _ = AHB5Output.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = HCLK4Output.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = APB2Output.get();
            _ = APB7Output.get();
            _ = SPI3output.get();
        }
    };

    return ClockStruct;
}
