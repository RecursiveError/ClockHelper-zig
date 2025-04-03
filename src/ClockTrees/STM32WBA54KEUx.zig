const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HseDivConf = enum {
    DIV1,
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
        };
    }
};
pub const LSIRCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32600;
    }

    pub fn min() f32 {
        return 31400;
    }
};
pub const LSI2RCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32600;
    }

    pub fn min() f32 {
        return 31400;
    }
};
pub const LSIDIVConf = enum {
    DIV1,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV128 => 128,
        };
    }
};
pub const LSIOutConf = enum {
    LSIDIV,
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
pub const RSTClkSourceConf = enum {
    HSERSTDevisor,
    LSEOSC,
    LSIOut,
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HseDiv,
    PLL1R,
};
pub const PLLSourceConf = enum {
    HSIRC,
    HseDiv,
};
pub const PLLMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIOut,
};
pub const USART2MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPUART1MultConf = enum {
    APB7Output,
    SysCLKOutput,
    HSIRC,
    LSEOSC,
};
pub const LPTIM1MultConf = enum {
    APB7Output,
    LSIOut,
    HSIRC,
    LSEOSC,
};
pub const LPTIM2MultConf = enum {
    APB1Prescaler,
    LSIOut,
    HSIRC,
    LSEOSC,
};
pub const ADCMultConf = enum {
    AHBOutput,
    SysCLKOutput,
    HSEOSC,
    HSIRC,
    PLL1P,
};
pub const ASMultConf = enum {
    PLL1P,
    PLL1Q,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const I2C3MultConf = enum {
    APB7Output,
    SysCLKOutput,
    HSIRC,
};
pub const SAI1MultConf = enum {
    PLL1P,
    HSIRC,
    PLL1Q,
    SAI1_EXT,
    SysCLKOutput,
};
pub const RNGMultConf = enum {
    LSEOSC,
    pllqDivToRNG,
    HSIRC,
    LSIOut,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIOut,
    HSEOSC,
    HSIRC,
    PLL1R,
    SysCLKOutput,
    PLL1P,
    PLL1Q,
    AHB5Output,
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
pub const LSCOMultConf = enum {
    LSIOut,
    LSEOSC,
};
pub const AHB5PrescalerConf = enum {
    DIV1,
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
        };
    }
};
pub const AHBPrescalerConf = enum {
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
pub const CortexCLockSelectionConf = enum {
    CortexPrescaler,
    LSEOSC,
    LSIOut,
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
pub const APB7PrescalerConf = enum {
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
pub const SPI1MultConf = enum {
    APB2Prescaler,
    SysCLKOutput,
    HSIRC,
};
pub const SPI3MultConf = enum {
    APB7Output,
    SysCLKOutput,
    HSIRC,
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 512;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLLFRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8191;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const PLL1PConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    DIV10,
    DIV12,
    DIV14,
    DIV16,
    DIV18,
    DIV20,
    DIV22,
    DIV24,
    DIV26,
    DIV28,
    DIV30,
    DIV32,
    DIV34,
    DIV36,
    DIV38,
    DIV40,
    DIV42,
    DIV44,
    DIV46,
    DIV48,
    DIV50,
    DIV52,
    DIV54,
    DIV56,
    DIV58,
    DIV60,
    DIV62,
    DIV64,
    DIV66,
    DIV68,
    DIV70,
    DIV72,
    DIV74,
    DIV76,
    DIV78,
    DIV80,
    DIV82,
    DIV84,
    DIV86,
    DIV88,
    DIV90,
    DIV92,
    DIV94,
    DIV96,
    DIV98,
    DIV100,
    DIV102,
    DIV104,
    DIV106,
    DIV108,
    DIV110,
    DIV112,
    DIV114,
    DIV116,
    DIV118,
    DIV120,
    DIV122,
    DIV124,
    DIV126,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
            .DIV10 => 10,
            .DIV12 => 12,
            .DIV14 => 14,
            .DIV16 => 16,
            .DIV18 => 18,
            .DIV20 => 20,
            .DIV22 => 22,
            .DIV24 => 24,
            .DIV26 => 26,
            .DIV28 => 28,
            .DIV30 => 30,
            .DIV32 => 32,
            .DIV34 => 34,
            .DIV36 => 36,
            .DIV38 => 38,
            .DIV40 => 40,
            .DIV42 => 42,
            .DIV44 => 44,
            .DIV46 => 46,
            .DIV48 => 48,
            .DIV50 => 50,
            .DIV52 => 52,
            .DIV54 => 54,
            .DIV56 => 56,
            .DIV58 => 58,
            .DIV60 => 60,
            .DIV62 => 62,
            .DIV64 => 64,
            .DIV66 => 66,
            .DIV68 => 68,
            .DIV70 => 70,
            .DIV72 => 72,
            .DIV74 => 74,
            .DIV76 => 76,
            .DIV78 => 78,
            .DIV80 => 80,
            .DIV82 => 82,
            .DIV84 => 84,
            .DIV86 => 86,
            .DIV88 => 88,
            .DIV90 => 90,
            .DIV92 => 92,
            .DIV94 => 94,
            .DIV96 => 96,
            .DIV98 => 98,
            .DIV100 => 100,
            .DIV102 => 102,
            .DIV104 => 104,
            .DIV106 => 106,
            .DIV108 => 108,
            .DIV110 => 110,
            .DIV112 => 112,
            .DIV114 => 114,
            .DIV116 => 116,
            .DIV118 => 118,
            .DIV120 => 120,
            .DIV122 => 122,
            .DIV124 => 124,
            .DIV126 => 126,
            .DIV128 => 128,
        };
    }
};
pub const PLL1QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL1RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const Config = struct {
    HseDiv: HseDivConf = .DIV1,
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSI2RC: LSI2RCConf = @enumFromInt(32000),
    LSIDIV: LSIDIVConf = .DIV1,
    LSIOut: LSIOutConf = .LSIDIV,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    RSTClkSource: RSTClkSourceConf = .HSERSTDevisor,
    SysClkSource: SysClkSourceConf = .HSIRC,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLM: PLLMConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIOut,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB7Output,
    LPTIM1Mult: LPTIM1MultConf = .APB7Output,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    ADCMult: ADCMultConf = .AHBOutput,
    ASMult: ASMultConf = .PLL1P,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB7Output,
    SAI1Mult: SAI1MultConf = .HSIRC,
    RNGMult: RNGMultConf = .HSIRC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIOut,
    AHB5Prescaler: AHB5PrescalerConf = .DIV1,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexCLockSelection: CortexCLockSelectionConf = .CortexPrescaler,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    APB7Prescaler: APB7PrescalerConf = .DIV1,
    SPI1Mult: SPI1MultConf = .APB2Prescaler,
    SPI3Mult: SPI3MultConf = .APB7Output,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = .DIV2,
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = @enumFromInt(2),
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    HseDiv: ClockNode,
    LSIRC: ClockNode,
    LSI2RC: ClockNode,
    LSIDIV: ClockNode,
    LSIOut: ClockNode,
    LSEOSC: ClockNode,
    SAI1_EXT: ClockNode,
    HSERSTDevisor: ClockNode,
    RSTClkSource: ClockNode,
    RSTOutput: ClockNode,
    RSTRFOutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    ASMult: ClockNode,
    ASoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    pllqDivToRNG: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    AHB5Prescaler: ClockNode,
    AHB5Output: ClockNode,
    SAESOutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    HCLK4Output: ClockNode,
    CortexPrescaler: ClockNode,
    CortexCLockSelection: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    APB7Prescaler: ClockNode,
    APB7Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
    PLLN: ClockNode,
    PLLFRACN: ClockNode,
    PLL1P: ClockNode,
    PLLPoutput: ClockNode,
    PLL1Q: ClockNode,
    PLLQoutput: ClockNode,
    PLL1R: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 16000000 } },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{ .value = 16000000 } },
        };
        const HseDiv: ClockNode = .{
            .name = "HseDiv",
            .Nodetype = .{ .div = .{ .value = config.HseDiv.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 32600, .min = 31400 },
            } },
        };
        const LSI2RC: ClockNode = .{
            .name = "LSI2RC",
            .Nodetype = .{ .source = .{
                .value = config.LSI2RC.get(),
                .limit = .{ .max = 32600, .min = 31400 },
            } },
        };
        const LSIDIV: ClockNode = .{
            .name = "LSIDIV",
            .Nodetype = .{ .div = .{ .value = config.LSIDIV.get() } },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const LSIOut: ClockNode = .{
            .name = "LSIOut",

            .Nodetype = .{ .multi = @intFromEnum(config.LSIOut) },
            .parents = &[_]*const ClockNode{
                &LSIDIV,
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
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .Nodetype = .{ .source = .{ .value = 48000 } },
        };
        const HSERSTDevisor: ClockNode = .{
            .name = "HSERSTDevisor",
            .Nodetype = .{ .div = .{ .value = 1000 } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RSTClkSource: ClockNode = .{
            .name = "RSTClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.RSTClkSource) },
            .parents = &[_]*const ClockNode{
                &HSERSTDevisor,
                &LSEOSC,
                &LSIOut,
            },
        };
        const RSTOutput: ClockNode = .{
            .name = "RSTOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RSTClkSource},
        };
        const RSTRFOutput: ClockNode = .{
            .name = "RSTRFOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HseDiv,
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = .{ .div = .{ .value = config.PLLM.get(), .limit = .{ .max = 8, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLLFRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = .{ .mulfrac = .{ .value = config.PLLN.get(), .limit = .{ .max = 512, .min = 4 } } },
            .parents = &[_]*const ClockNode{ &PLLM, &PLLFRACN },
        };
        const PLL1R: ClockNode = .{
            .name = "PLL1R",
            .Nodetype = .{ .div = .{ .value = config.PLL1R.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HseDiv,
                &PLL1R,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
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
                &LSIOut,
            },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = .{ .output = .{ .max = 1562500, .min = 0 } },
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIOut},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB1Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
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
        const APB7Prescaler: ClockNode = .{
            .name = "APB7Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB7Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB7Output: ClockNode = .{
            .name = "APB7Output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB7Prescaler},
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB7Output,
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
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM1Mult) },
            .parents = &[_]*const ClockNode{
                &APB7Output,
                &LSIOut,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIOut,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const PLL1P: ClockNode = .{
            .name = "PLL1P",
            .Nodetype = .{ .div = .{ .value = config.PLL1P.get() } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &SysCLKOutput,
                &HSEOSC,
                &HSIRC,
                &PLL1P,
            },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const PLL1Q: ClockNode = .{
            .name = "PLL1Q",
            .Nodetype = .{ .div = .{ .value = config.PLL1Q.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const ASMult: ClockNode = .{
            .name = "ASMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ASMult) },
            .parents = &[_]*const ClockNode{
                &PLL1P,
                &PLL1Q,
            },
        };
        const ASoutput: ClockNode = .{
            .name = "ASoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ASMult},
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
                &APB7Output,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1Mult) },
            .parents = &[_]*const ClockNode{
                &PLL1P,
                &HSIRC,
                &PLL1Q,
                &SAI1_EXT,
                &SysCLKOutput,
            },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const pllqDivToRNG: ClockNode = .{
            .name = "pllqDivToRNG",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLL1Q},
        };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",

            .Nodetype = .{ .multi = @intFromEnum(config.RNGMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &pllqDivToRNG,
                &HSIRC,
                &LSIOut,
            },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const AHB5Prescaler: ClockNode = .{
            .name = "AHB5Prescaler",
            .Nodetype = .{ .div = .{ .value = config.AHB5Prescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHB5Output: ClockNode = .{
            .name = "AHB5Output",
            .Nodetype = .{ .output = .{ .max = 32000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHB5Prescaler},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIOut,
                &HSEOSC,
                &HSIRC,
                &PLL1R,
                &SysCLKOutput,
                &PLL1P,
                &PLL1Q,
                &AHB5Output,
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
        const LSCOMult: ClockNode = .{
            .name = "LSCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LSCOMult) },
            .parents = &[_]*const ClockNode{
                &LSIOut,
                &LSEOSC,
            },
        };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const SAESOutput: ClockNode = .{
            .name = "SAESOutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const HCLK4Output: ClockNode = .{
            .name = "HCLK4Output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = 8 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexCLockSelection: ClockNode = .{
            .name = "CortexCLockSelection",

            .Nodetype = .{ .multi = @intFromEnum(config.CortexCLockSelection) },
            .parents = &[_]*const ClockNode{
                &CortexPrescaler,
                &LSEOSC,
                &LSIOut,
            },
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CortexCLockSelection},
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2: ClockNode = .{
            .name = "TimPrescalerAPB2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI3Mult) },
            .parents = &[_]*const ClockNode{
                &APB7Output,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL1P},
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL1Q},
        };
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .HseDiv = HseDiv,
            .LSIRC = LSIRC,
            .LSI2RC = LSI2RC,
            .LSIDIV = LSIDIV,
            .LSIOut = LSIOut,
            .LSEOSC = LSEOSC,
            .SAI1_EXT = SAI1_EXT,
            .HSERSTDevisor = HSERSTDevisor,
            .RSTClkSource = RSTClkSource,
            .RSTOutput = RSTOutput,
            .RSTRFOutput = RSTRFOutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .ASMult = ASMult,
            .ASoutput = ASoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .pllqDivToRNG = pllqDivToRNG,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .AHB5Prescaler = AHB5Prescaler,
            .AHB5Output = AHB5Output,
            .SAESOutput = SAESOutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .HCLK4Output = HCLK4Output,
            .CortexPrescaler = CortexPrescaler,
            .CortexCLockSelection = CortexCLockSelection,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .APB7Prescaler = APB7Prescaler,
            .APB7Output = APB7Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
            .PLLN = PLLN,
            .PLLFRACN = PLLFRACN,
            .PLL1P = PLL1P,
            .PLLPoutput = PLLPoutput,
            .PLL1Q = PLL1Q,
            .PLLQoutput = PLLQoutput,
            .PLL1R = PLL1R,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.RSTOutput.get_comptime();
        _ = self.RSTRFOutput.get_comptime();
        _ = self.RTCOutput.get_comptime();
        _ = self.IWDGOutput.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.ASoutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.AHB5Output.get_comptime();
        _ = self.SAESOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.HCLK4Output.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.APB7Output.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI3output.get_comptime();
    }
};
