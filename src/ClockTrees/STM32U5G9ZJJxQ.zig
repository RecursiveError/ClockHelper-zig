const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const SAESSourceConf = enum {
    RCC_SAESCLKSOURCE_SHSI,
    RCC_SAESCLKSOURCE_SHSI_DIV2,

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
pub const MSIClockRangeConf = enum {
    RCC_MSIRANGE_0,
    RCC_MSIRANGE_1,
    RCC_MSIRANGE_2,
    RCC_MSIRANGE_3,
    RCC_MSIRANGE_4,
    RCC_MSIRANGE_5,
    RCC_MSIRANGE_6,
    RCC_MSIRANGE_7,
    RCC_MSIRANGE_8,
    RCC_MSIRANGE_9,
    RCC_MSIRANGE_10,
    RCC_MSIRANGE_11,
    RCC_MSIRANGE_12,
    RCC_MSIRANGE_13,
    RCC_MSIRANGE_14,
    RCC_MSIRANGE_15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSIRANGE_15 => 100,
            .RCC_MSIRANGE_7 => 1000,
            .RCC_MSIRANGE_11 => 768,
            .RCC_MSIRANGE_10 => 1024,
            .RCC_MSIRANGE_8 => 3072,
            .RCC_MSIRANGE_3 => 12000,
            .RCC_MSIRANGE_4 => 4000,
            .RCC_MSIRANGE_5 => 2000,
            .RCC_MSIRANGE_9 => 1536,
            .RCC_MSIRANGE_0 => 48000,
            .RCC_MSIRANGE_1 => 24000,
            .RCC_MSIRANGE_12 => 400,
            .RCC_MSIRANGE_13 => 200,
            .RCC_MSIRANGE_6 => 1330,
            .RCC_MSIRANGE_2 => 16000,
            .RCC_MSIRANGE_14 => 133,
        };
    }
};
pub const MSIKClockRangeConf = enum {
    RCC_MSIKRANGE_0,
    RCC_MSIKRANGE_1,
    RCC_MSIKRANGE_2,
    RCC_MSIKRANGE_3,
    RCC_MSIKRANGE_4,
    RCC_MSIKRANGE_5,
    RCC_MSIKRANGE_6,
    RCC_MSIKRANGE_7,
    RCC_MSIKRANGE_8,
    RCC_MSIKRANGE_9,
    RCC_MSIKRANGE_10,
    RCC_MSIKRANGE_11,
    RCC_MSIKRANGE_12,
    RCC_MSIKRANGE_13,
    RCC_MSIKRANGE_14,
    RCC_MSIKRANGE_15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSIKRANGE_1 => 24000,
            .RCC_MSIKRANGE_12 => 400,
            .RCC_MSIKRANGE_15 => 100,
            .RCC_MSIKRANGE_0 => 48000,
            .RCC_MSIKRANGE_9 => 1536,
            .RCC_MSIKRANGE_2 => 16000,
            .RCC_MSIKRANGE_3 => 12000,
            .RCC_MSIKRANGE_8 => 3072,
            .RCC_MSIKRANGE_10 => 1024,
            .RCC_MSIKRANGE_14 => 133,
            .RCC_MSIKRANGE_11 => 768,
            .RCC_MSIKRANGE_13 => 200,
            .RCC_MSIKRANGE_4 => 4000,
            .RCC_MSIKRANGE_6 => 1330,
            .RCC_MSIKRANGE_5 => 2000,
            .RCC_MSIKRANGE_7 => 1000,
        };
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLL2SourceConf = enum {
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLL3SourceConf = enum {
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
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
pub const USART1CLockSelectionVirtualConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART2CLockSelectionVirtualConf = enum {
    RCC_USART2CLKSOURCE_PCLK1,
    RCC_USART2CLKSOURCE_SYSCLK,
    RCC_USART2CLKSOURCE_HSI,
    RCC_USART2CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART6CLockSelectionVirtualConf = enum {
    RCC_USART6CLKSOURCE_PCLK1,
    RCC_USART6CLKSOURCE_SYSCLK,
    RCC_USART6CLKSOURCE_HSI,
    RCC_USART6CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART3CLockSelectionVirtualConf = enum {
    RCC_USART3CLKSOURCE_PCLK1,
    RCC_USART3CLKSOURCE_SYSCLK,
    RCC_USART3CLKSOURCE_HSI,
    RCC_USART3CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART4CLockSelectionVirtualConf = enum {
    RCC_UART4CLKSOURCE_PCLK1,
    RCC_UART4CLKSOURCE_SYSCLK,
    RCC_UART4CLKSOURCE_HSI,
    RCC_UART4CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART5CLockSelectionVirtualConf = enum {
    RCC_UART5CLKSOURCE_PCLK1,
    RCC_UART5CLKSOURCE_SYSCLK,
    RCC_UART5CLKSOURCE_HSI,
    RCC_UART5CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART1CLockSelectionVirtualConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK3,
    RCC_LPUART1CLKSOURCE_SYSCLK,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,
    RCC_LPUART1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const HSPICLockSelectionConf = enum {
    RCC_HSPICLKSOURCE_SYSCLK,
    RCC_HSPICLKSOURCE_PLL1,
    RCC_HSPICLKSOURCE_PLL2,
    RCC_HSPICLKSOURCE_PLL3,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LTDCCLockSelectionConf = enum {
    RCC_LTDCCLKSOURCE_PLL2,
    RCC_LTDCCLKSOURCE_PLL3,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionVirtualConf = enum {
    RCC_LPTIM1CLKSOURCE_MSIK,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM2CLockSelectionVirtualConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK1,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_HSI,
    RCC_LPTIM2CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DACCLockSelectionVirtualConf = enum {
    RCC_DAC1CLKSOURCE_LSE,
    RCC_DAC1CLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCDACCLKSOURCE_HCLK,
    RCC_ADCDACCLKSOURCE_SYSCLK,
    RCC_ADCDACCLKSOURCE_PLL2,
    RCC_ADCDACCLKSOURCE_HSE,
    RCC_ADCDACCLKSOURCE_HSI,
    RCC_ADCDACCLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CK48CLockSelectionConf = enum {
    RCC_CLK48CLKSOURCE_PLL2,
    RCC_CLK48CLKSOURCE_PLL1,
    RCC_CLK48CLKSOURCE_MSIK,
    RCC_CLK48CLKSOURCE_HSI48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SDMMCClockSelectionConf = enum {
    RCC_SDMMCCLKSOURCE_PLL1,
    RCC_SDMMCCLKSOURCE_CLK48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FDCANClockSelectionConf = enum {
    RCC_FDCAN1CLKSOURCE_PLL1,
    RCC_FDCAN1CLKSOURCE_PLL2,
    RCC_FDCAN1CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_SYSCLK,
    RCC_I2C1CLKSOURCE_HSI,
    RCC_I2C1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_SYSCLK,
    RCC_I2C2CLKSOURCE_HSI,
    RCC_I2C2CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C5CLockSelectionConf = enum {
    RCC_I2C5CLKSOURCE_PCLK1,
    RCC_I2C5CLKSOURCE_SYSCLK,
    RCC_I2C5CLKSOURCE_HSI,
    RCC_I2C5CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C6CLockSelectionConf = enum {
    RCC_I2C6CLKSOURCE_PCLK1,
    RCC_I2C6CLKSOURCE_SYSCLK,
    RCC_I2C6CLKSOURCE_HSI,
    RCC_I2C6CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C3CLockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK3,
    RCC_I2C3CLKSOURCE_SYSCLK,
    RCC_I2C3CLKSOURCE_HSI,
    RCC_I2C3CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PLL2,
    RCC_SAI1CLKSOURCE_PLL3,
    RCC_SAI1CLKSOURCE_PLL1,
    RCC_SAI1CLKSOURCE_PIN,
    RCC_SAI1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI2CLockSelectionConf = enum {
    RCC_SAI2CLKSOURCE_PLL2,
    RCC_SAI2CLKSOURCE_PLL3,
    RCC_SAI2CLKSOURCE_PLL1,
    RCC_SAI2CLKSOURCE_PIN,
    RCC_SAI2CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C4CLockSelectionConf = enum {
    RCC_I2C4CLKSOURCE_PCLK1,
    RCC_I2C4CLKSOURCE_SYSCLK,
    RCC_I2C4CLKSOURCE_HSI,
    RCC_I2C4CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const MdfClockSelectionConf = enum {
    RCC_MDF1CLKSOURCE_HCLK,
    RCC_MDF1CLKSOURCE_PLL1,
    RCC_MDF1CLKSOURCE_PLL3,
    RCC_MDF1CLKSOURCE_PIN,
    RCC_MDF1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const AdfClockSelectionConf = enum {
    RCC_ADF1CLKSOURCE_HCLK,
    RCC_ADF1CLKSOURCE_PLL1,
    RCC_ADF1CLKSOURCE_PLL3,
    RCC_ADF1CLKSOURCE_PIN,
    RCC_ADF1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OCTOSPIMCLockSelectionConf = enum {
    RCC_OSPICLKSOURCE_MSIK,
    RCC_OSPICLKSOURCE_SYSCLK,
    RCC_OSPICLKSOURCE_PLL1,
    RCC_OSPICLKSOURCE_PLL2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM3CLockSelectionVirtualConf = enum {
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
    RCC_RNGCLKSOURCE_HSI48_DIV2,
    RCC_RNGCLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceVirtualConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLL1CLK,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_MSI,
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
pub const LSCOSource1VirtualConf = enum {
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
pub const CortexCLockSelectionVirtualConf = enum {
    SYSTICK_CLKSOURCE_HCLK_1_8,
    SYSTICK_CLKSOURCE_LSE,
    SYSTICK_CLKSOURCE_LSI,

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
pub const SPI1CLockSelectionConf = enum {
    RCC_SPI1CLKSOURCE_PCLK2,
    RCC_SPI1CLKSOURCE_SYSCLK,
    RCC_SPI1CLKSOURCE_HSI,
    RCC_SPI1CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI3CLockSelectionConf = enum {
    RCC_SPI3CLKSOURCE_PCLK3,
    RCC_SPI3CLKSOURCE_SYSCLK,
    RCC_SPI3CLKSOURCE_HSI,
    RCC_SPI3CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI2CLockSelectionConf = enum {
    RCC_SPI2CLKSOURCE_PCLK1,
    RCC_SPI2CLKSOURCE_SYSCLK,
    RCC_SPI2CLKSOURCE_HSI,
    RCC_SPI2CLKSOURCE_MSIK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USBPHYCLockSelectionConf = enum {
    RCC_USBPHYCLKSOURCE_HSE,
    RCC_USBPHYCLKSOURCE_HSE_DIV2,
    RCC_USBPHYCLKSOURCE_PLL1,
    RCC_USBPHYCLKSOURCE_PLL1_DIV2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DSICLockSelectionConf = enum {
    RCC_DSICLKSOURCE_PLL3,
    RCC_DSICLKSOURCE_DSIPHY,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DSITX_DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLFRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL1PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL1QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL1RConf = enum {
    @"1",
    @"2",
    @"4",
    @"6",
    @"8",
    @"10",
    @"12",
    @"14",
    @"16",
    @"18",
    @"20",
    @"22",
    @"24",
    @"26",
    @"28",
    @"30",
    @"32",
    @"34",
    @"36",
    @"38",
    @"40",
    @"42",
    @"44",
    @"46",
    @"48",
    @"50",
    @"52",
    @"54",
    @"56",
    @"58",
    @"60",
    @"62",
    @"64",
    @"66",
    @"68",
    @"70",
    @"72",
    @"74",
    @"76",
    @"78",
    @"80",
    @"82",
    @"84",
    @"86",
    @"88",
    @"90",
    @"92",
    @"94",
    @"96",
    @"98",
    @"100",
    @"102",
    @"104",
    @"106",
    @"108",
    @"110",
    @"112",
    @"114",
    @"116",
    @"118",
    @"120",
    @"122",
    @"124",
    @"126",
    @"128",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"66" => 66,
            .@"34" => 34,
            .@"104" => 104,
            .@"114" => 114,
            .@"94" => 94,
            .@"86" => 86,
            .@"124" => 124,
            .@"22" => 22,
            .@"8" => 8,
            .@"24" => 24,
            .@"32" => 32,
            .@"78" => 78,
            .@"82" => 82,
            .@"62" => 62,
            .@"28" => 28,
            .@"12" => 12,
            .@"74" => 74,
            .@"120" => 120,
            .@"6" => 6,
            .@"72" => 72,
            .@"80" => 80,
            .@"64" => 64,
            .@"76" => 76,
            .@"90" => 90,
            .@"26" => 26,
            .@"118" => 118,
            .@"60" => 60,
            .@"36" => 36,
            .@"20" => 20,
            .@"18" => 18,
            .@"100" => 100,
            .@"10" => 10,
            .@"88" => 88,
            .@"38" => 38,
            .@"46" => 46,
            .@"44" => 44,
            .@"84" => 84,
            .@"42" => 42,
            .@"30" => 30,
            .@"2" => 2,
            .@"54" => 54,
            .@"56" => 56,
            .@"110" => 110,
            .@"52" => 52,
            .@"92" => 92,
            .@"98" => 98,
            .@"116" => 116,
            .@"122" => 122,
            .@"48" => 48,
            .@"112" => 112,
            .@"40" => 40,
            .@"16" => 16,
            .@"58" => 58,
            .@"102" => 102,
            .@"128" => 128,
            .@"4" => 4,
            .@"1" => 1,
            .@"68" => 68,
            .@"126" => 126,
            .@"106" => 106,
            .@"14" => 14,
            .@"50" => 50,
            .@"108" => 108,
            .@"96" => 96,
            .@"70" => 70,
        };
    }
};
pub const PLL2NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2FRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3FRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLDSIIDFConf = enum {
    DSI_PLL_IN_DIV1,
    DSI_PLL_IN_DIV2,
    DSI_PLL_IN_DIV3,
    DSI_PLL_IN_DIV4,
    DSI_PLL_IN_DIV5,
    DSI_PLL_IN_DIV6,
    DSI_PLL_IN_DIV7,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DSI_PLL_IN_DIV7 => 7,
            .DSI_PLL_IN_DIV6 => 6,
            .DSI_PLL_IN_DIV5 => 5,
            .DSI_PLL_IN_DIV2 => 2,
            .DSI_PLL_IN_DIV1 => 1,
            .DSI_PLL_IN_DIV3 => 3,
            .DSI_PLL_IN_DIV4 => 4,
        };
    }
};
pub const PLLDSINDIVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLDSIODFConf = enum {
    DSI_PLL_OUT_DIV1,
    DSI_PLL_OUT_DIV2,
    DSI_PLL_OUT_DIV3,
    DSI_PLL_OUT_DIV4,
    DSI_PLL_OUT_DIV5,
    DSI_PLL_OUT_DIV6,
    DSI_PLL_OUT_DIV7,
    DSI_PLL_OUT_DIV8,
    DSI_PLL_OUT_DIV9,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DSI_PLL_OUT_DIV6 => 6,
            .DSI_PLL_OUT_DIV8 => 8,
            .DSI_PLL_OUT_DIV7 => 7,
            .DSI_PLL_OUT_DIV9 => 9,
            .DSI_PLL_OUT_DIV3 => 3,
            .DSI_PLL_OUT_DIV5 => 5,
            .DSI_PLL_OUT_DIV1 => 1,
            .DSI_PLL_OUT_DIV2 => 2,
            .DSI_PLL_OUT_DIV4 => 4,
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
    SAESMult: ?SAESSourceConf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    LSIRC: ?LSI_VALUEConf = null,
    LSIDIV: ?LSIDIVConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    MSIRC: ?MSIClockRangeConf = null,
    MSIKRC: ?MSIKClockRangeConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLL2Source: ?PLL2SourceConf = null,
    PLL3Source: ?PLL3SourceConf = null,
    PLLM: ?PLLMConf = null,
    PLL2M: ?PLL2MConf = null,
    PLL3M: ?PLL3MConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    USART1Mult: ?USART1CLockSelectionVirtualConf = null,
    USART2Mult: ?USART2CLockSelectionVirtualConf = null,
    USART6Mult: ?USART6CLockSelectionVirtualConf = null,
    USART3Mult: ?USART3CLockSelectionVirtualConf = null,
    UART4Mult: ?UART4CLockSelectionVirtualConf = null,
    UART5Mult: ?UART5CLockSelectionVirtualConf = null,
    LPUART1Mult: ?LPUART1CLockSelectionVirtualConf = null,
    HSPIMult: ?HSPICLockSelectionConf = null,
    LTDCMult: ?LTDCCLockSelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionVirtualConf = null,
    LPTIM2Mult: ?LPTIM2CLockSelectionVirtualConf = null,
    DACMult: ?DACCLockSelectionVirtualConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    CK48Mult: ?CK48CLockSelectionConf = null,
    SDMMC1Mult: ?SDMMCClockSelectionConf = null,
    FDCANMult: ?FDCANClockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    I2C2Mult: ?I2C2CLockSelectionConf = null,
    I2C5Mult: ?I2C5CLockSelectionConf = null,
    I2C6Mult: ?I2C6CLockSelectionConf = null,
    I2C3Mult: ?I2C3CLockSelectionConf = null,
    SAI1Mult: ?SAI1CLockSelectionConf = null,
    SAI2Mult: ?SAI2CLockSelectionConf = null,
    I2C4Mult: ?I2C4CLockSelectionConf = null,
    MDF1Mult: ?MdfClockSelectionConf = null,
    ADF1Mult: ?AdfClockSelectionConf = null,
    OCTOSPIMMult: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3Mult: ?LPTIM3CLockSelectionVirtualConf = null,
    RNGMult: ?RNGCLockSelectionConf = null,
    MCOMult: ?RCC_MCO1SourceVirtualConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    LSCOMult: ?LSCOSource1VirtualConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    CortexCLockSelection: ?CortexCLockSelectionVirtualConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    APB3Prescaler: ?APB3CLKDividerConf = null,
    SPI1Mult: ?SPI1CLockSelectionConf = null,
    SPI3Mult: ?SPI3CLockSelectionConf = null,
    SPI2Mult: ?SPI2CLockSelectionConf = null,
    USBPHYMult: ?USBPHYCLockSelectionConf = null,
    DSIMult: ?DSICLockSelectionConf = null,
    DSITXPrescaler: ?DSITX_DivConf = null,
    PLLN: ?PLLNConf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    PLL1P: ?PLL1PConf = null,
    PLL1Q: ?PLL1QConf = null,
    PLL1R: ?PLL1RConf = null,
    PLL2N: ?PLL2NConf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    PLL2P: ?PLL2PConf = null,
    PLL2Q: ?PLL2QConf = null,
    PLL2R: ?PLL2RConf = null,
    PLL3N: ?PLL3NConf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    PLL3P: ?PLL3PConf = null,
    PLL3Q: ?PLL3QConf = null,
    PLL3R: ?PLL3RConf = null,
    PLLDSIIDF: ?PLLDSIIDFConf = null,
    PLLDSINDIV: ?PLLDSINDIVConf = null,
    PLLDSIODF: ?PLLDSIODFConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    MSIAutoCalibration: ?MSIAutoCalibrationConf = null,
    MSIAutoCalibrationArg: ?MSIAutoCalibrationArgConf = null,
    MSIPLLFAST: ?MSIPLLFASTConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    SAESSource: ?SAESSourceConf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSI_VALUE: ?LSI_VALUEConf = null,
    LSIDIV: ?LSIDIVConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    MSIClockRange: ?MSIClockRangeConf = null,
    MSIKClockRange: ?MSIKClockRangeConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLL2Source: ?PLL2SourceConf = null,
    PLL3Source: ?PLL3SourceConf = null,
    PLLM: ?PLLMConf = null,
    PLL2M: ?PLL2MConf = null,
    PLL3M: ?PLL3MConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    USART1CLockSelectionVirtual: ?USART1CLockSelectionVirtualConf = null,
    USART2CLockSelectionVirtual: ?USART2CLockSelectionVirtualConf = null,
    USART6CLockSelectionVirtual: ?USART6CLockSelectionVirtualConf = null,
    USART3CLockSelectionVirtual: ?USART3CLockSelectionVirtualConf = null,
    UART4CLockSelectionVirtual: ?UART4CLockSelectionVirtualConf = null,
    UART5CLockSelectionVirtual: ?UART5CLockSelectionVirtualConf = null,
    LPUART1CLockSelectionVirtual: ?LPUART1CLockSelectionVirtualConf = null,
    HSPICLockSelection: ?HSPICLockSelectionConf = null,
    LTDCCLockSelection: ?LTDCCLockSelectionConf = null,
    LPTIM1CLockSelectionVirtual: ?LPTIM1CLockSelectionVirtualConf = null,
    LPTIM2CLockSelectionVirtual: ?LPTIM2CLockSelectionVirtualConf = null,
    DACCLockSelectionVirtual: ?DACCLockSelectionVirtualConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    CK48CLockSelection: ?CK48CLockSelectionConf = null,
    SDMMCClockSelection: ?SDMMCClockSelectionConf = null,
    FDCANClockSelection: ?FDCANClockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    I2C2CLockSelection: ?I2C2CLockSelectionConf = null,
    I2C5CLockSelection: ?I2C5CLockSelectionConf = null,
    I2C6CLockSelection: ?I2C6CLockSelectionConf = null,
    I2C3CLockSelection: ?I2C3CLockSelectionConf = null,
    SAI1CLockSelection: ?SAI1CLockSelectionConf = null,
    SAI2CLockSelection: ?SAI2CLockSelectionConf = null,
    I2C4CLockSelection: ?I2C4CLockSelectionConf = null,
    MdfClockSelection: ?MdfClockSelectionConf = null,
    AdfClockSelection: ?AdfClockSelectionConf = null,
    OCTOSPIMCLockSelection: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3CLockSelectionVirtual: ?LPTIM3CLockSelectionVirtualConf = null,
    RNGCLockSelection: ?RNGCLockSelectionConf = null,
    RCC_MCO1SourceVirtual: ?RCC_MCO1SourceVirtualConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    LSCOSource1Virtual: ?LSCOSource1VirtualConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    CortexCLockSelectionVirtual: ?CortexCLockSelectionVirtualConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    APB3CLKDivider: ?APB3CLKDividerConf = null,
    SPI1CLockSelection: ?SPI1CLockSelectionConf = null,
    SPI3CLockSelection: ?SPI3CLockSelectionConf = null,
    SPI2CLockSelection: ?SPI2CLockSelectionConf = null,
    USBPHYCLockSelection: ?USBPHYCLockSelectionConf = null,
    DSICLockSelection: ?DSICLockSelectionConf = null,
    DSITX_Div: ?DSITX_DivConf = null,
    PLLN: ?PLLNConf = null,
    PLLFRACN: ?PLLFRACNConf = null,
    PLL1P: ?PLL1PConf = null,
    PLL1Q: ?PLL1QConf = null,
    PLL1R: ?PLL1RConf = null,
    PLL2N: ?PLL2NConf = null,
    PLL2FRACN: ?PLL2FRACNConf = null,
    PLL2P: ?PLL2PConf = null,
    PLL2Q: ?PLL2QConf = null,
    PLL2R: ?PLL2RConf = null,
    PLL3N: ?PLL3NConf = null,
    PLL3FRACN: ?PLL3FRACNConf = null,
    PLL3P: ?PLL3PConf = null,
    PLL3Q: ?PLL3QConf = null,
    PLL3R: ?PLL3RConf = null,
    PLLDSIIDF: ?PLLDSIIDFConf = null,
    PLLDSINDIV: ?PLLDSINDIVConf = null,
    PLLDSIODF: ?PLLDSIODFConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    MSIAutoCalibration: ?MSIAutoCalibrationConf = null,
    MSIAutoCalibrationArg: ?MSIAutoCalibrationArgConf = null,
    MSIPLLFAST: ?MSIPLLFASTConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .SAESMult = self.SAESSource,
            .HSEOSC = self.HSE_VALUE,
            .LSIRC = self.LSI_VALUE,
            .LSIDIV = self.LSIDIV,
            .LSEOSC = self.LSE_VALUE,
            .MSIRC = self.MSIClockRange,
            .MSIKRC = self.MSIKClockRange,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLL2Source = self.PLL2Source,
            .PLL3Source = self.PLL3Source,
            .PLLM = self.PLLM,
            .PLL2M = self.PLL2M,
            .PLL3M = self.PLL3M,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelectionVirtual,
            .USART2Mult = self.USART2CLockSelectionVirtual,
            .USART6Mult = self.USART6CLockSelectionVirtual,
            .USART3Mult = self.USART3CLockSelectionVirtual,
            .UART4Mult = self.UART4CLockSelectionVirtual,
            .UART5Mult = self.UART5CLockSelectionVirtual,
            .LPUART1Mult = self.LPUART1CLockSelectionVirtual,
            .HSPIMult = self.HSPICLockSelection,
            .LTDCMult = self.LTDCCLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelectionVirtual,
            .LPTIM2Mult = self.LPTIM2CLockSelectionVirtual,
            .DACMult = self.DACCLockSelectionVirtual,
            .ADCMult = self.ADCCLockSelection,
            .CK48Mult = self.CK48CLockSelection,
            .SDMMC1Mult = self.SDMMCClockSelection,
            .FDCANMult = self.FDCANClockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I2C5Mult = self.I2C5CLockSelection,
            .I2C6Mult = self.I2C6CLockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .SAI2Mult = self.SAI2CLockSelection,
            .I2C4Mult = self.I2C4CLockSelection,
            .MDF1Mult = self.MdfClockSelection,
            .ADF1Mult = self.AdfClockSelection,
            .OCTOSPIMMult = self.OCTOSPIMCLockSelection,
            .LPTIM3Mult = self.LPTIM3CLockSelectionVirtual,
            .RNGMult = self.RNGCLockSelection,
            .MCOMult = self.RCC_MCO1SourceVirtual,
            .MCODiv = self.RCC_MCODiv,
            .LSCOMult = self.LSCOSource1Virtual,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .CortexCLockSelection = self.CortexCLockSelectionVirtual,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .APB3Prescaler = self.APB3CLKDivider,
            .SPI1Mult = self.SPI1CLockSelection,
            .SPI3Mult = self.SPI3CLockSelection,
            .SPI2Mult = self.SPI2CLockSelection,
            .USBPHYMult = self.USBPHYCLockSelection,
            .DSIMult = self.DSICLockSelection,
            .DSITXPrescaler = self.DSITX_Div,
            .PLLN = self.PLLN,
            .PLLFRACN = self.PLLFRACN,
            .PLL1P = self.PLL1P,
            .PLL1Q = self.PLL1Q,
            .PLL1R = self.PLL1R,
            .PLL2N = self.PLL2N,
            .PLL2FRACN = self.PLL2FRACN,
            .PLL2P = self.PLL2P,
            .PLL2Q = self.PLL2Q,
            .PLL2R = self.PLL2R,
            .PLL3N = self.PLL3N,
            .PLL3FRACN = self.PLL3FRACN,
            .PLL3P = self.PLL3P,
            .PLL3Q = self.PLL3Q,
            .PLL3R = self.PLL3R,
            .PLLDSIIDF = self.PLLDSIIDF,
            .PLLDSINDIV = self.PLLDSINDIV,
            .PLLDSIODF = self.PLLDSIODF,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSICalibrationValue = self.MSICalibrationValue,
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
    SHSIRC: ClockNode,
    SHSIDiv: ClockNode,
    SAESMult: ClockNode,
    SAESoutput: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSIDIV: ClockNode,
    LSEOSC: ClockNode,
    MSIRC: ClockNode,
    MSIKRC: ClockNode,
    SAI1_EXT: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLL2Source: ClockNode,
    PLL3Source: ClockNode,
    PLLM: ClockNode,
    PLL2M: ClockNode,
    PLL3M: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART6Mult: ClockNode,
    USART6output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    UART4Mult: ClockNode,
    UART4output: ClockNode,
    UART5Mult: ClockNode,
    UART5output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    HSPIMult: ClockNode,
    HSPIoutput: ClockNode,
    LTDCMult: ClockNode,
    LTDCoutput: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    DACMult: ClockNode,
    DACoutput: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CK48Mult: ClockNode,
    CK48output: ClockNode,
    SDMMC1Mult: ClockNode,
    SDMMCC1Output: ClockNode,
    FDCANMult: ClockNode,
    FDCANOutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C5Mult: ClockNode,
    I2C5output: ClockNode,
    I2C6Mult: ClockNode,
    I2C6output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    MDF1Mult: ClockNode,
    MDF1output: ClockNode,
    ADF1Mult: ClockNode,
    ADF1output: ClockNode,
    OCTOSPIMMult: ClockNode,
    OCTOSPIMoutput: ClockNode,
    LPTIM3Mult: ClockNode,
    LPTIM3output: ClockNode,
    HSI48DivToRNG: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
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
    UCPD1Output: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
    SPI2Mult: ClockNode,
    SPI2output: ClockNode,
    HSEDiv2: ClockNode,
    PLL1PDiv2: ClockNode,
    USBPHYMult: ClockNode,
    USBPHYoutput: ClockNode,
    DSIPHYPrescaler: ClockNode,
    DSIMult: ClockNode,
    DSIoutput: ClockNode,
    DSITXPrescaler: ClockNode,
    DSITXCLKEsc: ClockNode,
    PLLN: ClockNode,
    PLLFRACN: ClockNode,
    PLL1P: ClockNode,
    PLLPoutput: ClockNode,
    PLL1Q: ClockNode,
    PLLQoutput: ClockNode,
    PLL1R: ClockNode,
    PLL2N: ClockNode,
    PLL2FRACN: ClockNode,
    PLL2P: ClockNode,
    PLL2Poutput: ClockNode,
    PLL2Q: ClockNode,
    PLL2Qoutput: ClockNode,
    PLL2R: ClockNode,
    PLL2Routput: ClockNode,
    PLL3N: ClockNode,
    PLL3FRACN: ClockNode,
    PLL3P: ClockNode,
    PLL3Poutput: ClockNode,
    PLL3Q: ClockNode,
    PLL3Qoutput: ClockNode,
    PLL3R: ClockNode,
    PLL3Routput: ClockNode,
    PLLDSIIDF: ClockNode,
    PLLDSIMultiplicator: ClockNode,
    PLLDSINDIV: ClockNode,
    VCOoutput: ClockNode,
    PLLDSIODF: ClockNode,
    PLLDSIoutput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,
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
        const SHSIRCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const SHSIRC: ClockNode = .{
            .name = "SHSIRC",
            .nodetype = SHSIRCval,
        };
        const SHSIDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const SHSIDiv: ClockNode = .{
            .name = "SHSIDiv",
            .nodetype = SHSIDivval,
            .parents = &[_]*const ClockNode{&SHSIRC},
        };
        const SAESMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAESMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAESMult: ClockNode = .{
            .name = "SAESMult",
            .nodetype = SAESMultval,

            .parents = &[_]*const ClockNode{
                &SHSIRC,
                &SHSIDiv,
            },
        };
        const SAESoutputval = ClockNodeTypes{ .output = null };
        const SAESoutput: ClockNode = .{
            .name = "SAESoutput",
            .nodetype = SAESoutputval,
            .parents = &[_]*const ClockNode{&SAESMult},
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
        const MSIRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4000;
                }
            },
        } };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .nodetype = MSIRCval,
        };
        const MSIKRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIKRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4000;
                }
            },
        } };
        const MSIKRC: ClockNode = .{
            .name = "MSIKRC",
            .nodetype = MSIKRCval,
        };
        const SAI1_EXTval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .nodetype = SAI1_EXTval,
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
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLM) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 16), .min = 1 },
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLFRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLLFRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .nodetype = PLLFRACNval,
        };
        const PLLNval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLLN) |val| val.get() else 129,
                .limit = .{ .max = @min(1_000_000_000, 512), .min = 4 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .nodetype = PLLNval,
            .parents = &[_]*const ClockNode{ &PLLM, &PLLFRACN },
        };
        const PLL1Rval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLL1R) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLL1R: ClockNode = .{
            .name = "PLL1R",
            .nodetype = PLL1Rval,
            .parents = &[_]*const ClockNode{&PLLN},
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
                &MSIRC,
                &HSIRC,
                &HSEOSC,
                &PLL1R,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PLL2Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL2Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",
            .nodetype = PLL2Sourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLL3Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL3Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",
            .nodetype = PLL3Sourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLL2Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2M) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const PLL2M: ClockNode = .{
            .name = "PLL2M",
            .nodetype = PLL2Mval,
            .parents = &[_]*const ClockNode{&PLL2Source},
        };
        const PLL3Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3M) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const PLL3M: ClockNode = .{
            .name = "PLL3M",
            .nodetype = PLL3Mval,
            .parents = &[_]*const ClockNode{&PLL3Source},
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
        const AHBOutputval = ClockNodeTypes{ .output = null };
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
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART1outputval = ClockNodeTypes{ .output = null };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
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
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART2outputval = ClockNodeTypes{ .output = null };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .nodetype = USART2outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",
            .nodetype = USART6Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const USART6outputval = ClockNodeTypes{ .output = null };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .nodetype = USART6outputval,
            .parents = &[_]*const ClockNode{&USART6Mult},
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
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
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
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const UART4outputval = ClockNodeTypes{ .output = null };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .nodetype = UART4outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
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
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
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
        const APB3Outputval = ClockNodeTypes{ .output = null };
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
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &MSIKRC,
            },
        };
        const LPUART1outputval = ClockNodeTypes{ .output = null };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .nodetype = LPUART1outputval,
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const PLL1Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL1Q) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL1Q: ClockNode = .{
            .name = "PLL1Q",
            .nodetype = PLL1Qval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLL2FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL2FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        const PLL2FRACN: ClockNode = .{
            .name = "PLL2FRACN",
            .nodetype = PLL2FRACNval,
        };
        const PLL2Nval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLL2N) |val| val.get() else 129,
                .limit = .{ .max = @min(1_000_000_000, 512), .min = 4 },
            },
        };
        const PLL2N: ClockNode = .{
            .name = "PLL2N",
            .nodetype = PLL2Nval,
            .parents = &[_]*const ClockNode{ &PLL2M, &PLL2FRACN },
        };
        const PLL2Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2Q) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL2Q: ClockNode = .{
            .name = "PLL2Q",
            .nodetype = PLL2Qval,
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const PLL3FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL3FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        const PLL3FRACN: ClockNode = .{
            .name = "PLL3FRACN",
            .nodetype = PLL3FRACNval,
        };
        const PLL3Nval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLL3N) |val| val.get() else 129,
                .limit = .{ .max = @min(1_000_000_000, 512), .min = 4 },
            },
        };
        const PLL3N: ClockNode = .{
            .name = "PLL3N",
            .nodetype = PLL3Nval,
            .parents = &[_]*const ClockNode{ &PLL3M, &PLL3FRACN },
        };
        const PLL3Rval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3R) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL3R: ClockNode = .{
            .name = "PLL3R",
            .nodetype = PLL3Rval,
            .parents = &[_]*const ClockNode{&PLL3N},
        };
        const HSPIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.HSPIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const HSPIMult: ClockNode = .{
            .name = "HSPIMult",
            .nodetype = HSPIMultval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &PLL1Q,
                &PLL2Q,
                &PLL3R,
            },
        };
        const HSPIoutputval = ClockNodeTypes{ .output = null };
        const HSPIoutput: ClockNode = .{
            .name = "HSPIoutput",
            .nodetype = HSPIoutputval,
            .parents = &[_]*const ClockNode{&HSPIMult},
        };
        const PLL2Rval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2R) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL2R: ClockNode = .{
            .name = "PLL2R",
            .nodetype = PLL2Rval,
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const LTDCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LTDCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LTDCMult: ClockNode = .{
            .name = "LTDCMult",
            .nodetype = LTDCMultval,

            .parents = &[_]*const ClockNode{
                &PLL2R,
                &PLL3R,
            },
        };
        const LTDCoutputval = ClockNodeTypes{ .output = null };
        const LTDCoutput: ClockNode = .{
            .name = "LTDCoutput",
            .nodetype = LTDCoutputval,
            .parents = &[_]*const ClockNode{&LTDCMult},
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
                &MSIKRC,
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
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &SysCLKOutput,
                &PLL2R,
                &HSEOSC,
                &HSIRC,
                &MSIKRC,
            },
        };
        const ADCoutputval = ClockNodeTypes{ .output = null };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const CK48Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CK48Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",
            .nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &PLL2Q,
                &PLL1Q,
                &MSIKRC,
                &HSI48RC,
            },
        };
        const CK48outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        const CK48output: ClockNode = .{
            .name = "CK48output",
            .nodetype = CK48outputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const PLL1Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL1P) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL1P: ClockNode = .{
            .name = "PLL1P",
            .nodetype = PLL1Pval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SDMMC1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMC1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SDMMC1Mult: ClockNode = .{
            .name = "SDMMC1Mult",
            .nodetype = SDMMC1Multval,

            .parents = &[_]*const ClockNode{
                &PLL1P,
                &CK48Mult,
            },
        };
        const SDMMCC1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 50000000), .min = 0 },
        };
        const SDMMCC1Output: ClockNode = .{
            .name = "SDMMCC1Output",
            .nodetype = SDMMCC1Outputval,
            .parents = &[_]*const ClockNode{&SDMMC1Mult},
        };
        const PLL2Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2P) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL2P: ClockNode = .{
            .name = "PLL2P",
            .nodetype = PLL2Pval,
            .parents = &[_]*const ClockNode{&PLL2N},
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
                &PLL1Q,
                &PLL2P,
                &HSEOSC,
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
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .nodetype = I2C1outputval,
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
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const I2C2outputval = ClockNodeTypes{ .output = null };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .nodetype = I2C2outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C5Mult: ClockNode = .{
            .name = "I2C5Mult",
            .nodetype = I2C5Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const I2C5outputval = ClockNodeTypes{ .output = null };
        const I2C5output: ClockNode = .{
            .name = "I2C5output",
            .nodetype = I2C5outputval,
            .parents = &[_]*const ClockNode{&I2C5Mult},
        };
        const I2C6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C6Mult: ClockNode = .{
            .name = "I2C6Mult",
            .nodetype = I2C6Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const I2C6outputval = ClockNodeTypes{ .output = null };
        const I2C6output: ClockNode = .{
            .name = "I2C6output",
            .nodetype = I2C6outputval,
            .parents = &[_]*const ClockNode{&I2C6Mult},
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
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const I2C3outputval = ClockNodeTypes{ .output = null };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .nodetype = I2C3outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const PLL3Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3P) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL3P: ClockNode = .{
            .name = "PLL3P",
            .nodetype = PLL3Pval,
            .parents = &[_]*const ClockNode{&PLL3N},
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
                &PLL2P,
                &PLL3P,
                &PLL1P,
                &SAI1_EXT,
                &HSIRC,
            },
        };
        const SAI1outputval = ClockNodeTypes{ .output = null };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",
            .nodetype = SAI2Multval,

            .parents = &[_]*const ClockNode{
                &PLL2P,
                &PLL3P,
                &PLL1P,
                &SAI1_EXT,
                &HSIRC,
            },
        };
        const SAI2outputval = ClockNodeTypes{ .output = null };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .nodetype = SAI2outputval,
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const I2C4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",
            .nodetype = I2C4Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const I2C4outputval = ClockNodeTypes{ .output = null };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .nodetype = I2C4outputval,
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const PLL3Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3Q) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        const PLL3Q: ClockNode = .{
            .name = "PLL3Q",
            .nodetype = PLL3Qval,
            .parents = &[_]*const ClockNode{&PLL3N},
        };
        const MDF1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MDF1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const MDF1Mult: ClockNode = .{
            .name = "MDF1Mult",
            .nodetype = MDF1Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &PLL1P,
                &PLL3Q,
                &SAI1_EXT,
                &MSIKRC,
            },
        };
        const MDF1outputval = ClockNodeTypes{ .output = null };
        const MDF1output: ClockNode = .{
            .name = "MDF1output",
            .nodetype = MDF1outputval,
            .parents = &[_]*const ClockNode{&MDF1Mult},
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
                &PLL1P,
                &PLL3Q,
                &SAI1_EXT,
                &MSIKRC,
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
                    break :inner 1;
                }
            },
        };
        const OCTOSPIMMult: ClockNode = .{
            .name = "OCTOSPIMMult",
            .nodetype = OCTOSPIMMultval,

            .parents = &[_]*const ClockNode{
                &MSIKRC,
                &SysCLKOutput,
                &PLL1Q,
                &PLL2Q,
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
                &MSIKRC,
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
        const HSI48DivToRNGval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const HSI48DivToRNG: ClockNode = .{
            .name = "HSI48DivToRNG",
            .nodetype = HSI48DivToRNGval,
            .parents = &[_]*const ClockNode{&HSI48RC},
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
                &HSI48DivToRNG,
                &HSIRC,
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
                    break :inner 5;
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
                &PLL1R,
                &SysCLKOutput,
                &MSIRC,
                &HSI48RC,
                &MSIKRC,
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
        const HCLKOutputval = ClockNodeTypes{ .output = null };
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
                    break :inner 1;
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
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexCLockSelection},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{ .output = null };
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
        const APB2Outputval = ClockNodeTypes{ .output = null };
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
        const UCPD1Outputval = ClockNodeTypes{ .output = null };
        const UCPD1Output: ClockNode = .{
            .name = "UCPD1Output",
            .nodetype = UCPD1Outputval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",
            .nodetype = SPI1Multval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const SPI1outputval = ClockNodeTypes{ .output = null };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .nodetype = SPI1outputval,
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",
            .nodetype = SPI3Multval,

            .parents = &[_]*const ClockNode{
                &APB3Output,
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
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
                    break :inner 1;
                }
            },
        };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",
            .nodetype = SPI2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &MSIKRC,
            },
        };
        const SPI2outputval = ClockNodeTypes{ .output = null };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .nodetype = SPI2outputval,
            .parents = &[_]*const ClockNode{&SPI2Mult},
        };
        const HSEDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const HSEDiv2: ClockNode = .{
            .name = "HSEDiv2",
            .nodetype = HSEDiv2val,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLL1PDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const PLL1PDiv2: ClockNode = .{
            .name = "PLL1PDiv2",
            .nodetype = PLL1PDiv2val,
            .parents = &[_]*const ClockNode{&PLL1P},
        };
        const USBPHYMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBPHYMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const USBPHYMult: ClockNode = .{
            .name = "USBPHYMult",
            .nodetype = USBPHYMultval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &HSEDiv2,
                &PLL1P,
                &PLL1PDiv2,
            },
        };
        const USBPHYoutputval = ClockNodeTypes{ .output = null };
        const USBPHYoutput: ClockNode = .{
            .name = "USBPHYoutput",
            .nodetype = USBPHYoutputval,
            .parents = &[_]*const ClockNode{&USBPHYMult},
        };
        const PLLDSIIDFval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDSIIDF) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PLLDSIIDF: ClockNode = .{
            .name = "PLLDSIIDF",
            .nodetype = PLLDSIIDFval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLDSIMultiplicatorval = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        const PLLDSIMultiplicator: ClockNode = .{
            .name = "PLLDSIMultiplicator",
            .nodetype = PLLDSIMultiplicatorval,
            .parents = &[_]*const ClockNode{&PLLDSIIDF},
        };
        const PLLDSINDIVval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLDSINDIV) |val| val.get() else 20,
                .limit = .{ .max = @min(1_000_000_000, 125), .min = 10 },
            },
        };
        const PLLDSINDIV: ClockNode = .{
            .name = "PLLDSINDIV",
            .nodetype = PLLDSINDIVval,
            .parents = &[_]*const ClockNode{&PLLDSIMultiplicator},
        };
        const VCOoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1000000000), .min = 500000000 },
        };
        const VCOoutput: ClockNode = .{
            .name = "VCOoutput",
            .nodetype = VCOoutputval,
            .parents = &[_]*const ClockNode{&PLLDSINDIV},
        };
        const PLLDSIODFval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDSIODF) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const PLLDSIODF: ClockNode = .{
            .name = "PLLDSIODF",
            .nodetype = PLLDSIODFval,
            .parents = &[_]*const ClockNode{&VCOoutput},
        };
        const DSIPHYPrescalerval = ClockNodeTypes{
            .div = .{ .value = 8 },
        };
        const DSIPHYPrescaler: ClockNode = .{
            .name = "DSIPHYPrescaler",
            .nodetype = DSIPHYPrescalerval,
            .parents = &[_]*const ClockNode{&PLLDSIODF},
        };
        const DSIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DSIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const DSIMult: ClockNode = .{
            .name = "DSIMult",
            .nodetype = DSIMultval,

            .parents = &[_]*const ClockNode{
                &PLL3P,
                &DSIPHYPrescaler,
            },
        };
        const DSIoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 62500000), .min = 0 },
        };
        const DSIoutput: ClockNode = .{
            .name = "DSIoutput",
            .nodetype = DSIoutputval,
            .parents = &[_]*const ClockNode{&DSIMult},
        };
        const DSITXPrescalerval = ClockNodeTypes{
            .div = .{
                .value = if (config.DSITXPrescaler) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 32), .min = 1 },
            },
        };
        const DSITXPrescaler: ClockNode = .{
            .name = "DSITXPrescaler",
            .nodetype = DSITXPrescalerval,
            .parents = &[_]*const ClockNode{&DSIoutput},
        };
        const DSITXCLKEscval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 20000000), .min = 0 },
        };
        const DSITXCLKEsc: ClockNode = .{
            .name = "DSITXCLKEsc",
            .nodetype = DSITXCLKEscval,
            .parents = &[_]*const ClockNode{&DSITXPrescaler},
        };
        const PLLPoutputval = ClockNodeTypes{ .output = null };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .nodetype = PLLPoutputval,
            .parents = &[_]*const ClockNode{&PLL1P},
        };
        const PLLQoutputval = ClockNodeTypes{ .output = null };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLL1Q},
        };
        const PLL2Poutputval = ClockNodeTypes{ .output = null };
        const PLL2Poutput: ClockNode = .{
            .name = "PLL2Poutput",
            .nodetype = PLL2Poutputval,
            .parents = &[_]*const ClockNode{&PLL2P},
        };
        const PLL2Qoutputval = ClockNodeTypes{ .output = null };
        const PLL2Qoutput: ClockNode = .{
            .name = "PLL2Qoutput",
            .nodetype = PLL2Qoutputval,
            .parents = &[_]*const ClockNode{&PLL2Q},
        };
        const PLL2Routputval = ClockNodeTypes{ .output = null };
        const PLL2Routput: ClockNode = .{
            .name = "PLL2Routput",
            .nodetype = PLL2Routputval,
            .parents = &[_]*const ClockNode{&PLL2R},
        };
        const PLL3Poutputval = ClockNodeTypes{ .output = null };
        const PLL3Poutput: ClockNode = .{
            .name = "PLL3Poutput",
            .nodetype = PLL3Poutputval,
            .parents = &[_]*const ClockNode{&PLL3P},
        };
        const PLL3Qoutputval = ClockNodeTypes{ .output = null };
        const PLL3Qoutput: ClockNode = .{
            .name = "PLL3Qoutput",
            .nodetype = PLL3Qoutputval,
            .parents = &[_]*const ClockNode{&PLL3Q},
        };
        const PLL3Routputval = ClockNodeTypes{ .output = null };
        const PLL3Routput: ClockNode = .{
            .name = "PLL3Routput",
            .nodetype = PLL3Routputval,
            .parents = &[_]*const ClockNode{&PLL3R},
        };
        const PLLDSIoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 500000000), .min = 32250000 },
        };
        const PLLDSIoutput: ClockNode = .{
            .name = "PLLDSIoutput",
            .nodetype = PLLDSIoutputval,
            .parents = &[_]*const ClockNode{&PLLDSIODF},
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
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
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
            .SHSIRC = SHSIRC,
            .SHSIDiv = SHSIDiv,
            .SAESMult = SAESMult,
            .SAESoutput = SAESoutput,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSIDIV = LSIDIV,
            .LSEOSC = LSEOSC,
            .MSIRC = MSIRC,
            .MSIKRC = MSIKRC,
            .SAI1_EXT = SAI1_EXT,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLL2Source = PLL2Source,
            .PLL3Source = PLL3Source,
            .PLLM = PLLM,
            .PLL2M = PLL2M,
            .PLL3M = PLL3M,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART6Mult = USART6Mult,
            .USART6output = USART6output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .UART4Mult = UART4Mult,
            .UART4output = UART4output,
            .UART5Mult = UART5Mult,
            .UART5output = UART5output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .HSPIMult = HSPIMult,
            .HSPIoutput = HSPIoutput,
            .LTDCMult = LTDCMult,
            .LTDCoutput = LTDCoutput,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .DACMult = DACMult,
            .DACoutput = DACoutput,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CK48Mult = CK48Mult,
            .CK48output = CK48output,
            .SDMMC1Mult = SDMMC1Mult,
            .SDMMCC1Output = SDMMCC1Output,
            .FDCANMult = FDCANMult,
            .FDCANOutput = FDCANOutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C5Mult = I2C5Mult,
            .I2C5output = I2C5output,
            .I2C6Mult = I2C6Mult,
            .I2C6output = I2C6output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .MDF1Mult = MDF1Mult,
            .MDF1output = MDF1output,
            .ADF1Mult = ADF1Mult,
            .ADF1output = ADF1output,
            .OCTOSPIMMult = OCTOSPIMMult,
            .OCTOSPIMoutput = OCTOSPIMoutput,
            .LPTIM3Mult = LPTIM3Mult,
            .LPTIM3output = LPTIM3output,
            .HSI48DivToRNG = HSI48DivToRNG,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
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
            .UCPD1Output = UCPD1Output,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
            .SPI2Mult = SPI2Mult,
            .SPI2output = SPI2output,
            .HSEDiv2 = HSEDiv2,
            .PLL1PDiv2 = PLL1PDiv2,
            .USBPHYMult = USBPHYMult,
            .USBPHYoutput = USBPHYoutput,
            .DSIPHYPrescaler = DSIPHYPrescaler,
            .DSIMult = DSIMult,
            .DSIoutput = DSIoutput,
            .DSITXPrescaler = DSITXPrescaler,
            .DSITXCLKEsc = DSITXCLKEsc,
            .PLLN = PLLN,
            .PLLFRACN = PLLFRACN,
            .PLL1P = PLL1P,
            .PLLPoutput = PLLPoutput,
            .PLL1Q = PLL1Q,
            .PLLQoutput = PLLQoutput,
            .PLL1R = PLL1R,
            .PLL2N = PLL2N,
            .PLL2FRACN = PLL2FRACN,
            .PLL2P = PLL2P,
            .PLL2Poutput = PLL2Poutput,
            .PLL2Q = PLL2Q,
            .PLL2Qoutput = PLL2Qoutput,
            .PLL2R = PLL2R,
            .PLL2Routput = PLL2Routput,
            .PLL3N = PLL3N,
            .PLL3FRACN = PLL3FRACN,
            .PLL3P = PLL3P,
            .PLL3Poutput = PLL3Poutput,
            .PLL3Q = PLL3Q,
            .PLL3Qoutput = PLL3Qoutput,
            .PLL3R = PLL3R,
            .PLL3Routput = PLL3Routput,
            .PLLDSIIDF = PLLDSIIDF,
            .PLLDSIMultiplicator = PLLDSIMultiplicator,
            .PLLDSINDIV = PLLDSINDIV,
            .VCOoutput = VCOoutput,
            .PLLDSIODF = PLLDSIODF,
            .PLLDSIoutput = PLLDSIoutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSICalibrationValue = MSICalibrationValueval,
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
        self.SHSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.SHSIDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SHSIRC,
        });
        self.SAESMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SHSIRC,
            &self.SHSIDiv,
        });
        self.SAESoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAESMult,
        });
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSIDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIRC,
        });
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.MSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.MSIKRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.SAI1_EXT.parents = try alloc.dupe(*const ClockNode, &.{});
        self.SysClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIRC,
            &self.HSIRC,
            &self.HSEOSC,
            &self.PLL1R,
        });
        self.SysCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysClkSource,
        });
        self.PLLSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIRC,
            &self.HSIRC,
            &self.HSEOSC,
        });
        self.PLL2Source.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIRC,
            &self.HSIRC,
            &self.HSEOSC,
        });
        self.PLL3Source.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIRC,
            &self.HSIRC,
            &self.HSEOSC,
        });
        self.PLLM.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLSource,
        });
        self.PLL2M.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2Source,
        });
        self.PLL3M.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3Source,
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
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.USART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART1Mult,
        });
        self.USART2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.USART2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART2Mult,
        });
        self.USART6Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.USART6output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART6Mult,
        });
        self.USART3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.USART3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART3Mult,
        });
        self.UART4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.UART4output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART4Mult,
        });
        self.UART5Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.UART5output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART5Mult,
        });
        self.LPUART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB3Output,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.LSEOSC,
            &self.MSIKRC,
        });
        self.LPUART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPUART1Mult,
        });
        self.HSPIMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SysCLKOutput,
            &self.PLL1Q,
            &self.PLL2Q,
            &self.PLL3R,
        });
        self.HSPIoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSPIMult,
        });
        self.LTDCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2R,
            &self.PLL3R,
        });
        self.LTDCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LTDCMult,
        });
        self.LPTIM1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIKRC,
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
        self.ADCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.SysCLKOutput,
            &self.PLL2R,
            &self.HSEOSC,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.ADCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCMult,
        });
        self.CK48Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2Q,
            &self.PLL1Q,
            &self.MSIKRC,
            &self.HSI48RC,
        });
        self.CK48output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CK48Mult,
        });
        self.SDMMC1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL1P,
            &self.CK48Mult,
        });
        self.SDMMCC1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SDMMC1Mult,
        });
        self.FDCANMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL1Q,
            &self.PLL2P,
            &self.HSEOSC,
        });
        self.FDCANOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FDCANMult,
        });
        self.I2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.I2C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C1Mult,
        });
        self.I2C2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.I2C2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C2Mult,
        });
        self.I2C5Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.I2C5output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C5Mult,
        });
        self.I2C6Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.I2C6output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C6Mult,
        });
        self.I2C3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB3Output,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.I2C3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C3Mult,
        });
        self.SAI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2P,
            &self.PLL3P,
            &self.PLL1P,
            &self.SAI1_EXT,
            &self.HSIRC,
        });
        self.SAI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAI1Mult,
        });
        self.SAI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2P,
            &self.PLL3P,
            &self.PLL1P,
            &self.SAI1_EXT,
            &self.HSIRC,
        });
        self.SAI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAI2Mult,
        });
        self.I2C4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.I2C4output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C4Mult,
        });
        self.MDF1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.PLL1P,
            &self.PLL3Q,
            &self.SAI1_EXT,
            &self.MSIKRC,
        });
        self.MDF1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MDF1Mult,
        });
        self.ADF1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.PLL1P,
            &self.PLL3Q,
            &self.SAI1_EXT,
            &self.MSIKRC,
        });
        self.ADF1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADF1Mult,
        });
        self.OCTOSPIMMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIKRC,
            &self.SysCLKOutput,
            &self.PLL1Q,
            &self.PLL2Q,
        });
        self.OCTOSPIMoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OCTOSPIMMult,
        });
        self.LPTIM3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MSIKRC,
            &self.LSIDIV,
            &self.HSIRC,
            &self.LSEOSC,
        });
        self.LPTIM3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM3Mult,
        });
        self.HSI48DivToRNG.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSI48RC,
        });
        self.RNGMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSI48RC,
            &self.HSI48DivToRNG,
            &self.HSIRC,
        });
        self.RNGoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RNGMult,
        });
        self.MCOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSEOSC,
            &self.LSIDIV,
            &self.HSEOSC,
            &self.HSIRC,
            &self.PLL1R,
            &self.SysCLKOutput,
            &self.MSIRC,
            &self.HSI48RC,
            &self.MSIKRC,
        });
        self.MCODiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMult,
        });
        self.MCOPin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCODiv,
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
        self.UCPD1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.SPI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.SPI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI1Mult,
        });
        self.SPI3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB3Output,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.SPI3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI3Mult,
        });
        self.SPI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Prescaler,
            &self.SysCLKOutput,
            &self.HSIRC,
            &self.MSIKRC,
        });
        self.SPI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI2Mult,
        });
        self.HSEDiv2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.PLL1PDiv2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL1P,
        });
        self.USBPHYMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
            &self.HSEDiv2,
            &self.PLL1P,
            &self.PLL1PDiv2,
        });
        self.USBPHYoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USBPHYMult,
        });
        self.DSIPHYPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLDSIODF,
        });
        self.DSIMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3P,
            &self.DSIPHYPrescaler,
        });
        self.DSIoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DSIMult,
        });
        self.DSITXPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DSIoutput,
        });
        self.DSITXCLKEsc.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DSITXPrescaler,
        });
        self.PLLN.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLM,
            &self.PLLFRACN,
        });
        self.PLLFRACN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.PLL1P.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLLPoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL1P,
        });
        self.PLL1Q.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLLQoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL1Q,
        });
        self.PLL1R.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLN,
        });
        self.PLL2N.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2M,
            &self.PLL2FRACN,
        });
        self.PLL2FRACN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.PLL2P.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2N,
        });
        self.PLL2Poutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2P,
        });
        self.PLL2Q.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2N,
        });
        self.PLL2Qoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2Q,
        });
        self.PLL2R.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2N,
        });
        self.PLL2Routput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2R,
        });
        self.PLL3N.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3M,
            &self.PLL3FRACN,
        });
        self.PLL3FRACN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.PLL3P.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3N,
        });
        self.PLL3Poutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3P,
        });
        self.PLL3Q.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3N,
        });
        self.PLL3Qoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3Q,
        });
        self.PLL3R.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3N,
        });
        self.PLL3Routput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3R,
        });
        self.PLLDSIIDF.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.PLLDSIMultiplicator.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLDSIIDF,
        });
        self.PLLDSINDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLDSIMultiplicator,
        });
        self.VCOoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLDSINDIV,
        });
        self.PLLDSIODF.parents = try alloc.dupe(*const ClockNode, &.{
            &self.VCOoutput,
        });
        self.PLLDSIoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLLDSIODF,
        });
    }
    pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
        alloc.free(self.HSIRC.parents.?);
        alloc.free(self.CRSCLKoutput.parents.?);
        alloc.free(self.HSI48RC.parents.?);
        alloc.free(self.SHSIRC.parents.?);
        alloc.free(self.SHSIDiv.parents.?);
        alloc.free(self.SAESMult.parents.?);
        alloc.free(self.SAESoutput.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSIDIV.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.MSIRC.parents.?);
        alloc.free(self.MSIKRC.parents.?);
        alloc.free(self.SAI1_EXT.parents.?);
        alloc.free(self.SysClkSource.parents.?);
        alloc.free(self.SysCLKOutput.parents.?);
        alloc.free(self.PLLSource.parents.?);
        alloc.free(self.PLL2Source.parents.?);
        alloc.free(self.PLL3Source.parents.?);
        alloc.free(self.PLLM.parents.?);
        alloc.free(self.PLL2M.parents.?);
        alloc.free(self.PLL3M.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
        alloc.free(self.USART1Mult.parents.?);
        alloc.free(self.USART1output.parents.?);
        alloc.free(self.USART2Mult.parents.?);
        alloc.free(self.USART2output.parents.?);
        alloc.free(self.USART6Mult.parents.?);
        alloc.free(self.USART6output.parents.?);
        alloc.free(self.USART3Mult.parents.?);
        alloc.free(self.USART3output.parents.?);
        alloc.free(self.UART4Mult.parents.?);
        alloc.free(self.UART4output.parents.?);
        alloc.free(self.UART5Mult.parents.?);
        alloc.free(self.UART5output.parents.?);
        alloc.free(self.LPUART1Mult.parents.?);
        alloc.free(self.LPUART1output.parents.?);
        alloc.free(self.HSPIMult.parents.?);
        alloc.free(self.HSPIoutput.parents.?);
        alloc.free(self.LTDCMult.parents.?);
        alloc.free(self.LTDCoutput.parents.?);
        alloc.free(self.LPTIM1Mult.parents.?);
        alloc.free(self.LPTIM1output.parents.?);
        alloc.free(self.LPTIM2Mult.parents.?);
        alloc.free(self.LPTIM2output.parents.?);
        alloc.free(self.DACMult.parents.?);
        alloc.free(self.DACoutput.parents.?);
        alloc.free(self.ADCMult.parents.?);
        alloc.free(self.ADCoutput.parents.?);
        alloc.free(self.CK48Mult.parents.?);
        alloc.free(self.CK48output.parents.?);
        alloc.free(self.SDMMC1Mult.parents.?);
        alloc.free(self.SDMMCC1Output.parents.?);
        alloc.free(self.FDCANMult.parents.?);
        alloc.free(self.FDCANOutput.parents.?);
        alloc.free(self.I2C1Mult.parents.?);
        alloc.free(self.I2C1output.parents.?);
        alloc.free(self.I2C2Mult.parents.?);
        alloc.free(self.I2C2output.parents.?);
        alloc.free(self.I2C5Mult.parents.?);
        alloc.free(self.I2C5output.parents.?);
        alloc.free(self.I2C6Mult.parents.?);
        alloc.free(self.I2C6output.parents.?);
        alloc.free(self.I2C3Mult.parents.?);
        alloc.free(self.I2C3output.parents.?);
        alloc.free(self.SAI1Mult.parents.?);
        alloc.free(self.SAI1output.parents.?);
        alloc.free(self.SAI2Mult.parents.?);
        alloc.free(self.SAI2output.parents.?);
        alloc.free(self.I2C4Mult.parents.?);
        alloc.free(self.I2C4output.parents.?);
        alloc.free(self.MDF1Mult.parents.?);
        alloc.free(self.MDF1output.parents.?);
        alloc.free(self.ADF1Mult.parents.?);
        alloc.free(self.ADF1output.parents.?);
        alloc.free(self.OCTOSPIMMult.parents.?);
        alloc.free(self.OCTOSPIMoutput.parents.?);
        alloc.free(self.LPTIM3Mult.parents.?);
        alloc.free(self.LPTIM3output.parents.?);
        alloc.free(self.HSI48DivToRNG.parents.?);
        alloc.free(self.RNGMult.parents.?);
        alloc.free(self.RNGoutput.parents.?);
        alloc.free(self.MCOMult.parents.?);
        alloc.free(self.MCODiv.parents.?);
        alloc.free(self.MCOPin.parents.?);
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
        alloc.free(self.UCPD1Output.parents.?);
        alloc.free(self.SPI1Mult.parents.?);
        alloc.free(self.SPI1output.parents.?);
        alloc.free(self.SPI3Mult.parents.?);
        alloc.free(self.SPI3output.parents.?);
        alloc.free(self.SPI2Mult.parents.?);
        alloc.free(self.SPI2output.parents.?);
        alloc.free(self.HSEDiv2.parents.?);
        alloc.free(self.PLL1PDiv2.parents.?);
        alloc.free(self.USBPHYMult.parents.?);
        alloc.free(self.USBPHYoutput.parents.?);
        alloc.free(self.DSIPHYPrescaler.parents.?);
        alloc.free(self.DSIMult.parents.?);
        alloc.free(self.DSIoutput.parents.?);
        alloc.free(self.DSITXPrescaler.parents.?);
        alloc.free(self.DSITXCLKEsc.parents.?);
        alloc.free(self.PLLN.parents.?);
        alloc.free(self.PLLFRACN.parents.?);
        alloc.free(self.PLL1P.parents.?);
        alloc.free(self.PLLPoutput.parents.?);
        alloc.free(self.PLL1Q.parents.?);
        alloc.free(self.PLLQoutput.parents.?);
        alloc.free(self.PLL1R.parents.?);
        alloc.free(self.PLL2N.parents.?);
        alloc.free(self.PLL2FRACN.parents.?);
        alloc.free(self.PLL2P.parents.?);
        alloc.free(self.PLL2Poutput.parents.?);
        alloc.free(self.PLL2Q.parents.?);
        alloc.free(self.PLL2Qoutput.parents.?);
        alloc.free(self.PLL2R.parents.?);
        alloc.free(self.PLL2Routput.parents.?);
        alloc.free(self.PLL3N.parents.?);
        alloc.free(self.PLL3FRACN.parents.?);
        alloc.free(self.PLL3P.parents.?);
        alloc.free(self.PLL3Poutput.parents.?);
        alloc.free(self.PLL3Q.parents.?);
        alloc.free(self.PLL3Qoutput.parents.?);
        alloc.free(self.PLL3R.parents.?);
        alloc.free(self.PLL3Routput.parents.?);
        alloc.free(self.PLLDSIIDF.parents.?);
        alloc.free(self.PLLDSIMultiplicator.parents.?);
        alloc.free(self.PLLDSINDIV.parents.?);
        alloc.free(self.VCOoutput.parents.?);
        alloc.free(self.PLLDSIODF.parents.?);
        alloc.free(self.PLLDSIoutput.parents.?);
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
        const SHSIRCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        self.SHSIRC.nodetype = SHSIRCval;
        const SHSIDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.SHSIDiv.nodetype = SHSIDivval;
        const SAESMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAESMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SAESMult.nodetype = SAESMultval;
        const SAESoutputval = ClockNodeTypes{ .output = null };
        self.SAESoutput.nodetype = SAESoutputval;
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
        const MSIRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4000;
                }
            },
        } };
        self.MSIRC.nodetype = MSIRCval;
        const MSIKRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIKRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4000;
                }
            },
        } };
        self.MSIKRC.nodetype = MSIKRCval;
        const SAI1_EXTval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        self.SAI1_EXT.nodetype = SAI1_EXTval;
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
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLM) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 16), .min = 1 },
            },
        };
        self.PLLM.nodetype = PLLMval;
        const PLLFRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLLFRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        self.PLLFRACN.nodetype = PLLFRACNval;
        const PLLNval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLLN) |val| val.get() else 129,
                .limit = .{ .max = @min(1_000_000_000, 512), .min = 4 },
            },
        };
        self.PLLN.nodetype = PLLNval;
        const PLL1Rval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLL1R) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.PLL1R.nodetype = PLL1Rval;
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
        const PLL2Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL2Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLL2Source.nodetype = PLL2Sourceval;
        const PLL3Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL3Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLL3Source.nodetype = PLL3Sourceval;
        const PLL2Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2M) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.PLL2M.nodetype = PLL2Mval;
        const PLL3Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3M) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.PLL3M.nodetype = PLL3Mval;
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
        const AHBOutputval = ClockNodeTypes{ .output = null };
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
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART2Mult.nodetype = USART2Multval;
        const USART2outputval = ClockNodeTypes{ .output = null };
        self.USART2output.nodetype = USART2outputval;
        const USART6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART6Mult.nodetype = USART6Multval;
        const USART6outputval = ClockNodeTypes{ .output = null };
        self.USART6output.nodetype = USART6outputval;
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
        const APB3Outputval = ClockNodeTypes{ .output = null };
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
        const PLL1Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL1Q) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL1Q.nodetype = PLL1Qval;
        const PLL2FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL2FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        self.PLL2FRACN.nodetype = PLL2FRACNval;
        const PLL2Nval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLL2N) |val| val.get() else 129,
                .limit = .{ .max = @min(1_000_000_000, 512), .min = 4 },
            },
        };
        self.PLL2N.nodetype = PLL2Nval;
        const PLL2Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2Q) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL2Q.nodetype = PLL2Qval;
        const PLL3FRACNval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL3FRACN) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 8191), .min = 0 },
            },
        };
        self.PLL3FRACN.nodetype = PLL3FRACNval;
        const PLL3Nval = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.PLL3N) |val| val.get() else 129,
                .limit = .{ .max = @min(1_000_000_000, 512), .min = 4 },
            },
        };
        self.PLL3N.nodetype = PLL3Nval;
        const PLL3Rval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3R) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL3R.nodetype = PLL3Rval;
        const HSPIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.HSPIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.HSPIMult.nodetype = HSPIMultval;
        const HSPIoutputval = ClockNodeTypes{ .output = null };
        self.HSPIoutput.nodetype = HSPIoutputval;
        const PLL2Rval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2R) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL2R.nodetype = PLL2Rval;
        const LTDCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LTDCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LTDCMult.nodetype = LTDCMultval;
        const LTDCoutputval = ClockNodeTypes{ .output = null };
        self.LTDCoutput.nodetype = LTDCoutputval;
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
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        };
        self.ADCMult.nodetype = ADCMultval;
        const ADCoutputval = ClockNodeTypes{ .output = null };
        self.ADCoutput.nodetype = ADCoutputval;
        const CK48Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CK48Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.CK48Mult.nodetype = CK48Multval;
        const CK48outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 48000000), .min = 0 },
        };
        self.CK48output.nodetype = CK48outputval;
        const PLL1Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL1P) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL1P.nodetype = PLL1Pval;
        const SDMMC1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMC1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SDMMC1Mult.nodetype = SDMMC1Multval;
        const SDMMCC1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 50000000), .min = 0 },
        };
        self.SDMMCC1Output.nodetype = SDMMCC1Outputval;
        const PLL2Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL2P) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL2P.nodetype = PLL2Pval;
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
        const I2C5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C5Mult.nodetype = I2C5Multval;
        const I2C5outputval = ClockNodeTypes{ .output = null };
        self.I2C5output.nodetype = I2C5outputval;
        const I2C6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C6Mult.nodetype = I2C6Multval;
        const I2C6outputval = ClockNodeTypes{ .output = null };
        self.I2C6output.nodetype = I2C6outputval;
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
        const PLL3Pval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3P) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL3P.nodetype = PLL3Pval;
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
        const SAI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SAI2Mult.nodetype = SAI2Multval;
        const SAI2outputval = ClockNodeTypes{ .output = null };
        self.SAI2output.nodetype = SAI2outputval;
        const I2C4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C4Mult.nodetype = I2C4Multval;
        const I2C4outputval = ClockNodeTypes{ .output = null };
        self.I2C4output.nodetype = I2C4outputval;
        const PLL3Qval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLL3Q) |val| val.get() else 2,
                .limit = .{ .max = @min(1_000_000_000, 128), .min = 1 },
            },
        };
        self.PLL3Q.nodetype = PLL3Qval;
        const MDF1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MDF1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.MDF1Mult.nodetype = MDF1Multval;
        const MDF1outputval = ClockNodeTypes{ .output = null };
        self.MDF1output.nodetype = MDF1outputval;
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
                    break :inner 1;
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
        const HSI48DivToRNGval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.HSI48DivToRNG.nodetype = HSI48DivToRNGval;
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
                    break :inner 5;
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
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        self.HCLKOutput.nodetype = HCLKOutputval;
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
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        self.CortexSysOutput.nodetype = CortexSysOutputval;
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        self.FCLKCortexOutput.nodetype = FCLKCortexOutputval;
        const APB1Outputval = ClockNodeTypes{ .output = null };
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
        const APB2Outputval = ClockNodeTypes{ .output = null };
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
        const UCPD1Outputval = ClockNodeTypes{ .output = null };
        self.UCPD1Output.nodetype = UCPD1Outputval;
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.SPI1Mult.nodetype = SPI1Multval;
        const SPI1outputval = ClockNodeTypes{ .output = null };
        self.SPI1output.nodetype = SPI1outputval;
        const SPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
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
                    break :inner 1;
                }
            },
        };
        self.SPI2Mult.nodetype = SPI2Multval;
        const SPI2outputval = ClockNodeTypes{ .output = null };
        self.SPI2output.nodetype = SPI2outputval;
        const HSEDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.HSEDiv2.nodetype = HSEDiv2val;
        const PLL1PDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        self.PLL1PDiv2.nodetype = PLL1PDiv2val;
        const USBPHYMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.USBPHYMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.USBPHYMult.nodetype = USBPHYMultval;
        const USBPHYoutputval = ClockNodeTypes{ .output = null };
        self.USBPHYoutput.nodetype = USBPHYoutputval;
        const PLLDSIIDFval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDSIIDF) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PLLDSIIDF.nodetype = PLLDSIIDFval;
        const PLLDSIMultiplicatorval = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        self.PLLDSIMultiplicator.nodetype = PLLDSIMultiplicatorval;
        const PLLDSINDIVval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLDSINDIV) |val| val.get() else 20,
                .limit = .{ .max = @min(1_000_000_000, 125), .min = 10 },
            },
        };
        self.PLLDSINDIV.nodetype = PLLDSINDIVval;
        const VCOoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1000000000), .min = 500000000 },
        };
        self.VCOoutput.nodetype = VCOoutputval;
        const PLLDSIODFval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLDSIODF) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.PLLDSIODF.nodetype = PLLDSIODFval;
        const DSIPHYPrescalerval = ClockNodeTypes{
            .div = .{ .value = 8 },
        };
        self.DSIPHYPrescaler.nodetype = DSIPHYPrescalerval;
        const DSIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DSIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.DSIMult.nodetype = DSIMultval;
        const DSIoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 62500000), .min = 0 },
        };
        self.DSIoutput.nodetype = DSIoutputval;
        const DSITXPrescalerval = ClockNodeTypes{
            .div = .{
                .value = if (config.DSITXPrescaler) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 32), .min = 1 },
            },
        };
        self.DSITXPrescaler.nodetype = DSITXPrescalerval;
        const DSITXCLKEscval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 20000000), .min = 0 },
        };
        self.DSITXCLKEsc.nodetype = DSITXCLKEscval;
        const PLLPoutputval = ClockNodeTypes{ .output = null };
        self.PLLPoutput.nodetype = PLLPoutputval;
        const PLLQoutputval = ClockNodeTypes{ .output = null };
        self.PLLQoutput.nodetype = PLLQoutputval;
        const PLL2Poutputval = ClockNodeTypes{ .output = null };
        self.PLL2Poutput.nodetype = PLL2Poutputval;
        const PLL2Qoutputval = ClockNodeTypes{ .output = null };
        self.PLL2Qoutput.nodetype = PLL2Qoutputval;
        const PLL2Routputval = ClockNodeTypes{ .output = null };
        self.PLL2Routput.nodetype = PLL2Routputval;
        const PLL3Poutputval = ClockNodeTypes{ .output = null };
        self.PLL3Poutput.nodetype = PLL3Poutputval;
        const PLL3Qoutputval = ClockNodeTypes{ .output = null };
        self.PLL3Qoutput.nodetype = PLL3Qoutputval;
        const PLL3Routputval = ClockNodeTypes{ .output = null };
        self.PLL3Routput.nodetype = PLL3Routputval;
        const PLLDSIoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 500000000), .min = 32250000 },
        };
        self.PLLDSIoutput.nodetype = PLLDSIoutputval;
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
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
            },
        };
        self.MSICalibrationValue = MSICalibrationValueval;
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
