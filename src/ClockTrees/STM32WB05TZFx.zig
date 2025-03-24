const std = @import("std");

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
pub const RC64MPLLConf = enum {
    HSIRC,
    PLL64RC,
};
pub const SysClkSourceConf = enum {
    HSEOSC,
    RC64MPLL,
};
pub const CLK16MHzSourceConf = enum {
    CLK16MHzDiv2,
    CLK16MHzDiv4,
};
pub const ClkSMPSConf = enum {
    ClkSMPSDiv4,
    ClkSMPSDiv2,
};
pub const LPUARTMultConf = enum {
    LSEOSC,
    Clk16MHzOutput,
};
pub const LSCOMultConf = enum {
    LSIRC,
    LSEOSC,
};
pub const CLK32MHzSourceConf = enum {
    CLK32MHzDiv1,
    CLK32MHzDiv2,
};
pub const BLEMultConf = enum {
    Clk16MHzOutput,
    Clk32MHzOutput,
};
pub const SYSCLK32PrescalerConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
        };
    }
};
pub const SYSCLK64PrescalerConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
        };
    }
};
pub const CLKSYSMultConf = enum {
    SYSCLK32Prescaler,
    SYSCLK64Prescaler,
};
pub const CLKI2S3MultConf = enum {
    Clk32MHzOutput,
    Clk16MHzOutput,
    RC64MPLL,
};
pub const CLKI2S2MultConf = enum {
    Clk32MHzOutput,
    Clk16MHzOutput,
};
pub const RTCClkSourceConf = enum {
    CLK16RTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const MCOMultConf = enum {
    Clk16MHzOutput,
    ClkSMPSOutput,
    CLKSYSOutput,
    HSEOSC,
    HSIRC,
    CLK16RTCDevisor,
};
pub const MCODivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(32000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RC64MPLL: RC64MPLLConf = .HSIRC,
    SysClkSource: SysClkSourceConf = .RC64MPLL,
    CLK16MHzSource: CLK16MHzSourceConf = .CLK16MHzDiv4,
    ClkSMPS: ClkSMPSConf = .ClkSMPSDiv4,
    LPUARTMult: LPUARTMultConf = .Clk16MHzOutput,
    LSCOMult: LSCOMultConf = .LSIRC,
    CLK32MHzSource: CLK32MHzSourceConf = .CLK32MHzDiv2,
    BLEMult: BLEMultConf = .Clk32MHzOutput,
    SYSCLK32Prescaler: SYSCLK32PrescalerConf = .DIV1,
    SYSCLK64Prescaler: SYSCLK64PrescalerConf = .DIV1,
    CLKSYSMult: CLKSYSMultConf = .SYSCLK64Prescaler,
    CLKI2S3Mult: CLKI2S3MultConf = .RC64MPLL,
    CLKI2S2Mult: CLKI2S2MultConf = .Clk32MHzOutput,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMult: MCOMultConf = .CLKSYSOutput,
    MCODiv: MCODivConf = .DIV1,
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 64000000;
            }
        };
        const PLL64RCType = struct {
            pub fn get(_: *const PLL64RCType) comptime_int {
                return 64000000;
            }
        };
        const HSEOSCType = struct {
            value: HSEOSCConf,
            pub fn get(comptime self: HSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const LSEOSCType = struct {
            value: LSEOSCConf,
            pub fn get(comptime self: LSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const LSIRCType = struct {
            pub fn get(_: *const LSIRCType) comptime_int {
                return 32000;
            }
        };
        const RC64MPLLType = struct {
            value: RC64MPLLConf,
            pub fn get(comptime self: RC64MPLLType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .PLL64RC => PLL64RC.get(),
                };
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSEOSC => HSEOSC.get(),
                    .RC64MPLL => RC64MPLL.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const TimerOutputType = struct {
            pub fn get(_: *const TimerOutputType) comptime_int {
                const from_input = SysCLKOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysCLKOutput on TimerOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysCLKOutput on TimerOutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CLK16MHzDiv2Type = struct {
            pub fn get(_: *const CLK16MHzDiv2Type) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for CLK16MHzDiv2\n");
                }
                const from_input = this.SysCLKOutput.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const CLK16MHzDiv4Type = struct {
            pub fn get(_: *const CLK16MHzDiv4Type) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for CLK16MHzDiv4\n");
                }
                const from_input = this.SysCLKOutput.get();
                const div = 4;
                return (from_input / div);
            }
        };

        const CLK16MHzSourceType = struct {
            value: CLK16MHzSourceConf,
            pub fn get(comptime self: CLK16MHzSourceType) comptime_int {
                return switch (self.value) {
                    .CLK16MHzDiv2 => CLK16MHzDiv2.get(),
                    .CLK16MHzDiv4 => CLK16MHzDiv4.get(),
                };
            }
        };
        const Clk16MHzOutputType = struct {
            pub fn get(_: *const Clk16MHzOutputType) comptime_int {
                return CLK16MHzSource.get();
            }
        };
        const ClkSMPSDiv4Type = struct {
            pub fn get(_: *const ClkSMPSDiv4Type) comptime_int {
                if (!@hasDecl(this, "Clk16MHzOutput")) {
                    @compileError("No Input Clk16MHzOutput for ClkSMPSDiv4\n");
                }
                const from_input = this.Clk16MHzOutput.get();
                const div = 4;
                return (from_input / div);
            }
        };

        const ClkSMPSDiv2Type = struct {
            pub fn get(_: *const ClkSMPSDiv2Type) comptime_int {
                if (!@hasDecl(this, "Clk16MHzOutput")) {
                    @compileError("No Input Clk16MHzOutput for ClkSMPSDiv2\n");
                }
                const from_input = this.Clk16MHzOutput.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const ClkSMPSType = struct {
            value: ClkSMPSConf,
            pub fn get(comptime self: ClkSMPSType) comptime_int {
                return switch (self.value) {
                    .ClkSMPSDiv4 => ClkSMPSDiv4.get(),
                    .ClkSMPSDiv2 => ClkSMPSDiv2.get(),
                };
            }
        };
        const ClkSMPSOutputType = struct {
            pub fn get(_: *const ClkSMPSOutputType) comptime_int {
                const from_input = ClkSMPS.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ClkSMPS on ClkSMPSOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ClkSMPS on ClkSMPSOutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPUARTMultType = struct {
            value: LPUARTMultConf,
            pub fn get(comptime self: LPUARTMultType) comptime_int {
                return switch (self.value) {
                    .LSEOSC => LSEOSC.get(),
                    .Clk16MHzOutput => Clk16MHzOutput.get(),
                };
            }
        };
        const ClkLPUARTOutputType = struct {
            pub fn get(_: *const ClkLPUARTOutputType) comptime_int {
                const from_input = LPUARTMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPUARTMult on ClkLPUARTOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 32000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPUARTMult on ClkLPUARTOutput | recive {d} max 32000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LSCOMultType = struct {
            value: LSCOMultConf,
            pub fn get(comptime self: LSCOMultType) comptime_int {
                return switch (self.value) {
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const LSCOOutputType = struct {
            pub fn get(_: *const LSCOOutputType) comptime_int {
                return LSCOMult.get();
            }
        };
        const CLK32MHzDiv1Type = struct {
            pub fn get(_: *const CLK32MHzDiv1Type) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for CLK32MHzDiv1\n");
                }
                const from_input = this.SysCLKOutput.get();
                const div = 1;
                return (from_input / div);
            }
        };

        const CLK32MHzDiv2Type = struct {
            pub fn get(_: *const CLK32MHzDiv2Type) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for CLK32MHzDiv2\n");
                }
                const from_input = this.SysCLKOutput.get();
                const div = 2;
                return (from_input / div);
            }
        };

        const CLK32MHzSourceType = struct {
            value: CLK32MHzSourceConf,
            pub fn get(comptime self: CLK32MHzSourceType) comptime_int {
                return switch (self.value) {
                    .CLK32MHzDiv1 => CLK32MHzDiv1.get(),
                    .CLK32MHzDiv2 => CLK32MHzDiv2.get(),
                };
            }
        };
        const Clk32MHzOutputType = struct {
            pub fn get(_: *const Clk32MHzOutputType) comptime_int {
                return CLK32MHzSource.get();
            }
        };
        const BLEMultType = struct {
            value: BLEMultConf,
            pub fn get(comptime self: BLEMultType) comptime_int {
                return switch (self.value) {
                    .Clk16MHzOutput => Clk16MHzOutput.get(),
                    .Clk32MHzOutput => Clk32MHzOutput.get(),
                };
            }
        };
        const BLEOutputType = struct {
            pub fn get(_: *const BLEOutputType) comptime_int {
                const from_input = BLEMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from BLEMult on BLEOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from BLEMult on BLEOutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SYSCLK32PrescalerType = struct {
            value: SYSCLK32PrescalerConf,

            pub fn get(self: *const SYSCLK32PrescalerType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for SYSCLK32Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const SYSCLK64PrescalerType = struct {
            value: SYSCLK64PrescalerConf,

            pub fn get(self: *const SYSCLK64PrescalerType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for SYSCLK64Prescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CLKSYSMultType = struct {
            value: CLKSYSMultConf,
            pub fn get(comptime self: CLKSYSMultType) comptime_int {
                return switch (self.value) {
                    .SYSCLK32Prescaler => SYSCLK32Prescaler.get(),
                    .SYSCLK64Prescaler => SYSCLK64Prescaler.get(),
                };
            }
        };
        const CLKSYSOutputType = struct {
            pub fn get(_: *const CLKSYSOutputType) comptime_int {
                const from_input = CLKSYSMult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CLKSYSMult on CLKSYSOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CLKSYSMult on CLKSYSOutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CLKI2S3MultType = struct {
            value: CLKI2S3MultConf,
            pub fn get(comptime self: CLKI2S3MultType) comptime_int {
                return switch (self.value) {
                    .Clk32MHzOutput => Clk32MHzOutput.get(),
                    .Clk16MHzOutput => Clk16MHzOutput.get(),
                    .RC64MPLL => RC64MPLL.get(),
                };
            }
        };
        const CLKI2S3OutputType = struct {
            pub fn get(_: *const CLKI2S3OutputType) comptime_int {
                const from_input = CLKI2S3Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CLKI2S3Mult on CLKI2S3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CLKI2S3Mult on CLKI2S3Output | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CLKI2S2OutputType = struct {
            pub fn get(_: *const CLKI2S2OutputType) comptime_int {
                const from_input = CLKI2S2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from CLKI2S2Mult on CLKI2S2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from CLKI2S2Mult on CLKI2S2Output | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CLKI2S2MultType = struct {
            value: CLKI2S2MultConf,
            pub fn get(comptime self: CLKI2S2MultType) comptime_int {
                return switch (self.value) {
                    .Clk32MHzOutput => Clk32MHzOutput.get(),
                    .Clk16MHzOutput => Clk16MHzOutput.get(),
                };
            }
        };
        const CLK16RTCDevisorType = struct {
            pub fn get(_: *const CLK16RTCDevisorType) comptime_int {
                if (!@hasDecl(this, "Clk16MHzOutput")) {
                    @compileError("No Input Clk16MHzOutput for CLK16RTCDevisor\n");
                }
                const from_input = this.Clk16MHzOutput.get();
                const div = 512;
                return (from_input / div);
            }
        };

        const RTCClkSourceType = struct {
            value: RTCClkSourceConf,
            pub fn get(comptime self: RTCClkSourceType) comptime_int {
                return switch (self.value) {
                    .CLK16RTCDevisor => CLK16RTCDevisor.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const RTCOutputType = struct {
            pub fn get(_: *const RTCOutputType) comptime_int {
                const from_input = RTCClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RTCClkSource on RTCOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RTCClkSource on RTCOutput | recive {d} max 1000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .Clk16MHzOutput => Clk16MHzOutput.get(),
                    .ClkSMPSOutput => ClkSMPSOutput.get(),
                    .CLKSYSOutput => CLKSYSOutput.get(),
                    .HSEOSC => HSEOSC.get(),
                    .HSIRC => HSIRC.get(),
                    .CLK16RTCDevisor => CLK16RTCDevisor.get(),
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
        const HSIRC = HSIRCType{};
        const PLL64RC = PLL64RCType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const LSIRC = LSIRCType{};
        const RC64MPLL = RC64MPLLType{ .value = conf.RC64MPLL };
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        pub const TimerOutput = TimerOutputType{};
        const CLK16MHzDiv2 = CLK16MHzDiv2Type{};
        const CLK16MHzDiv4 = CLK16MHzDiv4Type{};
        const CLK16MHzSource = CLK16MHzSourceType{ .value = conf.CLK16MHzSource };
        pub const Clk16MHzOutput = Clk16MHzOutputType{};
        const ClkSMPSDiv4 = ClkSMPSDiv4Type{};
        const ClkSMPSDiv2 = ClkSMPSDiv2Type{};
        const ClkSMPS = ClkSMPSType{ .value = conf.ClkSMPS };
        pub const ClkSMPSOutput = ClkSMPSOutputType{};
        const LPUARTMult = LPUARTMultType{ .value = conf.LPUARTMult };
        pub const ClkLPUARTOutput = ClkLPUARTOutputType{};
        const LSCOMult = LSCOMultType{ .value = conf.LSCOMult };
        pub const LSCOOutput = LSCOOutputType{};
        const CLK32MHzDiv1 = CLK32MHzDiv1Type{};
        const CLK32MHzDiv2 = CLK32MHzDiv2Type{};
        const CLK32MHzSource = CLK32MHzSourceType{ .value = conf.CLK32MHzSource };
        pub const Clk32MHzOutput = Clk32MHzOutputType{};
        const BLEMult = BLEMultType{ .value = conf.BLEMult };
        pub const BLEOutput = BLEOutputType{};
        const SYSCLK32Prescaler = SYSCLK32PrescalerType{ .value = conf.SYSCLK32Prescaler };
        const SYSCLK64Prescaler = SYSCLK64PrescalerType{ .value = conf.SYSCLK64Prescaler };
        const CLKSYSMult = CLKSYSMultType{ .value = conf.CLKSYSMult };
        pub const CLKSYSOutput = CLKSYSOutputType{};
        const CLKI2S3Mult = CLKI2S3MultType{ .value = conf.CLKI2S3Mult };
        pub const CLKI2S3Output = CLKI2S3OutputType{};
        pub const CLKI2S2Output = CLKI2S2OutputType{};
        const CLKI2S2Mult = CLKI2S2MultType{ .value = conf.CLKI2S2Mult };
        const CLK16RTCDevisor = CLK16RTCDevisorType{};
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};

        pub fn validate() void {
            _ = TimerOutput.get();
            _ = ClkSMPSOutput.get();
            _ = ClkLPUARTOutput.get();
            _ = LSCOOutput.get();
            _ = BLEOutput.get();
            _ = CLKSYSOutput.get();
            _ = CLKI2S3Output.get();
            _ = CLKI2S2Output.get();
        }
    };

    return ClockStruct;
}
