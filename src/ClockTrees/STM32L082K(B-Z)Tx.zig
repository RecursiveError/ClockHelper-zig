const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const MSIClockRangeConf = enum {
    RCC_MSIRANGE_0,
    RCC_MSIRANGE_1,
    RCC_MSIRANGE_2,
    RCC_MSIRANGE_3,
    RCC_MSIRANGE_4,
    RCC_MSIRANGE_5,
    RCC_MSIRANGE_6,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSIRANGE_3 => 524.288,
            .RCC_MSIRANGE_4 => 1048,
            .RCC_MSIRANGE_5 => 2097,
            .RCC_MSIRANGE_0 => 65.536,
            .RCC_MSIRANGE_6 => 4194,
            .RCC_MSIRANGE_2 => 262.144,
            .RCC_MSIRANGE_1 => 131.072,
        };
    }
};
pub const HSIRCDivConf = enum {
    @"1",
    @"4",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"4" => 4,
        };
    }
};
pub const LSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,

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
pub const TimPrescalerConf = enum {
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
pub const APB2CLKDividerConf = enum {
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
pub const LptimClockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,
    RCC_LPTIM1CLKSOURCE_PCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Lpuart1ClockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK1,
    RCC_LPUART1CLKSOURCE_LSE,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Usart2ClockSelectionConf = enum {
    RCC_USART2CLKSOURCE_SYSCLK,
    RCC_USART2CLKSOURCE_HSI,
    RCC_USART2CLKSOURCE_LSE,
    RCC_USART2CLKSOURCE_PCLK1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Usart1ClockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2c1ClockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2c3ClockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK1,
    RCC_I2C3CLKSOURCE_HSI,
    RCC_I2C3CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCOSourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_MSI,
    RCC_MCO1SOURCE_HSI48,

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
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_4 => 4,
        };
    }
};
pub const HSI48MClockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_HSI48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLMULConf = enum {
    RCC_PLLMUL_3,
    RCC_PLLMUL_4,
    RCC_PLLMUL_6,
    RCC_PLLMUL_8,
    RCC_PLLMUL_12,
    RCC_PLLMUL_16,
    RCC_PLLMUL_24,
    RCC_PLLMUL_32,
    RCC_PLLMUL_48,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLMUL_48 => 48,
            .RCC_PLLMUL_3 => 3,
            .RCC_PLLMUL_4 => 4,
            .RCC_PLLMUL_6 => 6,
            .RCC_PLLMUL_12 => 12,
            .RCC_PLLMUL_16 => 16,
            .RCC_PLLMUL_24 => 24,
            .RCC_PLLMUL_32 => 32,
            .RCC_PLLMUL_8 => 8,
        };
    }
};
pub const PLLDIVConf = enum {
    RCC_PLLDIV_2,
    RCC_PLLDIV_3,
    RCC_PLLDIV_4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLDIV_4 => 4,
            .RCC_PLLDIV_3 => 3,
            .RCC_PLLDIV_2 => 2,
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
pub const MSICalibrationValueConf = enum(u32) {
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
pub const Config = struct {
    MSIRC: ?MSIClockRangeConf = null,
    HSIRCDiv: ?HSIRCDivConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    TIMPrescaler: ?TimPrescalerConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    LPTIMMult: ?LptimClockSelectionConf = null,
    LPUARTMult: ?Lpuart1ClockSelectionConf = null,
    USART2Mult: ?Usart2ClockSelectionConf = null,
    USART1Mult: ?Usart1ClockSelectionConf = null,
    I2C1Mult: ?I2c1ClockSelectionConf = null,
    I2C3Mult: ?I2c3ClockSelectionConf = null,
    MCOMult: ?RCC_MCOSourceConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    HSI48MUL: ?HSI48MClockSelectionConf = null,
    PLLMUL: ?PLLMULConf = null,
    PLLDIV: ?PLLDIVConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    MSIClockRange: ?MSIClockRangeConf = null,
    HSIRCDiv: ?HSIRCDivConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    TimPrescaler: ?TimPrescalerConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    LptimClockSelection: ?LptimClockSelectionConf = null,
    Lpuart1ClockSelection: ?Lpuart1ClockSelectionConf = null,
    Usart2ClockSelection: ?Usart2ClockSelectionConf = null,
    Usart1ClockSelection: ?Usart1ClockSelectionConf = null,
    I2c1ClockSelection: ?I2c1ClockSelectionConf = null,
    I2c3ClockSelection: ?I2c3ClockSelectionConf = null,
    RCC_MCOSource: ?RCC_MCOSourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    HSI48MClockSelection: ?HSI48MClockSelectionConf = null,
    PLLMUL: ?PLLMULConf = null,
    PLLDIV: ?PLLDIVConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .MSIRC = self.MSIClockRange,
            .HSIRCDiv = self.HSIRCDiv,
            .LSEOSC = self.LSE_VALUE,
            .RTCClkSource = self.RTCClockSelection,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .AHBPrescaler = self.AHBCLKDivider,
            .TIMPrescaler = self.TimPrescaler,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .LPTIMMult = self.LptimClockSelection,
            .LPUARTMult = self.Lpuart1ClockSelection,
            .USART2Mult = self.Usart2ClockSelection,
            .USART1Mult = self.Usart1ClockSelection,
            .I2C1Mult = self.I2c1ClockSelection,
            .I2C3Mult = self.I2c3ClockSelection,
            .MCOMult = self.RCC_MCOSource,
            .MCODiv = self.RCC_MCODiv,
            .HSI48MUL = self.HSI48MClockSelection,
            .PLLMUL = self.PLLMUL,
            .PLLDIV = self.PLLDIV,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSICalibrationValue = self.MSICalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
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
    I2C3Mult: ClockNode,
    I2C3Output: ClockNode,
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
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const MSIRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2097;
                }
            },
        } };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = MSIRCval,
        };
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = HSI48RCval,
        };
        const HSIRCDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSIRCDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSIRCDiv: ClockNode = .{
            .name = "HSIRCDiv",
            .Nodetype = HSIRCDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 37000 },
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
        const PLLSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRCDiv,
            },
        };
        const VCOIIuputval = ClockNodeTypes{ .output = null };
        const VCOIIuput: ClockNode = .{
            .name = "VCOIIuput",
            .Nodetype = VCOIIuputval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLMULval = ClockNodeTypes{ .mul = .{
            .value = inner: {
                if (config.PLLMUL) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        } };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = PLLMULval,
            .parents = &[_]*const ClockNode{&VCOIIuput},
        };
        const PLLDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLDIV: ClockNode = .{
            .name = "PLLDIV",
            .Nodetype = PLLDIVval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRCDiv,
                &PLLDIV,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
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
            .output = .{ .max = 32000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TIMPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TIMPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const TIMPrescaler: ClockNode = .{
            .name = "TIMPrescaler",
            .Nodetype = TIMPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TIMOutputval = ClockNodeTypes{ .output = null };
        const TIMOutput: ClockNode = .{
            .name = "TIMOutput",
            .Nodetype = TIMOutputval,
            .parents = &[_]*const ClockNode{&TIMPrescaler},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB1Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1val = blk: {
            if (APB1Prescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = TimPrescalerAPB1val,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOutval = ClockNodeTypes{ .output = null };
        const TimPrescOut: ClockNode = .{
            .name = "TimPrescOut",
            .Nodetype = TimPrescOutval,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB2Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const PeriphPrescalerval = blk: {
            if (APB2Prescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const PeriphPrescaler: ClockNode = .{
            .name = "PeriphPrescaler",
            .Nodetype = PeriphPrescalerval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const PeriphPrescOutputval = ClockNodeTypes{ .output = null };
        const PeriphPrescOutput: ClockNode = .{
            .name = "PeriphPrescOutput",
            .Nodetype = PeriphPrescOutputval,
            .parents = &[_]*const ClockNode{&PeriphPrescaler},
        };
        const LPTIMMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIMMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const LPTIMMult: ClockNode = .{
            .name = "LPTIMMult",
            .Nodetype = LPTIMMultval,

            .parents = &[_]*const ClockNode{
                &LSIRC,
                &HSIRCDiv,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const LPTIMOutputval = ClockNodeTypes{ .output = null };
        const LPTIMOutput: ClockNode = .{
            .name = "LPTIMOutput",
            .Nodetype = LPTIMOutputval,
            .parents = &[_]*const ClockNode{&LPTIMMult},
        };
        const LPUARTMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUARTMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPUARTMult: ClockNode = .{
            .name = "LPUARTMult",
            .Nodetype = LPUARTMultval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSEOSC,
                &HSIRCDiv,
                &SysCLKOutput,
            },
        };
        const LPUARTOutputval = ClockNodeTypes{ .output = null };
        const LPUARTOutput: ClockNode = .{
            .name = "LPUARTOutput",
            .Nodetype = LPUARTOutputval,
            .parents = &[_]*const ClockNode{&LPUARTMult},
        };
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .Nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRCDiv,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART2Outputval = ClockNodeTypes{ .output = null };
        const USART2Output: ClockNode = .{
            .name = "USART2Output",
            .Nodetype = USART2Outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
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
                &APB2Prescaler,
                &SysCLKOutput,
                &HSIRCDiv,
                &LSEOSC,
            },
        };
        const USART1Outputval = ClockNodeTypes{ .output = null };
        const USART1Output: ClockNode = .{
            .name = "USART1Output",
            .Nodetype = USART1Outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
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
                &APB1Prescaler,
                &HSIRCDiv,
                &SysCLKOutput,
            },
        };
        const I2C1Outputval = ClockNodeTypes{ .output = null };
        const I2C1Output: ClockNode = .{
            .name = "I2C1Output",
            .Nodetype = I2C1Outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRCDiv,
                &SysCLKOutput,
            },
        };
        const I2C3Outputval = ClockNodeTypes{ .output = null };
        const I2C3Output: ClockNode = .{
            .name = "I2C3Output",
            .Nodetype = I2C3Outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
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
                &HSIRCDiv,
                &PLLDIV,
                &SysCLKOutput,
                &MSIRC,
                &HSI48RC,
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
        const DIV2USBval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const DIV2USB: ClockNode = .{
            .name = "DIV2USB",
            .Nodetype = DIV2USBval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const HSI48MULval = ClockNodeTypes{
            .multi = inner: {
                if (config.HSI48MUL) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const HSI48MUL: ClockNode = .{
            .name = "HSI48MUL",
            .Nodetype = HSI48MULval,

            .parents = &[_]*const ClockNode{
                &DIV2USB,
                &HSI48RC,
            },
        };
        const @"48USBOutputval" = ClockNodeTypes{
            .output = .{ .max = 48120000, .min = 47880000 },
        };
        const @"48USBOutput": ClockNode = .{
            .name = "48USBOutput",
            .Nodetype = @"48USBOutputval",
            .parents = &[_]*const ClockNode{&HSI48MUL},
        };
        const @"48RNGOutputval" = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const @"48RNGOutput": ClockNode = .{
            .name = "48RNGOutput",
            .Nodetype = @"48RNGOutputval",
            .parents = &[_]*const ClockNode{&HSI48MUL},
        };
        const ADCOutputval = ClockNodeTypes{ .output = null };
        const ADCOutput: ClockNode = .{
            .name = "ADCOutput",
            .Nodetype = ADCOutputval,
            .parents = &[_]*const ClockNode{&HSIRCDiv},
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
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = 31, .min = 0 },
            },
        };
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 0,
                .limit = .{ .max = 255, .min = 0 },
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
            .I2C3Mult = I2C3Mult,
            .I2C3Output = I2C3Output,
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
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSICalibrationValue = MSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
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
        _ = self.I2C3Output.get_comptime();
        _ = self.@"48USBOutput".get_comptime();
        _ = self.@"48RNGOutput".get_comptime();
    }
};
