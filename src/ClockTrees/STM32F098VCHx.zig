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
pub const CECMultConf = enum {
    HSICECDiv,
    LSEOSC,
};
pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4000000) {
            @compileError("min value for HSEOSC is 4000000\n");
        } else if (val > 32000000) {
            @compileError("min value for HSEOSC is 32000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 32000000;
    }

    pub fn min() comptime_int {
        return 4000000;
    }
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HSIRC48,
    HSEOSC,
    PLLMUL,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const MCOMultDivisorConf = enum {
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
    MCOMultDivisor,
    HSIRC,
    HSIRC48,
    HSIRC14,
    HSEOSC,
    LSIRC,
    LSEOSC,
    SysCLKOutput,
};
pub const MCODividerConf = enum {
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
pub const I2C1MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const USART1MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const USART2MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const USART3MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const PLLSourceConf = enum {
    HSIRC,
    HSIRC48,
    HSEOSC,
};
pub const PLLDivConf = enum {
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
    CECMult: CECMultConf = .HSICECDiv,
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    SysClkSource: SysClkSourceConf = .HSIRC,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMultDivisor: MCOMultDivisorConf = .DIV1,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODivider: MCODividerConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TimSysPresc: TimSysPrescConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    I2C1Mult: I2C1MultConf = .HSIRC,
    USART1Mult: USART1MultConf = .APB1Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLDiv: PLLDivConf = .DIV1,
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
        const HSICECDivType = struct {
            pub fn get(_: *const HSICECDivType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSICECDiv\n");
                }
                const from_input = this.HSIRC.get();
                const div = 244;
                return (from_input / div);
            }
        };

        const HSIRC48Type = struct {
            pub fn get(_: *const HSIRC48Type) comptime_int {
                return 48000000;
            }
        };
        const HSIRC14Type = struct {
            pub fn get(_: *const HSIRC14Type) comptime_int {
                return 14000000;
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                return HSIRC14.get();
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
        const CECMultType = struct {
            value: CECMultConf,
            pub fn get(comptime self: CECMultType) comptime_int {
                return switch (self.value) {
                    .HSICECDiv => HSICECDiv.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const CECOutputType = struct {
            pub fn get(_: *const CECOutputType) comptime_int {
                return CECMult.get();
            }
        };
        const HSEOSCType = struct {
            value: HSEOSCConf,
            pub fn get(comptime self: HSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HSIRC48 => HSIRC48.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLMUL => PLLMUL.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                return SysClkSource.get();
            }
        };
        const I2SOutputType = struct {
            pub fn get(_: *const I2SOutputType) comptime_int {
                return SysCLKOutput.get();
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
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const MCOMultDivisorType = struct {
            value: MCOMultDivisorConf,

            pub fn get(self: *const MCOMultDivisorType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for MCOMultDivisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLMUL.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .MCOMultDivisor => MCOMultDivisor.get(),
                    .HSIRC => HSIRC.get(),
                    .HSIRC48 => HSIRC48.get(),
                    .HSIRC14 => HSIRC14.get(),
                    .HSEOSC => HSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const MCODividerType = struct {
            value: MCODividerConf,

            pub fn get(self: *const MCODividerType) comptime_int {
                if (!@hasDecl(this, "MCOMult")) {
                    @compileError("No Input MCOMult for MCODivider\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCOMult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCOoutputType = struct {
            pub fn get(_: *const MCOoutputType) comptime_int {
                return MCODivider.get();
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
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 48000000\n", .{from_input}));
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
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 48000000\n", .{from_input}));
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
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const I2C1OutputType = struct {
            pub fn get(_: *const I2C1OutputType) comptime_int {
                return I2C1Mult.get();
            }
        };
        const USART1MultType = struct {
            value: USART1MultConf,
            pub fn get(comptime self: USART1MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .APB1Prescaler => APB1Prescaler.get(),
                };
            }
        };
        const USART1OutputType = struct {
            pub fn get(_: *const USART1OutputType) comptime_int {
                return USART1Mult.get();
            }
        };
        const USART2MultType = struct {
            value: USART2MultConf,
            pub fn get(comptime self: USART2MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .APB1Prescaler => APB1Prescaler.get(),
                };
            }
        };
        const USART2OutputType = struct {
            pub fn get(_: *const USART2OutputType) comptime_int {
                return USART2Mult.get();
            }
        };
        const USART3MultType = struct {
            value: USART3MultConf,
            pub fn get(comptime self: USART3MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .APB1Prescaler => APB1Prescaler.get(),
                };
            }
        };
        const USART3OutputType = struct {
            pub fn get(_: *const USART3OutputType) comptime_int {
                return USART3Mult.get();
            }
        };
        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HSIRC48 => HSIRC48.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const PLLDivType = struct {
            value: PLLDivConf,

            pub fn get(self: *const PLLDivType) comptime_int {
                if (!@hasDecl(this, "PLLSource")) {
                    @compileError("No Input PLLSource for PLLDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSource.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const VCO2outputType = struct {
            pub fn get(_: *const VCO2outputType) comptime_int {
                return PLLDiv.get();
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
        const HSICECDiv = HSICECDivType{};
        const HSIRC48 = HSIRC48Type{};
        const HSIRC14 = HSIRC14Type{};
        pub const ADCoutput = ADCoutputType{};
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const CECMult = CECMultType{ .value = conf.CECMult };
        pub const CECOutput = CECOutputType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        pub const I2SOutput = I2SOutputType{};
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const MCOMultDivisor = MCOMultDivisorType{ .value = conf.MCOMultDivisor };
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODivider = MCODividerType{ .value = conf.MCODivider };
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
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1Output = I2C1OutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1Output = USART1OutputType{};
        const USART2Mult = USART2MultType{ .value = conf.USART2Mult };
        pub const USART2Output = USART2OutputType{};
        const USART3Mult = USART3MultType{ .value = conf.USART3Mult };
        pub const USART3Output = USART3OutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLLDiv = PLLDivType{ .value = conf.PLLDiv };
        pub const VCO2output = VCO2outputType{};
        const PLLMUL = PLLMULType{ .value = conf.PLLMUL };

        pub fn validate() void {
            _ = I2SOutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = FCLKCortexOutput.get();
            _ = TimSysOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = I2C1Output.get();
            _ = USART1Output.get();
            _ = USART2Output.get();
            _ = USART3Output.get();
        }
    };

    return ClockStruct;
}
