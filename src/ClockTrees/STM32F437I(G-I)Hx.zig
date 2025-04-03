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
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLP,
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
pub const I2SSrcConf = enum {
    I2S_CKIN,
    PLLI2SR,
};
pub const PLLI2SSAIDivConf = enum(u32) {
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
pub const SAI_AMuxSrcConf = enum {
    PLLI2SSAIDiv,
    I2S_CKIN,
    PLLSAISAIDiv,
};
pub const PLLSAILCDDivConf = enum {
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const PLLSAISAIDivConf = enum(u32) {
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
pub const SAI_BMuxSrcConf = enum {
    PLLI2SSAIDiv,
    I2S_CKIN,
    PLLSAISAIDiv,
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
pub const PLLSAINConf = enum(u32) {
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
pub const PLLSAIRConf = enum(u32) {
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
pub const PLLSAIQConf = enum(u32) {
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
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    SysClkSource: SysClkSourceConf = .HSIRC,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(16),
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    I2SSrc: I2SSrcConf = .PLLI2SR,
    PLLI2SSAIDiv: PLLI2SSAIDivConf = @enumFromInt(1),
    SAI_AMuxSrc: SAI_AMuxSrcConf = .PLLSAISAIDiv,
    PLLSAILCDDiv: PLLSAILCDDivConf = .DIV2,
    PLLSAISAIDiv: PLLSAISAIDivConf = @enumFromInt(1),
    SAI_BMuxSrc: SAI_BMuxSrcConf = .PLLSAISAIDiv,
    MCO1Mult: MCO1MultConf = .HSIRC,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysClkSource,
    MCO2Div: MCO2DivConf = .DIV1,
    PLLSAIN: PLLSAINConf = @enumFromInt(49),
    PLLSAIR: PLLSAIRConf = @enumFromInt(2),
    PLLSAIQ: PLLSAIQConf = @enumFromInt(4),
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = @enumFromInt(4),
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
    PLLI2SQ: PLLI2SQConf = @enumFromInt(2),
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    SysClkSource: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    AHBPrescaler: ClockNode,
    SysCLKOutput: ClockNode,
    EthernetPtpOutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    PeriphPrescaler: ClockNode,
    PeriphPrescOutput: ClockNode,
    USBOTGOutput: ClockNode,
    I2SSrc: ClockNode,
    I2S_CKIN: ClockNode,
    I2SClocksOutput: ClockNode,
    PLLI2SSAIDiv: ClockNode,
    SAI_AMuxSrc: ClockNode,
    SAI_ACLKOutput: ClockNode,
    PLLSAILCDDiv: ClockNode,
    @"LCD-TFTCLKOutput": ClockNode,
    PLLSAISAIDiv: ClockNode,
    SAI_BMuxSrc: ClockNode,
    SAI_BCLKOutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    PLLSAIN: ClockNode,
    PLLSAIR: ClockNode,
    PLLSAIQ: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLI2SN: ClockNode,
    PLLI2SR: ClockNode,
    PLLI2SQ: ClockNode,

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
            .Nodetype = .{ .output = .{ .max = 180000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const EthernetPtpOutput: ClockNode = .{
            .name = "EthernetPtpOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 180000000, .min = 0 } },
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
            .Nodetype = .{ .output = .{ .max = 45000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut: ClockNode = .{
            .name = "TimPrescOut",
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
            .Nodetype = .{ .output = .{ .max = 90000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const PeriphPrescaler: ClockNode = .{
            .name = "PeriphPrescaler",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const PeriphPrescOutput: ClockNode = .{
            .name = "PeriphPrescOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PeriphPrescaler},
        };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = .{ .div = .{ .value = config.PLLQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const USBOTGOutput: ClockNode = .{
            .name = "USBOTGOutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const PLLI2SN: ClockNode = .{
            .name = "PLLI2SN",
            .Nodetype = .{ .mul = .{ .value = config.PLLI2SN.get(), .limit = .{ .max = 432, .min = 50 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLI2SR: ClockNode = .{
            .name = "PLLI2SR",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SR.get(), .limit = .{ .max = 7, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const I2SSrc: ClockNode = .{
            .name = "I2SSrc",

            .Nodetype = .{ .multi = @intFromEnum(config.I2SSrc) },
            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &PLLI2SR,
            },
        };
        const I2SClocksOutput: ClockNode = .{
            .name = "I2SClocksOutput",
            .Nodetype = .{ .output = .{ .max = 192000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2SSrc},
        };
        const PLLI2SQ: ClockNode = .{
            .name = "PLLI2SQ",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const PLLI2SSAIDiv: ClockNode = .{
            .name = "PLLI2SSAIDiv",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SSAIDiv.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLI2SQ},
        };
        const PLLSAIN: ClockNode = .{
            .name = "PLLSAIN",
            .Nodetype = .{ .mul = .{ .value = config.PLLSAIN.get(), .limit = .{ .max = 432, .min = 50 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLSAIQ: ClockNode = .{
            .name = "PLLSAIQ",
            .Nodetype = .{ .div = .{ .value = config.PLLSAIQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAISAIDiv: ClockNode = .{
            .name = "PLLSAISAIDiv",
            .Nodetype = .{ .div = .{ .value = config.PLLSAISAIDiv.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLSAIQ},
        };
        const SAI_AMuxSrc: ClockNode = .{
            .name = "SAI_AMuxSrc",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI_AMuxSrc) },
            .parents = &[_]*const ClockNode{
                &PLLI2SSAIDiv,
                &I2S_CKIN,
                &PLLSAISAIDiv,
            },
        };
        const SAI_ACLKOutput: ClockNode = .{
            .name = "SAI_ACLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI_AMuxSrc},
        };
        const PLLSAIR: ClockNode = .{
            .name = "PLLSAIR",
            .Nodetype = .{ .div = .{ .value = config.PLLSAIR.get(), .limit = .{ .max = 7, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAILCDDiv: ClockNode = .{
            .name = "PLLSAILCDDiv",
            .Nodetype = .{ .div = .{ .value = config.PLLSAILCDDiv.get() } },
            .parents = &[_]*const ClockNode{&PLLSAIR},
        };
        const @"LCD-TFTCLKOutput": ClockNode = .{
            .name = "LCD-TFTCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSAILCDDiv},
        };
        const SAI_BMuxSrc: ClockNode = .{
            .name = "SAI_BMuxSrc",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI_BMuxSrc) },
            .parents = &[_]*const ClockNode{
                &PLLI2SSAIDiv,
                &I2S_CKIN,
                &PLLSAISAIDiv,
            },
        };
        const SAI_BCLKOutput: ClockNode = .{
            .name = "SAI_BCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI_BMuxSrc},
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
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .SysClkSource = SysClkSource,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .AHBPrescaler = AHBPrescaler,
            .SysCLKOutput = SysCLKOutput,
            .EthernetPtpOutput = EthernetPtpOutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut = TimPrescOut,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .PeriphPrescaler = PeriphPrescaler,
            .PeriphPrescOutput = PeriphPrescOutput,
            .USBOTGOutput = USBOTGOutput,
            .I2SSrc = I2SSrc,
            .I2S_CKIN = I2S_CKIN,
            .I2SClocksOutput = I2SClocksOutput,
            .PLLI2SSAIDiv = PLLI2SSAIDiv,
            .SAI_AMuxSrc = SAI_AMuxSrc,
            .SAI_ACLKOutput = SAI_ACLKOutput,
            .PLLSAILCDDiv = PLLSAILCDDiv,
            .@"LCD-TFTCLKOutput" = @"LCD-TFTCLKOutput",
            .PLLSAISAIDiv = PLLSAISAIDiv,
            .SAI_BMuxSrc = SAI_BMuxSrc,
            .SAI_BCLKOutput = SAI_BCLKOutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .PLLSAIN = PLLSAIN,
            .PLLSAIR = PLLSAIR,
            .PLLSAIQ = PLLSAIQ,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLI2SN = PLLI2SN,
            .PLLI2SR = PLLI2SR,
            .PLLI2SQ = PLLI2SQ,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.EthernetPtpOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.PeriphPrescOutput.get_comptime();
        _ = self.USBOTGOutput.get_comptime();
        _ = self.I2SClocksOutput.get_comptime();
        _ = self.SAI_ACLKOutput.get_comptime();
        _ = self.@"LCD-TFTCLKOutput".get_comptime();
        _ = self.SAI_BCLKOutput.get_comptime();
    }
};
