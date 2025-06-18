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
pub const HSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 25000000;
    }

    pub fn min() f32 {
        return 3000000;
    }
};
pub const Prediv2Conf = enum {
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
pub const PLL2MulConf = enum {
    MUL8,
    MUL9,
    MUL10,
    MUL11,
    MUL12,
    MUL13,
    MUL14,
    MUL16,
    MUL20,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .MUL8 => 8,
            .MUL9 => 9,
            .MUL10 => 10,
            .MUL11 => 11,
            .MUL12 => 12,
            .MUL13 => 13,
            .MUL14 => 14,
            .MUL16 => 16,
            .MUL20 => 20,
        };
    }
};
pub const PLL3MulConf = enum {
    MUL8,
    MUL9,
    MUL10,
    MUL11,
    MUL12,
    MUL13,
    MUL14,
    MUL16,
    MUL20,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .MUL8 => 8,
            .MUL9 => 9,
            .MUL10 => 10,
            .MUL11 => 11,
            .MUL12 => 12,
            .MUL13 => 13,
            .MUL14 => 14,
            .MUL16 => 16,
            .MUL20 => 20,
        };
    }
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLMUL,
};
pub const I2S2MultConf = enum {
    SysCLKOutput,
    PLL3VCOoutput,
};
pub const I2S3MultConf = enum {
    SysCLKOutput,
    PLL3VCOoutput,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const MCOPLL3DivConf = enum {
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
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    MCOMultDivisor,
    PLL2CLKoutput,
    MCOPLL3Div,
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
pub const ADCprescalerConf = enum {
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
pub const Prediv1SourceConf = enum {
    HSEOSC,
    PLL2CLKoutput,
};
pub const PreDiv1Conf = enum {
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
pub const PLLSourceConf = enum {
    HSIDivPLL,
    PreDiv1,
};
pub const PLLMULConf = enum {
    MUL4,
    MUL5,
    MUL6,
    @"MUL6.5",
    MUL7,
    MUL8,
    MUL9,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .MUL4 => 4,
            .MUL5 => 5,
            .MUL6 => 6,
            .@"MUL6.5" => 6.5,
            .MUL7 => 7,
            .MUL8 => 8,
            .MUL9 => 9,
        };
    }
};
pub const USBPrescalerConf = enum {
    DIV2,
    DIV3,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
        };
    }
};
pub const Config = struct {
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    Prediv2: Prediv2Conf = .DIV1,
    PLL2Mul: PLL2MulConf = .MUL8,
    PLL3Mul: PLL3MulConf = .MUL8,
    SysClkSource: SysClkSourceConf = .HSIRC,
    I2S2Mult: I2S2MultConf = .SysCLKOutput,
    I2S3Mult: I2S3MultConf = .SysCLKOutput,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOPLL3Div: MCOPLL3DivConf = .DIV1,
    MCOMult: MCOMultConf = .SysCLKOutput,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TimSysPresc: TimSysPrescConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    ADCprescaler: ADCprescalerConf = .DIV2,
    Prediv1Source: Prediv1SourceConf = .HSEOSC,
    PreDiv1: PreDiv1Conf = .DIV1,
    PLLSource: PLLSourceConf = .HSIDivPLL,
    PLLMUL: PLLMULConf = .MUL4,
    USBPrescaler: USBPrescalerConf = .DIV3,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    HSIDivPLL: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSEOSC: ClockNode,
    Prediv2: ClockNode,
    Prediv2output: ClockNode,
    PLL2Mul: ClockNode,
    PLL2VCOMul2: ClockNode,
    PLL2VCOoutput: ClockNode,
    PLL2CLKoutput: ClockNode,
    PLL3Mul: ClockNode,
    PLL3VCOMul2: ClockNode,
    PLL3VCOoutput: ClockNode,
    PLL3CLKoutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    I2S2Mult: ClockNode,
    I2S2Output: ClockNode,
    I2S3Mult: ClockNode,
    I2S3Output: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    MCOPLL3Div: ClockNode,
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
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    ADCprescaler: ClockNode,
    ADCoutput: ClockNode,
    Prediv1Source: ClockNode,
    PreDiv1: ClockNode,
    PLLSource: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,
    PLLVCOMul2: ClockNode,
    USBPrescaler: ClockNode,
    USBoutput: ClockNode,

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
        const HSIDivPLL: ClockNode = .{
            .name = "HSIDivPLL",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&HSIRC},
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
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 25000000, .min = 3000000 },
            } },
        };
        const Prediv2: ClockNode = .{
            .name = "Prediv2",
            .Nodetype = .{ .div = .{ .value = config.Prediv2.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const Prediv2output: ClockNode = .{
            .name = "Prediv2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&Prediv2},
        };
        const PLL2Mul: ClockNode = .{
            .name = "PLL2Mul",
            .Nodetype = .{ .mul = .{ .value = config.PLL2Mul.get() } },
            .parents = &[_]*const ClockNode{&Prediv2output},
        };
        const PLL2VCOMul2: ClockNode = .{
            .name = "PLL2VCOMul2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLL2Mul},
        };
        const PLL2VCOoutput: ClockNode = .{
            .name = "PLL2VCOoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL2VCOMul2},
        };
        const PLL2CLKoutput: ClockNode = .{
            .name = "PLL2CLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL2Mul},
        };
        const PLL3Mul: ClockNode = .{
            .name = "PLL3Mul",
            .Nodetype = .{ .mul = .{ .value = config.PLL3Mul.get() } },
            .parents = &[_]*const ClockNode{&Prediv2output},
        };
        const PLL3VCOMul2: ClockNode = .{
            .name = "PLL3VCOMul2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLL3Mul},
        };
        const PLL3VCOoutput: ClockNode = .{
            .name = "PLL3VCOoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL3VCOMul2},
        };
        const PLL3CLKoutput: ClockNode = .{
            .name = "PLL3CLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL3Mul},
        };
        const Prediv1Source: ClockNode = .{
            .name = "Prediv1Source",

            .Nodetype = .{ .multi = @intFromEnum(config.Prediv1Source) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &PLL2CLKoutput,
            },
        };
        const PreDiv1: ClockNode = .{
            .name = "PreDiv1",
            .Nodetype = .{ .div = .{ .value = config.PreDiv1.get() } },
            .parents = &[_]*const ClockNode{&Prediv1Source},
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSIDivPLL,
                &PreDiv1,
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
            .Nodetype = .{ .output = .{ .max = 72000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const I2S2Mult: ClockNode = .{
            .name = "I2S2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2S2Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLL3VCOoutput,
            },
        };
        const I2S2Output: ClockNode = .{
            .name = "I2S2Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2S2Mult},
        };
        const I2S3Mult: ClockNode = .{
            .name = "I2S3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2S3Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLL3VCOoutput,
            },
        };
        const I2S3Output: ClockNode = .{
            .name = "I2S3Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2S3Mult},
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = .{ .div = .{ .value = 128 } },
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
        const MCOPLL3Div: ClockNode = .{
            .name = "MCOPLL3Div",
            .Nodetype = .{ .div = .{ .value = config.MCOPLL3Div.get() } },
            .parents = &[_]*const ClockNode{&PLL3CLKoutput},
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
                &HSEOSC,
                &HSIRC,
                &SysCLKOutput,
                &MCOMultDivisor,
                &PLL2CLKoutput,
                &MCOPLL3Div,
            },
        };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 72000000, .min = 0 } },
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
            .Nodetype = .{ .output = .{ .max = 36000000, .min = 0 } },
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
            .Nodetype = .{ .output = .{ .max = 72000000, .min = 0 } },
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
        const ADCprescaler: ClockNode = .{
            .name = "ADCprescaler",
            .Nodetype = .{ .div = .{ .value = config.ADCprescaler.get() } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = .{ .max = 14000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ADCprescaler},
        };
        const PLLVCOMul2: ClockNode = .{
            .name = "PLLVCOMul2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBPrescaler: ClockNode = .{
            .name = "USBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.USBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&PLLVCOMul2},
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = .{ .max = 48120000, .min = 47880000 } },
            .parents = &[_]*const ClockNode{&USBPrescaler},
        };
        return .{
            .HSIRC = HSIRC,
            .FLITFCLKoutput = FLITFCLKoutput,
            .HSIDivPLL = HSIDivPLL,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .HSEOSC = HSEOSC,
            .Prediv2 = Prediv2,
            .Prediv2output = Prediv2output,
            .PLL2Mul = PLL2Mul,
            .PLL2VCOMul2 = PLL2VCOMul2,
            .PLL2VCOoutput = PLL2VCOoutput,
            .PLL2CLKoutput = PLL2CLKoutput,
            .PLL3Mul = PLL3Mul,
            .PLL3VCOMul2 = PLL3VCOMul2,
            .PLL3VCOoutput = PLL3VCOoutput,
            .PLL3CLKoutput = PLL3CLKoutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .I2S2Mult = I2S2Mult,
            .I2S2Output = I2S2Output,
            .I2S3Mult = I2S3Mult,
            .I2S3Output = I2S3Output,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .MCOPLL3Div = MCOPLL3Div,
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
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .ADCprescaler = ADCprescaler,
            .ADCoutput = ADCoutput,
            .Prediv1Source = Prediv1Source,
            .PreDiv1 = PreDiv1,
            .PLLSource = PLLSource,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
            .PLLVCOMul2 = PLLVCOMul2,
            .USBPrescaler = USBPrescaler,
            .USBoutput = USBoutput,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.I2S2Output.get_comptime();
        _ = self.I2S3Output.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.TimSysOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
    }
};
