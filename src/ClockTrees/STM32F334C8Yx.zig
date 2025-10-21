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
pub const RCC_PLLsource_Clock_Source_FROM_HSEConf = enum {
    RCC_HSE_PREDIV_DIV1,
    RCC_HSE_PREDIV_DIV2,
    RCC_HSE_PREDIV_DIV3,
    RCC_HSE_PREDIV_DIV4,
    RCC_HSE_PREDIV_DIV5,
    RCC_HSE_PREDIV_DIV6,
    RCC_HSE_PREDIV_DIV7,
    RCC_HSE_PREDIV_DIV8,
    RCC_HSE_PREDIV_DIV9,
    RCC_HSE_PREDIV_DIV10,
    RCC_HSE_PREDIV_DIV11,
    RCC_HSE_PREDIV_DIV12,
    RCC_HSE_PREDIV_DIV13,
    RCC_HSE_PREDIV_DIV14,
    RCC_HSE_PREDIV_DIV15,
    RCC_HSE_PREDIV_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSE_PREDIV_DIV16 => 16,
            .RCC_HSE_PREDIV_DIV5 => 5,
            .RCC_HSE_PREDIV_DIV14 => 14,
            .RCC_HSE_PREDIV_DIV13 => 13,
            .RCC_HSE_PREDIV_DIV8 => 8,
            .RCC_HSE_PREDIV_DIV2 => 2,
            .RCC_HSE_PREDIV_DIV10 => 10,
            .RCC_HSE_PREDIV_DIV6 => 6,
            .RCC_HSE_PREDIV_DIV9 => 9,
            .RCC_HSE_PREDIV_DIV3 => 3,
            .RCC_HSE_PREDIV_DIV15 => 15,
            .RCC_HSE_PREDIV_DIV12 => 12,
            .RCC_HSE_PREDIV_DIV11 => 11,
            .RCC_HSE_PREDIV_DIV1 => 1,
            .RCC_HSE_PREDIV_DIV4 => 4,
            .RCC_HSE_PREDIV_DIV7 => 7,
        };
    }
};
pub const PRESCALERUSBConf = enum {
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_PLL_DIV1_5,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_USBCLKSOURCE_PLL => 1,
            .RCC_USBCLKSOURCE_PLL_DIV1_5 => 1.5,
        };
    }
};
pub const SYSCLKSourceVirtualConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
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
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSE,
    MCOMultDivisor,
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
pub const ADC12PRESConf = enum {
    RCC_ADC12PLLCLK_DIV1,
    RCC_ADC12PLLCLK_DIV2,
    RCC_ADC12PLLCLK_DIV4,
    RCC_ADC12PLLCLK_DIV6,
    RCC_ADC12PLLCLK_DIV8,
    RCC_ADC12PLLCLK_DIV10,
    RCC_ADC12PLLCLK_DIV12,
    RCC_ADC12PLLCLK_DIV16,
    RCC_ADC12PLLCLK_DIV32,
    RCC_ADC12PLLCLK_DIV64,
    RCC_ADC12PLLCLK_DIV128,
    RCC_ADC12PLLCLK_DIV256,
    RCC_ADC1PLLCLK_DIV1,
    RCC_ADC1PLLCLK_DIV2,
    RCC_ADC1PLLCLK_DIV4,
    RCC_ADC1PLLCLK_DIV6,
    RCC_ADC1PLLCLK_DIV8,
    RCC_ADC1PLLCLK_DIV10,
    RCC_ADC1PLLCLK_DIV12,
    RCC_ADC1PLLCLK_DIV16,
    RCC_ADC1PLLCLK_DIV32,
    RCC_ADC1PLLCLK_DIV64,
    RCC_ADC1PLLCLK_DIV128,
    RCC_ADC1PLLCLK_DIV256,
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_ADC12PLLCLK_DIV64 => 64,
            .null => 0,
            .RCC_ADC1PLLCLK_DIV2 => 2,
            .RCC_ADC1PLLCLK_DIV32 => 32,
            .RCC_ADC12PLLCLK_DIV32 => 32,
            .RCC_ADC1PLLCLK_DIV16 => 16,
            .RCC_ADC1PLLCLK_DIV64 => 64,
            .RCC_ADC1PLLCLK_DIV128 => 128,
            .RCC_ADC12PLLCLK_DIV16 => 16,
            .RCC_ADC1PLLCLK_DIV4 => 4,
            .RCC_ADC12PLLCLK_DIV256 => 256,
            .RCC_ADC12PLLCLK_DIV4 => 4,
            .RCC_ADC12PLLCLK_DIV128 => 128,
            .RCC_ADC12PLLCLK_DIV12 => 12,
            .RCC_ADC12PLLCLK_DIV6 => 6,
            .RCC_ADC1PLLCLK_DIV1 => 1,
            .RCC_ADC12PLLCLK_DIV2 => 2,
            .RCC_ADC1PLLCLK_DIV8 => 8,
            .RCC_ADC12PLLCLK_DIV1 => 1,
            .RCC_ADC1PLLCLK_DIV256 => 256,
            .RCC_ADC1PLLCLK_DIV6 => 6,
            .RCC_ADC12PLLCLK_DIV8 => 8,
            .RCC_ADC1PLLCLK_DIV12 => 12,
            .RCC_ADC12PLLCLK_DIV10 => 10,
            .RCC_ADC1PLLCLK_DIV10 => 10,
        };
    }
};
pub const ADC34PRESConf = enum {
    RCC_ADC34PLLCLK_DIV1,
    RCC_ADC34PLLCLK_DIV2,
    RCC_ADC34PLLCLK_DIV4,
    RCC_ADC34PLLCLK_DIV6,
    RCC_ADC34PLLCLK_DIV8,
    RCC_ADC34PLLCLK_DIV10,
    RCC_ADC34PLLCLK_DIV12,
    RCC_ADC34PLLCLK_DIV16,
    RCC_ADC34PLLCLK_DIV32,
    RCC_ADC34PLLCLK_DIV64,
    RCC_ADC34PLLCLK_DIV128,
    RCC_ADC34PLLCLK_DIV256,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_ADC34PLLCLK_DIV8 => 8,
            .RCC_ADC34PLLCLK_DIV10 => 10,
            .RCC_ADC34PLLCLK_DIV12 => 12,
            .RCC_ADC34PLLCLK_DIV4 => 4,
            .RCC_ADC34PLLCLK_DIV64 => 64,
            .RCC_ADC34PLLCLK_DIV1 => 1,
            .RCC_ADC34PLLCLK_DIV16 => 16,
            .RCC_ADC34PLLCLK_DIV128 => 128,
            .RCC_ADC34PLLCLK_DIV6 => 6,
            .RCC_ADC34PLLCLK_DIV256 => 256,
            .RCC_ADC34PLLCLK_DIV32 => 32,
            .RCC_ADC34PLLCLK_DIV2 => 2,
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
pub const TIM1SelectionConf = enum {
    RCC_TIM1CLK_PLLCLK,
    RCC_TIM1CLK_HCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const TIM8SelectionConf = enum {
    RCC_TIM8CLK_PLLCLK,
    RCC_TIM8CLK_HCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const HRTIMSelectionConf = enum {
    RCC_HRTIM1CLK_PLLCLK,
    RCC_HRTIM1CLK_HCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2c1ClockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2c2ClockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_HSI,
    RCC_I2C2CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2c3ClockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_HSI,
    RCC_I2C3CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2SClockSourceConf = enum {
    RCC_I2SCLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Usart1ClockSelectionConf = enum {
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
    RCC_USART1CLKSOURCE_PCLK1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Uart4ClockSelectionConf = enum {
    RCC_UART4CLKSOURCE_SYSCLK,
    RCC_UART4CLKSOURCE_HSI,
    RCC_UART4CLKSOURCE_LSE,
    RCC_UART4CLKSOURCE_PCLK1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const Uart5ClockSelectionConf = enum {
    RCC_UART5CLKSOURCE_SYSCLK,
    RCC_UART5CLKSOURCE_HSI,
    RCC_UART5CLKSOURCE_LSE,
    RCC_UART5CLKSOURCE_PCLK1,

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
pub const Config = struct {
    LSEOSC: ?LSE_VALUEConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    HSEPLLsourceDevisor: ?RCC_PLLsource_Clock_Source_FROM_HSEConf = null,
    PRESCALERUSB: ?PRESCALERUSBConf = null,
    SysClkSource: ?SYSCLKSourceVirtualConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    MCOMultDivisor: ?RCC_MCOMult_Clock_Source_FROM_PLLMULConf = null,
    MCOMult: ?RCC_MCOSourceConf = null,
    MCODivisor: ?RCC_MCODivConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    ADC12PRES: ?ADC12PRESConf = null,
    ADC34PRES: ?ADC34PRESConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    TIMMUX1: ?TIM1SelectionConf = null,
    TIMMUX8: ?TIM8SelectionConf = null,
    HRTIMMux: ?HRTIMSelectionConf = null,
    I2C1Mult: ?I2c1ClockSelectionConf = null,
    I2C2Mult: ?I2c2ClockSelectionConf = null,
    I2C3Mult: ?I2c3ClockSelectionConf = null,
    I2SSrc: ?I2SClockSourceConf = null,
    USART1Mult: ?Usart1ClockSelectionConf = null,
    UART4Mult: ?Uart4ClockSelectionConf = null,
    UART5Mult: ?Uart5ClockSelectionConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    LSE_VALUE: ?LSE_VALUEConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    RCC_PLLsource_Clock_Source_FROM_HSE: ?RCC_PLLsource_Clock_Source_FROM_HSEConf = null,
    PRESCALERUSB: ?PRESCALERUSBConf = null,
    SYSCLKSourceVirtual: ?SYSCLKSourceVirtualConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    RCC_MCOMult_Clock_Source_FROM_PLLMUL: ?RCC_MCOMult_Clock_Source_FROM_PLLMULConf = null,
    RCC_MCOSource: ?RCC_MCOSourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    ADC12PRES: ?ADC12PRESConf = null,
    ADC34PRES: ?ADC34PRESConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    TIM1Selection: ?TIM1SelectionConf = null,
    TIM8Selection: ?TIM8SelectionConf = null,
    HRTIMSelection: ?HRTIMSelectionConf = null,
    I2c1ClockSelection: ?I2c1ClockSelectionConf = null,
    I2c2ClockSelection: ?I2c2ClockSelectionConf = null,
    I2c3ClockSelection: ?I2c3ClockSelectionConf = null,
    I2SClockSource: ?I2SClockSourceConf = null,
    Usart1ClockSelection: ?Usart1ClockSelectionConf = null,
    Uart4ClockSelection: ?Uart4ClockSelectionConf = null,
    Uart5ClockSelection: ?Uart5ClockSelectionConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLMUL: ?PLLMULConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .LSEOSC = self.LSE_VALUE,
            .HSEOSC = self.HSE_VALUE,
            .HSEPLLsourceDevisor = self.RCC_PLLsource_Clock_Source_FROM_HSE,
            .PRESCALERUSB = self.PRESCALERUSB,
            .SysClkSource = self.SYSCLKSourceVirtual,
            .RTCClkSource = self.RTCClockSelection,
            .MCOMultDivisor = self.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
            .MCOMult = self.RCC_MCOSource,
            .MCODivisor = self.RCC_MCODiv,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .ADC12PRES = self.ADC12PRES,
            .ADC34PRES = self.ADC34PRES,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .TIMMUX1 = self.TIM1Selection,
            .TIMMUX8 = self.TIM8Selection,
            .HRTIMMux = self.HRTIMSelection,
            .I2C1Mult = self.I2c1ClockSelection,
            .I2C2Mult = self.I2c2ClockSelection,
            .I2C3Mult = self.I2c3ClockSelection,
            .I2SSrc = self.I2SClockSource,
            .USART1Mult = self.Usart1ClockSelection,
            .UART4Mult = self.Uart4ClockSelection,
            .UART5Mult = self.Uart5ClockSelection,
            .PLLSource = self.PLLSourceVirtual,
            .PLLMUL = self.PLLMUL,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const Self = @This();

    HSIRC: ClockNode,
    HSIRCDiv: ClockNode,
    FLITFCLKoutput: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSEOSC: ClockNode,
    HSEPLLsourceDevisor: ClockNode,
    PRESCALERUSB: ClockNode,
    USBoutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    MCOMultDivisor: ClockNode,
    MCOMult: ClockNode,
    MCODivisor: ClockNode,
    MCOoutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    ADC12PRES: ClockNode,
    ADC12output: ClockNode,
    ADC34PRES: ClockNode,
    ADC34output: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    TIMMUL: ClockNode,
    TIMMUX1: ClockNode,
    TIM1out: ClockNode,
    TIMMUX8: ClockNode,
    TIM8out: ClockNode,
    HRTIMMux: ClockNode,
    HRTIMout: ClockNode,
    I2C1Mult: ClockNode,
    I2C1Output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2Output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3Output: ClockNode,
    I2SSrc: ClockNode,
    USART1Mult: ClockNode,
    USART1Output: ClockNode,
    UART4Mult: ClockNode,
    UART4Output: ClockNode,
    UART5Mult: ClockNode,
    UART5Output: ClockNode,
    PLLSource: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init(comptime config: Config) Self {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .nodetype = HSIRCval,
        };
        const HSIRCDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const HSIRCDiv: ClockNode = .{
            .name = "HSIRCDiv",
            .nodetype = HSIRCDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const FLITFCLKoutputval = ClockNodeTypes{ .output = null };
        const FLITFCLKoutput: ClockNode = .{
            .name = "FLITFCLKoutput",
            .nodetype = FLITFCLKoutputval,
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
        const PRESCALERUSBval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PRESCALERUSB) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PRESCALERUSB: ClockNode = .{
            .name = "PRESCALERUSB",
            .nodetype = PRESCALERUSBval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48120000), .min = 47880000 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&PRESCALERUSB},
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
            .output = .{ .max = @min(1_000_000_000, 72000000), .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
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
                    switch (val) {
                        .RCC_MCO1SOURCE_HSI,
                        .RCC_MCO1SOURCE_LSE,
                        .RCC_MCO1SOURCE_HSE,
                        .RCC_MCO1SOURCE_LSI,
                        .RCC_MCO1SOURCE_SYSCLK,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &LSEOSC,
                &HSEOSC,
                &MCOMultDivisor,
                &LSIRC,
                &SysCLKOutput,
            },
        };
        const MCODivisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODivisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCODivisor: ClockNode = .{
            .name = "MCODivisor",
            .nodetype = MCODivisorval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOoutputval = ClockNodeTypes{ .output = null };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .nodetype = MCOoutputval,
            .parents = &[_]*const ClockNode{&MCODivisor},
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
            .output = .{ .max = @min(1_000_000_000, 72000000), .min = 0 },
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
            .nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const ADC12PRESval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADC12PRES) |val| {
                    switch (val) {
                        .RCC_ADC12PLLCLK_DIV1,
                        .RCC_ADC12PLLCLK_DIV2,
                        .RCC_ADC12PLLCLK_DIV4,
                        .RCC_ADC12PLLCLK_DIV6,
                        .RCC_ADC12PLLCLK_DIV8,
                        .RCC_ADC12PLLCLK_DIV10,
                        .RCC_ADC12PLLCLK_DIV12,
                        .RCC_ADC12PLLCLK_DIV16,
                        .RCC_ADC12PLLCLK_DIV32,
                        .RCC_ADC12PLLCLK_DIV64,
                        .RCC_ADC12PLLCLK_DIV128,
                        .RCC_ADC12PLLCLK_DIV256,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const ADC12PRES: ClockNode = .{
            .name = "ADC12PRES",
            .nodetype = ADC12PRESval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC12outputval = ClockNodeTypes{ .output = null };
        const ADC12output: ClockNode = .{
            .name = "ADC12output",
            .nodetype = ADC12outputval,
            .parents = &[_]*const ClockNode{&ADC12PRES},
        };
        const ADC34PRESval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADC34PRES) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const ADC34PRES: ClockNode = .{
            .name = "ADC34PRES",
            .nodetype = ADC34PRESval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC34outputval = ClockNodeTypes{ .output = null };
        const ADC34output: ClockNode = .{
            .name = "ADC34output",
            .nodetype = ADC34outputval,
            .parents = &[_]*const ClockNode{&ADC34PRES},
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
            .output = .{ .max = @min(1_000_000_000, 72000000), .min = 0 },
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
        const TIMMULval = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        const TIMMUL: ClockNode = .{
            .name = "TIMMUL",
            .nodetype = TIMMULval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const TIMMUX1val = ClockNodeTypes{
            .multi = inner: {
                if (config.TIMMUX1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const TIMMUX1: ClockNode = .{
            .name = "TIMMUX1",
            .nodetype = TIMMUX1val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM1outval = ClockNodeTypes{ .output = null };
        const TIM1out: ClockNode = .{
            .name = "TIM1out",
            .nodetype = TIM1outval,
            .parents = &[_]*const ClockNode{&TIMMUX1},
        };
        const TIMMUX8val = ClockNodeTypes{
            .multi = inner: {
                if (config.TIMMUX8) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const TIMMUX8: ClockNode = .{
            .name = "TIMMUX8",
            .nodetype = TIMMUX8val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM8outval = ClockNodeTypes{ .output = null };
        const TIM8out: ClockNode = .{
            .name = "TIM8out",
            .nodetype = TIM8outval,
            .parents = &[_]*const ClockNode{&TIMMUX8},
        };
        const HRTIMMuxval = ClockNodeTypes{
            .multi = inner: {
                if (config.HRTIMMux) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const HRTIMMux: ClockNode = .{
            .name = "HRTIMMux",
            .nodetype = HRTIMMuxval,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const HRTIMoutval = ClockNodeTypes{ .output = null };
        const HRTIMout: ClockNode = .{
            .name = "HRTIMout",
            .nodetype = HRTIMoutval,
            .parents = &[_]*const ClockNode{&HRTIMMux},
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
        const I2C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C2Outputval = ClockNodeTypes{ .output = null };
        const I2C2Output: ClockNode = .{
            .name = "I2C2Output",
            .nodetype = I2C2Outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
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
            .nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C3Outputval = ClockNodeTypes{ .output = null };
        const I2C3Output: ClockNode = .{
            .name = "I2C3Output",
            .nodetype = I2C3Outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2SSrcval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2SSrc) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const I2SSrc: ClockNode = .{
            .name = "I2SSrc",
            .nodetype = I2SSrcval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
            },
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
            .nodetype = USART1Multval,

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
            .nodetype = USART1Outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const UART4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",
            .nodetype = UART4Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const UART4Outputval = ClockNodeTypes{ .output = null };
        const UART4Output: ClockNode = .{
            .name = "UART4Output",
            .nodetype = UART4Outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",
            .nodetype = UART5Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const UART5Outputval = ClockNodeTypes{ .output = null };
        const UART5Output: ClockNode = .{
            .name = "UART5Output",
            .nodetype = UART5Outputval,
            .parents = &[_]*const ClockNode{&UART5Mult},
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
            .HSIRCDiv = HSIRCDiv,
            .FLITFCLKoutput = FLITFCLKoutput,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .HSEOSC = HSEOSC,
            .HSEPLLsourceDevisor = HSEPLLsourceDevisor,
            .PRESCALERUSB = PRESCALERUSB,
            .USBoutput = USBoutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .MCOMultDivisor = MCOMultDivisor,
            .MCOMult = MCOMult,
            .MCODivisor = MCODivisor,
            .MCOoutput = MCOoutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .ADC12PRES = ADC12PRES,
            .ADC12output = ADC12output,
            .ADC34PRES = ADC34PRES,
            .ADC34output = ADC34output,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .TIMMUL = TIMMUL,
            .TIMMUX1 = TIMMUX1,
            .TIM1out = TIM1out,
            .TIMMUX8 = TIMMUX8,
            .TIM8out = TIM8out,
            .HRTIMMux = HRTIMMux,
            .HRTIMout = HRTIMout,
            .I2C1Mult = I2C1Mult,
            .I2C1Output = I2C1Output,
            .I2C2Mult = I2C2Mult,
            .I2C2Output = I2C2Output,
            .I2C3Mult = I2C3Mult,
            .I2C3Output = I2C3Output,
            .I2SSrc = I2SSrc,
            .USART1Mult = USART1Mult,
            .USART1Output = USART1Output,
            .UART4Mult = UART4Mult,
            .UART4Output = UART4Output,
            .UART5Mult = UART5Mult,
            .UART5Output = UART5Output,
            .PLLSource = PLLSource,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSIRCDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.FLITFCLKoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEPLLsourceDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.PRESCALERUSB.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLMUL,
        });
        self.USBoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PRESCALERUSB,
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
            &self.HSIRC,
            &self.LSEOSC,
            &self.HSEOSC,
            &self.MCOMultDivisor,
            &self.LSIRC,
            &self.SysCLKOutput,
        });
        self.MCODivisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMult,
        });
        self.MCOoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCODivisor,
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
        self.CortexPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.CortexSysOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CortexPrescaler,
        });
        self.ADC12PRES.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLMUL,
        });
        self.ADC12output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADC12PRES,
        });
        self.ADC34PRES.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLMUL,
        });
        self.ADC34output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADC34PRES,
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
        self.TIMMUL.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLMUL,
        });
        self.TIMMUX1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIMMUL,
            &self.TimPrescOut2,
        });
        self.TIM1out.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIMMUX1,
        });
        self.TIMMUX8.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIMMUL,
            &self.TimPrescOut2,
        });
        self.TIM8out.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIMMUX8,
        });
        self.HRTIMMux.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIMMUL,
            &self.TimPrescOut2,
        });
        self.HRTIMout.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HRTIMMux,
        });
        self.I2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.SysCLKOutput,
        });
        self.I2C1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C1Mult,
        });
        self.I2C2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.SysCLKOutput,
        });
        self.I2C2Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C2Mult,
        });
        self.I2C3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.SysCLKOutput,
        });
        self.I2C3Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C3Mult,
        });
        self.I2SSrc.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
        });
        self.USART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
            &self.APB1Prescaler,
        });
        self.USART1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART1Mult,
        });
        self.UART4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
            &self.APB1Prescaler,
        });
        self.UART4Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART4Mult,
        });
        self.UART5Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
            &self.APB1Prescaler,
        });
        self.UART5Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART5Mult,
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
        alloc.free(self.HSIRCDiv.parents.?);
        alloc.free(self.FLITFCLKoutput.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.HSEPLLsourceDevisor.parents.?);
        alloc.free(self.PRESCALERUSB.parents.?);
        alloc.free(self.USBoutput.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.MCOMultDivisor.parents.?);
        alloc.free(self.MCOMult.parents.?);
        alloc.free(self.MCODivisor.parents.?);
        alloc.free(self.MCOoutput.parents.?);
        alloc.free(self.AHBPrescaler.parents.?);
        alloc.free(self.AHBOutput.parents.?);
        alloc.free(self.HCLKOutput.parents.?);
        alloc.free(self.FCLKCortexOutput.parents.?);
        alloc.free(self.CortexPrescaler.parents.?);
        alloc.free(self.CortexSysOutput.parents.?);
        alloc.free(self.ADC12PRES.parents.?);
        alloc.free(self.ADC12output.parents.?);
        alloc.free(self.ADC34PRES.parents.?);
        alloc.free(self.ADC34output.parents.?);
        alloc.free(self.APB1Prescaler.parents.?);
        alloc.free(self.APB1Output.parents.?);
        alloc.free(self.TimPrescalerAPB1.parents.?);
        alloc.free(self.TimPrescOut1.parents.?);
        alloc.free(self.APB2Prescaler.parents.?);
        alloc.free(self.APB2Output.parents.?);
        alloc.free(self.TimPrescalerAPB2.parents.?);
        alloc.free(self.TimPrescOut2.parents.?);
        alloc.free(self.TIMMUL.parents.?);
        alloc.free(self.TIMMUX1.parents.?);
        alloc.free(self.TIM1out.parents.?);
        alloc.free(self.TIMMUX8.parents.?);
        alloc.free(self.TIM8out.parents.?);
        alloc.free(self.HRTIMMux.parents.?);
        alloc.free(self.HRTIMout.parents.?);
        alloc.free(self.I2C1Mult.parents.?);
        alloc.free(self.I2C1Output.parents.?);
        alloc.free(self.I2C2Mult.parents.?);
        alloc.free(self.I2C2Output.parents.?);
        alloc.free(self.I2C3Mult.parents.?);
        alloc.free(self.I2C3Output.parents.?);
        alloc.free(self.I2SSrc.parents.?);
        alloc.free(self.USART1Mult.parents.?);
        alloc.free(self.USART1Output.parents.?);
        alloc.free(self.UART4Mult.parents.?);
        alloc.free(self.UART4Output.parents.?);
        alloc.free(self.UART5Mult.parents.?);
        alloc.free(self.UART5Output.parents.?);
        alloc.free(self.PLLSource.parents.?);
        alloc.free(self.VCO2output.parents.?);
        alloc.free(self.PLLMUL.parents.?);
    }
    pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        self.HSIRC.nodetype = HSIRCval;
        const HSIRCDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.HSIRCDiv.nodetype = HSIRCDivval;
        const FLITFCLKoutputval = ClockNodeTypes{ .output = null };
        self.FLITFCLKoutput.nodetype = FLITFCLKoutputval;
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
        const PRESCALERUSBval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PRESCALERUSB) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PRESCALERUSB.nodetype = PRESCALERUSBval;
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
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 72000000), .min = 0 },
        };
        self.SysCLKOutput.nodetype = SysCLKOutputval;
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
                    switch (val) {
                        .RCC_MCO1SOURCE_HSI,
                        .RCC_MCO1SOURCE_LSE,
                        .RCC_MCO1SOURCE_HSE,
                        .RCC_MCO1SOURCE_LSI,
                        .RCC_MCO1SOURCE_SYSCLK,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    return error.InvalidConfig;
                } else {
                    break :inner 5;
                }
            },
        };
        self.MCOMult.nodetype = MCOMultval;
        const MCODivisorval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODivisor) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCODivisor.nodetype = MCODivisorval;
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
            .output = .{ .max = @min(1_000_000_000, 72000000), .min = 0 },
        };
        self.AHBOutput.nodetype = AHBOutputval;
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        self.HCLKOutput.nodetype = HCLKOutputval;
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        self.FCLKCortexOutput.nodetype = FCLKCortexOutputval;
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.CortexPrescaler.nodetype = CortexPrescalerval;
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        self.CortexSysOutput.nodetype = CortexSysOutputval;
        const ADC12PRESval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADC12PRES) |val| {
                    switch (val) {
                        .RCC_ADC12PLLCLK_DIV1,
                        .RCC_ADC12PLLCLK_DIV2,
                        .RCC_ADC12PLLCLK_DIV4,
                        .RCC_ADC12PLLCLK_DIV6,
                        .RCC_ADC12PLLCLK_DIV8,
                        .RCC_ADC12PLLCLK_DIV10,
                        .RCC_ADC12PLLCLK_DIV12,
                        .RCC_ADC12PLLCLK_DIV16,
                        .RCC_ADC12PLLCLK_DIV32,
                        .RCC_ADC12PLLCLK_DIV64,
                        .RCC_ADC12PLLCLK_DIV128,
                        .RCC_ADC12PLLCLK_DIV256,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    return error.InvalidConfig;
                } else {
                    break :inner 1;
                }
            },
        } };
        self.ADC12PRES.nodetype = ADC12PRESval;
        const ADC12outputval = ClockNodeTypes{ .output = null };
        self.ADC12output.nodetype = ADC12outputval;
        const ADC34PRESval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADC34PRES) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.ADC34PRES.nodetype = ADC34PRESval;
        const ADC34outputval = ClockNodeTypes{ .output = null };
        self.ADC34output.nodetype = ADC34outputval;
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
            .output = .{ .max = @min(1_000_000_000, 72000000), .min = 0 },
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
        const TIMMULval = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        self.TIMMUL.nodetype = TIMMULval;
        const TIMMUX1val = ClockNodeTypes{
            .multi = inner: {
                if (config.TIMMUX1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.TIMMUX1.nodetype = TIMMUX1val;
        const TIM1outval = ClockNodeTypes{ .output = null };
        self.TIM1out.nodetype = TIM1outval;
        const TIMMUX8val = ClockNodeTypes{
            .multi = inner: {
                if (config.TIMMUX8) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.TIMMUX8.nodetype = TIMMUX8val;
        const TIM8outval = ClockNodeTypes{ .output = null };
        self.TIM8out.nodetype = TIM8outval;
        const HRTIMMuxval = ClockNodeTypes{
            .multi = inner: {
                if (config.HRTIMMux) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.HRTIMMux.nodetype = HRTIMMuxval;
        const HRTIMoutval = ClockNodeTypes{ .output = null };
        self.HRTIMout.nodetype = HRTIMoutval;
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
        const I2C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C2Mult.nodetype = I2C2Multval;
        const I2C2Outputval = ClockNodeTypes{ .output = null };
        self.I2C2Output.nodetype = I2C2Outputval;
        const I2C3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C3Mult.nodetype = I2C3Multval;
        const I2C3Outputval = ClockNodeTypes{ .output = null };
        self.I2C3Output.nodetype = I2C3Outputval;
        const I2SSrcval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2SSrc) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.I2SSrc.nodetype = I2SSrcval;
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART1Mult.nodetype = USART1Multval;
        const USART1Outputval = ClockNodeTypes{ .output = null };
        self.USART1Output.nodetype = USART1Outputval;
        const UART4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.UART4Mult.nodetype = UART4Multval;
        const UART4Outputval = ClockNodeTypes{ .output = null };
        self.UART4Output.nodetype = UART4Outputval;
        const UART5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.UART5Mult.nodetype = UART5Multval;
        const UART5Outputval = ClockNodeTypes{ .output = null };
        self.UART5Output.nodetype = UART5Outputval;
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
