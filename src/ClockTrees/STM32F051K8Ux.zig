const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const CECMultConf = enum {
    HSICECDiv,
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
pub const HSEPLLsourceDevisorConf = enum {
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
pub const USBMultConf = enum {
    PLLMUL,
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLMUL,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSIRC,
};
pub const MCOMultConf = enum {
    MCOMultDivisor,
    HSIRC,
    HSIRC14,
    HSEOSC,
    LSIRC,
    SysCLKOutput,
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
    APB1Prescaler,
};
pub const PLLSourceConf = enum {
    HSIRCDiv,
    HSEPLLsourceDevisor,
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
    CECMult: CECMultConf = .HSICECDiv,
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    HSEPLLsourceDevisor: HSEPLLsourceDevisorConf = .DIV1,
    USBMult: USBMultConf = .HSIRC48,
    SysClkSource: SysClkSourceConf = .HSIRC,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TimSysPresc: TimSysPrescConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    I2C1Mult: I2C1MultConf = .HSIRC,
    USART1Mult: USART1MultConf = .APB1Prescaler,
    PLLSource: PLLSourceConf = .HSIRCDiv,
    PLLMUL: PLLMULConf = .MUL2,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    HSIRCDiv: ClockNode,
    HSICECDiv: ClockNode,
    HSIRC14: ClockNode,
    ADCoutput: ClockNode,
    LSIRC: ClockNode,
    CECMult: ClockNode,
    CECOutput: ClockNode,
    HSEOSC: ClockNode,
    HSEPLLsourceDevisor: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    I2SOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    MCOMultDivisor: ClockNode,
    MCOMult: ClockNode,
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
    PLLSource: ClockNode,
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
        const HSIRCDiv: ClockNode = .{
            .name = "HSIRCDiv",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSICECDiv: ClockNode = .{
            .name = "HSICECDiv",
            .Nodetype = .{ .div = .{ .value = 244 } },
            .parents = &[_]*const ClockNode{&HSIRC},
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
        const CECMult: ClockNode = .{
            .name = "CECMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CECMult) },
            .parents = &[_]*const ClockNode{
                &HSICECDiv,
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
        const HSEPLLsourceDevisor: ClockNode = .{
            .name = "HSEPLLsourceDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSEPLLsourceDevisor.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSIRCDiv,
                &HSEPLLsourceDevisor,
            },
        };
        const VCO2output: ClockNode = .{
            .name = "VCO2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = .{ .mul = .{ .value = config.PLLMUL.get() } },
            .parents = &[_]*const ClockNode{&VCO2output},
        };
        const USBMult: ClockNode = .{
            .name = "USBMult",

            .Nodetype = .{ .multi = @intFromEnum(config.USBMult) },
            .parents = &[_]*const ClockNode{
                &PLLMUL,
            },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = .{ .max = 48120000, .min = 47880000 } },
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
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
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &MCOMultDivisor,
                &HSIRC,
                &HSIRC14,
                &HSEOSC,
                &LSIRC,
                &SysCLKOutput,
            },
        };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCOMult},
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
                &APB1Prescaler,
            },
        };
        const USART1Output: ClockNode = .{
            .name = "USART1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        return .{
            .HSIRC = HSIRC,
            .FLITFCLKoutput = FLITFCLKoutput,
            .HSIRCDiv = HSIRCDiv,
            .HSICECDiv = HSICECDiv,
            .HSIRC14 = HSIRC14,
            .ADCoutput = ADCoutput,
            .LSIRC = LSIRC,
            .CECMult = CECMult,
            .CECOutput = CECOutput,
            .HSEOSC = HSEOSC,
            .HSEPLLsourceDevisor = HSEPLLsourceDevisor,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .I2SOutput = I2SOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .MCOMultDivisor = MCOMultDivisor,
            .MCOMult = MCOMult,
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
            .PLLSource = PLLSource,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.CECOutput.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.I2SOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.TimSysOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.I2C1Output.get_comptime();
        _ = self.USART1Output.get_comptime();
    }
};
