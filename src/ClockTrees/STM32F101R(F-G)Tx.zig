const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const LSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const HSEDivPLLConf = enum {
    RCC_HSE_PREDIV_DIV1,
    RCC_HSE_PREDIV_DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSE_PREDIV_DIV2 => 2,
            .RCC_HSE_PREDIV_DIV1 => 1,
        };
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
    RCC_RTCCLKSOURCE_HSE_DIV128,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCOSourceConf = enum {
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_SYSCLK,

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
pub const ADCPrescConf = enum {
    RCC_ADCPCLK2_DIV2,
    RCC_ADCPCLK2_DIV4,
    RCC_ADCPCLK2_DIV6,
    RCC_ADCPCLK2_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_ADCPCLK2_DIV6 => 6,
            .RCC_ADCPCLK2_DIV8 => 8,
            .RCC_ADCPCLK2_DIV2 => 2,
            .RCC_ADCPCLK2_DIV4 => 4,
        };
    }
};
pub const USBPrescalerConf = enum {
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_PLL_DIV1_5,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_USBCLKSOURCE_PLL => 1,
            .RCC_USBCLKSOURCE_PLL_DIV1_5 => 1.5,
        };
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI_DIV2,
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
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const Config = struct {
    LSEOSC: ?LSE_VALUEConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    HSEDivPLL: ?HSEDivPLLConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    MCOMult: ?RCC_MCOSourceConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    TimSysPresc: ?TimSys_DivConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    ADCprescaler: ?ADCPrescConf = null,
    USBPrescaler: ?USBPrescalerConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
};

pub const ConfigWithRef = struct {
    LSE_VALUE: ?LSE_VALUEConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    HSEDivPLL: ?HSEDivPLLConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    RCC_MCOSource: ?RCC_MCOSourceConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    TimSys_Div: ?TimSys_DivConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    ADCPresc: ?ADCPrescConf = null,
    USBPrescaler: ?USBPrescalerConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .LSEOSC = self.LSE_VALUE,
            .HSEOSC = self.HSE_VALUE,
            .HSEDivPLL = self.HSEDivPLL,
            .SysClkSource = self.SYSCLKSource,
            .RTCClkSource = self.RTCClockSelection,
            .MCOMult = self.RCC_MCOSource,
            .AHBPrescaler = self.AHBCLKDivider,
            .TimSysPresc = self.TimSys_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .ADCprescaler = self.ADCPresc,
            .USBPrescaler = self.USBPrescaler,
            .PLLSource = self.PLLSourceVirtual,
            .PLLMUL = self.PLLMUL,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
        };
    }
};

