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
pub const HSIRCDivConf = enum {
    DIV1,
    DIV4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV4 => 4,
        };
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
pub const RTCClkSourceConf = enum {
    LSEOSC,
    LSIRC,
};
pub const SysClkSourceConf = enum {
    MSIRC,
    HSIRCDiv,
    PLLDIV,
};
pub const PLLSourceConf = enum {
    HSIRCDiv,
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
pub const LPTIMMultConf = enum {
    LSIRC,
    HSIRCDiv,
    LSEOSC,
    APB1Prescaler,
};
pub const LPUARTMultConf = enum {
    APB1Prescaler,
    LSEOSC,
    HSIRCDiv,
    SysCLKOutput,
};
pub const USART2MultConf = enum {
    SysCLKOutput,
    HSIRCDiv,
    LSEOSC,
    APB1Prescaler,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRCDiv,
    LSEOSC,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    HSIRCDiv,
    SysCLKOutput,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIRC,
    HSIRCDiv,
    PLLDIV,
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
pub const HSI48MULConf = enum {
    DIV2USB,
    HSI48RC,
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
    HSIRCDiv: HSIRCDivConf = .DIV1,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    SysClkSource: SysClkSourceConf = .MSIRC,
    PLLSource: PLLSourceConf = .HSIRCDiv,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    TIMPrescaler: TIMPrescalerConf = .DIV1,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    LPTIMMult: LPTIMMultConf = .APB1Prescaler,
    LPUARTMult: LPUARTMultConf = .APB1Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    HSI48MUL: HSI48MULConf = .DIV2USB,
    PLLMUL: PLLMULConf = .MUL3,
    PLLDIV: PLLDIVConf = .DIV2,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    MSIRC: ClockNode,
    HSI48RC: ClockNode,
    HSIRCDiv: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    LCDOutput: ClockNode,
    IWDGOutput: ClockNode,
    SysClkSource: ClockNode,
    PLLSource: ClockNode,
    AHBPrescaler: ClockNode,
    SysCLKOutput: ClockNode,
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
    LPTIMMult: ClockNode,
    LPTIMOutput: ClockNode,
    LPUARTMult: ClockNode,
    LPUARTOutput: ClockNode,
    USART2Mult: ClockNode,
    USART2Output: ClockNode,
    USART1Mult: ClockNode,
    USART1Output: ClockNode,
    I2C1Mult: ClockNode,
    I2C1Output: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    HSI48MUL: ClockNode,
    @"48USBOutput": ClockNode,
    @"48RNGOutput": ClockNode,
    ADCOutput: ClockNode,
    VCOIIuput: ClockNode,
    PLLMUL: ClockNode,
    PLLDIV: ClockNode,
    DIV2USB: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 16000000 } },
        };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = .{ .source = .{ .value = config.MSIRC.get() } },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const HSIRCDiv: ClockNode = .{
            .name = "HSIRCDiv",
            .Nodetype = .{ .div = .{ .value = config.HSIRCDiv.get() } },
            .parents = &[_]*const ClockNode{&HSIRC},
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
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.RTCClkSource) },
            .parents = &[_]*const ClockNode{
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
                &HSIRCDiv,
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
                &HSIRCDiv,
                &PLLDIV,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
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
        const LPTIMMult: ClockNode = .{
            .name = "LPTIMMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIMMult) },
            .parents = &[_]*const ClockNode{
                &LSIRC,
                &HSIRCDiv,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const LPTIMOutput: ClockNode = .{
            .name = "LPTIMOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIMMult},
        };
        const LPUARTMult: ClockNode = .{
            .name = "LPUARTMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUARTMult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSEOSC,
                &HSIRCDiv,
                &SysCLKOutput,
            },
        };
        const LPUARTOutput: ClockNode = .{
            .name = "LPUARTOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPUARTMult},
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART2Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRCDiv,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART2Output: ClockNode = .{
            .name = "USART2Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
                &HSIRCDiv,
                &LSEOSC,
            },
        };
        const USART1Output: ClockNode = .{
            .name = "USART1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRCDiv,
                &SysCLKOutput,
            },
        };
        const I2C1Output: ClockNode = .{
            .name = "I2C1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSIRCDiv,
                &PLLDIV,
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
        const DIV2USB: ClockNode = .{
            .name = "DIV2USB",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const HSI48MUL: ClockNode = .{
            .name = "HSI48MUL",

            .Nodetype = .{ .multi = @intFromEnum(config.HSI48MUL) },
            .parents = &[_]*const ClockNode{
                &DIV2USB,
                &HSI48RC,
            },
        };
        const @"48USBOutput": ClockNode = .{
            .name = "48USBOutput",
            .Nodetype = .{ .output = .{ .max = 48120000, .min = 47880000 } },
            .parents = &[_]*const ClockNode{&HSI48MUL},
        };
        const @"48RNGOutput": ClockNode = .{
            .name = "48RNGOutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&HSI48MUL},
        };
        const ADCOutput: ClockNode = .{
            .name = "ADCOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSIRCDiv},
        };
        return .{
            .HSIRC = HSIRC,
            .MSIRC = MSIRC,
            .HSI48RC = HSI48RC,
            .HSIRCDiv = HSIRCDiv,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .LCDOutput = LCDOutput,
            .IWDGOutput = IWDGOutput,
            .SysClkSource = SysClkSource,
            .PLLSource = PLLSource,
            .AHBPrescaler = AHBPrescaler,
            .SysCLKOutput = SysCLKOutput,
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
            .LPTIMMult = LPTIMMult,
            .LPTIMOutput = LPTIMOutput,
            .LPUARTMult = LPUARTMult,
            .LPUARTOutput = LPUARTOutput,
            .USART2Mult = USART2Mult,
            .USART2Output = USART2Output,
            .USART1Mult = USART1Mult,
            .USART1Output = USART1Output,
            .I2C1Mult = I2C1Mult,
            .I2C1Output = I2C1Output,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .HSI48MUL = HSI48MUL,
            .@"48USBOutput" = @"48USBOutput",
            .@"48RNGOutput" = @"48RNGOutput",
            .ADCOutput = ADCOutput,
            .VCOIIuput = VCOIIuput,
            .PLLMUL = PLLMUL,
            .PLLDIV = PLLDIV,
            .DIV2USB = DIV2USB,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.TIMOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.PeriphPrescOutput.get_comptime();
        _ = self.LPTIMOutput.get_comptime();
        _ = self.LPUARTOutput.get_comptime();
        _ = self.USART2Output.get_comptime();
        _ = self.USART1Output.get_comptime();
        _ = self.I2C1Output.get_comptime();
        _ = self.@"48USBOutput".get_comptime();
        _ = self.@"48RNGOutput".get_comptime();
    }
};
