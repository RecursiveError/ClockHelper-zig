const std = @import("std");

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
pub const LSIRCConf = enum(comptime_int) {
    _,
    pub fn get(num: LSIRCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 31040) {
            @compileError("min value for LSIRC is 31040\n");
        } else if (val > 32960) {
            @compileError("min value for LSIRC is 32960\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 32960;
    }

    pub fn min() comptime_int {
        return 31040;
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
pub const MSIRCConf = enum {
    const this = @This();
    CLOCK_100,
    CLOCK_200,
    CLOCK_400,
    CLOCK_800,
    CLOCK_1000,
    CLOCK_2000,
    CLOCK_4000,
    CLOCK_8000,
    CLOCK_16000,
    CLOCK_24000,
    CLOCK_32000,
    CLOCK_48000,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .CLOCK_100 => 100,
            .CLOCK_200 => 200,
            .CLOCK_400 => 400,
            .CLOCK_800 => 800,
            .CLOCK_1000 => 1000,
            .CLOCK_2000 => 2000,
            .CLOCK_4000 => 4000,
            .CLOCK_8000 => 8000,
            .CLOCK_16000 => 16000,
            .CLOCK_24000 => 24000,
            .CLOCK_32000 => 32000,
            .CLOCK_48000 => 48000,
        };
    }
};
pub const SysClkSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
    PLLR,
};
pub const PLLSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const PLLSAI1SourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const PLLSAI2SourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const PLLMConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLMConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLM is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLLM is 16\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLLSAI1MConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAI1MConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLSAI1M is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLLSAI1M is 16\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLLSAI2MConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAI2MConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for PLLSAI2M is 1\n");
        } else if (val > 16) {
            @compileError("min value for PLLSAI2M is 16\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIDIV,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const USART2MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const USART3MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const UART4MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const UART5MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    APB1Prescaler,
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
pub const DFSDMMultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
};
pub const ADCMultConf = enum {
    PLLSAI1R,
    SysCLKOutput,
};
pub const CK48MultConf = enum {
    PLLSAI1Q,
    PLLQ,
    MSIRC,
    HSI48RC,
};
pub const SDMMC1MultConf = enum {
    PLLP,
    CK48Mult,
};
pub const FDCANMultConf = enum {
    PLLQ,
    PLLSAI1P,
    HSEOSC,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const I2C2MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const I2C3MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const SAI1MultConf = enum {
    PLLSAI1P,
    PLLSAI2P,
    PLLP,
    SAI1_EXT,
    HSIRC,
};
pub const SAI2MultConf = enum {
    PLLSAI1P,
    PLLSAI2P,
    PLLP,
    SAI2_EXT,
    HSIRC,
};
pub const I2C4MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const OCTOSPIMMultConf = enum {
    MSIRC,
    SysCLKOutput,
    PLLQ,
};
pub const LPTIM3MultConf = enum {
    APB1Prescaler,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const DFSDMAudioMultConf = enum {
    MSIRC,
    HSIRC,
    SAI1Mult,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIDIV,
    HSEOSC,
    HSIRC,
    PLLR,
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
    DIV7,
    DIV17,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV7 => 7,
            .DIV17 => 17,
        };
    }
};
pub const PLLQConf = enum {
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
pub const PLLRConf = enum {
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
pub const PLLSAI1NConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAI1NConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for PLLSAI1N is 8\n");
        } else if (val > 86) {
            @compileError("min value for PLLSAI1N is 86\n");
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
pub const PLLSAI1PConf = enum {
    const this = @This();
    DIV7,
    DIV17,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV7 => 7,
            .DIV17 => 17,
        };
    }
};
pub const PLLSAI1QConf = enum {
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
pub const PLLSAI1RConf = enum {
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
pub const PLLSAI2NConf = enum(comptime_int) {
    _,
    pub fn get(num: PLLSAI2NConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8) {
            @compileError("min value for PLLSAI2N is 8\n");
        } else if (val > 86) {
            @compileError("min value for PLLSAI2N is 86\n");
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
pub const PLLSAI2PConf = enum {
    const this = @This();
    DIV7,
    DIV17,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV7 => 7,
            .DIV17 => 17,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(16000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSIDIV: LSIDIVConf = .DIV1,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .CLOCK_4000,
    SysClkSource: SysClkSourceConf = .MSIRC,
    PLLSource: PLLSourceConf = .MSIRC,
    PLLSAI1Source: PLLSAI1SourceConf = .MSIRC,
    PLLSAI2Source: PLLSAI2SourceConf = .MSIRC,
    PLLM: PLLMConf = @enumFromInt(1),
    PLLSAI1M: PLLSAI1MConf = @enumFromInt(1),
    PLLSAI2M: PLLSAI2MConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIDIV,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB1Prescaler,
    LPTIM1Mult: LPTIM1MultConf = .APB1Prescaler,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    DFSDMMult: DFSDMMultConf = .APB2Prescaler,
    ADCMult: ADCMultConf = .PLLSAI1R,
    CK48Mult: CK48MultConf = .PLLSAI1Q,
    SDMMC1Mult: SDMMC1MultConf = .PLLP,
    FDCANMult: FDCANMultConf = .PLLQ,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB1Prescaler,
    SAI1Mult: SAI1MultConf = .PLLSAI1P,
    SAI2Mult: SAI2MultConf = .PLLSAI1P,
    I2C4Mult: I2C4MultConf = .APB1Prescaler,
    OCTOSPIMMult: OCTOSPIMMultConf = .SysCLKOutput,
    LPTIM3Mult: LPTIM3MultConf = .APB1Prescaler,
    DFSDMAudioMult: DFSDMAudioMultConf = .MSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIDIV,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .DIV7,
    PLLQ: PLLQConf = .DIV2,
    PLLR: PLLRConf = .DIV2,
    PLLSAI1N: PLLSAI1NConf = @enumFromInt(8),
    PLLSAI1P: PLLSAI1PConf = .DIV7,
    PLLSAI1Q: PLLSAI1QConf = .DIV2,
    PLLSAI1R: PLLSAI1RConf = .DIV2,
    PLLSAI2N: PLLSAI2NConf = @enumFromInt(8),
    PLLSAI2P: PLLSAI2PConf = .DIV7,
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
        const MSIRCType = struct {
            value: MSIRCConf,
            pub fn get(comptime self: MSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const SAI1_EXTType = struct {
            pub fn get(_: *const SAI1_EXTType) comptime_int {
                return 48000;
            }
        };
        const SAI2_EXTType = struct {
            pub fn get(_: *const SAI2_EXTType) comptime_int {
                return 48000;
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .PLLR => PLLR.get(),
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
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const PLLSAI1SourceType = struct {
            value: PLLSAI1SourceConf,
            pub fn get(comptime self: PLLSAI1SourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const PLLSAI2SourceType = struct {
            value: PLLSAI2SourceConf,
            pub fn get(comptime self: PLLSAI2SourceType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
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

        const PLLSAI1MType = struct {
            value: PLLSAI1MConf,

            pub fn get(self: *const PLLSAI1MType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1Source")) {
                    @compileError("No Input PLLSAI1Source for PLLSAI1M\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLLSAI2MType = struct {
            value: PLLSAI2MConf,

            pub fn get(self: *const PLLSAI2MType) comptime_int {
                if (!@hasDecl(this, "PLLSAI2Source")) {
                    @compileError("No Input PLLSAI2Source for PLLSAI2M\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI2Source.get());
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
                    .LSIDIV => LSIDIV.get(),
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
        const USART2MultType = struct {
            value: USART2MultConf,
            pub fn get(comptime self: USART2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
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
        const USART3MultType = struct {
            value: USART3MultConf,
            pub fn get(comptime self: USART3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
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
        const UART4MultType = struct {
            value: UART4MultConf,
            pub fn get(comptime self: UART4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const UART4outputType = struct {
            pub fn get(_: *const UART4outputType) comptime_int {
                return UART4Mult.get();
            }
        };
        const UART5MultType = struct {
            value: UART5MultConf,
            pub fn get(comptime self: UART5MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const UART5outputType = struct {
            pub fn get(_: *const UART5outputType) comptime_int {
                return UART5Mult.get();
            }
        };
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
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
                    .APB1Prescaler => APB1Prescaler.get(),
                    .LSIDIV => LSIDIV.get(),
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
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .PLLSAI1R => PLLSAI1R.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                };
            }
        };
        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                const from_input = ADCMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADCMult on ADCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 110000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCMult on ADCoutput | recive {d} max 110000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CK48MultType = struct {
            value: CK48MultConf,
            pub fn get(comptime self: CK48MultType) comptime_int {
                return switch (self.value) {
                    .PLLSAI1Q => PLLSAI1Q.get(),
                    .PLLQ => PLLQ.get(),
                    .MSIRC => MSIRC.get(),
                    .HSI48RC => HSI48RC.get(),
                };
            }
        };
        const CK48outputType = struct {
            pub fn get(_: *const CK48outputType) comptime_int {
                return CK48Mult.get();
            }
        };
        const RNGoutputType = struct {
            pub fn get(_: *const RNGoutputType) comptime_int {
                const from_input = CK48Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CK48Mult on RNGoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 48000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CK48Mult on RNGoutput | recive {d} max 48000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SDMMC1MultType = struct {
            value: SDMMC1MultConf,
            pub fn get(comptime self: SDMMC1MultType) comptime_int {
                return switch (self.value) {
                    .PLLP => PLLP.get(),
                    .CK48Mult => CK48Mult.get(),
                };
            }
        };
        const SDMMCC1OutputType = struct {
            pub fn get(_: *const SDMMCC1OutputType) comptime_int {
                const from_input = SDMMC1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMC1Mult on SDMMCC1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMC1Mult on SDMMCC1Output | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FDCANMultType = struct {
            value: FDCANMultConf,
            pub fn get(comptime self: FDCANMultType) comptime_int {
                return switch (self.value) {
                    .PLLQ => PLLQ.get(),
                    .PLLSAI1P => PLLSAI1P.get(),
                    .HSEOSC => HSEOSC.get(),
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
                    .APB1Prescaler => APB1Prescaler.get(),
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
        const I2C3MultType = struct {
            value: I2C3MultConf,
            pub fn get(comptime self: I2C3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
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
        const SAI1MultType = struct {
            value: SAI1MultConf,
            pub fn get(comptime self: SAI1MultType) comptime_int {
                return switch (self.value) {
                    .PLLSAI1P => PLLSAI1P.get(),
                    .PLLSAI2P => PLLSAI2P.get(),
                    .PLLP => PLLP.get(),
                    .SAI1_EXT => SAI1_EXT.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                return SAI1Mult.get();
            }
        };
        const SAI2MultType = struct {
            value: SAI2MultConf,
            pub fn get(comptime self: SAI2MultType) comptime_int {
                return switch (self.value) {
                    .PLLSAI1P => PLLSAI1P.get(),
                    .PLLSAI2P => PLLSAI2P.get(),
                    .PLLP => PLLP.get(),
                    .SAI2_EXT => SAI2_EXT.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const SAI2outputType = struct {
            pub fn get(_: *const SAI2outputType) comptime_int {
                return SAI2Mult.get();
            }
        };
        const I2C4MultType = struct {
            value: I2C4MultConf,
            pub fn get(comptime self: I2C4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Prescaler => APB1Prescaler.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const I2C4outputType = struct {
            pub fn get(_: *const I2C4outputType) comptime_int {
                return I2C4Mult.get();
            }
        };
        const OCTOSPIMMultType = struct {
            value: OCTOSPIMMultConf,
            pub fn get(comptime self: OCTOSPIMMultType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .SysCLKOutput => SysCLKOutput.get(),
                    .PLLQ => PLLQ.get(),
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
                    .APB1Prescaler => APB1Prescaler.get(),
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
        const DFSDMAudioMultType = struct {
            value: DFSDMAudioMultConf,
            pub fn get(comptime self: DFSDMAudioMultType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .SAI1Mult => SAI1Mult.get(),
                };
            }
        };
        const DFSDMAudiooutputType = struct {
            pub fn get(_: *const DFSDMAudiooutputType) comptime_int {
                return DFSDMAudioMult.get();
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
                    .PLLR => PLLR.get(),
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
                } else if (from_input > 110000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from AHBPrescaler on AHBOutput | recive {d} max 110000000\n", .{from_input}));
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
                } else if (from_input > 110000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1Prescaler on APB1Output | recive {d} max 110000000\n", .{from_input}));
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
                } else if (from_input > 110000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2Prescaler on APB2Output | recive {d} max 110000000\n", .{from_input}));
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
        const UCPD1OutputType = struct {
            pub fn get(_: *const UCPD1OutputType) comptime_int {
                return HSIRC.get();
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
                return PLLP.get();
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
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1NType = struct {
            value: PLLSAI1NConf,

            pub fn get(self: *const PLLSAI1NType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1M")) {
                    @compileError("No Input PLLSAI1M for PLLSAI1N\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1M.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLLSAI1PType = struct {
            value: PLLSAI1PConf,

            pub fn get(self: *const PLLSAI1PType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1N")) {
                    @compileError("No Input PLLSAI1N for PLLSAI1P\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1PoutputType = struct {
            pub fn get(_: *const PLLSAI1PoutputType) comptime_int {
                return PLLSAI1P.get();
            }
        };
        const PLLSAI1QType = struct {
            value: PLLSAI1QConf,

            pub fn get(self: *const PLLSAI1QType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1N")) {
                    @compileError("No Input PLLSAI1N for PLLSAI1Q\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1QoutputType = struct {
            pub fn get(_: *const PLLSAI1QoutputType) comptime_int {
                return PLLSAI1Q.get();
            }
        };
        const PLLSAI1RType = struct {
            value: PLLSAI1RConf,

            pub fn get(self: *const PLLSAI1RType) comptime_int {
                if (!@hasDecl(this, "PLLSAI1N")) {
                    @compileError("No Input PLLSAI1N for PLLSAI1R\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI1N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI1RoutputType = struct {
            pub fn get(_: *const PLLSAI1RoutputType) comptime_int {
                return PLLSAI1R.get();
            }
        };
        const PLLSAI2NType = struct {
            value: PLLSAI2NConf,

            pub fn get(self: *const PLLSAI2NType) comptime_int {
                if (!@hasDecl(this, "PLLSAI2M")) {
                    @compileError("No Input PLLSAI2M for PLLSAI2N\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI2M.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLLSAI2PType = struct {
            value: PLLSAI2PConf,

            pub fn get(self: *const PLLSAI2PType) comptime_int {
                if (!@hasDecl(this, "PLLSAI2N")) {
                    @compileError("No Input PLLSAI2N for PLLSAI2P\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLLSAI2N.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const PLLSAI2PoutputType = struct {
            pub fn get(_: *const PLLSAI2PoutputType) comptime_int {
                return PLLSAI2P.get();
            }
        };
        const HSIRC = HSIRCType{};
        pub const CRSCLKoutput = CRSCLKoutputType{};
        const HSI48RC = HSI48RCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSIRC = LSIRCType{ .value = conf.LSIRC };
        const LSIDIV = LSIDIVType{ .value = conf.LSIDIV };
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const MSIRC = MSIRCType{ .value = conf.MSIRC };
        const SAI1_EXT = SAI1_EXTType{};
        const SAI2_EXT = SAI2_EXTType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const PLLSource = PLLSourceType{ .value = conf.PLLSource };
        const PLLSAI1Source = PLLSAI1SourceType{ .value = conf.PLLSAI1Source };
        const PLLSAI2Source = PLLSAI2SourceType{ .value = conf.PLLSAI2Source };
        const PLLM = PLLMType{ .value = conf.PLLM };
        const PLLSAI1M = PLLSAI1MType{ .value = conf.PLLSAI1M };
        const PLLSAI2M = PLLSAI2MType{ .value = conf.PLLSAI2M };
        const HSERTCDevisor = HSERTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const LCDOutput = LCDOutputType{};
        pub const IWDGOutput = IWDGOutputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART2Mult = USART2MultType{ .value = conf.USART2Mult };
        pub const USART2output = USART2outputType{};
        const USART3Mult = USART3MultType{ .value = conf.USART3Mult };
        pub const USART3output = USART3outputType{};
        const UART4Mult = UART4MultType{ .value = conf.UART4Mult };
        pub const UART4output = UART4outputType{};
        const UART5Mult = UART5MultType{ .value = conf.UART5Mult };
        pub const UART5output = UART5outputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const LPTIM2Mult = LPTIM2MultType{ .value = conf.LPTIM2Mult };
        pub const LPTIM2output = LPTIM2outputType{};
        const DFSDMMult = DFSDMMultType{ .value = conf.DFSDMMult };
        pub const DFSDMoutput = DFSDMoutputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        pub const ADCoutput = ADCoutputType{};
        const CK48Mult = CK48MultType{ .value = conf.CK48Mult };
        pub const CK48output = CK48outputType{};
        pub const RNGoutput = RNGoutputType{};
        const SDMMC1Mult = SDMMC1MultType{ .value = conf.SDMMC1Mult };
        pub const SDMMCC1Output = SDMMCC1OutputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANOutput = FDCANOutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2output = I2C2outputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3output = I2C3outputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        const SAI2Mult = SAI2MultType{ .value = conf.SAI2Mult };
        pub const SAI2output = SAI2outputType{};
        const I2C4Mult = I2C4MultType{ .value = conf.I2C4Mult };
        pub const I2C4output = I2C4outputType{};
        const OCTOSPIMMult = OCTOSPIMMultType{ .value = conf.OCTOSPIMMult };
        pub const OCTOSPIMoutput = OCTOSPIMoutputType{};
        const LPTIM3Mult = LPTIM3MultType{ .value = conf.LPTIM3Mult };
        pub const LPTIM3output = LPTIM3outputType{};
        const DFSDMAudioMult = DFSDMAudioMultType{ .value = conf.DFSDMAudioMult };
        pub const DFSDMAudiooutput = DFSDMAudiooutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const LSCOMult = LSCOMultType{ .value = conf.LSCOMult };
        pub const LSCOOutput = LSCOOutputType{};
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
        pub const UCPD1Output = UCPD1OutputType{};
        const PLLN = PLLNType{ .value = conf.PLLN };
        const PLLP = PLLPType{ .value = conf.PLLP };
        pub const PLLPoutput = PLLPoutputType{};
        const PLLQ = PLLQType{ .value = conf.PLLQ };
        pub const PLLQoutput = PLLQoutputType{};
        const PLLR = PLLRType{ .value = conf.PLLR };
        const PLLSAI1N = PLLSAI1NType{ .value = conf.PLLSAI1N };
        const PLLSAI1P = PLLSAI1PType{ .value = conf.PLLSAI1P };
        pub const PLLSAI1Poutput = PLLSAI1PoutputType{};
        const PLLSAI1Q = PLLSAI1QType{ .value = conf.PLLSAI1Q };
        pub const PLLSAI1Qoutput = PLLSAI1QoutputType{};
        const PLLSAI1R = PLLSAI1RType{ .value = conf.PLLSAI1R };
        pub const PLLSAI1Routput = PLLSAI1RoutputType{};
        const PLLSAI2N = PLLSAI2NType{ .value = conf.PLLSAI2N };
        const PLLSAI2P = PLLSAI2PType{ .value = conf.PLLSAI2P };
        pub const PLLSAI2Poutput = PLLSAI2PoutputType{};

        pub fn validate() void {
            _ = CRSCLKoutput.get();
            _ = RTCOutput.get();
            _ = IWDGOutput.get();
            _ = USART1output.get();
            _ = USART2output.get();
            _ = USART3output.get();
            _ = UART4output.get();
            _ = UART5output.get();
            _ = LPUART1output.get();
            _ = LPTIM1output.get();
            _ = LPTIM2output.get();
            _ = DFSDMoutput.get();
            _ = ADCoutput.get();
            _ = CK48output.get();
            _ = RNGoutput.get();
            _ = SDMMCC1Output.get();
            _ = FDCANOutput.get();
            _ = I2C1output.get();
            _ = I2C2output.get();
            _ = I2C3output.get();
            _ = SAI1output.get();
            _ = SAI2output.get();
            _ = I2C4output.get();
            _ = OCTOSPIMoutput.get();
            _ = LPTIM3output.get();
            _ = DFSDMAudiooutput.get();
            _ = PWRCLKoutput.get();
            _ = AHBOutput.get();
            _ = HCLKOutput.get();
            _ = CortexSysOutput.get();
            _ = FCLKCortexOutput.get();
            _ = APB1Output.get();
            _ = TimPrescOut1.get();
            _ = APB2Output.get();
            _ = TimPrescOut2.get();
        }
    };

    return ClockStruct;
}
