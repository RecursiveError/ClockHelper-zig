const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSISYSCLKDividerConf = enum {
    RCC_HSI_DIV1,
    RCC_HSI_DIV2,
    RCC_HSI_DIV4,
    RCC_HSI_DIV8,
    RCC_HSI_DIV16,
    RCC_HSI_DIV32,
    RCC_HSI_DIV64,
    RCC_HSI_DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSI_DIV4 => 4,
            .RCC_HSI_DIV128 => 128,
            .RCC_HSI_DIV16 => 16,
            .RCC_HSI_DIV64 => 64,
            .RCC_HSI_DIV1 => 1,
            .RCC_HSI_DIV32 => 32,
            .RCC_HSI_DIV8 => 8,
            .RCC_HSI_DIV2 => 2,
        };
    }
};
pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_LSE,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
    RCC_SYSCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLMConf = enum {
    RCC_PLLM_DIV1,
    RCC_PLLM_DIV2,
    RCC_PLLM_DIV3,
    RCC_PLLM_DIV4,
    RCC_PLLM_DIV5,
    RCC_PLLM_DIV6,
    RCC_PLLM_DIV7,
    RCC_PLLM_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLM_DIV2 => 2,
            .RCC_PLLM_DIV8 => 8,
            .RCC_PLLM_DIV3 => 3,
            .RCC_PLLM_DIV6 => 6,
            .RCC_PLLM_DIV1 => 1,
            .RCC_PLLM_DIV5 => 5,
            .RCC_PLLM_DIV4 => 4,
            .RCC_PLLM_DIV7 => 7,
        };
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK1,
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2S1CLockSelectionConf = enum {
    RCC_I2S1CLKSOURCE_SYSCLK,
    RCC_I2S1CLKSOURCE_PLL,
    RCC_I2S1CLKSOURCE_HSI,
    RCC_I2S1CLKSOURCE_EXT,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const TIM1CLockSelectionVirtualConf = enum {
    RCC_TIM1CLKSOURCE_PCLK1,
    RCC_TIM1CLKSOURCE_PLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_SYSCLK,
    RCC_ADCCLKSOURCE_HSI,
    RCC_ADCCLKSOURCE_PLLADC,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_SYSCLK,
    RCC_I2C1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCODivConf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_4,
    RCC_MCODIV_8,
    RCC_MCODIV_16,
    RCC_MCODIV_32,
    RCC_MCODIV_64,
    RCC_MCODIV_128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_32 => 32,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_64 => 64,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_128 => 128,
        };
    }
};
pub const LSCOSource1Conf = enum {
    RCC_LSCOSOURCE_LSI,
    RCC_LSCOSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const AHBCLKDividerConf = enum {
    RCC_SYSCLK_DIV1,
    RCC_SYSCLK_DIV2,
    RCC_SYSCLK_DIV4,
    RCC_SYSCLK_DIV8,
    RCC_SYSCLK_DIV16,
    RCC_SYSCLK_DIV64,
    RCC_SYSCLK_DIV128,
    RCC_SYSCLK_DIV256,
    RCC_SYSCLK_DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_SYSCLK_DIV64 => 64,
            .RCC_SYSCLK_DIV2 => 2,
            .RCC_SYSCLK_DIV512 => 512,
            .RCC_SYSCLK_DIV16 => 16,
            .RCC_SYSCLK_DIV1 => 1,
            .RCC_SYSCLK_DIV4 => 4,
            .RCC_SYSCLK_DIV8 => 8,
            .RCC_SYSCLK_DIV256 => 256,
            .RCC_SYSCLK_DIV128 => 128,
        };
    }
};
pub const Cortex_DivConf = enum {
    SYSTICK_CLKSOURCE_HCLK,
    SYSTICK_CLKSOURCE_HCLK_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .SYSTICK_CLKSOURCE_HCLK => 1,
            .SYSTICK_CLKSOURCE_HCLK_DIV8 => 8,
        };
    }
};
pub const APB1CLKDividerConf = enum {
    RCC_HCLK_DIV1,
    RCC_HCLK_DIV2,
    RCC_HCLK_DIV4,
    RCC_HCLK_DIV8,
    RCC_HCLK_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HCLK_DIV16 => 16,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV1 => 1,
        };
    }
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLPConf = enum {
    RCC_PLLP_DIV2,
    RCC_PLLP_DIV3,
    RCC_PLLP_DIV4,
    RCC_PLLP_DIV5,
    RCC_PLLP_DIV6,
    RCC_PLLP_DIV7,
    RCC_PLLP_DIV8,
    RCC_PLLP_DIV9,
    RCC_PLLP_DIV10,
    RCC_PLLP_DIV11,
    RCC_PLLP_DIV12,
    RCC_PLLP_DIV13,
    RCC_PLLP_DIV14,
    RCC_PLLP_DIV15,
    RCC_PLLP_DIV16,
    RCC_PLLP_DIV17,
    RCC_PLLP_DIV18,
    RCC_PLLP_DIV19,
    RCC_PLLP_DIV20,
    RCC_PLLP_DIV21,
    RCC_PLLP_DIV22,
    RCC_PLLP_DIV23,
    RCC_PLLP_DIV24,
    RCC_PLLP_DIV25,
    RCC_PLLP_DIV26,
    RCC_PLLP_DIV27,
    RCC_PLLP_DIV28,
    RCC_PLLP_DIV29,
    RCC_PLLP_DIV30,
    RCC_PLLP_DIV31,
    RCC_PLLP_DIV32,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV24 => 24,
            .RCC_PLLP_DIV7 => 7,
            .RCC_PLLP_DIV20 => 20,
            .RCC_PLLP_DIV31 => 31,
            .RCC_PLLP_DIV9 => 9,
            .RCC_PLLP_DIV15 => 15,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV5 => 5,
            .RCC_PLLP_DIV19 => 19,
            .RCC_PLLP_DIV8 => 8,
            .RCC_PLLP_DIV11 => 11,
            .RCC_PLLP_DIV2 => 2,
            .RCC_PLLP_DIV3 => 3,
            .RCC_PLLP_DIV18 => 18,
            .RCC_PLLP_DIV12 => 12,
            .RCC_PLLP_DIV32 => 32,
            .RCC_PLLP_DIV25 => 25,
            .RCC_PLLP_DIV14 => 14,
            .RCC_PLLP_DIV10 => 10,
            .RCC_PLLP_DIV28 => 28,
            .RCC_PLLP_DIV13 => 13,
            .RCC_PLLP_DIV16 => 16,
            .RCC_PLLP_DIV22 => 22,
            .RCC_PLLP_DIV21 => 21,
            .RCC_PLLP_DIV29 => 29,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV23 => 23,
            .RCC_PLLP_DIV26 => 26,
            .RCC_PLLP_DIV30 => 30,
            .RCC_PLLP_DIV27 => 27,
        };
    }
};
pub const PLLQConf = enum {
    RCC_PLLQ_DIV2,
    RCC_PLLQ_DIV3,
    RCC_PLLQ_DIV4,
    RCC_PLLQ_DIV5,
    RCC_PLLQ_DIV6,
    RCC_PLLQ_DIV7,
    RCC_PLLQ_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLQ_DIV3 => 3,
            .RCC_PLLQ_DIV2 => 2,
            .RCC_PLLQ_DIV8 => 8,
            .RCC_PLLQ_DIV4 => 4,
            .RCC_PLLQ_DIV6 => 6,
            .RCC_PLLQ_DIV5 => 5,
            .RCC_PLLQ_DIV7 => 7,
        };
    }
};
pub const PLLRConf = enum {
    RCC_PLLR_DIV2,
    RCC_PLLR_DIV3,
    RCC_PLLR_DIV4,
    RCC_PLLR_DIV5,
    RCC_PLLR_DIV6,
    RCC_PLLR_DIV7,
    RCC_PLLR_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLR_DIV2 => 2,
            .RCC_PLLR_DIV8 => 8,
            .RCC_PLLR_DIV7 => 7,
            .RCC_PLLR_DIV3 => 3,
            .RCC_PLLR_DIV5 => 5,
            .RCC_PLLR_DIV6 => 6,
            .RCC_PLLR_DIV4 => 4,
        };
    }
};
pub const HSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSE_Drive_CapabilityConf = enum {
    RCC_LSEDRIVE_LOW,
    RCC_LSEDRIVE_MEDIUMLOW,
    RCC_LSEDRIVE_MEDIUMHIGH,
    RCC_LSEDRIVE_HIGH,
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_LSEDRIVE_LOW => 0,
            .RCC_LSEDRIVE_MEDIUMHIGH => 2,
            .null => 0,
            .RCC_LSEDRIVE_MEDIUMLOW => 1,
            .RCC_LSEDRIVE_HIGH => 3,
        };
    }
};
pub const LSE_Drive_CapabilityArgConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    HSISYS: ?HSISYSCLKDividerConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    USART1Mult: ?USART1CLockSelectionConf = null,
    I2S1Mult: ?I2S1CLockSelectionConf = null,
    TIM1Mult: ?TIM1CLockSelectionVirtualConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    MCOMult: ?RCC_MCO1SourceConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    LSCOMult: ?LSCOSource1Conf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    APBPrescaler: ?APB1CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    LSE_Drive_CapabilityArg: ?LSE_Drive_CapabilityArgConf = null,
};

