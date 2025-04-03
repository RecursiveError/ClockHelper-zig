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
        return 48000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const LSIMultConf = enum {
    LSIRC,
    LSI2RC,
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
pub const MSIRCConf = enum {
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
    pub fn get(self: @This()) f32 {
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
pub const HCLKRFMultConf = enum {
    HCLKRFMultDiv,
    HSIRC,
};
pub const LPTIM1MultConf = enum {
    APB1Prescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const LSCOMultConf = enum {
    LSIRC,
    LSEOSC,
};
pub const HSEPRESCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 2;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const SysClkSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEPRESC,
    PLLR,
};
pub const PLLSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEPRESC,
};
pub const PLLMConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
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
        };
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
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
pub const SMPSMultConf = enum {
    MSIRC,
    HSEOSC,
    HSIRC,
};
pub const SMPSDividerConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV6,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV6 => 6,
        };
    }
};
pub const LPTIM2MultConf = enum {
    APB1Prescaler,
    LSIRC,
    HSIRC,
    LSEOSC,
};
pub const RFWKPClkSourceConf = enum {
    HSERFWKPDevisor,
    LSEOSC,
};
pub const CK48MultConf = enum {
    PLLSAI1Q,
    PLLQ,
    MSIRC,
    HSI48RC,
};
pub const RNGMultConf = enum {
    RNGDiv,
    LSIRC,
    LSEOSC,
};
pub const I2C1MultConf = enum {
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
    PLLP,
    HSIRC,
    SAI1_EXT,
};
pub const ADCMultConf = enum {
    PLLSAI1R,
    PLLP,
    SysCLKOutput,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRC,
    PLLR,
    SysCLKOutput,
    MSIRC,
    HSI48RC,
};
pub const MCODivConf = enum {
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
pub const AHB3PrescalerConf = enum {
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
pub const AHB2PrescalerConf = enum {
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
pub const Cortex2PrescalerConf = enum {
    DIV1,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV8 => 8,
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
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 86;
    }

    pub fn min() f32 {
        return 8;
    }
};
pub const PLLPConf = enum {
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
pub const PLLQConf = enum {
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
        };
    }
};
pub const PLLRConf = enum {
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
        };
    }
};
pub const PLLSAI1NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 86;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLLSAI1PConf = enum {
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
pub const PLLSAI1QConf = enum {
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
        };
    }
};
pub const PLLSAI1RConf = enum {
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    LSIMult: LSIMultConf = .LSIRC,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .CLOCK_4000,
    HCLKRFMult: HCLKRFMultConf = .HSIRC,
    LPTIM1Mult: LPTIM1MultConf = .APB1Prescaler,
    LSCOMult: LSCOMultConf = .LSIRC,
    HSEPRESC: HSEPRESCConf = @enumFromInt(1),
    SysClkSource: SysClkSourceConf = .MSIRC,
    PLLSource: PLLSourceConf = .MSIRC,
    PLLM: PLLMConf = .DIV1,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB1Prescaler,
    SMPSMult: SMPSMultConf = .HSIRC,
    SMPSDivider: SMPSDividerConf = .DIV2,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    RFWKPClkSource: RFWKPClkSourceConf = .HSERFWKPDevisor,
    CK48Mult: CK48MultConf = .PLLSAI1Q,
    RNGMult: RNGMultConf = .LSIRC,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB1Prescaler,
    SAI1Mult: SAI1MultConf = .PLLSAI1P,
    ADCMult: ADCMultConf = .PLLSAI1R,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    AHB3Prescaler: AHB3PrescalerConf = .DIV1,
    AHB2Prescaler: AHB2PrescalerConf = .DIV1,
    Cortex2Prescaler: Cortex2PrescalerConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .DIV2,
    PLLQ: PLLQConf = .DIV2,
    PLLR: PLLRConf = .DIV2,
    PLLSAI1N: PLLSAI1NConf = @enumFromInt(8),
    PLLSAI1P: PLLSAI1PConf = .DIV2,
    PLLSAI1Q: PLLSAI1QConf = .DIV2,
    PLLSAI1R: PLLSAI1RConf = .DIV2,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSI48RC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSI2RC: ClockNode,
    LSIMult: ClockNode,
    LSEOSC: ClockNode,
    MSIRC: ClockNode,
    HCLKRFMultDiv: ClockNode,
    HCLKRFMult: ClockNode,
    HCLKRFOutput: ClockNode,
    APB3Output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    SAI1_EXT: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    HSEPRESC: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    LCDOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    SMPSMult: ClockNode,
    SMPSDivider: ClockNode,
    SMPSDiv2: ClockNode,
    SMPSoutput: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    HSERFWKPDevisor: ClockNode,
    RFWKPClkSource: ClockNode,
    RFWKPOutput: ClockNode,
    CK48Mult: ClockNode,
    CK48output: ClockNode,
    RNGDiv: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    AHB3Prescaler: ClockNode,
    AHB3Output: ClockNode,
    AHB2Prescaler: ClockNode,
    FCLK2CortexOutput: ClockNode,
    AHB2Output: ClockNode,
    Cortex2Prescaler: ClockNode,
    Cortex2SysOutput: ClockNode,
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
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLPoutput: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLR: ClockNode,
    PLLSAI1N: ClockNode,
    PLLSAI1P: ClockNode,
    PLLSAI1Poutput: ClockNode,
    PLLSAI1Q: ClockNode,
    PLLSAI1Qoutput: ClockNode,
    PLLSAI1R: ClockNode,
    PLLSAI1Routput: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 16000000 } },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 48000000, .min = 4000000 },
            } },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{ .value = 32000 } },
        };
        const LSI2RC: ClockNode = .{
            .name = "LSI2RC",
            .Nodetype = .{ .source = .{ .value = 32000 } },
        };
        const LSIMult: ClockNode = .{
            .name = "LSIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LSIMult) },
            .parents = &[_]*const ClockNode{
                &LSIRC,
                &LSI2RC,
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 1000 },
            } },
        };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = .{ .source = .{ .value = config.MSIRC.get() } },
        };
        const HCLKRFMultDiv: ClockNode = .{
            .name = "HCLKRFMultDiv",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const HCLKRFMult: ClockNode = .{
            .name = "HCLKRFMult",

            .Nodetype = .{ .multi = @intFromEnum(config.HCLKRFMult) },
            .parents = &[_]*const ClockNode{
                &HCLKRFMultDiv,
                &HSIRC,
            },
        };
        const HCLKRFOutput: ClockNode = .{
            .name = "HCLKRFOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HCLKRFMult},
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HCLKRFMult},
        };
        const HSEPRESC: ClockNode = .{
            .name = "HSEPRESC",
            .Nodetype = .{ .div = .{ .value = config.HSEPRESC.get(), .limit = .{ .max = 2, .min = 1 } } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEPRESC,
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = .{ .div = .{ .value = config.PLLM.get() } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = .{ .mul = .{ .value = config.PLLN.get(), .limit = .{ .max = 86, .min = 8 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = .{ .div = .{ .value = config.PLLR.get() } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEPRESC,
                &PLLR,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB1Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
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
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .Nodetype = .{ .source = .{ .value = 2097000 } },
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
        const LCDOutput: ClockNode = .{
            .name = "LCDOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB2Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
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
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const SMPSMult: ClockNode = .{
            .name = "SMPSMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SMPSMult) },
            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSEOSC,
                &HSIRC,
            },
        };
        const SMPSDivider: ClockNode = .{
            .name = "SMPSDivider",
            .Nodetype = .{ .div = .{ .value = config.SMPSDivider.get() } },
            .parents = &[_]*const ClockNode{&SMPSMult},
        };
        const SMPSDiv2: ClockNode = .{
            .name = "SMPSDiv2",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&SMPSDivider},
        };
        const SMPSoutput: ClockNode = .{
            .name = "SMPSoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SMPSDiv2},
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIRC,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const HSERFWKPDevisor: ClockNode = .{
            .name = "HSERFWKPDevisor",
            .Nodetype = .{ .div = .{ .value = 1024 } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RFWKPClkSource: ClockNode = .{
            .name = "RFWKPClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.RFWKPClkSource) },
            .parents = &[_]*const ClockNode{
                &HSERFWKPDevisor,
                &LSEOSC,
            },
        };
        const RFWKPOutput: ClockNode = .{
            .name = "RFWKPOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RFWKPClkSource},
        };
        const PLLSAI1N: ClockNode = .{
            .name = "PLLSAI1N",
            .Nodetype = .{ .mul = .{ .value = config.PLLSAI1N.get(), .limit = .{ .max = 86, .min = 4 } } },
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLSAI1Q: ClockNode = .{
            .name = "PLLSAI1Q",
            .Nodetype = .{ .div = .{ .value = config.PLLSAI1Q.get() } },
            .parents = &[_]*const ClockNode{&PLLSAI1N},
        };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = .{ .div = .{ .value = config.PLLQ.get() } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.CK48Mult) },
            .parents = &[_]*const ClockNode{
                &PLLSAI1Q,
                &PLLQ,
                &MSIRC,
                &HSI48RC,
            },
        };
        const CK48output: ClockNode = .{
            .name = "CK48output",
            .Nodetype = .{ .output = .{ .max = 48120000, .min = 47880000 } },
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const RNGDiv: ClockNode = .{
            .name = "RNGDiv",
            .Nodetype = .{ .div = .{ .value = 3 } },
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",

            .Nodetype = .{ .multi = @intFromEnum(config.RNGMult) },
            .parents = &[_]*const ClockNode{
                &RNGDiv,
                &LSIRC,
                &LSEOSC,
            },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RNGMult},
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
        const PLLSAI1P: ClockNode = .{
            .name = "PLLSAI1P",
            .Nodetype = .{ .div = .{ .value = config.PLLSAI1P.get() } },
            .parents = &[_]*const ClockNode{&PLLSAI1N},
        };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = .{ .div = .{ .value = config.PLLP.get() } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1Mult) },
            .parents = &[_]*const ClockNode{
                &PLLSAI1P,
                &PLLP,
                &HSIRC,
                &SAI1_EXT,
            },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const PLLSAI1R: ClockNode = .{
            .name = "PLLSAI1R",
            .Nodetype = .{ .div = .{ .value = config.PLLSAI1R.get() } },
            .parents = &[_]*const ClockNode{&PLLSAI1N},
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &PLLSAI1R,
                &PLLP,
                &SysCLKOutput,
            },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 140000 } },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &PLLR,
                &SysCLKOutput,
                &MSIRC,
                &HSI48RC,
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
        const AHB3Prescaler: ClockNode = .{
            .name = "AHB3Prescaler",
            .Nodetype = .{ .div = .{ .value = config.AHB3Prescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHB3Output: ClockNode = .{
            .name = "AHB3Output",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHB3Prescaler},
        };
        const AHB2Prescaler: ClockNode = .{
            .name = "AHB2Prescaler",
            .Nodetype = .{ .div = .{ .value = config.AHB2Prescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const FCLK2CortexOutput: ClockNode = .{
            .name = "FCLK2CortexOutput",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHB2Prescaler},
        };
        const AHB2Output: ClockNode = .{
            .name = "AHB2Output",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHB2Prescaler},
        };
        const Cortex2Prescaler: ClockNode = .{
            .name = "Cortex2Prescaler",
            .Nodetype = .{ .div = .{ .value = config.Cortex2Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHB2Prescaler},
        };
        const Cortex2SysOutput: ClockNode = .{
            .name = "Cortex2SysOutput",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&Cortex2Prescaler},
        };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
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
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
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
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
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
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLP},
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const PLLSAI1Poutput: ClockNode = .{
            .name = "PLLSAI1Poutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSAI1P},
        };
        const PLLSAI1Qoutput: ClockNode = .{
            .name = "PLLSAI1Qoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSAI1Q},
        };
        const PLLSAI1Routput: ClockNode = .{
            .name = "PLLSAI1Routput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSAI1R},
        };
        return .{
            .HSIRC = HSIRC,
            .HSI48RC = HSI48RC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSI2RC = LSI2RC,
            .LSIMult = LSIMult,
            .LSEOSC = LSEOSC,
            .MSIRC = MSIRC,
            .HCLKRFMultDiv = HCLKRFMultDiv,
            .HCLKRFMult = HCLKRFMult,
            .HCLKRFOutput = HCLKRFOutput,
            .APB3Output = APB3Output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .SAI1_EXT = SAI1_EXT,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .HSEPRESC = HSEPRESC,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .LCDOutput = LCDOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .SMPSMult = SMPSMult,
            .SMPSDivider = SMPSDivider,
            .SMPSDiv2 = SMPSDiv2,
            .SMPSoutput = SMPSoutput,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .HSERFWKPDevisor = HSERFWKPDevisor,
            .RFWKPClkSource = RFWKPClkSource,
            .RFWKPOutput = RFWKPOutput,
            .CK48Mult = CK48Mult,
            .CK48output = CK48output,
            .RNGDiv = RNGDiv,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .AHB3Prescaler = AHB3Prescaler,
            .AHB3Output = AHB3Output,
            .AHB2Prescaler = AHB2Prescaler,
            .FCLK2CortexOutput = FCLK2CortexOutput,
            .AHB2Output = AHB2Output,
            .Cortex2Prescaler = Cortex2Prescaler,
            .Cortex2SysOutput = Cortex2SysOutput,
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
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLPoutput = PLLPoutput,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLR = PLLR,
            .PLLSAI1N = PLLSAI1N,
            .PLLSAI1P = PLLSAI1P,
            .PLLSAI1Poutput = PLLSAI1Poutput,
            .PLLSAI1Q = PLLSAI1Q,
            .PLLSAI1Qoutput = PLLSAI1Qoutput,
            .PLLSAI1R = PLLSAI1R,
            .PLLSAI1Routput = PLLSAI1Routput,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.LPTIM1output.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.RFWKPOutput.get_comptime();
        _ = self.CK48output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.AHB3Output.get_comptime();
        _ = self.FCLK2CortexOutput.get_comptime();
        _ = self.AHB2Output.get_comptime();
        _ = self.Cortex2SysOutput.get_comptime();
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
    }
};
