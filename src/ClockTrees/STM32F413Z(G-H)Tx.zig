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
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
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
pub const PLLI2SSRCConf = enum {
    PLLSource,
    I2S_CKIN,
};
pub const PLLI2SMConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLI2SMConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for PLLI2SM is 2\n");
        } else if (val > 63) {
            @compileError("min value for PLLI2SM is 63\n");
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
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLP,
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
pub const I2S1MultConf = enum {
    PLLR,
    PLLI2SR,
    I2S_CKIN,
    PLLSource,
};
pub const I2S2MultConf = enum {
    PLLR,
    PLLI2SR,
    I2S_CKIN,
    PLLSource,
};
pub const FMPI2C1MultConf = enum {
    HSIRC,
    APB1Prescaler,
    SysCLKOutput,
};
pub const DFSDMMultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
};
pub const USBMultConf = enum {
    PLLQ,
    PLLI2SQ,
};
pub const SDIOMultConf = enum {
    SysCLKOutput,
    USBMult,
};
pub const DFSDMAudioMultConf = enum {
    I2S1Mult,
    I2S2Mult,
};
pub const DFSDM2AudioMultConf = enum {
    I2S1Mult,
    I2S2Mult,
};
pub const SAI1AMultConf = enum {
    PLLSource,
    SAI1APrescaler,
    SAI1BPrescaler,
    I2S_CKIN,
};
pub const SAI1APrescalerConf = enum(comptime_int) {
    _,
    pub fn get(num: SAI1APrescalerConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for SAI1APrescaler is 1\n");
        } else if (val > 32) {
            @compileError("min value for SAI1APrescaler is 32\n");
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
pub const SAI1BMultConf = enum {
    PLLSource,
    SAI1APrescaler,
    SAI1BPrescaler,
    I2S_CKIN,
};
pub const SAI1BPrescalerConf = enum(comptime_int) {
    _,
    pub fn get(num: SAI1BPrescalerConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for SAI1BPrescaler is 1\n");
        } else if (val > 32) {
            @compileError("min value for SAI1BPrescaler is 32\n");
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
pub const LPTimerMultConf = enum {
    APB1Prescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
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
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(16),
    PLLI2SSRC: PLLI2SSRCConf = .PLLSource,
    PLLI2SM: PLLI2SMConf = @enumFromInt(16),
    SysClkSource: SysClkSourceConf = .HSIRC,
    MCO1Mult: MCO1MultConf = .HSIRC,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysClkSource,
    MCO2Div: MCO2DivConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    I2S1Mult: I2S1MultConf = .PLLI2SR,
    I2S2Mult: I2S2MultConf = .PLLI2SR,
    FMPI2C1Mult: FMPI2C1MultConf = .APB1Prescaler,
    DFSDMMult: DFSDMMultConf = .APB2Prescaler,
    USBMult: USBMultConf = .PLLQ,
    SDIOMult: SDIOMultConf = .USBMult,
    DFSDMAudioMult: DFSDMAudioMultConf = .I2S1Mult,
    DFSDM2AudioMult: DFSDM2AudioMultConf = .I2S1Mult,
    SAI1AMult: SAI1AMultConf = .PLLSource,
    SAI1APrescaler: SAI1APrescalerConf = @enumFromInt(1),
    SAI1BMult: SAI1BMultConf = .PLLSource,
    SAI1BPrescaler: SAI1BPrescalerConf = @enumFromInt(1),
    LPTimerMult: LPTimerMultConf = .APB1Prescaler,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = @enumFromInt(2),
    PLLR: PLLRConf = @enumFromInt(2),
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SQ: PLLI2SQConf = @enumFromInt(2),
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
        const I2S_CKINType = struct {
            pub fn get(_: *const I2S_CKINType) comptime_int {
                return 12288000;
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

        const PLLI2SSRCType = struct {
            value: PLLI2SSRCConf,
            pub fn get(comptime self: PLLI2SSRCType) comptime_int {
                return switch (self.value) {
                    .PLLSource => PLLSource.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const PLLI2SMType = struct {
            value: PLLI2SMConf,

            pub fn get(self: *const PLLI2SMType) comptime_int {
                if (!@hasDecl(this, "PLLI2SSRC")) {
                    @compileError("No Input PLLI2SSRC for PLLI2SM\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLI2SSRC.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
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
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 100000000\n", .{from_input}));
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
                const from_input = MCO1Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MCO1Div on MCO1Pin | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MCO1Div on MCO1Pin | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
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
                const from_input = MCO2Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MCO2Div on MCO2Pin | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MCO2Div on MCO2Pin | recive {d} max 100000000\n", .{from_input}));
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
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 100000000\n", .{from_input}));
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
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 50000000\n", .{from_input}));
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
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 100000000\n", .{from_input}));
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
        const I2S1MultType = struct {
            value: I2S1MultConf,
            pub fn get(comptime self: I2S1MultType) comptime_int {
                return switch (self.value) {
                    .PLLR => PLLR.get(),
                    .PLLI2SR => PLLI2SR.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .PLLSource => PLLSource.get(),
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
                    .PLLR => PLLR.get(),
                    .PLLI2SR => PLLI2SR.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .PLLSource => PLLSource.get(),
                };
            }
        };
        const I2S2outputType = struct {
            pub fn get(_: *const I2S2outputType) comptime_int {
                return I2S2Mult.get();
            }
        };
        const FMPI2C1MultType = struct {
            value: FMPI2C1MultConf,
            pub fn get(comptime self: FMPI2C1MultType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const FMPI2C1outputType = struct {
            pub fn get(_: *const FMPI2C1outputType) comptime_int {
                return FMPI2C1Mult.get();
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
        const DFSDM2outputType = struct {
            pub fn get(_: *const DFSDM2outputType) comptime_int {
                return DFSDMMult.get();
            }
        };
        const USBMultType = struct {
            value: USBMultConf,
            pub fn get(comptime self: USBMultType) comptime_int {
                return switch (self.value) {
                    .PLLQ => PLLQ.get(),
                    .PLLI2SQ => PLLI2SQ.get(),
                };
            }
        };
        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                return USBMult.get();
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                const from_input = USBMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USBMult on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USBMult on RNGoutput | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SDIOMultType = struct {
            value: SDIOMultConf,
            pub fn get(comptime self: SDIOMultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .USBMult => USBMult.get(),
                };
            }
        };
        const SDIOoutputType = struct {
            pub fn get(_: *const SDIOoutputType) comptime_int {
                const from_input = SDIOMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDIOMult on SDIOoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDIOMult on SDIOoutput | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DFSDMAudioMultType = struct {
            value: DFSDMAudioMultConf,
            pub fn get(comptime self: DFSDMAudioMultType) comptime_int {
                return switch (self.value) {
                    .I2S1Mult => I2S1Mult.get(),
                    .I2S2Mult => I2S2Mult.get(),
                };
            }
        };
        const DFSDMAudiooutputType = struct {
            pub fn get(_: *const DFSDMAudiooutputType) comptime_int {
                return DFSDMAudioMult.get();
            }
        };
        const DFSDM2AudioMultType = struct {
            value: DFSDM2AudioMultConf,
            pub fn get(comptime self: DFSDM2AudioMultType) comptime_int {
                return switch (self.value) {
                    .I2S1Mult => I2S1Mult.get(),
                    .I2S2Mult => I2S2Mult.get(),
                };
            }
        };
        const DFSDM2AudiooutputType = struct {
            pub fn get(_: *const DFSDM2AudiooutputType) comptime_int {
                return DFSDM2AudioMult.get();
            }
        };
        const SAI1AMultType = struct {
            value: SAI1AMultConf,
            pub fn get(comptime self: SAI1AMultType) comptime_int {
                return switch (self.value) {
                    .PLLSource => PLLSource.get(),
                    .SAI1APrescaler => SAI1APrescaler.get(),
                    .SAI1BPrescaler => SAI1BPrescaler.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const SAI1AoutputType = struct {
            pub fn get(_: *const SAI1AoutputType) comptime_int {
                return SAI1AMult.get();
            }
        };
        const SAI1APrescalerType = struct {
            value: SAI1APrescalerConf,

            pub fn get(self: *const SAI1APrescalerType) comptime_int {
                if (!@hasDecl(this, "PLLR")) {
                    @compileError("No Input PLLR for SAI1APrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLR.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const SAI1BMultType = struct {
            value: SAI1BMultConf,
            pub fn get(comptime self: SAI1BMultType) comptime_int {
                return switch (self.value) {
                    .PLLSource => PLLSource.get(),
                    .SAI1APrescaler => SAI1APrescaler.get(),
                    .SAI1BPrescaler => SAI1BPrescaler.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const SAI1BoutputType = struct {
            pub fn get(_: *const SAI1BoutputType) comptime_int {
                return SAI1BMult.get();
            }
        };
        const SAI1BPrescalerType = struct {
            value: SAI1BPrescalerConf,

            pub fn get(self: *const SAI1BPrescalerType) comptime_int {
                if (!@hasDecl(this, "PLLI2SR")) {
                    @compileError("No Input PLLI2SR for SAI1BPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLI2SR.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const LPTimerMultType = struct {
            value: LPTimerMultConf,
            pub fn get(comptime self: LPTimerMultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .LSIRC => LSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPTimeroutputType = struct {
            pub fn get(_: *const LPTimeroutputType) comptime_int {
                return LPTimerMult.get();
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
        const PLLI2SNType = struct {
            value: PLLI2SNConf,

            pub fn get(self: *const PLLI2SNType) comptime_int {
                if (!@hasDecl(this, "PLLI2SM")) {
                    @compileError("No Input PLLI2SM for PLLI2SN\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLI2SM.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
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

        const PLLI2SQoutputType = struct {
            pub fn get(_: *const PLLI2SQoutputType) comptime_int {
                return PLLI2SQ.get();
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

        const HSIRC = HSIRCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const I2S_CKIN = I2S_CKINType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLLM = PLLMType{ .value = conf.PLLM };
        const PLLI2SSRC = PLLI2SSRCType{ .value = conf.PLLI2SSRC };
        const PLLI2SM = PLLI2SMType{ .value = conf.PLLI2SM };
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const MCO1Mult = MCO1MultType{ .value = conf.MCO1Mult };
        const MCO1Div = MCO1DivType{ .value = conf.MCO1Div };
        pub const MCO1Pin = MCO1PinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
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
        const I2S1Mult = I2S1MultType{ .value = conf.I2S1Mult };
        pub const I2S1output = I2S1outputType{};
        const I2S2Mult = I2S2MultType{ .value = conf.I2S2Mult };
        pub const I2S2output = I2S2outputType{};
        const FMPI2C1Mult = FMPI2C1MultType{ .value = conf.FMPI2C1Mult };
        pub const FMPI2C1output = FMPI2C1outputType{};
        const DFSDMMult = DFSDMMultType{ .value = conf.DFSDMMult };
        pub const DFSDMoutput = DFSDMoutputType{};
        pub const DFSDM2output = DFSDM2outputType{};
        const USBMult = USBMultType{ .value = conf.USBMult };
        pub const USBoutput = USBoutputType{};
        pub const RNGoutput = RNGoutputType{};
        const SDIOMult = SDIOMultType{ .value = conf.SDIOMult };
        pub const SDIOoutput = SDIOoutputType{};
        const DFSDMAudioMult = DFSDMAudioMultType{ .value = conf.DFSDMAudioMult };
        pub const DFSDMAudiooutput = DFSDMAudiooutputType{};
        const DFSDM2AudioMult = DFSDM2AudioMultType{ .value = conf.DFSDM2AudioMult };
        pub const DFSDM2Audiooutput = DFSDM2AudiooutputType{};
        const SAI1AMult = SAI1AMultType{ .value = conf.SAI1AMult };
        pub const SAI1Aoutput = SAI1AoutputType{};
        const SAI1APrescaler = SAI1APrescalerType{ .value = conf.SAI1APrescaler };
        const SAI1BMult = SAI1BMultType{ .value = conf.SAI1BMult };
        pub const SAI1Boutput = SAI1BoutputType{};
        const SAI1BPrescaler = SAI1BPrescalerType{ .value = conf.SAI1BPrescaler };
        const LPTimerMult = LPTimerMultType{ .value = conf.LPTimerMult };
        pub const LPTimeroutput = LPTimeroutputType{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLP = PLLPType{ .value = conf.PLLP };
        const PLLQ = PLLQType{ .value = conf.PLLQ };
        pub const PLLQoutput = PLLQoutputType{};
        const PLLR = PLLRType{ .value = conf.PLLR };
        pub const PLLRoutput = PLLRoutputType{};
        const PLLI2SN = PLLI2SNType{ .value = conf.PLLI2SN };
        const PLLI2SQ = PLLI2SQType{ .value = conf.PLLI2SQ };
        pub const PLLI2SQoutput = PLLI2SQoutputType{};
        const PLLI2SR = PLLI2SRType{ .value = conf.PLLI2SR };

        pub fn validate() void {
            _ = PWRCLKoutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = TimPrescOut2.get();
            _ = I2S1output.get();
            _ = I2S2output.get();
            _ = FMPI2C1output.get();
            _ = DFSDMoutput.get();
            _ = DFSDM2output.get();
            _ = USBoutput.get();
            _ = RNGoutput.get();
            _ = SDIOoutput.get();
            _ = DFSDMAudiooutput.get();
            _ = DFSDM2Audiooutput.get();
            _ = SAI1Aoutput.get();
            _ = SAI1Boutput.get();
            _ = LPTimeroutput.get();
        }
    };

    return ClockStruct;
}
