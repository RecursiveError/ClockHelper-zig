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
        return 26000000;
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
        return 0;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const HSERTCDevisorConf = enum {
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
    DIV17,
    DIV18,
    DIV19,
    DIV20,
    DIV21,
    DIV22,
    DIV23,
    DIV24,
    DIV25,
    DIV26,
    DIV27,
    DIV28,
    DIV29,
    DIV30,
    DIV31,
    pub fn get(self: @This()) f32 {
        return switch (self) {
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
            .DIV17 => 17,
            .DIV18 => 18,
            .DIV19 => 19,
            .DIV20 => 20,
            .DIV21 => 21,
            .DIV22 => 22,
            .DIV23 => 23,
            .DIV24 => 24,
            .DIV25 => 25,
            .DIV26 => 26,
            .DIV27 => 27,
            .DIV28 => 28,
            .DIV29 => 29,
            .DIV30 => 30,
            .DIV31 => 31,
        };
    }
};
pub const PLLSourceConf = enum {
    HSIRC,
    HSEOSC,
};
pub const PLLMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLI2SSRCConf = enum {
    PLLSource,
    I2S_CKIN,
};
pub const PLLI2SMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLP,
};
pub const MCO1MultConf = enum {
    LSEOSC,
    HSEOSC,
    HSIRC,
    PLLP,
};
pub const MCO1DivConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
        };
    }
};
pub const MCO2MultConf = enum {
    SysClkSource,
    PLLI2SR,
    HSEOSC,
    PLLP,
};
pub const MCO2DivConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
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
pub const CortexPrescalerConf = enum {
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
pub const APB2PrescalerConf = enum {
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
pub const I2S1MultConf = enum {
    PLLR,
    PLLI2SR,
    I2S_CKIN,
    PLLSource,
};
pub const I2S2MultConf = enum {
    PLLR,
    PLLI2SR,
    I2S_CKIN,
    PLLSource,
};
pub const FMPI2C1MultConf = enum {
    HSIRC,
    APB1Prescaler,
    SysCLKOutput,
};
pub const DFSDMMultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
};
pub const USBMultConf = enum {
    PLLQ,
    PLLI2SQ,
};
pub const SDIOMultConf = enum {
    SysCLKOutput,
    USBMult,
};
pub const DFSDMAudioMultConf = enum {
    I2S1Mult,
    I2S2Mult,
};
pub const DFSDM2AudioMultConf = enum {
    I2S1Mult,
    I2S2Mult,
};
pub const SAI1AMultConf = enum {
    PLLSource,
    SAI1APrescaler,
    SAI1BPrescaler,
    I2S_CKIN,
};
pub const SAI1APrescalerConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const SAI1BMultConf = enum {
    PLLSource,
    SAI1APrescaler,
    SAI1BPrescaler,
    I2S_CKIN,
};
pub const SAI1BPrescalerConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const LPTimerMultConf = enum {
    APB1Prescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 432;
    }

    pub fn min() f32 {
        return 50;
    }
};
pub const PLLPConf = enum {
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
        };
    }
};
pub const PLLQConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 15;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLRConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLI2SNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 432;
    }

    pub fn min() f32 {
        return 50;
    }
};
pub const PLLI2SQConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 15;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const PLLI2SRConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(16),
    PLLI2SSRC: PLLI2SSRCConf = .PLLSource,
    PLLI2SM: PLLI2SMConf = @enumFromInt(16),
    SysClkSource: SysClkSourceConf = .HSIRC,
    MCO1Mult: MCO1MultConf = .HSIRC,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysClkSource,
    MCO2Div: MCO2DivConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    I2S1Mult: I2S1MultConf = .PLLI2SR,
    I2S2Mult: I2S2MultConf = .PLLI2SR,
    FMPI2C1Mult: FMPI2C1MultConf = .APB1Prescaler,
    DFSDMMult: DFSDMMultConf = .APB2Prescaler,
    USBMult: USBMultConf = .PLLQ,
    SDIOMult: SDIOMultConf = .USBMult,
    DFSDMAudioMult: DFSDMAudioMultConf = .I2S1Mult,
    DFSDM2AudioMult: DFSDM2AudioMultConf = .I2S1Mult,
    SAI1AMult: SAI1AMultConf = .PLLSource,
    SAI1APrescaler: SAI1APrescalerConf = @enumFromInt(1),
    SAI1BMult: SAI1BMultConf = .PLLSource,
    SAI1BPrescaler: SAI1BPrescalerConf = @enumFromInt(1),
    LPTimerMult: LPTimerMultConf = .APB1Prescaler,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = @enumFromInt(2),
    PLLR: PLLRConf = @enumFromInt(2),
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SQ: PLLI2SQConf = @enumFromInt(2),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    I2S_CKIN: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    PLLI2SSRC: ClockNode,
    PLLI2SM: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    AHBPrescaler: ClockNode,
    PWRCLKoutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    I2S1Mult: ClockNode,
    I2S1output: ClockNode,
    I2S2Mult: ClockNode,
    I2S2output: ClockNode,
    FMPI2C1Mult: ClockNode,
    FMPI2C1output: ClockNode,
    DFSDMMult: ClockNode,
    DFSDMoutput: ClockNode,
    DFSDM2output: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    RNGoutput: ClockNode,
    SDIOMult: ClockNode,
    SDIOoutput: ClockNode,
    DFSDMAudioMult: ClockNode,
    DFSDMAudiooutput: ClockNode,
    DFSDM2AudioMult: ClockNode,
    DFSDM2Audiooutput: ClockNode,
    SAI1AMult: ClockNode,
    SAI1Aoutput: ClockNode,
    SAI1APrescaler: ClockNode,
    SAI1BMult: ClockNode,
    SAI1Boutput: ClockNode,
    SAI1BPrescaler: ClockNode,
    LPTimerMult: ClockNode,
    LPTimeroutput: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLR: ClockNode,
    PLLRoutput: ClockNode,
    PLLI2SN: ClockNode,
    PLLI2SQ: ClockNode,
    PLLI2SQoutput: ClockNode,
    PLLI2SR: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 16000000 } },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 26000000, .min = 4000000 },
            } },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{ .value = 32000 } },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 0 },
            } },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSERTCDevisor.get() } },
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
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = .{ .div = .{ .value = config.PLLM.get(), .limit = .{ .max = 63, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLI2SSRC: ClockNode = .{
            .name = "PLLI2SSRC",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLI2SSRC) },
            .parents = &[_]*const ClockNode{
                &PLLSource,
                &I2S_CKIN,
            },
        };
        const PLLI2SM: ClockNode = .{
            .name = "PLLI2SM",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SM.get(), .limit = .{ .max = 63, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLI2SSRC},
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = .{ .mul = .{ .value = config.PLLN.get(), .limit = .{ .max = 432, .min = 50 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = .{ .div = .{ .value = config.PLLP.get() } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &PLLP,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO1Mult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &HSEOSC,
                &HSIRC,
                &PLLP,
            },
        };
        const MCO1Div: ClockNode = .{
            .name = "MCO1Div",
            .Nodetype = .{ .div = .{ .value = config.MCO1Div.get() } },
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const PLLI2SN: ClockNode = .{
            .name = "PLLI2SN",
            .Nodetype = .{ .mul = .{ .value = config.PLLI2SN.get(), .limit = .{ .max = 432, .min = 50 } } },
            .parents = &[_]*const ClockNode{&PLLI2SM},
        };
        const PLLI2SR: ClockNode = .{
            .name = "PLLI2SR",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SR.get(), .limit = .{ .max = 7, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO2Mult) },
            .parents = &[_]*const ClockNode{
                &SysClkSource,
                &PLLI2SR,
                &HSEOSC,
                &PLLP,
            },
        };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .Nodetype = .{ .div = .{ .value = config.MCO2Div.get() } },
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = config.CortexPrescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB1Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
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
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB2Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2: ClockNode = .{
            .name = "TimPrescalerAPB2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = .{ .div = .{ .value = config.PLLR.get(), .limit = .{ .max = 7, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const I2S1Mult: ClockNode = .{
            .name = "I2S1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2S1Mult) },
            .parents = &[_]*const ClockNode{
                &PLLR,
                &PLLI2SR,
                &I2S_CKIN,
                &PLLSource,
            },
        };
        const I2S1output: ClockNode = .{
            .name = "I2S1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2S1Mult},
        };
        const I2S2Mult: ClockNode = .{
            .name = "I2S2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2S2Mult) },
            .parents = &[_]*const ClockNode{
                &PLLR,
                &PLLI2SR,
                &I2S_CKIN,
                &PLLSource,
            },
        };
        const I2S2output: ClockNode = .{
            .name = "I2S2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2S2Mult},
        };
        const FMPI2C1Mult: ClockNode = .{
            .name = "FMPI2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.FMPI2C1Mult) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &APB1Prescaler,
                &SysCLKOutput,
            },
        };
        const FMPI2C1output: ClockNode = .{
            .name = "FMPI2C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FMPI2C1Mult},
        };
        const DFSDMMult: ClockNode = .{
            .name = "DFSDMMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DFSDMMult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
            },
        };
        const DFSDMoutput: ClockNode = .{
            .name = "DFSDMoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DFSDMMult},
        };
        const DFSDM2output: ClockNode = .{
            .name = "DFSDM2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DFSDMMult},
        };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = .{ .div = .{ .value = config.PLLQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLLI2SQ: ClockNode = .{
            .name = "PLLI2SQ",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const USBMult: ClockNode = .{
            .name = "USBMult",

            .Nodetype = .{ .multi = @intFromEnum(config.USBMult) },
            .parents = &[_]*const ClockNode{
                &PLLQ,
                &PLLI2SQ,
            },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const SDIOMult: ClockNode = .{
            .name = "SDIOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDIOMult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &USBMult,
            },
        };
        const SDIOoutput: ClockNode = .{
            .name = "SDIOoutput",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDIOMult},
        };
        const DFSDMAudioMult: ClockNode = .{
            .name = "DFSDMAudioMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DFSDMAudioMult) },
            .parents = &[_]*const ClockNode{
                &I2S1Mult,
                &I2S2Mult,
            },
        };
        const DFSDMAudiooutput: ClockNode = .{
            .name = "DFSDMAudiooutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DFSDMAudioMult},
        };
        const DFSDM2AudioMult: ClockNode = .{
            .name = "DFSDM2AudioMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DFSDM2AudioMult) },
            .parents = &[_]*const ClockNode{
                &I2S1Mult,
                &I2S2Mult,
            },
        };
        const DFSDM2Audiooutput: ClockNode = .{
            .name = "DFSDM2Audiooutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DFSDM2AudioMult},
        };
        const SAI1APrescaler: ClockNode = .{
            .name = "SAI1APrescaler",
            .Nodetype = .{ .div = .{ .value = config.SAI1APrescaler.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLR},
        };
        const SAI1BPrescaler: ClockNode = .{
            .name = "SAI1BPrescaler",
            .Nodetype = .{ .div = .{ .value = config.SAI1BPrescaler.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLI2SR},
        };
        const SAI1AMult: ClockNode = .{
            .name = "SAI1AMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1AMult) },
            .parents = &[_]*const ClockNode{
                &PLLSource,
                &SAI1APrescaler,
                &SAI1BPrescaler,
                &I2S_CKIN,
            },
        };
        const SAI1Aoutput: ClockNode = .{
            .name = "SAI1Aoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1AMult},
        };
        const SAI1BMult: ClockNode = .{
            .name = "SAI1BMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1BMult) },
            .parents = &[_]*const ClockNode{
                &PLLSource,
                &SAI1APrescaler,
                &SAI1BPrescaler,
                &I2S_CKIN,
            },
        };
        const SAI1Boutput: ClockNode = .{
            .name = "SAI1Boutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1BMult},
        };
        const LPTimerMult: ClockNode = .{
            .name = "LPTimerMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTimerMult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIRC,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTimeroutput: ClockNode = .{
            .name = "LPTimeroutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTimerMult},
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const PLLRoutput: ClockNode = .{
            .name = "PLLRoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLR},
        };
        const PLLI2SQoutput: ClockNode = .{
            .name = "PLLI2SQoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLI2SQ},
        };
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .I2S_CKIN = I2S_CKIN,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .PLLI2SSRC = PLLI2SSRC,
            .PLLI2SM = PLLI2SM,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .AHBPrescaler = AHBPrescaler,
            .PWRCLKoutput = PWRCLKoutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .I2S1Mult = I2S1Mult,
            .I2S1output = I2S1output,
            .I2S2Mult = I2S2Mult,
            .I2S2output = I2S2output,
            .FMPI2C1Mult = FMPI2C1Mult,
            .FMPI2C1output = FMPI2C1output,
            .DFSDMMult = DFSDMMult,
            .DFSDMoutput = DFSDMoutput,
            .DFSDM2output = DFSDM2output,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .RNGoutput = RNGoutput,
            .SDIOMult = SDIOMult,
            .SDIOoutput = SDIOoutput,
            .DFSDMAudioMult = DFSDMAudioMult,
            .DFSDMAudiooutput = DFSDMAudiooutput,
            .DFSDM2AudioMult = DFSDM2AudioMult,
            .DFSDM2Audiooutput = DFSDM2Audiooutput,
            .SAI1AMult = SAI1AMult,
            .SAI1Aoutput = SAI1Aoutput,
            .SAI1APrescaler = SAI1APrescaler,
            .SAI1BMult = SAI1BMult,
            .SAI1Boutput = SAI1Boutput,
            .SAI1BPrescaler = SAI1BPrescaler,
            .LPTimerMult = LPTimerMult,
            .LPTimeroutput = LPTimeroutput,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLR = PLLR,
            .PLLRoutput = PLLRoutput,
            .PLLI2SN = PLLI2SN,
            .PLLI2SQ = PLLI2SQ,
            .PLLI2SQoutput = PLLI2SQoutput,
            .PLLI2SR = PLLI2SR,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.I2S1output.get_comptime();
        _ = self.I2S2output.get_comptime();
        _ = self.FMPI2C1output.get_comptime();
        _ = self.DFSDMoutput.get_comptime();
        _ = self.DFSDM2output.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.SDIOoutput.get_comptime();
        _ = self.DFSDMAudiooutput.get_comptime();
        _ = self.DFSDM2Audiooutput.get_comptime();
        _ = self.SAI1Aoutput.get_comptime();
        _ = self.SAI1Boutput.get_comptime();
        _ = self.LPTimeroutput.get_comptime();
    }
};
