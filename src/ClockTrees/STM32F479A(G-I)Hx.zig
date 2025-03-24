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
pub const USBMultConf = enum {
    PLLQ,
    PLLSAIP,
};
pub const SDIOMultConf = enum {
    SysCLKOutput,
    USBMult,
};
pub const SAIAMultConf = enum {
    I2S_CKIN,
    PLLI2SQDiv,
    PLLSAIQDiv,
};
pub const SAIBMultConf = enum {
    I2S_CKIN,
    PLLI2SQDiv,
    PLLSAIQDiv,
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
pub const DSIMultConf = enum {
    PLLRoutput,
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
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIRC,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(16),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    USBMult: USBMultConf = .PLLQ,
    SDIOMult: SDIOMultConf = .USBMult,
    SAIAMult: SAIAMultConf = .PLLSAIQDiv,
    SAIBMult: SAIBMultConf = .PLLSAIQDiv,
    I2SMult: I2SMultConf = .PLLI2SR,
    MCO1Mult: MCO1MultConf = .HSIRC,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysClkSource,
    MCO2Div: MCO2DivConf = .DIV1,
    DSIMult: DSIMultConf = .DSIPHYPrescaler,
    DSITXPrescaler: DSITXPrescalerConf = @enumFromInt(4),
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = @enumFromInt(4),
    PLLR: PLLRConf = @enumFromInt(2),
    PLLSAIN: PLLSAINConf = @enumFromInt(192),
    PLLSAIP: PLLSAIPConf = .DIV2,
    PLLSAIQ: PLLSAIQConf = @enumFromInt(4),
    PLLSAIQDiv: PLLSAIQDivConf = @enumFromInt(1),
    PLLSAIR: PLLSAIRConf = @enumFromInt(2),
    PLLSAIRDiv: PLLSAIRDivConf = .DIV2,
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SQ: PLLI2SQConf = @enumFromInt(4),
    PLLI2SQDiv: PLLI2SQDivConf = @enumFromInt(1),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
    PLLDSIIDF: PLLDSIIDFConf = .DIV1,
    PLLDSINDIV: PLLDSINDIVConf = @enumFromInt(20),
    PLLDSIODF: PLLDSIODFConf = .DIV1,
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
                } else if (from_input > 180000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 180000000\n", .{from_input}));
                }
                return from_input;
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
        const USBMultType = struct {
            value: USBMultConf,
            pub fn get(comptime self: USBMultType) comptime_int {
                return switch (self.value) {
                    .PLLQ => PLLQ.get(),
                    .PLLSAIP => PLLSAIP.get(),
                };
            }
        };
        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                return USBMult.get();
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
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDIOMult on SDIOoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAIAMultType = struct {
            value: SAIAMultConf,
            pub fn get(comptime self: SAIAMultType) comptime_int {
                return switch (self.value) {
                    .I2S_CKIN => I2S_CKIN.get(),
                    .PLLI2SQDiv => PLLI2SQDiv.get(),
                    .PLLSAIQDiv => PLLSAIQDiv.get(),
                };
            }
        };
        const SAIAoutputType = struct {
            pub fn get(_: *const SAIAoutputType) comptime_int {
                return SAIAMult.get();
            }
        };
        const SAIBMultType = struct {
            value: SAIBMultConf,
            pub fn get(comptime self: SAIBMultType) comptime_int {
                return switch (self.value) {
                    .I2S_CKIN => I2S_CKIN.get(),
                    .PLLI2SQDiv => PLLI2SQDiv.get(),
                    .PLLSAIQDiv => PLLSAIQDiv.get(),
                };
            }
        };
        const SAIBoutputType = struct {
            pub fn get(_: *const SAIBoutputType) comptime_int {
                return SAIBMult.get();
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
                const from_input = I2SMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from I2SMult on I2Soutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 192000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from I2SMult on I2Soutput | recive {d} max 192000000\n", .{from_input}));
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
                    .PLLRoutput => PLLRoutput.get(),
                    .DSIPHYPrescaler => DSIPHYPrescaler.get(),
                };
            }
        };
        const DSIoutputType = struct {
            pub fn get(_: *const DSIoutputType) comptime_int {
                const from_input = DSIMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DSIMult on DSIoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 62500000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DSIMult on DSIoutput | recive {d} max 62500000\n", .{from_input}));
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

        const EthernetPtpOutputType = struct {
            pub fn get(_: *const EthernetPtpOutputType) comptime_int {
                return AHBPrescaler.get();
            }
        };
        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = AHBPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBPrescaler on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 180000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 180000000\n", .{from_input}));
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
                } else if (from_input > 45000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 45000000\n", .{from_input}));
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
                } else if (from_input > 90000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 90000000\n", .{from_input}));
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
        const @"LCD-TFTCLKOutputType" = struct {
            pub fn get(_: *const @"LCD-TFTCLKOutputType") comptime_int {
                return PLLSAIRDiv.get();
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
                if (from_input < 500000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLDSINDIV on VCOoutput | recive {d} min 500000000\n", .{from_input}));
                } else if (from_input > 1000000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLDSINDIV on VCOoutput | recive {d} max 1000000000\n", .{from_input}));
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
                if (from_input < 80000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PLLDSIODF on PLLDSIoutput | recive {d} min 80000000\n", .{from_input}));
                } else if (from_input > 500000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PLLDSIODF on PLLDSIoutput | recive {d} max 500000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HSIRC = HSIRCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{};
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
        const USBMult = USBMultType{ .value = conf.USBMult };
        pub const USBoutput = USBoutputType{};
        const SDIOMult = SDIOMultType{ .value = conf.SDIOMult };
        pub const SDIOoutput = SDIOoutputType{};
        const SAIAMult = SAIAMultType{ .value = conf.SAIAMult };
        pub const SAIAoutput = SAIAoutputType{};
        const SAIBMult = SAIBMultType{ .value = conf.SAIBMult };
        pub const SAIBoutput = SAIBoutputType{};
        const I2SMult = I2SMultType{ .value = conf.I2SMult };
        pub const I2Soutput = I2SoutputType{};
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
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const EthernetPtpOutput = EthernetPtpOutputType{};
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
        pub const @"LCD-TFTCLKOutput" = @"LCD-TFTCLKOutputType"{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLP = PLLPType{ .value = conf.PLLP };
        const PLLQ = PLLQType{ .value = conf.PLLQ };
        const PLLR = PLLRType{ .value = conf.PLLR };
        pub const PLLRoutput = PLLRoutputType{};
        const PLLSAIN = PLLSAINType{ .value = conf.PLLSAIN };
        const PLLSAIP = PLLSAIPType{ .value = conf.PLLSAIP };
        const PLLSAIQ = PLLSAIQType{ .value = conf.PLLSAIQ };
        const PLLSAIQDiv = PLLSAIQDivType{ .value = conf.PLLSAIQDiv };
        const PLLSAIR = PLLSAIRType{ .value = conf.PLLSAIR };
        const PLLSAIRDiv = PLLSAIRDivType{ .value = conf.PLLSAIRDiv };
        const PLLI2SN = PLLI2SNType{ .value = conf.PLLI2SN };
        const PLLI2SQ = PLLI2SQType{ .value = conf.PLLI2SQ };
        const PLLI2SQDiv = PLLI2SQDivType{ .value = conf.PLLI2SQDiv };
        const PLLI2SR = PLLI2SRType{ .value = conf.PLLI2SR };
        const PLLDSIIDF = PLLDSIIDFType{ .value = conf.PLLDSIIDF };
        const PLLDSIMultiplicator = PLLDSIMultiplicatorType{};
        const PLLDSINDIV = PLLDSINDIVType{ .value = conf.PLLDSINDIV };
        pub const VCOoutput = VCOoutputType{};
        const PLLDSIDevisor = PLLDSIDevisorType{};
        const PLLDSIODF = PLLDSIODFType{ .value = conf.PLLDSIODF };
        pub const PLLDSIoutput = PLLDSIoutputType{};

        pub fn validate() void {
            _ = USBoutput.get();
            _ = SDIOoutput.get();
            _ = SAIAoutput.get();
            _ = SAIBoutput.get();
            _ = I2Soutput.get();
            _ = DSIoutput.get();
            _ = DSITXCLKEsc.get();
            _ = EthernetPtpOutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = TimPrescOut2.get();
            _ = @"LCD-TFTCLKOutput".get();
        }
    };

    return ClockStruct;
}