pub const ClockTree = struct {
    const Self = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    HSIDivPLL: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSEOSC: ClockNode,
    HSEDivPLL: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    MCOMultDivisor: ClockNode,
    MCOMult: ClockNode,
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
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    ADCprescaler: ClockNode,
    ADCoutput: ClockNode,
    USBPrescaler: ClockNode,
    USBoutput: ClockNode,
    PLLSource: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,

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
        const HSIDivPLLval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const HSIDivPLL: ClockNode = .{
            .name = "HSIDivPLL",
            .nodetype = HSIDivPLLval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 40000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .nodetype = LSEOSCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = @min(1_000_000_000, 16000000), .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .nodetype = HSEOSCval,
        };
        const HSEDivPLLval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEDivPLL) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSEDivPLL: ClockNode = .{
            .name = "HSEDivPLL",
            .nodetype = HSEDivPLLval,
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
                &HSIDivPLL,
                &HSEDivPLL,
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
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 128 },
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
                &LSEOSC,
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
        const MCOMultDivisorval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
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
                    break :inner 3;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &MCOMultDivisor,
                &HSIRC,
                &HSEOSC,
                &SysCLKOutput,
            },
        };
        const MCOoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 50000000), .min = 0 },
        };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .nodetype = MCOoutputval,
            .parents = &[_]*const ClockNode{&MCOMult},
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
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
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
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
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
            .nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2val = blk: {
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
        const TimPrescalerAPB2: ClockNode = .{
            .name = "TimPrescalerAPB2",
            .nodetype = TimPrescalerAPB2val,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2val = ClockNodeTypes{ .output = null };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const ADCprescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADCprescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const ADCprescaler: ClockNode = .{
            .name = "ADCprescaler",
            .nodetype = ADCprescalerval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 14000000), .min = 0 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCprescaler},
        };
        const USBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.USBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const USBPrescaler: ClockNode = .{
            .name = "USBPrescaler",
            .nodetype = USBPrescalerval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48120000), .min = 47880000 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBPrescaler},
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
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
            },
        };
        return .{
            .HSIRC = HSIRC,
            .FLITFCLKoutput = FLITFCLKoutput,
            .HSIDivPLL = HSIDivPLL,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .HSEOSC = HSEOSC,
            .HSEDivPLL = HSEDivPLL,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .MCOMultDivisor = MCOMultDivisor,
            .MCOMult = MCOMult,
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
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .ADCprescaler = ADCprescaler,
            .ADCoutput = ADCoutput,
            .USBPrescaler = USBPrescaler,
            .USBoutput = USBoutput,
            .PLLSource = PLLSource,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
        };
    }
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.FLITFCLKoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.HSIDivPLL.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEDivPLL.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.SysClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.HSEOSC,
            &self.PLLMUL,
        });
        self.SysCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysClkSource,
        });
        self.HSERTCDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.RTCClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSERTCDevisor,
            &self.LSEOSC,
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
            &self.HSEOSC,
            &self.SysCLKOutput,
        });
        self.MCOoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMult,
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
        self.APB2Prescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB2Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
        });
        self.TimPrescalerAPB2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
        });
        self.TimPrescOut2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB2,
        });
        self.ADCprescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
        });
        self.ADCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCprescaler,
        });
        self.USBPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLMUL,
        });
        self.USBoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBPrescaler,
        });
        self.PLLSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDivPLL,
            &self.HSEDivPLL,
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
        alloc.free(self.HSIDivPLL.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.HSEDivPLL.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.MCOMultDivisor.parents.?);
        alloc.free(self.MCOMult.parents.?);
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
        alloc.free(self.APB2Prescaler.parents.?);
        alloc.free(self.APB2Output.parents.?);
        alloc.free(self.TimPrescalerAPB2.parents.?);
        alloc.free(self.TimPrescOut2.parents.?);
        alloc.free(self.ADCprescaler.parents.?);
        alloc.free(self.ADCoutput.parents.?);
        alloc.free(self.USBPrescaler.parents.?);
        alloc.free(self.USBoutput.parents.?);
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
        const HSIDivPLLval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.HSIDivPLL.nodetype = HSIDivPLLval;
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 40000 },
        };
        self.LSIRC.nodetype = LSIRCval;
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 0 },
            },
        };
        self.LSEOSC.nodetype = LSEOSCval;
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 8000000,
                .limit = .{ .max = @min(1_000_000_000, 16000000), .min = 4000000 },
            },
        };
        self.HSEOSC.nodetype = HSEOSCval;
        const HSEDivPLLval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEDivPLL) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.HSEDivPLL.nodetype = HSEDivPLLval;
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
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
        };
        self.SysCLKOutput.nodetype = SysCLKOutputval;
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 128 },
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
        const MCOMultDivisorval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.MCOMultDivisor.nodetype = MCOMultDivisorval;
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.MCOMult.nodetype = MCOMultval;
        const MCOoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 50000000), .min = 0 },
        };
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
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
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
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
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
        const APB2Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB2Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB2Prescaler.nodetype = APB2Prescalerval;
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 36000000), .min = 0 },
        };
        self.APB2Output.nodetype = APB2Outputval;
        const TimPrescalerAPB2val = blk: {
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
        self.TimPrescalerAPB2.nodetype = TimPrescalerAPB2val;
        const TimPrescOut2val = ClockNodeTypes{ .output = null };
        self.TimPrescOut2.nodetype = TimPrescOut2val;
        const ADCprescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADCprescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.ADCprescaler.nodetype = ADCprescalerval;
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 14000000), .min = 0 },
        };
        self.ADCoutput.nodetype = ADCoutputval;
        const USBPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.USBPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.USBPrescaler.nodetype = USBPrescalerval;
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48120000), .min = 47880000 },
        };
        self.USBoutput.nodetype = USBoutputval;
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
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
            },
        };
        self.HSICalibrationValue = HSICalibrationValueval;
    }
};
