//AUTO-GENERATED FILE. DO NOT MODIFY.
//any issues or changes should be made in the source JSON files or the generator script.

const std = @import("std");
const clock = @import("util/solver.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;
const comptime_fail_or_error = clock.comptime_fail_or_error;
const math_op = clock.math_op;
const check_ref = clock.check_ref;
const Limit = clock.Limit;
const round = clock.round;
const ignore_value = clock.ignore_value;

pub fn ClockTree(comptime mcu_data: std.StaticStringMap(void)) type {
    return struct {

        //=======Embassy Enum Types========
        pub const RCC_HPRE = enum(u4) {
            Div1 = 0,
            Div2 = 8,
            Div4 = 9,
            Div8 = 10,
            Div16 = 11,
            Div64 = 12,
            Div128 = 13,
            Div256 = 14,
            Div512 = 15,
        };
        pub const RCC_SW = enum(u2) {
            MSI = 0,
            HSI = 1,
            HSE = 2,
            PLL1_R = 3,
        };
        pub const RCC_MCOSEL = enum(u3) {
            SYS = 1,
            HSI = 2,
            MSI = 3,
            HSE = 4,
            PLL = 5,
            LSI = 6,
            LSE = 7,
        };
        pub const RCC_PLLDIV = enum(u2) {
            Div2 = 1,
            Div3 = 2,
            Div4 = 3,
        };
        pub const RCC_PLLMUL = enum(u4) {
            Mul3 = 0,
            Mul4 = 1,
            Mul6 = 2,
            Mul8 = 3,
            Mul12 = 4,
            Mul16 = 5,
            Mul24 = 6,
            Mul32 = 7,
            Mul48 = 8,
        };
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
        };
        pub const RCC_MSIRANGE = enum(u3) {
            Range66K = 0,
            Range131K = 1,
            Range262K = 2,
            Range524K = 3,
            Range1M = 4,
            Range2M = 5,
            Range4M = 6,
        };
        pub const PWR_VOS = enum(u2) {
            Range1 = 1,
            Range2 = 2,
            Range3 = 3,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_PLLSRC = enum(u1) {
            HSI = 0,
            HSE = 1,
        };

        pub const MSIClockRangeList = enum {
            RCC_MSIRANGE_0,
            RCC_MSIRANGE_1,
            RCC_MSIRANGE_2,
            RCC_MSIRANGE_3,
            RCC_MSIRANGE_4,
            RCC_MSIRANGE_5,
            RCC_MSIRANGE_6,

            pub fn to_enum(self: @This()) anyerror!RCC_MSIRANGE {
                return switch (self) {
                    .RCC_MSIRANGE_5 => .Range2M,
                    .RCC_MSIRANGE_0 => .Range66K,
                    .RCC_MSIRANGE_2 => .Range262K,
                    .RCC_MSIRANGE_6 => .Range4M,
                    .RCC_MSIRANGE_4 => .Range1M,
                    .RCC_MSIRANGE_1 => .Range131K,
                    .RCC_MSIRANGE_3 => .Range524K,
                };
            }
            pub fn from_enum(item: RCC_MSIRANGE) anyerror!@This() {
                return switch (item) {
                    .Range2M => .RCC_MSIRANGE_5,
                    .Range66K => .RCC_MSIRANGE_0,
                    .Range262K => .RCC_MSIRANGE_2,
                    .Range4M => .RCC_MSIRANGE_6,
                    .Range1M => .RCC_MSIRANGE_4,
                    .Range131K => .RCC_MSIRANGE_1,
                    .Range524K => .RCC_MSIRANGE_3,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MSIRANGE_0 => 65536,
                    .RCC_MSIRANGE_1 => 131072,
                    .RCC_MSIRANGE_2 => 262144,
                    .RCC_MSIRANGE_3 => 524288,
                    .RCC_MSIRANGE_4 => 1048000,
                    .RCC_MSIRANGE_5 => 2097000,
                    .RCC_MSIRANGE_6 => 4194000,
                };
            }
        };

        pub const RCC_RTC_Clock_Source_FROM_HSEList = enum {
            RCC_RTCCLKSOURCE_HSE_DIV2,
            RCC_RTCCLKSOURCE_HSE_DIV4,
            RCC_RTCCLKSOURCE_HSE_DIV8,
            RCC_RTCCLKSOURCE_HSE_DIV16,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_RTCCLKSOURCE_HSE_DIV2 => 2,
                    .RCC_RTCCLKSOURCE_HSE_DIV4 => 4,
                    .RCC_RTCCLKSOURCE_HSE_DIV8 => 8,
                    .RCC_RTCCLKSOURCE_HSE_DIV16 => 16,
                };
            }
        };

        pub const RTCClockSelectionVirtualList = enum {
            HSERTCDevisor,
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_RTCSEL {
                return switch (self) {
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                    .HSERTCDevisor => .HSE,
                    .RCC_RTCCLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
                    .HSE => .HSERTCDevisor,
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                };
            }
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_MSI,
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_MSI => .MSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_R,
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .MSI => .RCC_SYSCLKSOURCE_MSI,
                    .PLL1_R => .RCC_SYSCLKSOURCE_PLLCLK,
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                };
            }
        };

        pub const AHBCLKDividerList = enum {
            RCC_SYSCLK_DIV1,
            RCC_SYSCLK_DIV2,
            RCC_SYSCLK_DIV4,
            RCC_SYSCLK_DIV8,
            RCC_SYSCLK_DIV16,
            RCC_SYSCLK_DIV64,
            RCC_SYSCLK_DIV128,
            RCC_SYSCLK_DIV256,
            RCC_SYSCLK_DIV512,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV256 => .Div256,
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV8 => .Div8,
                    .RCC_SYSCLK_DIV64 => .Div64,
                    .RCC_SYSCLK_DIV128 => .Div128,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV512 => .Div512,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div256 => .RCC_SYSCLK_DIV256,
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div8 => .RCC_SYSCLK_DIV8,
                    .Div64 => .RCC_SYSCLK_DIV64,
                    .Div128 => .RCC_SYSCLK_DIV128,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div512 => .RCC_SYSCLK_DIV512,
                };
            }
            pub fn get(self: @This()) !f32 {
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

        pub const TimPrescalerList = enum {
            SYSTICK_CLKSOURCE_HCLK,
            SYSTICK_CLKSOURCE_HCLK_DIV8,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .SYSTICK_CLKSOURCE_HCLK => 1,
                    .SYSTICK_CLKSOURCE_HCLK_DIV8 => 8,
                };
            }
        };

        pub const APB1CLKDividerList = enum {
            RCC_HCLK_DIV1,
            RCC_HCLK_DIV2,
            RCC_HCLK_DIV4,
            RCC_HCLK_DIV8,
            RCC_HCLK_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_HCLK_DIV2 => .Div2,
                    .RCC_HCLK_DIV4 => .Div4,
                    .RCC_HCLK_DIV16 => .Div16,
                    .RCC_HCLK_DIV8 => .Div8,
                    .RCC_HCLK_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_HCLK_DIV2,
                    .Div4 => .RCC_HCLK_DIV4,
                    .Div16 => .RCC_HCLK_DIV16,
                    .Div8 => .RCC_HCLK_DIV8,
                    .Div1 => .RCC_HCLK_DIV1,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HCLK_DIV1 => 1,
                    .RCC_HCLK_DIV2 => 2,
                    .RCC_HCLK_DIV4 => 4,
                    .RCC_HCLK_DIV8 => 8,
                    .RCC_HCLK_DIV16 => 16,
                };
            }
        };

        pub const APB2CLKDividerList = enum {
            RCC_HCLK_DIV1,
            RCC_HCLK_DIV2,
            RCC_HCLK_DIV4,
            RCC_HCLK_DIV8,
            RCC_HCLK_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_HCLK_DIV2 => .Div2,
                    .RCC_HCLK_DIV4 => .Div4,
                    .RCC_HCLK_DIV16 => .Div16,
                    .RCC_HCLK_DIV8 => .Div8,
                    .RCC_HCLK_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_HCLK_DIV2,
                    .Div4 => .RCC_HCLK_DIV4,
                    .Div16 => .RCC_HCLK_DIV16,
                    .Div8 => .RCC_HCLK_DIV8,
                    .Div1 => .RCC_HCLK_DIV1,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HCLK_DIV1 => 1,
                    .RCC_HCLK_DIV2 => 2,
                    .RCC_HCLK_DIV4 => 4,
                    .RCC_HCLK_DIV8 => 8,
                    .RCC_HCLK_DIV16 => 16,
                };
            }
        };

        pub const RCC_MCOSourceList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_MSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_PLLCLK,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_MSI => .MSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .PLL => .RCC_MCO1SOURCE_PLLCLK,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .MSI => .RCC_MCO1SOURCE_MSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                };
            }
        };

        pub const RCC_MCODivList = enum {
            RCC_MCODIV_1,
            RCC_MCODIV_2,
            RCC_MCODIV_4,
            RCC_MCODIV_8,
            RCC_MCODIV_16,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCODIV_16 => .Div16,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div16 => .RCC_MCODIV_16,
                    .Div8 => .RCC_MCODIV_8,
                    .Div4 => .RCC_MCODIV_4,
                    .Div1 => .RCC_MCODIV_1,
                    .Div2 => .RCC_MCODIV_2,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCODIV_1 => 1,
                    .RCC_MCODIV_2 => 2,
                    .RCC_MCODIV_4 => 4,
                    .RCC_MCODIV_8 => 8,
                    .RCC_MCODIV_16 => 16,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSE => .HSE,
                    .RCC_PLLSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_PLLSOURCE_HSE,
                    .HSI => .RCC_PLLSOURCE_HSI,
                };
            }
        };

        pub const PLLMULList = enum {
            RCC_PLL_MUL3,
            RCC_PLL_MUL4,
            RCC_PLL_MUL6,
            RCC_PLL_MUL8,
            RCC_PLL_MUL12,
            RCC_PLL_MUL16,
            RCC_PLL_MUL24,
            RCC_PLL_MUL32,
            RCC_PLL_MUL48,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLMUL {
                return switch (self) {
                    .RCC_PLL_MUL12 => .Mul12,
                    .RCC_PLL_MUL32 => .Mul32,
                    .RCC_PLL_MUL3 => .Mul3,
                    .RCC_PLL_MUL24 => .Mul24,
                    .RCC_PLL_MUL48 => .Mul48,
                    .RCC_PLL_MUL16 => .Mul16,
                    .RCC_PLL_MUL8 => .Mul8,
                    .RCC_PLL_MUL4 => .Mul4,
                    .RCC_PLL_MUL6 => .Mul6,
                };
            }
            pub fn from_enum(item: RCC_PLLMUL) anyerror!@This() {
                return switch (item) {
                    .Mul12 => .RCC_PLL_MUL12,
                    .Mul32 => .RCC_PLL_MUL32,
                    .Mul3 => .RCC_PLL_MUL3,
                    .Mul24 => .RCC_PLL_MUL24,
                    .Mul48 => .RCC_PLL_MUL48,
                    .Mul16 => .RCC_PLL_MUL16,
                    .Mul8 => .RCC_PLL_MUL8,
                    .Mul4 => .RCC_PLL_MUL4,
                    .Mul6 => .RCC_PLL_MUL6,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLL_MUL3 => 3,
                    .RCC_PLL_MUL4 => 4,
                    .RCC_PLL_MUL6 => 6,
                    .RCC_PLL_MUL8 => 8,
                    .RCC_PLL_MUL12 => 12,
                    .RCC_PLL_MUL16 => 16,
                    .RCC_PLL_MUL24 => 24,
                    .RCC_PLL_MUL32 => 32,
                    .RCC_PLL_MUL48 => 48,
                };
            }
        };

        pub const PLLDIVList = enum {
            RCC_PLL_DIV2,
            RCC_PLL_DIV3,
            RCC_PLL_DIV4,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLDIV {
                return switch (self) {
                    .RCC_PLL_DIV4 => .Div4,
                    .RCC_PLL_DIV2 => .Div2,
                    .RCC_PLL_DIV3 => .Div3,
                };
            }
            pub fn from_enum(item: RCC_PLLDIV) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_PLL_DIV4,
                    .Div2 => .RCC_PLL_DIV2,
                    .Div3 => .RCC_PLL_DIV3,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLL_DIV2 => 2,
                    .RCC_PLL_DIV3 => 3,
                    .RCC_PLL_DIV4 => 4,
                };
            }
        };

        pub const INSTRUCTION_CACHE_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const PREFETCH_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const DATA_CACHE_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const FLatencyList = enum {
            FLASH_LATENCY_0,
            FLASH_LATENCY_1,
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE3,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .Range1,
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .Range2,
                    .PWR_REGULATOR_VOLTAGE_SCALE3 => .Range3,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .Range1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .Range2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .Range3 => .PWR_REGULATOR_VOLTAGE_SCALE3,
                };
            }
        };

        pub const RTCEnableList = enum {
            true,
            false,
        };

        pub const LCDEnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const EnableHSERTCDevisorList = enum {
            true,
            false,
        };

        pub const EnableHSELCDDevisorList = enum {
            true,
            false,
        };

        pub const IWDGEnableList = enum {
            true,
            false,
        };

        pub const MCOEnableList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const SDIOEnableList = enum {
            true,
            false,
        };

        pub const EnableCSSLSEList = enum {
            true,
            false,
        };

        pub const EnableHSEList = enum {
            true,
            false,
        };

        pub const EnableLSERTCList = enum {
            true,
            false,
        };

        pub const EnableLSEList = enum {
            true,
            false,
        };

        pub const EnbaleCSSList = enum {
            true,
            false,
        };

        //=======ClockTree Flags========

        pub const Flags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            USE_ADC: bool = false,
            SDIOUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            CSSEnabled: bool = false,
            EnableCSS: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            USE_ADC: bool = false,
            SDIOUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            CSSEnabled: bool = false,
            EnableCSS: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            MSIUsed: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            SDIOEnable: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            HSEUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            MSIClockRange: ?MSIClockRangeList = null,
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelectionVirtual: ?RTCClockSelectionVirtualList = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            TimPrescaler: ?TimPrescalerList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            RCC_MCOSource: ?RCC_MCOSourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLMUL: ?PLLMULList = null,
            PLLDIV: ?PLLDIVList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            MSIClockRange: MSIClockRangeList,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelectionVirtual: RTCClockSelectionVirtualList,
            SYSCLKSource: SYSCLKSourceList,
            AHBCLKDivider: AHBCLKDividerList,
            TimPrescaler: TimPrescalerList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB2TimCLKDivider: u32,
            RCC_MCOSource: RCC_MCOSourceList,
            RCC_MCODiv: RCC_MCODivList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLMUL: PLLMULList,
            DIV2USB: u32,
            PLLDIV: PLLDIVList,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            HSE_Timout: u32,
            LSE_Timout: u32,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .FLatency = self.FLatency,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .MSICalibrationValue = self.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            MSIClockRange: ?RCC_MSIRANGE = null,
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelectionVirtual: ?RCC_RTCSEL = null,
            SYSCLKSource: ?RCC_SW = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            TimPrescaler: ?TimPrescalerList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            RCC_MCOSource: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLMUL: ?RCC_PLLMUL = null,
            PLLDIV: ?RCC_PLLDIV = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .MSIClockRange = if (self.MSIClockRange) |val| try MSIClockRangeList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelectionVirtual = if (self.RTCClockSelectionVirtual) |val| try RTCClockSelectionVirtualList.from_enum(val) else null,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .TimPrescaler = self.TimPrescaler,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .RCC_MCOSource = if (self.RCC_MCOSource) |val| try RCC_MCOSourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLMUL = if (self.PLLMUL) |val| try PLLMULList.from_enum(val) else null,
                    .PLLDIV = if (self.PLLDIV) |val| try PLLDIVList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            MSIClockRange: RCC_MSIRANGE,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelectionVirtual: RCC_RTCSEL,
            SYSCLKSource: RCC_SW,
            AHBCLKDivider: RCC_HPRE,
            TimPrescaler: TimPrescalerList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            RCC_MCOSource: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLMUL: RCC_PLLMUL,
            DIV2USB: u32,
            PLLDIV: RCC_PLLDIV,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
            HSE_Timout: u32,
            LSE_Timout: u32,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .MSIClockRange = try cubemx_config.MSIClockRange.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelectionVirtual = try cubemx_config.RTCClockSelectionVirtual.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .TimPrescaler = cubemx_config.TimPrescaler,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .RCC_MCOSource = try cubemx_config.RCC_MCOSource.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLMUL = try cubemx_config.PLLMUL.to_enum(),
                    .DIV2USB = cubemx_config.DIV2USB,
                    .PLLDIV = try cubemx_config.PLLDIV.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .MSICalibrationValue = cubemx_config.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
                };
            }
        };

        pub fn check_MCU(comptime to_check: []const u8) bool {
            return mcu_data.get(to_check) != null;
        }
        ///output of clock values after processing
        ///Note: outputs marked as 0 may indicate a disabled clock or an actual output value of 0.
        pub const ClockOutput = struct {
            HSIRC: u32 = 0,
            ADCOutput: u32 = 0,
            MSIRC: u32 = 0,
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            LCDOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PWROutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            TIMPrescaler: u32 = 0,
            TIMOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            APB1Prescaler: u32 = 0,
            APB1Output: u32 = 0,
            TimPrescalerAPB1: u32 = 0,
            TimPrescOut: u32 = 0,
            APB2Prescaler: u32 = 0,
            APB2Output: u32 = 0,
            PeriphPrescaler: u32 = 0,
            PeriphPrescOutput: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            PLLSource: u32 = 0,
            VCOIIuput: u32 = 0,
            PLLMUL: u32 = 0,
            USBPres: u32 = 0,
            PLLDIV: u32 = 0,
            USBOutput: u32 = 0,
            MSI: u32 = 0,
            HSE_RTC: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            TIMCLK: u32 = 0,
        };

        pub const CubemxTreeOutput = struct {
            clock: ClockOutput = .{},
            config: CubeMXOutputConfig,
        };

        pub const TreeOutput = struct {
            clock: ClockOutput = .{},
            config: OutputConfig,
        };
        pub fn get_cubemx_clocks(config: CubeMXConfig, comptime patch_logs: bool) anyerror!CubemxTreeOutput {
            std.mem.doNotOptimizeAway(patch_logs);

            if (@inComptime()) @setEvalBranchQuota(30000);
            var out = ClockOutput{};
            var ref_out: CubeMXOutputConfig = undefined;

            var SEMAPHORE_LSE_SELECTED: bool = false; //semaphore for processing, not an actual flag in the output;
            var SEMAPHORE_LSI_SELECTED: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEscale: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLscale: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSIusedPLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale11: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale3: bool = false; //semaphore for processing, not an actual flag in the output;
            var NVICusedCssLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CSSEnabled: bool = false; //semaphore for processing, not an actual flag in the output;

            //Clock node bases

            const dummy = ClockNode{
                .name = "dummy_clock",
                .nodetype = .off,
                .parents = &.{},
            };
            std.mem.doNotOptimizeAway(dummy);

            var HSIRC = ClockNode{
                .name = "HSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADCOutput = ClockNode{
                .name = "ADCOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MSIRC = ClockNode{
                .name = "MSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSEOSC = ClockNode{
                .name = "HSEOSC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSIRC = ClockNode{
                .name = "LSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSEOSC = ClockNode{
                .name = "LSEOSC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSERTCDevisor = ClockNode{
                .name = "HSERTCDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RTCClkSource = ClockNode{
                .name = "RTCClkSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RTCOutput = ClockNode{
                .name = "RTCOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LCDOutput = ClockNode{
                .name = "LCDOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var IWDGOutput = ClockNode{
                .name = "IWDGOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SysClkSource = ClockNode{
                .name = "SysClkSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SysCLKOutput = ClockNode{
                .name = "SysCLKOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PWROutput = ClockNode{
                .name = "PWROutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHBPrescaler = ClockNode{
                .name = "AHBPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHBOutput = ClockNode{
                .name = "AHBOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HCLKOutput = ClockNode{
                .name = "HCLKOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIMPrescaler = ClockNode{
                .name = "TIMPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIMOutput = ClockNode{
                .name = "TIMOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FCLKCortexOutput = ClockNode{
                .name = "FCLKCortexOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB1Prescaler = ClockNode{
                .name = "APB1Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB1Output = ClockNode{
                .name = "APB1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimPrescalerAPB1 = ClockNode{
                .name = "TimPrescalerAPB1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimPrescOut = ClockNode{
                .name = "TimPrescOut",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB2Prescaler = ClockNode{
                .name = "APB2Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB2Output = ClockNode{
                .name = "APB2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PeriphPrescaler = ClockNode{
                .name = "PeriphPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PeriphPrescOutput = ClockNode{
                .name = "PeriphPrescOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCOMult = ClockNode{
                .name = "MCOMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCODiv = ClockNode{
                .name = "MCODiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCOPin = ClockNode{
                .name = "MCOPin",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSource = ClockNode{
                .name = "PLLSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOIIuput = ClockNode{
                .name = "VCOIIuput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLMUL = ClockNode{
                .name = "PLLMUL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBPres = ClockNode{
                .name = "USBPres",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDIV = ClockNode{
                .name = "PLLDIV",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBOutput = ClockNode{
                .name = "USBOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MSI = ClockNode{
                .name = "MSI",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSE_RTC = ClockNode{
                .name = "HSE_RTC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOOutput = ClockNode{
                .name = "VCOOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLCLK = ClockNode{
                .name = "PLLCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const MSIClockRangeValue: MSIClockRangeList = blk: {
                const user_val = config.MSIClockRange;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MSIRANGE_0 => {},
                        .RCC_MSIRANGE_1 => {},
                        .RCC_MSIRANGE_2 => {},
                        .RCC_MSIRANGE_3 => {},
                        .RCC_MSIRANGE_4 => {},
                        .RCC_MSIRANGE_5 => {},
                        .RCC_MSIRANGE_6 => {},
                    }
                }
                break :blk user_val orelse .RCC_MSIRANGE_5;
            };

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_MSI => SysSourceMSI = true,
                        .RCC_SYSCLKSOURCE_HSI => SysSourceHSI = true,
                        .RCC_SYSCLKSOURCE_HSE => HSEscale = true,
                        .RCC_SYSCLKSOURCE_PLLCLK => PLLscale = true,
                    }
                }
                break :blk user_val orelse {
                    SysSourceMSI = true;
                    break :blk .RCC_SYSCLKSOURCE_MSI;
                };
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((config.flags.USBUsed_ForRCC)) {
                    if (config.PLLSourceVirtual) |val| {
                        if (val != .RCC_PLLSOURCE_HSE) {
                            const patch_str = if (patch_logs) "HSE" else "RCC_PLLSOURCE_HSE";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLLSourceVirtual",
                                "(USBUsed_ForRCC) ",
                                "PLL Mux should have HSE as input",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLLSOURCE_HSE;
                }
                const user_val = config.PLLSourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_HSI => HSIusedPLL = true,
                        .RCC_PLLSOURCE_HSE => {},
                    }
                }
                break :blk user_val orelse {
                    HSIusedPLL = true;
                    break :blk .RCC_PLLSOURCE_HSI;
                };
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    const user_val = config.extra_config.EnbaleCSS;

                    if (user_val) |val| {
                        switch (val) {
                            .true => CSSEnabled = true,
                            .false => {},
                        }
                    }
                    break :blk user_val orelse .false;
                }
                if (config.extra_config.EnbaleCSS) |val| {
                    if (val != .false) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "EnbaleCSS",
                            "Else",
                            "No additional information",
                            "false",
                            val,
                        });
                    }
                }
                break :blk .false;
            };

            const LSI_VALUEValue: f32 = blk: {
                break :blk 3.7e4;
            };

            const LSE_VALUEValue: f32 = blk: {
                if (config.flags.LSEOscillator) {
                    if (config.LSE_VALUE) |val| {
                        if (val != 3.2768e4) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSE_VALUE",
                                "LSEOscillator",
                                "LSE In crystal Mode",
                                3.2768e4,
                                val,
                            });
                        }
                    }
                    LSEOSC.limit = .{
                        .min = 3.2768e4,
                        .max = 3.2768e4,
                    };
                    break :blk 3.2768e4;
                }
                const user_val = config.LSE_VALUE;
                LSEOSC.limit = .{
                    .min = 1e3,
                    .max = 1e6,
                };

                break :blk user_val orelse 3.2768e4;
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: RCC_RTC_Clock_Source_FROM_HSEList = blk: {
                const user_val = config.RCC_RTC_Clock_Source_FROM_HSE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_HSE_DIV2 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV4 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV8 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_HSE_DIV2;
            };

            const RTCClockSelectionVirtualValue: RTCClockSelectionVirtualList = blk: {
                if ((check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_HSE_REQUIRED_TIM11"))) {
                    const user_val = config.RTCClockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .HSERTCDevisor => {},
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                , .{
                                    "RTCClockSelectionVirtual",
                                    "(Semaphore_input_Channel1TIM11 & TIM11 & SEM2RCC_HSE_REQUIRED_TIM11)",
                                    "RTC Mux should have HSE as input when TIM11 remap is used",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSE" else "HSERTCDevisor",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .HSERTCDevisor;
                }
                const user_val = config.RTCClockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => SEMAPHORE_LSE_SELECTED = true,
                        .RCC_RTCCLKSOURCE_LSI => SEMAPHORE_LSI_SELECTED = true,
                        .HSERTCDevisor => {},
                    }
                }
                break :blk user_val orelse {
                    SEMAPHORE_LSI_SELECTED = true;
                    break :blk .RCC_RTCCLKSOURCE_LSI;
                };
            };

            const AHBCLKDividerValue: AHBCLKDividerList = blk: {
                const user_val = config.AHBCLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLK_DIV1 => AHBCLKDivider1 = true,
                        .RCC_SYSCLK_DIV2 => {},
                        .RCC_SYSCLK_DIV4 => {},
                        .RCC_SYSCLK_DIV8 => {},
                        .RCC_SYSCLK_DIV16 => {},
                        .RCC_SYSCLK_DIV64 => {},
                        .RCC_SYSCLK_DIV128 => {},
                        .RCC_SYSCLK_DIV256 => {},
                        .RCC_SYSCLK_DIV512 => {},
                    }
                }
                break :blk user_val orelse {
                    AHBCLKDivider1 = true;
                    break :blk .RCC_SYSCLK_DIV1;
                };
            };

            const TimPrescalerValue: TimPrescalerList = blk: {
                const user_val = config.TimPrescaler;

                if (user_val) |val| {
                    switch (val) {
                        .SYSTICK_CLKSOURCE_HCLK => HCLKDiv1 = true,
                        .SYSTICK_CLKSOURCE_HCLK_DIV8 => {},
                    }
                }
                break :blk user_val orelse {
                    HCLKDiv1 = true;
                    break :blk .SYSTICK_CLKSOURCE_HCLK;
                };
            };

            const APB1CLKDividerValue: APB1CLKDividerList = blk: {
                const user_val = config.APB1CLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HCLK_DIV1 => {},
                        .RCC_HCLK_DIV2 => {},
                        .RCC_HCLK_DIV4 => {},
                        .RCC_HCLK_DIV8 => {},
                        .RCC_HCLK_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_HCLK_DIV1;
            };

            const APB1TimCLKDividerValue: u32 = blk: {
                if (check_ref(@TypeOf(APB1CLKDividerValue), APB1CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) {
                    break :blk 1;
                }
                break :blk 2;
            };

            const APB2CLKDividerValue: APB2CLKDividerList = blk: {
                const user_val = config.APB2CLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HCLK_DIV1 => {},
                        .RCC_HCLK_DIV2 => {},
                        .RCC_HCLK_DIV4 => {},
                        .RCC_HCLK_DIV8 => {},
                        .RCC_HCLK_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_HCLK_DIV1;
            };

            const APB2TimCLKDividerValue: u32 = blk: {
                if (check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) {
                    break :blk 1;
                }
                break :blk 2;
            };

            const RCC_MCOSourceValue: RCC_MCOSourceList = blk: {
                const user_val = config.RCC_MCOSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => {},
                        .RCC_MCO1SOURCE_HSI => {},
                        .RCC_MCO1SOURCE_MSI => {},
                        .RCC_MCO1SOURCE_HSE => {},
                        .RCC_MCO1SOURCE_PLLCLK => MCOSourcePLL = true,
                        .RCC_MCO1SOURCE_LSI => {},
                        .RCC_MCO1SOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
            };

            const RCC_MCODivValue: RCC_MCODivList = blk: {
                const user_val = config.RCC_MCODiv;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCODIV_1 => {},
                        .RCC_MCODIV_2 => {},
                        .RCC_MCODIV_4 => {},
                        .RCC_MCODIV_8 => {},
                        .RCC_MCODIV_16 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCODIV_1;
            };

            const PLLMULValue: PLLMULList = blk: {
                const user_val = config.PLLMUL;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLL_MUL3 => {},
                        .RCC_PLL_MUL4 => {},
                        .RCC_PLL_MUL6 => {},
                        .RCC_PLL_MUL8 => {},
                        .RCC_PLL_MUL12 => {},
                        .RCC_PLL_MUL16 => {},
                        .RCC_PLL_MUL24 => {},
                        .RCC_PLL_MUL32 => {},
                        .RCC_PLL_MUL48 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLL_MUL3;
            };

            const DIV2USBValue: u32 = blk: {
                break :blk 2;
            };

            const PLLDIVValue: PLLDIVList = blk: {
                const user_val = config.PLLDIV;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLL_DIV2 => {},
                        .RCC_PLL_DIV3 => {},
                        .RCC_PLL_DIV4 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLL_DIV2;
            };

            const MSI_VALUEValue: f32 = blk: {
                break :blk 2.097e6;
            };

            const INSTRUCTION_CACHE_ENABLEValue: INSTRUCTION_CACHE_ENABLEList = blk: {
                const user_val = config.extra_config.INSTRUCTION_CACHE_ENABLE;

                if (user_val) |val| {
                    switch (val) {
                        .@"1" => {},
                        .@"0" => {},
                    }
                }
                break :blk user_val orelse .@"1";
            };

            const PREFETCH_ENABLEValue: PREFETCH_ENABLEList = blk: {
                const user_val = config.extra_config.PREFETCH_ENABLE;

                if (user_val) |val| {
                    switch (val) {
                        .@"1" => {},
                        .@"0" => {},
                    }
                }
                break :blk user_val orelse .@"0";
            };

            const DATA_CACHE_ENABLEValue: DATA_CACHE_ENABLEList = blk: {
                const user_val = config.extra_config.DATA_CACHE_ENABLE;

                if (user_val) |val| {
                    switch (val) {
                        .@"1" => {},
                        .@"0" => {},
                    }
                }
                break :blk user_val orelse .@"1";
            };

            const PLLUsedValue: u1 = blk: {
                if ((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and config.flags.MCOConfig) or config.flags.USBUsed_ForRCC or config.flags.SDIOUsed_ForRCC) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if (((HSIusedPLL) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and (config.flags.MCOConfig)) or config.flags.USE_ADC) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSICalibrationValueValue: u32 = blk: {
                if (check_ref(@TypeOf(HSIUsedValue), HSIUsedValue, 1, .@"=")) {
                    const user_val = config.extra_config.HSICalibrationValue;
                    if (user_val) |val| {
                        if (val < 0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "HSICalibrationValue",
                                "HSIUsed=1",
                                "HSI used",
                                0,
                                val,
                            });
                        }
                        if (val > 31) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "HSICalibrationValue",
                                "HSIUsed=1",
                                "HSI used",
                                31,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 16;
                }
                const user_val = config.extra_config.HSICalibrationValue;
                if (user_val) |val| {
                    if (val < 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSICalibrationValue",
                            "Else",
                            "No additional information",
                            0,
                            val,
                        });
                    }
                    if (val > 31) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSICalibrationValue",
                            "Else",
                            "No additional information",
                            31,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 16;
            };

            const MSIUsedValue: u1 = blk: {
                if ((check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_MSI_REQUIRED_TIM11")) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_MSI, .@"=")) and config.flags.MCOConfig)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const MSICalibrationValueValue: u32 = blk: {
                if (check_ref(@TypeOf(MSIUsedValue), MSIUsedValue, 1, .@"=")) {
                    const user_val = config.extra_config.MSICalibrationValue;
                    if (user_val) |val| {
                        if (val < 0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "MSICalibrationValue",
                                "MSIUsed=1",
                                "HSI used",
                                0,
                                val,
                            });
                        }
                        if (val > 255) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "MSICalibrationValue",
                                "MSIUsed=1",
                                "HSI used",
                                255,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 0;
                }
                const user_val = config.extra_config.MSICalibrationValue;
                if (user_val) |val| {
                    if (val < 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "MSICalibrationValue",
                            "Else",
                            "No additional information",
                            0,
                            val,
                        });
                    }
                    if (val > 255) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "MSICalibrationValue",
                            "Else",
                            "No additional information",
                            255,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 0;
            };

            const HSE_TimoutValue: u32 = blk: {
                const user_val = config.extra_config.HSE_Timout;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSE_Timout",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 4294967295) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSE_Timout",
                            "Else",
                            "No additional information",
                            4294967295,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 100;
            };

            const LSE_TimoutValue: u32 = blk: {
                const user_val = config.extra_config.LSE_Timout;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "LSE_Timout",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 4294967295) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "LSE_Timout",
                            "Else",
                            "No additional information",
                            4294967295,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 5000;
            };

            const RTCEnableValue: RTCEnableList = blk: {
                if ((check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_HSE_REQUIRED_TIM11")) or config.flags.RTCUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LCDEnableValue: LCDEnableList = blk: {
                if (config.flags.LCDUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (config.flags.USE_ADC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_HSE_REQUIRED_TIM11")) or (config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSELCDDevisorValue: EnableHSELCDDevisorList = blk: {
                if (config.flags.LCDUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDGUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if (config.flags.MCOConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SDIOEnableValue: SDIOEnableList = blk: {
                if (config.flags.SDIOUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableCSSLSEValue: EnableCSSLSEList = blk: {
                if ((((check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"="))) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
                    const user_val = config.extra_config.EnableCSSLSE;

                    if (user_val) |val| {
                        switch (val) {
                            .true => NVICusedCssLSE = true,
                            .false => {},
                        }
                    }
                    break :blk user_val orelse .false;
                }
                if (config.extra_config.EnableCSSLSE) |val| {
                    if (val != .false) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "EnableCSSLSE",
                            "Else",
                            "No additional information",
                            "false",
                            val,
                        });
                    }
                }
                break :blk .false;
            };

            const EnableHSEValue: EnableHSEList = blk: {
                if ((check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_HSE_REQUIRED_TIM11")) or (config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if ((config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC or (check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_HSE_REQUIRED_TIM11"))) and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSEValue: EnableLSEList = blk: {
                if ((config.flags.LSEOscillator or config.flags.LSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HSEUsedValue: u1 = blk: {
                if ((check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_HSE_REQUIRED_TIM11")) or ((config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC) and !((check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) or (check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) or ((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSE, .@"=")) and (config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSEUsedValue: u1 = blk: {
                if ((check_MCU("Semaphore_TI1_TIM10L1RemapTIM10") and check_MCU("TIM10") and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM10")) or ((check_MCU("Semaphore_ClockSourceETRMode2TIM10") or check_MCU("Semaphore_TriggerSourceETRTIM10") or check_MCU("Semaphore_ETRasClearingSourceTIM10")) and !check_MCU("Semaphore_TIM10_ETR_Remap_TGOTIM10") and check_MCU("TIM10") and check_MCU("SEM2RCC_LSE_REQUIRED_TIM10")) or ((check_MCU("Semaphore_ClockSourceETRMode2TIM11") or check_MCU("Semaphore_TriggerSourceETRTIM11") or check_MCU("Semaphore_ETRasClearingSourceTIM11")) and !check_MCU("Semaphore_TIM11_ETR_Remap_TGOTIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_LSE_REQUIRED_TIM11")) or ((check_MCU("Semaphore_input_Channel1TIM9") and check_MCU("TIM9") and check_MCU("SEM2RCC_LSE_REQUIRED_TIM9")) and (config.flags.LSEByPass or config.flags.LSEOscillator)) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and config.flags.MCOConfig) or ((check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSIUsedValue: u1 = blk: {
                if ((check_MCU("Semaphore_TI1_TIM10L1RemapTIM10") and check_MCU("TIM10") and check_MCU("SEM2RCC_LSI_REQUIRED_TIM10")) or (config.flags.IWDGUsed_ForRCC or ((check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC)) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSI, .@"=")) and (config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE ADCOutput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                ADCOutput.nodetype = .output;
                ADCOutput.parents = &.{&HSIRC};
            }
            // ======= NODE MSIRC ======
            MSIRC.nodetype = .source;
            MSIRC.value = try MSIClockRangeValue.get();

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE HSERTCDevisor ======
            if (check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=") or check_ref(@TypeOf(EnableHSELCDDevisorValue), EnableHSELCDDevisorValue, .true, .@"=")) {
                HSERTCDevisor.nodetype = .div;
                HSERTCDevisor.value = try RCC_RTC_Clock_Source_FROM_HSEValue.get();
                HSERTCDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE RTCClkSource ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=") or check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RTCClockSelectionVirtualValue) {
                    .HSERTCDevisor => &.{&HSERTCDevisor},
                    .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RTCCLKSOURCE_LSI => &.{&LSIRC},
                };
            }
            // ======= NODE RTCOutput ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")) {
                RTCOutput.nodetype = .output;
                RTCOutput.parents = &.{&RTCClkSource};
            }
            // ======= NODE LCDOutput ======
            if (check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")) {
                LCDOutput.nodetype = .output;
                LCDOutput.parents = &.{&RTCClkSource};
            }
            // ======= NODE IWDGOutput ======
            if (check_ref(@TypeOf(IWDGEnableValue), IWDGEnableValue, .true, .@"=")) {
                IWDGOutput.nodetype = .output;
                IWDGOutput.parents = &.{&LSIRC};
            }
            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_MSI => &.{&MSIRC},
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLDIV},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE PWROutput ======
            PWROutput.nodetype = .output;
            PWROutput.parents = &.{&SysCLKOutput};

            // ======= NODE AHBPrescaler ======
            AHBPrescaler.nodetype = .div;
            AHBPrescaler.value = try AHBCLKDividerValue.get();
            AHBPrescaler.parents = &.{&SysCLKOutput};

            // ======= NODE AHBOutput ======
            AHBOutput.nodetype = .output;
            AHBOutput.parents = &.{&AHBPrescaler};

            // ======= NODE HCLKOutput ======
            HCLKOutput.nodetype = .output;
            HCLKOutput.parents = &.{&AHBOutput};

            // ======= NODE TIMPrescaler ======
            TIMPrescaler.nodetype = .div;
            TIMPrescaler.value = try TimPrescalerValue.get();
            TIMPrescaler.parents = &.{&AHBOutput};

            // ======= NODE TIMOutput ======
            TIMOutput.nodetype = .output;
            TIMOutput.parents = &.{&TIMPrescaler};

            // ======= NODE FCLKCortexOutput ======
            FCLKCortexOutput.nodetype = .output;
            FCLKCortexOutput.parents = &.{&AHBOutput};

            // ======= NODE APB1Prescaler ======
            APB1Prescaler.nodetype = .div;
            APB1Prescaler.value = try APB1CLKDividerValue.get();
            APB1Prescaler.parents = &.{&AHBOutput};

            // ======= NODE APB1Output ======
            APB1Output.nodetype = .output;
            APB1Output.parents = &.{&APB1Prescaler};

            // ======= NODE TimPrescalerAPB1 ======
            TimPrescalerAPB1.nodetype = .mul;
            TimPrescalerAPB1.value = @floatFromInt(APB1TimCLKDividerValue);
            TimPrescalerAPB1.parents = &.{&APB1Prescaler};

            // ======= NODE TimPrescOut ======
            TimPrescOut.nodetype = .output;
            TimPrescOut.parents = &.{&TimPrescalerAPB1};

            // ======= NODE APB2Prescaler ======
            APB2Prescaler.nodetype = .div;
            APB2Prescaler.value = try APB2CLKDividerValue.get();
            APB2Prescaler.parents = &.{&AHBOutput};

            // ======= NODE APB2Output ======
            APB2Output.nodetype = .output;
            APB2Output.parents = &.{&APB2Prescaler};

            // ======= NODE PeriphPrescaler ======
            PeriphPrescaler.nodetype = .mul;
            PeriphPrescaler.value = @floatFromInt(APB2TimCLKDividerValue);
            PeriphPrescaler.parents = &.{&APB2Prescaler};

            // ======= NODE PeriphPrescOutput ======
            PeriphPrescOutput.nodetype = .output;
            PeriphPrescOutput.parents = &.{&PeriphPrescaler};

            // ======= NODE MCOMult ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCOSourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLDIV},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO1SOURCE_MSI => &.{&MSIRC},
                };
            }
            // ======= NODE MCODiv ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCODiv.nodetype = .div;
                MCODiv.value = try RCC_MCODivValue.get();
                MCODiv.parents = &.{&MCOMult};
            }
            // ======= NODE MCOPin ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCOPin.nodetype = .output;
                MCOPin.parents = &.{&MCODiv};
            }
            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                .RCC_PLLSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE VCOIIuput ======
            VCOIIuput.nodetype = .output;
            VCOIIuput.parents = &.{&PLLSource};

            // ======= NODE PLLMUL ======
            PLLMUL.nodetype = .mul;
            PLLMUL.value = try PLLMULValue.get();
            PLLMUL.parents = &.{&VCOIIuput};

            // ======= NODE USBPres ======
            USBPres.nodetype = .div;
            USBPres.value = @floatFromInt(DIV2USBValue);
            USBPres.parents = &.{&PLLMUL};

            // ======= NODE PLLDIV ======
            PLLDIV.nodetype = .div;
            PLLDIV.value = try PLLDIVValue.get();
            PLLDIV.parents = &.{&PLLMUL};

            // ======= NODE USBOutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDIOEnableValue), SDIOEnableValue, .true, .@"=")) {
                USBOutput.nodetype = .output;
                USBOutput.parents = &.{&USBPres};
            }
            // ======= NODE MSI ======
            MSI.nodetype = .output;
            MSI.parents = &.{&MSIRC};

            // ======= NODE HSE_RTC ======
            HSE_RTC.nodetype = .output;
            HSE_RTC.parents = &.{&HSERTCDevisor};

            // ======= NODE VCOOutput ======
            VCOOutput.nodetype = .output;
            VCOOutput.parents = &.{&PLLMUL};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLLDIV};

            //======== POST REFS ========

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCOutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 3.2e7,
            };

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@">")))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE1) {
                            const patch_str = if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PWR_Regulator_Voltage_Scale",
                                "((HCLKFreq_Value > 16000000))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@">")))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale11 = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "PWR_Regulator_Voltage_Scale",
                                    "((HCLKFreq_Value > 8000000))",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale11 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                } else if ((((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@">")))) and check_MCU("STM32L162")) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "PWR_Regulator_Voltage_Scale",
                                    "(((HCLKFreq_Value > 4200000))) & STM32L162",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                } else if ((((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4000000, .@">")))) and !check_MCU("STM32L162")) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "PWR_Regulator_Voltage_Scale",
                                    "(((HCLKFreq_Value > 4000000))) & !STM32L162",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                }
                const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                if (user_val) |val| {
                    switch (val) {
                        .PWR_REGULATOR_VOLTAGE_SCALE3 => scale3 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                    }
                }
                break :blk user_val orelse {
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                };
            };

            const HSE_VALUEValue: f32 = blk: {
                if ((((PLLscale) or CSSEnabled)) and config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 3.2e7,
                    };

                    break :blk user_val orelse 2.4e7;
                } else if (HSEscale and config.flags.HSEByPass and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE3, .@"="))) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 8e6,
                    };

                    break :blk user_val orelse 2.4e7;
                } else if (HSEscale and config.flags.HSEByPass and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE2, .@"="))) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 1.6e7,
                    };

                    break :blk user_val orelse 2.4e7;
                } else if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 3.2e7,
                    };

                    break :blk user_val orelse 2.4e7;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 1e6,
                    .max = 2.4e7,
                };

                break :blk user_val orelse 2.4e7;
            };

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")))) {
                RTCOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                };
            }

            //======= LCDFreq_Value ========
            const LCDFreq_ValueValue = LCDOutput.get_as_ref();
            ignore_value(LCDFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")))) {
                LCDOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC) {
                const max_SysCLKOutput = 32000000;
                const min_SysCLKOutput = RTCFreq_ValueValue;

                SysCLKOutput.limit = .{
                    .min = min_SysCLKOutput,
                    .max = max_SysCLKOutput,
                    .min_expr = "=RTCFreq_Value",
                    .max_expr = "32000000",
                };
            } else {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 3.2e7,
                };
            }

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWROutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= TimerFreq_Value ========
            const TimerFreq_ValueValue = TIMOutput.get_as_ref();
            ignore_value(TimerFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);
            if ((config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC) and !config.flags.USBUsed_ForRCC) {
                const max_APB1Output = 32000000;
                const min_APB1Output = RTCFreq_ValueValue;

                APB1Output.limit = .{
                    .min = min_APB1Output,
                    .max = max_APB1Output,
                    .min_expr = "=RTCFreq_Value",
                    .max_expr = "32000000",
                };
            } else if (config.flags.USBUsed_ForRCC) {
                APB1Output.limit = .{
                    .min = 1e7,
                    .max = 3.2e7,
                };
            } else {
                APB1Output.limit = .{
                    .min = null,
                    .max = 3.2e7,
                };
            }

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 3.2e7,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = PeriphPrescOutput.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= MCOPinFreq_Value ========
            const MCOPinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCOPinFreq_ValueValue);

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOIIuput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOIIuput.limit = .{
                    .min = 2e6,
                    .max = 2.4e7,
                };
            }

            //======= 48MHZClocksFreq_Value ========
            const @"48MHZClocksFreq_ValueValue" = USBOutput.get_as_ref();
            ignore_value(@"48MHZClocksFreq_ValueValue");

            USBOutput.limit = .{
                .min = 4.788e7,
                .max = 4.812e7,
            };

            //======= RTCHSEDivFreq_Value ========
            const RTCHSEDivFreq_ValueValue = HSE_RTC.get_as_ref();
            ignore_value(RTCHSEDivFreq_ValueValue);

            HSE_RTC.limit = .{
                .min = 0e0,
                .max = 1e6,
            };

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE1, .@"="))) {
                VCOOutput.limit = .{
                    .min = null,
                    .max = 9.6e7,
                };
            } else if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and ((check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE2, .@"=")))) {
                VCOOutput.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            } else if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and ((check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE3, .@"=")))) {
                VCOOutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= PLLCLKFreq_Value ========
            const PLLCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLCLKFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE1, .@"="))) {
                PLLCLK.limit = .{
                    .min = 2e6,
                    .max = 3.2e7,
                };
            } else if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and ((check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE2, .@"=")))) {
                PLLCLK.limit = .{
                    .min = 2e6,
                    .max = 1.6e7,
                };
            } else if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and ((check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE3, .@"=")))) {
                PLLCLK.limit = .{
                    .min = 2e6,
                    .max = 4e6,
                };
            } else {
                PLLCLK.limit = .{
                    .min = 2e6,
                    .max = null,
                };
            }

            const VDD_VALUEValue: f32 = blk: {
                if (check_MCU("STM32L100_Value_Line") and !check_MCU("DIE427")) {
                    const user_val = config.extra_config.VDD_VALUE;
                    if (user_val) |val| {
                        if (val < 1.8e0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {e} found: {e}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "VDD_VALUE",
                                " STM32L100_Value_Line & !DIE427",
                                "",
                                1.8e0,
                                val,
                            });
                        }
                        if (val > 3.6e0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {e} found: {e}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "VDD_VALUE",
                                " STM32L100_Value_Line & !DIE427",
                                "",
                                3.6e0,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 3.3e0;
                } else if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@">")) and (!check_MCU("STM32L100_Value_Line") or check_MCU("DIE427"))) {
                    const user_val = config.extra_config.VDD_VALUE;
                    if (user_val) |val| {
                        if (val < 1.71e0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {e} found: {e}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "VDD_VALUE",
                                "(HCLKFreq_Value > 16000000) & (!STM32L100_Value_Line | DIE427)",
                                "",
                                1.71e0,
                                val,
                            });
                        }
                        if (val > 3.6e0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {e} found: {e}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "VDD_VALUE",
                                "(HCLKFreq_Value > 16000000) & (!STM32L100_Value_Line | DIE427)",
                                "",
                                3.6e0,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 3.3e0;
                }
                const user_val = config.extra_config.VDD_VALUE;
                if (user_val) |val| {
                    if (val < 1.65e0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {e} found: {e}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "VDD_VALUE",
                            "Else",
                            "No additional information",
                            1.65e0,
                            val,
                        });
                    }
                    if (val > 3.6e0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {e} found: {e}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "VDD_VALUE",
                            "Else",
                            "No additional information",
                            3.6e0,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 3.3e0;
            };

            const FLatencyValue: FLatencyList = blk: {
                if ((((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.71, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.71, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"="))))) and (scale1 or scale11)) or (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"="))))) and (scale2)) or (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_MCU("DIE416") or check_MCU("STM32L162")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 2100000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 2100000, .@"="))))) and (scale3)) or (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and (!(check_MCU("DIE416") or check_MCU("STM32L162")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@"="))))) and (scale3))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "\r\n\t\t(((((VDD_VALUE > 1.71)|(VDD_VALUE= 1.71)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6 ))) & (   ((HCLKFreq_Value < 16000000)|(HCLKFreq_Value= 16000000 )))) & (scale1|scale11))|\r\n\t\t(((((VDD_VALUE > 1.65)|(VDD_VALUE=1.65)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6))) & (  ((HCLKFreq_Value < 8000000)|(HCLKFreq_Value =8000000 )))) &(scale2) )|\r\n\t\t(((((VDD_VALUE > 1.65)|(VDD_VALUE=1.65)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6))) & (  (DIE416|STM32L162) &((HCLKFreq_Value < 2100000)|(HCLKFreq_Value =2100000 )))) &(scale3) )|\r\n\t\t(((((VDD_VALUE > 1.65)|(VDD_VALUE=1.65)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6))) & (  !(DIE416|STM32L162) &((HCLKFreq_Value < 4200000)|(HCLKFreq_Value =4200000 )))) &(scale3) )",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if ((((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.71, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.71, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"="))))) and (scale1 or scale11)) or (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"="))))) and (scale2)) or (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_MCU("DIE416") or check_MCU("STM32L162")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@"="))))) and (scale3)) or (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.65, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and (!(check_MCU("DIE416") or check_MCU("STM32L162")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"="))))) and (scale3))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_1) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "\r\n\t\t(((((VDD_VALUE > 1.71)|(VDD_VALUE= 1.71)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6 ))) & (   ((HCLKFreq_Value < 32000000)|(HCLKFreq_Value= 32000000 )))) & (scale1|scale11))|\r\n\t\t(((((VDD_VALUE > 1.65)|(VDD_VALUE=1.65)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6))) & (  ((HCLKFreq_Value < 16000000)|(HCLKFreq_Value =16000000 )))) &(scale2) )|\r\n\t\t(((((VDD_VALUE > 1.65)|(VDD_VALUE=1.65)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6))) & (  (DIE416|STM32L162) &((HCLKFreq_Value < 4200000)|(HCLKFreq_Value =4200000 )))) &(scale3) )|\r\n\t\t(((((VDD_VALUE > 1.65)|(VDD_VALUE=1.65)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE = 3.6))) & (  !(DIE416|STM32L162) &((HCLKFreq_Value < 8000000)|(HCLKFreq_Value =8000000 )))) &(scale3) )",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    FLASH_LATENCY1 = true;
                    break :blk .FLASH_LATENCY_1;
                }
                const user_val = config.extra_config.FLatency;

                if (user_val) |val| {
                    switch (val) {
                        .FLASH_LATENCY_0 => {},
                        .FLASH_LATENCY_1 => FLASH_LATENCY1 = true,
                    }
                }
                break :blk user_val orelse .FLASH_LATENCY_0;
            };
            out.HSIRC = try HSIRC.get_output();
            out.ADCOutput = try ADCOutput.get_output();
            out.MSIRC = try MSIRC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.LCDOutput = try LCDOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.PWROutput = try PWROutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.TIMPrescaler = try TIMPrescaler.get_output();
            out.TIMOutput = try TIMOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.APB1Prescaler = try APB1Prescaler.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.TimPrescalerAPB1 = try TimPrescalerAPB1.get_output();
            out.TimPrescOut = try TimPrescOut.get_output();
            out.APB2Prescaler = try APB2Prescaler.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.PeriphPrescaler = try PeriphPrescaler.get_output();
            out.PeriphPrescOutput = try PeriphPrescOutput.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.VCOIIuput = try VCOIIuput.get_output();
            out.PLLMUL = try PLLMUL.get_output();
            out.USBPres = try USBPres.get_output();
            out.PLLDIV = try PLLDIV.get_output();
            out.USBOutput = try USBOutput.get_output();
            out.MSI = try MSI.get_extra_output();
            out.HSE_RTC = try HSE_RTC.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.TIMCLK = 0;
            ignore_value(HSI_VALUEValue);
            ignore_value(ADCFreq_ValueValue);
            ref_out.MSIClockRange = MSIClockRangeValue;
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelectionVirtual = RTCClockSelectionVirtualValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(LCDFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ignore_value(PWRFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ref_out.TimPrescaler = TimPrescalerValue;
            ignore_value(TimerFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APB1Freq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APB1TimFreq_ValueValue);
            ref_out.APB2CLKDivider = APB2CLKDividerValue;
            ignore_value(APB2Freq_ValueValue);
            ref_out.APB2TimCLKDivider = APB2TimCLKDividerValue;
            ignore_value(APB2TimFreq_ValueValue);
            ref_out.RCC_MCOSource = RCC_MCOSourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCOPinFreq_ValueValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ignore_value(VCOInputFreq_ValueValue);
            ref_out.PLLMUL = PLLMULValue;
            ref_out.DIV2USB = DIV2USBValue;
            ref_out.PLLDIV = PLLDIVValue;
            ignore_value(@"48MHZClocksFreq_ValueValue");
            ignore_value(MSI_VALUEValue);
            ignore_value(RTCHSEDivFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.MSICalibrationValue = MSICalibrationValueValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.MSIUsed = MSIUsedValue != 0;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.SDIOEnable = SDIOEnableValue == .true;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.HSEUsed = HSEUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.LSIUsed = LSIUsedValue != 0;
            ref_out.flags.EnbaleCSS = EnbaleCSSValue == .true;

            return CubemxTreeOutput{
                .clock = out,
                .config = ref_out,
            };
        }
        pub fn get_clocks(config: Config) anyerror!TreeOutput {
            const ret = try get_cubemx_clocks(try config.to_cubemx_config(), true);
            return TreeOutput{
                .clock = ret.clock,
                .config = try OutputConfig.from_cubemx_output_config(ret.config),
            };
        }
    };
}
