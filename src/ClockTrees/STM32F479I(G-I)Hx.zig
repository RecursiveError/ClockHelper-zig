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
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const USBMultConf = enum {
    PLLQ,
    PLLSAIP,
};
pub const SDIOMultConf = enum {
    SysCLKOutput,
    USBMult,
};
pub const SAIAMultConf = enum {
    I2S_CKIN,
    PLLI2SQDiv,
    PLLSAIQDiv,
};
pub const SAIBMultConf = enum {
    I2S_CKIN,
    PLLI2SQDiv,
    PLLSAIQDiv,
};
pub const I2SMultConf = enum {
    PLLI2SR,
    I2S_CKIN,
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
pub const DSIMultConf = enum {
    PLLRoutput,
    DSIPHYPrescaler,
};
pub const DSITXPrescalerConf = enum(u32) {
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
pub const PLLSAIPConf = enum {
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
pub const PLLSAIQDivConf = enum(u32) {
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
pub const PLLSAIRDivConf = enum {
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
pub const PLLI2SQDivConf = enum(u32) {
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
pub const PLLDSIIDFConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
        };
    }
};
pub const PLLDSINDIVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 125;
    }

    pub fn min() f32 {
        return 10;
    }
};
pub const PLLDSIODFConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIRC,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(16),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    USBMult: USBMultConf = .PLLQ,
    SDIOMult: SDIOMultConf = .USBMult,
    SAIAMult: SAIAMultConf = .PLLSAIQDiv,
    SAIBMult: SAIBMultConf = .PLLSAIQDiv,
    I2SMult: I2SMultConf = .PLLI2SR,
    MCO1Mult: MCO1MultConf = .HSIRC,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysClkSource,
    MCO2Div: MCO2DivConf = .DIV1,
    DSIMult: DSIMultConf = .DSIPHYPrescaler,
    DSITXPrescaler: DSITXPrescalerConf = @enumFromInt(4),
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = @enumFromInt(4),
    PLLR: PLLRConf = @enumFromInt(2),
    PLLSAIN: PLLSAINConf = @enumFromInt(192),
    PLLSAIP: PLLSAIPConf = .DIV2,
    PLLSAIQ: PLLSAIQConf = @enumFromInt(4),
    PLLSAIQDiv: PLLSAIQDivConf = @enumFromInt(1),
    PLLSAIR: PLLSAIRConf = @enumFromInt(2),
    PLLSAIRDiv: PLLSAIRDivConf = .DIV2,
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SQ: PLLI2SQConf = @enumFromInt(4),
    PLLI2SQDiv: PLLI2SQDivConf = @enumFromInt(1),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
    PLLDSIIDF: PLLDSIIDFConf = .DIV1,
    PLLDSINDIV: PLLDSINDIVConf = @enumFromInt(20),
    PLLDSIODF: PLLDSIODFConf = .DIV1,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    I2S_CKIN: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    SDIOMult: ClockNode,
    SDIOoutput: ClockNode,
    SAIAMult: ClockNode,
    SAIAoutput: ClockNode,
    SAIBMult: ClockNode,
    SAIBoutput: ClockNode,
    I2SMult: ClockNode,
    I2Soutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    DSIPHYPrescaler: ClockNode,
    DSIMult: ClockNode,
    DSIoutput: ClockNode,
    DSITXPrescaler: ClockNode,
    DSITXCLKEsc: ClockNode,
    AHBPrescaler: ClockNode,
    EthernetPtpOutput: ClockNode,
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
    @"LCD-TFTCLKOutput": ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLR: ClockNode,
    PLLRoutput: ClockNode,
    PLLSAIN: ClockNode,
    PLLSAIP: ClockNode,
    PLLSAIQ: ClockNode,
    PLLSAIQDiv: ClockNode,
    PLLSAIR: ClockNode,
    PLLSAIRDiv: ClockNode,
    PLLI2SN: ClockNode,
    PLLI2SQ: ClockNode,
    PLLI2SQDiv: ClockNode,
    PLLI2SR: ClockNode,
    PLLDSIIDF: ClockNode,
    PLLDSIMultiplicator: ClockNode,
    PLLDSINDIV: ClockNode,
    VCOoutput: ClockNode,
    PLLDSIDevisor: ClockNode,
    PLLDSIODF: ClockNode,
    PLLDSIoutput: ClockNode,

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
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = .{ .div = .{ .value = config.PLLQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLLSAIN: ClockNode = .{
            .name = "PLLSAIN",
            .Nodetype = .{ .mul = .{ .value = config.PLLSAIN.get(), .limit = .{ .max = 432, .min = 50 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLSAIP: ClockNode = .{
            .name = "PLLSAIP",
            .Nodetype = .{ .div = .{ .value = config.PLLSAIP.get() } },
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const USBMult: ClockNode = .{
            .name = "USBMult",

            .Nodetype = .{ .multi = @intFromEnum(config.USBMult) },
            .parents = &[_]*const ClockNode{
                &PLLQ,
                &PLLSAIP,
            },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = null },
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
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDIOMult},
        };
        const PLLI2SN: ClockNode = .{
            .name = "PLLI2SN",
            .Nodetype = .{ .mul = .{ .value = config.PLLI2SN.get(), .limit = .{ .max = 432, .min = 50 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLI2SQ: ClockNode = .{
            .name = "PLLI2SQ",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const PLLI2SQDiv: ClockNode = .{
            .name = "PLLI2SQDiv",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SQDiv.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLI2SQ},
        };
        const PLLSAIQ: ClockNode = .{
            .name = "PLLSAIQ",
            .Nodetype = .{ .div = .{ .value = config.PLLSAIQ.get(), .limit = .{ .max = 15, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAIQDiv: ClockNode = .{
            .name = "PLLSAIQDiv",
            .Nodetype = .{ .div = .{ .value = config.PLLSAIQDiv.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLSAIQ},
        };
        const SAIAMult: ClockNode = .{
            .name = "SAIAMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAIAMult) },
            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &PLLI2SQDiv,
                &PLLSAIQDiv,
            },
        };
        const SAIAoutput: ClockNode = .{
            .name = "SAIAoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAIAMult},
        };
        const SAIBMult: ClockNode = .{
            .name = "SAIBMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAIBMult) },
            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &PLLI2SQDiv,
                &PLLSAIQDiv,
            },
        };
        const SAIBoutput: ClockNode = .{
            .name = "SAIBoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAIBMult},
        };
        const PLLI2SR: ClockNode = .{
            .name = "PLLI2SR",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SR.get(), .limit = .{ .max = 7, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const I2SMult: ClockNode = .{
            .name = "I2SMult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2SMult) },
            .parents = &[_]*const ClockNode{
                &PLLI2SR,
                &I2S_CKIN,
            },
        };
        const I2Soutput: ClockNode = .{
            .name = "I2Soutput",
            .Nodetype = .{ .output = .{ .max = 192000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2SMult},
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
        const PLLDSIIDF: ClockNode = .{
            .name = "PLLDSIIDF",
            .Nodetype = .{ .div = .{ .value = config.PLLDSIIDF.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLDSIMultiplicator: ClockNode = .{
            .name = "PLLDSIMultiplicator",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLDSIIDF},
        };
        const PLLDSINDIV: ClockNode = .{
            .name = "PLLDSINDIV",
            .Nodetype = .{ .mul = .{ .value = config.PLLDSINDIV.get(), .limit = .{ .max = 125, .min = 10 } } },
            .parents = &[_]*const ClockNode{&PLLDSIMultiplicator},
        };
        const VCOoutput: ClockNode = .{
            .name = "VCOoutput",
            .Nodetype = .{ .output = .{ .max = 1000000000, .min = 500000000 } },
            .parents = &[_]*const ClockNode{&PLLDSINDIV},
        };
        const PLLDSIDevisor: ClockNode = .{
            .name = "PLLDSIDevisor",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&VCOoutput},
        };
        const PLLDSIODF: ClockNode = .{
            .name = "PLLDSIODF",
            .Nodetype = .{ .div = .{ .value = config.PLLDSIODF.get() } },
            .parents = &[_]*const ClockNode{&PLLDSIDevisor},
        };
        const DSIPHYPrescaler: ClockNode = .{
            .name = "DSIPHYPrescaler",
            .Nodetype = .{ .div = .{ .value = 8 } },
            .parents = &[_]*const ClockNode{&PLLDSIODF},
        };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = .{ .div = .{ .value = config.PLLR.get(), .limit = .{ .max = 7, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLLRoutput: ClockNode = .{
            .name = "PLLRoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLR},
        };
        const DSIMult: ClockNode = .{
            .name = "DSIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DSIMult) },
            .parents = &[_]*const ClockNode{
                &PLLRoutput,
                &DSIPHYPrescaler,
            },
        };
        const DSIoutput: ClockNode = .{
            .name = "DSIoutput",
            .Nodetype = .{ .output = .{ .max = 62500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&DSIMult},
        };
        const DSITXPrescaler: ClockNode = .{
            .name = "DSITXPrescaler",
            .Nodetype = .{ .div = .{ .value = config.DSITXPrescaler.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DSIMult},
        };
        const DSITXCLKEsc: ClockNode = .{
            .name = "DSITXCLKEsc",
            .Nodetype = .{ .output = .{ .max = 20000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&DSITXPrescaler},
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
            .Nodetype = .{ .output = .{ .max = 90000000, .min = 0 } },
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
        const PLLSAIR: ClockNode = .{
            .name = "PLLSAIR",
            .Nodetype = .{ .div = .{ .value = config.PLLSAIR.get(), .limit = .{ .max = 7, .min = 2 } } },
            .parents = &[_]*const ClockNode{&PLLSAIN},
        };
        const PLLSAIRDiv: ClockNode = .{
            .name = "PLLSAIRDiv",
            .Nodetype = .{ .div = .{ .value = config.PLLSAIRDiv.get() } },
            .parents = &[_]*const ClockNode{&PLLSAIR},
        };
        const @"LCD-TFTCLKOutput": ClockNode = .{
            .name = "LCD-TFTCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSAIRDiv},
        };
        const PLLDSIoutput: ClockNode = .{
            .name = "PLLDSIoutput",
            .Nodetype = .{ .output = .{ .max = 500000000, .min = 80000000 } },
            .parents = &[_]*const ClockNode{&PLLDSIODF},
        };
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .I2S_CKIN = I2S_CKIN,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .SDIOMult = SDIOMult,
            .SDIOoutput = SDIOoutput,
            .SAIAMult = SAIAMult,
            .SAIAoutput = SAIAoutput,
            .SAIBMult = SAIBMult,
            .SAIBoutput = SAIBoutput,
            .I2SMult = I2SMult,
            .I2Soutput = I2Soutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .DSIPHYPrescaler = DSIPHYPrescaler,
            .DSIMult = DSIMult,
            .DSIoutput = DSIoutput,
            .DSITXPrescaler = DSITXPrescaler,
            .DSITXCLKEsc = DSITXCLKEsc,
            .AHBPrescaler = AHBPrescaler,
            .EthernetPtpOutput = EthernetPtpOutput,
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
            .@"LCD-TFTCLKOutput" = @"LCD-TFTCLKOutput",
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLR = PLLR,
            .PLLRoutput = PLLRoutput,
            .PLLSAIN = PLLSAIN,
            .PLLSAIP = PLLSAIP,
            .PLLSAIQ = PLLSAIQ,
            .PLLSAIQDiv = PLLSAIQDiv,
            .PLLSAIR = PLLSAIR,
            .PLLSAIRDiv = PLLSAIRDiv,
            .PLLI2SN = PLLI2SN,
            .PLLI2SQ = PLLI2SQ,
            .PLLI2SQDiv = PLLI2SQDiv,
            .PLLI2SR = PLLI2SR,
            .PLLDSIIDF = PLLDSIIDF,
            .PLLDSIMultiplicator = PLLDSIMultiplicator,
            .PLLDSINDIV = PLLDSINDIV,
            .VCOoutput = VCOoutput,
            .PLLDSIDevisor = PLLDSIDevisor,
            .PLLDSIODF = PLLDSIODF,
            .PLLDSIoutput = PLLDSIoutput,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.USBoutput.get_comptime();
        _ = self.SDIOoutput.get_comptime();
        _ = self.SAIAoutput.get_comptime();
        _ = self.SAIBoutput.get_comptime();
        _ = self.I2Soutput.get_comptime();
        _ = self.DSIoutput.get_comptime();
        _ = self.DSITXCLKEsc.get_comptime();
        _ = self.EthernetPtpOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.@"LCD-TFTCLKOutput".get_comptime();
    }
};
