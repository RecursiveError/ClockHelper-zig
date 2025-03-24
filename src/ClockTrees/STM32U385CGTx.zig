const std = @import("std");

pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 4000000) {
            @compileError("min value for HSEOSC is 4000000\n");
        } else if (val > 50000000) {
            @compileError("min value for HSEOSC is 50000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 50000000;
    }

    pub fn min() comptime_int {
        return 4000000;
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
pub const LSIDIVConf = enum {
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
        if (val < 5000) {
            @compileError("min value for LSEOSC is 5000\n");
        } else if (val > 40000) {
            @compileError("min value for LSEOSC is 40000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 40000;
    }

    pub fn min() comptime_int {
        return 5000;
    }
};
pub const MSIKSourceConf = enum {
    const this = @This();
    CLOCK_96,
    CLOCK_24,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .CLOCK_96 => 96,
            .CLOCK_24 => 24,
        };
    }
};
pub const MSISSourceConf = enum {
    const this = @This();
    CLOCK_96,
    CLOCK_24,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .CLOCK_96 => 96,
            .CLOCK_24 => 24,
        };
    }
};
pub const MSIKDIVConf = enum {
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
pub const MSISDIVConf = enum {
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
pub const SysClkSourceConf = enum {
    MSISOutput,
    HSIRC,
    HSEOSC,
};
pub const SPI1MultConf = enum {
    APB2Prescaler,
    MSIKDIV,
};
pub const SPI3MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const SPI2MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIDIV,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    HSIRC,
};
pub const USART3MultConf = enum {
    APB1Prescaler,
    HSIRC,
};
pub const UART4MultConf = enum {
    APB1Prescaler,
    HSIRC,
};
pub const ADCMultConf = enum {
    AHBOutput,
    HSEOSC,
    MSIKDIV,
};
pub const ADCDivConf = enum {
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
        };
    }
};
pub const LPUART1MultConf = enum {
    APB3Output,
    HSIRC,
    LSEOSC,
    MSIKDIV,
};
pub const LPTIM1MultConf = enum {
    MSIKDIV,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const LPTIM2MultConf = enum {
    APB1Prescaler,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const DACMultConf = enum {
    LSEOSC,
    LSIDIV,
};
pub const ICLKMultConf = enum {
    SysCLKOutput,
    MSIKDIV,
    HSEOSC,
    HSI48RC,
};
pub const USBDivConf = enum {
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
pub const FDCANMultConf = enum {
    SysCLKOutput,
    MSIKDIV,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const I3C1MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const I3C2MultConf = enum {
    APB3Output,
    MSIKDIV,
};
pub const I2C2MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const I2C3MultConf = enum {
    APB3Output,
    MSIKDIV,
};
pub const SAI1MultConf = enum {
    MSIKDIV,
    SAI1_EXT,
    HSEOSC,
};
pub const ADF1MultConf = enum {
    AHBOutput,
    SAI1_EXT,
    MSIKDIV,
    SAI1output,
};
pub const OCTOSPIMMultConf = enum {
    SysCLKOutput,
    MSIKDIV,
};
pub const LPTIM3MultConf = enum {
    MSIKDIV,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const RNGMultConf = enum {
    HSI48RC,
    MSIKDIV,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIDIV,
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    MSISDIV,
    HSI48RC,
    MSIKDIV,
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
pub const MCO2MultConf = enum {
    LSEOSC,
    LSIDIV,
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    MSISDIV,
    HSI48RC,
    MSIKDIV,
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
pub const LSCOMultConf = enum {
    LSIDIV,
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
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV8 => 8,
        };
    }
};
pub const CortexCLockSelectionConf = enum {
    CortexPrescaler,
    LSEOSC,
    LSIDIV,
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
pub const APB3PrescalerConf = enum {
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
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(16000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSIDIV: LSIDIVConf = .DIV1,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIKSource: MSIKSourceConf = .CLOCK_96,
    MSISSource: MSISSourceConf = .CLOCK_96,
    MSIKDIV: MSIKDIVConf = .DIV1,
    MSISDIV: MSISDIVConf = .DIV8,
    SysClkSource: SysClkSourceConf = .MSISOutput,
    SPI1Mult: SPI1MultConf = .APB2Prescaler,
    SPI3Mult: SPI3MultConf = .APB1Prescaler,
    SPI2Mult: SPI2MultConf = .APB1Prescaler,
    RTCClkSource: RTCClkSourceConf = .LSIDIV,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    ADCMult: ADCMultConf = .AHBOutput,
    ADCDiv: ADCDivConf = .DIV1,
    LPUART1Mult: LPUART1MultConf = .APB3Output,
    LPTIM1Mult: LPTIM1MultConf = .MSIKDIV,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    DACMult: DACMultConf = .LSIDIV,
    ICLKMult: ICLKMultConf = .SysCLKOutput,
    USBDiv: USBDivConf = .DIV1,
    FDCANMult: FDCANMultConf = .SysCLKOutput,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I3C1Mult: I3C1MultConf = .APB1Prescaler,
    I3C2Mult: I3C2MultConf = .APB3Output,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB3Output,
    SAI1Mult: SAI1MultConf = .MSIKDIV,
    ADF1Mult: ADF1MultConf = .AHBOutput,
    OCTOSPIMMult: OCTOSPIMMultConf = .SysCLKOutput,
    LPTIM3Mult: LPTIM3MultConf = .MSIKDIV,
    RNGMult: RNGMultConf = .HSI48RC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIDIV,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV8,
    CortexCLockSelection: CortexCLockSelectionConf = .CortexPrescaler,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    APB3Prescaler: APB3PrescalerConf = .DIV1,
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 16000000;
            }
        };
        const CRSCLKoutputType = struct {
            pub fn get(_: *const CRSCLKoutputType) comptime_int {
                return HSI48RC.get();
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
            value: LSIRCConf,
            pub fn get(comptime self: LSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const LSIDIVType = struct {
            value: LSIDIVConf,

            pub fn get(self: *const LSIDIVType) comptime_int {
                if (!@hasDecl(this, "LSIRC")) {
                    @compileError("No Input LSIRC for LSIDIV\n");
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
        const MSIKSourceType = struct {
            value: MSIKSourceConf,
            pub fn get(comptime self: MSIKSourceType) comptime_int {
                return self.value.get();
            }
        };
        const MSISSourceType = struct {
            value: MSISSourceConf,
            pub fn get(comptime self: MSISSourceType) comptime_int {
                return self.value.get();
            }
        };
        const MSIKDIVType = struct {
            value: MSIKDIVConf,

            pub fn get(self: *const MSIKDIVType) comptime_int {
                if (!@hasDecl(this, "MSIKSource")) {
                    @compileError("No Input MSIKSource for MSIKDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MSIKSource.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MSISDIVType = struct {
            value: MSISDIVConf,

            pub fn get(self: *const MSISDIVType) comptime_int {
                if (!@hasDecl(this, "MSISSource")) {
                    @compileError("No Input MSISSource for MSISDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MSISSource.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MSISOutputType = struct {
            pub fn get(_: *const MSISOutputType) comptime_int {
                const from_input = MSISDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MSISDIV on MSISOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MSISDIV on MSISOutput | recive {d} max 96000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI1_EXTType = struct {
            pub fn get(_: *const SAI1_EXTType) comptime_int {
                return 48000;
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .MSISOutput => MSISOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 96000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI1MultType = struct {
            value: SPI1MultConf,
            pub fn get(comptime self: SPI1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Prescaler => APB2Prescaler.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const SPI1outputType = struct {
            pub fn get(_: *const SPI1outputType) comptime_int {
                return SPI1Mult.get();
            }
        };
        const SPI3MultType = struct {
            value: SPI3MultConf,
            pub fn get(comptime self: SPI3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const SPI3outputType = struct {
            pub fn get(_: *const SPI3outputType) comptime_int {
                return SPI3Mult.get();
            }
        };
        const SPI2MultType = struct {
            value: SPI2MultConf,
            pub fn get(comptime self: SPI2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const SPI2outputType = struct {
            pub fn get(_: *const SPI2outputType) comptime_int {
                return SPI2Mult.get();
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
                    .LSIDIV => LSIDIV.get(),
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
                return LSIDIV.get();
            }
        };
        const USART1MultType = struct {
            value: USART1MultConf,
            pub fn get(comptime self: USART1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Prescaler => APB2Prescaler.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const USART1outputType = struct {
            pub fn get(_: *const USART1outputType) comptime_int {
                return USART1Mult.get();
            }
        };
        const USART3MultType = struct {
            value: USART3MultConf,
            pub fn get(comptime self: USART3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const USART3outputType = struct {
            pub fn get(_: *const USART3outputType) comptime_int {
                return USART3Mult.get();
            }
        };
        const UART4MultType = struct {
            value: UART4MultConf,
            pub fn get(comptime self: UART4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const UART4outputType = struct {
            pub fn get(_: *const UART4outputType) comptime_int {
                return UART4Mult.get();
            }
        };
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const ADCDivType = struct {
            value: ADCDivConf,

            pub fn get(self: *const ADCDivType) comptime_int {
                if (!@hasDecl(this, "ADCMult")) {
                    @compileError("No Input ADCMult for ADCDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.ADCMult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                return ADCDiv.get();
            }
        };
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .APB3Output => APB3Output.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIKDIV => MSIKDIV.get(),
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
                    .MSIKDIV => MSIKDIV.get(),
                    .LSIDIV => LSIDIV.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPTIM1outputType = struct {
            pub fn get(_: *const LPTIM1outputType) comptime_int {
                const from_input = LPTIM1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM1Mult on LPTIM1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM1Mult on LPTIM1output | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM2MultType = struct {
            value: LPTIM2MultConf,
            pub fn get(comptime self: LPTIM2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .LSIDIV => LSIDIV.get(),
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
        const DACMultType = struct {
            value: DACMultConf,
            pub fn get(comptime self: DACMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIDIV => LSIDIV.get(),
                };
            }
        };
        const DACoutputType = struct {
            pub fn get(_: *const DACoutputType) comptime_int {
                return DACMult.get();
            }
        };
        const ICLKMultType = struct {
            value: ICLKMultConf,
            pub fn get(comptime self: ICLKMultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MSIKDIV => MSIKDIV.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSI48RC => HSI48RC.get(),
                };
            }
        };
        const SDMMC1OutputType = struct {
            pub fn get(_: *const SDMMC1OutputType) comptime_int {
                const from_input = ICLKMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ICLKMult on SDMMC1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 55000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ICLKMult on SDMMC1Output | recive {d} max 55000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USBDivType = struct {
            value: USBDivConf,

            pub fn get(self: *const USBDivType) comptime_int {
                if (!@hasDecl(this, "ICLKMult")) {
                    @compileError("No Input ICLKMult for USBDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.ICLKMult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const USBoutputType = struct {
            pub fn get(_: *const USBoutputType) comptime_int {
                return USBDiv.get();
            }
        };
        const FDCANMultType = struct {
            value: FDCANMultConf,
            pub fn get(comptime self: FDCANMultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const FDCANOutputType = struct {
            pub fn get(_: *const FDCANOutputType) comptime_int {
                return FDCANMult.get();
            }
        };
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const I2C1outputType = struct {
            pub fn get(_: *const I2C1outputType) comptime_int {
                return I2C1Mult.get();
            }
        };
        const I3C1MultType = struct {
            value: I3C1MultConf,
            pub fn get(comptime self: I3C1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const I3C1outputType = struct {
            pub fn get(_: *const I3C1outputType) comptime_int {
                return I3C1Mult.get();
            }
        };
        const I3C2MultType = struct {
            value: I3C2MultConf,
            pub fn get(comptime self: I3C2MultType) comptime_int {
                return switch (self.value) {
                    .APB3Output => APB3Output.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const I3C2outputType = struct {
            pub fn get(_: *const I3C2outputType) comptime_int {
                return I3C2Mult.get();
            }
        };
        const I2C2MultType = struct {
            value: I2C2MultConf,
            pub fn get(comptime self: I2C2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .MSIKDIV => MSIKDIV.get(),
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
                    .APB3Output => APB3Output.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const I2C3outputType = struct {
            pub fn get(_: *const I2C3outputType) comptime_int {
                return I2C3Mult.get();
            }
        };
        const SAI1MultType = struct {
            value: SAI1MultConf,
            pub fn get(comptime self: SAI1MultType) comptime_int {
                return switch (self.value) {
                    .MSIKDIV => MSIKDIV.get(),
                    .SAI1_EXT => SAI1_EXT.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                return SAI1Mult.get();
            }
        };
        const ADF1MultType = struct {
            value: ADF1MultConf,
            pub fn get(comptime self: ADF1MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .SAI1_EXT => SAI1_EXT.get(),
                    .MSIKDIV => MSIKDIV.get(),
                    .SAI1output => SAI1output.get(),
                };
            }
        };
        const ADF1outputType = struct {
            pub fn get(_: *const ADF1outputType) comptime_int {
                return ADF1Mult.get();
            }
        };
        const OCTOSPIMMultType = struct {
            value: OCTOSPIMMultConf,
            pub fn get(comptime self: OCTOSPIMMultType) comptime_int {
                return switch (self.value) {
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const OCTOSPIMoutputType = struct {
            pub fn get(_: *const OCTOSPIMoutputType) comptime_int {
                return OCTOSPIMMult.get();
            }
        };
        const LPTIM3MultType = struct {
            value: LPTIM3MultConf,
            pub fn get(comptime self: LPTIM3MultType) comptime_int {
                return switch (self.value) {
                    .MSIKDIV => MSIKDIV.get(),
                    .LSIDIV => LSIDIV.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LPTIM3outputType = struct {
            pub fn get(_: *const LPTIM3outputType) comptime_int {
                return LPTIM3Mult.get();
            }
        };
        const RNGMultType = struct {
            value: RNGMultConf,
            pub fn get(comptime self: RNGMultType) comptime_int {
                return switch (self.value) {
                    .HSI48RC => HSI48RC.get(),
                    .MSIKDIV => MSIKDIV.get(),
                };
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                const from_input = RNGMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RNGMult on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RNGMult on RNGoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .LSIDIV => LSIDIV.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MSISDIV => MSISDIV.get(),
                    .HSI48RC => HSI48RC.get(),
                    .MSIKDIV => MSIKDIV.get(),
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
                    .LSIDIV => LSIDIV.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .MSISDIV => MSISDIV.get(),
                    .HSI48RC => HSI48RC.get(),
                    .MSIKDIV => MSIKDIV.get(),
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
                    .LSIDIV => LSIDIV.get(),
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

        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = AHBPrescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBPrescaler on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 96000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HCLKOutputType = struct {
            pub fn get(_: *const HCLKOutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on HCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on HCLKOutput | recive {d} max 96000000\n", .{from_input}));
                }
                return from_input;
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

        const CortexCLockSelectionType = struct {
            value: CortexCLockSelectionConf,
            pub fn get(comptime self: CortexCLockSelectionType) comptime_int {
                return switch (self.value) {
                    .CortexPrescaler => CortexPrescaler.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIDIV => LSIDIV.get(),
                };
            }
        };
        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                const from_input = CortexCLockSelection.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CortexCLockSelection on CortexSysOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CortexCLockSelection on CortexSysOutput | recive {d} max 96000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FCLKCortexOutputType = struct {
            pub fn get(_: *const FCLKCortexOutputType) comptime_int {
                const from_input = AHBOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from AHBOutput on FCLKCortexOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBOutput on FCLKCortexOutput | recive {d} max 96000000\n", .{from_input}));
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
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 96000000\n", .{from_input}));
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
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from TimPrescalerAPB1 on TimPrescOut1 | recive {d} max 96000000\n", .{from_input}));
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
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 96000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB3PrescalerType = struct {
            value: APB3PrescalerConf,

            pub fn get(self: *const APB3PrescalerType) comptime_int {
                if (!@hasDecl(this, "AHBOutput")) {
                    @compileError("No Input AHBOutput for APB3Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.AHBOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB3OutputType = struct {
            pub fn get(_: *const APB3OutputType) comptime_int {
                const from_input = APB3Prescaler.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB3Prescaler on APB3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB3Prescaler on APB3Output | recive {d} max 96000000\n", .{from_input}));
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
                } else if (from_input > 96000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from TimPrescalerAPB2 on TimPrescOut2 | recive {d} max 96000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HSIRC = HSIRCType{};
        pub const CRSCLKoutput = CRSCLKoutputType{};
        const HSI48RC = HSI48RCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{ .value = conf.LSIRC };
        const LSIDIV = LSIDIVType{ .value = conf.LSIDIV };
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const MSIKSource = MSIKSourceType{ .value = conf.MSIKSource };
        const MSISSource = MSISSourceType{ .value = conf.MSISSource };
        const MSIKDIV = MSIKDIVType{ .value = conf.MSIKDIV };
        const MSISDIV = MSISDIVType{ .value = conf.MSISDIV };
        pub const MSISOutput = MSISOutputType{};
        const SAI1_EXT = SAI1_EXTType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const SPI1Mult = SPI1MultType{ .value = conf.SPI1Mult };
        pub const SPI1output = SPI1outputType{};
        const SPI3Mult = SPI3MultType{ .value = conf.SPI3Mult };
        pub const SPI3output = SPI3outputType{};
        const SPI2Mult = SPI2MultType{ .value = conf.SPI2Mult };
        pub const SPI2output = SPI2outputType{};
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART3Mult = USART3MultType{ .value = conf.USART3Mult };
        pub const USART3output = USART3outputType{};
        const UART4Mult = UART4MultType{ .value = conf.UART4Mult };
        pub const UART4output = UART4outputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        const ADCDiv = ADCDivType{ .value = conf.ADCDiv };
        pub const ADCoutput = ADCoutputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const LPTIM2Mult = LPTIM2MultType{ .value = conf.LPTIM2Mult };
        pub const LPTIM2output = LPTIM2outputType{};
        const DACMult = DACMultType{ .value = conf.DACMult };
        pub const DACoutput = DACoutputType{};
        const ICLKMult = ICLKMultType{ .value = conf.ICLKMult };
        pub const SDMMC1Output = SDMMC1OutputType{};
        const USBDiv = USBDivType{ .value = conf.USBDiv };
        pub const USBoutput = USBoutputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANOutput = FDCANOutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I3C1Mult = I3C1MultType{ .value = conf.I3C1Mult };
        pub const I3C1output = I3C1outputType{};
        const I3C2Mult = I3C2MultType{ .value = conf.I3C2Mult };
        pub const I3C2output = I3C2outputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2output = I2C2outputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3output = I2C3outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        const ADF1Mult = ADF1MultType{ .value = conf.ADF1Mult };
        pub const ADF1output = ADF1outputType{};
        const OCTOSPIMMult = OCTOSPIMMultType{ .value = conf.OCTOSPIMMult };
        pub const OCTOSPIMoutput = OCTOSPIMoutputType{};
        const LPTIM3Mult = LPTIM3MultType{ .value = conf.LPTIM3Mult };
        pub const LPTIM3output = LPTIM3outputType{};
        const RNGMult = RNGMultType{ .value = conf.RNGMult };
        pub const RNGoutput = RNGoutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const LSCOMult = LSCOMultType{ .value = conf.LSCOMult };
        pub const LSCOOutput = LSCOOutputType{};
        const AHBPrescaler = AHBPrescalerType{ .value = conf.AHBPrescaler };
        pub const AHBOutput = AHBOutputType{};
        pub const HCLKOutput = HCLKOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        const CortexCLockSelection = CortexCLockSelectionType{ .value = conf.CortexCLockSelection };
        pub const CortexSysOutput = CortexSysOutputType{};
        pub const FCLKCortexOutput = FCLKCortexOutputType{};
        const APB1Prescaler = APB1PrescalerType{ .value = conf.APB1Prescaler };
        pub const APB1Output = APB1OutputType{};
        const TimPrescalerAPB1 = TimPrescalerAPB1Type{};
        pub const TimPrescOut1 = TimPrescOut1Type{};
        const APB2Prescaler = APB2PrescalerType{ .value = conf.APB2Prescaler };
        pub const APB2Output = APB2OutputType{};
        const APB3Prescaler = APB3PrescalerType{ .value = conf.APB3Prescaler };
        pub const APB3Output = APB3OutputType{};
        const TimPrescalerAPB2 = TimPrescalerAPB2Type{};
        pub const TimPrescOut2 = TimPrescOut2Type{};

        pub fn validate() void {
            _ = CRSCLKoutput.get();
            _ = SPI1output.get();
            _ = SPI3output.get();
            _ = SPI2output.get();
            _ = RTCOutput.get();
            _ = IWDGOutput.get();
            _ = USART1output.get();
            _ = USART3output.get();
            _ = UART4output.get();
            _ = ADCoutput.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM2output.get();
            _ = DACoutput.get();
            _ = SDMMC1Output.get();
            _ = USBoutput.get();
            _ = FDCANOutput.get();
            _ = I2C1output.get();
            _ = I3C1output.get();
            _ = I3C2output.get();
            _ = I2C2output.get();
            _ = I2C3output.get();
            _ = SAI1output.get();
            _ = ADF1output.get();
            _ = OCTOSPIMoutput.get();
            _ = LPTIM3output.get();
            _ = RNGoutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = APB3Output.get();
            _ = TimPrescOut2.get();
        }
    };

    return ClockStruct;
}
