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
        return 16000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const HSEDivPLLConf = enum {
    DIV1,
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
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
    MCOMultDivisor,
    HSIRC,
    HSEOSC,
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
pub const USBPrescalerConf = enum {
    DIV1,
    @"DIV1.5",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .@"DIV1.5" => 1.5,
        };
    }
};
pub const PLLSourceConf = enum {
    HSIDivPLL,
    HSEDivPLL,
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
    HSEDivPLL: HSEDivPLLConf = .DIV1,
    SysClkSource: SysClkSourceConf = .HSIRC,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TimSysPresc: TimSysPrescConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    ADCprescaler: ADCprescalerConf = .DIV2,
    USBPrescaler: USBPrescalerConf = .DIV1,
    PLLSource: PLLSourceConf = .HSIDivPLL,
    PLLMUL: PLLMULConf = .MUL2,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    HSIDivPLL: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSEOSC: ClockNode,
    HSEDivPLL: ClockNode,
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
    FSMClkOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    TimSysPresc: ClockNode,
    TimSysOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    ADCprescaler: ClockNode,
    ADCoutput: ClockNode,
    USBPrescaler: ClockNode,
    USBoutput: ClockNode,
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
                .limit = .{ .max = 16000000, .min = 4000000 },
            } },
        };
        const HSEDivPLL: ClockNode = .{
            .name = "HSEDivPLL",
            .Nodetype = .{ .div = .{ .value = config.HSEDivPLL.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSIDivPLL,
                &HSEDivPLL,
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
            .Nodetype = .{ .output = .{ .max = 36000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
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
                &HSEOSC,
                &SysCLKOutput,
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
            .Nodetype = .{ .output = .{ .max = 36000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const FSMClkOutput: ClockNode = .{
            .name = "FSMClkOutput",
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
            .Nodetype = .{ .output = .{ .max = 36000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
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
        const USBPrescaler: ClockNode = .{
            .name = "USBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.USBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&PLLMUL},
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
            .HSEDivPLL = HSEDivPLL,
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
            .FSMClkOutput = FSMClkOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .TimSysPresc = TimSysPresc,
            .TimSysOutput = TimSysOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .ADCprescaler = ADCprescaler,
            .ADCoutput = ADCoutput,
            .USBPrescaler = USBPrescaler,
            .USBoutput = USBoutput,
            .PLLSource = PLLSource,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FSMClkOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.TimSysOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
    }
};
