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

    pub fn max() f32 {
        return 1000000;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const CECClockSelectionConf = enum {
    RCC_CECCLKSOURCE_HSI,
    RCC_CECCLKSOURCE_LSE,
};
pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSI48,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,
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
    RCC_MCO1SOURCE_HSI48,
    RCC_MCO1SOURCE_HSI14,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_SYSCLK,
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
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_32 => 32,
            .RCC_MCODIV_64 => 64,
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
            .RCC_SYSCLK_DIV1 => 1,
            .RCC_SYSCLK_DIV2 => 2,
            .RCC_SYSCLK_DIV4 => 4,
            .RCC_SYSCLK_DIV8 => 8,
            .RCC_SYSCLK_DIV16 => 16,
            .RCC_SYSCLK_DIV64 => 64,
            .RCC_SYSCLK_DIV128 => 128,
            .RCC_SYSCLK_DIV256 => 256,
            .RCC_SYSCLK_DIV512 => 512,
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
            .RCC_HCLK_DIV1 => 1,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV16 => 16,
        };
    }
};
pub const I2c1ClockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_SYSCLK,
};
pub const Usart1ClockSelectionConf = enum {
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
    RCC_USART1CLKSOURCE_PCLK1,
};
pub const Usart2ClockSelectionConf = enum {
    RCC_USART2CLKSOURCE_SYSCLK,
    RCC_USART2CLKSOURCE_HSI,
    RCC_USART2CLKSOURCE_LSE,
    RCC_USART2CLKSOURCE_PCLK1,
};
pub const Usart3ClockSelectionConf = enum {
    RCC_USART3CLKSOURCE_SYSCLK,
    RCC_USART3CLKSOURCE_HSI,
    RCC_USART3CLKSOURCE_LSE,
    RCC_USART3CLKSOURCE_PCLK1,
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSI48,
    RCC_PLLSOURCE_HSE,
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
            .RCC_PREDIV_DIV1 => 1,
            .RCC_PREDIV_DIV2 => 2,
            .RCC_PREDIV_DIV3 => 3,
            .RCC_PREDIV_DIV4 => 4,
            .RCC_PREDIV_DIV5 => 5,
            .RCC_PREDIV_DIV6 => 6,
            .RCC_PREDIV_DIV7 => 7,
            .RCC_PREDIV_DIV8 => 8,
            .RCC_PREDIV_DIV9 => 9,
            .RCC_PREDIV_DIV10 => 10,
            .RCC_PREDIV_DIV11 => 11,
            .RCC_PREDIV_DIV12 => 12,
            .RCC_PREDIV_DIV13 => 13,
            .RCC_PREDIV_DIV14 => 14,
            .RCC_PREDIV_DIV15 => 15,
            .RCC_PREDIV_DIV16 => 16,
        };
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
            .RCC_PLL_MUL2 => 2,
            .RCC_PLL_MUL3 => 3,
            .RCC_PLL_MUL4 => 4,
            .RCC_PLL_MUL5 => 5,
            .RCC_PLL_MUL6 => 6,
            .RCC_PLL_MUL7 => 7,
            .RCC_PLL_MUL8 => 8,
            .RCC_PLL_MUL9 => 9,
            .RCC_PLL_MUL10 => 10,
            .RCC_PLL_MUL11 => 11,
            .RCC_PLL_MUL12 => 12,
            .RCC_PLL_MUL13 => 13,
            .RCC_PLL_MUL14 => 14,
            .RCC_PLL_MUL15 => 15,
            .RCC_PLL_MUL16 => 16,
        };
    }
};
pub const HSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const LSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
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
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    LSEOSC: LSE_VALUEConf = @enumFromInt(32768),
    CECMult: CECClockSelectionConf = .RCC_CECCLKSOURCE_HSI,
    HSEOSC: HSE_VALUEConf = @enumFromInt(8000000),
    SysClkSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_HSI,
    RTCClkSource: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    MCOMultDivisor: RCC_MCOMult_Clock_Source_FROM_PLLMULConf = .RCC_MCO1SOURCE_PLLCLK,
    MCOMult: RCC_MCOSourceConf = .RCC_MCO1SOURCE_SYSCLK,
    MCODivider: RCC_MCODivConf = .RCC_MCODIV_1,
    AHBPrescaler: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    TimSysPresc: TimSys_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1Prescaler: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    I2C1Mult: I2c1ClockSelectionConf = .RCC_I2C1CLKSOURCE_HSI,
    USART1Mult: Usart1ClockSelectionConf = .RCC_USART1CLKSOURCE_PCLK1,
    USART2Mult: Usart2ClockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3Mult: Usart3ClockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    PLLSource: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLDiv: PLLDividerConf = .RCC_PREDIV_DIV1,
    PLLMUL: PLLMULConf = .RCC_PLL_MUL2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = .null,
    HSI14CalibrationValue: HSI14CalibrationValueConf = .null,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ConfigWithRef = struct {
    LSE_VALUE: LSE_VALUEConf = @enumFromInt(32768),
    CECClockSelection: CECClockSelectionConf = .RCC_CECCLKSOURCE_HSI,
    HSE_VALUE: HSE_VALUEConf = @enumFromInt(8000000),
    SYSCLKSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_HSI,
    RTCClockSelection: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    RCC_MCOMult_Clock_Source_FROM_PLLMUL: RCC_MCOMult_Clock_Source_FROM_PLLMULConf = .RCC_MCO1SOURCE_PLLCLK,
    RCC_MCOSource: RCC_MCOSourceConf = .RCC_MCO1SOURCE_SYSCLK,
    RCC_MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    AHBCLKDivider: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    TimSys_Div: TimSys_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1CLKDivider: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    I2c1ClockSelection: I2c1ClockSelectionConf = .RCC_I2C1CLKSOURCE_HSI,
    Usart1ClockSelection: Usart1ClockSelectionConf = .RCC_USART1CLKSOURCE_PCLK1,
    Usart2ClockSelection: Usart2ClockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    Usart3ClockSelection: Usart3ClockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    PLLSourceVirtual: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLDivider: PLLDividerConf = .RCC_PREDIV_DIV1,
    PLLMUL: PLLMULConf = .RCC_PLL_MUL2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = .null,
    HSI14CalibrationValue: HSI14CalibrationValueConf = .null,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .LSEOSC = self.LSE_VALUE,
            .CECMult = self.CECClockSelection,
            .HSEOSC = self.HSE_VALUE,
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
            .USART2Mult = self.Usart2ClockSelection,
            .USART3Mult = self.Usart3ClockSelection,
            .PLLSource = self.PLLSourceVirtual,
            .PLLDiv = self.PLLDivider,
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
    const this = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    HSICECDiv: ClockNode,
    HSIRC48: ClockNode,
    HSIRC14: ClockNode,
    ADCoutput: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    CECMult: ClockNode,
    CECOutput: ClockNode,
    HSEOSC: ClockNode,
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
    USART2Mult: ClockNode,
    USART2Output: ClockNode,
    USART3Mult: ClockNode,
    USART3Output: ClockNode,
    PLLSource: ClockNode,
    PLLDiv: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    HSI14CalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const FLITFCLKoutputval = ClockNodeTypes{ .output = null };
        const FLITFCLKoutput: ClockNode = .{
            .name = "FLITFCLKoutput",
            .Nodetype = FLITFCLKoutputval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSICECDivval = ClockNodeTypes{
            .div = .{ .value = 244 },
        };
        const HSICECDiv: ClockNode = .{
            .name = "HSICECDiv",
            .Nodetype = HSICECDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSIRC48val = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSIRC48: ClockNode = .{
            .name = "HSIRC48",
            .Nodetype = HSIRC48val,
        };
        const HSIRC14val = ClockNodeTypes{
            .source = .{ .value = 14000000 },
        };
        const HSIRC14: ClockNode = .{
            .name = "HSIRC14",
            .Nodetype = HSIRC14val,
        };
        const ADCoutputval = ClockNodeTypes{ .output = null };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&HSIRC14},
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 40000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const CECMultval = ClockNodeTypes{ .multi = @intFromEnum(config.CECMult) };
        const CECMult: ClockNode = .{
            .name = "CECMult",
            .Nodetype = CECMultval,

            .parents = &[_]*const ClockNode{
                &HSICECDiv,
                &LSEOSC,
            },
        };
        const CECOutputval = ClockNodeTypes{ .output = null };
        const CECOutput: ClockNode = .{
            .name = "CECOutput",
            .Nodetype = CECOutputval,
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 32000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSIRC48,
                &HSEOSC,
            },
        };
        const PLLDivval = ClockNodeTypes{ .div = .{ .value = config.PLLDiv.get() } };
        const PLLDiv: ClockNode = .{
            .name = "PLLDiv",
            .Nodetype = PLLDivval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const VCO2outputval = ClockNodeTypes{ .output = null };
        const VCO2output: ClockNode = .{
            .name = "VCO2output",
            .Nodetype = VCO2outputval,
            .parents = &[_]*const ClockNode{&PLLDiv},
        };
        const PLLMULval = ClockNodeTypes{ .mul = .{ .value = config.PLLMUL.get() } };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = PLLMULval,
            .parents = &[_]*const ClockNode{&VCO2output},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSIRC48,
                &HSEOSC,
                &PLLMUL,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const I2SOutputval = ClockNodeTypes{ .output = null };
        const I2SOutput: ClockNode = .{
            .name = "I2SOutput",
            .Nodetype = I2SOutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.RTCClkSource) };
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
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const MCOMultDivisorval = ClockNodeTypes{ .div = .{ .value = config.MCOMultDivisor.get() } };
        const MCOMultDivisor: ClockNode = .{
            .name = "MCOMultDivisor",
            .Nodetype = MCOMultDivisorval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const MCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.MCOMult) };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &MCOMultDivisor,
                &HSIRC,
                &HSIRC48,
                &HSIRC14,
                &HSEOSC,
                &LSIRC,
                &LSEOSC,
                &SysCLKOutput,
            },
        };
        const MCODividerval = ClockNodeTypes{ .div = .{ .value = config.MCODivider.get() } };
        const MCODivider: ClockNode = .{
            .name = "MCODivider",
            .Nodetype = MCODividerval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOoutputval = ClockNodeTypes{ .output = null };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .Nodetype = MCOoutputval,
            .parents = &[_]*const ClockNode{&MCODivider},
        };
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
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
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TimSysPrescval = ClockNodeTypes{ .div = .{ .value = config.TimSysPresc.get() } };
        const TimSysPresc: ClockNode = .{
            .name = "TimSysPresc",
            .Nodetype = TimSysPrescval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const TimSysOutputval = ClockNodeTypes{ .output = null };
        const TimSysOutput: ClockNode = .{
            .name = "TimSysOutput",
            .Nodetype = TimSysOutputval,
            .parents = &[_]*const ClockNode{&TimSysPresc},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB1Prescaler.get() } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
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
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const I2C1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C1Mult) };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C1Outputval = ClockNodeTypes{ .output = null };
        const I2C1Output: ClockNode = .{
            .name = "I2C1Output",
            .Nodetype = I2C1Outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const USART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART1Mult) };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART1Outputval = ClockNodeTypes{ .output = null };
        const USART1Output: ClockNode = .{
            .name = "USART1Output",
            .Nodetype = USART1Outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART2Mult) };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .Nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
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
        const USART3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART3Mult) };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",
            .Nodetype = USART3Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART3Outputval = ClockNodeTypes{ .output = null };
        const USART3Output: ClockNode = .{
            .name = "USART3Output",
            .Nodetype = USART3Outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.HSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.LSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{ .value = config.HSICalibrationValue.get() },
        };
        const HSI14CalibrationValueval = ClockNodeTypes{
            .source = .{ .value = config.HSI14CalibrationValue.get() },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
        return .{
            .HSIRC = HSIRC,
            .FLITFCLKoutput = FLITFCLKoutput,
            .HSICECDiv = HSICECDiv,
            .HSIRC48 = HSIRC48,
            .HSIRC14 = HSIRC14,
            .ADCoutput = ADCoutput,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .CECMult = CECMult,
            .CECOutput = CECOutput,
            .HSEOSC = HSEOSC,
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
            .USART2Mult = USART2Mult,
            .USART2Output = USART2Output,
            .USART3Mult = USART3Mult,
            .USART3Output = USART3Output,
            .PLLSource = PLLSource,
            .PLLDiv = PLLDiv,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .HSI14CalibrationValue = HSI14CalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.I2SOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.TimSysOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.I2C1Output.get_comptime();
        _ = self.USART1Output.get_comptime();
        _ = self.USART2Output.get_comptime();
        _ = self.USART3Output.get_comptime();
    }
};
