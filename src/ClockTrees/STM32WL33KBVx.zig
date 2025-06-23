const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSE_VALUEConf = enum {
    @"48000000",
    @"50000000",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"48000000" => 48000000,
            .@"50000000" => 50000000,
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
pub const RC64MPLLSourceConf = enum {
    RCC_LSCOSOURCE_HSI,
    RCC_LSCOSOURCE_PLL64,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ROOTClkSourceConf = enum {
    RCC_SYSCLKSOURCE_DIRECT_HSE,
    RCC_SYSCLKSOURCE_RC64MPLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ClkROOTDIVSourceConf = enum {
    CLK16MHzDiv2,
    CLK16MHzDiv4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ClkSMPSDIVSourceConf = enum {
    RCC_SMPSCLK_DIV4,
    RCC_SMPSCLK_DIV2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CLK_SPMS_KRM_DIVConf = enum {
    @"8",
    @"9",
    @"10",
    @"11",
    @"12",
    @"13",
    @"14",
    @"15",
    @"16",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"9" => 9,
            .@"15" => 15,
            .@"16" => 16,
            .@"10" => 10,
            .@"13" => 13,
            .@"11" => 11,
            .@"14" => 14,
            .@"12" => 12,
            .@"8" => 8,
        };
    }
};
pub const ClkKRMSourceConf = enum {
    SMPSDIVCLK,
    CLK_SPMS_KRM,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUARTClockSelectionConf = enum {
    RCC_LPUART1_CLKSOURCE_LSE,
    RCC_LPUART1_CLKSOURCE_16M,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LSCOSource1Conf = enum {
    RCC_LSCOSOURCE_LSI,
    RCC_LSCOSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSCLK48DividerConf = enum {
    RCC_DIRECT_HSE_DIV1,
    RCC_DIRECT_HSE_DIV2,
    RCC_DIRECT_HSE_DIV3,
    RCC_DIRECT_HSE_DIV6,
    RCC_DIRECT_HSE_DIV12,
    RCC_DIRECT_HSE_DIV24,
    RCC_DIRECT_HSE_DIV48,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_DIRECT_HSE_DIV1 => 1,
            .RCC_DIRECT_HSE_DIV6 => 6,
            .RCC_DIRECT_HSE_DIV12 => 12,
            .RCC_DIRECT_HSE_DIV24 => 24,
            .RCC_DIRECT_HSE_DIV2 => 2,
            .RCC_DIRECT_HSE_DIV48 => 48,
            .RCC_DIRECT_HSE_DIV3 => 3,
        };
    }
};
pub const SYSCLK64DividerConf = enum {
    RCC_RC64MPLL_DIV1,
    RCC_RC64MPLL_DIV2,
    RCC_RC64MPLL_DIV4,
    RCC_RC64MPLL_DIV8,
    RCC_RC64MPLL_DIV16,
    RCC_RC64MPLL_DIV32,
    RCC_RC64MPLL_DIV64,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_RC64MPLL_DIV8 => 8,
            .RCC_RC64MPLL_DIV2 => 2,
            .RCC_RC64MPLL_DIV32 => 32,
            .RCC_RC64MPLL_DIV1 => 1,
            .RCC_RC64MPLL_DIV4 => 4,
            .RCC_RC64MPLL_DIV64 => 64,
            .RCC_RC64MPLL_DIV16 => 16,
        };
    }
};
pub const CLKSYSMultSourceConf = enum {
    ROOTCLK48Prescaler,
    ROOTCLK64Prescaler,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CLKSPI3I2SMultSourceConf = enum {
    RCC_SPI3I2S_CLKSOURCE_CLK_ROOT_DIV,
    RCC_SPI3I2S_CLKSOURCE_CLK_ROOT,
    RCC_SPI3I2S_CLKSOURCE_CLK_RC64MPLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTC_WDG_SUBG_LPAWUR_LCD_LCSC_CLKSOURCE_DIV512,
    RCC_RTC_WDG_SUBG_LPAWUR_LCD_LCSC_CLKSOURCE_LSE,
    RCC_RTC_WDG_SUBG_LPAWUR_LCD_LCSC_CLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCOSOURCE_ADC,
    RCC_MCOSOURCE_SMPS,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_HSE,
    RCC_MCOSOURCE_RC64MPLL,
    RCC_MCOSOURCE_HSI64M_DIV2048,

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
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_32 => 32,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_4 => 4,
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
pub const HSE_current_controlConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const HSE_Capacitor_TuningConf = enum(u32) {
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
    HSEOSC: ?HSE_VALUEConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    RC64MPLL: ?RC64MPLLSourceConf = null,
    ROOTClkSource: ?ROOTClkSourceConf = null,
    CLKROOTDIVSource: ?ClkROOTDIVSourceConf = null,
    ClkSMPSDIV: ?ClkSMPSDIVSourceConf = null,
    CLK_SPMS_KRM_DIV: ?CLK_SPMS_KRM_DIVConf = null,
    ClkKRM: ?ClkKRMSourceConf = null,
    LPUARTMult: ?LPUARTClockSelectionConf = null,
    LSCOMult: ?LSCOSource1Conf = null,
    ROOTCLK48Prescaler: ?SYSCLK48DividerConf = null,
    ROOTCLK64Prescaler: ?SYSCLK64DividerConf = null,
    CLKSYSMult: ?CLKSYSMultSourceConf = null,
    CLKSPI3I2SMult: ?CLKSPI3I2SMultSourceConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    MCOMult: ?RCC_MCO1SourceConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    HSE_current_control: ?HSE_current_controlConf = null,
    HSE_Capacitor_Tuning: ?HSE_Capacitor_TuningConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    RC64MPLLSource: ?RC64MPLLSourceConf = null,
    ROOTClkSource: ?ROOTClkSourceConf = null,
    ClkROOTDIVSource: ?ClkROOTDIVSourceConf = null,
    ClkSMPSDIVSource: ?ClkSMPSDIVSourceConf = null,
    CLK_SPMS_KRM_DIV: ?CLK_SPMS_KRM_DIVConf = null,
    ClkKRMSource: ?ClkKRMSourceConf = null,
    LPUARTClockSelection: ?LPUARTClockSelectionConf = null,
    LSCOSource1: ?LSCOSource1Conf = null,
    SYSCLK48Divider: ?SYSCLK48DividerConf = null,
    SYSCLK64Divider: ?SYSCLK64DividerConf = null,
    CLKSYSMultSource: ?CLKSYSMultSourceConf = null,
    CLKSPI3I2SMultSource: ?CLKSPI3I2SMultSourceConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    HSE_current_control: ?HSE_current_controlConf = null,
    HSE_Capacitor_Tuning: ?HSE_Capacitor_TuningConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSEOSC = self.LSE_VALUE,
            .RC64MPLL = self.RC64MPLLSource,
            .ROOTClkSource = self.ROOTClkSource,
            .CLKROOTDIVSource = self.ClkROOTDIVSource,
            .ClkSMPSDIV = self.ClkSMPSDIVSource,
            .CLK_SPMS_KRM_DIV = self.CLK_SPMS_KRM_DIV,
            .ClkKRM = self.ClkKRMSource,
            .LPUARTMult = self.LPUARTClockSelection,
            .LSCOMult = self.LSCOSource1,
            .ROOTCLK48Prescaler = self.SYSCLK48Divider,
            .ROOTCLK64Prescaler = self.SYSCLK64Divider,
            .CLKSYSMult = self.CLKSYSMultSource,
            .CLKSPI3I2SMult = self.CLKSPI3I2SMultSource,
            .RTCClkSource = self.RTCClockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .HSE_current_control = self.HSE_current_control,
            .HSE_Capacitor_Tuning = self.HSE_Capacitor_Tuning,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    PLL64RC: ClockNode,
    HSEOSC: ClockNode,
    LSEOSC: ClockNode,
    LSIRC: ClockNode,
    RC64MPLL: ClockNode,
    ROOTClkSource: ClockNode,
    ROOTCLKOutput: ClockNode,
    TimerOutput: ClockNode,
    CLK_ROOT_DIV3: ClockNode,
    CLK_ROOT_DIV4: ClockNode,
    CLKROOTDIVSource: ClockNode,
    ClkROOTDIVOutput: ClockNode,
    ClkSMPSDiv4: ClockNode,
    ClkSMPSDiv2: ClockNode,
    ClkSMPSDIV: ClockNode,
    CLK_SPMS_KRM_DIV: ClockNode,
    ClkKRM: ClockNode,
    ClkSMPSOutput: ClockNode,
    LPUARTMult: ClockNode,
    ClkLPUARTOutput: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    Div2: ClockNode,
    ROOTCLK48Prescaler: ClockNode,
    ROOTCLK64Prescaler: ClockNode,
    CLKSYSMult: ClockNode,
    CLKSYSOutput: ClockNode,
    CLKSPI3I2SMult: ClockNode,
    CLKSPI3I2SOutput: ClockNode,
    CLKROOTCDevisorON512: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    HSE_current_control: ClockNodeTypes,
    HSE_Capacitor_Tuning: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const PLL64RCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const PLL64RC: ClockNode = .{
            .name = "PLL64RC",
            .Nodetype = PLL64RCval,
        };
        const HSEOSCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.HSEOSC) |val| {
                    switch (val) {
                        .@"48000000",
                        .@"50000000",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 48000000;
                }
            },
        } };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
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
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const RC64MPLLval = ClockNodeTypes{
            .multi = inner: {
                if (config.RC64MPLL) |val| {
                    switch (val) {
                        .RCC_LSCOSOURCE_HSI,
                        .RCC_LSCOSOURCE_PLL64,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const RC64MPLL: ClockNode = .{
            .name = "RC64MPLL",
            .Nodetype = RC64MPLLval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &PLL64RC,
            },
        };
        const ROOTClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.ROOTClkSource) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_DIRECT_HSE,
                        .RCC_SYSCLKSOURCE_RC64MPLL,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        };
        const ROOTClkSource: ClockNode = .{
            .name = "ROOTClkSource",
            .Nodetype = ROOTClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &RC64MPLL,
            },
        };
        const ROOTCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const ROOTCLKOutput: ClockNode = .{
            .name = "ROOTCLKOutput",
            .Nodetype = ROOTCLKOutputval,
            .parents = &[_]*const ClockNode{&ROOTClkSource},
        };
        const TimerOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const TimerOutput: ClockNode = .{
            .name = "TimerOutput",
            .Nodetype = TimerOutputval,
            .parents = &[_]*const ClockNode{&ROOTCLKOutput},
        };
        const CLK_ROOT_DIV3val = ClockNodeTypes{
            .div = .{ .value = 3 },
        };
        const CLK_ROOT_DIV3: ClockNode = .{
            .name = "CLK_ROOT_DIV3",
            .Nodetype = CLK_ROOT_DIV3val,
            .parents = &[_]*const ClockNode{&ROOTCLKOutput},
        };
        const CLK_ROOT_DIV4val = ClockNodeTypes{
            .div = .{ .value = 4 },
        };
        const CLK_ROOT_DIV4: ClockNode = .{
            .name = "CLK_ROOT_DIV4",
            .Nodetype = CLK_ROOT_DIV4val,
            .parents = &[_]*const ClockNode{&ROOTCLKOutput},
        };
        const CLKROOTDIVSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLKROOTDIVSource) |val| {
                    switch (val) {
                        .CLK16MHzDiv2,
                        .CLK16MHzDiv4,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        };
        const CLKROOTDIVSource: ClockNode = .{
            .name = "CLKROOTDIVSource",
            .Nodetype = CLKROOTDIVSourceval,

            .parents = &[_]*const ClockNode{
                &CLK_ROOT_DIV3,
                &CLK_ROOT_DIV4,
            },
        };
        const ClkROOTDIVOutputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 12000000 },
        };
        const ClkROOTDIVOutput: ClockNode = .{
            .name = "ClkROOTDIVOutput",
            .Nodetype = ClkROOTDIVOutputval,
            .parents = &[_]*const ClockNode{&CLKROOTDIVSource},
        };
        const ClkSMPSDiv4val = ClockNodeTypes{
            .div = .{ .value = 4 },
        };
        const ClkSMPSDiv4: ClockNode = .{
            .name = "ClkSMPSDiv4",
            .Nodetype = ClkSMPSDiv4val,
            .parents = &[_]*const ClockNode{&ClkROOTDIVOutput},
        };
        const ClkSMPSDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const ClkSMPSDiv2: ClockNode = .{
            .name = "ClkSMPSDiv2",
            .Nodetype = ClkSMPSDiv2val,
            .parents = &[_]*const ClockNode{&ClkROOTDIVOutput},
        };
        const ClkSMPSDIVval = ClockNodeTypes{
            .multi = inner: {
                if (config.ClkSMPSDIV) |val| {
                    switch (val) {
                        .RCC_SMPSCLK_DIV4,
                        .RCC_SMPSCLK_DIV2,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        };
        const ClkSMPSDIV: ClockNode = .{
            .name = "ClkSMPSDIV",
            .Nodetype = ClkSMPSDIVval,

            .parents = &[_]*const ClockNode{
                &ClkSMPSDiv4,
                &ClkSMPSDiv2,
            },
        };
        const CLK_SPMS_KRM_DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CLK_SPMS_KRM_DIV) |val| {
                    switch (val) {
                        .@"8",
                        .@"9",
                        .@"10",
                        .@"11",
                        .@"12",
                        .@"13",
                        .@"14",
                        .@"15",
                        .@"16",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 8;
                }
            },
        } };
        const CLK_SPMS_KRM_DIV: ClockNode = .{
            .name = "CLK_SPMS_KRM_DIV",
            .Nodetype = CLK_SPMS_KRM_DIVval,
            .parents = &[_]*const ClockNode{&ROOTCLKOutput},
        };
        const ClkKRMval = ClockNodeTypes{
            .multi = inner: {
                if (config.ClkKRM) |val| {
                    switch (val) {
                        .SMPSDIVCLK,
                        .CLK_SPMS_KRM,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const ClkKRM: ClockNode = .{
            .name = "ClkKRM",
            .Nodetype = ClkKRMval,

            .parents = &[_]*const ClockNode{
                &ClkSMPSDIV,
                &CLK_SPMS_KRM_DIV,
            },
        };
        const ClkSMPSOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const ClkSMPSOutput: ClockNode = .{
            .name = "ClkSMPSOutput",
            .Nodetype = ClkSMPSOutputval,
            .parents = &[_]*const ClockNode{&ClkKRM},
        };
        const LPUARTMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUARTMult) |val| {
                    switch (val) {
                        .RCC_LPUART1_CLKSOURCE_LSE,
                        .RCC_LPUART1_CLKSOURCE_16M,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        };
        const LPUARTMult: ClockNode = .{
            .name = "LPUARTMult",
            .Nodetype = LPUARTMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &ClkROOTDIVOutput,
            },
        };
        const ClkLPUARTOutputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const ClkLPUARTOutput: ClockNode = .{
            .name = "ClkLPUARTOutput",
            .Nodetype = ClkLPUARTOutputval,
            .parents = &[_]*const ClockNode{&LPUARTMult},
        };
        const LSCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LSCOMult) |val| {
                    switch (val) {
                        .RCC_LSCOSOURCE_LSI,
                        .RCC_LSCOSOURCE_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
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
        const Div2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const Div2: ClockNode = .{
            .name = "Div2",
            .Nodetype = Div2val,
            .parents = &[_]*const ClockNode{&ROOTCLKOutput},
        };
        const ROOTCLK48Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ROOTCLK48Prescaler) |val| {
                    switch (val) {
                        .RCC_DIRECT_HSE_DIV1,
                        .RCC_DIRECT_HSE_DIV2,
                        .RCC_DIRECT_HSE_DIV3,
                        .RCC_DIRECT_HSE_DIV6,
                        .RCC_DIRECT_HSE_DIV12,
                        .RCC_DIRECT_HSE_DIV24,
                        .RCC_DIRECT_HSE_DIV48,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const ROOTCLK48Prescaler: ClockNode = .{
            .name = "ROOTCLK48Prescaler",
            .Nodetype = ROOTCLK48Prescalerval,
            .parents = &[_]*const ClockNode{&ROOTCLKOutput},
        };
        const ROOTCLK64Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ROOTCLK64Prescaler) |val| {
                    switch (val) {
                        .RCC_RC64MPLL_DIV1,
                        .RCC_RC64MPLL_DIV2,
                        .RCC_RC64MPLL_DIV4,
                        .RCC_RC64MPLL_DIV8,
                        .RCC_RC64MPLL_DIV16,
                        .RCC_RC64MPLL_DIV32,
                        .RCC_RC64MPLL_DIV64,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const ROOTCLK64Prescaler: ClockNode = .{
            .name = "ROOTCLK64Prescaler",
            .Nodetype = ROOTCLK64Prescalerval,
            .parents = &[_]*const ClockNode{&ROOTCLKOutput},
        };
        const CLKSYSMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLKSYSMult) |val| {
                    switch (val) {
                        .ROOTCLK48Prescaler,
                        .ROOTCLK64Prescaler,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        };
        const CLKSYSMult: ClockNode = .{
            .name = "CLKSYSMult",
            .Nodetype = CLKSYSMultval,

            .parents = &[_]*const ClockNode{
                &ROOTCLK48Prescaler,
                &ROOTCLK64Prescaler,
            },
        };
        const CLKSYSOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const CLKSYSOutput: ClockNode = .{
            .name = "CLKSYSOutput",
            .Nodetype = CLKSYSOutputval,
            .parents = &[_]*const ClockNode{&CLKSYSMult},
        };
        const CLKSPI3I2SMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLKSPI3I2SMult) |val| {
                    switch (val) {
                        .RCC_SPI3I2S_CLKSOURCE_CLK_ROOT_DIV,
                        .RCC_SPI3I2S_CLKSOURCE_CLK_ROOT,
                        .RCC_SPI3I2S_CLKSOURCE_CLK_RC64MPLL,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
        const CLKSPI3I2SMult: ClockNode = .{
            .name = "CLKSPI3I2SMult",
            .Nodetype = CLKSPI3I2SMultval,

            .parents = &[_]*const ClockNode{
                &ClkROOTDIVOutput,
                &Div2,
                &RC64MPLL,
            },
        };
        const CLKSPI3I2SOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const CLKSPI3I2SOutput: ClockNode = .{
            .name = "CLKSPI3I2SOutput",
            .Nodetype = CLKSPI3I2SOutputval,
            .parents = &[_]*const ClockNode{&CLKSPI3I2SMult},
        };
        const CLKROOTCDevisorON512val = ClockNodeTypes{
            .div = .{ .value = 512 },
        };
        const CLKROOTCDevisorON512: ClockNode = .{
            .name = "CLKROOTCDevisorON512",
            .Nodetype = CLKROOTCDevisorON512val,
            .parents = &[_]*const ClockNode{&ClkROOTDIVOutput},
        };
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    switch (val) {
                        .RCC_RTC_WDG_SUBG_LPAWUR_LCD_LCSC_CLKSOURCE_DIV512,
                        .RCC_RTC_WDG_SUBG_LPAWUR_LCD_LCSC_CLKSOURCE_LSE,
                        .RCC_RTC_WDG_SUBG_LPAWUR_LCD_LCSC_CLKSOURCE_LSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",
            .Nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &CLKROOTCDevisorON512,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = 1000000, .min = 0 },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    switch (val) {
                        .RCC_MCOSOURCE_ADC,
                        .RCC_MCOSOURCE_SMPS,
                        .RCC_MCO1SOURCE_SYSCLK,
                        .RCC_MCO1SOURCE_HSE,
                        .RCC_MCOSOURCE_RC64MPLL,
                        .RCC_MCOSOURCE_HSI64M_DIV2048,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &ClkROOTDIVOutput,
                &ClkSMPSOutput,
                &ROOTCLKOutput,
                &HSEOSC,
                &RC64MPLL,
                &CLKROOTCDevisorON512,
            },
        };
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    switch (val) {
                        .RCC_MCODIV_1,
                        .RCC_MCODIV_2,
                        .RCC_MCODIV_4,
                        .RCC_MCODIV_8,
                        .RCC_MCODIV_16,
                        .RCC_MCODIV_32,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
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
        const HSE_current_controlval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_current_control) |val| val.get() else 40,
                .limit = .{ .max = 40, .min = 0 },
            },
        };
        const HSE_Capacitor_Tuningval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Capacitor_Tuning) |val| val.get() else 32,
                .limit = .{ .max = 63, .min = 0 },
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
            .PLL64RC = PLL64RC,
            .HSEOSC = HSEOSC,
            .LSEOSC = LSEOSC,
            .LSIRC = LSIRC,
            .RC64MPLL = RC64MPLL,
            .ROOTClkSource = ROOTClkSource,
            .ROOTCLKOutput = ROOTCLKOutput,
            .TimerOutput = TimerOutput,
            .CLK_ROOT_DIV3 = CLK_ROOT_DIV3,
            .CLK_ROOT_DIV4 = CLK_ROOT_DIV4,
            .CLKROOTDIVSource = CLKROOTDIVSource,
            .ClkROOTDIVOutput = ClkROOTDIVOutput,
            .ClkSMPSDiv4 = ClkSMPSDiv4,
            .ClkSMPSDiv2 = ClkSMPSDiv2,
            .ClkSMPSDIV = ClkSMPSDIV,
            .CLK_SPMS_KRM_DIV = CLK_SPMS_KRM_DIV,
            .ClkKRM = ClkKRM,
            .ClkSMPSOutput = ClkSMPSOutput,
            .LPUARTMult = LPUARTMult,
            .ClkLPUARTOutput = ClkLPUARTOutput,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .Div2 = Div2,
            .ROOTCLK48Prescaler = ROOTCLK48Prescaler,
            .ROOTCLK64Prescaler = ROOTCLK64Prescaler,
            .CLKSYSMult = CLKSYSMult,
            .CLKSYSOutput = CLKSYSOutput,
            .CLKSPI3I2SMult = CLKSPI3I2SMult,
            .CLKSPI3I2SOutput = CLKSPI3I2SOutput,
            .CLKROOTCDevisorON512 = CLKROOTCDevisorON512,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .HSE_current_control = HSE_current_controlval,
            .HSE_Capacitor_Tuning = HSE_Capacitor_Tuningval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.TimerOutput.get_comptime();
        _ = self.ClkSMPSOutput.get_comptime();
        _ = self.ClkLPUARTOutput.get_comptime();
        _ = self.LSCOOutput.get_comptime();
        _ = self.CLKSYSOutput.get_comptime();
        _ = self.CLKSPI3I2SOutput.get_comptime();
    }
};
