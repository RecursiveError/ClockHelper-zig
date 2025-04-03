const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSISYSConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
        };
    }
};
pub const HSIKERConf = enum {
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
pub const SysClkSourceConf = enum {
    LSEOSC,
    HSEOSC,
    LSIRC,
    HSIUSB48,
    HSISYS,
};
pub const SYSDIVConf = enum {
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
    APBPrescaler,
    SysCLKOutput,
    HSIKER,
    LSEOSC,
};
pub const USBMultConf = enum {
    HSIUSB48,
    HSEOSC,
};
pub const I2S1MultConf = enum {
    SysCLKOutput,
    HSIKER,
    I2S_CKIN,
};
pub const ADCMultConf = enum {
    SysCLKOutput,
    HSIKER,
};
pub const I2C1MultConf = enum {
    APBPrescaler,
    SysCLKOutput,
    HSIKER,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    HSIUSB48,
};
pub const MCODivConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
        };
    }
};
pub const MCO2MultConf = enum {
    LSEOSC,
    LSIRC,
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    HSIUSB48,
};
pub const MCO2DivConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
        };
    }
};
pub const LSCOMultConf = enum {
    LSIRC,
    LSEOSC,
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
pub const APBPrescalerConf = enum {
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
pub const Config = struct {
    HSISYS: HSISYSConf = .DIV4,
    HSIKER: HSIKERConf = .DIV3,
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIUSB48,
    SYSDIV: SYSDIVConf = .DIV1,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    USART1Mult: USART1MultConf = .APBPrescaler,
    USBMult: USBMultConf = .HSIUSB48,
    I2S1Mult: I2S1MultConf = .SysCLKOutput,
    ADCMult: ADCMultConf = .SysCLKOutput,
    I2C1Mult: I2C1MultConf = .APBPrescaler,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIRC,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APBPrescaler: APBPrescalerConf = .DIV1,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSIUSB48: ClockNode,
    HSISYS: ClockNode,
    HSIKER: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    SysClkSource: ClockNode,
    SYSDIV: ClockNode,
    SysCLKOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    I2S1Mult: ClockNode,
    I2S1output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2S_CKIN: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    AHBPrescaler: ClockNode,
    PWRCLKoutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APBPrescaler: ClockNode,
    APBOutput: ClockNode,
    TimPrescalerAPB: ClockNode,
    TimPrescOut1: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const HSIUSB48: ClockNode = .{
            .name = "HSIUSB48",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const HSISYS: ClockNode = .{
            .name = "HSISYS",
            .Nodetype = .{ .div = .{ .value = config.HSISYS.get() } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSIKER: ClockNode = .{
            .name = "HSIKER",
            .Nodetype = .{ .div = .{ .value = config.HSIKER.get() } },
            .parents = &[_]*const ClockNode{&HSIRC},
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
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 1000 },
            } },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &HSEOSC,
                &LSIRC,
                &HSIUSB48,
                &HSISYS,
            },
        };
        const SYSDIV: ClockNode = .{
            .name = "SYSDIV",
            .Nodetype = .{ .div = .{ .value = config.SYSDIV.get() } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SYSDIV},
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
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APBPrescaler: ClockNode = .{
            .name = "APBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.APBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIKER,
                &LSEOSC,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USBMult: ClockNode = .{
            .name = "USBMult",

            .Nodetype = .{ .multi = @intFromEnum(config.USBMult) },
            .parents = &[_]*const ClockNode{
                &HSIUSB48,
                &HSEOSC,
            },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USBMult},
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const I2S1Mult: ClockNode = .{
            .name = "I2S1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2S1Mult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIKER,
                &I2S_CKIN,
            },
        };
        const I2S1output: ClockNode = .{
            .name = "I2S1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2S1Mult},
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIKER,
            },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIKER,
            },
        };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &SysCLKOutput,
                &HSIUSB48,
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
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO2Mult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &SysCLKOutput,
                &HSIUSB48,
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
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = .{ .output = null },
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
        const APBOutput: ClockNode = .{
            .name = "APBOutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const TimPrescalerAPB: ClockNode = .{
            .name = "TimPrescalerAPB",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB},
        };
        return .{
            .HSIRC = HSIRC,
            .HSIUSB48 = HSIUSB48,
            .HSISYS = HSISYS,
            .HSIKER = HSIKER,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .SysClkSource = SysClkSource,
            .SYSDIV = SYSDIV,
            .SysCLKOutput = SysCLKOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .I2S1Mult = I2S1Mult,
            .I2S1output = I2S1output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2S_CKIN = I2S_CKIN,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .AHBPrescaler = AHBPrescaler,
            .PWRCLKoutput = PWRCLKoutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APBPrescaler = APBPrescaler,
            .APBOutput = APBOutput,
            .TimPrescalerAPB = TimPrescalerAPB,
            .TimPrescOut1 = TimPrescOut1,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.SysCLKOutput.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.I2S1output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APBOutput.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
    }
};
