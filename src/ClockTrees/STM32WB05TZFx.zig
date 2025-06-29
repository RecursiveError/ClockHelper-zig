const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

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
pub const RC64MPLLSourceConf = enum {
    RCC_LSCOSOURCE_HSI,
    RCC_LSCOSOURCE_PLL64,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_DIRECT_HSE,
    RCC_SYSCLKSOURCE_RC64MPLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Clk16MHzSourceConf = enum {
    CLK16MHzDiv2,
    CLK16MHzDiv4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ClkSMPSSourceConf = enum {
    RCC_SMPSCLK_DIV4,
    RCC_SMPSCLK_DIV2,

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
pub const Clk32MHzSourceConf = enum {
    SysCLKOutput,
    CLK32MHzDiv2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const BLEMultSourceConf = enum {
    RCC_RF_CLK_16M,
    RCC_RF_CLK_32M,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSCLK32DividerConf = enum {
    RCC_DIRECT_HSE_DIV1,
    RCC_DIRECT_HSE_DIV2,
    RCC_DIRECT_HSE_DIV4,
    RCC_DIRECT_HSE_DIV8,
    RCC_DIRECT_HSE_DIV16,
    RCC_DIRECT_HSE_DIV32,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_DIRECT_HSE_DIV1 => 1,
            .RCC_DIRECT_HSE_DIV4 => 4,
            .RCC_DIRECT_HSE_DIV8 => 8,
            .RCC_DIRECT_HSE_DIV16 => 16,
            .RCC_DIRECT_HSE_DIV2 => 2,
            .RCC_DIRECT_HSE_DIV32 => 32,
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
    SYSCLK32Prescaler,
    SYSCLK64Prescaler,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CLKI2S3MultSourceConf = enum {
    RCC_SPI3I2S_CLKSOURCE_32M,
    RCC_SPI3I2S_CLKSOURCE_16M,
    RCC_SPI3I2S_CLKSOURCE_64M,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CLKI2S2MultSourceConf = enum {
    RCC_SPI2I2S_CLKSOURCE_32M,
    RCC_SPI2I2S_CLKSOURCE_16M,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTC_WDG_BLEWKUP_CLKSOURCE_HSI64M_DIV2048,
    RCC_RTC_WDG_BLEWKUP_CLKSOURCE_LSE,
    RCC_RTC_WDG_BLEWKUP_CLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCOSOURCE_ADC,
    RCC_MCOSOURCE_SMPS,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
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
pub const HSE_current_controlConf = enum {
    RCC_HSE_CURRENTMAX_0,
    RCC_HSE_CURRENTMAX_1,
    RCC_HSE_CURRENTMAX_2,
    RCC_HSE_CURRENTMAX_3,
    RCC_HSE_CURRENTMAX_4,
    RCC_HSE_CURRENTMAX_5,
    RCC_HSE_CURRENTMAX_6,
    RCC_HSE_CURRENTMAX_7,
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSE_CURRENTMAX_0 => 0,
            .null => 0,
            .RCC_HSE_CURRENTMAX_1 => 1,
            .RCC_HSE_CURRENTMAX_2 => 2,
            .RCC_HSE_CURRENTMAX_3 => 3,
            .RCC_HSE_CURRENTMAX_5 => 5,
            .RCC_HSE_CURRENTMAX_4 => 4,
            .RCC_HSE_CURRENTMAX_6 => 6,
            .RCC_HSE_CURRENTMAX_7 => 7,
        };
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
    SysClkSource: ?SYSCLKSourceConf = null,
    CLK16MHzSource: ?Clk16MHzSourceConf = null,
    ClkSMPS: ?ClkSMPSSourceConf = null,
    LPUARTMult: ?LPUARTClockSelectionConf = null,
    LSCOMult: ?LSCOSource1Conf = null,
    CLK32MHzSource: ?Clk32MHzSourceConf = null,
    BLEMult: ?BLEMultSourceConf = null,
    SYSCLK32Prescaler: ?SYSCLK32DividerConf = null,
    SYSCLK64Prescaler: ?SYSCLK64DividerConf = null,
    CLKSYSMult: ?CLKSYSMultSourceConf = null,
    CLKI2S3Mult: ?CLKI2S3MultSourceConf = null,
    CLKI2S2Mult: ?CLKI2S2MultSourceConf = null,
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
    SYSCLKSource: ?SYSCLKSourceConf = null,
    Clk16MHzSource: ?Clk16MHzSourceConf = null,
    ClkSMPSSource: ?ClkSMPSSourceConf = null,
    LPUARTClockSelection: ?LPUARTClockSelectionConf = null,
    LSCOSource1: ?LSCOSource1Conf = null,
    Clk32MHzSource: ?Clk32MHzSourceConf = null,
    BLEMultSource: ?BLEMultSourceConf = null,
    SYSCLK32Divider: ?SYSCLK32DividerConf = null,
    SYSCLK64Divider: ?SYSCLK64DividerConf = null,
    CLKSYSMultSource: ?CLKSYSMultSourceConf = null,
    CLKI2S3MultSource: ?CLKI2S3MultSourceConf = null,
    CLKI2S2MultSource: ?CLKI2S2MultSourceConf = null,
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
            .SysClkSource = self.SYSCLKSource,
            .CLK16MHzSource = self.Clk16MHzSource,
            .ClkSMPS = self.ClkSMPSSource,
            .LPUARTMult = self.LPUARTClockSelection,
            .LSCOMult = self.LSCOSource1,
            .CLK32MHzSource = self.Clk32MHzSource,
            .BLEMult = self.BLEMultSource,
            .SYSCLK32Prescaler = self.SYSCLK32Divider,
            .SYSCLK64Prescaler = self.SYSCLK64Divider,
            .CLKSYSMult = self.CLKSYSMultSource,
            .CLKI2S3Mult = self.CLKI2S3MultSource,
            .CLKI2S2Mult = self.CLKI2S2MultSource,
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
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    TimerOutput: ClockNode,
    CLK16MHzDiv2: ClockNode,
    CLK16MHzDiv4: ClockNode,
    CLK16MHzSource: ClockNode,
    Clk16MHzOutput: ClockNode,
    ClkSMPSDiv4: ClockNode,
    ClkSMPSDiv2: ClockNode,
    ClkSMPS: ClockNode,
    ClkSMPSOutput: ClockNode,
    LPUARTMult: ClockNode,
    ClkLPUARTOutput: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    CLK32MHzDiv1: ClockNode,
    CLK32MHzDiv2: ClockNode,
    CLK32MHzSource: ClockNode,
    Clk32MHzOutput: ClockNode,
    BLEMult: ClockNode,
    BLEOutput: ClockNode,
    SYSCLK32Prescaler: ClockNode,
    SYSCLK64Prescaler: ClockNode,
    CLKSYSMult: ClockNode,
    CLKSYSOutput: ClockNode,
    CLKI2S3Mult: ClockNode,
    CLKI2S3Output: ClockNode,
    CLKI2S2Output: ClockNode,
    CLKI2S2Mult: ClockNode,
    CLK16RTCDevisor: ClockNode,
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
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 32000000,
                .limit = .{ .max = 32000000, .min = 4000000 },
            },
        };
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
                    break :inner val.get();
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
                &HSEOSC,
                &RC64MPLL,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const TimerOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const TimerOutput: ClockNode = .{
            .name = "TimerOutput",
            .Nodetype = TimerOutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK16MHzDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const CLK16MHzDiv2: ClockNode = .{
            .name = "CLK16MHzDiv2",
            .Nodetype = CLK16MHzDiv2val,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK16MHzDiv4val = ClockNodeTypes{
            .div = .{ .value = 4 },
        };
        const CLK16MHzDiv4: ClockNode = .{
            .name = "CLK16MHzDiv4",
            .Nodetype = CLK16MHzDiv4val,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK16MHzSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLK16MHzSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const CLK16MHzSource: ClockNode = .{
            .name = "CLK16MHzSource",
            .Nodetype = CLK16MHzSourceval,

            .parents = &[_]*const ClockNode{
                &CLK16MHzDiv2,
                &CLK16MHzDiv4,
            },
        };
        const Clk16MHzOutputval = ClockNodeTypes{ .output = null };
        const Clk16MHzOutput: ClockNode = .{
            .name = "Clk16MHzOutput",
            .Nodetype = Clk16MHzOutputval,
            .parents = &[_]*const ClockNode{&CLK16MHzSource},
        };
        const ClkSMPSDiv4val = ClockNodeTypes{
            .div = .{ .value = 4 },
        };
        const ClkSMPSDiv4: ClockNode = .{
            .name = "ClkSMPSDiv4",
            .Nodetype = ClkSMPSDiv4val,
            .parents = &[_]*const ClockNode{&Clk16MHzOutput},
        };
        const ClkSMPSDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const ClkSMPSDiv2: ClockNode = .{
            .name = "ClkSMPSDiv2",
            .Nodetype = ClkSMPSDiv2val,
            .parents = &[_]*const ClockNode{&Clk16MHzOutput},
        };
        const ClkSMPSval = ClockNodeTypes{
            .multi = inner: {
                if (config.ClkSMPS) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ClkSMPS: ClockNode = .{
            .name = "ClkSMPS",
            .Nodetype = ClkSMPSval,

            .parents = &[_]*const ClockNode{
                &ClkSMPSDiv4,
                &ClkSMPSDiv2,
            },
        };
        const ClkSMPSOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const ClkSMPSOutput: ClockNode = .{
            .name = "ClkSMPSOutput",
            .Nodetype = ClkSMPSOutputval,
            .parents = &[_]*const ClockNode{&ClkSMPS},
        };
        const LPUARTMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUARTMult) |val| {
                    break :inner val.get();
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
                &Clk16MHzOutput,
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
        const CLK32MHzDiv1val = ClockNodeTypes{
            .div = .{ .value = 1 },
        };
        const CLK32MHzDiv1: ClockNode = .{
            .name = "CLK32MHzDiv1",
            .Nodetype = CLK32MHzDiv1val,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK32MHzDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const CLK32MHzDiv2: ClockNode = .{
            .name = "CLK32MHzDiv2",
            .Nodetype = CLK32MHzDiv2val,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLK32MHzSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLK32MHzSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const CLK32MHzSource: ClockNode = .{
            .name = "CLK32MHzSource",
            .Nodetype = CLK32MHzSourceval,

            .parents = &[_]*const ClockNode{
                &CLK32MHzDiv1,
                &CLK32MHzDiv2,
            },
        };
        const Clk32MHzOutputval = ClockNodeTypes{ .output = null };
        const Clk32MHzOutput: ClockNode = .{
            .name = "Clk32MHzOutput",
            .Nodetype = Clk32MHzOutputval,
            .parents = &[_]*const ClockNode{&CLK32MHzSource},
        };
        const BLEMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.BLEMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const BLEMult: ClockNode = .{
            .name = "BLEMult",
            .Nodetype = BLEMultval,

            .parents = &[_]*const ClockNode{
                &Clk16MHzOutput,
                &Clk32MHzOutput,
            },
        };
        const BLEOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const BLEOutput: ClockNode = .{
            .name = "BLEOutput",
            .Nodetype = BLEOutputval,
            .parents = &[_]*const ClockNode{&BLEMult},
        };
        const SYSCLK32Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.SYSCLK32Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const SYSCLK32Prescaler: ClockNode = .{
            .name = "SYSCLK32Prescaler",
            .Nodetype = SYSCLK32Prescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const SYSCLK64Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.SYSCLK64Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const SYSCLK64Prescaler: ClockNode = .{
            .name = "SYSCLK64Prescaler",
            .Nodetype = SYSCLK64Prescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CLKSYSMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLKSYSMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const CLKSYSMult: ClockNode = .{
            .name = "CLKSYSMult",
            .Nodetype = CLKSYSMultval,

            .parents = &[_]*const ClockNode{
                &SYSCLK32Prescaler,
                &SYSCLK64Prescaler,
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
        const CLKI2S3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLKI2S3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const CLKI2S3Mult: ClockNode = .{
            .name = "CLKI2S3Mult",
            .Nodetype = CLKI2S3Multval,

            .parents = &[_]*const ClockNode{
                &Clk32MHzOutput,
                &Clk16MHzOutput,
                &RC64MPLL,
            },
        };
        const CLKI2S3Outputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const CLKI2S3Output: ClockNode = .{
            .name = "CLKI2S3Output",
            .Nodetype = CLKI2S3Outputval,
            .parents = &[_]*const ClockNode{&CLKI2S3Mult},
        };
        const CLKI2S2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CLKI2S2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CLKI2S2Mult: ClockNode = .{
            .name = "CLKI2S2Mult",
            .Nodetype = CLKI2S2Multval,

            .parents = &[_]*const ClockNode{
                &Clk32MHzOutput,
                &Clk16MHzOutput,
            },
        };
        const CLKI2S2Outputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const CLKI2S2Output: ClockNode = .{
            .name = "CLKI2S2Output",
            .Nodetype = CLKI2S2Outputval,
            .parents = &[_]*const ClockNode{&CLKI2S2Mult},
        };
        const CLK16RTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 512 },
        };
        const CLK16RTCDevisor: ClockNode = .{
            .name = "CLK16RTCDevisor",
            .Nodetype = CLK16RTCDevisorval,
            .parents = &[_]*const ClockNode{&Clk16MHzOutput},
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
                &CLK16RTCDevisor,
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
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &Clk16MHzOutput,
                &ClkSMPSOutput,
                &CLKSYSOutput,
                &HSEOSC,
                &HSIRC,
                &CLK16RTCDevisor,
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
        const HSE_current_controlval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.HSE_current_control) |val| {
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
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .TimerOutput = TimerOutput,
            .CLK16MHzDiv2 = CLK16MHzDiv2,
            .CLK16MHzDiv4 = CLK16MHzDiv4,
            .CLK16MHzSource = CLK16MHzSource,
            .Clk16MHzOutput = Clk16MHzOutput,
            .ClkSMPSDiv4 = ClkSMPSDiv4,
            .ClkSMPSDiv2 = ClkSMPSDiv2,
            .ClkSMPS = ClkSMPS,
            .ClkSMPSOutput = ClkSMPSOutput,
            .LPUARTMult = LPUARTMult,
            .ClkLPUARTOutput = ClkLPUARTOutput,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .CLK32MHzDiv1 = CLK32MHzDiv1,
            .CLK32MHzDiv2 = CLK32MHzDiv2,
            .CLK32MHzSource = CLK32MHzSource,
            .Clk32MHzOutput = Clk32MHzOutput,
            .BLEMult = BLEMult,
            .BLEOutput = BLEOutput,
            .SYSCLK32Prescaler = SYSCLK32Prescaler,
            .SYSCLK64Prescaler = SYSCLK64Prescaler,
            .CLKSYSMult = CLKSYSMult,
            .CLKSYSOutput = CLKSYSOutput,
            .CLKI2S3Mult = CLKI2S3Mult,
            .CLKI2S3Output = CLKI2S3Output,
            .CLKI2S2Output = CLKI2S2Output,
            .CLKI2S2Mult = CLKI2S2Mult,
            .CLK16RTCDevisor = CLK16RTCDevisor,
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
        _ = self.BLEOutput.get_comptime();
        _ = self.CLKSYSOutput.get_comptime();
        _ = self.CLKI2S3Output.get_comptime();
        _ = self.CLKI2S2Output.get_comptime();
    }
};
