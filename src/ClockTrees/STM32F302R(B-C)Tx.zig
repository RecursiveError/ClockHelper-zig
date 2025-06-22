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
            .RCC_HSE_PREDIV_DIV1 => 1,
            .RCC_HSE_PREDIV_DIV2 => 2,
            .RCC_HSE_PREDIV_DIV3 => 3,
            .RCC_HSE_PREDIV_DIV4 => 4,
            .RCC_HSE_PREDIV_DIV5 => 5,
            .RCC_HSE_PREDIV_DIV6 => 6,
            .RCC_HSE_PREDIV_DIV7 => 7,
            .RCC_HSE_PREDIV_DIV8 => 8,
            .RCC_HSE_PREDIV_DIV9 => 9,
            .RCC_HSE_PREDIV_DIV10 => 10,
            .RCC_HSE_PREDIV_DIV11 => 11,
            .RCC_HSE_PREDIV_DIV12 => 12,
            .RCC_HSE_PREDIV_DIV13 => 13,
            .RCC_HSE_PREDIV_DIV14 => 14,
            .RCC_HSE_PREDIV_DIV15 => 15,
            .RCC_HSE_PREDIV_DIV16 => 16,
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
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,
};
pub const RCC_MCOSourceConf = enum {
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_PLLCLK_DIV2,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_SYSCLK,
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
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_ADC12PLLCLK_DIV1 => 1,
            .RCC_ADC12PLLCLK_DIV2 => 2,
            .RCC_ADC12PLLCLK_DIV4 => 4,
            .RCC_ADC12PLLCLK_DIV6 => 6,
            .RCC_ADC12PLLCLK_DIV8 => 8,
            .RCC_ADC12PLLCLK_DIV10 => 10,
            .RCC_ADC12PLLCLK_DIV12 => 12,
            .RCC_ADC12PLLCLK_DIV16 => 16,
            .RCC_ADC12PLLCLK_DIV32 => 32,
            .RCC_ADC12PLLCLK_DIV64 => 64,
            .RCC_ADC12PLLCLK_DIV128 => 128,
            .RCC_ADC12PLLCLK_DIV256 => 256,
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
            .RCC_ADC34PLLCLK_DIV1 => 1,
            .RCC_ADC34PLLCLK_DIV2 => 2,
            .RCC_ADC34PLLCLK_DIV4 => 4,
            .RCC_ADC34PLLCLK_DIV6 => 6,
            .RCC_ADC34PLLCLK_DIV8 => 8,
            .RCC_ADC34PLLCLK_DIV10 => 10,
            .RCC_ADC34PLLCLK_DIV12 => 12,
            .RCC_ADC34PLLCLK_DIV16 => 16,
            .RCC_ADC34PLLCLK_DIV32 => 32,
            .RCC_ADC34PLLCLK_DIV64 => 64,
            .RCC_ADC34PLLCLK_DIV128 => 128,
            .RCC_ADC34PLLCLK_DIV256 => 256,
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
pub const APB2CLKDividerConf = enum {
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
pub const TIM1SelectionConf = enum {
    RCC_TIM1CLK_PLLCLK,
    RCC_TIM1CLK_HCLK,
};
pub const TIM8SelectionConf = enum {
    RCC_TIM8CLK_PLLCLK,
    RCC_TIM8CLK_HCLK,
};
pub const HRTIMSelectionConf = enum {
    RCC_HRTIM1CLK_PLLCLK,
    RCC_HRTIM1CLK_HCLK,
};
pub const I2c1ClockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_SYSCLK,
};
pub const I2c2ClockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_HSI,
    RCC_I2C2CLKSOURCE_SYSCLK,
};
pub const I2c3ClockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_HSI,
    RCC_I2C3CLKSOURCE_SYSCLK,
};
pub const I2SClockSourceConf = enum {
    RCC_I2SCLKSOURCE_EXT,
    RCC_I2SCLKSOURCE_SYSCLK,
};
pub const Usart1ClockSelectionConf = enum {
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
    RCC_USART1CLKSOURCE_PCLK2,
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
pub const Uart4ClockSelectionConf = enum {
    RCC_UART4CLKSOURCE_SYSCLK,
    RCC_UART4CLKSOURCE_HSI,
    RCC_UART4CLKSOURCE_LSE,
    RCC_UART4CLKSOURCE_PCLK1,
};
pub const Uart5ClockSelectionConf = enum {
    RCC_UART5CLKSOURCE_SYSCLK,
    RCC_UART5CLKSOURCE_HSI,
    RCC_UART5CLKSOURCE_LSE,
    RCC_UART5CLKSOURCE_PCLK1,
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,
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
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 31;
    }

    pub fn min() f32 {
        return 0;
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
    HSEOSC: HSE_VALUEConf = @enumFromInt(8000000),
    HSEPLLsourceDevisor: RCC_PLLsource_Clock_Source_FROM_HSEConf = .RCC_HSE_PREDIV_DIV1,
    PRESCALERUSB: PRESCALERUSBConf = .RCC_USBCLKSOURCE_PLL,
    SysClkSource: SYSCLKSourceVirtualConf = .RCC_SYSCLKSOURCE_HSI,
    RTCClkSource: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    MCOMult: RCC_MCOSourceConf = .RCC_MCO1SOURCE_SYSCLK,
    AHBPrescaler: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    CortexPrescaler: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    ADC12PRES: ADC12PRESConf = .RCC_ADC12PLLCLK_DIV1,
    ADC34PRES: ADC34PRESConf = .RCC_ADC34PLLCLK_DIV1,
    APB1Prescaler: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2Prescaler: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    TIMMUX1: TIM1SelectionConf = .RCC_TIM1CLK_HCLK,
    TIMMUX8: TIM8SelectionConf = .RCC_TIM8CLK_HCLK,
    HRTIMMux: HRTIMSelectionConf = .RCC_HRTIM1CLK_HCLK,
    I2C1Mult: I2c1ClockSelectionConf = .RCC_I2C1CLKSOURCE_HSI,
    I2C2Mult: I2c2ClockSelectionConf = .RCC_I2C2CLKSOURCE_HSI,
    I2C3Mult: I2c3ClockSelectionConf = .RCC_I2C3CLKSOURCE_HSI,
    I2SSrc: I2SClockSourceConf = .RCC_I2SCLKSOURCE_SYSCLK,
    USART1Mult: Usart1ClockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    USART2Mult: Usart2ClockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    USART3Mult: Usart3ClockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    UART4Mult: Uart4ClockSelectionConf = .RCC_UART4CLKSOURCE_PCLK1,
    UART5Mult: Uart5ClockSelectionConf = .RCC_UART5CLKSOURCE_PCLK1,
    PLLSource: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLMUL: PLLMULConf = .RCC_PLL_MUL2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ConfigWithRef = struct {
    LSE_VALUE: LSE_VALUEConf = @enumFromInt(32768),
    HSE_VALUE: HSE_VALUEConf = @enumFromInt(8000000),
    RCC_PLLsource_Clock_Source_FROM_HSE: RCC_PLLsource_Clock_Source_FROM_HSEConf = .RCC_HSE_PREDIV_DIV1,
    PRESCALERUSB: PRESCALERUSBConf = .RCC_USBCLKSOURCE_PLL,
    SYSCLKSourceVirtual: SYSCLKSourceVirtualConf = .RCC_SYSCLKSOURCE_HSI,
    RTCClockSelection: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    RCC_MCOSource: RCC_MCOSourceConf = .RCC_MCO1SOURCE_SYSCLK,
    AHBCLKDivider: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    Cortex_Div: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    ADC12PRES: ADC12PRESConf = .RCC_ADC12PLLCLK_DIV1,
    ADC34PRES: ADC34PRESConf = .RCC_ADC34PLLCLK_DIV1,
    APB1CLKDivider: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2CLKDivider: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    TIM1Selection: TIM1SelectionConf = .RCC_TIM1CLK_HCLK,
    TIM8Selection: TIM8SelectionConf = .RCC_TIM8CLK_HCLK,
    HRTIMSelection: HRTIMSelectionConf = .RCC_HRTIM1CLK_HCLK,
    I2c1ClockSelection: I2c1ClockSelectionConf = .RCC_I2C1CLKSOURCE_HSI,
    I2c2ClockSelection: I2c2ClockSelectionConf = .RCC_I2C2CLKSOURCE_HSI,
    I2c3ClockSelection: I2c3ClockSelectionConf = .RCC_I2C3CLKSOURCE_HSI,
    I2SClockSource: I2SClockSourceConf = .RCC_I2SCLKSOURCE_SYSCLK,
    Usart1ClockSelection: Usart1ClockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    Usart2ClockSelection: Usart2ClockSelectionConf = .RCC_USART2CLKSOURCE_PCLK1,
    Usart3ClockSelection: Usart3ClockSelectionConf = .RCC_USART3CLKSOURCE_PCLK1,
    Uart4ClockSelection: Uart4ClockSelectionConf = .RCC_UART4CLKSOURCE_PCLK1,
    Uart5ClockSelection: Uart5ClockSelectionConf = .RCC_UART5CLKSOURCE_PCLK1,
    PLLSourceVirtual: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLMUL: PLLMULConf = .RCC_PLL_MUL2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .LSEOSC = self.LSE_VALUE,
            .HSEOSC = self.HSE_VALUE,
            .HSEPLLsourceDevisor = self.RCC_PLLsource_Clock_Source_FROM_HSE,
            .PRESCALERUSB = self.PRESCALERUSB,
            .SysClkSource = self.SYSCLKSourceVirtual,
            .RTCClkSource = self.RTCClockSelection,
            .MCOMult = self.RCC_MCOSource,
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
            .USART2Mult = self.Usart2ClockSelection,
            .USART3Mult = self.Usart3ClockSelection,
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
    const this = @This();

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
    I2S_CKIN: ClockNode,
    I2SSrc: ClockNode,
    I2SClocksOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1Output: ClockNode,
    USART2Mult: ClockNode,
    USART2Output: ClockNode,
    USART3Mult: ClockNode,
    USART3Output: ClockNode,
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

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSIRCDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const HSIRCDiv: ClockNode = .{
            .name = "HSIRCDiv",
            .Nodetype = HSIRCDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const FLITFCLKoutputval = ClockNodeTypes{ .output = null };
        const FLITFCLKoutput: ClockNode = .{
            .name = "FLITFCLKoutput",
            .Nodetype = FLITFCLKoutputval,
            .parents = &[_]*const ClockNode{&HSIRC},
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
        const HSEPLLsourceDevisorval = ClockNodeTypes{ .div = .{ .value = config.HSEPLLsourceDevisor.get() } };
        const HSEPLLsourceDevisor: ClockNode = .{
            .name = "HSEPLLsourceDevisor",
            .Nodetype = HSEPLLsourceDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRCDiv,
                &HSEPLLsourceDevisor,
            },
        };
        const VCO2outputval = ClockNodeTypes{ .output = null };
        const VCO2output: ClockNode = .{
            .name = "VCO2output",
            .Nodetype = VCO2outputval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLMULval = ClockNodeTypes{ .mul = .{ .value = config.PLLMUL.get() } };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = PLLMULval,
            .parents = &[_]*const ClockNode{&VCO2output},
        };
        const PRESCALERUSBval = ClockNodeTypes{ .div = .{ .value = config.PRESCALERUSB.get() } };
        const PRESCALERUSB: ClockNode = .{
            .name = "PRESCALERUSB",
            .Nodetype = PRESCALERUSBval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = 48120000, .min = 47880000 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&PRESCALERUSB},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &PLLMUL,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 72000000, .min = 0 },
        };
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
        const MCOMultDivisorval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
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
                &HSIRC,
                &LSEOSC,
                &HSEOSC,
                &MCOMultDivisor,
                &LSIRC,
                &SysCLKOutput,
            },
        };
        const MCOoutputval = ClockNodeTypes{ .output = null };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .Nodetype = MCOoutputval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 72000000, .min = 0 },
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
        const CortexPrescalerval = ClockNodeTypes{ .div = .{ .value = config.CortexPrescaler.get() } };
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
        const ADC12PRESval = ClockNodeTypes{ .div = .{ .value = config.ADC12PRES.get() } };
        const ADC12PRES: ClockNode = .{
            .name = "ADC12PRES",
            .Nodetype = ADC12PRESval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC12outputval = ClockNodeTypes{ .output = null };
        const ADC12output: ClockNode = .{
            .name = "ADC12output",
            .Nodetype = ADC12outputval,
            .parents = &[_]*const ClockNode{&ADC12PRES},
        };
        const ADC34PRESval = ClockNodeTypes{ .div = .{ .value = config.ADC34PRES.get() } };
        const ADC34PRES: ClockNode = .{
            .name = "ADC34PRES",
            .Nodetype = ADC34PRESval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC34outputval = ClockNodeTypes{ .output = null };
        const ADC34output: ClockNode = .{
            .name = "ADC34output",
            .Nodetype = ADC34outputval,
            .parents = &[_]*const ClockNode{&ADC34PRES},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB1Prescaler.get() } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 36000000, .min = 0 },
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
        const APB2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB2Prescaler.get() } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 72000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
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
            .Nodetype = TimPrescalerAPB2val,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2val = ClockNodeTypes{ .output = null };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const TIMMULval = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        const TIMMUL: ClockNode = .{
            .name = "TIMMUL",
            .Nodetype = TIMMULval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const TIMMUX1val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX1) };
        const TIMMUX1: ClockNode = .{
            .name = "TIMMUX1",
            .Nodetype = TIMMUX1val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM1outval = ClockNodeTypes{ .output = null };
        const TIM1out: ClockNode = .{
            .name = "TIM1out",
            .Nodetype = TIM1outval,
            .parents = &[_]*const ClockNode{&TIMMUX1},
        };
        const TIMMUX8val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX8) };
        const TIMMUX8: ClockNode = .{
            .name = "TIMMUX8",
            .Nodetype = TIMMUX8val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM8outval = ClockNodeTypes{ .output = null };
        const TIM8out: ClockNode = .{
            .name = "TIM8out",
            .Nodetype = TIM8outval,
            .parents = &[_]*const ClockNode{&TIMMUX8},
        };
        const HRTIMMuxval = ClockNodeTypes{ .multi = @intFromEnum(config.HRTIMMux) };
        const HRTIMMux: ClockNode = .{
            .name = "HRTIMMux",
            .Nodetype = HRTIMMuxval,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const HRTIMoutval = ClockNodeTypes{ .output = null };
        const HRTIMout: ClockNode = .{
            .name = "HRTIMout",
            .Nodetype = HRTIMoutval,
            .parents = &[_]*const ClockNode{&HRTIMMux},
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
        const I2C2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C2Mult) };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .Nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C2Outputval = ClockNodeTypes{ .output = null };
        const I2C2Output: ClockNode = .{
            .name = "I2C2Output",
            .Nodetype = I2C2Outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C3Mult) };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C3Outputval = ClockNodeTypes{ .output = null };
        const I2C3Output: ClockNode = .{
            .name = "I2C3Output",
            .Nodetype = I2C3Outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
        };
        const I2SSrcval = ClockNodeTypes{ .multi = @intFromEnum(config.I2SSrc) };
        const I2SSrc: ClockNode = .{
            .name = "I2SSrc",
            .Nodetype = I2SSrcval,

            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &SysCLKOutput,
            },
        };
        const I2SClocksOutputval = ClockNodeTypes{ .output = null };
        const I2SClocksOutput: ClockNode = .{
            .name = "I2SClocksOutput",
            .Nodetype = I2SClocksOutputval,
            .parents = &[_]*const ClockNode{&I2SSrc},
        };
        const USART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART1Mult) };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB2Prescaler,
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
        const UART4Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART4Mult) };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",
            .Nodetype = UART4Multval,

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
            .Nodetype = UART4Outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART5Mult) };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",
            .Nodetype = UART5Multval,

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
            .Nodetype = UART5Outputval,
            .parents = &[_]*const ClockNode{&UART5Mult},
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
            .source = .{
                .value = config.HSICalibrationValue.get(),
                .limit = .{ .max = 31, .min = 0 },
            },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
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
            .I2S_CKIN = I2S_CKIN,
            .I2SSrc = I2SSrc,
            .I2SClocksOutput = I2SClocksOutput,
            .USART1Mult = USART1Mult,
            .USART1Output = USART1Output,
            .USART2Mult = USART2Mult,
            .USART2Output = USART2Output,
            .USART3Mult = USART3Mult,
            .USART3Output = USART3Output,
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

    pub fn validate(comptime self: *const this) void {
        _ = self.USBoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.ADC12output.get_comptime();
        _ = self.ADC34output.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.TIM1out.get_comptime();
        _ = self.TIM8out.get_comptime();
        _ = self.HRTIMout.get_comptime();
        _ = self.I2C1Output.get_comptime();
        _ = self.I2C2Output.get_comptime();
        _ = self.I2C3Output.get_comptime();
        _ = self.I2SClocksOutput.get_comptime();
        _ = self.USART1Output.get_comptime();
        _ = self.USART2Output.get_comptime();
        _ = self.USART3Output.get_comptime();
        _ = self.UART4Output.get_comptime();
        _ = self.UART5Output.get_comptime();
    }
};
