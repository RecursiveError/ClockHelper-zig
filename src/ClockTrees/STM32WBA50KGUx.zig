const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HseDivConf = enum {
    RCC_HSE_DIV1,
    RCC_HSE_DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSE_DIV1 => 1,
            .RCC_HSE_DIV2 => 2,
        };
    }
};
pub const LSI_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32600;
    }

    pub fn min() f32 {
        return 31400;
    }
};
pub const LSIDIVConf = enum {
    RCC_LSI_DIV1,
    RCC_LSI_DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_LSI_DIV1 => 1,
            .RCC_LSI_DIV128 => 128,
        };
    }
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
pub const RSTClockSelectionVirtualConf = enum {
    RCC_RADIOSTCLKSOURCE_HSE_DIV1000,
    RCC_RADIOSTCLKSOURCE_LSE,
    RCC_RADIOSTCLKSOURCE_LSI,
};
pub const SYSCLKSourceVirtualConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_PLLCLK,
};
pub const PLLSourceVirtualConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_HSE,
};
pub const PLLMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const RTCClockSelectionConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV32,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,
};
pub const USART1CLockSelectionVirtualConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_SYSCLK,
    RCC_USART1CLKSOURCE_HSI,
    RCC_USART1CLKSOURCE_LSE,
};
pub const LPUART1CLockSelectionVirtualConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK7,
    RCC_LPUART1CLKSOURCE_SYSCLK,
    RCC_LPUART1CLKSOURCE_HSI,
    RCC_LPUART1CLKSOURCE_LSE,
};
pub const LPTIM1CLockSelectionVirtualConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK7,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_HSI,
    RCC_LPTIM1CLKSOURCE_LSE,
};
pub const ADCCLockSelectionVirtualConf = enum {
    RCC_ADCCLKSOURCE_HCLK,
    RCC_ADCCLKSOURCE_SYSCLK,
    RCC_ADCCLKSOURCE_HSE,
    RCC_ADCCLKSOURCE_HSI,
    RCC_ADCCLKSOURCE_PLL1P,
};
pub const ASClockSelectionConf = enum {
    RCC_ASCLKSOURCE_PLL1P,
    RCC_ASCLKSOURCE_PLL1Q,
};
pub const I2C3CLockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK7,
    RCC_I2C3CLKSOURCE_SYSCLK,
    RCC_I2C3CLKSOURCE_HSI,
};
pub const RNGCLockSelectionVirtualConf = enum {
    RCC_RNGCLKSOURCE_LSE,
    RCC_RNGCLKSOURCE_PLL1Q,
    RCC_RNGCLKSOURCE_HSI,
    RCC_RNGCLKSOURCE_LSI,
};
pub const RCC_MCO1SourceVirtualConf = enum {
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_PLL1RCLK,
    RCC_MCO1SOURCE_SYSCLK,
    RCC_MCO1SOURCE_PLL1PCLK,
    RCC_MCO1SOURCE_PLL1QCLK,
    RCC_MCO1SOURCE_HCLK5,
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
pub const LSCOSource1VirtualConf = enum {
    RCC_LSCOSOURCE_LSI,
    RCC_LSCOSOURCE_LSE,
};
pub const AHB5CLKDividerConf = enum {
    DIV1,
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
        };
    }
};
pub const AHBCLKDividerConf = enum {
    RCC_SYSCLK_DIV1,
    RCC_SYSCLK_DIV2,
    RCC_SYSCLK_DIV4,
    RCC_SYSCLK_DIV8,
    RCC_SYSCLK_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_SYSCLK_DIV1 => 1,
            .RCC_SYSCLK_DIV2 => 2,
            .RCC_SYSCLK_DIV4 => 4,
            .RCC_SYSCLK_DIV8 => 8,
            .RCC_SYSCLK_DIV16 => 16,
        };
    }
};
pub const CortexCLockSelectionVirtualConf = enum {
    RCC_SYSTICKCLKSOURCE_HCLK_DIV8,
    RCC_SYSTICKCLKSOURCE_LSE,
    RCC_SYSTICKCLKSOURCE_LSI,
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
pub const APB7CLKDividerConf = enum {
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
pub const SPI3CLockSelectionConf = enum {
    RCC_SPI3CLKSOURCE_PCLK7,
    RCC_SPI3CLKSOURCE_SYSCLK,
    RCC_SPI3CLKSOURCE_HSI,
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 512;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLLFRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8191;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const PLL1PConf = enum {
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
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"6" => 6,
            .@"8" => 8,
            .@"10" => 10,
            .@"12" => 12,
            .@"14" => 14,
            .@"16" => 16,
            .@"18" => 18,
            .@"20" => 20,
            .@"22" => 22,
            .@"24" => 24,
            .@"26" => 26,
            .@"28" => 28,
            .@"30" => 30,
            .@"32" => 32,
            .@"34" => 34,
            .@"36" => 36,
            .@"38" => 38,
            .@"40" => 40,
            .@"42" => 42,
            .@"44" => 44,
            .@"46" => 46,
            .@"48" => 48,
            .@"50" => 50,
            .@"52" => 52,
            .@"54" => 54,
            .@"56" => 56,
            .@"58" => 58,
            .@"60" => 60,
            .@"62" => 62,
            .@"64" => 64,
            .@"66" => 66,
            .@"68" => 68,
            .@"70" => 70,
            .@"72" => 72,
            .@"74" => 74,
            .@"76" => 76,
            .@"78" => 78,
            .@"80" => 80,
            .@"82" => 82,
            .@"84" => 84,
            .@"86" => 86,
            .@"88" => 88,
            .@"90" => 90,
            .@"92" => 92,
            .@"94" => 94,
            .@"96" => 96,
            .@"98" => 98,
            .@"100" => 100,
            .@"102" => 102,
            .@"104" => 104,
            .@"106" => 106,
            .@"108" => 108,
            .@"110" => 110,
            .@"112" => 112,
            .@"114" => 114,
            .@"116" => 116,
            .@"118" => 118,
            .@"120" => 120,
            .@"122" => 122,
            .@"124" => 124,
            .@"126" => 126,
            .@"128" => 128,
        };
    }
};
pub const PLL1QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL1RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
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
pub const HSE_TrimmingConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const LSE_TrimmingConf = enum {
    RCC_LSETRIMMING_R,
    RCC_LSETRIMMING_1_2_R,
    RCC_LSETRIMMING_2_3_R,
    RCC_LSETRIMMING_3_4_R,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_LSETRIMMING_R => 0,
            .RCC_LSETRIMMING_1_2_R => 1,
            .RCC_LSETRIMMING_2_3_R => 2,
            .RCC_LSETRIMMING_3_4_R => 3,
        };
    }
};
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 127;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const LSI2ConfigConf = enum {
    false,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .false => 0,
        };
    }
};
pub const LSI2_FreqTempSensConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const LSI2OpModeConf = enum {
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
    HseDiv: HseDivConf = .RCC_HSE_DIV1,
    LSIRC: LSI_VALUEConf = @enumFromInt(32000),
    LSIOut: LSIDIVConf = .RCC_LSI_DIV1,
    LSEOSC: LSE_VALUEConf = @enumFromInt(32768),
    RSTClkSource: RSTClockSelectionVirtualConf = .RCC_RADIOSTCLKSOURCE_HSE_DIV1000,
    SysClkSource: SYSCLKSourceVirtualConf = .RCC_SYSCLKSOURCE_HSI,
    PLLSource: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLM: PLLMConf = @enumFromInt(1),
    RTCClkSource: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1Mult: USART1CLockSelectionVirtualConf = .RCC_USART1CLKSOURCE_PCLK2,
    LPUART1Mult: LPUART1CLockSelectionVirtualConf = .RCC_LPUART1CLKSOURCE_PCLK7,
    LPTIM1Mult: LPTIM1CLockSelectionVirtualConf = .RCC_LPTIM1CLKSOURCE_PCLK7,
    ADCMult: ADCCLockSelectionVirtualConf = .RCC_ADCCLKSOURCE_HCLK,
    ASMult: ASClockSelectionConf = .RCC_ASCLKSOURCE_PLL1P,
    I2C3Mult: I2C3CLockSelectionConf = .RCC_I2C3CLKSOURCE_PCLK7,
    RNGMult: RNGCLockSelectionVirtualConf = .RCC_RNGCLKSOURCE_HSI,
    MCOMult: RCC_MCO1SourceVirtualConf = .RCC_MCO1SOURCE_SYSCLK,
    MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    LSCOMult: LSCOSource1VirtualConf = .RCC_LSCOSOURCE_LSI,
    AHB5Prescaler: AHB5CLKDividerConf = .DIV1,
    AHBPrescaler: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    CortexCLockSelection: CortexCLockSelectionVirtualConf = .RCC_SYSTICKCLKSOURCE_HCLK_DIV8,
    APB1Prescaler: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2Prescaler: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    APB7Prescaler: APB7CLKDividerConf = .RCC_HCLK_DIV1,
    SPI3Mult: SPI3CLockSelectionConf = .RCC_SPI3CLKSOURCE_PCLK7,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = .@"2",
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = @enumFromInt(2),
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSE_Trimming: HSE_TrimmingConf = @enumFromInt(0),
    LSE_Trimming: LSE_TrimmingConf = .RCC_LSETRIMMING_R,
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    LSI2Config: LSI2ConfigConf = .false,
    LSI2_FreqTempSens: LSI2_FreqTempSensConf = .null,
    LSI2OpMode: LSI2OpModeConf = .null,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ConfigWithRef = struct {
    HseDiv: HseDivConf = .RCC_HSE_DIV1,
    LSI_VALUE: LSI_VALUEConf = @enumFromInt(32000),
    LSIDIV: LSIDIVConf = .RCC_LSI_DIV1,
    LSE_VALUE: LSE_VALUEConf = @enumFromInt(32768),
    RSTClockSelectionVirtual: RSTClockSelectionVirtualConf = .RCC_RADIOSTCLKSOURCE_HSE_DIV1000,
    SYSCLKSourceVirtual: SYSCLKSourceVirtualConf = .RCC_SYSCLKSOURCE_HSI,
    PLLSourceVirtual: PLLSourceVirtualConf = .RCC_PLLSOURCE_HSI,
    PLLM: PLLMConf = @enumFromInt(1),
    RTCClockSelection: RTCClockSelectionConf = .RCC_RTCCLKSOURCE_LSI,
    USART1CLockSelectionVirtual: USART1CLockSelectionVirtualConf = .RCC_USART1CLKSOURCE_PCLK2,
    LPUART1CLockSelectionVirtual: LPUART1CLockSelectionVirtualConf = .RCC_LPUART1CLKSOURCE_PCLK7,
    LPTIM1CLockSelectionVirtual: LPTIM1CLockSelectionVirtualConf = .RCC_LPTIM1CLKSOURCE_PCLK7,
    ADCCLockSelectionVirtual: ADCCLockSelectionVirtualConf = .RCC_ADCCLKSOURCE_HCLK,
    ASClockSelection: ASClockSelectionConf = .RCC_ASCLKSOURCE_PLL1P,
    I2C3CLockSelection: I2C3CLockSelectionConf = .RCC_I2C3CLKSOURCE_PCLK7,
    RNGCLockSelectionVirtual: RNGCLockSelectionVirtualConf = .RCC_RNGCLKSOURCE_HSI,
    RCC_MCO1SourceVirtual: RCC_MCO1SourceVirtualConf = .RCC_MCO1SOURCE_SYSCLK,
    RCC_MCODiv: RCC_MCODivConf = .RCC_MCODIV_1,
    LSCOSource1Virtual: LSCOSource1VirtualConf = .RCC_LSCOSOURCE_LSI,
    AHB5CLKDivider: AHB5CLKDividerConf = .DIV1,
    AHBCLKDivider: AHBCLKDividerConf = .RCC_SYSCLK_DIV1,
    CortexCLockSelectionVirtual: CortexCLockSelectionVirtualConf = .RCC_SYSTICKCLKSOURCE_HCLK_DIV8,
    APB1CLKDivider: APB1CLKDividerConf = .RCC_HCLK_DIV1,
    APB2CLKDivider: APB2CLKDividerConf = .RCC_HCLK_DIV1,
    APB7CLKDivider: APB7CLKDividerConf = .RCC_HCLK_DIV1,
    SPI3CLockSelection: SPI3CLockSelectionConf = .RCC_SPI3CLKSOURCE_PCLK7,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = .@"2",
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = @enumFromInt(2),
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSE_Trimming: HSE_TrimmingConf = @enumFromInt(0),
    LSE_Trimming: LSE_TrimmingConf = .RCC_LSETRIMMING_R,
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    LSI2Config: LSI2ConfigConf = .false,
    LSI2_FreqTempSens: LSI2_FreqTempSensConf = .null,
    LSI2OpMode: LSI2OpModeConf = .null,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HseDiv = self.HseDiv,
            .LSIRC = self.LSI_VALUE,
            .LSIOut = self.LSIDIV,
            .LSEOSC = self.LSE_VALUE,
            .RSTClkSource = self.RSTClockSelectionVirtual,
            .SysClkSource = self.SYSCLKSourceVirtual,
            .PLLSource = self.PLLSourceVirtual,
            .PLLM = self.PLLM,
            .RTCClkSource = self.RTCClockSelection,
            .USART1Mult = self.USART1CLockSelectionVirtual,
            .LPUART1Mult = self.LPUART1CLockSelectionVirtual,
            .LPTIM1Mult = self.LPTIM1CLockSelectionVirtual,
            .ADCMult = self.ADCCLockSelectionVirtual,
            .ASMult = self.ASClockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .RNGMult = self.RNGCLockSelectionVirtual,
            .MCOMult = self.RCC_MCO1SourceVirtual,
            .MCODiv = self.RCC_MCODiv,
            .LSCOMult = self.LSCOSource1Virtual,
            .AHB5Prescaler = self.AHB5CLKDivider,
            .AHBPrescaler = self.AHBCLKDivider,
            .CortexCLockSelection = self.CortexCLockSelectionVirtual,
            .APB1Prescaler = self.APB1CLKDivider,
            .APB2Prescaler = self.APB2CLKDivider,
            .APB7Prescaler = self.APB7CLKDivider,
            .SPI3Mult = self.SPI3CLockSelection,
            .PLLN = self.PLLN,
            .PLLFRACN = self.PLLFRACN,
            .PLL1P = self.PLL1P,
            .PLL1Q = self.PLL1Q,
            .PLL1R = self.PLL1R,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .HSE_Trimming = self.HSE_Trimming,
            .LSE_Trimming = self.LSE_Trimming,
            .HSICalibrationValue = self.HSICalibrationValue,
            .LSI2Config = self.LSI2Config,
            .LSI2_FreqTempSens = self.LSI2_FreqTempSens,
            .LSI2OpMode = self.LSI2OpMode,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    HseDiv: ClockNode,
    LSIRC: ClockNode,
    LSIOut: ClockNode,
    LSEOSC: ClockNode,
    SAI1_EXT: ClockNode,
    HSERSTDevisor: ClockNode,
    RSTClkSource: ClockNode,
    RSTOutput: ClockNode,
    RSTRFOutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLLM: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    ASMult: ClockNode,
    ASoutput: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    pllqDivToRNG: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    AHB5Prescaler: ClockNode,
    AHB5Output: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    HCLK4Output: ClockNode,
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
    APB7Prescaler: ClockNode,
    APB7Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
    PLLN: ClockNode,
    PLLFRACN: ClockNode,
    PLL1P: ClockNode,
    PLLPoutput: ClockNode,
    PLL1Q: ClockNode,
    PLLQoutput: ClockNode,
    PLL1R: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSE_Trimming: ClockNodeTypes,
    LSE_Trimming: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    LSI2Config: ClockNodeTypes,
    LSI2_FreqTempSens: ClockNodeTypes,
    LSI2OpMode: ClockNodeTypes,
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
            .source = .{ .value = 16000000 },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const HseDivval = ClockNodeTypes{ .div = .{ .value = config.HseDiv.get() } };
        const HseDiv: ClockNode = .{
            .name = "HseDiv",
            .Nodetype = HseDivval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 32600, .min = 31400 },
            },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSIOutval = ClockNodeTypes{ .div = .{ .value = config.LSIOut.get() } };
        const LSIOut: ClockNode = .{
            .name = "LSIOut",
            .Nodetype = LSIOutval,
            .parents = &[_]*const ClockNode{&LSIRC},
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
        const SAI1_EXTval = ClockNodeTypes{
            .source = .{ .value = 48000 },
        };
        const SAI1_EXT: ClockNode = .{
            .name = "SAI1_EXT",
            .Nodetype = SAI1_EXTval,
        };
        const HSERSTDevisorval = ClockNodeTypes{
            .div = .{ .value = 1000 },
        };
        const HSERSTDevisor: ClockNode = .{
            .name = "HSERSTDevisor",
            .Nodetype = HSERSTDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RSTClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.RSTClkSource) };
        const RSTClkSource: ClockNode = .{
            .name = "RSTClkSource",
            .Nodetype = RSTClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERSTDevisor,
                &LSEOSC,
                &LSIOut,
            },
        };
        const RSTOutputval = ClockNodeTypes{ .output = null };
        const RSTOutput: ClockNode = .{
            .name = "RSTOutput",
            .Nodetype = RSTOutputval,
            .parents = &[_]*const ClockNode{&RSTClkSource},
        };
        const RSTRFOutputval = ClockNodeTypes{ .output = null };
        const RSTRFOutput: ClockNode = .{
            .name = "RSTRFOutput",
            .Nodetype = RSTRFOutputval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HseDiv,
            },
        };
        const PLLMval = ClockNodeTypes{
            .div = .{
                .value = config.PLLM.get(),
                .limit = .{ .max = 8, .min = 1 },
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = PLLMval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLFRACNval = ClockNodeTypes{
            .source = .{
                .value = config.PLLFRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .Nodetype = PLLFRACNval,
        };
        const PLLNval = ClockNodeTypes{
            .mulfrac = .{
                .value = config.PLLN.get(),
                .limit = .{ .max = 512, .min = 4 },
            },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = PLLNval,
            .parents = &[_]*const ClockNode{ &PLLM, &PLLFRACN },
        };
        const PLL1Rval = ClockNodeTypes{
            .div = .{
                .value = config.PLL1R.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL1R: ClockNode = .{
            .name = "PLL1R",
            .Nodetype = PLL1Rval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HseDiv,
                &PLL1R,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
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
                &LSIOut,
            },
        };
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = 1562500, .min = 0 },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIOut},
        };
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
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
        const APB7Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB7Prescaler.get() } };
        const APB7Prescaler: ClockNode = .{
            .name = "APB7Prescaler",
            .Nodetype = APB7Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB7Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const APB7Output: ClockNode = .{
            .name = "APB7Output",
            .Nodetype = APB7Outputval,
            .parents = &[_]*const ClockNode{&APB7Prescaler},
        };
        const LPUART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPUART1Mult) };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",
            .Nodetype = LPUART1Multval,

            .parents = &[_]*const ClockNode{
                &APB7Output,
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
        const LPTIM1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM1Mult) };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB7Output,
                &LSIOut,
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
        const PLL1Pval = ClockNodeTypes{ .div = .{ .value = config.PLL1P.get() } };
        const PLL1P: ClockNode = .{
            .name = "PLL1P",
            .Nodetype = PLL1Pval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const ADCMultval = ClockNodeTypes{ .multi = @intFromEnum(config.ADCMult) };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .Nodetype = ADCMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &SysCLKOutput,
                &HSEOSC,
                &HSIRC,
                &PLL1P,
            },
        };
        const ADCoutputval = ClockNodeTypes{ .output = null };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const PLL1Qval = ClockNodeTypes{
            .div = .{
                .value = config.PLL1Q.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const PLL1Q: ClockNode = .{
            .name = "PLL1Q",
            .Nodetype = PLL1Qval,
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const ASMultval = ClockNodeTypes{ .multi = @intFromEnum(config.ASMult) };
        const ASMult: ClockNode = .{
            .name = "ASMult",
            .Nodetype = ASMultval,

            .parents = &[_]*const ClockNode{
                &PLL1P,
                &PLL1Q,
            },
        };
        const ASoutputval = ClockNodeTypes{ .output = null };
        const ASoutput: ClockNode = .{
            .name = "ASoutput",
            .Nodetype = ASoutputval,
            .parents = &[_]*const ClockNode{&ASMult},
        };
        const I2C3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C3Mult) };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &APB7Output,
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
        const pllqDivToRNGval = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const pllqDivToRNG: ClockNode = .{
            .name = "pllqDivToRNG",
            .Nodetype = pllqDivToRNGval,
            .parents = &[_]*const ClockNode{&PLL1Q},
        };
        const RNGMultval = ClockNodeTypes{ .multi = @intFromEnum(config.RNGMult) };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",
            .Nodetype = RNGMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &pllqDivToRNG,
                &HSIRC,
                &LSIOut,
            },
        };
        const RNGoutputval = ClockNodeTypes{ .output = null };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = RNGoutputval,
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const AHB5Prescalerval = ClockNodeTypes{ .div = .{ .value = config.AHB5Prescaler.get() } };
        const AHB5Prescaler: ClockNode = .{
            .name = "AHB5Prescaler",
            .Nodetype = AHB5Prescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHB5Outputval = ClockNodeTypes{
            .output = .{ .max = 32000000, .min = 0 },
        };
        const AHB5Output: ClockNode = .{
            .name = "AHB5Output",
            .Nodetype = AHB5Outputval,
            .parents = &[_]*const ClockNode{&AHB5Prescaler},
        };
        const MCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.MCOMult) };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIOut,
                &HSEOSC,
                &HSIRC,
                &PLL1R,
                &SysCLKOutput,
                &PLL1P,
                &PLL1Q,
                &AHB5Output,
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
        const LSCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.LSCOMult) };
        const LSCOMult: ClockNode = .{
            .name = "LSCOMult",
            .Nodetype = LSCOMultval,

            .parents = &[_]*const ClockNode{
                &LSIOut,
                &LSEOSC,
            },
        };
        const LSCOOutputval = ClockNodeTypes{ .output = null };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = LSCOOutputval,
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const HCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const HCLK4Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const HCLK4Output: ClockNode = .{
            .name = "HCLK4Output",
            .Nodetype = HCLK4Outputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescalerval = ClockNodeTypes{
            .div = .{ .value = 8 },
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexCLockSelectionval = ClockNodeTypes{ .multi = @intFromEnum(config.CortexCLockSelection) };
        const CortexCLockSelection: ClockNode = .{
            .name = "CortexCLockSelection",
            .Nodetype = CortexCLockSelectionval,

            .parents = &[_]*const ClockNode{
                &CortexPrescaler,
                &LSEOSC,
                &LSIOut,
            },
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexCLockSelection},
        };
        const FCLKCortexOutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB1Prescaler.get() } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
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
        const TimPrescOut1val = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
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
        const TimPrescOut2val = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const SPI3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI3Mult) };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",
            .Nodetype = SPI3Multval,

            .parents = &[_]*const ClockNode{
                &APB7Output,
                &SysCLKOutput,
                &HSIRC,
            },
        };
        const SPI3outputval = ClockNodeTypes{ .output = null };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = SPI3outputval,
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const PLLPoutputval = ClockNodeTypes{ .output = null };
        const PLLPoutput: ClockNode = .{
            .name = "PLLPoutput",
            .Nodetype = PLLPoutputval,
            .parents = &[_]*const ClockNode{&PLL1P},
        };
        const PLLQoutputval = ClockNodeTypes{ .output = null };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = PLLQoutputval,
            .parents = &[_]*const ClockNode{&PLL1Q},
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
        const HSE_Trimmingval = ClockNodeTypes{
            .source = .{
                .value = config.HSE_Trimming.get(),
                .limit = .{ .max = 63, .min = 0 },
            },
        };
        const LSE_Trimmingval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Trimming.get() },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.HSICalibrationValue.get(),
                .limit = .{ .max = 127, .min = 0 },
            },
        };
        const LSI2Configval = ClockNodeTypes{
            .source = .{ .value = config.LSI2Config.get() },
        };
        const LSI2_FreqTempSensval = ClockNodeTypes{
            .source = .{ .value = config.LSI2_FreqTempSens.get() },
        };
        const LSI2OpModeval = ClockNodeTypes{
            .source = .{ .value = config.LSI2OpMode.get() },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .HseDiv = HseDiv,
            .LSIRC = LSIRC,
            .LSIOut = LSIOut,
            .LSEOSC = LSEOSC,
            .SAI1_EXT = SAI1_EXT,
            .HSERSTDevisor = HSERSTDevisor,
            .RSTClkSource = RSTClkSource,
            .RSTOutput = RSTOutput,
            .RSTRFOutput = RSTRFOutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLLM = PLLM,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .ASMult = ASMult,
            .ASoutput = ASoutput,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .pllqDivToRNG = pllqDivToRNG,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .AHB5Prescaler = AHB5Prescaler,
            .AHB5Output = AHB5Output,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .HCLK4Output = HCLK4Output,
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
            .APB7Prescaler = APB7Prescaler,
            .APB7Output = APB7Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
            .PLLN = PLLN,
            .PLLFRACN = PLLFRACN,
            .PLL1P = PLL1P,
            .PLLPoutput = PLLPoutput,
            .PLL1Q = PLL1Q,
            .PLLQoutput = PLLQoutput,
            .PLL1R = PLL1R,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSE_Trimming = HSE_Trimmingval,
            .LSE_Trimming = LSE_Trimmingval,
            .HSICalibrationValue = HSICalibrationValueval,
            .LSI2Config = LSI2Configval,
            .LSI2_FreqTempSens = LSI2_FreqTempSensval,
            .LSI2OpMode = LSI2OpModeval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.RSTOutput.get_comptime();
        _ = self.RSTRFOutput.get_comptime();
        _ = self.RTCOutput.get_comptime();
        _ = self.IWDGOutput.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.ASoutput.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.AHB5Output.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.HCLK4Output.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.APB7Output.get_comptime();
        _ = self.SPI3output.get_comptime();
    }
};
