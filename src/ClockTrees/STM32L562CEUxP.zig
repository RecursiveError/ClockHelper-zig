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
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSIRANGE_10 => 32000,
            .RCC_MSIRANGE_8 => 16000,
            .RCC_MSIRANGE_3 => 800,
            .RCC_MSIRANGE_4 => 1000,
            .RCC_MSIRANGE_5 => 2000,
            .RCC_MSIRANGE_9 => 24000,
            .RCC_MSIRANGE_0 => 100,
            .RCC_MSIRANGE_11 => 48000,
            .RCC_MSIRANGE_7 => 8000,
            .RCC_MSIRANGE_6 => 4000,
            .RCC_MSIRANGE_2 => 400,
            .RCC_MSIRANGE_1 => 200,
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
pub const PLLSAI1SourceConf = enum {
    RCC_PLLSAI1SOURCE_MSI,
    RCC_PLLSAI1SOURCE_HSI,
    RCC_PLLSAI1SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLLSAI2SourceConf = enum {
    RCC_PLLSAI2SOURCE_MSI,
    RCC_PLLSAI2SOURCE_HSI,
    RCC_PLLSAI2SOURCE_HSE,

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
pub const PLLSAI1MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLSAI2MConf = enum(u32) {
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
pub const LPUART1CLockSelectionVirtualConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK1,
    RCC_LPUART1CLKSOURCE_SYSCLK,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionVirtualConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK1,
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
pub const DFSDMCLockSelectionConf = enum {
    RCC_DFSDM1CLKSOURCE_PCLK2,
    RCC_DFSDM1CLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_PLLSAI1,
    RCC_ADCCLKSOURCE_SYSCLK,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CK48CLockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLLSAI1,
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_MSI,
    RCC_USBCLKSOURCE_HSI48,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FDCANClockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_PLL,
    RCC_FDCANCLKSOURCE_PLLSAI1,
    RCC_FDCANCLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_SYSCLK,
    RCC_I2C1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_SYSCLK,
    RCC_I2C2CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C3CLockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK1,
    RCC_I2C3CLKSOURCE_SYSCLK,
    RCC_I2C3CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI1CLockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PLLSAI1,
    RCC_SAI1CLKSOURCE_PLLSAI2,
    RCC_SAI1CLKSOURCE_PLL,
    RCC_SAI1CLKSOURCE_PIN,
    RCC_SAI1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI2CLockSelectionConf = enum {
    RCC_SAI2CLKSOURCE_PLLSAI1,
    RCC_SAI2CLKSOURCE_PLLSAI2,
    RCC_SAI2CLKSOURCE_PLL,
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

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OCTOSPIMCLockSelectionConf = enum {
    RCC_OSPICLKSOURCE_MSI,
    RCC_OSPICLKSOURCE_SYSCLK,
    RCC_OSPICLKSOURCE_PLL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM3CLockSelectionVirtualConf = enum {
    RCC_LPTIM3CLKSOURCE_PCLK1,
    RCC_LPTIM3CLKSOURCE_LSI,
    RCC_LPTIM3CLKSOURCE_HSI,
    RCC_LPTIM3CLKSOURCE_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DFSDMAudioCLockSelectionConf = enum {
    RCC_DFSDM1AUDIOCLKSOURCE_MSI,
    RCC_DFSDM1AUDIOCLKSOURCE_HSI,
    RCC_DFSDM1AUDIOCLKSOURCE_SAI1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceVirtualConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
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
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLPConf = enum {
    RCC_PLLP_DIV7,
    RCC_PLLP_DIV17,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV7 => 7,
        };
    }
};
pub const PLLQConf = enum {
    RCC_PLLQ_DIV2,
    RCC_PLLQ_DIV4,
    RCC_PLLQ_DIV6,
    RCC_PLLQ_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLQ_DIV6 => 6,
            .RCC_PLLQ_DIV2 => 2,
            .RCC_PLLQ_DIV8 => 8,
            .RCC_PLLQ_DIV4 => 4,
        };
    }
};
pub const PLLRConf = enum {
    RCC_PLLR_DIV2,
    RCC_PLLR_DIV4,
    RCC_PLLR_DIV6,
    RCC_PLLR_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLR_DIV2 => 2,
            .RCC_PLLR_DIV8 => 8,
            .RCC_PLLR_DIV6 => 6,
            .RCC_PLLR_DIV4 => 4,
        };
    }
};
pub const PLLSAI1NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLSAI1PConf = enum {
    RCC_PLLP_DIV7,
    RCC_PLLP_DIV17,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV7 => 7,
        };
    }
};
pub const PLLSAI1QConf = enum {
    RCC_PLLQ_DIV2,
    RCC_PLLQ_DIV4,
    RCC_PLLQ_DIV6,
    RCC_PLLQ_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLQ_DIV6 => 6,
            .RCC_PLLQ_DIV2 => 2,
            .RCC_PLLQ_DIV8 => 8,
            .RCC_PLLQ_DIV4 => 4,
        };
    }
};
pub const PLLSAI1RConf = enum {
    RCC_PLLR_DIV2,
    RCC_PLLR_DIV4,
    RCC_PLLR_DIV6,
    RCC_PLLR_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLR_DIV2 => 2,
            .RCC_PLLR_DIV8 => 8,
            .RCC_PLLR_DIV6 => 6,
            .RCC_PLLR_DIV4 => 4,
        };
    }
};
pub const PLLSAI2NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLLSAI2PConf = enum {
    RCC_PLLP_DIV7,
    RCC_PLLP_DIV17,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV7 => 7,
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
    ENABLED,
    DISABLED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .ENABLED => 0,
            .DISABLED => 0,
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
    MSIRC: ?MSIClockRangeConf = null,
    SysClkSource: ?SYSCLKSourceConf = null,
    PLLSource: ?PLLSourceVirtualConf = null,
    PLLSAI1Source: ?PLLSAI1SourceConf = null,
    PLLSAI2Source: ?PLLSAI2SourceConf = null,
    PLLM: ?PLLMConf = null,
    PLLSAI1M: ?PLLSAI1MConf = null,
    PLLSAI2M: ?PLLSAI2MConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    USART1Mult: ?USART1CLockSelectionVirtualConf = null,
    USART2Mult: ?USART2CLockSelectionVirtualConf = null,
    USART3Mult: ?USART3CLockSelectionVirtualConf = null,
    UART4Mult: ?UART4CLockSelectionVirtualConf = null,
    LPUART1Mult: ?LPUART1CLockSelectionVirtualConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionVirtualConf = null,
    LPTIM2Mult: ?LPTIM2CLockSelectionVirtualConf = null,
    DFSDMMult: ?DFSDMCLockSelectionConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    CK48Mult: ?CK48CLockSelectionConf = null,
    FDCANMult: ?FDCANClockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    I2C2Mult: ?I2C2CLockSelectionConf = null,
    I2C3Mult: ?I2C3CLockSelectionConf = null,
    SAI1Mult: ?SAI1CLockSelectionConf = null,
    SAI2Mult: ?SAI2CLockSelectionConf = null,
    I2C4Mult: ?I2C4CLockSelectionConf = null,
    OCTOSPIMMult: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3Mult: ?LPTIM3CLockSelectionVirtualConf = null,
    DFSDMAudioMult: ?DFSDMAudioCLockSelectionConf = null,
    MCOMult: ?RCC_MCO1SourceVirtualConf = null,
    MCODiv: ?RCC_MCODivConf = null,
    LSCOMult: ?LSCOSource1VirtualConf = null,
    AHBPrescaler: ?AHBCLKDividerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    APB1Prescaler: ?APB1CLKDividerConf = null,
    APB2Prescaler: ?APB2CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    PLLSAI1N: ?PLLSAI1NConf = null,
    PLLSAI1P: ?PLLSAI1PConf = null,
    PLLSAI1Q: ?PLLSAI1QConf = null,
    PLLSAI1R: ?PLLSAI1RConf = null,
    PLLSAI2N: ?PLLSAI2NConf = null,
    PLLSAI2P: ?PLLSAI2PConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    MSIAutoCalibration: ?MSIAutoCalibrationConf = null,
    MSIAutoCalibrationArg: ?MSIAutoCalibrationArgConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: ?HSE_VALUEConf = null,
    LSI_VALUE: ?LSI_VALUEConf = null,
    LSIDIV: ?LSIDIVConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    MSIClockRange: ?MSIClockRangeConf = null,
    SYSCLKSource: ?SYSCLKSourceConf = null,
    PLLSourceVirtual: ?PLLSourceVirtualConf = null,
    PLLSAI1Source: ?PLLSAI1SourceConf = null,
    PLLSAI2Source: ?PLLSAI2SourceConf = null,
    PLLM: ?PLLMConf = null,
    PLLSAI1M: ?PLLSAI1MConf = null,
    PLLSAI2M: ?PLLSAI2MConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    USART1CLockSelectionVirtual: ?USART1CLockSelectionVirtualConf = null,
    USART2CLockSelectionVirtual: ?USART2CLockSelectionVirtualConf = null,
    USART3CLockSelectionVirtual: ?USART3CLockSelectionVirtualConf = null,
    UART4CLockSelectionVirtual: ?UART4CLockSelectionVirtualConf = null,
    LPUART1CLockSelectionVirtual: ?LPUART1CLockSelectionVirtualConf = null,
    LPTIM1CLockSelectionVirtual: ?LPTIM1CLockSelectionVirtualConf = null,
    LPTIM2CLockSelectionVirtual: ?LPTIM2CLockSelectionVirtualConf = null,
    DFSDMCLockSelection: ?DFSDMCLockSelectionConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    CK48CLockSelection: ?CK48CLockSelectionConf = null,
    FDCANClockSelection: ?FDCANClockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    I2C2CLockSelection: ?I2C2CLockSelectionConf = null,
    I2C3CLockSelection: ?I2C3CLockSelectionConf = null,
    SAI1CLockSelection: ?SAI1CLockSelectionConf = null,
    SAI2CLockSelection: ?SAI2CLockSelectionConf = null,
    I2C4CLockSelection: ?I2C4CLockSelectionConf = null,
    OCTOSPIMCLockSelection: ?OCTOSPIMCLockSelectionConf = null,
    LPTIM3CLockSelectionVirtual: ?LPTIM3CLockSelectionVirtualConf = null,
    DFSDMAudioCLockSelection: ?DFSDMAudioCLockSelectionConf = null,
    RCC_MCO1SourceVirtual: ?RCC_MCO1SourceVirtualConf = null,
    RCC_MCODiv: ?RCC_MCODivConf = null,
    LSCOSource1Virtual: ?LSCOSource1VirtualConf = null,
    AHBCLKDivider: ?AHBCLKDividerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    APB1CLKDivider: ?APB1CLKDividerConf = null,
    APB2CLKDivider: ?APB2CLKDividerConf = null,
    PLLN: ?PLLNConf = null,
    PLLP: ?PLLPConf = null,
    PLLQ: ?PLLQConf = null,
    PLLR: ?PLLRConf = null,
    PLLSAI1N: ?PLLSAI1NConf = null,
    PLLSAI1P: ?PLLSAI1PConf = null,
    PLLSAI1Q: ?PLLSAI1QConf = null,
    PLLSAI1R: ?PLLSAI1RConf = null,
    PLLSAI2N: ?PLLSAI2NConf = null,
    PLLSAI2P: ?PLLSAI2PConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    MSIAutoCalibration: ?MSIAutoCalibrationConf = null,
    MSIAutoCalibrationArg: ?MSIAutoCalibrationArgConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSIRC = self.LSI_VALUE,
            .LSIDIV = self.LSIDIV,
            .LSEOSC = self.LSE_VALUE,
            .MSIRC = self.MSIClockRange,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLSAI1Source = self.PLLSAI1Source,
            .PLLSAI2Source = self.PLLSAI2Source,
            .PLLM = self.PLLM,
            .PLLSAI1M = self.PLLSAI1M,
            .PLLSAI2M = self.PLLSAI2M,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelectionVirtual,
            .USART2Mult = self.USART2CLockSelectionVirtual,
            .USART3Mult = self.USART3CLockSelectionVirtual,
            .UART4Mult = self.UART4CLockSelectionVirtual,
            .LPUART1Mult = self.LPUART1CLockSelectionVirtual,
            .LPTIM1Mult = self.LPTIM1CLockSelectionVirtual,
            .LPTIM2Mult = self.LPTIM2CLockSelectionVirtual,
            .DFSDMMult = self.DFSDMCLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .CK48Mult = self.CK48CLockSelection,
            .FDCANMult = self.FDCANClockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .SAI1Mult = self.SAI1CLockSelection,
            .SAI2Mult = self.SAI2CLockSelection,
            .I2C4Mult = self.I2C4CLockSelection,
            .OCTOSPIMMult = self.OCTOSPIMCLockSelection,
            .LPTIM3Mult = self.LPTIM3CLockSelectionVirtual,
            .DFSDMAudioMult = self.DFSDMAudioCLockSelection,
            .MCOMult = self.RCC_MCO1SourceVirtual,
            .MCODiv = self.RCC_MCODiv,
            .LSCOMult = self.LSCOSource1Virtual,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLR = self.PLLR,
            .PLLSAI1N = self.PLLSAI1N,
            .PLLSAI1P = self.PLLSAI1P,
            .PLLSAI1Q = self.PLLSAI1Q,
            .PLLSAI1R = self.PLLSAI1R,
            .PLLSAI2N = self.PLLSAI2N,
            .PLLSAI2P = self.PLLSAI2P,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSICalibrationValue = self.MSICalibrationValue,
            .MSIAutoCalibration = self.MSIAutoCalibration,
            .MSIAutoCalibrationArg = self.MSIAutoCalibrationArg,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    CRSCLKoutput: ClockNode,
    HSI48RC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSIDIV: ClockNode,
    LSEOSC: ClockNode,
    MSIRC: ClockNode,
    SAI1_EXT: ClockNode,
    SAI2_EXT: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLSAI1Source: ClockNode,
    PLLSAI2Source: ClockNode,
    PLLM: ClockNode,
    PLLSAI1M: ClockNode,
    PLLSAI2M: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    LCDOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    UART4Mult: ClockNode,
    UART4output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    DFSDMMult: ClockNode,
    DFSDMoutput: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CK48Mult: ClockNode,
    CK48output: ClockNode,
    RNGoutput: ClockNode,
    FDCANMult: ClockNode,
    FDCANOutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    OCTOSPIMMult: ClockNode,
    OCTOSPIMoutput: ClockNode,
    LPTIM3Mult: ClockNode,
    LPTIM3output: ClockNode,
    DFSDMAudioMult: ClockNode,
    DFSDMAudiooutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    AHBPrescaler: ClockNode,
    PWRCLKoutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    UCPD1Output: ClockNode,
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLPoutput: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLR: ClockNode,
    PLLSAI1N: ClockNode,
    PLLSAI1P: ClockNode,
    PLLSAI1Poutput: ClockNode,
    PLLSAI1Q: ClockNode,
    PLLSAI1Qoutput: ClockNode,
    PLLSAI1R: ClockNode,
    PLLSAI1Routput: ClockNode,
    PLLSAI2N: ClockNode,
    PLLSAI2P: ClockNode,
    PLLSAI2Poutput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,
    MSIAutoCalibration: ClockNodeTypes,
    MSIAutoCalibrationArg: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSI48RCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = HSI48RCval,
        };
        const CRSCLKoutputval = ClockNodeTypes{ .output = null };
        const CRSCLKoutput: ClockNode = .{
            .name = "CRSCLKoutput",
            .Nodetype = CRSCLKoutputval,
            .parents = &[_]*const ClockNode{&HSI48RC},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 16000000,
                .limit = .{ .max = 48000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSIRC) |val| val.get() else 32000,
                .limit = .{ .max = 32960, .min = 31040 },
            },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
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
            .Nodetype = LSIDIVval,
            .parents = &[_]*const ClockNode{&LSIRC},
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
            .Nodetype = MSIRCval,
        };
        const SAI1_EXTval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .Nodetype = SAI1_EXTval,
        };
        const SAI2_EXTval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        const SAI2_EXT: ClockNode = .{
            .name = "SAI2_EXT",
            .Nodetype = SAI2_EXTval,
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
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLM) |val| val.get() else 1,
                .limit = .{ .max = 16, .min = 1 },
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLN) |val| val.get() else 8,
                .limit = .{ .max = 86, .min = 8 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLRval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLR) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = PLLRval,
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
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
                &PLLR,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PLLSAI1Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSAI1Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLLSAI1Source: ClockNode = .{
            .name = "PLLSAI1Source",
            .Nodetype = PLLSAI1Sourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLSAI2Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLLSAI2Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLLSAI2Source: ClockNode = .{
            .name = "PLLSAI2Source",
            .Nodetype = PLLSAI2Sourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLSAI1Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAI1M) |val| val.get() else 1,
                .limit = .{ .max = 16, .min = 1 },
            },
        };
        const PLLSAI1M: ClockNode = .{
            .name = "PLLSAI1M",
            .Nodetype = PLLSAI1Mval,
            .parents = &[_]*const ClockNode{&PLLSAI1Source},
        };
        const PLLSAI2Mval = ClockNodeTypes{
            .div = .{
                .value = if (config.PLLSAI2M) |val| val.get() else 1,
                .limit = .{ .max = 16, .min = 1 },
            },
        };
        const PLLSAI2M: ClockNode = .{
            .name = "PLLSAI2M",
            .Nodetype = PLLSAI2Mval,
            .parents = &[_]*const ClockNode{&PLLSAI2Source},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
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
            .Nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIDIV,
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
            .output = .{ .max = 110000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
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
            .Nodetype = APB2Prescalerval,
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
            .Nodetype = USART1Multval,

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
            .Nodetype = USART1outputval,
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
            .Nodetype = APB1Prescalerval,
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
            .Nodetype = USART2Multval,

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
            .Nodetype = USART2outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
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
            .Nodetype = USART3Multval,

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
            .Nodetype = USART3outputval,
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
            .Nodetype = UART4Multval,

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
            .Nodetype = UART4outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
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
            .Nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPUART1outputval = ClockNodeTypes{ .output = null };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = LPUART1outputval,
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
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM1outputval = ClockNodeTypes{ .output = null };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = LPTIM1outputval,
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
            .Nodetype = LPTIM2Multval,

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
            .Nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const DFSDMMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DFSDMMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const DFSDMMult: ClockNode = .{
            .name = "DFSDMMult",
            .Nodetype = DFSDMMultval,

            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &SysCLKOutput,
            },
        };
        const DFSDMoutputval = ClockNodeTypes{ .output = null };
        const DFSDMoutput: ClockNode = .{
            .name = "DFSDMoutput",
            .Nodetype = DFSDMoutputval,
            .parents = &[_]*const ClockNode{&DFSDMMult},
        };
        const PLLSAI1Nval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLSAI1N) |val| val.get() else 8,
                .limit = .{ .max = 86, .min = 8 },
            },
        };
        const PLLSAI1N: ClockNode = .{
            .name = "PLLSAI1N",
            .Nodetype = PLLSAI1Nval,
            .parents = &[_]*const ClockNode{&PLLSAI1M},
        };
        const PLLSAI1Rval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLSAI1R) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLSAI1R: ClockNode = .{
            .name = "PLLSAI1R",
            .Nodetype = PLLSAI1Rval,
            .parents = &[_]*const ClockNode{&PLLSAI1N},
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
            .Nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &PLLSAI1R,
                &SysCLKOutput,
            },
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = 110000000, .min = 0 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const PLLSAI1Qval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLSAI1Q) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLSAI1Q: ClockNode = .{
            .name = "PLLSAI1Q",
            .Nodetype = PLLSAI1Qval,
            .parents = &[_]*const ClockNode{&PLLSAI1N},
        };
        const PLLQval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLQ) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const CK48Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.CK48Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",
            .Nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &PLLSAI1Q,
                &PLLQ,
                &MSIRC,
                &HSI48RC,
            },
        };
        const CK48outputval = ClockNodeTypes{ .output = null };
        const CK48output: ClockNode = .{
            .name = "CK48output",
            .Nodetype = CK48outputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const PLLSAI1Pval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLSAI1P) |val| {
                    break :inner val.get();
                } else {
                    break :inner 7;
                }
            },
        } };
        const PLLSAI1P: ClockNode = .{
            .name = "PLLSAI1P",
            .Nodetype = PLLSAI1Pval,
            .parents = &[_]*const ClockNode{&PLLSAI1N},
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
            .Nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &PLLQ,
                &PLLSAI1P,
                &HSEOSC,
            },
        };
        const FDCANOutputval = ClockNodeTypes{ .output = null };
        const FDCANOutput: ClockNode = .{
            .name = "FDCANOutput",
            .Nodetype = FDCANOutputval,
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
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = I2C1outputval,
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
            .Nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C2outputval = ClockNodeTypes{ .output = null };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .Nodetype = I2C2outputval,
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
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C3outputval = ClockNodeTypes{ .output = null };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = I2C3outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const PLLSAI2Nval = ClockNodeTypes{
            .mul = .{
                .value = if (config.PLLSAI2N) |val| val.get() else 8,
                .limit = .{ .max = 86, .min = 8 },
            },
        };
        const PLLSAI2N: ClockNode = .{
            .name = "PLLSAI2N",
            .Nodetype = PLLSAI2Nval,
            .parents = &[_]*const ClockNode{&PLLSAI2M},
        };
        const PLLSAI2Pval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLSAI2P) |val| {
                    break :inner val.get();
                } else {
                    break :inner 7;
                }
            },
        } };
        const PLLSAI2P: ClockNode = .{
            .name = "PLLSAI2P",
            .Nodetype = PLLSAI2Pval,
            .parents = &[_]*const ClockNode{&PLLSAI2N},
        };
        const PLLPval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.PLLP) |val| {
                    break :inner val.get();
                } else {
                    break :inner 7;
                }
            },
        } };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = PLLPval,
            .parents = &[_]*const ClockNode{&PLLN},
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
            .Nodetype = SAI1Multval,

            .parents = &[_]*const ClockNode{
                &PLLSAI1P,
                &PLLSAI2P,
                &PLLP,
                &SAI1_EXT,
                &HSIRC,
            },
        };
        const SAI1outputval = ClockNodeTypes{ .output = null };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = SAI1outputval,
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
            .Nodetype = SAI2Multval,

            .parents = &[_]*const ClockNode{
                &PLLSAI1P,
                &PLLSAI2P,
                &PLLP,
                &SAI2_EXT,
                &HSIRC,
            },
        };
        const SAI2outputval = ClockNodeTypes{ .output = null };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = SAI2outputval,
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
            .Nodetype = I2C4Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const I2C4outputval = ClockNodeTypes{ .output = null };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = I2C4outputval,
            .parents = &[_]*const ClockNode{&I2C4Mult},
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
            .Nodetype = OCTOSPIMMultval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &SysCLKOutput,
                &PLLQ,
            },
        };
        const OCTOSPIMoutputval = ClockNodeTypes{ .output = null };
        const OCTOSPIMoutput: ClockNode = .{
            .name = "OCTOSPIMoutput",
            .Nodetype = OCTOSPIMoutputval,
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
            .Nodetype = LPTIM3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIDIV,
                &HSIRC,
                &LSEOSC,
            },
        };
        const LPTIM3outputval = ClockNodeTypes{ .output = null };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .Nodetype = LPTIM3outputval,
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const DFSDMAudioMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DFSDMAudioMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const DFSDMAudioMult: ClockNode = .{
            .name = "DFSDMAudioMult",
            .Nodetype = DFSDMAudioMultval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &SAI1Mult,
            },
        };
        const DFSDMAudiooutputval = ClockNodeTypes{ .output = null };
        const DFSDMAudiooutput: ClockNode = .{
            .name = "DFSDMAudiooutput",
            .Nodetype = DFSDMAudiooutputval,
            .parents = &[_]*const ClockNode{&DFSDMAudioMult},
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
                &LSIDIV,
                &HSEOSC,
                &HSIRC,
                &PLLR,
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
                &LSIDIV,
                &LSEOSC,
            },
        };
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = LSCOOutputval,
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const PWRCLKoutputval = ClockNodeTypes{ .output = null };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = PWRCLKoutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = HCLKOutputval,
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
            .Nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 110000000, .min = 0 },
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
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 110000000, .min = 0 },
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
        const UCPD1Outputval = ClockNodeTypes{ .output = null };
        const UCPD1Output: ClockNode = .{
            .name = "UCPD1Output",
            .Nodetype = UCPD1Outputval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const PLLPoutputval = ClockNodeTypes{ .output = null };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .Nodetype = PLLPoutputval,
            .parents = &[_]*const ClockNode{&PLLP},
        };
        const PLLQoutputval = ClockNodeTypes{ .output = null };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLLQ},
        };
        const PLLSAI1Poutputval = ClockNodeTypes{ .output = null };
        const PLLSAI1Poutput: ClockNode = .{
            .name = "PLLSAI1Poutput",
            .Nodetype = PLLSAI1Poutputval,
            .parents = &[_]*const ClockNode{&PLLSAI1P},
        };
        const PLLSAI1Qoutputval = ClockNodeTypes{ .output = null };
        const PLLSAI1Qoutput: ClockNode = .{
            .name = "PLLSAI1Qoutput",
            .Nodetype = PLLSAI1Qoutputval,
            .parents = &[_]*const ClockNode{&PLLSAI1Q},
        };
        const PLLSAI1Routputval = ClockNodeTypes{ .output = null };
        const PLLSAI1Routput: ClockNode = .{
            .name = "PLLSAI1Routput",
            .Nodetype = PLLSAI1Routputval,
            .parents = &[_]*const ClockNode{&PLLSAI1R},
        };
        const PLLSAI2Poutputval = ClockNodeTypes{ .output = null };
        const PLLSAI2Poutput: ClockNode = .{
            .name = "PLLSAI2Poutput",
            .Nodetype = PLLSAI2Poutputval,
            .parents = &[_]*const ClockNode{&PLLSAI2P},
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
                .value = if (config.HSICalibrationValue) |val| val.get() else 64,
                .limit = .{ .max = 127, .min = 0 },
            },
        };
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 0,
                .limit = .{ .max = 255, .min = 0 },
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
            .MSIRC = MSIRC,
            .SAI1_EXT = SAI1_EXT,
            .SAI2_EXT = SAI2_EXT,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLSAI1Source = PLLSAI1Source,
            .PLLSAI2Source = PLLSAI2Source,
            .PLLM = PLLM,
            .PLLSAI1M = PLLSAI1M,
            .PLLSAI2M = PLLSAI2M,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .LCDOutput = LCDOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .UART4Mult = UART4Mult,
            .UART4output = UART4output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .DFSDMMult = DFSDMMult,
            .DFSDMoutput = DFSDMoutput,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CK48Mult = CK48Mult,
            .CK48output = CK48output,
            .RNGoutput = RNGoutput,
            .FDCANMult = FDCANMult,
            .FDCANOutput = FDCANOutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .OCTOSPIMMult = OCTOSPIMMult,
            .OCTOSPIMoutput = OCTOSPIMoutput,
            .LPTIM3Mult = LPTIM3Mult,
            .LPTIM3output = LPTIM3output,
            .DFSDMAudioMult = DFSDMAudioMult,
            .DFSDMAudiooutput = DFSDMAudiooutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .AHBPrescaler = AHBPrescaler,
            .PWRCLKoutput = PWRCLKoutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .UCPD1Output = UCPD1Output,
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLPoutput = PLLPoutput,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLR = PLLR,
            .PLLSAI1N = PLLSAI1N,
            .PLLSAI1P = PLLSAI1P,
            .PLLSAI1Poutput = PLLSAI1Poutput,
            .PLLSAI1Q = PLLSAI1Q,
            .PLLSAI1Qoutput = PLLSAI1Qoutput,
            .PLLSAI1R = PLLSAI1R,
            .PLLSAI1Routput = PLLSAI1Routput,
            .PLLSAI2N = PLLSAI2N,
            .PLLSAI2P = PLLSAI2P,
            .PLLSAI2Poutput = PLLSAI2Poutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSICalibrationValue = MSICalibrationValueval,
            .MSIAutoCalibration = MSIAutoCalibrationval,
            .MSIAutoCalibrationArg = MSIAutoCalibrationArgval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.CRSCLKoutput.get_comptime();
        _ = self.RTCOutput.get_comptime();
        _ = self.IWDGOutput.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.UART4output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.DFSDMoutput.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.CK48output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.FDCANOutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.OCTOSPIMoutput.get_comptime();
        _ = self.LPTIM3output.get_comptime();
        _ = self.DFSDMAudiooutput.get_comptime();
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
    }
};
