const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

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
        return 0;
    }
};
pub const CECMultConf = enum {
    HSICECDiv,
    LSEOSC,
};
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
    DIV1,
    DIV2,
    pub fn get(self: @This()) f32 {
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
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    pub fn get(self: @This()) f32 {
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
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV64,
    DIV128,
    DIV256,
    DIV512,
    pub fn get(self: @This()) f32 {
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
    DIV1,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV8 => 8,
        };
    }
};
pub const APB1PrescalerConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
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
    pub fn get(self: @This()) f32 {
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
    pub fn get(self: @This()) f32 {
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

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    HSICECDiv: ClockNode,
    HSIRC48: ClockNode,
    HSIRC14: ClockNode,
    ADCoutput: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    CECMult: ClockNode,
    CECOutput: ClockNode,
    HSEOSC: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    I2SOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    MCOMultDivisor: ClockNode,
    MCOMult: ClockNode,
    MCODivider: ClockNode,
    MCOoutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    TimSysPresc: ClockNode,
    TimSysOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    I2C1Mult: ClockNode,
    I2C1Output: ClockNode,
    USART1Mult: ClockNode,
    USART1Output: ClockNode,
    USART2Mult: ClockNode,
    USART2Output: ClockNode,
    USART3Mult: ClockNode,
    USART3Output: ClockNode,
    PLLSource: ClockNode,
    PLLDiv: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 8000000 } },
        };
        const FLITFCLKoutput: ClockNode = .{
            .name = "FLITFCLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSICECDiv: ClockNode = .{
            .name = "HSICECDiv",
            .Nodetype = .{ .div = .{ .value = 244 } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSIRC48: ClockNode = .{
            .name = "HSIRC48",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const HSIRC14: ClockNode = .{
            .name = "HSIRC14",
            .Nodetype = .{ .source = .{ .value = 14000000 } },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSIRC14},
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{ .value = 40000 } },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 0 },
            } },
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CECMult) },
            .parents = &[_]*const ClockNode{
                &HSICECDiv,
                &LSEOSC,
            },
        };
        const CECOutput: ClockNode = .{
            .name = "CECOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 32000000, .min = 4000000 },
            } },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSIRC48,
                &HSEOSC,
            },
        };
        const PLLDiv: ClockNode = .{
            .name = "PLLDiv",
            .Nodetype = .{ .div = .{ .value = config.PLLDiv.get() } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const VCO2output: ClockNode = .{
            .name = "VCO2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLDiv},
        };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = .{ .mul = .{ .value = config.PLLMUL.get() } },
            .parents = &[_]*const ClockNode{&VCO2output},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSIRC48,
                &HSEOSC,
                &PLLMUL,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const I2SOutput: ClockNode = .{
            .name = "I2SOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = .{ .div = .{ .value = 32 } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.RTCClkSource) },
            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const MCOMultDivisor: ClockNode = .{
            .name = "MCOMultDivisor",
            .Nodetype = .{ .div = .{ .value = config.MCOMultDivisor.get() } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &MCOMultDivisor,
                &HSIRC,
                &HSIRC48,
                &HSIRC14,
                &HSEOSC,
                &LSIRC,
                &LSEOSC,
                &SysCLKOutput,
            },
        };
        const MCODivider: ClockNode = .{
            .name = "MCODivider",
            .Nodetype = .{ .div = .{ .value = config.MCODivider.get() } },
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCODivider},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TimSysPresc: ClockNode = .{
            .name = "TimSysPresc",
            .Nodetype = .{ .div = .{ .value = config.TimSysPresc.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TimSysOutput: ClockNode = .{
            .name = "TimSysOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TimSysPresc},
        };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB1Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C1Output: ClockNode = .{
            .name = "I2C1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART1Output: ClockNode = .{
            .name = "USART1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART2Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART2Output: ClockNode = .{
            .name = "USART2Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART3Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART3Output: ClockNode = .{
            .name = "USART3Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        return .{
            .HSIRC = HSIRC,
            .FLITFCLKoutput = FLITFCLKoutput,
            .HSICECDiv = HSICECDiv,
            .HSIRC48 = HSIRC48,
            .HSIRC14 = HSIRC14,
            .ADCoutput = ADCoutput,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .CECMult = CECMult,
            .CECOutput = CECOutput,
            .HSEOSC = HSEOSC,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .I2SOutput = I2SOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .MCOMultDivisor = MCOMultDivisor,
            .MCOMult = MCOMult,
            .MCODivider = MCODivider,
            .MCOoutput = MCOoutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .TimSysPresc = TimSysPresc,
            .TimSysOutput = TimSysOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .I2C1Mult = I2C1Mult,
            .I2C1Output = I2C1Output,
            .USART1Mult = USART1Mult,
            .USART1Output = USART1Output,
            .USART2Mult = USART2Mult,
            .USART2Output = USART2Output,
            .USART3Mult = USART3Mult,
            .USART3Output = USART3Output,
            .PLLSource = PLLSource,
            .PLLDiv = PLLDiv,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.I2SOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.TimSysOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.I2C1Output.get_comptime();
        _ = self.USART1Output.get_comptime();
        _ = self.USART2Output.get_comptime();
        _ = self.USART3Output.get_comptime();
    }
};
