const std = @import("std");

pub const MSIRCConf = enum {
    const this = @This();
    @"CLOCK_65.536",
    @"CLOCK_131.072",
    @"CLOCK_262.144",
    @"CLOCK_524.288",
    CLOCK_1048,
    CLOCK_2097,
    CLOCK_4194,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .@"CLOCK_65.536" => 65.536,
            .@"CLOCK_131.072" => 131.072,
            .@"CLOCK_262.144" => 262.144,
            .@"CLOCK_524.288" => 524.288,
            .CLOCK_1048 => 1048,
            .CLOCK_2097 => 2097,
            .CLOCK_4194 => 4194,
        };
    }
};
pub const HSIRCDivConf = enum {
    const this = @This();
    DIV1,
    DIV4,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV4 => 4,
        };
    }
};
pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1000000) {
            @compileError("min value for HSEOSC is 1000000\n");
        } else if (val > 25000000) {
            @compileError("min value for HSEOSC is 25000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 25000000;
    }

    pub fn min() comptime_int {
        return 1000000;
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
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const HSERTCDevisorConf = enum {
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
pub const SysClkSourceConf = enum {
    MSIRC,
    HSIRCDiv,
    HSEOSC,
    PLLDIV,
};
pub const PLLSourceConf = enum {
    HSEOSC,
    HSIRCDiv,
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
pub const TIMPrescalerConf = enum {
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
pub const LPTIMMultConf = enum {
    LSIRC,
    HSIRCDiv,
    LSEOSC,
    APB1Prescaler,
};
pub const LPUARTMultConf = enum {
    APB1Prescaler,
    LSEOSC,
    HSIRCDiv,
    SysCLKOutput,
};
pub const USART2MultConf = enum {
    SysCLKOutput,
    HSIRCDiv,
    LSEOSC,
    APB1Prescaler,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRCDiv,
    LSEOSC,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    HSIRCDiv,
    SysCLKOutput,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRCDiv,
    PLLDIV,
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
pub const HSI48MULConf = enum {
    DIV2USB,
    HSI48RC,
};
pub const PLLMULConf = enum {
    const this = @This();
    MUL3,
    MUL4,
    MUL6,
    MUL8,
    MUL12,
    MUL16,
    MUL24,
    MUL32,
    MUL48,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .MUL3 => 3,
            .MUL4 => 4,
            .MUL6 => 6,
            .MUL8 => 8,
            .MUL12 => 12,
            .MUL16 => 16,
            .MUL24 => 24,
            .MUL32 => 32,
            .MUL48 => 48,
        };
    }
};
pub const PLLDIVConf = enum {
    const this = @This();
    DIV2,
    DIV3,
    DIV4,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
        };
    }
};
pub const Config = struct {
    MSIRC: MSIRCConf = .CLOCK_2097,
    HSIRCDiv: HSIRCDivConf = .DIV1,
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    SysClkSource: SysClkSourceConf = .MSIRC,
    PLLSource: PLLSourceConf = .HSIRCDiv,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TIMPrescaler: TIMPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    LPTIMMult: LPTIMMultConf = .APB1Prescaler,
    LPUARTMult: LPUARTMultConf = .APB1Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    HSI48MUL: HSI48MULConf = .DIV2USB,
    PLLMUL: PLLMULConf = .MUL3,
    PLLDIV: PLLDIVConf = .DIV2,
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 16000000;
            }
        };
        const MSIRCType = struct {
            value: MSIRCConf,
            pub fn get(comptime self: MSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const HSI48RCType = struct {
            pub fn get(_: *const HSI48RCType) comptime_int {
                return 48000000;
            }
        };
        const HSIRCDivType = struct {
            value: HSIRCDivConf,

            pub fn get(self: *const HSIRCDivType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSIRCDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
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
                return 37000;
            }
        };
        const LSEOSCType = struct {
            value: LSEOSCConf,
            pub fn get(comptime self: LSEOSCType) comptime_int {
                return self.value.get();
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

        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLDIV => PLLDIV.get(),
                };
            }
        };
        const PLLSourceType = struct {
            value: PLLSourceConf,
            pub fn get(comptime self: PLLSourceType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
                };
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

        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 32000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 32000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = AHBPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBPrescaler on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 32000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 32000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HCLKOutputType = struct {
            pub fn get(_: *const HCLKOutputType) comptime_int {
                return AHBOutput.get();
            }
        };
        const TIMPrescalerType = struct {
            value: TIMPrescalerConf,

            pub fn get(self: *const TIMPrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for TIMPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const TIMOutputType = struct {
            pub fn get(_: *const TIMOutputType) comptime_int {
                return TIMPrescaler.get();
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
                } else if (from_input > 32000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 32000000\n", .{from_input}));
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

        const TimPrescOutType = struct {
            pub fn get(_: *const TimPrescOutType) comptime_int {
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
                } else if (from_input > 32000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 32000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PeriphPrescalerType = struct {
            pub fn get(_: *const PeriphPrescalerType) comptime_int {
                if (!@hasDecl(this, "APB2Prescaler")) {
                    @compileError("No Input APB2Prescaler for PeriphPrescaler\n");
                }
                const from_input = this.APB2Prescaler.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const PeriphPrescOutputType = struct {
            pub fn get(_: *const PeriphPrescOutputType) comptime_int {
                return PeriphPrescaler.get();
            }
        };
        const LPTIMMultType = struct {
            value: LPTIMMultConf,
            pub fn get(comptime self: LPTIMMultType) comptime_int {
                return switch (self.value) {
                    .LSIRC => LSIRC.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
                    .LSEOSC => LSEOSC.get(),
                    .APB1Prescaler => APB1Prescaler.get(),
                };
            }
        };
        const LPTIMOutputType = struct {
            pub fn get(_: *const LPTIMOutputType) comptime_int {
                return LPTIMMult.get();
            }
        };
        const LPUARTMultType = struct {
            value: LPUARTMultConf,
            pub fn get(comptime self: LPUARTMultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .LSEOSC => LSEOSC.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const LPUARTOutputType = struct {
            pub fn get(_: *const LPUARTOutputType) comptime_int {
                return LPUARTMult.get();
            }
        };
        const USART2MultType = struct {
            value: USART2MultConf,
            pub fn get(comptime self: USART2MultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
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
        const USART1MultType = struct {
            value: USART1MultConf,
            pub fn get(comptime self: USART1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Prescaler => APB2Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const USART1OutputType = struct {
            pub fn get(_: *const USART1OutputType) comptime_int {
                return USART1Mult.get();
            }
        };
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const I2C1OutputType = struct {
            pub fn get(_: *const I2C1OutputType) comptime_int {
                return I2C1Mult.get();
            }
        };
        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRCDiv => HSIRCDiv.get(),
                    .PLLDIV => PLLDIV.get(),
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
        const HSI48MULType = struct {
            value: HSI48MULConf,
            pub fn get(comptime self: HSI48MULType) comptime_int {
                return switch (self.value) {
                    .DIV2USB => DIV2USB.get(),
                    .HSI48RC => HSI48RC.get(),
                };
            }
        };
        const @"48USBOutputType" = struct {
            pub fn get(_: *const @"48USBOutputType") comptime_int {
                const from_input = HSI48MUL.get();
                if (from_input < 47880000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from HSI48MUL on 48USBOutput | recive {d} min 47880000\n", .{from_input}));
                } else if (from_input > 48120000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from HSI48MUL on 48USBOutput | recive {d} max 48120000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const @"48RNGOutputType" = struct {
            pub fn get(_: *const @"48RNGOutputType") comptime_int {
                const from_input = HSI48MUL.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from HSI48MUL on 48RNGOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from HSI48MUL on 48RNGOutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ADCOutputType = struct {
            pub fn get(_: *const ADCOutputType) comptime_int {
                return HSIRCDiv.get();
            }
        };
        const VCOIIuputType = struct {
            pub fn get(_: *const VCOIIuputType) comptime_int {
                return PLLSource.get();
            }
        };
        const PLLMULType = struct {
            value: PLLMULConf,

            pub fn get(self: *const PLLMULType) comptime_int {
                if (!@hasDecl(this, "VCOIIuput")) {
                    @compileError("No Input VCOIIuput for PLLMUL\n");
                }
                const from_input: comptime_float = @floatFromInt(this.VCOIIuput.get());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * multi));
            }
        };

        const PLLDIVType = struct {
            value: PLLDIVConf,

            pub fn get(self: *const PLLDIVType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for PLLDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLMUL.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const DIV2USBType = struct {
            pub fn get(_: *const DIV2USBType) comptime_int {
                if (!@hasDecl(this, "PLLMUL")) {
                    @compileError("No Input PLLMUL for DIV2USB\n");
                }
                const from_input = this.PLLMUL.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const HSIRC = HSIRCType{};
        const MSIRC = MSIRCType{ .value = conf.MSIRC };
        const HSI48RC = HSI48RCType{};
        const HSIRCDiv = HSIRCDivType{ .value = conf.HSIRCDiv };
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const LCDOutput = LCDOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const SysCLKOutput = SysCLKOutputType{};
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        const TIMPrescaler = TIMPrescalerType{ .value = conf.TIMPrescaler };
        pub const TIMOutput = TIMOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const APB1Prescaler = APB1PrescalerType{ .value = conf.APB1Prescaler };
        pub const APB1Output = APB1OutputType{};
        const TimPrescalerAPB1 = TimPrescalerAPB1Type{};
        pub const TimPrescOut = TimPrescOutType{};
        const APB2Prescaler = APB2PrescalerType{ .value = conf.APB2Prescaler };
        pub const APB2Output = APB2OutputType{};
        const PeriphPrescaler = PeriphPrescalerType{};
        pub const PeriphPrescOutput = PeriphPrescOutputType{};
        const LPTIMMult = LPTIMMultType{ .value = conf.LPTIMMult };
        pub const LPTIMOutput = LPTIMOutputType{};
        const LPUARTMult = LPUARTMultType{ .value = conf.LPUARTMult };
        pub const LPUARTOutput = LPUARTOutputType{};
        const USART2Mult = USART2MultType{ .value = conf.USART2Mult };
        pub const USART2Output = USART2OutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1Output = USART1OutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1Output = I2C1OutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const HSI48MUL = HSI48MULType{ .value = conf.HSI48MUL };
        pub const @"48USBOutput" = @"48USBOutputType"{};
        pub const @"48RNGOutput" = @"48RNGOutputType"{};
        pub const ADCOutput = ADCOutputType{};
        pub const VCOIIuput = VCOIIuputType{};
        const PLLMUL = PLLMULType{ .value = conf.PLLMUL };
        const PLLDIV = PLLDIVType{ .value = conf.PLLDIV };
        const DIV2USB = DIV2USBType{};

        pub fn validate() void {
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = TIMOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut.get();
            _ = APB2Output.get();
            _ = PeriphPrescOutput.get();
            _ = LPTIMOutput.get();
            _ = LPUARTOutput.get();
            _ = USART2Output.get();
            _ = USART1Output.get();
            _ = I2C1Output.get();
            _ = @"48USBOutput".get();
            _ = @"48RNGOutput".get();
        }
    };

    return ClockStruct;
}
