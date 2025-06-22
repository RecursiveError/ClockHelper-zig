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

    pub fn max() f32 {
        return 32000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const LSISource1Conf = enum {
    RCC_LSCOSOURCE_LSI1,
    RCC_LSCOSOURCE_LSI2,
};
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
        return 1000;
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
            .RCC_MSIRANGE_0 => 100,
            .RCC_MSIRANGE_1 => 200,
            .RCC_MSIRANGE_2 => 400,
            .RCC_MSIRANGE_3 => 800,
            .RCC_MSIRANGE_4 => 1000,
            .RCC_MSIRANGE_5 => 2000,
            .RCC_MSIRANGE_6 => 4000,
            .RCC_MSIRANGE_7 => 8000,
            .RCC_MSIRANGE_8 => 16000,
            .RCC_MSIRANGE_9 => 24000,
            .RCC_MSIRANGE_10 => 32000,
            .RCC_MSIRANGE_11 => 48000,
        };
    }
};
pub const HCLKRFclockSelectionVirtualConf = enum {
    RCC_HCLKRFCLKSOURCE_HSE,
    RCC_HCLKRFCLKSOURCE_HSI,
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK1,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,
};
pub const LSCOSource1Conf = enum {
    RCC_LSCOSOURCE_LSI,
    RCC_LSCOSOURCE_LSE,
};
pub const HSEPRESConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 2;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const SYSCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,
};
pub const PLLMConf = enum {
    RCC_PLLM_DIV1,
    RCC_PLLM_DIV2,
    RCC_PLLM_DIV3,
    RCC_PLLM_DIV4,
    RCC_PLLM_DIV5,
    RCC_PLLM_DIV6,
    RCC_PLLM_DIV7,
    RCC_PLLM_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLM_DIV1 => 1,
            .RCC_PLLM_DIV2 => 2,
            .RCC_PLLM_DIV3 => 3,
            .RCC_PLLM_DIV4 => 4,
            .RCC_PLLM_DIV5 => 5,
            .RCC_PLLM_DIV6 => 6,
            .RCC_PLLM_DIV7 => 7,
            .RCC_PLLM_DIV8 => 8,
        };
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,
};
pub const USART1CLockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
};
pub const LPUART1CLockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK1,
    RCC_LPUART1CLKSOURCE_SYSCLK,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,
};
pub const SMPSCLockSelectionVirtualConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
    }
};
pub const SMPSDividerConf = enum {
    @"1",
    @"2",
    @"3",
    @"4",
    @"6",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"3" => 3,
            .@"4" => 4,
            .@"6" => 6,
        };
    }
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_HSI,
    RCC_LPTIM2CLKSOURCE_LSE,
};
pub const RFWKPClockSelectionConf = enum {
    RCC_RFWKPCLKSOURCE_HSE_DIV1024,
    RCC_RFWKPCLKSOURCE_LSE,
    RCC_RFWKPCLKSOURCE_LSI,
};
pub const CK48CLockSelectionConf = enum {
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_MSI,
};
pub const RNGCLockSelectionConf = enum {
    RCC_RNGCLKSOURCE_CLK48,
    RCC_RNGCLKSOURCE_LSI,
    RCC_RNGCLKSOURCE_LSE,
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_SYSCLK,
    RCC_I2C1CLKSOURCE_HSI,
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_HSI,
    RCC_ADCCLKSOURCE_PLL,
    RCC_ADCCLKSOURCE_SYSCLK,
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI1,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_MSI,
};
pub const RCC_MCODivConf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_4,
    RCC_MCODIV_8,
    RCC_MCODIV_16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_16 => 16,
        };
    }
};
pub const AHB3CLKDividerConf = enum {
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
pub const AHB2CLKDividerConf = enum {
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
pub const Cortex2_DivConf = enum {
    SYSTICK_CLKSOURCE_HCLK,
    SYSTICK_CLKSOURCE_HCLK_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .SYSTICK_CLKSOURCE_HCLK => 1,
            .SYSTICK_CLKSOURCE_HCLK_DIV8 => 8,
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
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 127;
    }

    pub fn min() f32 {
        return 6;
    }
};
pub const PLLPConf = enum {
    RCC_PLLP_DIV2,
    RCC_PLLP_DIV3,
    RCC_PLLP_DIV4,
    RCC_PLLP_DIV5,
    RCC_PLLP_DIV6,
    RCC_PLLP_DIV7,
    RCC_PLLP_DIV8,
    RCC_PLLP_DIV9,
    RCC_PLLP_DIV10,
    RCC_PLLP_DIV11,
    RCC_PLLP_DIV12,
    RCC_PLLP_DIV13,
    RCC_PLLP_DIV14,
    RCC_PLLP_DIV15,
    RCC_PLLP_DIV16,
    RCC_PLLP_DIV17,
    RCC_PLLP_DIV18,
    RCC_PLLP_DIV19,
    RCC_PLLP_DIV20,
    RCC_PLLP_DIV21,
    RCC_PLLP_DIV22,
    RCC_PLLP_DIV23,
    RCC_PLLP_DIV24,
    RCC_PLLP_DIV25,
    RCC_PLLP_DIV26,
    RCC_PLLP_DIV27,
    RCC_PLLP_DIV28,
    RCC_PLLP_DIV29,
    RCC_PLLP_DIV30,
    RCC_PLLP_DIV31,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLP_DIV2 => 2,
            .RCC_PLLP_DIV3 => 3,
            .RCC_PLLP_DIV4 => 4,
            .RCC_PLLP_DIV5 => 5,
            .RCC_PLLP_DIV6 => 6,
            .RCC_PLLP_DIV7 => 7,
            .RCC_PLLP_DIV8 => 8,
            .RCC_PLLP_DIV9 => 9,
            .RCC_PLLP_DIV10 => 10,
            .RCC_PLLP_DIV11 => 11,
            .RCC_PLLP_DIV12 => 12,
            .RCC_PLLP_DIV13 => 13,
            .RCC_PLLP_DIV14 => 14,
            .RCC_PLLP_DIV15 => 15,
            .RCC_PLLP_DIV16 => 16,
            .RCC_PLLP_DIV17 => 17,
            .RCC_PLLP_DIV18 => 18,
            .RCC_PLLP_DIV19 => 19,
            .RCC_PLLP_DIV20 => 20,
            .RCC_PLLP_DIV21 => 21,
            .RCC_PLLP_DIV22 => 22,
            .RCC_PLLP_DIV23 => 23,
            .RCC_PLLP_DIV24 => 24,
            .RCC_PLLP_DIV25 => 25,
            .RCC_PLLP_DIV26 => 26,
            .RCC_PLLP_DIV27 => 27,
            .RCC_PLLP_DIV28 => 28,
            .RCC_PLLP_DIV29 => 29,
            .RCC_PLLP_DIV30 => 30,
            .RCC_PLLP_DIV31 => 31,
        };
    }
};
pub const PLLQConf = enum {
    RCC_PLLQ_DIV2,
    RCC_PLLQ_DIV3,
    RCC_PLLQ_DIV4,
    RCC_PLLQ_DIV5,
    RCC_PLLQ_DIV6,
    RCC_PLLQ_DIV7,
    RCC_PLLQ_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLQ_DIV2 => 2,
            .RCC_PLLQ_DIV3 => 3,
            .RCC_PLLQ_DIV4 => 4,
            .RCC_PLLQ_DIV5 => 5,
            .RCC_PLLQ_DIV6 => 6,
            .RCC_PLLQ_DIV7 => 7,
            .RCC_PLLQ_DIV8 => 8,
        };
    }
};
pub const PLLRConf = enum {
    RCC_PLLR_DIV2,
    RCC_PLLR_DIV3,
    RCC_PLLR_DIV4,
    RCC_PLLR_DIV5,
    RCC_PLLR_DIV6,
    RCC_PLLR_DIV7,
    RCC_PLLR_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLLR_DIV2 => 2,
            .RCC_PLLR_DIV3 => 3,
            .RCC_PLLR_DIV4 => 4,
            .RCC_PLLR_DIV5 => 5,
            .RCC_PLLR_DIV6 => 6,
            .RCC_PLLR_DIV7 => 7,
            .RCC_PLLR_DIV8 => 8,
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
pub const MSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 255;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const MSIAutoCalibrationConf = enum {
    DISABLED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DISABLED => 0,
        };
    }
};
pub const MSIAutoCalibrationArgConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const MSIOscStateConf = enum {
    ENABLED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .ENABLED => 0,
        };
    }
};
pub const HSIOscStateConf = enum {
    ENABLED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .ENABLED => 0,
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
    HSEOSC: HSE_VALUEConf = @enumFromInt(8000000),
    LSIMult: LSISource1Conf = .RCC_LSCOSOURCE_LSI1,
    LSEOSC: LSE_VALUEConf = @enumFromInt(32768),
    MSIRC: MSIClockRangeConf = .RCC_MSIRANGE_6,
    HCLKRFMult: HCLKRFclockSelectionVirtualConf = .RCC_HCLKRFCLKSOURCE_HSI,
    LPTIM1Mult: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK1,
    LSCOMult: LSCOSource1Conf = .RCC_LSCOSOURCE_LSI,
    HSEPRESC: HSEPRESConf = @enumFromInt(1),
    SysClkSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_MSI,
    PLLSource: PLLSourceVirtualConf = .RCC_PLLSOURCE_MSI,
    PLLM: PLLMConf = .RCC_PLLM_DIV1,
    RTCClkSource: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1Mult: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    LPUART1Mult: LPUART1CLockSelectionConf = .RCC_LPUART1CLKSOURCE_PCLK1,
    SMPSMult: SMPSCLockSelectionVirtualConf = @enumFromInt(12297829382473034410),
    SMPSDivider: SMPSDividerConf = .@"2",
    LPTIM2Mult: LPTIM2CLockSelectionConf = .RCC_LPTIM2CLKSOURCE_PCLK,
    RFWKPClkSource: RFWKPClockSelectionConf = .RCC_RFWKPCLKSOURCE_LSI,
    CK48Mult: CK48CLockSelectionConf = .RCC_USBCLKSOURCE_MSI,
    RNGMult: RNGCLockSelectionConf = .RCC_RNGCLKSOURCE_LSI,
    I2C1Mult: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    ADCMult: ADCCLockSelectionConf = .RCC_ADCCLKSOURCE_HSI,
    MCOMult: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_SYSCLK,
    MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    AHB3Prescaler: AHB3CLKDividerConf = .RCC_SYSCLK_DIV1,
    AHB2Prescaler: AHB2CLKDividerConf = .RCC_SYSCLK_DIV1,
    Cortex2Prescaler: Cortex2_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    AHBPrescaler: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    CortexPrescaler: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1Prescaler: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2Prescaler: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .RCC_PLLP_DIV2,
    PLLQ: PLLQConf = .RCC_PLLQ_DIV2,
    PLLR: PLLRConf = .RCC_PLLR_DIV2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    MSICalibrationValue: MSICalibrationValueConf = @enumFromInt(0),
    MSIAutoCalibration: MSIAutoCalibrationConf = .DISABLED,
    MSIAutoCalibrationArg: MSIAutoCalibrationArgConf = .null,
    MSIOscState: MSIOscStateConf = .ENABLED,
    HSIOscState: HSIOscStateConf = .ENABLED,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: HSE_VALUEConf = @enumFromInt(8000000),
    LSISource1: LSISource1Conf = .RCC_LSCOSOURCE_LSI1,
    LSE_VALUE: LSE_VALUEConf = @enumFromInt(32768),
    MSIClockRange: MSIClockRangeConf = .RCC_MSIRANGE_6,
    HCLKRFclockSelectionVirtual: HCLKRFclockSelectionVirtualConf = .RCC_HCLKRFCLKSOURCE_HSI,
    LPTIM1CLockSelection: LPTIM1CLockSelectionConf = .RCC_LPTIM1CLKSOURCE_PCLK1,
    LSCOSource1: LSCOSource1Conf = .RCC_LSCOSOURCE_LSI,
    HSEPRES: HSEPRESConf = @enumFromInt(1),
    SYSCLKSource: SYSCLKSourceConf = .RCC_SYSCLKSOURCE_MSI,
    PLLSourceVirtual: PLLSourceVirtualConf = .RCC_PLLSOURCE_MSI,
    PLLM: PLLMConf = .RCC_PLLM_DIV1,
    RTCClockSelection: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1CLockSelection: USART1CLockSelectionConf = .RCC_USART1CLKSOURCE_PCLK2,
    LPUART1CLockSelection: LPUART1CLockSelectionConf = .RCC_LPUART1CLKSOURCE_PCLK1,
    SMPSCLockSelectionVirtual: SMPSCLockSelectionVirtualConf = @enumFromInt(12297829382473034410),
    SMPSDivider: SMPSDividerConf = .@"2",
    LPTIM2CLockSelection: LPTIM2CLockSelectionConf = .RCC_LPTIM2CLKSOURCE_PCLK,
    RFWKPClockSelection: RFWKPClockSelectionConf = .RCC_RFWKPCLKSOURCE_LSI,
    CK48CLockSelection: CK48CLockSelectionConf = .RCC_USBCLKSOURCE_MSI,
    RNGCLockSelection: RNGCLockSelectionConf = .RCC_RNGCLKSOURCE_LSI,
    I2C1CLockSelection: I2C1CLockSelectionConf = .RCC_I2C1CLKSOURCE_PCLK1,
    ADCCLockSelection: ADCCLockSelectionConf = .RCC_ADCCLKSOURCE_HSI,
    RCC_MCO1Source: RCC_MCO1SourceConf = .RCC_MCO1SOURCE_SYSCLK,
    RCC_MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    AHB3CLKDivider: AHB3CLKDividerConf = .RCC_SYSCLK_DIV1,
    AHB2CLKDivider: AHB2CLKDividerConf = .RCC_SYSCLK_DIV1,
    Cortex2_Div: Cortex2_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    AHBCLKDivider: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    Cortex_Div: Cortex_DivConf = .SYSTICK_CLKSOURCE_HCLK,
    APB1CLKDivider: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2CLKDivider: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    PLLN: PLLNConf = @enumFromInt(8),
    PLLP: PLLPConf = .RCC_PLLP_DIV2,
    PLLQ: PLLQConf = .RCC_PLLQ_DIV2,
    PLLR: PLLRConf = .RCC_PLLR_DIV2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    MSICalibrationValue: MSICalibrationValueConf = @enumFromInt(0),
    MSIAutoCalibration: MSIAutoCalibrationConf = .DISABLED,
    MSIAutoCalibrationArg: MSIAutoCalibrationArgConf = .null,
    MSIOscState: MSIOscStateConf = .ENABLED,
    HSIOscState: HSIOscStateConf = .ENABLED,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .LSIMult = self.LSISource1,
            .LSEOSC = self.LSE_VALUE,
            .MSIRC = self.MSIClockRange,
            .HCLKRFMult = self.HCLKRFclockSelectionVirtual,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LSCOMult = self.LSCOSource1,
            .HSEPRESC = self.HSEPRES,
            .SysClkSource = self.SYSCLKSource,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelection,
            .LPUART1Mult = self.LPUART1CLockSelection,
            .SMPSMult = self.SMPSCLockSelectionVirtual,
            .SMPSDivider = self.SMPSDivider,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .RFWKPClkSource = self.RFWKPClockSelection,
            .CK48Mult = self.CK48CLockSelection,
            .RNGMult = self.RNGCLockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .ADCMult = self.ADCCLockSelection,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv,
            .AHB3Prescaler = self.AHB3CLKDivider,
            .AHB2Prescaler = self.AHB2CLKDivider,
            .Cortex2Prescaler = self.Cortex2_Div,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexPrescaler = self.Cortex_Div,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .PLLN = self.PLLN,
            .PLLP = self.PLLP,
            .PLLQ = self.PLLQ,
            .PLLR = self.PLLR,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSICalibrationValue = self.MSICalibrationValue,
            .MSIAutoCalibration = self.MSIAutoCalibration,
            .MSIAutoCalibrationArg = self.MSIAutoCalibrationArg,
            .MSIOscState = self.MSIOscState,
            .HSIOscState = self.HSIOscState,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSI2RC: ClockNode,
    LSIMult: ClockNode,
    LSEOSC: ClockNode,
    MSIRC: ClockNode,
    HCLKRFMultDiv: ClockNode,
    HCLKRFMult: ClockNode,
    HCLKRFOutput: ClockNode,
    APB3Output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    HSEPRESC: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    LCDOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    SMPSMult: ClockNode,
    SMPSDivider: ClockNode,
    SMPSDiv2: ClockNode,
    SMPSoutput: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    HSERFWKPDevisor: ClockNode,
    RFWKPClkSource: ClockNode,
    RFWKPOutput: ClockNode,
    CK48Mult: ClockNode,
    RNGDiv: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    AHB3Prescaler: ClockNode,
    AHB3Output: ClockNode,
    AHB2Prescaler: ClockNode,
    FCLK2CortexOutput: ClockNode,
    AHB2Output: ClockNode,
    Cortex2Prescaler: ClockNode,
    Cortex2SysOutput: ClockNode,
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
    PLLN: ClockNode,
    PLLP: ClockNode,
    PLLPoutput: ClockNode,
    PLLQ: ClockNode,
    PLLQoutput: ClockNode,
    PLLR: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,
    MSIAutoCalibration: ClockNodeTypes,
    MSIAutoCalibrationArg: ClockNodeTypes,
    MSIOscState: ClockNodeTypes,
    HSIOscState: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 16000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
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
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSI2RCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSI2RC: ClockNode = .{
            .name = "LSI2RC",
            .Nodetype = LSI2RCval,
        };
        const LSIMultval = ClockNodeTypes{ .multi = @intFromEnum(config.LSIMult) };
        const LSIMult: ClockNode = .{
            .name = "LSIMult",
            .Nodetype = LSIMultval,

            .parents = &[_]*const ClockNode{
                &LSIRC,
                &LSI2RC,
            },
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 1000 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const MSIRCval = ClockNodeTypes{
            .source = .{ .value = config.MSIRC.get() },
        };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = MSIRCval,
        };
        const HCLKRFMultDivval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const HCLKRFMultDiv: ClockNode = .{
            .name = "HCLKRFMultDiv",
            .Nodetype = HCLKRFMultDivval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const HCLKRFMultval = ClockNodeTypes{ .multi = @intFromEnum(config.HCLKRFMult) };
        const HCLKRFMult: ClockNode = .{
            .name = "HCLKRFMult",
            .Nodetype = HCLKRFMultval,

            .parents = &[_]*const ClockNode{
                &HCLKRFMultDiv,
                &HSIRC,
            },
        };
        const HCLKRFOutputval = ClockNodeTypes{ .output = null };
        const HCLKRFOutput: ClockNode = .{
            .name = "HCLKRFOutput",
            .Nodetype = HCLKRFOutputval,
            .parents = &[_]*const ClockNode{&HCLKRFMult},
        };
        const APB3Outputval = ClockNodeTypes{ .output = null };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = APB3Outputval,
            .parents = &[_]*const ClockNode{&HCLKRFMult},
        };
        const HSEPRESCval = ClockNodeTypes{
            .div = .{
                .value = config.HSEPRESC.get(),
                .limit = .{ .max = 2, .min = 1 },
            },
        };
        const HSEPRESC: ClockNode = .{
            .name = "HSEPRESC",
            .Nodetype = HSEPRESCval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEPRESC,
            },
        };
        const PLLMval = ClockNodeTypes{ .div = .{ .value = config.PLLM.get() } };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLNval = ClockNodeTypes{
            .mul = .{
                .value = config.PLLN.get(),
                .limit = .{ .max = 127, .min = 6 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{&PLLM},
        };
        const PLLRval = ClockNodeTypes{ .div = .{ .value = config.PLLR.get() } };
        const PLLR: ClockNode = .{
            .name = "PLLR",
            .Nodetype = PLLRval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEPRESC,
                &PLLR,
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
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB1Prescaler.get() } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const LPTIM1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM1Mult) };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIRC,
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
        const LSCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.LSCOMult) };
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
        const APB2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB2Prescaler.get() } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const USART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART1Mult) };
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
        const LPUART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPUART1Mult) };
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
        const SMPSMultval = blk: {
            if (HSEOSCval.num_val() == 32000000) {
                break :blk ClockNodeTypes{ .multi = @intFromEnum(config.SMPSMult) };
            } else {
                break :blk ClockNodeTypes{ .multi = @intFromEnum(config.SMPSMult) };
            }
        };
        const SMPSMult: ClockNode = .{
            .name = "SMPSMult",
            .Nodetype = SMPSMultval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSEOSC,
                &HSIRC,
            },
        };
        const SMPSDividerval = ClockNodeTypes{ .div = .{ .value = config.SMPSDivider.get() } };
        const SMPSDivider: ClockNode = .{
            .name = "SMPSDivider",
            .Nodetype = SMPSDividerval,
            .parents = &[_]*const ClockNode{&SMPSMult},
        };
        const SMPSDiv2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const SMPSDiv2: ClockNode = .{
            .name = "SMPSDiv2",
            .Nodetype = SMPSDiv2val,
            .parents = &[_]*const ClockNode{&SMPSDivider},
        };
        const SMPSoutputval = ClockNodeTypes{ .output = null };
        const SMPSoutput: ClockNode = .{
            .name = "SMPSoutput",
            .Nodetype = SMPSoutputval,
            .parents = &[_]*const ClockNode{&SMPSDiv2},
        };
        const LPTIM2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM2Mult) };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .Nodetype = LPTIM2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &LSIRC,
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
        const HSERFWKPDevisorval = ClockNodeTypes{
            .div = .{ .value = 1024 },
        };
        const HSERFWKPDevisor: ClockNode = .{
            .name = "HSERFWKPDevisor",
            .Nodetype = HSERFWKPDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RFWKPClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.RFWKPClkSource) };
        const RFWKPClkSource: ClockNode = .{
            .name = "RFWKPClkSource",
            .Nodetype = RFWKPClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERFWKPDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RFWKPOutputval = ClockNodeTypes{ .output = null };
        const RFWKPOutput: ClockNode = .{
            .name = "RFWKPOutput",
            .Nodetype = RFWKPOutputval,
            .parents = &[_]*const ClockNode{&RFWKPClkSource},
        };
        const PLLQval = ClockNodeTypes{ .div = .{ .value = config.PLLQ.get() } };
        const PLLQ: ClockNode = .{
            .name = "PLLQ",
            .Nodetype = PLLQval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const CK48Multval = ClockNodeTypes{ .multi = @intFromEnum(config.CK48Mult) };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",
            .Nodetype = CK48Multval,

            .parents = &[_]*const ClockNode{
                &PLLQ,
                &MSIRC,
            },
        };
        const RNGDivval = ClockNodeTypes{
            .div = .{ .value = 3 },
        };
        const RNGDiv: ClockNode = .{
            .name = "RNGDiv",
            .Nodetype = RNGDivval,
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const RNGMultval = ClockNodeTypes{ .multi = @intFromEnum(config.RNGMult) };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",
            .Nodetype = RNGMultval,

            .parents = &[_]*const ClockNode{
                &RNGDiv,
                &LSIRC,
                &LSEOSC,
            },
        };
        const RNGoutputval = ClockNodeTypes{
            .output = .{ .max = 48000000, .min = 0 },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const I2C1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C1Mult) };
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
        const PLLPval = ClockNodeTypes{ .div = .{ .value = config.PLLP.get() } };
        const PLLP: ClockNode = .{
            .name = "PLLP",
            .Nodetype = PLLPval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const ADCMultval = ClockNodeTypes{ .multi = @intFromEnum(config.ADCMult) };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .Nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &PLLP,
                &SysCLKOutput,
            },
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 1400000 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const MCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.MCOMult) };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
                &HSEOSC,
                &HSIRC,
                &PLLR,
                &SysCLKOutput,
                &MSIRC,
            },
        };
        const MCODivval = ClockNodeTypes{ .div = .{ .value = config.MCODiv.get() } };
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
        const AHB3Prescalerval = ClockNodeTypes{ .div = .{ .value = config.AHB3Prescaler.get() } };
        const AHB3Prescaler: ClockNode = .{
            .name = "AHB3Prescaler",
            .Nodetype = AHB3Prescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHB3Outputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const AHB3Output: ClockNode = .{
            .name = "AHB3Output",
            .Nodetype = AHB3Outputval,
            .parents = &[_]*const ClockNode{&AHB3Prescaler},
        };
        const AHB2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.AHB2Prescaler.get() } };
        const AHB2Prescaler: ClockNode = .{
            .name = "AHB2Prescaler",
            .Nodetype = AHB2Prescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const FCLK2CortexOutputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const FCLK2CortexOutput: ClockNode = .{
            .name = "FCLK2CortexOutput",
            .Nodetype = FCLK2CortexOutputval,
            .parents = &[_]*const ClockNode{&AHB2Prescaler},
        };
        const AHB2Outputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const AHB2Output: ClockNode = .{
            .name = "AHB2Output",
            .Nodetype = AHB2Outputval,
            .parents = &[_]*const ClockNode{&AHB2Prescaler},
        };
        const Cortex2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.Cortex2Prescaler.get() } };
        const Cortex2Prescaler: ClockNode = .{
            .name = "Cortex2Prescaler",
            .Nodetype = Cortex2Prescalerval,
            .parents = &[_]*const ClockNode{&AHB2Prescaler},
        };
        const Cortex2SysOutputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const Cortex2SysOutput: ClockNode = .{
            .name = "Cortex2SysOutput",
            .Nodetype = Cortex2SysOutputval,
            .parents = &[_]*const ClockNode{&Cortex2Prescaler},
        };
        const PWRCLKoutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
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
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
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
            .output = .{ .max = 64000000, .min = 0 },
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
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.MSICalibrationValue.get(),
                .limit = .{ .max = 255, .min = 0 },
            },
        };
        const MSIAutoCalibrationval = ClockNodeTypes{
            .source = .{ .value = config.MSIAutoCalibration.get() },
        };
        const MSIAutoCalibrationArgval = ClockNodeTypes{
            .source = .{ .value = config.MSIAutoCalibrationArg.get() },
        };
        const MSIOscStateval = ClockNodeTypes{
            .source = .{ .value = config.MSIOscState.get() },
        };
        const HSIOscStateval = ClockNodeTypes{
            .source = .{ .value = config.HSIOscState.get() },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSI2RC = LSI2RC,
            .LSIMult = LSIMult,
            .LSEOSC = LSEOSC,
            .MSIRC = MSIRC,
            .HCLKRFMultDiv = HCLKRFMultDiv,
            .HCLKRFMult = HCLKRFMult,
            .HCLKRFOutput = HCLKRFOutput,
            .APB3Output = APB3Output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .HSEPRESC = HSEPRESC,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .LCDOutput = LCDOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .SMPSMult = SMPSMult,
            .SMPSDivider = SMPSDivider,
            .SMPSDiv2 = SMPSDiv2,
            .SMPSoutput = SMPSoutput,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .HSERFWKPDevisor = HSERFWKPDevisor,
            .RFWKPClkSource = RFWKPClkSource,
            .RFWKPOutput = RFWKPOutput,
            .CK48Mult = CK48Mult,
            .RNGDiv = RNGDiv,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .AHB3Prescaler = AHB3Prescaler,
            .AHB3Output = AHB3Output,
            .AHB2Prescaler = AHB2Prescaler,
            .FCLK2CortexOutput = FCLK2CortexOutput,
            .AHB2Output = AHB2Output,
            .Cortex2Prescaler = Cortex2Prescaler,
            .Cortex2SysOutput = Cortex2SysOutput,
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
            .PLLN = PLLN,
            .PLLP = PLLP,
            .PLLPoutput = PLLPoutput,
            .PLLQ = PLLQ,
            .PLLQoutput = PLLQoutput,
            .PLLR = PLLR,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSICalibrationValue = MSICalibrationValueval,
            .MSIAutoCalibration = MSIAutoCalibrationval,
            .MSIAutoCalibrationArg = MSIAutoCalibrationArgval,
            .MSIOscState = MSIOscStateval,
            .HSIOscState = HSIOscStateval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.LPTIM1output.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.RFWKPOutput.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.AHB3Output.get_comptime();
        _ = self.FCLK2CortexOutput.get_comptime();
        _ = self.AHB2Output.get_comptime();
        _ = self.Cortex2SysOutput.get_comptime();
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