pub const ConfigWithRef = struct {
    HSISYSCLKDivider: ?HSISYSCLKDividerConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLM: ?PLLMConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    USART1CLockSelection: ?USART1CLockSelectionConf = null,
    I2S1CLockSelection: ?I2S1CLockSelectionConf = null,
    TIM1CLockSelectionVirtual: ?TIM1CLockSelectionVirtualConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    LSCOSource1: ?LSCOSource1Conf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    LSE_Drive_CapabilityArg: ?LSE_Drive_CapabilityArgConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSISYS = self.HSISYSCLKDivider,
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .I2S1Mult = self.I2S1CLockSelection,
            .TIM1Mult = self.TIM1CLockSelectionVirtual,
            .ADCMult = self.ADCCLockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
            .LSCOMult = self.LSCOSource1,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APBPrescaler = self.APB1CLKDivider,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLR = self.PLLR,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
            .LSE_Drive_CapabilityArg = self.LSE_Drive_CapabilityArg,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSISYS: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
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
    I2S1Mult: ClockNode,
    I2S1output: ClockNode,
    TIM1Mult: ClockNode,
    TIM1output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2S_CKIN: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
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
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLPoutput: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLR: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,
    LSE_Drive_CapabilityArg: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSISYSval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSISYS) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSISYS: ClockNode = .{
            .name = "HSISYS",
            .Nodetype = HSISYSval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = 48000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = 1000000, .min = 1000 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const PLLSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLMval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLM) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 8,
                .limit = .{ .max = 86, .min = 8 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLRval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLR) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = PLLRval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &HSISYS,
                &HSEOSC,
                &PLLR,
                &LSIRC,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",
            .Nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{ .output = null };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const LCDOutputval = ClockNodeTypes{ .output = null };
        const LCDOutput: ClockNode = .{
            .name = "LCDOutput",
            .Nodetype = LCDOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const AHBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.AHBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APBPrescaler: ClockNode = .{
            .name = "APBPrescaler",
            .Nodetype = APBPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART1outputval = ClockNodeTypes{ .output = null };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const PLLPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = PLLPval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
        };
        const I2S1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2S1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2S1Mult: ClockNode = .{
            .name = "I2S1Mult",
            .Nodetype = I2S1Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLLP,
                &HSIRC,
                &I2S_CKIN,
            },
        };
        const I2S1outputval = ClockNodeTypes{ .output = null };
        const I2S1output: ClockNode = .{
            .name = "I2S1output",
            .Nodetype = I2S1outputval,
            .parents = &[_]*const ClockNode{&I2S1Mult},
        };
        const TimPrescalerAPBval = blk: {
            if (APBPrescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const TimPrescalerAPB: ClockNode = .{
            .name = "TimPrescalerAPB",
            .Nodetype = TimPrescalerAPBval,
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const PLLQval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLQ) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const TIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.TIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const TIM1Mult: ClockNode = .{
            .name = "TIM1Mult",
            .Nodetype = TIM1Multval,

            .parents = &[_]*const ClockNode{
                &TimPrescalerAPB,
                &PLLQ,
            },
        };
        const TIM1outputval = ClockNodeTypes{
            .output = .{ .max = 128000000, .min = 0 },
        };
        const TIM1output: ClockNode = .{
            .name = "TIM1output",
            .Nodetype = TIM1outputval,
            .parents = &[_]*const ClockNode{&TIM1Mult},
        };
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .Nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &PLLP,
            },
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = 80000000, .min = 140000 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const I2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APBPrescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = I2C1outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 5;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &PLLR,
                &SysCLKOutput,
            },
        };
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCODiv: ClockNode = .{
            .name = "MCODiv",
            .Nodetype = MCODivval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPinval = ClockNodeTypes{ .output = null };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .Nodetype = MCOPinval,
            .parents = &[_]*const ClockNode{&MCODiv},
        };
        const LSCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LSCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LSCOMult: ClockNode = .{
            .name = "LSCOMult",
            .Nodetype = LSCOMultval,

            .parents = &[_]*const ClockNode{
                &LSIRC,
                &LSEOSC,
            },
        };
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = LSCOOutputval,
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const PWRCLKoutputval = ClockNodeTypes{ .output = null };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = PWRCLKoutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APBOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const APBOutput: ClockNode = .{
            .name = "APBOutput",
            .Nodetype = APBOutputval,
            .parents = &[_]*const ClockNode{&APBPrescaler},
        };
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB},
        };
        const PLLPoutputval = ClockNodeTypes{
            .output = .{ .max = 40000000, .min = 3090000 },
        };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .Nodetype = PLLPoutputval,
            .parents = &[_]*const ClockNode{&PLLP},
        };
        const PLLQoutputval = ClockNodeTypes{
            .output = .{ .max = 33000000, .min = 12000000 },
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 64,
                .limit = .{ .max = 127, .min = 0 },
            },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.LSE_Drive_Capability) |val| {
                    switch (val) {
                        .null,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        } };
        const LSE_Drive_CapabilityArgval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.LSE_Drive_CapabilityArg) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
        return .{
            .HSIRC = HSIRC,
            .HSISYS = HSISYS,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
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
            .I2S1Mult = I2S1Mult,
            .I2S1output = I2S1output,
            .TIM1Mult = TIM1Mult,
            .TIM1output = TIM1output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2S_CKIN = I2S_CKIN,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
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
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLPoutput = PLLPoutput,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLR = PLLR,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
            .LSE_Drive_CapabilityArg = LSE_Drive_CapabilityArgval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.USART1output.get_comptime();
        _ = self.I2S1output.get_comptime();
        _ = self.TIM1output.get_comptime();
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
