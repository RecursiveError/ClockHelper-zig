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
pub const LSI_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSIDIVConf = enum {
    RCC_LSI_DIV1,
    RCC_LSI_DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_LSI_DIV128 => 128,
            .RCC_LSI_DIV1 => 1,
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
pub const MSIKSourceConf = enum {
    RCC_MSI_RC0,
    RCC_MSI_RC1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSI_RC1 => 24,
            .RCC_MSI_RC0 => 96,
        };
    }
};
pub const MSISSourceConf = enum {
    RCC_MSI_RC0,
    RCC_MSI_RC1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSI_RC1 => 24,
            .RCC_MSI_RC0 => 96,
        };
    }
};
pub const MSIKDIVConf = enum {
    RCC_MSI_DIV1,
    RCC_MSI_DIV2,
    RCC_MSI_DIV4,
    RCC_MSI_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSI_DIV2 => 2,
            .RCC_MSI_DIV8 => 8,
            .RCC_MSI_DIV1 => 1,
            .RCC_MSI_DIV4 => 4,
        };
    }
};
pub const MSISDIVConf = enum {
    RCC_MSI_DIV1,
    RCC_MSI_DIV2,
    RCC_MSI_DIV4,
    RCC_MSI_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSI_DIV2 => 2,
            .RCC_MSI_DIV8 => 8,
            .RCC_MSI_DIV1 => 1,
            .RCC_MSI_DIV4 => 4,
        };
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_MSIS,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI1CLockSelectionConf = enum {
    RCC_SPI1CLKSOURCE_PCLK2,
    RCC_SPI1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI3CLockSelectionConf = enum {
    RCC_SPI3CLKSOURCE_PCLK1,
    RCC_SPI3CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI2CLockSelectionConf = enum {
    RCC_SPI2CLKSOURCE_PCLK1,
    RCC_SPI2CLKSOURCE_MSIK,

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
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART3CLockSelectionConf = enum {
    RCC_USART3CLKSOURCE_PCLK1,
    RCC_USART3CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART4CLockSelectionConf = enum {
    RCC_UART4CLKSOURCE_PCLK1,
    RCC_UART4CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCDACCLKSOURCE_HCLK,
    RCC_ADCDACCLKSOURCE_HSE,
    RCC_ADCDACCLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADC_DIVConf = enum {
    RCC_ADCDACCLK_DIV1,
    RCC_ADCDACCLK_DIV2,
    RCC_ADCDACCLK_DIV4,
    RCC_ADCDACCLK_DIV8,
    RCC_ADCDACCLK_DIV16,
    RCC_ADCDACCLK_DIV32,
    RCC_ADCDACCLK_DIV64,
    RCC_ADCDACCLK_DIV128,
    RCC_ADCDACCLK_DIV256,
    RCC_ADCDACCLK_DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_ADCDACCLK_DIV1 => 1,
            .RCC_ADCDACCLK_DIV2 => 2,
            .RCC_ADCDACCLK_DIV4 => 4,
            .RCC_ADCDACCLK_DIV32 => 32,
            .RCC_ADCDACCLK_DIV128 => 128,
            .RCC_ADCDACCLK_DIV16 => 16,
            .RCC_ADCDACCLK_DIV256 => 256,
            .RCC_ADCDACCLK_DIV512 => 512,
            .RCC_ADCDACCLK_DIV64 => 64,
            .RCC_ADCDACCLK_DIV8 => 8,
        };
    }
};
pub const UART5CLockSelectionConf = enum {
    RCC_UART5CLKSOURCE_PCLK1,
    RCC_UART5CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK3,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,
    RCC_LPUART1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_MSIK,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK1,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_HSI,
    RCC_LPTIM2CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DACCLockSelectionConf = enum {
    RCC_DAC1SHCLKSOURCE_LSE,
    RCC_DAC1SHCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ICLKCLockSelectionConf = enum {
    RCC_ICLKCLKSOURCE_SYSCLK,
    RCC_ICLKCLKSOURCE_MSIK,
    RCC_ICLKCLKSOURCE_HSE,
    RCC_ICLKCLKSOURCE_HSI48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USB_DIVConf = enum {
    RCC_USB1CLKSOURCE_ICLK,
    RCC_USB1CLKSOURCE_ICLK_DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_USB1CLKSOURCE_ICLK_DIV2 => 2,
            .RCC_USB1CLKSOURCE_ICLK => 1,
        };
    }
};
pub const FDCANClockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_SYSCLK,
    RCC_FDCANCLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I3C1CLockSelectionConf = enum {
    RCC_I3C1CLKSOURCE_PCLK1,
    RCC_I3C1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I3C2CLockSelectionConf = enum {
    RCC_I3C2CLKSOURCE_PCLK2,
    RCC_I3C2CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C3CLockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK3,
    RCC_I2C3CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_MSIK,
    RCC_SAI1CLKSOURCE_PIN,
    RCC_SAI1CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const AdfClockSelectionConf = enum {
    RCC_ADF1CLKSOURCE_HCLK,
    RCC_ADF1CLKSOURCE_PIN,
    RCC_ADF1CLKSOURCE_MSIK,
    RCC_ADF1CLKSOURCE_SAI1K,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OCTOSPIMCLockSelectionConf = enum {
    RCC_OCTOSPICLKSOURCE_SYSCLK,
    RCC_OCTOSPICLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM3CLockSelectionConf = enum {
    RCC_LPTIM34CLKSOURCE_MSIK,
    RCC_LPTIM34CLKSOURCE_LSI,
    RCC_LPTIM34CLKSOURCE_HSI,
    RCC_LPTIM34CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RNGCLockSelectionConf = enum {
    RCC_RNGCLKSOURCE_HSI48,
    RCC_RNGCLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_MSIS,
    RCC_MCO1SOURCE_HSI48,
    RCC_MCO1SOURCE_MSIK,

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
pub const RCC_MCO2SourceConf = enum {
    RCC_MCO2SOURCE_LSE,
    RCC_MCO2SOURCE_LSI,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_HSI,
    RCC_MCO2SOURCE_SYSCLK,
    RCC_MCO2SOURCE_MSIS,
    RCC_MCO2SOURCE_HSI48,
    RCC_MCO2SOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO2DivConf = enum {
    RCC_MCO2DIV_1,
    RCC_MCO2DIV_2,
    RCC_MCO2DIV_4,
    RCC_MCO2DIV_8,
    RCC_MCO2DIV_16,
    RCC_MCO2DIV_32,
    RCC_MCO2DIV_64,
    RCC_MCO2DIV_128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCO2DIV_1 => 1,
            .RCC_MCO2DIV_8 => 8,
            .RCC_MCO2DIV_32 => 32,
            .RCC_MCO2DIV_16 => 16,
            .RCC_MCO2DIV_2 => 2,
            .RCC_MCO2DIV_64 => 64,
            .RCC_MCO2DIV_4 => 4,
            .RCC_MCO2DIV_128 => 128,
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
    @"8",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"8" => 8,
        };
    }
};
pub const CortexCLockSelectionConf = enum {
    RCC_SYSTICKCLKSOURCE_HCLK_DIV8,
    RCC_SYSTICKCLKSOURCE_LSE,
    RCC_SYSTICKCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
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
pub const APB3CLKDividerConf = enum {
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
pub const MSIAutoCalibrationConf = enum {
    PLLMODE_MSIS,
    PLLMODE_MSIK,
    DISABLED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .PLLMODE_MSIS => 0,
            .DISABLED => 0,
            .PLLMODE_MSIK => 0,
        };
    }
};
pub const MSIAutoCalibrationArgConf = enum {
    true,
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .true => 0,
            .null => 0,
        };
    }
};
pub const MSIPLLFASTConf = enum {
    true,
    false,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .false => 1,
            .true => 0,
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
    HSEOSC: ?HSE_VALUEConf = null,
    LSIRC: ?LSI_VALUEConf = null,
    LSIDIV: ?LSIDIVConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    MSIKSource: ?MSIKSourceConf = null,
    MSISSource: ?MSISSourceConf = null,
    MSIKDIV: ?MSIKDIVConf = null,
    MSISDIV: ?MSISDIVConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    SPI1Mult: ?SPI1CLockSelectionConf = null,
    SPI3Mult: ?SPI3CLockSelectionConf = null,
    SPI2Mult: ?SPI2CLockSelectionConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    USART1Mult: ?USART1CLockSelectionConf = null,
    USART3Mult: ?USART3CLockSelectionConf = null,
    UART4Mult: ?UART4CLockSelectionConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    ADCDiv: ?ADC_DIVConf = null,
    UART5Mult: ?UART5CLockSelectionConf = null,
    LPUART1Mult: ?LPUART1CLockSelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionConf = null,
    LPTIM2Mult: ?LPTIM2CLockSelectionConf = null,
    DACMult: ?DACCLockSelectionConf = null,
    ICLKMult: ?ICLKCLockSelectionConf = null,
    USBDiv: ?USB_DIVConf = null,
    FDCANMult: ?FDCANClockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    I3C1Mult: ?I3C1CLockSelectionConf = null,
    I3C2Mult: ?I3C2CLockSelectionConf = null,
    I2C2Mult: ?I2C2CLockSelectionConf = null,
    I2C3Mult: ?I2C3CLockSelectionConf = null,
    SAI1Mult: ?SAI1CLockSelectionConf = null,
    ADF1Mult: ?AdfClockSelectionConf = null,
    OCTOSPIMMult: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3Mult: ?LPTIM3CLockSelectionConf = null,
    RNGMult: ?RNGCLockSelectionConf = null,
    MCOMult: ?RCC_MCO1SourceConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCO2DivConf = null,
    LSCOMult: ?LSCOSource1Conf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    CortexCLockSelection: ?CortexCLockSelectionConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    APB3Prescaler: ?APB3CLKDividerConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSIAutoCalibration: ?MSIAutoCalibrationConf = null,
    MSIAutoCalibrationArg: ?MSIAutoCalibrationArgConf = null,
    MSIPLLFAST: ?MSIPLLFASTConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSI_VALUE: ?LSI_VALUEConf = null,
    LSIDIV: ?LSIDIVConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    MSIKSource: ?MSIKSourceConf = null,
    MSISSource: ?MSISSourceConf = null,
    MSIKDIV: ?MSIKDIVConf = null,
    MSISDIV: ?MSISDIVConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    SPI1CLockSelection: ?SPI1CLockSelectionConf = null,
    SPI3CLockSelection: ?SPI3CLockSelectionConf = null,
    SPI2CLockSelection: ?SPI2CLockSelectionConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    USART1CLockSelection: ?USART1CLockSelectionConf = null,
    USART3CLockSelection: ?USART3CLockSelectionConf = null,
    UART4CLockSelection: ?UART4CLockSelectionConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    ADC_DIV: ?ADC_DIVConf = null,
    UART5CLockSelection: ?UART5CLockSelectionConf = null,
    LPUART1CLockSelection: ?LPUART1CLockSelectionConf = null,
    LPTIM1CLockSelection: ?LPTIM1CLockSelectionConf = null,
    LPTIM2CLockSelection: ?LPTIM2CLockSelectionConf = null,
    DACCLockSelection: ?DACCLockSelectionConf = null,
    ICLKCLockSelection: ?ICLKCLockSelectionConf = null,
    USB_DIV: ?USB_DIVConf = null,
    FDCANClockSelection: ?FDCANClockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    I3C1CLockSelection: ?I3C1CLockSelectionConf = null,
    I3C2CLockSelection: ?I3C2CLockSelectionConf = null,
    I2C2CLockSelection: ?I2C2CLockSelectionConf = null,
    I2C3CLockSelection: ?I2C3CLockSelectionConf = null,
    SAI1CLockSelection: ?SAI1CLockSelectionConf = null,
    AdfClockSelection: ?AdfClockSelectionConf = null,
    OCTOSPIMCLockSelection: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3CLockSelection: ?LPTIM3CLockSelectionConf = null,
    RNGCLockSelection: ?RNGCLockSelectionConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCO2Div: ?RCC_MCO2DivConf = null,
    LSCOSource1: ?LSCOSource1Conf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    CortexCLockSelection: ?CortexCLockSelectionConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    APB3CLKDivider: ?APB3CLKDividerConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSIAutoCalibration: ?MSIAutoCalibrationConf = null,
    MSIAutoCalibrationArg: ?MSIAutoCalibrationArgConf = null,
    MSIPLLFAST: ?MSIPLLFASTConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSIRC = self.LSI_VALUE,
            .LSIDIV = self.LSIDIV,
            .LSEOSC = self.LSE_VALUE,
            .MSIKSource = self.MSIKSource,
            .MSISSource = self.MSISSource,
            .MSIKDIV = self.MSIKDIV,
            .MSISDIV = self.MSISDIV,
            .SysClkSource = self.SYSCLKSource,
            .SPI1Mult = self.SPI1CLockSelection,
            .SPI3Mult = self.SPI3CLockSelection,
            .SPI2Mult = self.SPI2CLockSelection,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .USART3Mult = self.USART3CLockSelection,
            .UART4Mult = self.UART4CLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .ADCDiv = self.ADC_DIV,
            .UART5Mult = self.UART5CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .DACMult = self.DACCLockSelection,
            .ICLKMult = self.ICLKCLockSelection,
            .USBDiv = self.USB_DIV,
            .FDCANMult = self.FDCANClockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I3C1Mult = self.I3C1CLockSelection,
            .I3C2Mult = self.I3C2CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .ADF1Mult = self.AdfClockSelection,
            .OCTOSPIMMult = self.OCTOSPIMCLockSelection,
            .LPTIM3Mult = self.LPTIM3CLockSelection,
            .RNGMult = self.RNGCLockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCO2Div,
            .LSCOMult = self.LSCOSource1,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .CortexCLockSelection = self.CortexCLockSelection,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .APB3Prescaler = self.APB3CLKDivider,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSIAutoCalibration = self.MSIAutoCalibration,
            .MSIAutoCalibrationArg = self.MSIAutoCalibrationArg,
            .MSIPLLFAST = self.MSIPLLFAST,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const Self = @This();

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
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSIAutoCalibration: ClockNodeTypes,
    MSIAutoCalibrationArg: ClockNodeTypes,
    MSIPLLFAST: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init(comptime config: Config) Self {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .nodetype = HSIRCval,
        };
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .nodetype = HSI48RCval,
        };
        const CRSCLKoutputval = ClockNodeTypes{ .output = null };
        const CRSCLKoutput: ClockNode = .{
            .name = "CRSCLKoutput",
            .nodetype = CRSCLKoutputval,
            .parents = &[_]*const ClockNode{&HSI48RC},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 16000000,
                .limit = .{ .max = @min(1_000_000_000, 50000000), .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSIRC) |val| val.get() else 32000,
                .limit = .{ .max = @min(1_000_000_000, 32600), .min = 31400 },
            },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .nodetype = LSIRCval,
        };
        const LSIDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.LSIDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const LSIDIV: ClockNode = .{
            .name = "LSIDIV",
            .nodetype = LSIDIVval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 40000), .min = 5000 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .nodetype = LSEOSCval,
        };
        const MSIKSourceval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIKSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 96;
                }
            },
        } };
        const MSIKSource: ClockNode = .{
            .name = "MSIKSource",
            .nodetype = MSIKSourceval,
        };
        const MSISSourceval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSISSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 96;
                }
            },
        } };
        const MSISSource: ClockNode = .{
            .name = "MSISSource",
            .nodetype = MSISSourceval,
        };
        const MSIKDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MSIKDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MSIKDIV: ClockNode = .{
            .name = "MSIKDIV",
            .nodetype = MSIKDIVval,
            .parents = &[_]*const ClockNode{&MSIKSource},
        };
        const MSISDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MSISDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        const MSISDIV: ClockNode = .{
            .name = "MSISDIV",
            .nodetype = MSISDIVval,
            .parents = &[_]*const ClockNode{&MSISSource},
        };
        const MSISOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const MSISOutput: ClockNode = .{
            .name = "MSISOutput",
            .nodetype = MSISOutputval,
            .parents = &[_]*const ClockNode{&MSISDIV},
        };
        const SAI1_EXTval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .nodetype = SAI1_EXTval,
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
                &MSISOutput,
                &HSIRC,
                &HSEOSC,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .nodetype = SysCLKOutputval,
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
            .nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
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
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",
            .nodetype = SPI1Multval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &MSIKDIV,
            },
        };
        const SPI1outputval = ClockNodeTypes{ .output = null };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .nodetype = SPI1outputval,
            .parents = &[_]*const ClockNode{&SPI1Mult},
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
        const SPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",
            .nodetype = SPI3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const SPI3outputval = ClockNodeTypes{ .output = null };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .nodetype = SPI3outputval,
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const SPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",
            .nodetype = SPI2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const SPI2outputval = ClockNodeTypes{ .output = null };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .nodetype = SPI2outputval,
            .parents = &[_]*const ClockNode{&SPI2Mult},
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
                &LSIDIV,
            },
        };
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1562500), .min = 0 },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIDIV},
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
                &APB2Prescaler,
                &HSIRC,
            },
        };
        const USART1outputval = ClockNodeTypes{ .output = null };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",
            .nodetype = USART3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRC,
            },
        };
        const USART3outputval = ClockNodeTypes{ .output = null };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .nodetype = USART3outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const UART4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",
            .nodetype = UART4Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRC,
            },
        };
        const UART4outputval = ClockNodeTypes{ .output = null };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .nodetype = UART4outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
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
            .nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &HSEOSC,
                &MSIKDIV,
            },
        };
        const ADCDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADCDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const ADCDiv: ClockNode = .{
            .name = "ADCDiv",
            .nodetype = ADCDivval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const ADCoutputval = ClockNodeTypes{ .output = null };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCDiv},
        };
        const UART5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",
            .nodetype = UART5Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &HSIRC,
            },
        };
        const UART5outputval = ClockNodeTypes{ .output = null };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .nodetype = UART5outputval,
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const APB3Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB3Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB3Prescaler: ClockNode = .{
            .name = "APB3Prescaler",
            .nodetype = APB3Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB3Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .nodetype = APB3Outputval,
            .parents = &[_]*const ClockNode{&APB3Prescaler},
        };
        const LPUART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",
            .nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &HSIRC,
                &LSEOSC,
                &MSIKDIV,
            },
        };
        const LPUART1outputval = ClockNodeTypes{ .output = null };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .nodetype = LPUART1outputval,
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &MSIKDIV,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .nodetype = LPTIM2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM2outputval = ClockNodeTypes{ .output = null };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const DACMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DACMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const DACMult: ClockNode = .{
            .name = "DACMult",
            .nodetype = DACMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIDIV,
            },
        };
        const DACoutputval = ClockNodeTypes{ .output = null };
        const DACoutput: ClockNode = .{
            .name = "DACoutput",
            .nodetype = DACoutputval,
            .parents = &[_]*const ClockNode{&DACMult},
        };
        const ICLKMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ICLKMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ICLKMult: ClockNode = .{
            .name = "ICLKMult",
            .nodetype = ICLKMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &MSIKDIV,
                &HSEOSC,
                &HSI48RC,
            },
        };
        const SDMMC1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 55000000), .min = 0 },
        };
        const SDMMC1Output: ClockNode = .{
            .name = "SDMMC1Output",
            .nodetype = SDMMC1Outputval,
            .parents = &[_]*const ClockNode{&ICLKMult},
        };
        const USBDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.USBDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const USBDiv: ClockNode = .{
            .name = "USBDiv",
            .nodetype = USBDivval,
            .parents = &[_]*const ClockNode{&ICLKMult},
        };
        const USBoutputval = ClockNodeTypes{ .output = null };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&USBDiv},
        };
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",
            .nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &MSIKDIV,
            },
        };
        const FDCANOutputval = ClockNodeTypes{ .output = null };
        const FDCANOutput: ClockNode = .{
            .name = "FDCANOutput",
            .nodetype = FDCANOutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
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
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .nodetype = I2C1outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I3C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I3C1Mult: ClockNode = .{
            .name = "I3C1Mult",
            .nodetype = I3C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const I3C1outputval = ClockNodeTypes{ .output = null };
        const I3C1output: ClockNode = .{
            .name = "I3C1output",
            .nodetype = I3C1outputval,
            .parents = &[_]*const ClockNode{&I3C1Mult},
        };
        const I3C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I3C2Mult: ClockNode = .{
            .name = "I3C2Mult",
            .nodetype = I3C2Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &MSIKDIV,
            },
        };
        const I3C2outputval = ClockNodeTypes{ .output = null };
        const I3C2output: ClockNode = .{
            .name = "I3C2output",
            .nodetype = I3C2outputval,
            .parents = &[_]*const ClockNode{&I3C2Mult},
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
                &APB1Prescaler,
                &MSIKDIV,
            },
        };
        const I2C2outputval = ClockNodeTypes{ .output = null };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .nodetype = I2C2outputval,
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
                &APB3Output,
                &MSIKDIV,
            },
        };
        const I2C3outputval = ClockNodeTypes{ .output = null };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .nodetype = I2C3outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const SAI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",
            .nodetype = SAI1Multval,

            .parents = &[_]*const ClockNode{
                &MSIKDIV,
                &SAI1_EXT,
                &HSEOSC,
            },
        };
        const SAI1outputval = ClockNodeTypes{ .output = null };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const ADF1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADF1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ADF1Mult: ClockNode = .{
            .name = "ADF1Mult",
            .nodetype = ADF1Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &SAI1_EXT,
                &MSIKDIV,
                &SAI1output,
            },
        };
        const ADF1outputval = ClockNodeTypes{ .output = null };
        const ADF1output: ClockNode = .{
            .name = "ADF1output",
            .nodetype = ADF1outputval,
            .parents = &[_]*const ClockNode{&ADF1Mult},
        };
        const OCTOSPIMMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.OCTOSPIMMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const OCTOSPIMMult: ClockNode = .{
            .name = "OCTOSPIMMult",
            .nodetype = OCTOSPIMMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &MSIKDIV,
            },
        };
        const OCTOSPIMoutputval = ClockNodeTypes{ .output = null };
        const OCTOSPIMoutput: ClockNode = .{
            .name = "OCTOSPIMoutput",
            .nodetype = OCTOSPIMoutputval,
            .parents = &[_]*const ClockNode{&OCTOSPIMMult},
        };
        const LPTIM3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM3Mult: ClockNode = .{
            .name = "LPTIM3Mult",
            .nodetype = LPTIM3Multval,

            .parents = &[_]*const ClockNode{
                &MSIKDIV,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM3outputval = ClockNodeTypes{ .output = null };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .nodetype = LPTIM3outputval,
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const RNGMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.RNGMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",
            .nodetype = RNGMultval,

            .parents = &[_]*const ClockNode{
                &HSI48RC,
                &MSIKDIV,
            },
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .nodetype = MCOMultval,

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
            .nodetype = MCODivval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPinval = ClockNodeTypes{ .output = null };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .nodetype = MCOPinval,
            .parents = &[_]*const ClockNode{&MCODiv},
        };
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .nodetype = MCO2Multval,

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
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
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
            .nodetype = LSCOMultval,

            .parents = &[_]*const ClockNode{
                &LSIDIV,
                &LSEOSC,
            },
        };
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .nodetype = LSCOOutputval,
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const HCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexCLockSelectionval = ClockNodeTypes{
            .multi = inner: {
                if (config.CortexCLockSelection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CortexCLockSelection: ClockNode = .{
            .name = "CortexCLockSelection",
            .nodetype = CortexCLockSelectionval,

            .parents = &[_]*const ClockNode{
                &CortexPrescaler,
                &LSEOSC,
                &LSIDIV,
            },
        };
        const CortexSysOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexCLockSelection},
        };
        const FCLKCortexOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
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
        const TimPrescOut1val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
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
        const TimPrescOut2val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
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
                .limit = .{ .max = @min(1_000_000_000, 127), .min = 0 },
            },
        };
        const MSIAutoCalibrationval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIAutoCalibration) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
        const MSIAutoCalibrationArgval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIAutoCalibrationArg) |val| {
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
        const MSIPLLFASTval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIPLLFAST) |val| {
                    switch (val) {
                        .false,
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
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSIAutoCalibration = MSIAutoCalibrationval,
            .MSIAutoCalibrationArg = MSIAutoCalibrationArgval,
            .MSIPLLFAST = MSIPLLFASTval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.CRSCLKoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSI48RC,
        });
        self.HSI48RC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSIDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIRC,
        });
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.MSIKSource.parents = try alloc.dupe(*const ClockNode, &.{});
        self.MSISSource.parents = try alloc.dupe(*const ClockNode, &.{});
        self.MSIKDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIKSource,
        });
        self.MSISDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSISSource,
        });
        self.MSISOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSISDIV,
        });
        self.SAI1_EXT.parents = try alloc.dupe(*const ClockNode, &.{});
        self.SysClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSISOutput,
            &self.HSIRC,
            &self.HSEOSC,
        });
        self.SysCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysClkSource,
        });
        self.SPI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
            &self.MSIKDIV,
        });
        self.SPI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI1Mult,
        });
        self.SPI3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.MSIKDIV,
        });
        self.SPI3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI3Mult,
        });
        self.SPI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.MSIKDIV,
        });
        self.SPI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI2Mult,
        });
        self.HSERTCDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.RTCClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSERTCDevisor,
            &self.LSEOSC,
            &self.LSIDIV,
        });
        self.RTCOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RTCClkSource,
        });
        self.IWDGOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIDIV,
        });
        self.USART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
            &self.HSIRC,
        });
        self.USART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART1Mult,
        });
        self.USART3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.HSIRC,
        });
        self.USART3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART3Mult,
        });
        self.UART4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.HSIRC,
        });
        self.UART4output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART4Mult,
        });
        self.ADCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.HSEOSC,
            &self.MSIKDIV,
        });
        self.ADCDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCMult,
        });
        self.ADCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCDiv,
        });
        self.UART5Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.HSIRC,
        });
        self.UART5output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART5Mult,
        });
        self.LPUART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB3Output,
            &self.HSIRC,
            &self.LSEOSC,
            &self.MSIKDIV,
        });
        self.LPUART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPUART1Mult,
        });
        self.LPTIM1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIKDIV,
            &self.LSIDIV,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPTIM1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM1Mult,
        });
        self.LPTIM2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.LSIDIV,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPTIM2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM2Mult,
        });
        self.DACMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.LSIDIV,
        });
        self.DACoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DACMult,
        });
        self.ICLKMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.MSIKDIV,
            &self.HSEOSC,
            &self.HSI48RC,
        });
        self.SDMMC1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ICLKMult,
        });
        self.USBDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ICLKMult,
        });
        self.USBoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBDiv,
        });
        self.FDCANMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.MSIKDIV,
        });
        self.FDCANOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FDCANMult,
        });
        self.I2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.MSIKDIV,
        });
        self.I2C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C1Mult,
        });
        self.I3C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.MSIKDIV,
        });
        self.I3C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I3C1Mult,
        });
        self.I3C2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB3Output,
            &self.MSIKDIV,
        });
        self.I3C2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I3C2Mult,
        });
        self.I2C2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.MSIKDIV,
        });
        self.I2C2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C2Mult,
        });
        self.I2C3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB3Output,
            &self.MSIKDIV,
        });
        self.I2C3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C3Mult,
        });
        self.SAI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIKDIV,
            &self.SAI1_EXT,
            &self.HSEOSC,
        });
        self.SAI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAI1Mult,
        });
        self.ADF1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.SAI1_EXT,
            &self.MSIKDIV,
            &self.SAI1output,
        });
        self.ADF1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADF1Mult,
        });
        self.OCTOSPIMMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.MSIKDIV,
        });
        self.OCTOSPIMoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OCTOSPIMMult,
        });
        self.LPTIM3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIKDIV,
            &self.LSIDIV,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPTIM3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM3Mult,
        });
        self.RNGMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSI48RC,
            &self.MSIKDIV,
        });
        self.RNGoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RNGMult,
        });
        self.MCOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.LSIDIV,
            &self.HSEOSC,
            &self.HSIRC,
            &self.SysCLKOutput,
            &self.MSISDIV,
            &self.HSI48RC,
            &self.MSIKDIV,
        });
        self.MCODiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMult,
        });
        self.MCOPin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCODiv,
        });
        self.MCO2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.LSIDIV,
            &self.HSEOSC,
            &self.HSIRC,
            &self.SysCLKOutput,
            &self.MSISDIV,
            &self.HSI48RC,
            &self.MSIKDIV,
        });
        self.MCO2Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Mult,
        });
        self.MCO2Pin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Div,
        });
        self.LSCOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIDIV,
            &self.LSEOSC,
        });
        self.LSCOOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSCOMult,
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
        self.CortexPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.CortexCLockSelection.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CortexPrescaler,
            &self.LSEOSC,
            &self.LSIDIV,
        });
        self.CortexSysOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CortexCLockSelection,
        });
        self.FCLKCortexOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
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
        self.APB3Prescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
        });
        self.APB3Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB3Prescaler,
        });
        self.TimPrescalerAPB2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
        });
        self.TimPrescOut2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TimPrescalerAPB2,
        });
    }
    pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
        alloc.free(self.HSIRC.parents.?);
        alloc.free(self.CRSCLKoutput.parents.?);
        alloc.free(self.HSI48RC.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSIDIV.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.MSIKSource.parents.?);
        alloc.free(self.MSISSource.parents.?);
        alloc.free(self.MSIKDIV.parents.?);
        alloc.free(self.MSISDIV.parents.?);
        alloc.free(self.MSISOutput.parents.?);
        alloc.free(self.SAI1_EXT.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.SPI1Mult.parents.?);
        alloc.free(self.SPI1output.parents.?);
        alloc.free(self.SPI3Mult.parents.?);
        alloc.free(self.SPI3output.parents.?);
        alloc.free(self.SPI2Mult.parents.?);
        alloc.free(self.SPI2output.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.USART1Mult.parents.?);
        alloc.free(self.USART1output.parents.?);
        alloc.free(self.USART3Mult.parents.?);
        alloc.free(self.USART3output.parents.?);
        alloc.free(self.UART4Mult.parents.?);
        alloc.free(self.UART4output.parents.?);
        alloc.free(self.ADCMult.parents.?);
        alloc.free(self.ADCDiv.parents.?);
        alloc.free(self.ADCoutput.parents.?);
        alloc.free(self.UART5Mult.parents.?);
        alloc.free(self.UART5output.parents.?);
        alloc.free(self.LPUART1Mult.parents.?);
        alloc.free(self.LPUART1output.parents.?);
        alloc.free(self.LPTIM1Mult.parents.?);
        alloc.free(self.LPTIM1output.parents.?);
        alloc.free(self.LPTIM2Mult.parents.?);
        alloc.free(self.LPTIM2output.parents.?);
        alloc.free(self.DACMult.parents.?);
        alloc.free(self.DACoutput.parents.?);
        alloc.free(self.ICLKMult.parents.?);
        alloc.free(self.SDMMC1Output.parents.?);
        alloc.free(self.USBDiv.parents.?);
        alloc.free(self.USBoutput.parents.?);
        alloc.free(self.FDCANMult.parents.?);
        alloc.free(self.FDCANOutput.parents.?);
        alloc.free(self.I2C1Mult.parents.?);
        alloc.free(self.I2C1output.parents.?);
        alloc.free(self.I3C1Mult.parents.?);
        alloc.free(self.I3C1output.parents.?);
        alloc.free(self.I3C2Mult.parents.?);
        alloc.free(self.I3C2output.parents.?);
        alloc.free(self.I2C2Mult.parents.?);
        alloc.free(self.I2C2output.parents.?);
        alloc.free(self.I2C3Mult.parents.?);
        alloc.free(self.I2C3output.parents.?);
        alloc.free(self.SAI1Mult.parents.?);
        alloc.free(self.SAI1output.parents.?);
        alloc.free(self.ADF1Mult.parents.?);
        alloc.free(self.ADF1output.parents.?);
        alloc.free(self.OCTOSPIMMult.parents.?);
        alloc.free(self.OCTOSPIMoutput.parents.?);
        alloc.free(self.LPTIM3Mult.parents.?);
        alloc.free(self.LPTIM3output.parents.?);
        alloc.free(self.RNGMult.parents.?);
        alloc.free(self.RNGoutput.parents.?);
        alloc.free(self.MCOMult.parents.?);
        alloc.free(self.MCODiv.parents.?);
        alloc.free(self.MCOPin.parents.?);
        alloc.free(self.MCO2Mult.parents.?);
        alloc.free(self.MCO2Div.parents.?);
        alloc.free(self.MCO2Pin.parents.?);
        alloc.free(self.LSCOMult.parents.?);
        alloc.free(self.LSCOOutput.parents.?);
        alloc.free(self.AHBPrescaler.parents.?);
        alloc.free(self.AHBOutput.parents.?);
        alloc.free(self.HCLKOutput.parents.?);
        alloc.free(self.CortexPrescaler.parents.?);
        alloc.free(self.CortexCLockSelection.parents.?);
        alloc.free(self.CortexSysOutput.parents.?);
        alloc.free(self.FCLKCortexOutput.parents.?);
        alloc.free(self.APB1Prescaler.parents.?);
        alloc.free(self.APB1Output.parents.?);
        alloc.free(self.TimPrescalerAPB1.parents.?);
        alloc.free(self.TimPrescOut1.parents.?);
        alloc.free(self.APB2Prescaler.parents.?);
        alloc.free(self.APB2Output.parents.?);
        alloc.free(self.APB3Prescaler.parents.?);
        alloc.free(self.APB3Output.parents.?);
        alloc.free(self.TimPrescalerAPB2.parents.?);
        alloc.free(self.TimPrescOut2.parents.?);
    }
    pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        self.HSIRC.nodetype = HSIRCval;
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        self.HSI48RC.nodetype = HSI48RCval;
        const CRSCLKoutputval = ClockNodeTypes{ .output = null };
        self.CRSCLKoutput.nodetype = CRSCLKoutputval;
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 16000000,
                .limit = .{ .max = @min(1_000_000_000, 50000000), .min = 4000000 },
            },
        };
        self.HSEOSC.nodetype = HSEOSCval;
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSIRC) |val| val.get() else 32000,
                .limit = .{ .max = @min(1_000_000_000, 32600), .min = 31400 },
            },
        };
        self.LSIRC.nodetype = LSIRCval;
        const LSIDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.LSIDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.LSIDIV.nodetype = LSIDIVval;
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 40000), .min = 5000 },
            },
        };
        self.LSEOSC.nodetype = LSEOSCval;
        const MSIKSourceval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIKSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 96;
                }
            },
        } };
        self.MSIKSource.nodetype = MSIKSourceval;
        const MSISSourceval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSISSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 96;
                }
            },
        } };
        self.MSISSource.nodetype = MSISSourceval;
        const MSIKDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MSIKDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MSIKDIV.nodetype = MSIKDIVval;
        const MSISDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MSISDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        self.MSISDIV.nodetype = MSISDIVval;
        const MSISOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.MSISOutput.nodetype = MSISOutputval;
        const SAI1_EXTval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        self.SAI1_EXT.nodetype = SAI1_EXTval;
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
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.SysCLKOutput.nodetype = SysCLKOutputval;
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
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.AHBOutput.nodetype = AHBOutputval;
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
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI1Mult.nodetype = SPI1Multval;
        const SPI1outputval = ClockNodeTypes{ .output = null };
        self.SPI1output.nodetype = SPI1outputval;
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
        const SPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI3Mult.nodetype = SPI3Multval;
        const SPI3outputval = ClockNodeTypes{ .output = null };
        self.SPI3output.nodetype = SPI3outputval;
        const SPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI2Mult.nodetype = SPI2Multval;
        const SPI2outputval = ClockNodeTypes{ .output = null };
        self.SPI2output.nodetype = SPI2outputval;
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
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1562500), .min = 0 },
        };
        self.RTCOutput.nodetype = RTCOutputval;
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        self.IWDGOutput.nodetype = IWDGOutputval;
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
        const USART1outputval = ClockNodeTypes{ .output = null };
        self.USART1output.nodetype = USART1outputval;
        const USART3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART3Mult.nodetype = USART3Multval;
        const USART3outputval = ClockNodeTypes{ .output = null };
        self.USART3output.nodetype = USART3outputval;
        const UART4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.UART4Mult.nodetype = UART4Multval;
        const UART4outputval = ClockNodeTypes{ .output = null };
        self.UART4output.nodetype = UART4outputval;
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ADCMult.nodetype = ADCMultval;
        const ADCDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.ADCDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.ADCDiv.nodetype = ADCDivval;
        const ADCoutputval = ClockNodeTypes{ .output = null };
        self.ADCoutput.nodetype = ADCoutputval;
        const UART5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.UART5Mult.nodetype = UART5Multval;
        const UART5outputval = ClockNodeTypes{ .output = null };
        self.UART5output.nodetype = UART5outputval;
        const APB3Prescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB3Prescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB3Prescaler.nodetype = APB3Prescalerval;
        const APB3Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.APB3Output.nodetype = APB3Outputval;
        const LPUART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPUART1Mult.nodetype = LPUART1Multval;
        const LPUART1outputval = ClockNodeTypes{ .output = null };
        self.LPUART1output.nodetype = LPUART1outputval;
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM1Mult.nodetype = LPTIM1Multval;
        const LPTIM1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.LPTIM1output.nodetype = LPTIM1outputval;
        const LPTIM2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM2Mult.nodetype = LPTIM2Multval;
        const LPTIM2outputval = ClockNodeTypes{ .output = null };
        self.LPTIM2output.nodetype = LPTIM2outputval;
        const DACMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DACMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.DACMult.nodetype = DACMultval;
        const DACoutputval = ClockNodeTypes{ .output = null };
        self.DACoutput.nodetype = DACoutputval;
        const ICLKMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ICLKMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ICLKMult.nodetype = ICLKMultval;
        const SDMMC1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 55000000), .min = 0 },
        };
        self.SDMMC1Output.nodetype = SDMMC1Outputval;
        const USBDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.USBDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.USBDiv.nodetype = USBDivval;
        const USBoutputval = ClockNodeTypes{ .output = null };
        self.USBoutput.nodetype = USBoutputval;
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.FDCANMult.nodetype = FDCANMultval;
        const FDCANOutputval = ClockNodeTypes{ .output = null };
        self.FDCANOutput.nodetype = FDCANOutputval;
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
        const I2C1outputval = ClockNodeTypes{ .output = null };
        self.I2C1output.nodetype = I2C1outputval;
        const I3C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I3C1Mult.nodetype = I3C1Multval;
        const I3C1outputval = ClockNodeTypes{ .output = null };
        self.I3C1output.nodetype = I3C1outputval;
        const I3C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I3C2Mult.nodetype = I3C2Multval;
        const I3C2outputval = ClockNodeTypes{ .output = null };
        self.I3C2output.nodetype = I3C2outputval;
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
        const I2C2outputval = ClockNodeTypes{ .output = null };
        self.I2C2output.nodetype = I2C2outputval;
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
        const I2C3outputval = ClockNodeTypes{ .output = null };
        self.I2C3output.nodetype = I2C3outputval;
        const SAI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SAI1Mult.nodetype = SAI1Multval;
        const SAI1outputval = ClockNodeTypes{ .output = null };
        self.SAI1output.nodetype = SAI1outputval;
        const ADF1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADF1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ADF1Mult.nodetype = ADF1Multval;
        const ADF1outputval = ClockNodeTypes{ .output = null };
        self.ADF1output.nodetype = ADF1outputval;
        const OCTOSPIMMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.OCTOSPIMMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.OCTOSPIMMult.nodetype = OCTOSPIMMultval;
        const OCTOSPIMoutputval = ClockNodeTypes{ .output = null };
        self.OCTOSPIMoutput.nodetype = OCTOSPIMoutputval;
        const LPTIM3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM3Mult.nodetype = LPTIM3Multval;
        const LPTIM3outputval = ClockNodeTypes{ .output = null };
        self.LPTIM3output.nodetype = LPTIM3outputval;
        const RNGMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.RNGMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.RNGMult.nodetype = RNGMultval;
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.RNGoutput.nodetype = RNGoutputval;
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        };
        self.MCOMult.nodetype = MCOMultval;
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCODiv.nodetype = MCODivval;
        const MCOPinval = ClockNodeTypes{ .output = null };
        self.MCOPin.nodetype = MCOPinval;
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        };
        self.MCO2Mult.nodetype = MCO2Multval;
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCO2Div.nodetype = MCO2Divval;
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        self.MCO2Pin.nodetype = MCO2Pinval;
        const LSCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LSCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LSCOMult.nodetype = LSCOMultval;
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        self.LSCOOutput.nodetype = LSCOOutputval;
        const HCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.HCLKOutput.nodetype = HCLKOutputval;
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        self.CortexPrescaler.nodetype = CortexPrescalerval;
        const CortexCLockSelectionval = ClockNodeTypes{
            .multi = inner: {
                if (config.CortexCLockSelection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.CortexCLockSelection.nodetype = CortexCLockSelectionval;
        const CortexSysOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.CortexSysOutput.nodetype = CortexSysOutputval;
        const FCLKCortexOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.FCLKCortexOutput.nodetype = FCLKCortexOutputval;
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
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
        const TimPrescOut1val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.TimPrescOut1.nodetype = TimPrescOut1val;
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
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
        const TimPrescOut2val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 96000000), .min = 0 },
        };
        self.TimPrescOut2.nodetype = TimPrescOut2val;
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
                .limit = .{ .max = @min(1_000_000_000, 127), .min = 0 },
            },
        };
        self.HSICalibrationValue = HSICalibrationValueval;
        const MSIAutoCalibrationval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIAutoCalibration) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        } };
        self.MSIAutoCalibration = MSIAutoCalibrationval;
        const MSIAutoCalibrationArgval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIAutoCalibrationArg) |val| {
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
        self.MSIAutoCalibrationArg = MSIAutoCalibrationArgval;
        const MSIPLLFASTval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIPLLFAST) |val| {
                    switch (val) {
                        .false,
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
        self.MSIPLLFAST = MSIPLLFASTval;
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
