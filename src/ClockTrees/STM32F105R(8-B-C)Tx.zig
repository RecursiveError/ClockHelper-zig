const std = @import("std");

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
pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 3000000) {
            @compileError("min value for HSEOSC is 3000000\n");
        } else if (val > 25000000) {
            @compileError("min value for HSEOSC is 25000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 25000000;
    }

    pub fn min() comptime_int {
        return 3000000;
    }
};
pub const Prediv2Conf = enum {
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
pub const PLL2MulConf = enum {
    const this = @This();
    MUL8,
    MUL9,
    MUL10,
    MUL11,
    MUL12,
    MUL13,
    MUL14,
    MUL16,
    MUL20,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .MUL8 => 8,
            .MUL9 => 9,
            .MUL10 => 10,
            .MUL11 => 11,
            .MUL12 => 12,
            .MUL13 => 13,
            .MUL14 => 14,
            .MUL16 => 16,
            .MUL20 => 20,
        };
    }
};
pub const PLL3MulConf = enum {
    const this = @This();
    MUL8,
    MUL9,
    MUL10,
    MUL11,
    MUL12,
    MUL13,
    MUL14,
    MUL16,
    MUL20,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .MUL8 => 8,
            .MUL9 => 9,
            .MUL10 => 10,
            .MUL11 => 11,
            .MUL12 => 12,
            .MUL13 => 13,
            .MUL14 => 14,
            .MUL16 => 16,
            .MUL20 => 20,
        };
    }
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLMUL,
};
pub const I2S2MultConf = enum {
    SysCLKOutput,
    PLL3VCOoutput,
};
pub const I2S3MultConf = enum {
    SysCLKOutput,
    PLL3VCOoutput,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const MCOPLL3DivConf = enum {
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
pub const MCOMultConf = enum {
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    MCOMultDivisor,
    PLL2CLKoutput,
    MCOPLL3Div,
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
pub const TimSysPrescConf = enum {
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
pub const ADCprescalerConf = enum {
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
pub const Prediv1SourceConf = enum {
    HSEOSC,
    PLL2CLKoutput,
};
pub const PreDiv1Conf = enum {
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
pub const PLLSourceConf = enum {
    HSIDivPLL,
    PreDiv1,
};
pub const PLLMULConf = enum {
    const this = @This();
    MUL4,
    MUL5,
    MUL6,
    @"MUL6.5",
    MUL7,
    MUL8,
    MUL9,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .MUL4 => 4,
            .MUL5 => 5,
            .MUL6 => 6,
            .@"MUL6.5" => 6.5,
            .MUL7 => 7,
            .MUL8 => 8,
            .MUL9 => 9,
        };
    }
};
pub const USBPrescalerConf = enum {
    const this = @This();
    DIV2,
    DIV3,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
        };
    }
};
pub const Config = struct {
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    Prediv2: Prediv2Conf = .DIV1,
    PLL2Mul: PLL2MulConf = .MUL8,
    PLL3Mul: PLL3MulConf = .MUL8,
    SysClkSource: SysClkSourceConf = .HSIRC,
    I2S2Mult: I2S2MultConf = .SysCLKOutput,
    I2S3Mult: I2S3MultConf = .SysCLKOutput,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOPLL3Div: MCOPLL3DivConf = .DIV1,
    MCOMult: MCOMultConf = .SysCLKOutput,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TimSysPresc: TimSysPrescConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    ADCprescaler: ADCprescalerConf = .DIV2,
    Prediv1Source: Prediv1SourceConf = .HSEOSC,
    PreDiv1: PreDiv1Conf = .DIV1,
    PLLSource: PLLSourceConf = .HSIDivPLL,
    PLLMUL: PLLMULConf = .MUL4,
    USBPrescaler: USBPrescalerConf = .DIV3,
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 8000000;
            }
        };
        const FLITFCLKoutputType = struct {
            pub fn get(_: *const FLITFCLKoutputType) comptime_int {
                return HSIRC.get();
            }
        };
        const HSIDivPLLType = struct {
            pub fn get(_: *const HSIDivPLLType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSIDivPLL\n");
                }
                const from_input = this.HSIRC.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const LSIRCType = struct {
            pub fn get(_: *const LSIRCType) comptime_int {
                return 40000;
            }
        };
        const LSEOSCType = struct {
            value: LSEOSCConf,
            pub fn get(comptime self: LSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const HSEOSCType = struct {
            value: HSEOSCConf,
            pub fn get(comptime self: HSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const Prediv2Type = struct {
            value: Prediv2Conf,

            pub fn get(self: *const Prediv2Type) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for Prediv2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const Prediv2outputType = struct {
            pub fn get(_: *const Prediv2outputType) comptime_int {
                return Prediv2.get();
            }
        };
        const PLL2MulType = struct {
            value: PLL2MulConf,

            pub fn get(self: *const PLL2MulType) comptime_int {
                if (!@hasDecl(this, "Prediv2output")) {
                    @compileError("No Input Prediv2output for PLL2Mul\n");
                }
                const from_input: comptime_float = @floatFromInt(this.Prediv2output.get());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * multi));
            }
        };

        const PLL2VCOMul2Type = struct {
            pub fn get(_: *const PLL2VCOMul2Type) comptime_int {
                if (!@hasDecl(this, "PLL2Mul")) {
                    @compileError("No Input PLL2Mul for PLL2VCOMul2\n");
                }
                const from_input = this.PLL2Mul.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const PLL2VCOoutputType = struct {
            pub fn get(_: *const PLL2VCOoutputType) comptime_int {
                return PLL2VCOMul2.get();
            }
        };
        const PLL2CLKoutputType = struct {
            pub fn get(_: *const PLL2CLKoutputType) comptime_int {
                return PLL2Mul.get();
            }
        };
        const PLL3MulType = struct {
            value: PLL3MulConf,

            pub fn get(self: *const PLL3MulType) comptime_int {
                if (!@hasDecl(this, "Prediv2output")) {
                    @compileError("No Input Prediv2output for PLL3Mul\n");
                }
                const from_input: comptime_float = @floatFromInt(this.Prediv2output.get());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * multi));
            }
        };

        const PLL3VCOMul2Type = struct {
            pub fn get(_: *const PLL3VCOMul2Type) comptime_int {
                if (!@hasDecl(this, "PLL3Mul")) {
                    @compileError("No Input PLL3Mul for PLL3VCOMul2\n");
                }
                const from_input = this.PLL3Mul.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const PLL3VCOoutputType = struct {
            pub fn get(_: *const PLL3VCOoutputType) comptime_int {
                return PLL3VCOMul2.get();
            }
        };
        const PLL3CLKoutputType = struct {
            pub fn get(_: *const PLL3CLKoutputType) comptime_int {
                return PLL3Mul.get();
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLMUL => PLLMUL.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 72000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 72000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const I2S2MultType = struct {
            value: I2S2MultConf,
            pub fn get(comptime self: I2S2MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLL3VCOoutput => PLL3VCOoutput.get(),
                };
            }
        };
        const I2S2OutputType = struct {
            pub fn get(_: *const I2S2OutputType) comptime_int {
                return I2S2Mult.get();
            }
        };
        const I2S3MultType = struct {
            value: I2S3MultConf,
            pub fn get(comptime self: I2S3MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLL3VCOoutput => PLL3VCOoutput.get(),
                };
            }
        };
        const I2S3OutputType = struct {
            pub fn get(_: *const I2S3OutputType) comptime_int {
                return I2S3Mult.get();
            }
        };
        const HSERTCDevisorType = struct {
            pub fn get(_: *const HSERTCDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSERTCDevisor\n");
                }
                const from_input = this.HSEOSC.get();
                const div = 128;
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
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const MCOPLL3DivType = struct {
            value: MCOPLL3DivConf,

            pub fn get(self: *const MCOPLL3DivType) comptime_int {
                if (!@hasDecl(this, "PLL3CLKoutput")) {
                    @compileError("No Input PLL3CLKoutput for MCOPLL3Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3CLKoutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCOMultDivisorType = struct {
            pub fn get(_: *const MCOMultDivisorType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for MCOMultDivisor\n");
                }
                const from_input = this.PLLMUL.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MCOMultDivisor => MCOMultDivisor.get(),
                    .PLL2CLKoutput => PLL2CLKoutput.get(),
                    .MCOPLL3Div => MCOPLL3Div.get(),
                };
            }
        };
        const MCOoutputType = struct {
            pub fn get(_: *const MCOoutputType) comptime_int {
                const from_input = MCOMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MCOMult on MCOoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MCOMult on MCOoutput | recive {d} max 50000000\n", .{from_input}));
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
                } else if (from_input > 72000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 72000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HCLKOutputType = struct {
            pub fn get(_: *const HCLKOutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const FCLKCortexOutputType = struct {
            pub fn get(_: *const FCLKCortexOutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const TimSysPrescType = struct {
            value: TimSysPrescConf,

            pub fn get(self: *const TimSysPrescType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for TimSysPresc\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const TimSysOutputType = struct {
            pub fn get(_: *const TimSysOutputType) comptime_int {
                return TimSysPresc.get();
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
                } else if (from_input > 36000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 36000000\n", .{from_input}));
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
                } else if (from_input > 72000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 72000000\n", .{from_input}));
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
        const ADCprescalerType = struct {
            value: ADCprescalerConf,

            pub fn get(self: *const ADCprescalerType) comptime_int {
                if (!@hasDecl(this, "APB2Prescaler")) {
                    @compileError("No Input APB2Prescaler for ADCprescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.APB2Prescaler.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                const from_input = ADCprescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADCprescaler on ADCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 14000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCprescaler on ADCoutput | recive {d} max 14000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const Prediv1SourceType = struct {
            value: Prediv1SourceConf,
            pub fn get(comptime self: Prediv1SourceType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .PLL2CLKoutput => PLL2CLKoutput.get(),
                };
            }
        };
        const PreDiv1Type = struct {
            value: PreDiv1Conf,

            pub fn get(self: *const PreDiv1Type) comptime_int {
                if (!@hasDecl(this, "Prediv1Source")) {
                    @compileError("No Input Prediv1Source for PreDiv1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.Prediv1Source.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .HSIDivPLL => HSIDivPLL.get(),
                    .PreDiv1 => PreDiv1.get(),
                };
            }
        };
        const VCO2outputType = struct {
            pub fn get(_: *const VCO2outputType) comptime_int {
                return PLLSource.get();
            }
        };
        const PLLMULType = struct {
            value: PLLMULConf,

            pub fn get(self: *const PLLMULType) comptime_int {
                if (!@hasDecl(this, "VCO2output")) {
                    @compileError("No Input VCO2output for PLLMUL\n");
                }
                const from_input: comptime_float = @floatFromInt(this.VCO2output.get());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * multi));
            }
        };

        const PLLVCOMul2Type = struct {
            pub fn get(_: *const PLLVCOMul2Type) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for PLLVCOMul2\n");
                }
                const from_input = this.PLLMUL.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const USBPrescalerType = struct {
            value: USBPrescalerConf,

            pub fn get(self: *const USBPrescalerType) comptime_int {
                if (!@hasDecl(this, "PLLVCOMul2")) {
                    @compileError("No Input PLLVCOMul2 for USBPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLVCOMul2.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                const from_input = USBPrescaler.get();
                if (from_input < 47880000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USBPrescaler on USBoutput | recive {d} min 47880000\n", .{from_input}));
                } else if (from_input > 48120000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USBPrescaler on USBoutput | recive {d} max 48120000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HSIRC = HSIRCType{};
        pub const FLITFCLKoutput = FLITFCLKoutputType{};
        const HSIDivPLL = HSIDivPLLType{};
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const Prediv2 = Prediv2Type{ .value = conf.Prediv2 };
        pub const Prediv2output = Prediv2outputType{};
        const PLL2Mul = PLL2MulType{ .value = conf.PLL2Mul };
        const PLL2VCOMul2 = PLL2VCOMul2Type{};
        pub const PLL2VCOoutput = PLL2VCOoutputType{};
        pub const PLL2CLKoutput = PLL2CLKoutputType{};
        const PLL3Mul = PLL3MulType{ .value = conf.PLL3Mul };
        const PLL3VCOMul2 = PLL3VCOMul2Type{};
        pub const PLL3VCOoutput = PLL3VCOoutputType{};
        pub const PLL3CLKoutput = PLL3CLKoutputType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const I2S2Mult = I2S2MultType{ .value = conf.I2S2Mult };
        pub const I2S2Output = I2S2OutputType{};
        const I2S3Mult = I2S3MultType{ .value = conf.I2S3Mult };
        pub const I2S3Output = I2S3OutputType{};
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const MCOPLL3Div = MCOPLL3DivType{ .value = conf.MCOPLL3Div };
        const MCOMultDivisor = MCOMultDivisorType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        pub const MCOoutput = MCOoutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const TimSysPresc = TimSysPrescType{ .value = conf.TimSysPresc };
        pub const TimSysOutput = TimSysOutputType{};
        const APB1Prescaler = APB1PrescalerType{ .value = conf.APB1Prescaler };
        pub const APB1Output = APB1OutputType{};
        const TimPrescalerAPB1 = TimPrescalerAPB1Type{};
        pub const TimPrescOut1 = TimPrescOut1Type{};
        const APB2Prescaler = APB2PrescalerType{ .value = conf.APB2Prescaler };
        pub const APB2Output = APB2OutputType{};
        const TimPrescalerAPB2 = TimPrescalerAPB2Type{};
        pub const TimPrescOut2 = TimPrescOut2Type{};
        const ADCprescaler = ADCprescalerType{ .value = conf.ADCprescaler };
        pub const ADCoutput = ADCoutputType{};
        const Prediv1Source = Prediv1SourceType{ .value = conf.Prediv1Source };
        const PreDiv1 = PreDiv1Type{ .value = conf.PreDiv1 };
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        pub const VCO2output = VCO2outputType{};
        const PLLMUL = PLLMULType{ .value = conf.PLLMUL };
        const PLLVCOMul2 = PLLVCOMul2Type{};
        const USBPrescaler = USBPrescalerType{ .value = conf.USBPrescaler };
        pub const USBoutput = USBoutputType{};

        pub fn validate() void {
            _ = I2S2Output.get();
            _ = I2S3Output.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = FCLKCortexOutput.get();
            _ = TimSysOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = TimPrescOut2.get();
            _ = ADCoutput.get();
            _ = USBoutput.get();
        }
    };

    return ClockStruct;
}
