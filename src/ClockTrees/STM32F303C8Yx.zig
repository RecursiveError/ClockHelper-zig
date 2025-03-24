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
pub const HSEPLLsourceDevisorConf = enum {
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
pub const PRESCALERUSBConf = enum {
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
    HSIRC,
    LSEOSC,
    HSEOSC,
    MCOMultDivisor,
    LSIRC,
    SysCLKOutput,
};
pub const MCODivisorConf = enum {
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
pub const ADC12PRESConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    DIV10,
    DIV12,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    DIV256,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
            .DIV10 => 10,
            .DIV12 => 12,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
        };
    }
};
pub const ADC34PRESConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    DIV10,
    DIV12,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    DIV256,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
            .DIV10 => 10,
            .DIV12 => 12,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
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
pub const TIMMUX1Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const TIMMUX8Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const HRTIMMuxConf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const I2C1MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2C2MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2C3MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2SSrcConf = enum {
    SysCLKOutput,
};
pub const USART1MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const UART4MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const UART5MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const PLLSourceConf = enum {
    HSIRCDiv,
    HSEPLLsourceDevisor,
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
    HSEPLLsourceDevisor: HSEPLLsourceDevisorConf = .DIV1,
    PRESCALERUSB: PRESCALERUSBConf = .DIV1,
    SysClkSource: SysClkSourceConf = .HSIRC,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMultDivisor: MCOMultDivisorConf = .DIV1,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODivisor: MCODivisorConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    ADC12PRES: ADC12PRESConf = .DIV1,
    ADC34PRES: ADC34PRESConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    TIMMUX1: TIMMUX1Conf = .TimPrescOut2,
    TIMMUX8: TIMMUX8Conf = .TimPrescOut2,
    HRTIMMux: HRTIMMuxConf = .TimPrescOut2,
    I2C1Mult: I2C1MultConf = .HSIRC,
    I2C2Mult: I2C2MultConf = .HSIRC,
    I2C3Mult: I2C3MultConf = .HSIRC,
    I2SSrc: I2SSrcConf = .SysCLKOutput,
    USART1Mult: USART1MultConf = .SysCLKOutput,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    PLLSource: PLLSourceConf = .HSIRCDiv,
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
        const HSIRCDivType = struct {
            pub fn get(_: *const HSIRCDivType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSIRCDiv\n");
                }
                const from_input = this.HSIRC.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const FLITFCLKoutputType = struct {
            pub fn get(_: *const FLITFCLKoutputType) comptime_int {
                return HSIRC.get();
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
        const HSEPLLsourceDevisorType = struct {
            value: HSEPLLsourceDevisorConf,

            pub fn get(self: *const HSEPLLsourceDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSEPLLsourceDevisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PRESCALERUSBType = struct {
            value: PRESCALERUSBConf,

            pub fn get(self: *const PRESCALERUSBType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for PRESCALERUSB\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLMUL.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                const from_input = PRESCALERUSB.get();
                if (from_input < 47880000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from PRESCALERUSB on USBoutput | recive {d} min 47880000\n", .{from_input}));
                } else if (from_input > 48120000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from PRESCALERUSB on USBoutput | recive {d} max 48120000\n", .{from_input}));
                }
                return from_input;
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
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MCOMultDivisor => MCOMultDivisor.get(),
                    .LSIRC => LSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const MCODivisorType = struct {
            value: MCODivisorConf,

            pub fn get(self: *const MCODivisorType) comptime_int {
                if (!@hasDecl(this, "MCOMult")) {
                    @compileError("No Input MCOMult for MCODivisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCOMult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCOoutputType = struct {
            pub fn get(_: *const MCOoutputType) comptime_int {
                return MCODivisor.get();
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
        const ADC12PRESType = struct {
            value: ADC12PRESConf,

            pub fn get(self: *const ADC12PRESType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for ADC12PRES\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLMUL.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const ADC12outputType = struct {
            pub fn get(_: *const ADC12outputType) comptime_int {
                return ADC12PRES.get();
            }
        };
        const ADC34PRESType = struct {
            value: ADC34PRESConf,

            pub fn get(self: *const ADC34PRESType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for ADC34PRES\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLMUL.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const ADC34outputType = struct {
            pub fn get(_: *const ADC34outputType) comptime_int {
                return ADC34PRES.get();
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
        const TIMMULType = struct {
            pub fn get(_: *const TIMMULType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for TIMMUL\n");
                }
                const from_input = this.PLLMUL.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const TIMMUX1Type = struct {
            value: TIMMUX1Conf,
            pub fn get(comptime self: TIMMUX1Type) comptime_int {
                return switch (self.value) {
                    .TIMMUL => TIMMUL.get(),
                    .TimPrescOut2 => TimPrescOut2.get(),
                };
            }
        };
        const TIM1outType = struct {
            pub fn get(_: *const TIM1outType) comptime_int {
                return TIMMUX1.get();
            }
        };
        const TIMMUX8Type = struct {
            value: TIMMUX8Conf,
            pub fn get(comptime self: TIMMUX8Type) comptime_int {
                return switch (self.value) {
                    .TIMMUL => TIMMUL.get(),
                    .TimPrescOut2 => TimPrescOut2.get(),
                };
            }
        };
        const TIM8outType = struct {
            pub fn get(_: *const TIM8outType) comptime_int {
                return TIMMUX8.get();
            }
        };
        const HRTIMMuxType = struct {
            value: HRTIMMuxConf,
            pub fn get(comptime self: HRTIMMuxType) comptime_int {
                return switch (self.value) {
                    .TIMMUL => TIMMUL.get(),
                    .TimPrescOut2 => TimPrescOut2.get(),
                };
            }
        };
        const HRTIMoutType = struct {
            pub fn get(_: *const HRTIMoutType) comptime_int {
                return HRTIMMux.get();
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
        const I2C2MultType = struct {
            value: I2C2MultConf,
            pub fn get(comptime self: I2C2MultType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const I2C2OutputType = struct {
            pub fn get(_: *const I2C2OutputType) comptime_int {
                return I2C2Mult.get();
            }
        };
        const I2C3MultType = struct {
            value: I2C3MultConf,
            pub fn get(comptime self: I2C3MultType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const I2C3OutputType = struct {
            pub fn get(_: *const I2C3OutputType) comptime_int {
                return I2C3Mult.get();
            }
        };
        const I2SSrcType = struct {
            value: I2SSrcConf,
            pub fn get(comptime self: I2SSrcType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                };
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
        const UART4MultType = struct {
            value: UART4MultConf,
            pub fn get(comptime self: UART4MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .APB1Prescaler => APB1Prescaler.get(),
                };
            }
        };
        const UART4OutputType = struct {
            pub fn get(_: *const UART4OutputType) comptime_int {
                return UART4Mult.get();
            }
        };
        const UART5MultType = struct {
            value: UART5MultConf,
            pub fn get(comptime self: UART5MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .APB1Prescaler => APB1Prescaler.get(),
                };
            }
        };
        const UART5OutputType = struct {
            pub fn get(_: *const UART5OutputType) comptime_int {
                return UART5Mult.get();
            }
        };
        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRCDiv => HSIRCDiv.get(),
                    .HSEPLLsourceDevisor => HSEPLLsourceDevisor.get(),
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
        const HSIRCDiv = HSIRCDivType{};
        pub const FLITFCLKoutput = FLITFCLKoutputType{};
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const HSEPLLsourceDevisor = HSEPLLsourceDevisorType{ .value = conf.HSEPLLsourceDevisor };
        const PRESCALERUSB = PRESCALERUSBType{ .value = conf.PRESCALERUSB };
        pub const USBoutput = USBoutputType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const MCOMultDivisor = MCOMultDivisorType{ .value = conf.MCOMultDivisor };
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODivisor = MCODivisorType{ .value = conf.MCODivisor };
        pub const MCOoutput = MCOoutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        const ADC12PRES = ADC12PRESType{ .value = conf.ADC12PRES };
        pub const ADC12output = ADC12outputType{};
        const ADC34PRES = ADC34PRESType{ .value = conf.ADC34PRES };
        pub const ADC34output = ADC34outputType{};
        const APB1Prescaler = APB1PrescalerType{ .value = conf.APB1Prescaler };
        pub const APB1Output = APB1OutputType{};
        const TimPrescalerAPB1 = TimPrescalerAPB1Type{};
        pub const TimPrescOut1 = TimPrescOut1Type{};
        const APB2Prescaler = APB2PrescalerType{ .value = conf.APB2Prescaler };
        pub const APB2Output = APB2OutputType{};
        const TimPrescalerAPB2 = TimPrescalerAPB2Type{};
        pub const TimPrescOut2 = TimPrescOut2Type{};
        const TIMMUL = TIMMULType{};
        const TIMMUX1 = TIMMUX1Type{ .value = conf.TIMMUX1 };
        pub const TIM1out = TIM1outType{};
        const TIMMUX8 = TIMMUX8Type{ .value = conf.TIMMUX8 };
        pub const TIM8out = TIM8outType{};
        const HRTIMMux = HRTIMMuxType{ .value = conf.HRTIMMux };
        pub const HRTIMout = HRTIMoutType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1Output = I2C1OutputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2Output = I2C2OutputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3Output = I2C3OutputType{};
        const I2SSrc = I2SSrcType{ .value = conf.I2SSrc };
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1Output = USART1OutputType{};
        const UART4Mult = UART4MultType{ .value = conf.UART4Mult };
        pub const UART4Output = UART4OutputType{};
        const UART5Mult = UART5MultType{ .value = conf.UART5Mult };
        pub const UART5Output = UART5OutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        pub const VCO2output = VCO2outputType{};
        const PLLMUL = PLLMULType{ .value = conf.PLLMUL };

        pub fn validate() void {
            _ = USBoutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = FCLKCortexOutput.get();
            _ = CortexSysOutput.get();
            _ = ADC12output.get();
            _ = ADC34output.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = TimPrescOut2.get();
            _ = TIM1out.get();
            _ = TIM8out.get();
            _ = HRTIMout.get();
            _ = I2C1Output.get();
            _ = I2C2Output.get();
            _ = I2C3Output.get();
            _ = USART1Output.get();
            _ = UART4Output.get();
            _ = UART5Output.get();
        }
    };

    return ClockStruct;
}
