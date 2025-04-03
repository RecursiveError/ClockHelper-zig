const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const MSIRCConf = enum {
    @"CLOCK_65.536",
    @"CLOCK_131.072",
    @"CLOCK_262.144",
    @"CLOCK_524.288",
    CLOCK_1048,
    CLOCK_2097,
    CLOCK_4194,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"CLOCK_65.536" => 65.536,
            .@"CLOCK_131.072" => 131.072,
            .@"CLOCK_262.144" => 262.144,
            .@"CLOCK_524.288" => 524.288,
            .CLOCK_1048 => 1048,
            .CLOCK_2097 => 2097,
            .CLOCK_4194 => 4194,
        };
    }
};
pub const HSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 24000000;
    }

    pub fn min() f32 {
        return 1000000;
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
        return 1000;
    }
};
pub const HSERTCDevisorConf = enum {
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
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const SysClkSourceConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
    PLLDIV,
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
pub const TIMPrescalerConf = enum {
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
pub const MCOMultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRC,
    PLLDIV,
    SysCLKOutput,
    MSIRC,
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
pub const PLLSourceConf = enum {
    HSEOSC,
    HSIRC,
};
pub const PLLMULConf = enum {
    MUL3,
    MUL4,
    MUL6,
    MUL8,
    MUL12,
    MUL16,
    MUL24,
    MUL32,
    MUL48,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .MUL3 => 3,
            .MUL4 => 4,
            .MUL6 => 6,
            .MUL8 => 8,
            .MUL12 => 12,
            .MUL16 => 16,
            .MUL24 => 24,
            .MUL32 => 32,
            .MUL48 => 48,
        };
    }
};
pub const PLLDIVConf = enum {
    DIV2,
    DIV3,
    DIV4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
        };
    }
};
pub const Config = struct {
    MSIRC: MSIRCConf = .CLOCK_2097,
    HSEOSC: HSEOSCConf = @enumFromInt(24000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    HSERTCDevisor: HSERTCDevisorConf = .DIV2,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    SysClkSource: SysClkSourceConf = .MSIRC,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TIMPrescaler: TIMPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLMUL: PLLMULConf = .MUL3,
    PLLDIV: PLLDIVConf = .DIV2,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    ADCOutput: ClockNode,
    MSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    LCDOutput: ClockNode,
    IWDGOutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PWROutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    TIMPrescaler: ClockNode,
    TIMOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    PeriphPrescaler: ClockNode,
    PeriphPrescOutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    PLLSource: ClockNode,
    VCOIIuput: ClockNode,
    PLLMUL: ClockNode,
    USBPres: ClockNode,
    PLLDIV: ClockNode,
    USBOutput: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 16000000 } },
        };
        const ADCOutput: ClockNode = .{
            .name = "ADCOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = .{ .source = .{ .value = config.MSIRC.get() } },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 24000000, .min = 1000000 },
            } },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{ .value = 37000 } },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 1000 },
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
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &HSIRC,
            },
        };
        const VCOIIuput: ClockNode = .{
            .name = "VCOIIuput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = .{ .mul = .{ .value = config.PLLMUL.get() } },
            .parents = &[_]*const ClockNode{&VCOIIuput},
        };
        const PLLDIV: ClockNode = .{
            .name = "PLLDIV",
            .Nodetype = .{ .div = .{ .value = config.PLLDIV.get() } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
                &PLLDIV,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PWROutput: ClockNode = .{
            .name = "PWROutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TIMPrescaler: ClockNode = .{
            .name = "TIMPrescaler",
            .Nodetype = .{ .div = .{ .value = config.TIMPrescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TIMOutput: ClockNode = .{
            .name = "TIMOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TIMPrescaler},
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
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
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
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
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
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &PLLDIV,
                &SysCLKOutput,
                &MSIRC,
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
        const USBPres: ClockNode = .{
            .name = "USBPres",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBOutput: ClockNode = .{
            .name = "USBOutput",
            .Nodetype = .{ .output = .{ .max = 48120000, .min = 47880000 } },
            .parents = &[_]*const ClockNode{&USBPres},
        };
        return .{
            .HSIRC = HSIRC,
            .ADCOutput = ADCOutput,
            .MSIRC = MSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .LCDOutput = LCDOutput,
            .IWDGOutput = IWDGOutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PWROutput = PWROutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .TIMPrescaler = TIMPrescaler,
            .TIMOutput = TIMOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut = TimPrescOut,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .PeriphPrescaler = PeriphPrescaler,
            .PeriphPrescOutput = PeriphPrescOutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .PLLSource = PLLSource,
            .VCOIIuput = VCOIIuput,
            .PLLMUL = PLLMUL,
            .USBPres = USBPres,
            .PLLDIV = PLLDIV,
            .USBOutput = USBOutput,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.PWROutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.TIMOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.PeriphPrescOutput.get_comptime();
        _ = self.USBOutput.get_comptime();
    }
};
