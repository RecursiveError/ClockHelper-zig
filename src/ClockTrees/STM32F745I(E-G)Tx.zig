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
pub const LSIRCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 47000;
    }

    pub fn min() f32 {
        return 17000;
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
pub const I2C4MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const PLL48MultConf = enum {
    PLLQ,
    PLLSAIP,
};
pub const SAI1MultConf = enum {
    PLLSAIQDiv,
    PLLI2SQDiv,
    I2S_CKIN,
};
pub const SAI2MultConf = enum {
    PLLSAIQDiv,
    PLLI2SQDiv,
    I2S_CKIN,
};
pub const I2SMultConf = enum {
    PLLI2SR,
    I2S_CKIN,
};
pub const SDMMCMultConf = enum {
    PLL48Mult,
    SysCLKOutput,
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
pub const USART6MultConf = enum {
    APB2Prescaler,
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
pub const UART7MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const UART8MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    APB1Prescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const CECMultConf = enum {
    HSIDivCEC,
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
pub const PLLI2SPConf = enum {
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
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIRC,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(16),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB1Prescaler,
    I2C4Mult: I2C4MultConf = .APB1Prescaler,
    PLL48Mult: PLL48MultConf = .PLLQ,
    SAI1Mult: SAI1MultConf = .PLLSAIQDiv,
    SAI2Mult: SAI2MultConf = .PLLSAIQDiv,
    I2SMult: I2SMultConf = .PLLI2SR,
    SDMMCMult: SDMMCMultConf = .SysCLKOutput,
    MCO1Mult: MCO1MultConf = .HSIRC,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysClkSource,
    MCO2Div: MCO2DivConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    USART6Mult: USART6MultConf = .APB2Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    UART7Mult: UART7MultConf = .APB1Prescaler,
    UART8Mult: UART8MultConf = .APB1Prescaler,
    LPTIM1Mult: LPTIM1MultConf = .APB1Prescaler,
    CECMult: CECMultConf = .HSIDivCEC,
    PLLN: PLLNConf = @enumFromInt(192),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = @enumFromInt(2),
    PLLSAIN: PLLSAINConf = @enumFromInt(192),
    PLLSAIP: PLLSAIPConf = .DIV2,
    PLLSAIQ: PLLSAIQConf = @enumFromInt(2),
    PLLSAIQDiv: PLLSAIQDivConf = @enumFromInt(1),
    PLLSAIR: PLLSAIRConf = @enumFromInt(2),
    PLLSAIRDiv: PLLSAIRDivConf = .DIV2,
    PLLI2SN: PLLI2SNConf = @enumFromInt(192),
    PLLI2SP: PLLI2SPConf = .DIV2,
    PLLI2SQ: PLLI2SQConf = @enumFromInt(2),
    PLLI2SQDiv: PLLI2SQDivConf = @enumFromInt(1),
    PLLI2SR: PLLI2SRConf = @enumFromInt(2),
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
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    PLL48Mult: ClockNode,
    RNGoutput: ClockNode,
    USBoutput: ClockNode,
    SPDIFoutput: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    I2SMult: ClockNode,
    I2Soutput: ClockNode,
    SDMMCMult: ClockNode,
    SDMMCoutput: ClockNode,
    EthernetPtpOutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    AHBPrescaler: ClockNode,
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
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    USART6Mult: ClockNode,
    USART6output: ClockNode,
    UART4Mult: ClockNode,
    UART4output: ClockNode,
    UART5Mult: ClockNode,
    UART5output: ClockNode,
    UART7Mult: ClockNode,
    UART7output: ClockNode,
    UART8Mult: ClockNode,
    UART8output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1Output: ClockNode,
    HSIDivCEC: ClockNode,
    CECMult: ClockNode,
    CECOutput: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLSAIN: ClockNode,
    PLLSAIP: ClockNode,
    PLLSAIoutput: ClockNode,
    PLLSAIQ: ClockNode,
    PLLSAIQDiv: ClockNode,
    PLLSAIR: ClockNode,
    PLLSAIRDiv: ClockNode,
    PLLI2SN: ClockNode,
    PLLI2SP: ClockNode,
    PLLI2SQ: ClockNode,
    PLLI2SQDiv: ClockNode,
    PLLI2SR: ClockNode,
    PLLI2SRoutput: ClockNode,

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
            .Nodetype = .{ .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 47000, .min = 17000 },
            } },
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
            .Nodetype = .{ .output = null },
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
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 216000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB1Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C3Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C4Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C4Mult},
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
        const PLL48Mult: ClockNode = .{
            .name = "PLL48Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL48Mult) },
            .parents = &[_]*const ClockNode{
                &PLLQ,
                &PLLSAIP,
            },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&PLL48Mult},
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL48Mult},
        };
        const PLLI2SN: ClockNode = .{
            .name = "PLLI2SN",
            .Nodetype = .{ .mul = .{ .value = config.PLLI2SN.get(), .limit = .{ .max = 432, .min = 50 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLI2SP: ClockNode = .{
            .name = "PLLI2SP",
            .Nodetype = .{ .div = .{ .value = config.PLLI2SP.get() } },
            .parents = &[_]*const ClockNode{&PLLI2SN},
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .Nodetype = .{ .output = .{ .max = 0, .min = 5632000 } },
            .parents = &[_]*const ClockNode{&PLLI2SP},
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
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1Mult) },
            .parents = &[_]*const ClockNode{
                &PLLSAIQDiv,
                &PLLI2SQDiv,
                &I2S_CKIN,
            },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI2Mult) },
            .parents = &[_]*const ClockNode{
                &PLLSAIQDiv,
                &PLLI2SQDiv,
                &I2S_CKIN,
            },
        };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI2Mult},
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
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2SMult},
        };
        const SDMMCMult: ClockNode = .{
            .name = "SDMMCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMCMult) },
            .parents = &[_]*const ClockNode{
                &PLL48Mult,
                &SysCLKOutput,
            },
        };
        const SDMMCoutput: ClockNode = .{
            .name = "SDMMCoutput",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMCMult},
        };
        const EthernetPtpOutput: ClockNode = .{
            .name = "EthernetPtpOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
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
            .Nodetype = .{ .output = null },
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
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCO2Div},
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
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 54000000, .min = 0 } },
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
            .Nodetype = .{ .output = .{ .max = 108000000, .min = 0 } },
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
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART3Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART6Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART4Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART5Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const UART7Mult: ClockNode = .{
            .name = "UART7Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART7Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART7output: ClockNode = .{
            .name = "UART7output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART7Mult},
        };
        const UART8Mult: ClockNode = .{
            .name = "UART8Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART8Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART8output: ClockNode = .{
            .name = "UART8output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART8Mult},
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIRC,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM1Output: ClockNode = .{
            .name = "LPTIM1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const HSIDivCEC: ClockNode = .{
            .name = "HSIDivCEC",
            .Nodetype = .{ .div = .{ .value = 488 } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CECMult) },
            .parents = &[_]*const ClockNode{
                &HSIDivCEC,
                &LSEOSC,
            },
        };
        const CECOutput: ClockNode = .{
            .name = "CECOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const PLLSAIoutput: ClockNode = .{
            .name = "PLLSAIoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSAIP},
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
        const PLLI2SRoutput: ClockNode = .{
            .name = "PLLI2SRoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLI2SR},
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
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .PLL48Mult = PLL48Mult,
            .RNGoutput = RNGoutput,
            .USBoutput = USBoutput,
            .SPDIFoutput = SPDIFoutput,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .I2SMult = I2SMult,
            .I2Soutput = I2Soutput,
            .SDMMCMult = SDMMCMult,
            .SDMMCoutput = SDMMCoutput,
            .EthernetPtpOutput = EthernetPtpOutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .AHBPrescaler = AHBPrescaler,
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
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .USART6Mult = USART6Mult,
            .USART6output = USART6output,
            .UART4Mult = UART4Mult,
            .UART4output = UART4output,
            .UART5Mult = UART5Mult,
            .UART5output = UART5output,
            .UART7Mult = UART7Mult,
            .UART7output = UART7output,
            .UART8Mult = UART8Mult,
            .UART8output = UART8output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1Output = LPTIM1Output,
            .HSIDivCEC = HSIDivCEC,
            .CECMult = CECMult,
            .CECOutput = CECOutput,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLSAIN = PLLSAIN,
            .PLLSAIP = PLLSAIP,
            .PLLSAIoutput = PLLSAIoutput,
            .PLLSAIQ = PLLSAIQ,
            .PLLSAIQDiv = PLLSAIQDiv,
            .PLLSAIR = PLLSAIR,
            .PLLSAIRDiv = PLLSAIRDiv,
            .PLLI2SN = PLLI2SN,
            .PLLI2SP = PLLI2SP,
            .PLLI2SQ = PLLI2SQ,
            .PLLI2SQDiv = PLLI2SQDiv,
            .PLLI2SR = PLLI2SR,
            .PLLI2SRoutput = PLLI2SRoutput,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.SPDIFoutput.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.I2Soutput.get_comptime();
        _ = self.SDMMCoutput.get_comptime();
        _ = self.EthernetPtpOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.USART6output.get_comptime();
        _ = self.UART4output.get_comptime();
        _ = self.UART5output.get_comptime();
        _ = self.UART7output.get_comptime();
        _ = self.UART8output.get_comptime();
        _ = self.LPTIM1Output.get_comptime();
        _ = self.CECOutput.get_comptime();
    }
};
