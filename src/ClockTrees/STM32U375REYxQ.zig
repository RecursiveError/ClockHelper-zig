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
        return 50000000;
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
pub const LSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 40000;
    }

    pub fn min() f32 {
        return 5000;
    }
};
pub const MSIKSourceConf = enum {
    CLOCK_96,
    CLOCK_24,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .CLOCK_96 => 96,
            .CLOCK_24 => 24,
        };
    }
};
pub const MSISSourceConf = enum {
    CLOCK_96,
    CLOCK_24,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .CLOCK_96 => 96,
            .CLOCK_24 => 24,
        };
    }
};
pub const MSIKDIVConf = enum {
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
pub const MSISDIVConf = enum {
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
pub const SysClkSourceConf = enum {
    MSISOutput,
    HSIRC,
    HSEOSC,
};
pub const SPI1MultConf = enum {
    APB2Prescaler,
    MSIKDIV,
};
pub const SPI3MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const SPI2MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIDIV,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    HSIRC,
};
pub const USART3MultConf = enum {
    APB1Prescaler,
    HSIRC,
};
pub const UART4MultConf = enum {
    APB1Prescaler,
    HSIRC,
};
pub const ADCMultConf = enum {
    AHBOutput,
    HSEOSC,
    MSIKDIV,
};
pub const ADCDivConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
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
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
            .DIV512 => 512,
        };
    }
};
pub const UART5MultConf = enum {
    APB1Prescaler,
    HSIRC,
};
pub const LPUART1MultConf = enum {
    APB3Output,
    HSIRC,
    LSEOSC,
    MSIKDIV,
};
pub const LPTIM1MultConf = enum {
    MSIKDIV,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const LPTIM2MultConf = enum {
    APB1Prescaler,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const DACMultConf = enum {
    LSEOSC,
    LSIDIV,
};
pub const ICLKMultConf = enum {
    SysCLKOutput,
    MSIKDIV,
    HSEOSC,
    HSI48RC,
};
pub const USBDivConf = enum {
    DIV1,
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
        };
    }
};
pub const FDCANMultConf = enum {
    SysCLKOutput,
    MSIKDIV,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const I3C1MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const I3C2MultConf = enum {
    APB3Output,
    MSIKDIV,
};
pub const I2C2MultConf = enum {
    APB1Prescaler,
    MSIKDIV,
};
pub const I2C3MultConf = enum {
    APB3Output,
    MSIKDIV,
};
pub const SAI1MultConf = enum {
    MSIKDIV,
    SAI1_EXT,
    HSEOSC,
};
pub const ADF1MultConf = enum {
    AHBOutput,
    SAI1_EXT,
    MSIKDIV,
    SAI1output,
};
pub const OCTOSPIMMultConf = enum {
    SysCLKOutput,
    MSIKDIV,
};
pub const LPTIM3MultConf = enum {
    MSIKDIV,
    LSIDIV,
    HSIRC,
    LSEOSC,
};
pub const RNGMultConf = enum {
    HSI48RC,
    MSIKDIV,
};
pub const MCOMultConf = enum {
    LSEOSC,
    LSIDIV,
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    MSISDIV,
    HSI48RC,
    MSIKDIV,
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
    LSIDIV,
    HSEOSC,
    HSIRC,
    SysCLKOutput,
    MSISDIV,
    HSI48RC,
    MSIKDIV,
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
    LSIDIV,
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
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV8 => 8,
        };
    }
};
pub const CortexCLockSelectionConf = enum {
    CortexPrescaler,
    LSEOSC,
    LSIDIV,
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
pub const APB3PrescalerConf = enum {
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
    HSEOSC: HSEOSCConf = @enumFromInt(16000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSIDIV: LSIDIVConf = .DIV1,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIKSource: MSIKSourceConf = .CLOCK_96,
    MSISSource: MSISSourceConf = .CLOCK_96,
    MSIKDIV: MSIKDIVConf = .DIV1,
    MSISDIV: MSISDIVConf = .DIV8,
    SysClkSource: SysClkSourceConf = .MSISOutput,
    SPI1Mult: SPI1MultConf = .APB2Prescaler,
    SPI3Mult: SPI3MultConf = .APB1Prescaler,
    SPI2Mult: SPI2MultConf = .APB1Prescaler,
    RTCClkSource: RTCClkSourceConf = .LSIDIV,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    ADCMult: ADCMultConf = .AHBOutput,
    ADCDiv: ADCDivConf = .DIV1,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB3Output,
    LPTIM1Mult: LPTIM1MultConf = .MSIKDIV,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    DACMult: DACMultConf = .LSIDIV,
    ICLKMult: ICLKMultConf = .SysCLKOutput,
    USBDiv: USBDivConf = .DIV1,
    FDCANMult: FDCANMultConf = .SysCLKOutput,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I3C1Mult: I3C1MultConf = .APB1Prescaler,
    I3C2Mult: I3C2MultConf = .APB3Output,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB3Output,
    SAI1Mult: SAI1MultConf = .MSIKDIV,
    ADF1Mult: ADF1MultConf = .AHBOutput,
    OCTOSPIMMult: OCTOSPIMMultConf = .SysCLKOutput,
    LPTIM3Mult: LPTIM3MultConf = .MSIKDIV,
    RNGMult: RNGMultConf = .HSI48RC,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODiv: MCODivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIDIV,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV8,
    CortexCLockSelection: CortexCLockSelectionConf = .CortexPrescaler,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    APB3Prescaler: APB3PrescalerConf = .DIV1,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    CRSCLKoutput: ClockNode,
    HSI48RC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSIDIV: ClockNode,
    LSEOSC: ClockNode,
    MSIKSource: ClockNode,
    MSISSource: ClockNode,
    MSIKDIV: ClockNode,
    MSISDIV: ClockNode,
    MSISOutput: ClockNode,
    SAI1_EXT: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
    SPI2Mult: ClockNode,
    SPI2output: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    UART4Mult: ClockNode,
    UART4output: ClockNode,
    ADCMult: ClockNode,
    ADCDiv: ClockNode,
    ADCoutput: ClockNode,
    UART5Mult: ClockNode,
    UART5output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    DACMult: ClockNode,
    DACoutput: ClockNode,
    ICLKMult: ClockNode,
    SDMMC1Output: ClockNode,
    USBDiv: ClockNode,
    USBoutput: ClockNode,
    FDCANMult: ClockNode,
    FDCANOutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I3C1Mult: ClockNode,
    I3C1output: ClockNode,
    I3C2Mult: ClockNode,
    I3C2output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    ADF1Mult: ClockNode,
    ADF1output: ClockNode,
    OCTOSPIMMult: ClockNode,
    OCTOSPIMoutput: ClockNode,
    LPTIM3Mult: ClockNode,
    LPTIM3output: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
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
    APB3Prescaler: ClockNode,
    APB3Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 16000000 } },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const CRSCLKoutput: ClockNode = .{
            .name = "CRSCLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSI48RC},
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 50000000, .min = 4000000 },
            } },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 32600, .min = 31400 },
            } },
        };
        const LSIDIV: ClockNode = .{
            .name = "LSIDIV",
            .Nodetype = .{ .div = .{ .value = config.LSIDIV.get() } },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 40000, .min = 5000 },
            } },
        };
        const MSIKSource: ClockNode = .{
            .name = "MSIKSource",
            .Nodetype = .{ .source = .{ .value = config.MSIKSource.get() } },
        };
        const MSISSource: ClockNode = .{
            .name = "MSISSource",
            .Nodetype = .{ .source = .{ .value = config.MSISSource.get() } },
        };
        const MSIKDIV: ClockNode = .{
            .name = "MSIKDIV",
            .Nodetype = .{ .div = .{ .value = config.MSIKDIV.get() } },
            .parents = &[_]*const ClockNode{&MSIKSource},
        };
        const MSISDIV: ClockNode = .{
            .name = "MSISDIV",
            .Nodetype = .{ .div = .{ .value = config.MSISDIV.get() } },
            .parents = &[_]*const ClockNode{&MSISSource},
        };
        const MSISOutput: ClockNode = .{
            .name = "MSISOutput",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MSISDIV},
        };
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .Nodetype = .{ .source = .{ .value = 48000 } },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &MSISOutput,
                &HSIRC,
                &HSEOSC,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB2Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &MSIKDIV,
            },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB1Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI3Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI2Mult},
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
                &LSIDIV,
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
            .parents = &[_]*const ClockNode{&LSIDIV},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &HSIRC,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART3Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRC,
            },
        };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART4Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRC,
            },
        };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &HSEOSC,
                &MSIKDIV,
            },
        };
        const ADCDiv: ClockNode = .{
            .name = "ADCDiv",
            .Nodetype = .{ .div = .{ .value = config.ADCDiv.get() } },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADCDiv},
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART5Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRC,
            },
        };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const APB3Prescaler: ClockNode = .{
            .name = "APB3Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB3Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB3Prescaler},
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB3Output,
                &HSIRC,
                &LSEOSC,
                &MSIKDIV,
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
                &MSIKDIV,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const DACMult: ClockNode = .{
            .name = "DACMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DACMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIDIV,
            },
        };
        const DACoutput: ClockNode = .{
            .name = "DACoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DACMult},
        };
        const ICLKMult: ClockNode = .{
            .name = "ICLKMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ICLKMult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &MSIKDIV,
                &HSEOSC,
                &HSI48RC,
            },
        };
        const SDMMC1Output: ClockNode = .{
            .name = "SDMMC1Output",
            .Nodetype = .{ .output = .{ .max = 55000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ICLKMult},
        };
        const USBDiv: ClockNode = .{
            .name = "USBDiv",
            .Nodetype = .{ .div = .{ .value = config.USBDiv.get() } },
            .parents = &[_]*const ClockNode{&ICLKMult},
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USBDiv},
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FDCANMult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &MSIKDIV,
            },
        };
        const FDCANOutput: ClockNode = .{
            .name = "FDCANOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I3C1Mult: ClockNode = .{
            .name = "I3C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I3C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const I3C1output: ClockNode = .{
            .name = "I3C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I3C1Mult},
        };
        const I3C2Mult: ClockNode = .{
            .name = "I3C2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I3C2Mult) },
            .parents = &[_]*const ClockNode{
                &APB3Output,
                &MSIKDIV,
            },
        };
        const I3C2output: ClockNode = .{
            .name = "I3C2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I3C2Mult},
        };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
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
                &APB3Output,
                &MSIKDIV,
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
                &MSIKDIV,
                &SAI1_EXT,
                &HSEOSC,
            },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const ADF1Mult: ClockNode = .{
            .name = "ADF1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADF1Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &SAI1_EXT,
                &MSIKDIV,
                &SAI1output,
            },
        };
        const ADF1output: ClockNode = .{
            .name = "ADF1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADF1Mult},
        };
        const OCTOSPIMMult: ClockNode = .{
            .name = "OCTOSPIMMult",

            .Nodetype = .{ .multi = @intFromEnum(config.OCTOSPIMMult) },
            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &MSIKDIV,
            },
        };
        const OCTOSPIMoutput: ClockNode = .{
            .name = "OCTOSPIMoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&OCTOSPIMMult},
        };
        const LPTIM3Mult: ClockNode = .{
            .name = "LPTIM3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM3Mult) },
            .parents = &[_]*const ClockNode{
                &MSIKDIV,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",

            .Nodetype = .{ .multi = @intFromEnum(config.RNGMult) },
            .parents = &[_]*const ClockNode{
                &HSI48RC,
                &MSIKDIV,
            },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIDIV,
                &HSEOSC,
                &HSIRC,
                &SysCLKOutput,
                &MSISDIV,
                &HSI48RC,
                &MSIKDIV,
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
                &LSIDIV,
                &HSEOSC,
                &HSIRC,
                &SysCLKOutput,
                &MSISDIV,
                &HSI48RC,
                &MSIKDIV,
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
                &LSIDIV,
                &LSEOSC,
            },
        };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = config.CortexPrescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexCLockSelection: ClockNode = .{
            .name = "CortexCLockSelection",

            .Nodetype = .{ .multi = @intFromEnum(config.CortexCLockSelection) },
            .parents = &[_]*const ClockNode{
                &CortexPrescaler,
                &LSEOSC,
                &LSIDIV,
            },
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CortexCLockSelection},
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2: ClockNode = .{
            .name = "TimPrescalerAPB2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = .{ .output = .{ .max = 96000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        return .{
            .HSIRC = HSIRC,
            .CRSCLKoutput = CRSCLKoutput,
            .HSI48RC = HSI48RC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSIDIV = LSIDIV,
            .LSEOSC = LSEOSC,
            .MSIKSource = MSIKSource,
            .MSISSource = MSISSource,
            .MSIKDIV = MSIKDIV,
            .MSISDIV = MSISDIV,
            .MSISOutput = MSISOutput,
            .SAI1_EXT = SAI1_EXT,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
            .SPI2Mult = SPI2Mult,
            .SPI2output = SPI2output,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .UART4Mult = UART4Mult,
            .UART4output = UART4output,
            .ADCMult = ADCMult,
            .ADCDiv = ADCDiv,
            .ADCoutput = ADCoutput,
            .UART5Mult = UART5Mult,
            .UART5output = UART5output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .DACMult = DACMult,
            .DACoutput = DACoutput,
            .ICLKMult = ICLKMult,
            .SDMMC1Output = SDMMC1Output,
            .USBDiv = USBDiv,
            .USBoutput = USBoutput,
            .FDCANMult = FDCANMult,
            .FDCANOutput = FDCANOutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I3C1Mult = I3C1Mult,
            .I3C1output = I3C1output,
            .I3C2Mult = I3C2Mult,
            .I3C2output = I3C2output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .ADF1Mult = ADF1Mult,
            .ADF1output = ADF1output,
            .OCTOSPIMMult = OCTOSPIMMult,
            .OCTOSPIMoutput = OCTOSPIMoutput,
            .LPTIM3Mult = LPTIM3Mult,
            .LPTIM3output = LPTIM3output,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
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
            .APB3Prescaler = APB3Prescaler,
            .APB3Output = APB3Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.CRSCLKoutput.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI3output.get_comptime();
        _ = self.SPI2output.get_comptime();
        _ = self.RTCOutput.get_comptime();
        _ = self.IWDGOutput.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.UART4output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.UART5output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.DACoutput.get_comptime();
        _ = self.SDMMC1Output.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.FDCANOutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I3C1output.get_comptime();
        _ = self.I3C2output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.ADF1output.get_comptime();
        _ = self.OCTOSPIMoutput.get_comptime();
        _ = self.LPTIM3output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.APB3Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
    }
};
