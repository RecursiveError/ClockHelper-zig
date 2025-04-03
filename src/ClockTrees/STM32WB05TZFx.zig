const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const LSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 1000000;
    }

    pub fn min() f32 {
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
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    pub fn get(self: @This()) f32 {
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
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    pub fn get(self: @This()) f32 {
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
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    pub fn get(self: @This()) f32 {
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

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    PLL64RC: ClockNode,
    HSEOSC: ClockNode,
    LSEOSC: ClockNode,
    LSIRC: ClockNode,
    RC64MPLL: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    TimerOutput: ClockNode,
    CLK16MHzDiv2: ClockNode,
    CLK16MHzDiv4: ClockNode,
    CLK16MHzSource: ClockNode,
    Clk16MHzOutput: ClockNode,
    ClkSMPSDiv4: ClockNode,
    ClkSMPSDiv2: ClockNode,
    ClkSMPS: ClockNode,
    ClkSMPSOutput: ClockNode,
    LPUARTMult: ClockNode,
    ClkLPUARTOutput: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    CLK32MHzDiv1: ClockNode,
    CLK32MHzDiv2: ClockNode,
    CLK32MHzSource: ClockNode,
    Clk32MHzOutput: ClockNode,
    BLEMult: ClockNode,
    BLEOutput: ClockNode,
    SYSCLK32Prescaler: ClockNode,
    SYSCLK64Prescaler: ClockNode,
    CLKSYSMult: ClockNode,
    CLKSYSOutput: ClockNode,
    CLKI2S3Mult: ClockNode,
    CLKI2S3Output: ClockNode,
    CLKI2S2Output: ClockNode,
    CLKI2S2Mult: ClockNode,
    CLK16RTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 64000000 } },
        };
        const PLL64RC: ClockNode = .{
            .name = "PLL64RC",
            .Nodetype = .{ .source = .{ .value = 64000000 } },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 32000000, .min = 4000000 },
            } },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 1000 },
            } },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{ .value = 32000 } },
        };
        const RC64MPLL: ClockNode = .{
            .name = "RC64MPLL",

            .Nodetype = .{ .multi = @intFromEnum(config.RC64MPLL) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &PLL64RC,
            },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &RC64MPLL,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const TimerOutput: ClockNode = .{
            .name = "TimerOutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK16MHzDiv2: ClockNode = .{
            .name = "CLK16MHzDiv2",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK16MHzDiv4: ClockNode = .{
            .name = "CLK16MHzDiv4",
            .Nodetype = .{ .div = .{ .value = 4 } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK16MHzSource: ClockNode = .{
            .name = "CLK16MHzSource",

            .Nodetype = .{ .multi = @intFromEnum(config.CLK16MHzSource) },
            .parents = &[_]*const ClockNode{
                &CLK16MHzDiv2,
                &CLK16MHzDiv4,
            },
        };
        const Clk16MHzOutput: ClockNode = .{
            .name = "Clk16MHzOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CLK16MHzSource},
        };
        const ClkSMPSDiv4: ClockNode = .{
            .name = "ClkSMPSDiv4",
            .Nodetype = .{ .div = .{ .value = 4 } },
            .parents = &[_]*const ClockNode{&Clk16MHzOutput},
        };
        const ClkSMPSDiv2: ClockNode = .{
            .name = "ClkSMPSDiv2",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&Clk16MHzOutput},
        };
        const ClkSMPS: ClockNode = .{
            .name = "ClkSMPS",

            .Nodetype = .{ .multi = @intFromEnum(config.ClkSMPS) },
            .parents = &[_]*const ClockNode{
                &ClkSMPSDiv4,
                &ClkSMPSDiv2,
            },
        };
        const ClkSMPSOutput: ClockNode = .{
            .name = "ClkSMPSOutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ClkSMPS},
        };
        const LPUARTMult: ClockNode = .{
            .name = "LPUARTMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUARTMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &Clk16MHzOutput,
            },
        };
        const ClkLPUARTOutput: ClockNode = .{
            .name = "ClkLPUARTOutput",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPUARTMult},
        };
        const LSCOMult: ClockNode = .{
            .name = "LSCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LSCOMult) },
            .parents = &[_]*const ClockNode{
                &LSIRC,
                &LSEOSC,
            },
        };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const CLK32MHzDiv1: ClockNode = .{
            .name = "CLK32MHzDiv1",
            .Nodetype = .{ .div = .{ .value = 1 } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK32MHzDiv2: ClockNode = .{
            .name = "CLK32MHzDiv2",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK32MHzSource: ClockNode = .{
            .name = "CLK32MHzSource",

            .Nodetype = .{ .multi = @intFromEnum(config.CLK32MHzSource) },
            .parents = &[_]*const ClockNode{
                &CLK32MHzDiv1,
                &CLK32MHzDiv2,
            },
        };
        const Clk32MHzOutput: ClockNode = .{
            .name = "Clk32MHzOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CLK32MHzSource},
        };
        const BLEMult: ClockNode = .{
            .name = "BLEMult",

            .Nodetype = .{ .multi = @intFromEnum(config.BLEMult) },
            .parents = &[_]*const ClockNode{
                &Clk16MHzOutput,
                &Clk32MHzOutput,
            },
        };
        const BLEOutput: ClockNode = .{
            .name = "BLEOutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&BLEMult},
        };
        const SYSCLK32Prescaler: ClockNode = .{
            .name = "SYSCLK32Prescaler",
            .Nodetype = .{ .div = .{ .value = config.SYSCLK32Prescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const SYSCLK64Prescaler: ClockNode = .{
            .name = "SYSCLK64Prescaler",
            .Nodetype = .{ .div = .{ .value = config.SYSCLK64Prescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLKSYSMult: ClockNode = .{
            .name = "CLKSYSMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CLKSYSMult) },
            .parents = &[_]*const ClockNode{
                &SYSCLK32Prescaler,
                &SYSCLK64Prescaler,
            },
        };
        const CLKSYSOutput: ClockNode = .{
            .name = "CLKSYSOutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CLKSYSMult},
        };
        const CLKI2S3Mult: ClockNode = .{
            .name = "CLKI2S3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.CLKI2S3Mult) },
            .parents = &[_]*const ClockNode{
                &Clk32MHzOutput,
                &Clk16MHzOutput,
                &RC64MPLL,
            },
        };
        const CLKI2S3Output: ClockNode = .{
            .name = "CLKI2S3Output",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CLKI2S3Mult},
        };
        const CLKI2S2Mult: ClockNode = .{
            .name = "CLKI2S2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.CLKI2S2Mult) },
            .parents = &[_]*const ClockNode{
                &Clk32MHzOutput,
                &Clk16MHzOutput,
            },
        };
        const CLKI2S2Output: ClockNode = .{
            .name = "CLKI2S2Output",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CLKI2S2Mult},
        };
        const CLK16RTCDevisor: ClockNode = .{
            .name = "CLK16RTCDevisor",
            .Nodetype = .{ .div = .{ .value = 512 } },
            .parents = &[_]*const ClockNode{&Clk16MHzOutput},
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.RTCClkSource) },
            .parents = &[_]*const ClockNode{
                &CLK16RTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = .{ .output = .{ .max = 1000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &Clk16MHzOutput,
                &ClkSMPSOutput,
                &CLKSYSOutput,
                &HSEOSC,
                &HSIRC,
                &CLK16RTCDevisor,
            },
        };
        const MCODiv: ClockNode = .{
            .name = "MCODiv",
            .Nodetype = .{ .div = .{ .value = config.MCODiv.get() } },
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCODiv},
        };
        return .{
            .HSIRC = HSIRC,
            .PLL64RC = PLL64RC,
            .HSEOSC = HSEOSC,
            .LSEOSC = LSEOSC,
            .LSIRC = LSIRC,
            .RC64MPLL = RC64MPLL,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .TimerOutput = TimerOutput,
            .CLK16MHzDiv2 = CLK16MHzDiv2,
            .CLK16MHzDiv4 = CLK16MHzDiv4,
            .CLK16MHzSource = CLK16MHzSource,
            .Clk16MHzOutput = Clk16MHzOutput,
            .ClkSMPSDiv4 = ClkSMPSDiv4,
            .ClkSMPSDiv2 = ClkSMPSDiv2,
            .ClkSMPS = ClkSMPS,
            .ClkSMPSOutput = ClkSMPSOutput,
            .LPUARTMult = LPUARTMult,
            .ClkLPUARTOutput = ClkLPUARTOutput,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .CLK32MHzDiv1 = CLK32MHzDiv1,
            .CLK32MHzDiv2 = CLK32MHzDiv2,
            .CLK32MHzSource = CLK32MHzSource,
            .Clk32MHzOutput = Clk32MHzOutput,
            .BLEMult = BLEMult,
            .BLEOutput = BLEOutput,
            .SYSCLK32Prescaler = SYSCLK32Prescaler,
            .SYSCLK64Prescaler = SYSCLK64Prescaler,
            .CLKSYSMult = CLKSYSMult,
            .CLKSYSOutput = CLKSYSOutput,
            .CLKI2S3Mult = CLKI2S3Mult,
            .CLKI2S3Output = CLKI2S3Output,
            .CLKI2S2Output = CLKI2S2Output,
            .CLKI2S2Mult = CLKI2S2Mult,
            .CLK16RTCDevisor = CLK16RTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.TimerOutput.get_comptime();
        _ = self.ClkSMPSOutput.get_comptime();
        _ = self.ClkLPUARTOutput.get_comptime();
        _ = self.LSCOOutput.get_comptime();
        _ = self.BLEOutput.get_comptime();
        _ = self.CLKSYSOutput.get_comptime();
        _ = self.CLKI2S3Output.get_comptime();
        _ = self.CLKI2S2Output.get_comptime();
    }
};
