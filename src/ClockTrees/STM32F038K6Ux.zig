const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const CECClockSelectionConf = enum {
    RCC_CECCLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLDividerConf = enum {
    RCC_PREDIV_DIV1,
    RCC_PREDIV_DIV2,
    RCC_PREDIV_DIV3,
    RCC_PREDIV_DIV4,
    RCC_PREDIV_DIV5,
    RCC_PREDIV_DIV6,
    RCC_PREDIV_DIV7,
    RCC_PREDIV_DIV8,
    RCC_PREDIV_DIV9,
    RCC_PREDIV_DIV10,
    RCC_PREDIV_DIV11,
    RCC_PREDIV_DIV12,
    RCC_PREDIV_DIV13,
    RCC_PREDIV_DIV14,
    RCC_PREDIV_DIV15,
    RCC_PREDIV_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PREDIV_DIV2 => 2,
            .RCC_PREDIV_DIV7 => 7,
            .RCC_PREDIV_DIV3 => 3,
            .RCC_PREDIV_DIV6 => 6,
            .RCC_PREDIV_DIV9 => 9,
            .RCC_PREDIV_DIV12 => 12,
            .RCC_PREDIV_DIV4 => 4,
            .RCC_PREDIV_DIV10 => 10,
            .RCC_PREDIV_DIV13 => 13,
            .RCC_PREDIV_DIV1 => 1,
            .RCC_PREDIV_DIV16 => 16,
            .RCC_PREDIV_DIV11 => 11,
            .RCC_PREDIV_DIV15 => 15,
            .RCC_PREDIV_DIV5 => 5,
            .RCC_PREDIV_DIV8 => 8,
            .RCC_PREDIV_DIV14 => 14,
        };
    }
};
pub const USBClockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCOMult_Clock_Source_FROM_PLLMULConf = enum {
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_PLLCLK_DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCO1SOURCE_PLLCLK => 1,
            .RCC_MCO1SOURCE_PLLCLK_DIV2 => 2,
        };
    }
};
pub const RCC_MCOSourceConf = enum {
    MCOMultDivisor,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_HSI14,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_LSI,
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
pub const TimSys_DivConf = enum {
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
pub const I2c1ClockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Usart1ClockSelectionConf = enum {
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_PCLK1,

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
pub const PLLMULConf = enum {
    RCC_PLL_MUL2,
    RCC_PLL_MUL3,
    RCC_PLL_MUL4,
    RCC_PLL_MUL5,
    RCC_PLL_MUL6,
    RCC_PLL_MUL7,
    RCC_PLL_MUL8,
    RCC_PLL_MUL9,
    RCC_PLL_MUL10,
    RCC_PLL_MUL11,
    RCC_PLL_MUL12,
    RCC_PLL_MUL13,
    RCC_PLL_MUL14,
    RCC_PLL_MUL15,
    RCC_PLL_MUL16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLL_MUL11 => 11,
            .RCC_PLL_MUL7 => 7,
            .RCC_PLL_MUL10 => 10,
            .RCC_PLL_MUL12 => 12,
            .RCC_PLL_MUL2 => 2,
            .RCC_PLL_MUL8 => 8,
            .RCC_PLL_MUL16 => 16,
            .RCC_PLL_MUL14 => 14,
            .RCC_PLL_MUL9 => 9,
            .RCC_PLL_MUL6 => 6,
            .RCC_PLL_MUL15 => 15,
            .RCC_PLL_MUL3 => 3,
            .RCC_PLL_MUL5 => 5,
            .RCC_PLL_MUL4 => 4,
            .RCC_PLL_MUL13 => 13,
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
pub const HSICalibrationValueConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const HSI14CalibrationValueConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
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
    CECMult: ?CECClockSelectionConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    HSEPLLsourceDevisor: ?PLLDividerConf = null,
    USBMult: ?USBClockSelectionConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    MCOMultDivisor: ?RCC_MCOMult_Clock_Source_FROM_PLLMULConf = null,
    MCOMult: ?RCC_MCOSourceConf = null,
    MCODivider: ?RCC_MCODivConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    TimSysPresc: ?TimSys_DivConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    I2C1Mult: ?I2c1ClockSelectionConf = null,
    USART1Mult: ?Usart1ClockSelectionConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    HSI14CalibrationValue: ?HSI14CalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    CECClockSelection: ?CECClockSelectionConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    PLLDivider: ?PLLDividerConf = null,
    USBClockSelection: ?USBClockSelectionConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    RCC_MCOMult_Clock_Source_FROM_PLLMUL: ?RCC_MCOMult_Clock_Source_FROM_PLLMULConf = null,
    RCC_MCOSource: ?RCC_MCOSourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    TimSys_Div: ?TimSys_DivConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    I2c1ClockSelection: ?I2c1ClockSelectionConf = null,
    Usart1ClockSelection: ?Usart1ClockSelectionConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    HSI14CalibrationValue: ?HSI14CalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .CECMult = self.CECClockSelection,
            .HSEOSC = self.HSE_VALUE,
            .HSEPLLsourceDevisor = self.PLLDivider,
            .USBMult = self.USBClockSelection,
            .SysClkSource = self.SYSCLKSource,
            .RTCClkSource = self.RTCClockSelection,
            .MCOMultDivisor = self.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
            .MCOMult = self.RCC_MCOSource,
            .MCODivider = self.RCC_MCODiv,
            .AHBPrescaler = self.AHBCLKDivider,
            .TimSysPresc = self.TimSys_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .I2C1Mult = self.I2c1ClockSelection,
            .USART1Mult = self.Usart1ClockSelection,
            .PLLSource = self.PLLSourceVirtual,
            .PLLMUL = self.PLLMUL,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .HSI14CalibrationValue = self.HSI14CalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const Self = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    HSIRCDiv: ClockNode,
    HSICECDiv: ClockNode,
    HSIRC14: ClockNode,
    ADCoutput: ClockNode,
    LSIRC: ClockNode,
    CECMult: ClockNode,
    CECOutput: ClockNode,
    HSEOSC: ClockNode,
    HSEPLLsourceDevisor: ClockNode,
    USBMult: ClockNode,
    USBoutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    I2SOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    MCOMultDivisor: ClockNode,
    MCOMult: ClockNode,
    MCODivider: ClockNode,
    MCOoutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    TimSysPresc: ClockNode,
    TimSysOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    I2C1Mult: ClockNode,
    I2C1Output: ClockNode,
    USART1Mult: ClockNode,
    USART1Output: ClockNode,
    PLLSource: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    HSI14CalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init(comptime config: Config) Self {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .nodetype = HSIRCval,
        };
        const FLITFCLKoutputval = ClockNodeTypes{ .output = null };
        const FLITFCLKoutput: ClockNode = .{
            .name = "FLITFCLKoutput",
            .nodetype = FLITFCLKoutputval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSIRCDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const HSIRCDiv: ClockNode = .{
            .name = "HSIRCDiv",
            .nodetype = HSIRCDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSICECDivval = ClockNodeTypes{
            .div = .{ .value = 244 },
        };
        const HSICECDiv: ClockNode = .{
            .name = "HSICECDiv",
            .nodetype = HSICECDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSIRC14val = ClockNodeTypes{
            .source = .{ .value = 14000000 },
        };
        const HSIRC14: ClockNode = .{
            .name = "HSIRC14",
            .nodetype = HSIRC14val,
        };
        const ADCoutputval = ClockNodeTypes{ .output = null };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&HSIRC14},
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 40000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .nodetype = LSIRCval,
        };
        const CECMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CECMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",
            .nodetype = CECMultval,

            .parents = &[_]*const ClockNode{
                &HSICECDiv,
            },
        };
        const CECOutputval = ClockNodeTypes{ .output = null };
        const CECOutput: ClockNode = .{
            .name = "CECOutput",
            .nodetype = CECOutputval,
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = @min(1_000_000_000, 32000000), .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .nodetype = HSEOSCval,
        };
        const HSEPLLsourceDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEPLLsourceDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSEPLLsourceDevisor: ClockNode = .{
            .name = "HSEPLLsourceDevisor",
            .nodetype = HSEPLLsourceDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
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
            .nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRCDiv,
                &HSEPLLsourceDevisor,
            },
        };
        const VCO2outputval = ClockNodeTypes{ .output = null };
        const VCO2output: ClockNode = .{
            .name = "VCO2output",
            .nodetype = VCO2outputval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLMULval = ClockNodeTypes{ .mul = .{
            .value = inner: {
                if (config.PLLMUL) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .nodetype = PLLMULval,
            .parents = &[_]*const ClockNode{&VCO2output},
        };
        const USBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const USBMult: ClockNode = .{
            .name = "USBMult",
            .nodetype = USBMultval,

            .parents = &[_]*const ClockNode{
                &PLLMUL,
            },
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48120000), .min = 47880000 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBMult},
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
            .nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &PLLMUL,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const I2SOutputval = ClockNodeTypes{ .output = null };
        const I2SOutput: ClockNode = .{
            .name = "I2SOutput",
            .nodetype = I2SOutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .nodetype = HSERTCDevisorval,
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
            .nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{ .output = null };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const MCOMultDivisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCOMultDivisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCOMultDivisor: ClockNode = .{
            .name = "MCOMultDivisor",
            .nodetype = MCOMultDivisorval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 7;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &MCOMultDivisor,
                &HSIRC,
                &HSIRC14,
                &HSEOSC,
                &LSIRC,
                &SysCLKOutput,
            },
        };
        const MCODividerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODivider) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCODivider: ClockNode = .{
            .name = "MCODivider",
            .nodetype = MCODividerval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOoutputval = ClockNodeTypes{ .output = null };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .nodetype = MCOoutputval,
            .parents = &[_]*const ClockNode{&MCODivider},
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
            .nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TimSysPrescval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TimSysPresc) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const TimSysPresc: ClockNode = .{
            .name = "TimSysPresc",
            .nodetype = TimSysPrescval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TimSysOutputval = ClockNodeTypes{ .output = null };
        const TimSysOutput: ClockNode = .{
            .name = "TimSysOutput",
            .nodetype = TimSysOutputval,
            .parents = &[_]*const ClockNode{&TimSysPresc},
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
            .nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .nodetype = APB1Outputval,
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
            .nodetype = TimPrescalerAPB1val,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
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
            .nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C1Outputval = ClockNodeTypes{ .output = null };
        const I2C1Output: ClockNode = .{
            .name = "I2C1Output",
            .nodetype = I2C1Outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &APB1Prescaler,
            },
        };
        const USART1Outputval = ClockNodeTypes{ .output = null };
        const USART1Output: ClockNode = .{
            .name = "USART1Output",
            .nodetype = USART1Outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        const HSICalibrationValueval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.HSICalibrationValue) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
        const HSI14CalibrationValueval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.HSI14CalibrationValue) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
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
            .FLITFCLKoutput = FLITFCLKoutput,
            .HSIRCDiv = HSIRCDiv,
            .HSICECDiv = HSICECDiv,
            .HSIRC14 = HSIRC14,
            .ADCoutput = ADCoutput,
            .LSIRC = LSIRC,
            .CECMult = CECMult,
            .CECOutput = CECOutput,
            .HSEOSC = HSEOSC,
            .HSEPLLsourceDevisor = HSEPLLsourceDevisor,
            .USBMult = USBMult,
            .USBoutput = USBoutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .I2SOutput = I2SOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .MCOMultDivisor = MCOMultDivisor,
            .MCOMult = MCOMult,
            .MCODivider = MCODivider,
            .MCOoutput = MCOoutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .TimSysPresc = TimSysPresc,
            .TimSysOutput = TimSysOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .I2C1Mult = I2C1Mult,
            .I2C1Output = I2C1Output,
            .USART1Mult = USART1Mult,
            .USART1Output = USART1Output,
            .PLLSource = PLLSource,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .HSI14CalibrationValue = HSI14CalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.FLITFCLKoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.HSIRCDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.HSICECDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.HSIRC14.parents = try alloc.dupe(*const ClockNode, &.{});
        self.ADCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC14,
        });
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.CECMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSICECDiv,
        });
        self.CECOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CECMult,
        });
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEPLLsourceDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.USBMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLMUL,
        });
        self.USBoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBMult,
        });
        self.SysClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.HSEOSC,
            &self.PLLMUL,
        });
        self.SysCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysClkSource,
        });
        self.I2SOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
        });
        self.HSERTCDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.RTCClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSERTCDevisor,
            &self.LSIRC,
        });
        self.RTCOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RTCClkSource,
        });
        self.IWDGOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIRC,
        });
        self.MCOMultDivisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLMUL,
        });
        self.MCOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMultDivisor,
            &self.HSIRC,
            &self.HSIRC14,
            &self.HSEOSC,
            &self.LSIRC,
            &self.SysCLKOutput,
        });
        self.MCODivider.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMult,
        });
        self.MCOoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCODivider,
        });
        self.AHBPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
        });
        self.AHBOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBPrescaler,
        });
        self.HCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.FCLKCortexOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.TimSysPresc.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.TimSysOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimSysPresc,
        });
        self.APB1Prescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
        });
        self.TimPrescalerAPB1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
        });
        self.TimPrescOut1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB1,
        });
        self.I2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.SysCLKOutput,
        });
        self.I2C1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C1Mult,
        });
        self.USART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.APB1Prescaler,
        });
        self.USART1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART1Mult,
        });
        self.PLLSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRCDiv,
            &self.HSEPLLsourceDevisor,
        });
        self.VCO2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.PLLMUL.parents = try alloc.dupe(*const ClockNode, &.{
            &self.VCO2output,
        });
    }
    pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
        alloc.free(self.HSIRC.parents.?);
        alloc.free(self.FLITFCLKoutput.parents.?);
        alloc.free(self.HSIRCDiv.parents.?);
        alloc.free(self.HSICECDiv.parents.?);
        alloc.free(self.HSIRC14.parents.?);
        alloc.free(self.ADCoutput.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.CECMult.parents.?);
        alloc.free(self.CECOutput.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.HSEPLLsourceDevisor.parents.?);
        alloc.free(self.USBMult.parents.?);
        alloc.free(self.USBoutput.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.I2SOutput.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.MCOMultDivisor.parents.?);
        alloc.free(self.MCOMult.parents.?);
        alloc.free(self.MCODivider.parents.?);
        alloc.free(self.MCOoutput.parents.?);
        alloc.free(self.AHBPrescaler.parents.?);
        alloc.free(self.AHBOutput.parents.?);
        alloc.free(self.HCLKOutput.parents.?);
        alloc.free(self.FCLKCortexOutput.parents.?);
        alloc.free(self.TimSysPresc.parents.?);
        alloc.free(self.TimSysOutput.parents.?);
        alloc.free(self.APB1Prescaler.parents.?);
        alloc.free(self.APB1Output.parents.?);
        alloc.free(self.TimPrescalerAPB1.parents.?);
        alloc.free(self.TimPrescOut1.parents.?);
        alloc.free(self.I2C1Mult.parents.?);
        alloc.free(self.I2C1Output.parents.?);
        alloc.free(self.USART1Mult.parents.?);
        alloc.free(self.USART1Output.parents.?);
        alloc.free(self.PLLSource.parents.?);
        alloc.free(self.VCO2output.parents.?);
        alloc.free(self.PLLMUL.parents.?);
    }
    pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        self.HSIRC.nodetype = HSIRCval;
        const FLITFCLKoutputval = ClockNodeTypes{ .output = null };
        self.FLITFCLKoutput.nodetype = FLITFCLKoutputval;
        const HSIRCDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.HSIRCDiv.nodetype = HSIRCDivval;
        const HSICECDivval = ClockNodeTypes{
            .div = .{ .value = 244 },
        };
        self.HSICECDiv.nodetype = HSICECDivval;
        const HSIRC14val = ClockNodeTypes{
            .source = .{ .value = 14000000 },
        };
        self.HSIRC14.nodetype = HSIRC14val;
        const ADCoutputval = ClockNodeTypes{ .output = null };
        self.ADCoutput.nodetype = ADCoutputval;
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 40000 },
        };
        self.LSIRC.nodetype = LSIRCval;
        const CECMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.CECMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.CECMult.nodetype = CECMultval;
        const CECOutputval = ClockNodeTypes{ .output = null };
        self.CECOutput.nodetype = CECOutputval;
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = @min(1_000_000_000, 32000000), .min = 4000000 },
            },
        };
        self.HSEOSC.nodetype = HSEOSCval;
        const HSEPLLsourceDevisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEPLLsourceDevisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.HSEPLLsourceDevisor.nodetype = HSEPLLsourceDevisorval;
        const PLLSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLLSource.nodetype = PLLSourceval;
        const VCO2outputval = ClockNodeTypes{ .output = null };
        self.VCO2output.nodetype = VCO2outputval;
        const PLLMULval = ClockNodeTypes{ .mul = .{
            .value = inner: {
                if (config.PLLMUL) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.PLLMUL.nodetype = PLLMULval;
        const USBMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.USBMult.nodetype = USBMultval;
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48120000), .min = 47880000 },
        };
        self.USBoutput.nodetype = USBoutputval;
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SysClkSource.nodetype = SysClkSourceval;
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        self.SysCLKOutput.nodetype = SysCLKOutputval;
        const I2SOutputval = ClockNodeTypes{ .output = null };
        self.I2SOutput.nodetype = I2SOutputval;
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        self.HSERTCDevisor.nodetype = HSERTCDevisorval;
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.RTCClkSource.nodetype = RTCClkSourceval;
        const RTCOutputval = ClockNodeTypes{ .output = null };
        self.RTCOutput.nodetype = RTCOutputval;
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        self.IWDGOutput.nodetype = IWDGOutputval;
        const MCOMultDivisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCOMultDivisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCOMultDivisor.nodetype = MCOMultDivisorval;
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 7;
                }
            },
        };
        self.MCOMult.nodetype = MCOMultval;
        const MCODividerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODivider) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCODivider.nodetype = MCODividerval;
        const MCOoutputval = ClockNodeTypes{ .output = null };
        self.MCOoutput.nodetype = MCOoutputval;
        const AHBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.AHBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.AHBPrescaler.nodetype = AHBPrescalerval;
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.AHBOutput.nodetype = AHBOutputval;
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        self.HCLKOutput.nodetype = HCLKOutputval;
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        self.FCLKCortexOutput.nodetype = FCLKCortexOutputval;
        const TimSysPrescval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TimSysPresc) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.TimSysPresc.nodetype = TimSysPrescval;
        const TimSysOutputval = ClockNodeTypes{ .output = null };
        self.TimSysOutput.nodetype = TimSysOutputval;
        const APB1Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB1Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB1Prescaler.nodetype = APB1Prescalerval;
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.APB1Output.nodetype = APB1Outputval;
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
        self.TimPrescalerAPB1.nodetype = TimPrescalerAPB1val;
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        self.TimPrescOut1.nodetype = TimPrescOut1val;
        const I2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C1Mult.nodetype = I2C1Multval;
        const I2C1Outputval = ClockNodeTypes{ .output = null };
        self.I2C1Output.nodetype = I2C1Outputval;
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.USART1Mult.nodetype = USART1Multval;
        const USART1Outputval = ClockNodeTypes{ .output = null };
        self.USART1Output.nodetype = USART1Outputval;
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        self.HSE_Timout = HSE_Timoutval;
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        self.LSE_Timout = LSE_Timoutval;
        const HSICalibrationValueval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.HSICalibrationValue) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
        self.HSICalibrationValue = HSICalibrationValueval;
        const HSI14CalibrationValueval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.HSI14CalibrationValue) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
        self.HSI14CalibrationValue = HSI14CalibrationValueval;
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
                    return error.InvalidConfig;
                } else {
                    break :inner 0;
                }
            },
        } };
        self.LSE_Drive_Capability = LSE_Drive_Capabilityval;
    }
};
