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
        if (val < 4000000) {
            @compileError("min value for HSEOSC is 4000000\n");
        } else if (val > 16000000) {
            @compileError("min value for HSEOSC is 16000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16000000;
    }

    pub fn min() comptime_int {
        return 4000000;
    }
};
pub const HSEDivPLLConf = enum {
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
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLMUL,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const MCOMultConf = enum {
    MCOMultDivisor,
    HSIRC,
    HSEOSC,
    SysCLKOutput,
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
pub const USBPrescalerConf = enum {
    const this = @This();
    DIV1,
    @"DIV1.5",
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .@"DIV1.5" => 1.5,
        };
    }
};
pub const PLLSourceConf = enum {
    HSIDivPLL,
    HSEDivPLL,
};
pub const PLLMULConf = enum {
    const this = @This();
    MUL2,
    MUL3,
    MUL4,
    MUL5,
    MUL6,
    MUL7,
    MUL8,
    MUL9,
    MUL10,
    MUL11,
    MUL12,
    MUL13,
    MUL14,
    MUL15,
    MUL16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .MUL2 => 2,
            .MUL3 => 3,
            .MUL4 => 4,
            .MUL5 => 5,
            .MUL6 => 6,
            .MUL7 => 7,
            .MUL8 => 8,
            .MUL9 => 9,
            .MUL10 => 10,
            .MUL11 => 11,
            .MUL12 => 12,
            .MUL13 => 13,
            .MUL14 => 14,
            .MUL15 => 15,
            .MUL16 => 16,
        };
    }
};
pub const Config = struct {
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    HSEDivPLL: HSEDivPLLConf = .DIV1,
    SysClkSource: SysClkSourceConf = .HSIRC,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TimSysPresc: TimSysPrescConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    ADCprescaler: ADCprescalerConf = .DIV2,
    USBPrescaler: USBPrescalerConf = .DIV1,
    PLLSource: PLLSourceConf = .HSIDivPLL,
    PLLMUL: PLLMULConf = .MUL2,
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
        const HSEDivPLLType = struct {
            value: HSEDivPLLConf,

            pub fn get(self: *const HSEDivPLLType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSEDivPLL\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
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
        const I2S2ClkOutputType = struct {
            pub fn get(_: *const I2S2ClkOutputType) comptime_int {
                return SysCLKOutput.get();
            }
        };
        const I2S3ClkOutputType = struct {
            pub fn get(_: *const I2S3ClkOutputType) comptime_int {
                return SysCLKOutput.get();
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
                    .MCOMultDivisor => MCOMultDivisor.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
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
        const HCLKDiv2Type = struct {
            pub fn get(_: *const HCLKDiv2Type) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for HCLKDiv2\n");
                }
                const from_input = this.AHBOutput.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const SDIOHCLKDiv2Type = struct {
            pub fn get(_: *const SDIOHCLKDiv2Type) comptime_int {
                return HCLKDiv2.get();
            }
        };
        const HCLKOutputType = struct {
            pub fn get(_: *const HCLKOutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const FSMClkOutputType = struct {
            pub fn get(_: *const FSMClkOutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const SDIOClkOutputType = struct {
            pub fn get(_: *const SDIOClkOutputType) comptime_int {
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
        const USBPrescalerType = struct {
            value: USBPrescalerConf,

            pub fn get(self: *const USBPrescalerType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for USBPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLMUL.get());
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
        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .HSIDivPLL => HSIDivPLL.get(),
                    .HSEDivPLL => HSEDivPLL.get(),
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

        const HSIRC = HSIRCType{};
        pub const FLITFCLKoutput = FLITFCLKoutputType{};
        const HSIDivPLL = HSIDivPLLType{};
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const HSEDivPLL = HSEDivPLLType{ .value = conf.HSEDivPLL };
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        pub const I2S2ClkOutput = I2S2ClkOutputType{};
        pub const I2S3ClkOutput = I2S3ClkOutputType{};
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const MCOMultDivisor = MCOMultDivisorType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        pub const MCOoutput = MCOoutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const AHBOutput = AHBOutputType{};
        const HCLKDiv2 = HCLKDiv2Type{};
        pub const SDIOHCLKDiv2 = SDIOHCLKDiv2Type{};
        pub const HCLKOutput = HCLKOutputType{};
        pub const FSMClkOutput = FSMClkOutputType{};
        pub const SDIOClkOutput = SDIOClkOutputType{};
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
        const USBPrescaler = USBPrescalerType{ .value = conf.USBPrescaler };
        pub const USBoutput = USBoutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        pub const VCO2output = VCO2outputType{};
        const PLLMUL = PLLMULType{ .value = conf.PLLMUL };

        pub fn validate() void {
            _ = I2S2ClkOutput.get();
            _ = I2S3ClkOutput.get();
            _ = AHBOutput.get();
            _ = SDIOHCLKDiv2.get();
            _ = HCLKOutput.get();
            _ = FSMClkOutput.get();
            _ = SDIOClkOutput.get();
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
