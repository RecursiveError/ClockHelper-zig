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
pub const PRESCALERUSBConf = enum {
    DIV1,
    @"DIV1.5",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .@"DIV1.5" => 1.5,
        };
    }
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLMUL,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const MCOMultConf = enum {
    HSIRC,
    LSEOSC,
    HSEOSC,
    MCOMultDivisor,
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
pub const ADC12PRESConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    DIV10,
    DIV12,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    DIV256,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
            .DIV10 => 10,
            .DIV12 => 12,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
        };
    }
};
pub const ADC34PRESConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    DIV10,
    DIV12,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    DIV256,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
            .DIV10 => 10,
            .DIV12 => 12,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
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
pub const TIMMUX1Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const TIMMUX8Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const HRTIMMuxConf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const I2C1MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2C2MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2C3MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2SSrcConf = enum {
    I2S_CKIN,
    SysCLKOutput,
};
pub const USART1MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB2Prescaler,
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
pub const UART4MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const UART5MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
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
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    HSEPLLsourceDevisor: HSEPLLsourceDevisorConf = .DIV1,
    PRESCALERUSB: PRESCALERUSBConf = .DIV1,
    SysClkSource: SysClkSourceConf = .HSIRC,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    ADC12PRES: ADC12PRESConf = .DIV1,
    ADC34PRES: ADC34PRESConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    TIMMUX1: TIMMUX1Conf = .TimPrescOut2,
    TIMMUX8: TIMMUX8Conf = .TimPrescOut2,
    HRTIMMux: HRTIMMuxConf = .TimPrescOut2,
    I2C1Mult: I2C1MultConf = .HSIRC,
    I2C2Mult: I2C2MultConf = .HSIRC,
    I2C3Mult: I2C3MultConf = .HSIRC,
    I2SSrc: I2SSrcConf = .SysCLKOutput,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    PLLSource: PLLSourceConf = .HSIRCDiv,
    PLLMUL: PLLMULConf = .MUL2,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSIRCDiv: ClockNode,
    FLITFCLKoutput: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSEOSC: ClockNode,
    HSEPLLsourceDevisor: ClockNode,
    PRESCALERUSB: ClockNode,
    USBoutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
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
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    ADC12PRES: ClockNode,
    ADC12output: ClockNode,
    ADC34PRES: ClockNode,
    ADC34output: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    TIMMUL: ClockNode,
    TIMMUX1: ClockNode,
    TIM1out: ClockNode,
    TIMMUX8: ClockNode,
    TIM8out: ClockNode,
    HRTIMMux: ClockNode,
    HRTIMout: ClockNode,
    I2C1Mult: ClockNode,
    I2C1Output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2Output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3Output: ClockNode,
    I2S_CKIN: ClockNode,
    I2SSrc: ClockNode,
    I2SClocksOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1Output: ClockNode,
    USART2Mult: ClockNode,
    USART2Output: ClockNode,
    USART3Mult: ClockNode,
    USART3Output: ClockNode,
    UART4Mult: ClockNode,
    UART4Output: ClockNode,
    UART5Mult: ClockNode,
    UART5Output: ClockNode,
    PLLSource: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 8000000 } },
        };
        const HSIRCDiv: ClockNode = .{
            .name = "HSIRCDiv",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const FLITFCLKoutput: ClockNode = .{
            .name = "FLITFCLKoutput",
            .Nodetype = .{ .output = null },
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
        const PRESCALERUSB: ClockNode = .{
            .name = "PRESCALERUSB",
            .Nodetype = .{ .div = .{ .value = config.PRESCALERUSB.get() } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = .{ .max = 48120000, .min = 47880000 } },
            .parents = &[_]*const ClockNode{&PRESCALERUSB},
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
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &LSEOSC,
                &HSEOSC,
                &MCOMultDivisor,
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
        const ADC12PRES: ClockNode = .{
            .name = "ADC12PRES",
            .Nodetype = .{ .div = .{ .value = config.ADC12PRES.get() } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC12output: ClockNode = .{
            .name = "ADC12output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADC12PRES},
        };
        const ADC34PRES: ClockNode = .{
            .name = "ADC34PRES",
            .Nodetype = .{ .div = .{ .value = config.ADC34PRES.get() } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC34output: ClockNode = .{
            .name = "ADC34output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADC34PRES},
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
        const TIMMUL: ClockNode = .{
            .name = "TIMMUL",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const TIMMUX1: ClockNode = .{
            .name = "TIMMUX1",

            .Nodetype = .{ .multi = @intFromEnum(config.TIMMUX1) },
            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM1out: ClockNode = .{
            .name = "TIM1out",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TIMMUX1},
        };
        const TIMMUX8: ClockNode = .{
            .name = "TIMMUX8",

            .Nodetype = .{ .multi = @intFromEnum(config.TIMMUX8) },
            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM8out: ClockNode = .{
            .name = "TIM8out",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TIMMUX8},
        };
        const HRTIMMux: ClockNode = .{
            .name = "HRTIMMux",

            .Nodetype = .{ .multi = @intFromEnum(config.HRTIMMux) },
            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const HRTIMout: ClockNode = .{
            .name = "HRTIMout",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HRTIMMux},
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
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C2Mult) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C2Output: ClockNode = .{
            .name = "I2C2Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C3Mult) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C3Output: ClockNode = .{
            .name = "I2C3Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = .{ .source = .{ .value = 8000000 } },
        };
        const I2SSrc: ClockNode = .{
            .name = "I2SSrc",

            .Nodetype = .{ .multi = @intFromEnum(config.I2SSrc) },
            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &SysCLKOutput,
            },
        };
        const I2SClocksOutput: ClockNode = .{
            .name = "I2SClocksOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2SSrc},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB2Prescaler,
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
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART4Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const UART4Output: ClockNode = .{
            .name = "UART4Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART5Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const UART5Output: ClockNode = .{
            .name = "UART5Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        return .{
            .HSIRC = HSIRC,
            .HSIRCDiv = HSIRCDiv,
            .FLITFCLKoutput = FLITFCLKoutput,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .HSEOSC = HSEOSC,
            .HSEPLLsourceDevisor = HSEPLLsourceDevisor,
            .PRESCALERUSB = PRESCALERUSB,
            .USBoutput = USBoutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
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
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .ADC12PRES = ADC12PRES,
            .ADC12output = ADC12output,
            .ADC34PRES = ADC34PRES,
            .ADC34output = ADC34output,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .TIMMUL = TIMMUL,
            .TIMMUX1 = TIMMUX1,
            .TIM1out = TIM1out,
            .TIMMUX8 = TIMMUX8,
            .TIM8out = TIM8out,
            .HRTIMMux = HRTIMMux,
            .HRTIMout = HRTIMout,
            .I2C1Mult = I2C1Mult,
            .I2C1Output = I2C1Output,
            .I2C2Mult = I2C2Mult,
            .I2C2Output = I2C2Output,
            .I2C3Mult = I2C3Mult,
            .I2C3Output = I2C3Output,
            .I2S_CKIN = I2S_CKIN,
            .I2SSrc = I2SSrc,
            .I2SClocksOutput = I2SClocksOutput,
            .USART1Mult = USART1Mult,
            .USART1Output = USART1Output,
            .USART2Mult = USART2Mult,
            .USART2Output = USART2Output,
            .USART3Mult = USART3Mult,
            .USART3Output = USART3Output,
            .UART4Mult = UART4Mult,
            .UART4Output = UART4Output,
            .UART5Mult = UART5Mult,
            .UART5Output = UART5Output,
            .PLLSource = PLLSource,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.USBoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.ADC12output.get_comptime();
        _ = self.ADC34output.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.TIM1out.get_comptime();
        _ = self.TIM8out.get_comptime();
        _ = self.HRTIMout.get_comptime();
        _ = self.I2C1Output.get_comptime();
        _ = self.I2C2Output.get_comptime();
        _ = self.I2C3Output.get_comptime();
        _ = self.I2SClocksOutput.get_comptime();
        _ = self.USART1Output.get_comptime();
        _ = self.USART2Output.get_comptime();
        _ = self.USART3Output.get_comptime();
        _ = self.UART4Output.get_comptime();
        _ = self.UART5Output.get_comptime();
    }
};
