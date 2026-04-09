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
            Div3 = 1,
            Div5 = 2,
            Div6 = 5,
            Div10 = 6,
            Div32 = 7,
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
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 1,
            MSI = 2,
            HSI = 3,
            HSE = 4,
            PLL1_R = 5,
            LSI = 6,
            LSE = 8,
            PLL1_P = 13,
            PLL1_Q = 14,
        };
        pub const RCC_PLLM = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div3 = 2,
            Div4 = 3,
            Div5 = 4,
            Div6 = 5,
            Div7 = 6,
            Div8 = 7,
        };
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
        };
        pub const RCC_MSIRANGE = enum(u4) {
            Range100K = 0,
            Range200K = 1,
            Range400K = 2,
            Range800K = 3,
            Range1M = 4,
            Range2M = 5,
            Range4M = 6,
            Range8M = 7,
            Range16M = 8,
            Range24M = 9,
            Range32M = 10,
            Range48M = 11,
        };
        pub const RCC_SPI2S2SEL = enum(u2) {
            PLL1_Q = 1,
            HSI = 2,
            I2S_CKIN = 3,
        };
        pub const PWR_VOS = enum(u2) {
            Range1 = 1,
            Range2 = 2,
        };
        pub const RCC_PLLP = enum(u5) {
            Div2 = 1,
            Div3 = 2,
            Div4 = 3,
            Div5 = 4,
            Div6 = 5,
            Div7 = 6,
            Div8 = 7,
            Div9 = 8,
            Div10 = 9,
            Div11 = 10,
            Div12 = 11,
            Div13 = 12,
            Div14 = 13,
            Div15 = 14,
            Div16 = 15,
            Div17 = 16,
            Div18 = 17,
            Div19 = 18,
            Div20 = 19,
            Div21 = 20,
            Div22 = 21,
            Div23 = 22,
            Div24 = 23,
            Div25 = 24,
            Div26 = 25,
            Div27 = 26,
            Div28 = 27,
            Div29 = 28,
            Div30 = 29,
            Div31 = 30,
        };
        pub const RCC_ADCSEL = enum(u2) {
            HSI = 1,
            PLL1_P = 2,
            SYS = 3,
        };
        pub const RCC_LPTIMSEL = enum(u2) {
            PCLK1 = 0,
            LSI = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_RNGSEL = enum(u2) {
            PLL1_Q = 0,
            LSI = 1,
            LSE = 2,
            MSI = 3,
        };
        pub const RCC_PLLSRC = enum(u2) {
            MSI = 1,
            HSI = 2,
            HSE = 3,
        };

        pub const LSIDIVList = enum {
            RCC_LSI_DIV1,
            RCC_LSI_DIV128,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_LSI_DIV128 => .Div128,
                    .RCC_LSI_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div128 => .RCC_LSI_DIV128,
                    .Div1 => .RCC_LSI_DIV1,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "LSIDIV" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_LSI_DIV1 => 1,
                    .RCC_LSI_DIV128 => 128,
                };
            }
        };

        pub const MSIClockRangeList = enum {
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

            pub fn to_enum(self: @This()) anyerror!RCC_MSIRANGE {
                return switch (self) {
                    .RCC_MSIRANGE_11 => .Range48M,
                    .RCC_MSIRANGE_5 => .Range2M,
                    .RCC_MSIRANGE_8 => .Range16M,
                    .RCC_MSIRANGE_0 => .Range100K,
                    .RCC_MSIRANGE_10 => .Range32M,
                    .RCC_MSIRANGE_9 => .Range24M,
                    .RCC_MSIRANGE_7 => .Range8M,
                    .RCC_MSIRANGE_2 => .Range400K,
                    .RCC_MSIRANGE_6 => .Range4M,
                    .RCC_MSIRANGE_4 => .Range1M,
                    .RCC_MSIRANGE_1 => .Range200K,
                    .RCC_MSIRANGE_3 => .Range800K,
                };
            }
            pub fn from_enum(item: RCC_MSIRANGE) anyerror!@This() {
                return switch (item) {
                    .Range48M => .RCC_MSIRANGE_11,
                    .Range2M => .RCC_MSIRANGE_5,
                    .Range16M => .RCC_MSIRANGE_8,
                    .Range100K => .RCC_MSIRANGE_0,
                    .Range32M => .RCC_MSIRANGE_10,
                    .Range24M => .RCC_MSIRANGE_9,
                    .Range8M => .RCC_MSIRANGE_7,
                    .Range400K => .RCC_MSIRANGE_2,
                    .Range4M => .RCC_MSIRANGE_6,
                    .Range1M => .RCC_MSIRANGE_4,
                    .Range200K => .RCC_MSIRANGE_1,
                    .Range800K => .RCC_MSIRANGE_3,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MSIRANGE_0 => 100000,
                    .RCC_MSIRANGE_1 => 200000,
                    .RCC_MSIRANGE_2 => 400000,
                    .RCC_MSIRANGE_3 => 800000,
                    .RCC_MSIRANGE_4 => 1000000,
                    .RCC_MSIRANGE_5 => 2000000,
                    .RCC_MSIRANGE_6 => 4000000,
                    .RCC_MSIRANGE_7 => 8000000,
                    .RCC_MSIRANGE_8 => 16000000,
                    .RCC_MSIRANGE_9 => 24000000,
                    .RCC_MSIRANGE_10 => 32000000,
                    .RCC_MSIRANGE_11 => 48000000,
                };
            }
        };

        pub const LPTIM1CLockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_PCLK1,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_HSI,
            RCC_LPTIM1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                    .HSI => .RCC_LPTIM1CLKSOURCE_HSI,
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_PCLK1,
                };
            }
        };

        pub const USART2CLockSelectionList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,
        };

        pub const LSCOSource1List = enum {
            RCC_LSCOSOURCE_LSI,
            RCC_LSCOSOURCE_LSE,
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

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_MSI,
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSE => .HSE,
                    .RCC_PLLSOURCE_MSI => .MSI,
                    .RCC_PLLSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_PLLSOURCE_HSE,
                    .MSI => .RCC_PLLSOURCE_MSI,
                    .HSI => .RCC_PLLSOURCE_HSI,
                };
            }
        };

        pub const PLLMList = enum {
            RCC_PLLM_DIV1,
            RCC_PLLM_DIV2,
            RCC_PLLM_DIV3,
            RCC_PLLM_DIV4,
            RCC_PLLM_DIV5,
            RCC_PLLM_DIV6,
            RCC_PLLM_DIV7,
            RCC_PLLM_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLM {
                return switch (self) {
                    .RCC_PLLM_DIV5 => .Div5,
                    .RCC_PLLM_DIV1 => .Div1,
                    .RCC_PLLM_DIV3 => .Div3,
                    .RCC_PLLM_DIV6 => .Div6,
                    .RCC_PLLM_DIV7 => .Div7,
                    .RCC_PLLM_DIV8 => .Div8,
                    .RCC_PLLM_DIV4 => .Div4,
                    .RCC_PLLM_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_PLLM) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_PLLM_DIV5,
                    .Div1 => .RCC_PLLM_DIV1,
                    .Div3 => .RCC_PLLM_DIV3,
                    .Div6 => .RCC_PLLM_DIV6,
                    .Div7 => .RCC_PLLM_DIV7,
                    .Div8 => .RCC_PLLM_DIV8,
                    .Div4 => .RCC_PLLM_DIV4,
                    .Div2 => .RCC_PLLM_DIV2,
                };
            }
            pub fn get(self: @This()) !f32 {
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

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,
            RCC_RTCCLKSOURCE_HSE_DIV32,

            pub fn to_enum(self: @This()) anyerror!RCC_RTCSEL {
                return switch (self) {
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                    .RCC_RTCCLKSOURCE_LSI => .LSI,
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => .HSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .HSE => .RCC_RTCCLKSOURCE_HSE_DIV32,
                };
            }
        };

        pub const USART1CLockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK2,
            RCC_USART1CLKSOURCE_SYSCLK,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,
        };

        pub const LPUART1CLockSelectionList = enum {
            RCC_LPUART1CLKSOURCE_PCLK1,
            RCC_LPUART1CLKSOURCE_SYSCLK,
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPUART1CLKSOURCE_SYSCLK => .LSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PCLK1 => .RCC_LPUART1CLKSOURCE_PCLK1,
                    .LSI => .RCC_LPUART1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const LPTIM2CLockSelectionList = enum {
            RCC_LPTIM2CLKSOURCE_PCLK1,
            RCC_LPTIM2CLKSOURCE_LSI,
            RCC_LPTIM2CLKSOURCE_HSI,
            RCC_LPTIM2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPTIM2CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_LPTIM2CLKSOURCE_PCLK1,
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .HSI => .RCC_LPTIM2CLKSOURCE_HSI,
                };
            }
        };

        pub const LPTIM3CLockSelectionList = enum {
            RCC_LPTIM3CLKSOURCE_PCLK1,
            RCC_LPTIM3CLKSOURCE_LSI,
            RCC_LPTIM3CLKSOURCE_HSI,
            RCC_LPTIM3CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPTIM3CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM3CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM3CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM3CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_LPTIM3CLKSOURCE_LSI,
                    .LSE => .RCC_LPTIM3CLKSOURCE_LSE,
                    .HSI => .RCC_LPTIM3CLKSOURCE_HSI,
                    .PCLK1 => .RCC_LPTIM3CLKSOURCE_PCLK1,
                };
            }
        };

        pub const RNGCLockSelectionList = enum {
            RCC_RNGCLKSOURCE_PLL,
            RCC_RNGCLKSOURCE_LSI,
            RCC_RNGCLKSOURCE_LSE,
            RCC_RNGCLKSOURCE_MSI,

            pub fn to_enum(self: @This()) anyerror!RCC_RNGSEL {
                return switch (self) {
                    .RCC_RNGCLKSOURCE_LSI => .LSI,
                    .RCC_RNGCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_RNGCLKSOURCE_MSI => .MSI,
                    .RCC_RNGCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RNGSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RNGCLKSOURCE_LSI,
                    .PLL1_Q => .RCC_RNGCLKSOURCE_PLL,
                    .MSI => .RCC_RNGCLKSOURCE_MSI,
                    .LSE => .RCC_RNGCLKSOURCE_LSE,
                };
            }
        };

        pub const I2C2CLockSelectionList = enum {
            RCC_I2C2CLKSOURCE_PCLK1,
            RCC_I2C2CLKSOURCE_SYSCLK,
            RCC_I2C2CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI2S2SEL {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_PCLK1 => .PLL1_Q,
                    .RCC_I2C2CLKSOURCE_SYSCLK => .I2S_CKIN,
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_SPI2S2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_I2C2CLKSOURCE_PCLK1,
                    .I2S_CKIN => .RCC_I2C2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C2CLKSOURCE_HSI,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
            RCC_I2C1CLKSOURCE_PCLK1,
            RCC_I2C1CLKSOURCE_SYSCLK,
            RCC_I2C1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI2S2SEL {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PLL1_Q,
                    .RCC_I2C1CLKSOURCE_SYSCLK => .I2S_CKIN,
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_SPI2S2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_I2C1CLKSOURCE_PCLK1,
                    .I2S_CKIN => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
                };
            }
        };

        pub const I2C3CLockSelectionList = enum {
            RCC_I2C3CLKSOURCE_PCLK1,
            RCC_I2C3CLKSOURCE_SYSCLK,
            RCC_I2C3CLKSOURCE_HSI,
        };

        pub const I2S2CLockSelectionList = enum {
            RCC_I2S2CLKSOURCE_PLL,
            RCC_I2S2CLKSOURCE_HSI,
            RCC_I2S2CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI2S2SEL {
                return switch (self) {
                    .RCC_I2S2CLKSOURCE_HSI => .HSI,
                    .RCC_I2S2CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_I2S2CLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_SPI2S2SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2S2CLKSOURCE_HSI,
                    .I2S_CKIN => .RCC_I2S2CLKSOURCE_PIN,
                    .PLL1_Q => .RCC_I2S2CLKSOURCE_PLL,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCCLKSOURCE_HSI,
            RCC_ADCCLKSOURCE_PLL,
            RCC_ADCCLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADCCLKSOURCE_PLL => .PLL1_P,
                    .RCC_ADCCLKSOURCE_HSI => .HSI,
                    .RCC_ADCCLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_ADCCLKSOURCE_PLL,
                    .HSI => .RCC_ADCCLKSOURCE_HSI,
                    .SYS => .RCC_ADCCLKSOURCE_SYSCLK,
                };
            }
        };

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_MSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_PLLCLK,
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_PLLPCLK,
            RCC_MCO1SOURCE_PLLQCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_PLLPCLK => .PLL1_R,
                    .RCC_MCO1SOURCE_PLLQCLK => .PLL1_Q,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL1_P,
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
                    .PLL1_R => .RCC_MCO1SOURCE_PLLPCLK,
                    .PLL1_Q => .RCC_MCO1SOURCE_PLLQCLK,
                    .PLL1_P => .RCC_MCO1SOURCE_PLLCLK,
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

        pub const AHB3CLKDividerList = enum {
            RCC_SYSCLK_DIV1,
            RCC_SYSCLK_DIV2,
            RCC_SYSCLK_DIV3,
            RCC_SYSCLK_DIV4,
            RCC_SYSCLK_DIV5,
            RCC_SYSCLK_DIV6,
            RCC_SYSCLK_DIV8,
            RCC_SYSCLK_DIV10,
            RCC_SYSCLK_DIV16,
            RCC_SYSCLK_DIV32,
            RCC_SYSCLK_DIV64,
            RCC_SYSCLK_DIV128,
            RCC_SYSCLK_DIV256,
            RCC_SYSCLK_DIV512,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_SYSCLK_DIV5 => .Div5,
                    .RCC_SYSCLK_DIV3 => .Div3,
                    .RCC_SYSCLK_DIV6 => .Div6,
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV256 => .Div256,
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV8 => .Div8,
                    .RCC_SYSCLK_DIV64 => .Div64,
                    .RCC_SYSCLK_DIV32 => .Div32,
                    .RCC_SYSCLK_DIV128 => .Div128,
                    .RCC_SYSCLK_DIV10 => .Div10,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV512 => .Div512,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_SYSCLK_DIV5,
                    .Div3 => .RCC_SYSCLK_DIV3,
                    .Div6 => .RCC_SYSCLK_DIV6,
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div256 => .RCC_SYSCLK_DIV256,
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div8 => .RCC_SYSCLK_DIV8,
                    .Div64 => .RCC_SYSCLK_DIV64,
                    .Div32 => .RCC_SYSCLK_DIV32,
                    .Div128 => .RCC_SYSCLK_DIV128,
                    .Div10 => .RCC_SYSCLK_DIV10,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div512 => .RCC_SYSCLK_DIV512,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_SYSCLK_DIV1 => 1,
                    .RCC_SYSCLK_DIV2 => 2,
                    .RCC_SYSCLK_DIV3 => 3,
                    .RCC_SYSCLK_DIV4 => 4,
                    .RCC_SYSCLK_DIV5 => 5,
                    .RCC_SYSCLK_DIV6 => 6,
                    .RCC_SYSCLK_DIV8 => 8,
                    .RCC_SYSCLK_DIV10 => 10,
                    .RCC_SYSCLK_DIV16 => 16,
                    .RCC_SYSCLK_DIV32 => 32,
                    .RCC_SYSCLK_DIV64 => 64,
                    .RCC_SYSCLK_DIV128 => 128,
                    .RCC_SYSCLK_DIV256 => 256,
                    .RCC_SYSCLK_DIV512 => 512,
                };
            }
        };

        pub const AHB2CLKDividerList = enum {
            RCC_SYSCLK_DIV1,
            RCC_SYSCLK_DIV2,
            RCC_SYSCLK_DIV3,
            RCC_SYSCLK_DIV4,
            RCC_SYSCLK_DIV5,
            RCC_SYSCLK_DIV6,
            RCC_SYSCLK_DIV8,
            RCC_SYSCLK_DIV10,
            RCC_SYSCLK_DIV16,
            RCC_SYSCLK_DIV32,
            RCC_SYSCLK_DIV64,
            RCC_SYSCLK_DIV128,
            RCC_SYSCLK_DIV256,
            RCC_SYSCLK_DIV512,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_SYSCLK_DIV5 => .Div5,
                    .RCC_SYSCLK_DIV3 => .Div3,
                    .RCC_SYSCLK_DIV6 => .Div6,
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV256 => .Div256,
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV8 => .Div8,
                    .RCC_SYSCLK_DIV64 => .Div64,
                    .RCC_SYSCLK_DIV32 => .Div32,
                    .RCC_SYSCLK_DIV128 => .Div128,
                    .RCC_SYSCLK_DIV10 => .Div10,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV512 => .Div512,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_SYSCLK_DIV5,
                    .Div3 => .RCC_SYSCLK_DIV3,
                    .Div6 => .RCC_SYSCLK_DIV6,
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div256 => .RCC_SYSCLK_DIV256,
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div8 => .RCC_SYSCLK_DIV8,
                    .Div64 => .RCC_SYSCLK_DIV64,
                    .Div32 => .RCC_SYSCLK_DIV32,
                    .Div128 => .RCC_SYSCLK_DIV128,
                    .Div10 => .RCC_SYSCLK_DIV10,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div512 => .RCC_SYSCLK_DIV512,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_SYSCLK_DIV1 => 1,
                    .RCC_SYSCLK_DIV2 => 2,
                    .RCC_SYSCLK_DIV3 => 3,
                    .RCC_SYSCLK_DIV4 => 4,
                    .RCC_SYSCLK_DIV5 => 5,
                    .RCC_SYSCLK_DIV6 => 6,
                    .RCC_SYSCLK_DIV8 => 8,
                    .RCC_SYSCLK_DIV10 => 10,
                    .RCC_SYSCLK_DIV16 => 16,
                    .RCC_SYSCLK_DIV32 => 32,
                    .RCC_SYSCLK_DIV64 => 64,
                    .RCC_SYSCLK_DIV128 => 128,
                    .RCC_SYSCLK_DIV256 => 256,
                    .RCC_SYSCLK_DIV512 => 512,
                };
            }
        };

        pub const Cortex2_DivList = enum {
            SYSTICK_CLKSOURCE_HCLK,
            SYSTICK_CLKSOURCE_HCLK_DIV8,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .SYSTICK_CLKSOURCE_HCLK => 1,
                    .SYSTICK_CLKSOURCE_HCLK_DIV8 => 8,
                };
            }
        };

        pub const AHBCLKDividerList = enum {
            RCC_SYSCLK_DIV1,
            RCC_SYSCLK_DIV2,
            RCC_SYSCLK_DIV3,
            RCC_SYSCLK_DIV4,
            RCC_SYSCLK_DIV5,
            RCC_SYSCLK_DIV6,
            RCC_SYSCLK_DIV8,
            RCC_SYSCLK_DIV10,
            RCC_SYSCLK_DIV16,
            RCC_SYSCLK_DIV32,
            RCC_SYSCLK_DIV64,
            RCC_SYSCLK_DIV128,
            RCC_SYSCLK_DIV256,
            RCC_SYSCLK_DIV512,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_SYSCLK_DIV5 => .Div5,
                    .RCC_SYSCLK_DIV3 => .Div3,
                    .RCC_SYSCLK_DIV6 => .Div6,
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV256 => .Div256,
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV8 => .Div8,
                    .RCC_SYSCLK_DIV64 => .Div64,
                    .RCC_SYSCLK_DIV32 => .Div32,
                    .RCC_SYSCLK_DIV128 => .Div128,
                    .RCC_SYSCLK_DIV10 => .Div10,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV512 => .Div512,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_SYSCLK_DIV5,
                    .Div3 => .RCC_SYSCLK_DIV3,
                    .Div6 => .RCC_SYSCLK_DIV6,
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div256 => .RCC_SYSCLK_DIV256,
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div8 => .RCC_SYSCLK_DIV8,
                    .Div64 => .RCC_SYSCLK_DIV64,
                    .Div32 => .RCC_SYSCLK_DIV32,
                    .Div128 => .RCC_SYSCLK_DIV128,
                    .Div10 => .RCC_SYSCLK_DIV10,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div512 => .RCC_SYSCLK_DIV512,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_SYSCLK_DIV1 => 1,
                    .RCC_SYSCLK_DIV2 => 2,
                    .RCC_SYSCLK_DIV3 => 3,
                    .RCC_SYSCLK_DIV4 => 4,
                    .RCC_SYSCLK_DIV5 => 5,
                    .RCC_SYSCLK_DIV6 => 6,
                    .RCC_SYSCLK_DIV8 => 8,
                    .RCC_SYSCLK_DIV10 => 10,
                    .RCC_SYSCLK_DIV16 => 16,
                    .RCC_SYSCLK_DIV32 => 32,
                    .RCC_SYSCLK_DIV64 => 64,
                    .RCC_SYSCLK_DIV128 => 128,
                    .RCC_SYSCLK_DIV256 => 256,
                    .RCC_SYSCLK_DIV512 => 512,
                };
            }
        };

        pub const Cortex_DivList = enum {
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

        pub const PLLPList = enum {
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
            RCC_PLLP_DIV32,

            pub fn get(self: @This()) !f32 {
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
                    .RCC_PLLP_DIV32 => 32,
                };
            }
        };

        pub const PLLQList = enum {
            RCC_PLLQ_DIV2,
            RCC_PLLQ_DIV3,
            RCC_PLLQ_DIV4,
            RCC_PLLQ_DIV5,
            RCC_PLLQ_DIV6,
            RCC_PLLQ_DIV7,
            RCC_PLLQ_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLQ_DIV2 => .Div2,
                    .RCC_PLLQ_DIV3 => .Div3,
                    .RCC_PLLQ_DIV5 => .Div5,
                    .RCC_PLLQ_DIV7 => .Div7,
                    .RCC_PLLQ_DIV8 => .Div8,
                    .RCC_PLLQ_DIV6 => .Div6,
                    .RCC_PLLQ_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLQ_DIV2,
                    .Div3 => .RCC_PLLQ_DIV3,
                    .Div5 => .RCC_PLLQ_DIV5,
                    .Div7 => .RCC_PLLQ_DIV7,
                    .Div8 => .RCC_PLLQ_DIV8,
                    .Div6 => .RCC_PLLQ_DIV6,
                    .Div4 => .RCC_PLLQ_DIV4,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLP", @tagName(item), "PLLQ" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
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

        pub const PLLRList = enum {
            RCC_PLLR_DIV2,
            RCC_PLLR_DIV3,
            RCC_PLLR_DIV4,
            RCC_PLLR_DIV5,
            RCC_PLLR_DIV6,
            RCC_PLLR_DIV7,
            RCC_PLLR_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLR_DIV2 => .Div2,
                    .RCC_PLLR_DIV4 => .Div4,
                    .RCC_PLLR_DIV7 => .Div7,
                    .RCC_PLLR_DIV6 => .Div6,
                    .RCC_PLLR_DIV5 => .Div5,
                    .RCC_PLLR_DIV3 => .Div3,
                    .RCC_PLLR_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLR_DIV2,
                    .Div4 => .RCC_PLLR_DIV4,
                    .Div7 => .RCC_PLLR_DIV7,
                    .Div6 => .RCC_PLLR_DIV6,
                    .Div5 => .RCC_PLLR_DIV5,
                    .Div3 => .RCC_PLLR_DIV3,
                    .Div8 => .RCC_PLLR_DIV8,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLP", @tagName(item), "PLLR" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
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
            FLASH_LATENCY_2,
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE1,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .Range1,
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .Range2,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .Range1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .Range2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                };
            }
        };

        pub const MSIAutoCalibrationList = enum {
            DISABLED,
            ENABLED,
        };

        pub const PrescalerList = enum {
            RCC_CRS_SYNC_DIV1,
            RCC_CRS_SYNC_DIV2,
            RCC_CRS_SYNC_DIV4,
            RCC_CRS_SYNC_DIV8,
            RCC_CRS_SYNC_DIV16,
            RCC_CRS_SYNC_DIV32,
            RCC_CRS_SYNC_DIV64,
            RCC_CRS_SYNC_DIV128,
        };

        pub const SourceList = enum {
            RCC_CRS_SYNC_SOURCE_GPIO,
            RCC_CRS_SYNC_SOURCE_LSE,
            RCC_CRS_SYNC_SOURCE_USB,
        };

        pub const PolarityList = enum {
            RCC_CRS_SYNC_POLARITY_RISING,
            RCC_CRS_SYNC_POLARITY_FALLING,
        };

        pub const ReloadValueTypeList = enum {
            UserValue,
            automatic,
        };

        pub const LSE_Drive_CapabilityList = enum {
            RCC_LSEDRIVE_LOW,
            RCC_LSEDRIVE_MEDIUMLOW,
            RCC_LSEDRIVE_MEDIUMHIGH,
            RCC_LSEDRIVE_HIGH,

            pub fn to_enum(self: @This()) anyerror!RCC_LSEDRV {
                return switch (self) {
                    .RCC_LSEDRIVE_MEDIUMHIGH => .MediumHigh,
                    .RCC_LSEDRIVE_MEDIUMLOW => .MediumLow,
                    .RCC_LSEDRIVE_HIGH => .High,
                    .RCC_LSEDRIVE_LOW => .Low,
                };
            }
            pub fn from_enum(item: RCC_LSEDRV) anyerror!@This() {
                return switch (item) {
                    .MediumHigh => .RCC_LSEDRIVE_MEDIUMHIGH,
                    .MediumLow => .RCC_LSEDRIVE_MEDIUMLOW,
                    .High => .RCC_LSEDRIVE_HIGH,
                    .Low => .RCC_LSEDRIVE_LOW,
                };
            }
        };

        pub const LSIEnableList = enum {
            true,
            false,
        };

        pub const LPTIM1EnableList = enum {
            true,
            false,
        };

        pub const USART2EnableList = enum {
            true,
            false,
        };

        pub const LSCOEnableList = enum {
            true,
            false,
        };

        pub const EnableHSEList = enum {
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

        pub const RTCEnableList = enum {
            true,
            false,
        };

        pub const LCDEnableList = enum {
            true,
            false,
        };

        pub const IWDGEnableList = enum {
            true,
            false,
        };

        pub const USART1EnableList = enum {
            true,
            false,
        };

        pub const LPUART1EnableList = enum {
            true,
            false,
        };

        pub const LPTIM2EnableList = enum {
            true,
            false,
        };

        pub const LPTIM3EnableList = enum {
            true,
            false,
        };

        pub const RNGEnableList = enum {
            true,
            false,
        };

        pub const I2C2EnableList = enum {
            true,
            false,
        };

        pub const I2C1EnableList = enum {
            true,
            false,
        };

        pub const I2C3EnableList = enum {
            true,
            false,
        };

        pub const I2S2EnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const MCOEnableList = enum {
            true,
            false,
        };

        pub const ExtClockEnableList = enum {
            true,
            false,
        };

        pub const EnableCSSLSEList = enum {
            true,
            false,
        };

        pub const EnbaleCSSList = enum {
            true,
            false,
        };

        //=======ClockTree Flags========

        pub const Flags = struct {
            HSEOscillator: bool = false,
            HSEByPassPwr: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            USBUsed_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            EnableCSS: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEOscillator: bool = false,
            HSEByPassPwr: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            USBUsed_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            EnableCSS: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            LSIEnable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            LPTIM3Enable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            I2S2Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            MSIUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
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
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSIDIV: ?LSIDIVList = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?MSIClockRangeList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            USART2CLockSelection: ?USART2CLockSelectionList = null,
            LSCOSource1: ?LSCOSource1List = null,
            HSEPRES: ?u32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?PLLMList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            LPTIM2CLockSelection: ?LPTIM2CLockSelectionList = null,
            LPTIM3CLockSelection: ?LPTIM3CLockSelectionList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            I2C2CLockSelection: ?I2C2CLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
            I2S2CLockSelection: ?I2S2CLockSelectionList = null,
            ADCCLockSelection: ?ADCCLockSelectionList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            AHB3CLKDivider: ?AHB3CLKDividerList = null,
            AHB2CLKDivider: ?AHB2CLKDividerList = null,
            Cortex2_Div: ?Cortex2_DivList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            PLLN: ?u32 = null,
            PLLP: ?PLLPList = null,
            PLLQ: ?PLLQList = null,
            PLLR: ?PLLRList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            LSIDIV: LSIDIVList,
            MSIClockRange: MSIClockRangeList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            USART2CLockSelection: USART2CLockSelectionList,
            LSCOSource1: LSCOSource1List,
            HSEPRES: u32,
            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLM: PLLMList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            LPTIM2CLockSelection: LPTIM2CLockSelectionList,
            LPTIM3CLockSelection: LPTIM3CLockSelectionList,
            RNGCLockSelection: RNGCLockSelectionList,
            I2C2CLockSelection: I2C2CLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C3CLockSelection: I2C3CLockSelectionList,
            I2S2CLockSelection: I2S2CLockSelectionList,
            ADCCLockSelection: ADCCLockSelectionList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv: RCC_MCODivList,
            AHB3CLKDivider: AHB3CLKDividerList,
            AHB2CLKDivider: AHB2CLKDividerList,
            Cortex2_Div: Cortex2_DivList,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB2TimCLKDivider: u32,
            PLLN: u32,
            PLLP: PLLPList,
            PLLQ: PLLQList,
            PLLR: PLLRList,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            MSIAutoCalibration: MSIAutoCalibrationList,
            Prescaler: ?PrescalerList,
            Source: ?SourceList,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            Fsync: ?f32,
            ErrorLimitValue: ?u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
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
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
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
                    .MSIAutoCalibration = self.MSIAutoCalibration,
                    .Prescaler = self.Prescaler,
                    .Polarity = self.Polarity,
                    .ReloadValueType = self.ReloadValueType,
                    .ReloadValue = self.ReloadValue,
                    .Fsync = self.Fsync,
                    .ErrorLimitValue = self.ErrorLimitValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSIDIV: ?RCC_HPRE = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?RCC_MSIRANGE = null,
            LPTIM1CLockSelection: ?RCC_LPTIMSEL = null,
            USART2CLockSelection: ?USART2CLockSelectionList = null,
            LSCOSource1: ?LSCOSource1List = null,
            HSEPRES: ?u32 = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?RCC_PLLM = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            LPUART1CLockSelection: ?RCC_LPTIMSEL = null,
            LPTIM2CLockSelection: ?RCC_LPTIMSEL = null,
            LPTIM3CLockSelection: ?RCC_LPTIMSEL = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            I2C2CLockSelection: ?RCC_SPI2S2SEL = null,
            I2C1CLockSelection: ?RCC_SPI2S2SEL = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
            I2S2CLockSelection: ?RCC_SPI2S2SEL = null,
            ADCCLockSelection: ?RCC_ADCSEL = null,
            RCC_MCO1Source: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            AHB3CLKDivider: ?RCC_HPRE = null,
            AHB2CLKDivider: ?RCC_HPRE = null,
            Cortex2_Div: ?Cortex2_DivList = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            PLLN: ?u32 = null,
            PLLP: ?PLLPList = null,
            PLLQ: ?RCC_PLLP = null,
            PLLR: ?RCC_PLLP = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSI_VALUE = self.LSI_VALUE,
                    .LSIDIV = if (self.LSIDIV) |val| try LSIDIVList.from_enum(val) else null,
                    .LSE_VALUE = self.LSE_VALUE,
                    .MSIClockRange = if (self.MSIClockRange) |val| try MSIClockRangeList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .USART2CLockSelection = self.USART2CLockSelection,
                    .LSCOSource1 = self.LSCOSource1,
                    .HSEPRES = self.HSEPRES,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = if (self.PLLM) |val| try PLLMList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = self.USART1CLockSelection,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .LPTIM2CLockSelection = if (self.LPTIM2CLockSelection) |val| try LPTIM2CLockSelectionList.from_enum(val) else null,
                    .LPTIM3CLockSelection = if (self.LPTIM3CLockSelection) |val| try LPTIM3CLockSelectionList.from_enum(val) else null,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .I2C2CLockSelection = if (self.I2C2CLockSelection) |val| try I2C2CLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C3CLockSelection = self.I2C3CLockSelection,
                    .I2S2CLockSelection = if (self.I2S2CLockSelection) |val| try I2S2CLockSelectionList.from_enum(val) else null,
                    .ADCCLockSelection = if (self.ADCCLockSelection) |val| try ADCCLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .AHB3CLKDivider = if (self.AHB3CLKDivider) |val| try AHB3CLKDividerList.from_enum(val) else null,
                    .AHB2CLKDivider = if (self.AHB2CLKDivider) |val| try AHB2CLKDividerList.from_enum(val) else null,
                    .Cortex2_Div = self.Cortex2_Div,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .PLLN = self.PLLN,
                    .PLLP = self.PLLP,
                    .PLLQ = if (self.PLLQ) |val| try PLLQList.from_enum(val) else null,
                    .PLLR = if (self.PLLR) |val| try PLLRList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            LSIDIV: RCC_HPRE,
            MSIClockRange: RCC_MSIRANGE,
            LPTIM1CLockSelection: RCC_LPTIMSEL,
            USART2CLockSelection: USART2CLockSelectionList,
            LSCOSource1: LSCOSource1List,
            HSEPRES: u32,
            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLM: RCC_PLLM,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelection: USART1CLockSelectionList,
            LPUART1CLockSelection: RCC_LPTIMSEL,
            LPTIM2CLockSelection: RCC_LPTIMSEL,
            LPTIM3CLockSelection: RCC_LPTIMSEL,
            RNGCLockSelection: RCC_RNGSEL,
            I2C2CLockSelection: RCC_SPI2S2SEL,
            I2C1CLockSelection: RCC_SPI2S2SEL,
            I2C3CLockSelection: I2C3CLockSelectionList,
            I2S2CLockSelection: RCC_SPI2S2SEL,
            ADCCLockSelection: RCC_ADCSEL,
            RCC_MCO1Source: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            AHB3CLKDivider: RCC_HPRE,
            AHB2CLKDivider: RCC_HPRE,
            Cortex2_Div: Cortex2_DivList,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            PLLN: u32,
            PLLP: PLLPList,
            PLLQ: RCC_PLLP,
            PLLR: RCC_PLLP,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
            MSIAutoCalibration: MSIAutoCalibrationList,
            Prescaler: ?PrescalerList,
            Source: ?SourceList,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            Fsync: ?f32,
            ErrorLimitValue: ?u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .LSIDIV = try cubemx_config.LSIDIV.to_enum(),
                    .MSIClockRange = try cubemx_config.MSIClockRange.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .USART2CLockSelection = cubemx_config.USART2CLockSelection,
                    .LSCOSource1 = cubemx_config.LSCOSource1,
                    .HSEPRES = cubemx_config.HSEPRES,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = try cubemx_config.PLLM.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelection = cubemx_config.USART1CLockSelection,
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .LPTIM2CLockSelection = try cubemx_config.LPTIM2CLockSelection.to_enum(),
                    .LPTIM3CLockSelection = try cubemx_config.LPTIM3CLockSelection.to_enum(),
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .I2C2CLockSelection = try cubemx_config.I2C2CLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C3CLockSelection = cubemx_config.I2C3CLockSelection,
                    .I2S2CLockSelection = try cubemx_config.I2S2CLockSelection.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .AHB3CLKDivider = try cubemx_config.AHB3CLKDivider.to_enum(),
                    .AHB2CLKDivider = try cubemx_config.AHB2CLKDivider.to_enum(),
                    .Cortex2_Div = cubemx_config.Cortex2_Div,
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .PLLN = cubemx_config.PLLN,
                    .PLLP = cubemx_config.PLLP,
                    .PLLQ = try cubemx_config.PLLQ.to_enum(),
                    .PLLR = try cubemx_config.PLLR.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .MSICalibrationValue = cubemx_config.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
                    .MSIAutoCalibration = cubemx_config.MSIAutoCalibration,
                    .Prescaler = cubemx_config.Prescaler,
                    .Source = cubemx_config.Source,
                    .Polarity = cubemx_config.Polarity,
                    .ReloadValueType = cubemx_config.ReloadValueType,
                    .ReloadValue = cubemx_config.ReloadValue,
                    .Fsync = cubemx_config.Fsync,
                    .ErrorLimitValue = cubemx_config.ErrorLimitValue,
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
                    .LSE_Drive_Capability = if (cubemx_config.LSE_Drive_Capability) |val| try val.to_enum() else null,
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
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSIDIV: u32 = 0,
            LSEOSC: u32 = 0,
            MSIRC: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2output: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
            HSEPRESC: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PLLSource: u32 = 0,
            PLLM: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            LCDOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM2Mult: u32 = 0,
            LPTIM2output: u32 = 0,
            LPTIM3Mult: u32 = 0,
            LPTIM3output: u32 = 0,
            RNGMult: u32 = 0,
            RNGoutput: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2output: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3output: u32 = 0,
            I2S2Mult: u32 = 0,
            I2S2output: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            AHB3Prescaler: u32 = 0,
            AHB3Output: u32 = 0,
            APB3Output: u32 = 0,
            AHB2Prescaler: u32 = 0,
            FCLK2CortexOutput: u32 = 0,
            AHB2Output: u32 = 0,
            Cortex2Prescaler: u32 = 0,
            Cortex2SysOutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            PWRCLKoutput: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            CortexPrescaler: u32 = 0,
            CortexSysOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            APB1Prescaler: u32 = 0,
            I2S_CKIN: u32 = 0,
            APB1Output: u32 = 0,
            TimPrescalerAPB1: u32 = 0,
            TimPrescOut1: u32 = 0,
            APB2Prescaler: u32 = 0,
            APB2Output: u32 = 0,
            TimPrescalerAPB2: u32 = 0,
            TimPrescOut2: u32 = 0,
            PLLN: u32 = 0,
            PLLP: u32 = 0,
            PLLPoutput: u32 = 0,
            PLLQ: u32 = 0,
            PLLQoutput: u32 = 0,
            PLLR: u32 = 0,
            VCOInput: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
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

            var MSIRANGE_0: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_3: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_4: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_5: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_6: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_7: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_8: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_9: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_10: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIRANGE_11: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourcePCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourcePCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM3SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM3SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM3SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_PLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_MSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2CLKSOURCE_PLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2CLKSOURCE_PIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_PLLPCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_PLLQCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIAutoCalibrationON: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv2: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv4: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv8: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv16: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv32: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv64: bool = false; //semaphore for processing, not an actual flag in the output;
            var RccCrsSyncDiv128: bool = false; //semaphore for processing, not an actual flag in the output;
            var UserDefinedReload: bool = false; //semaphore for processing, not an actual flag in the output;
            var AutomaticRelaod: bool = false; //semaphore for processing, not an actual flag in the output;
            var RCC_LSECSS_ENABLED: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var LSIDIV = ClockNode{
                .name = "LSIDIV",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSEOSC = ClockNode{
                .name = "LSEOSC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MSIRC = ClockNode{
                .name = "MSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM1Mult = ClockNode{
                .name = "LPTIM1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM1output = ClockNode{
                .name = "LPTIM1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART2Mult = ClockNode{
                .name = "USART2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART2output = ClockNode{
                .name = "USART2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSCOMult = ClockNode{
                .name = "LSCOMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSCOOutput = ClockNode{
                .name = "LSCOOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSEPRESC = ClockNode{
                .name = "HSEPRESC",
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

            var PLLSource = ClockNode{
                .name = "PLLSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLM = ClockNode{
                .name = "PLLM",
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

            var USART1Mult = ClockNode{
                .name = "USART1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART1output = ClockNode{
                .name = "USART1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPUART1Mult = ClockNode{
                .name = "LPUART1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPUART1output = ClockNode{
                .name = "LPUART1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM2Mult = ClockNode{
                .name = "LPTIM2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM2output = ClockNode{
                .name = "LPTIM2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM3Mult = ClockNode{
                .name = "LPTIM3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM3output = ClockNode{
                .name = "LPTIM3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RNGMult = ClockNode{
                .name = "RNGMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RNGoutput = ClockNode{
                .name = "RNGoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C2Mult = ClockNode{
                .name = "I2C2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C2output = ClockNode{
                .name = "I2C2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C1Mult = ClockNode{
                .name = "I2C1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C1output = ClockNode{
                .name = "I2C1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C3Mult = ClockNode{
                .name = "I2C3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C3output = ClockNode{
                .name = "I2C3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S2Mult = ClockNode{
                .name = "I2S2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S2output = ClockNode{
                .name = "I2S2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADCMult = ClockNode{
                .name = "ADCMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADCoutput = ClockNode{
                .name = "ADCoutput",
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

            var AHB3Prescaler = ClockNode{
                .name = "AHB3Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHB3Output = ClockNode{
                .name = "AHB3Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB3Output = ClockNode{
                .name = "APB3Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHB2Prescaler = ClockNode{
                .name = "AHB2Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FCLK2CortexOutput = ClockNode{
                .name = "FCLK2CortexOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHB2Output = ClockNode{
                .name = "AHB2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Cortex2Prescaler = ClockNode{
                .name = "Cortex2Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Cortex2SysOutput = ClockNode{
                .name = "Cortex2SysOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHBPrescaler = ClockNode{
                .name = "AHBPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PWRCLKoutput = ClockNode{
                .name = "PWRCLKoutput",
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

            var CortexPrescaler = ClockNode{
                .name = "CortexPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CortexSysOutput = ClockNode{
                .name = "CortexSysOutput",
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

            var I2S_CKIN = ClockNode{
                .name = "I2S_CKIN",
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

            var TimPrescOut1 = ClockNode{
                .name = "TimPrescOut1",
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

            var TimPrescalerAPB2 = ClockNode{
                .name = "TimPrescalerAPB2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimPrescOut2 = ClockNode{
                .name = "TimPrescOut2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLN = ClockNode{
                .name = "PLLN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLP = ClockNode{
                .name = "PLLP",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLPoutput = ClockNode{
                .name = "PLLPoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLQ = ClockNode{
                .name = "PLLQ",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLQoutput = ClockNode{
                .name = "PLLQoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLR = ClockNode{
                .name = "PLLR",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOInput = ClockNode{
                .name = "VCOInput",
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

            const HSE_VALUEValue: f32 = blk: {
                if (check_MCU("STM32WL5MOCHx")) {
                    if (config.HSE_VALUE) |val| {
                        if (val != 3.2e7) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "HSE_VALUE",
                                "STM32WL5MOCHx",
                                "",
                                3.2e7,
                                val,
                            });
                        }
                    }
                    HSEOSC.limit = .{
                        .min = 3.2e7,
                        .max = 3.2e7,
                    };
                    break :blk 3.2e7;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 3.2e7,
                };

                break :blk user_val orelse 8e6;
            };

            const LSI_VALUEValue: f32 = blk: {
                const user_val = config.LSI_VALUE;
                LSIRC.limit = .{
                    .min = 3.104e4,
                    .max = 3.296e4,
                };

                break :blk user_val orelse 3.2e4;
            };

            const LSIDIVValue: LSIDIVList = blk: {
                const user_val = config.LSIDIV;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LSI_DIV1 => {},
                        .RCC_LSI_DIV128 => {},
                    }
                }
                break :blk user_val orelse .RCC_LSI_DIV1;
            };

            const LSE_VALUEValue: f32 = blk: {
                const user_val = config.LSE_VALUE;
                LSEOSC.limit = .{
                    .min = 1e3,
                    .max = 1e6,
                };

                break :blk user_val orelse 3.2768e4;
            };

            const MSIClockRangeValue: MSIClockRangeList = blk: {
                const user_val = config.MSIClockRange;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MSIRANGE_0 => MSIRANGE_0 = true,
                        .RCC_MSIRANGE_1 => MSIRANGE_1 = true,
                        .RCC_MSIRANGE_2 => MSIRANGE_2 = true,
                        .RCC_MSIRANGE_3 => MSIRANGE_3 = true,
                        .RCC_MSIRANGE_4 => MSIRANGE_4 = true,
                        .RCC_MSIRANGE_5 => MSIRANGE_5 = true,
                        .RCC_MSIRANGE_6 => MSIRANGE_6 = true,
                        .RCC_MSIRANGE_7 => MSIRANGE_7 = true,
                        .RCC_MSIRANGE_8 => MSIRANGE_8 = true,
                        .RCC_MSIRANGE_9 => MSIRANGE_9 = true,
                        .RCC_MSIRANGE_10 => MSIRANGE_10 = true,
                        .RCC_MSIRANGE_11 => MSIRANGE_11 = true,
                    }
                }
                break :blk user_val orelse {
                    MSIRANGE_6 = true;
                    break :blk .RCC_MSIRANGE_6;
                };
            };

            const LPTIM1CLockSelectionValue: LPTIM1CLockSelectionList = blk: {
                const user_val = config.LPTIM1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_PCLK1 => {},
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1SOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK1;
            };

            const USART2CLockSelectionValue: USART2CLockSelectionList = blk: {
                const user_val = config.USART2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART2CLKSOURCE_PCLK1 => USART2SourcePCLK2 = true,
                        .RCC_USART2CLKSOURCE_SYSCLK => USART2SourceSys = true,
                        .RCC_USART2CLKSOURCE_HSI => USART2SourceHSI = true,
                        .RCC_USART2CLKSOURCE_LSE => USART2SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART2SourcePCLK2 = true;
                    break :blk .RCC_USART2CLKSOURCE_PCLK1;
                };
            };

            const LSCOSource1Value: LSCOSource1List = blk: {
                const user_val = config.LSCOSource1;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LSCOSOURCE_LSI => LSCOSSourceLSI = true,
                        .RCC_LSCOSOURCE_LSE => LSCOSSourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    LSCOSSourceLSI = true;
                    break :blk .RCC_LSCOSOURCE_LSI;
                };
            };

            const HSEPRESValue: u32 = blk: {
                const user_val = config.HSEPRES;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSEPRES",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSEPRES",
                            "Else",
                            "No additional information",
                            2,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
            };

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_MSI => SysSourceMSI = true,
                        .RCC_SYSCLKSOURCE_HSI => SysSourceHSI = true,
                        .RCC_SYSCLKSOURCE_HSE => SysSourceHSE = true,
                        .RCC_SYSCLKSOURCE_PLLCLK => SysSourcePLL = true,
                    }
                }
                break :blk user_val orelse {
                    SysSourceMSI = true;
                    break :blk .RCC_SYSCLKSOURCE_MSI;
                };
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                const user_val = config.PLLSourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_MSI => PLLSourceMSI = true,
                        .RCC_PLLSOURCE_HSI => PLLSourceHSI = true,
                        .RCC_PLLSOURCE_HSE => PLLSourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLLSourceMSI = true;
                    break :blk .RCC_PLLSOURCE_MSI;
                };
            };

            const PLLMValue: PLLMList = blk: {
                const user_val = config.PLLM;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLM_DIV1 => {},
                        .RCC_PLLM_DIV2 => {},
                        .RCC_PLLM_DIV3 => {},
                        .RCC_PLLM_DIV4 => {},
                        .RCC_PLLM_DIV5 => {},
                        .RCC_PLLM_DIV6 => {},
                        .RCC_PLLM_DIV7 => {},
                        .RCC_PLLM_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLM_DIV1;
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: u32 = blk: {
                break :blk 32;
            };

            const RTCClockSelectionValue: RTCClockSelectionList = blk: {
                const user_val = config.RTCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => RTCSourceLSE = true,
                        .RCC_RTCCLKSOURCE_LSI => RTCSourceLSI = true,
                        .RCC_RTCCLKSOURCE_HSE_DIV32 => RTCSourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    RTCSourceLSI = true;
                    break :blk .RCC_RTCCLKSOURCE_LSI;
                };
            };

            const USART1CLockSelectionValue: USART1CLockSelectionList = blk: {
                const user_val = config.USART1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK2 => USART1SourcePCLK2 = true,
                        .RCC_USART1CLKSOURCE_SYSCLK => USART1SourceSys = true,
                        .RCC_USART1CLKSOURCE_HSI => USART1SourceHSI = true,
                        .RCC_USART1CLKSOURCE_LSE => USART1SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART1SourcePCLK2 = true;
                    break :blk .RCC_USART1CLKSOURCE_PCLK2;
                };
            };

            const LPUART1CLockSelectionValue: LPUART1CLockSelectionList = blk: {
                const user_val = config.LPUART1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_PCLK1 => LPUART1SourcePCLK1 = true,
                        .RCC_LPUART1CLKSOURCE_SYSCLK => LPUART1SourceSys = true,
                        .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
                        .RCC_LPUART1CLKSOURCE_LSE => LPUART1SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    LPUART1SourcePCLK1 = true;
                    break :blk .RCC_LPUART1CLKSOURCE_PCLK1;
                };
            };

            const LPTIM2CLockSelectionValue: LPTIM2CLockSelectionList = blk: {
                const user_val = config.LPTIM2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM2CLKSOURCE_PCLK1 => {},
                        .RCC_LPTIM2CLKSOURCE_LSI => LPTIM2SOURCELSI = true,
                        .RCC_LPTIM2CLKSOURCE_HSI => LPTIM2SOURCEHSI = true,
                        .RCC_LPTIM2CLKSOURCE_LSE => LPTIM2SOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM2CLKSOURCE_PCLK1;
            };

            const LPTIM3CLockSelectionValue: LPTIM3CLockSelectionList = blk: {
                const user_val = config.LPTIM3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM3CLKSOURCE_PCLK1 => {},
                        .RCC_LPTIM3CLKSOURCE_LSI => LPTIM3SOURCELSI = true,
                        .RCC_LPTIM3CLKSOURCE_HSI => LPTIM3SOURCEHSI = true,
                        .RCC_LPTIM3CLKSOURCE_LSE => LPTIM3SOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM3CLKSOURCE_PCLK1;
            };

            const RNGCLockSelectionValue: RNGCLockSelectionList = blk: {
                const user_val = config.RNGCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_PLL => RNGCLKSOURCE_PLL = true,
                        .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
                        .RCC_RNGCLKSOURCE_LSE => RNGCLKSOURCE_LSE = true,
                        .RCC_RNGCLKSOURCE_MSI => RNGCLKSOURCE_MSI = true,
                    }
                }
                break :blk user_val orelse {
                    RNGCLKSOURCE_LSI = true;
                    break :blk .RCC_RNGCLKSOURCE_LSI;
                };
            };

            const I2C2CLockSelectionValue: I2C2CLockSelectionList = blk: {
                const user_val = config.I2C2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C2CLKSOURCE_PCLK1 => I2C2SourcePCLK1 = true,
                        .RCC_I2C2CLKSOURCE_SYSCLK => I2C2SourceSys = true,
                        .RCC_I2C2CLKSOURCE_HSI => I2C2SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C2SourcePCLK1 = true;
                    break :blk .RCC_I2C2CLKSOURCE_PCLK1;
                };
            };

            const I2C1CLockSelectionValue: I2C1CLockSelectionList = blk: {
                const user_val = config.I2C1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_PCLK1 => I2C1SourcePCLK1 = true,
                        .RCC_I2C1CLKSOURCE_SYSCLK => I2C1SourceSys = true,
                        .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C1SourcePCLK1 = true;
                    break :blk .RCC_I2C1CLKSOURCE_PCLK1;
                };
            };

            const I2C3CLockSelectionValue: I2C3CLockSelectionList = blk: {
                const user_val = config.I2C3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C3CLKSOURCE_PCLK1 => I2C3SourcePCLK1 = true,
                        .RCC_I2C3CLKSOURCE_SYSCLK => I2C3SourceSys = true,
                        .RCC_I2C3CLKSOURCE_HSI => I2C3SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C3SourcePCLK1 = true;
                    break :blk .RCC_I2C3CLKSOURCE_PCLK1;
                };
            };

            const I2S2CLockSelectionValue: I2S2CLockSelectionList = blk: {
                const user_val = config.I2S2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2S2CLKSOURCE_PLL => I2S2CLKSOURCE_PLL = true,
                        .RCC_I2S2CLKSOURCE_HSI => I2S2CLKSOURCE_HSI = true,
                        .RCC_I2S2CLKSOURCE_PIN => I2S2CLKSOURCE_PIN = true,
                    }
                }
                break :blk user_val orelse {
                    I2S2CLKSOURCE_HSI = true;
                    break :blk .RCC_I2S2CLKSOURCE_HSI;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_HSI => ADCCLKSOURCE_HSI = true,
                        .RCC_ADCCLKSOURCE_PLL => ADCSourcePLL = true,
                        .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                    }
                }
                break :blk user_val orelse {
                    ADCCLKSOURCE_HSI = true;
                    break :blk .RCC_ADCCLKSOURCE_HSI;
                };
            };

            const RCC_MCO1SourceValue: RCC_MCO1SourceList = blk: {
                const user_val = config.RCC_MCO1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => MCOSourcesys = true,
                        .RCC_MCO1SOURCE_HSI => MCOSourceHSI = true,
                        .RCC_MCO1SOURCE_MSI => MCOSourceMSI = true,
                        .RCC_MCO1SOURCE_HSE => MCOSourceHSE = true,
                        .RCC_MCO1SOURCE_PLLCLK => MCOSourcePLL = true,
                        .RCC_MCO1SOURCE_LSE => MCOSourceLSE = true,
                        .RCC_MCO1SOURCE_LSI => MCOSourceLSI = true,
                        .RCC_MCO1SOURCE_PLLPCLK => MCO1SOURCE_PLLPCLK = true,
                        .RCC_MCO1SOURCE_PLLQCLK => MCO1SOURCE_PLLQCLK = true,
                    }
                }
                break :blk user_val orelse {
                    MCOSourcesys = true;
                    break :blk .RCC_MCO1SOURCE_SYSCLK;
                };
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

            const AHB3CLKDividerValue: AHB3CLKDividerList = blk: {
                const user_val = config.AHB3CLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLK_DIV1 => {},
                        .RCC_SYSCLK_DIV2 => {},
                        .RCC_SYSCLK_DIV3 => {},
                        .RCC_SYSCLK_DIV4 => {},
                        .RCC_SYSCLK_DIV5 => {},
                        .RCC_SYSCLK_DIV6 => {},
                        .RCC_SYSCLK_DIV8 => {},
                        .RCC_SYSCLK_DIV10 => {},
                        .RCC_SYSCLK_DIV16 => {},
                        .RCC_SYSCLK_DIV32 => {},
                        .RCC_SYSCLK_DIV64 => {},
                        .RCC_SYSCLK_DIV128 => {},
                        .RCC_SYSCLK_DIV256 => {},
                        .RCC_SYSCLK_DIV512 => {},
                    }
                }
                break :blk user_val orelse .RCC_SYSCLK_DIV1;
            };

            const AHB2CLKDividerValue: AHB2CLKDividerList = blk: {
                const user_val = config.AHB2CLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLK_DIV1 => {},
                        .RCC_SYSCLK_DIV2 => {},
                        .RCC_SYSCLK_DIV3 => {},
                        .RCC_SYSCLK_DIV4 => {},
                        .RCC_SYSCLK_DIV5 => {},
                        .RCC_SYSCLK_DIV6 => {},
                        .RCC_SYSCLK_DIV8 => {},
                        .RCC_SYSCLK_DIV10 => {},
                        .RCC_SYSCLK_DIV16 => {},
                        .RCC_SYSCLK_DIV32 => {},
                        .RCC_SYSCLK_DIV64 => {},
                        .RCC_SYSCLK_DIV128 => {},
                        .RCC_SYSCLK_DIV256 => {},
                        .RCC_SYSCLK_DIV512 => {},
                    }
                }
                break :blk user_val orelse .RCC_SYSCLK_DIV1;
            };

            const Cortex2_DivValue: Cortex2_DivList = blk: {
                const user_val = config.Cortex2_Div;

                if (user_val) |val| {
                    switch (val) {
                        .SYSTICK_CLKSOURCE_HCLK => {},
                        .SYSTICK_CLKSOURCE_HCLK_DIV8 => {},
                    }
                }
                break :blk user_val orelse .SYSTICK_CLKSOURCE_HCLK;
            };

            const AHBCLKDividerValue: AHBCLKDividerList = blk: {
                const user_val = config.AHBCLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLK_DIV1 => AHBCLKDivider1 = true,
                        .RCC_SYSCLK_DIV2 => {},
                        .RCC_SYSCLK_DIV3 => {},
                        .RCC_SYSCLK_DIV4 => {},
                        .RCC_SYSCLK_DIV5 => {},
                        .RCC_SYSCLK_DIV6 => {},
                        .RCC_SYSCLK_DIV8 => {},
                        .RCC_SYSCLK_DIV10 => {},
                        .RCC_SYSCLK_DIV16 => {},
                        .RCC_SYSCLK_DIV32 => {},
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

            const Cortex_DivValue: Cortex_DivList = blk: {
                const user_val = config.Cortex_Div;

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

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 4.8e4;
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

            const PLLNValue: u32 = blk: {
                const user_val = config.PLLN;
                if (user_val) |val| {
                    if (val < 6) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLN",
                            "Else",
                            "No additional information",
                            6,
                            val,
                        });
                    }
                    if (val > 127) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLN",
                            "Else",
                            "No additional information",
                            127,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 8;
            };

            const PLLPValue: PLLPList = blk: {
                const user_val = config.PLLP;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLP_DIV2 => {},
                        .RCC_PLLP_DIV3 => {},
                        .RCC_PLLP_DIV4 => {},
                        .RCC_PLLP_DIV5 => {},
                        .RCC_PLLP_DIV6 => {},
                        .RCC_PLLP_DIV7 => {},
                        .RCC_PLLP_DIV8 => {},
                        .RCC_PLLP_DIV9 => {},
                        .RCC_PLLP_DIV10 => {},
                        .RCC_PLLP_DIV11 => {},
                        .RCC_PLLP_DIV12 => {},
                        .RCC_PLLP_DIV13 => {},
                        .RCC_PLLP_DIV14 => {},
                        .RCC_PLLP_DIV15 => {},
                        .RCC_PLLP_DIV16 => {},
                        .RCC_PLLP_DIV17 => {},
                        .RCC_PLLP_DIV18 => {},
                        .RCC_PLLP_DIV19 => {},
                        .RCC_PLLP_DIV20 => {},
                        .RCC_PLLP_DIV21 => {},
                        .RCC_PLLP_DIV22 => {},
                        .RCC_PLLP_DIV23 => {},
                        .RCC_PLLP_DIV24 => {},
                        .RCC_PLLP_DIV25 => {},
                        .RCC_PLLP_DIV26 => {},
                        .RCC_PLLP_DIV27 => {},
                        .RCC_PLLP_DIV28 => {},
                        .RCC_PLLP_DIV29 => {},
                        .RCC_PLLP_DIV30 => {},
                        .RCC_PLLP_DIV31 => {},
                        .RCC_PLLP_DIV32 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLP_DIV2;
            };

            const PLLQValue: PLLQList = blk: {
                const user_val = config.PLLQ;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLQ_DIV2 => {},
                        .RCC_PLLQ_DIV3 => {},
                        .RCC_PLLQ_DIV4 => {},
                        .RCC_PLLQ_DIV5 => {},
                        .RCC_PLLQ_DIV6 => {},
                        .RCC_PLLQ_DIV7 => {},
                        .RCC_PLLQ_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLQ_DIV2;
            };

            const PLLRValue: PLLRList = blk: {
                const user_val = config.PLLR;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLR_DIV2 => {},
                        .RCC_PLLR_DIV3 => {},
                        .RCC_PLLR_DIV4 => {},
                        .RCC_PLLR_DIV5 => {},
                        .RCC_PLLR_DIV6 => {},
                        .RCC_PLLR_DIV7 => {},
                        .RCC_PLLR_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLR_DIV2;
            };

            const VDD_VALUEValue: f32 = blk: {
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
                if (((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig) and (MCO1SOURCE_PLLPCLK or MCO1SOURCE_PLLQCLK or check_MCU("MCO1SOURCE_PLLCLK")) or config.flags.ADCUsed_ForRCC and ADCSourcePLL or (RNGCLKSOURCE_PLL and config.flags.RNGUsed_ForRCC) or (config.flags.I2S2Used_ForRCC) and I2S2CLKSOURCE_PLL or SysSourcePLL) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if (config.flags.ADCUsed_ForRCC and ADCCLKSOURCE_HSI or I2C2SourceHSI and config.flags.I2C2Used_ForRCC or ((config.flags.I2S2Used_ForRCC) and I2S2CLKSOURCE_HSI) or (USART1SourceHSI and config.flags.USART1Used_ForRCC) or (USART2SourceHSI and config.flags.USART2Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCEHSI and config.flags.LPTIM2Used_ForRCC) or (LPTIM3SOURCEHSI and config.flags.LPTIM3Used_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C3SourceHSI and config.flags.I2C3Used_ForRCC) or ((PLLSourceHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig))))) {
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
                        if (val > 127) {
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
                                127,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 64;
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
                    if (val > 127) {
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
                            127,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 64;
            };

            const MSIUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_MSI_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_MSI, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig)) or (PLLSourceMSI and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (RNGCLKSOURCE_MSI and config.flags.RNGUsed_ForRCC)) {
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

            const MSIAutoCalibrationValue: MSIAutoCalibrationList = blk: {
                if ((check_ref(@TypeOf(MSIUsedValue), MSIUsedValue, 1, .@"=")) and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
                    const user_val = config.extra_config.MSIAutoCalibration;

                    if (user_val) |val| {
                        switch (val) {
                            .DISABLED => {},
                            .ENABLED => MSIAutoCalibrationON = true,
                        }
                    }
                    break :blk user_val orelse {
                        MSIAutoCalibrationON = true;
                        break :blk .ENABLED;
                    };
                }
                if (config.extra_config.MSIAutoCalibration) |val| {
                    if (val != .DISABLED) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "MSIAutoCalibration",
                            "Else",
                            "No additional information",
                            "DISABLED",
                            val,
                        });
                    }
                }
                break :blk .DISABLED;
            };

            const PrescalerValue: ?PrescalerList = blk: {
                if (!check_MCU("CRSActivatedSourceGPIO") and !check_MCU("CRSActivatedSourceLSE") and !check_MCU("CRSActivatedSourceUSB")) {
                    if (config.extra_config.Prescaler) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Prescaler", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE & !CRSActivatedSourceUSB", "" });
                    }
                    break :blk null;
                }
                const user_val = config.extra_config.Prescaler;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CRS_SYNC_DIV1 => RccCrsSyncDiv1 = true,
                        .RCC_CRS_SYNC_DIV2 => RccCrsSyncDiv2 = true,
                        .RCC_CRS_SYNC_DIV4 => RccCrsSyncDiv4 = true,
                        .RCC_CRS_SYNC_DIV8 => RccCrsSyncDiv8 = true,
                        .RCC_CRS_SYNC_DIV16 => RccCrsSyncDiv16 = true,
                        .RCC_CRS_SYNC_DIV32 => RccCrsSyncDiv32 = true,
                        .RCC_CRS_SYNC_DIV64 => RccCrsSyncDiv64 = true,
                        .RCC_CRS_SYNC_DIV128 => RccCrsSyncDiv128 = true,
                    }
                }
                break :blk user_val orelse {
                    RccCrsSyncDiv1 = true;
                    break :blk .RCC_CRS_SYNC_DIV1;
                };
            };

            const SourceValue: ?SourceList = blk: {
                if (!check_MCU("CRSActivatedSourceGPIO") and !check_MCU("CRSActivatedSourceLSE") and !check_MCU("CRSActivatedSourceUSB")) {
                    break :blk null;
                } else if (check_MCU("CRSActivatedSourceGPIO")) {
                    break :blk .RCC_CRS_SYNC_SOURCE_GPIO;
                } else if (check_MCU("CRSActivatedSourceLSE")) {
                    break :blk .RCC_CRS_SYNC_SOURCE_LSE;
                } else if (check_MCU("CRSActivatedSourceUSB")) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB;
                }
                break :blk .RCC_CRS_SYNC_SOURCE_USB;
            };

            const PolarityValue: ?PolarityList = blk: {
                if (!check_MCU("CRSActivatedSourceGPIO") and !check_MCU("CRSActivatedSourceLSE") and !check_MCU("CRSActivatedSourceUSB")) {
                    if (config.extra_config.Polarity) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Polarity", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE & !CRSActivatedSourceUSB", "" });
                    }
                    break :blk null;
                }
                const user_val = config.extra_config.Polarity;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CRS_SYNC_POLARITY_RISING => {},
                        .RCC_CRS_SYNC_POLARITY_FALLING => {},
                    }
                }
                break :blk user_val orelse .RCC_CRS_SYNC_POLARITY_RISING;
            };

            const ReloadValueTypeValue: ?ReloadValueTypeList = blk: {
                if (!check_MCU("CRSActivatedSourceGPIO") and !check_MCU("CRSActivatedSourceLSE") and !check_MCU("CRSActivatedSourceUSB")) {
                    if (config.extra_config.ReloadValueType) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ReloadValueType", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE & !CRSActivatedSourceUSB", "" });
                    }
                    break :blk null;
                }
                const user_val = config.extra_config.ReloadValueType;

                if (user_val) |val| {
                    switch (val) {
                        .UserValue => UserDefinedReload = true,
                        .automatic => AutomaticRelaod = true,
                    }
                }
                break :blk user_val orelse {
                    AutomaticRelaod = true;
                    break :blk .automatic;
                };
            };

            const ReloadValueValue: ?u32 = blk: {
                if (!check_MCU("CRSActivatedSourceGPIO") and !check_MCU("CRSActivatedSourceLSE") and !check_MCU("CRSActivatedSourceUSB")) {
                    if (config.extra_config.ReloadValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ReloadValue", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE & !CRSActivatedSourceUSB", "" });
                    }
                    break :blk null;
                } else if (AutomaticRelaod) {
                    if (config.extra_config.ReloadValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ReloadValue", "AutomaticRelaod", "" });
                    }
                    break :blk null;
                } else if (UserDefinedReload and check_MCU("CRSActivatedSourceGPIO")) {
                    const user_val = config.extra_config.ReloadValue;
                    if (user_val) |val| {
                        if (val < 0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "ReloadValue",
                                "UserDefinedReload & CRSActivatedSourceGPIO ",
                                "",
                                0,
                                val,
                            });
                        }
                        if (val > 65535) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "ReloadValue",
                                "UserDefinedReload & CRSActivatedSourceGPIO ",
                                "",
                                65535,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 0;
                } else if (UserDefinedReload and check_MCU("CRSActivatedSourceLSE")) {
                    const user_val = config.extra_config.ReloadValue;
                    if (user_val) |val| {
                        if (val < 0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "ReloadValue",
                                "UserDefinedReload & CRSActivatedSourceLSE ",
                                "",
                                0,
                                val,
                            });
                        }
                        if (val > 65535) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "ReloadValue",
                                "UserDefinedReload & CRSActivatedSourceLSE ",
                                "",
                                65535,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 1463;
                } else if (UserDefinedReload and check_MCU("CRSActivatedSourceUSB")) {
                    const user_val = config.extra_config.ReloadValue;
                    if (user_val) |val| {
                        if (val < 0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "ReloadValue",
                                "UserDefinedReload & CRSActivatedSourceUSB ",
                                "",
                                0,
                                val,
                            });
                        }
                        if (val > 65535) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "ReloadValue",
                                "UserDefinedReload & CRSActivatedSourceUSB ",
                                "",
                                65535,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 47999;
                }
                const user_val = config.extra_config.ReloadValue;
                if (user_val) |val| {
                    if (val < 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "ReloadValue",
                            "Else",
                            "No additional information",
                            0,
                            val,
                        });
                    }
                    if (val > 65535) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "ReloadValue",
                            "Else",
                            "No additional information",
                            65535,
                            val,
                        });
                    }
                }
                break :blk user_val;
            };

            const FsyncValue: ?f32 = blk: {
                if (!check_MCU("CRSActivatedSourceGPIO") and !check_MCU("CRSActivatedSourceLSE") and !check_MCU("CRSActivatedSourceUSB")) {
                    if (config.extra_config.Fsync) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Fsync", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE & !CRSActivatedSourceUSB", "" });
                    }
                    break :blk null;
                } else if (check_MCU("CRSActivatedSourceGPIO")) {
                    const user_val = config.extra_config.Fsync;
                    if (user_val) |val| {
                        if (val < 1) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceGPIO",
                                "",
                                1,
                                val,
                            });
                        }
                        if (val > 48000000) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Overflow Value - max: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceGPIO",
                                "",
                                48000000,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 1;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv1) {
                    const value: f32 = (LSE_VALUEValue);
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv1",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv2) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 2, .@"/", "LSE_VALUE"));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv2",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv4) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 4, .@"/", "LSE_VALUE"));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv4",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv8) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 8, .@"/", "LSE_VALUE"));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv8",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv16) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 16, .@"/", "LSE_VALUE"));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv16",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv32) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 32, .@"/", "LSE_VALUE"));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv32",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv64) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 64, .@"/", "LSE_VALUE"));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv64",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceLSE") and RccCrsSyncDiv128) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 128, .@"/", "LSE_VALUE"));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceLSE & RccCrsSyncDiv128",
                                "This value corresponds to the LSE value In crystal Mode divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv1) {
                    const value: f32 = (1000);
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv1",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv2) {
                    const value: f32 = (try math_op(?f32, 1000, 2, .@"/", ""));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv2",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv4) {
                    const value: f32 = (try math_op(?f32, 1000, 4, .@"/", ""));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv4",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv8) {
                    const value: f32 = (try math_op(?f32, 1000, 8, .@"/", ""));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv8",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv16) {
                    const value: f32 = (try math_op(?f32, 1000, 16, .@"/", ""));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv16",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv32) {
                    const value: f32 = (try math_op(?f32, 1000, 32, .@"/", ""));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv32",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv64) {
                    const value: f32 = (try math_op(?f32, 1000, 64, .@"/", ""));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv64",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                } else if (check_MCU("CRSActivatedSourceUSB") and RccCrsSyncDiv128) {
                    const value: f32 = (try math_op(?f32, 1000, 128, .@"/", ""));
                    if (config.extra_config.Fsync) |val| {
                        if (val != value) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "Fsync",
                                "CRSActivatedSourceUSB & RccCrsSyncDiv128",
                                "This value corresponds to the Default value (1000) divided by the CRS Synchro Divider",
                                value,
                                val,
                            });
                        }
                    }
                    break :blk value;
                }
                if (config.extra_config.Fsync) |val| {
                    if (val != 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {d} found: {d}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "Fsync",
                            "Else",
                            "No additional information",
                            0,
                            val,
                        });
                    }
                }
                break :blk @floatFromInt(0);
            };

            const ErrorLimitValueValue: ?u32 = blk: {
                if (!check_MCU("CRSActivatedSourceGPIO") and !check_MCU("CRSActivatedSourceLSE") and !check_MCU("CRSActivatedSourceUSB")) {
                    if (config.extra_config.ErrorLimitValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ErrorLimitValue", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE & !CRSActivatedSourceUSB", "" });
                    }
                    break :blk null;
                }
                const user_val = config.extra_config.ErrorLimitValue;
                if (user_val) |val| {
                    if (val < 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "ErrorLimitValue",
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
                            "ErrorLimitValue",
                            "Else",
                            "No additional information",
                            255,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 34;
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

            const LSEUsedValue: u1 = blk: {
                if ((config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_LSE) or MSIAutoCalibrationON or check_MCU("CRSActivatedSourceLSE") or (LSCOSSourceLSE and config.flags.LSCOConfig) or (check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM16")) or (check_MCU("SEM2RCC_LSE_REQUIRED_TIM2") and check_MCU("Semaphore_TIM2_L4_ETR_REMAPTIM2") and check_MCU("TIM2")) or (check_MCU("Semaphore_input_Channel1_directTIM15") and true and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM15")) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (USART2SourceLSE and config.flags.USART2Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCELSE and config.flags.LPTIM2Used_ForRCC) or (LPTIM3SOURCELSE and config.flags.LPTIM3Used_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSE_Drive_CapabilityValue: ?LSE_Drive_CapabilityList = blk: {
                if (config.flags.LSEOscillator and (check_ref(@TypeOf(LSEUsedValue), LSEUsedValue, 1, .@"="))) {
                    const user_val = config.extra_config.LSE_Drive_Capability;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LSEDRIVE_LOW => {},
                            .RCC_LSEDRIVE_MEDIUMLOW => {},
                            .RCC_LSEDRIVE_MEDIUMHIGH => {},
                            .RCC_LSEDRIVE_HIGH => {},
                        }
                    }
                    break :blk user_val orelse .RCC_LSEDRIVE_LOW;
                }
                if (config.extra_config.LSE_Drive_Capability) |_| {
                    return comptime_fail_or_error(error.InvalidConfig,
                        \\
                        \\Error on {s} | expr: {s} diagnostic: {s} 
                        \\Value should be null.
                        \\note: some configurations are invalid in certain cases.
                        \\
                        \\
                    , .{ "LSE_Drive_Capability", "Else", "No additional information" });
                }
                break :blk null;
            };

            const LSIEnableValue: LSIEnableList = blk: {
                break :blk .true;
            };

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIM1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART2EnableValue: USART2EnableList = blk: {
                if (config.flags.USART2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LSCOEnableValue: LSCOEnableList = blk: {
                if (config.flags.LSCOConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEByPassPwr or config.flags.HSEOscillator)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEByPassPwr or config.flags.HSEOscillator))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSELCDDevisorValue: EnableHSELCDDevisorList = blk: {
                if (config.flags.LCDUsed_ForRCC and (config.flags.HSEByPassPwr or config.flags.HSEOscillator)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RTCEnableValue: RTCEnableList = blk: {
                if (config.flags.RTCUsed_ForRCC) {
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

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDGUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART1EnableValue: USART1EnableList = blk: {
                if (config.flags.USART1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPUART1EnableValue: LPUART1EnableList = blk: {
                if (config.flags.LPUARTUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM2EnableValue: LPTIM2EnableList = blk: {
                if (config.flags.LPTIM2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM3EnableValue: LPTIM3EnableList = blk: {
                if (config.flags.LPTIM3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RNGEnableValue: RNGEnableList = blk: {
                if (config.flags.RNGUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C2EnableValue: I2C2EnableList = blk: {
                if (config.flags.I2C2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C1EnableValue: I2C1EnableList = blk: {
                if (config.flags.I2C1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C3EnableValue: I2C3EnableList = blk: {
                if (config.flags.I2C3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S2EnableValue: I2S2EnableList = blk: {
                if ((config.flags.I2S2Used_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (config.flags.ADCUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if (((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ExtClockEnableValue: ExtClockEnableList = blk: {
                if (config.flags.AudioClockConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableCSSLSEValue: EnableCSSLSEList = blk: {
                if ((((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"="))) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
                    const user_val = config.extra_config.EnableCSSLSE;

                    if (user_val) |val| {
                        switch (val) {
                            .true => RCC_LSECSS_ENABLED = true,
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

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if (((PLLSourceHSE and SysSourcePLL) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEByPassPwr or config.flags.HSEOscillator)) {
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
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE LSIRC ======
            if (check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"=")) {
                if (!check_MCU("STM32WL5MOCHx")) {
                    LSIRC.nodetype = .source;
                    LSIRC.value = LSI_VALUEValue;
                } else if (check_MCU("STM32WL5MOCHx")) {
                    LSIRC.nodetype = .source;
                    LSIRC.value = LSI_VALUEValue;
                }
            }
            // ======= NODE LSIDIV ======
            if (!check_MCU("STM32WL5MOCHx")) {
                LSIDIV.nodetype = .div;
                LSIDIV.value = try LSIDIVValue.get();
                LSIDIV.parents = &.{&LSIRC};
            } else if (check_MCU("STM32WL5MOCHx")) {
                LSIDIV.nodetype = .div;
                LSIDIV.value = try LSIDIVValue.get();
                LSIDIV.parents = &.{&LSIRC};
            }
            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE MSIRC ======
            MSIRC.nodetype = .source;
            MSIRC.value = try MSIClockRangeValue.get();

            // ======= NODE LPTIM1Mult ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1Mult.nodetype = .multi;
                LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                    .RCC_LPTIM1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIDIV},
                    .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM1output ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1output.nodetype = .output;
                LPTIM1output.parents = &.{&LPTIM1Mult};
            }
            // ======= NODE USART2Mult ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                USART2Mult.nodetype = .multi;
                USART2Mult.parents = switch (USART2CLockSelectionValue) {
                    .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART2output ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                USART2output.nodetype = .output;
                USART2output.parents = &.{&USART2Mult};
            }
            // ======= NODE LSCOMult ======
            if (check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"=")) {
                LSCOMult.nodetype = .multi;
                LSCOMult.parents = switch (LSCOSource1Value) {
                    .RCC_LSCOSOURCE_LSI => &.{&LSIDIV},
                    .RCC_LSCOSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LSCOOutput ======
            if (check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"=")) {
                LSCOOutput.nodetype = .output;
                LSCOOutput.parents = &.{&LSCOMult};
            }
            // ======= NODE HSEPRESC ======
            if (check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"=")) {
                HSEPRESC.nodetype = .div;
                HSEPRESC.value = @floatFromInt(HSEPRESValue);
                HSEPRESC.parents = &.{&HSEOSC};
            }
            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_MSI => &.{&MSIRC},
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEPRESC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLR},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_MSI => &.{&MSIRC},
                .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                .RCC_PLLSOURCE_HSE => &.{&HSEPRESC},
            };

            // ======= NODE PLLM ======
            PLLM.nodetype = .div;
            PLLM.value = try PLLMValue.get();
            PLLM.parents = &.{&PLLSource};

            // ======= NODE HSERTCDevisor ======
            if (check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=") or check_ref(@TypeOf(EnableHSELCDDevisorValue), EnableHSELCDDevisorValue, .true, .@"=")) {
                HSERTCDevisor.nodetype = .div;
                HSERTCDevisor.value = @floatFromInt(RCC_RTC_Clock_Source_FROM_HSEValue);
                HSERTCDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE RTCClkSource ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=") or check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RTCClockSelectionValue) {
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => &.{&HSERTCDevisor},
                    .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RTCCLKSOURCE_LSI => &.{&LSIDIV},
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
                IWDGOutput.parents = &.{&LSIDIV};
            }
            // ======= NODE USART1Mult ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1Mult.nodetype = .multi;
                USART1Mult.parents = switch (USART1CLockSelectionValue) {
                    .RCC_USART1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                    .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART1output ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1output.nodetype = .output;
                USART1output.parents = &.{&USART1Mult};
            }
            // ======= NODE LPUART1Mult ======
            if (check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=")) {
                LPUART1Mult.nodetype = .multi;
                LPUART1Mult.parents = switch (LPUART1CLockSelectionValue) {
                    .RCC_LPUART1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPUART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPUART1output ======
            if (check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=")) {
                LPUART1output.nodetype = .output;
                LPUART1output.parents = &.{&LPUART1Mult};
            }
            // ======= NODE LPTIM2Mult ======
            if (check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=")) {
                LPTIM2Mult.nodetype = .multi;
                LPTIM2Mult.parents = switch (LPTIM2CLockSelectionValue) {
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIDIV},
                    .RCC_LPTIM2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM2output ======
            if (check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=")) {
                LPTIM2output.nodetype = .output;
                LPTIM2output.parents = &.{&LPTIM2Mult};
            }
            // ======= NODE LPTIM3Mult ======
            if (check_ref(@TypeOf(LPTIM3EnableValue), LPTIM3EnableValue, .true, .@"=")) {
                LPTIM3Mult.nodetype = .multi;
                LPTIM3Mult.parents = switch (LPTIM3CLockSelectionValue) {
                    .RCC_LPTIM3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPTIM3CLKSOURCE_LSI => &.{&LSIDIV},
                    .RCC_LPTIM3CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM3CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM3output ======
            if (check_ref(@TypeOf(LPTIM3EnableValue), LPTIM3EnableValue, .true, .@"=")) {
                LPTIM3output.nodetype = .output;
                LPTIM3output.parents = &.{&LPTIM3Mult};
            }
            // ======= NODE RNGMult ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGMult.nodetype = .multi;
                RNGMult.parents = switch (RNGCLockSelectionValue) {
                    .RCC_RNGCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_RNGCLKSOURCE_LSI => &.{&LSIDIV},
                    .RCC_RNGCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RNGCLKSOURCE_MSI => &.{&MSIRC},
                };
            }
            // ======= NODE RNGoutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGoutput.nodetype = .output;
                RNGoutput.parents = &.{&RNGMult};
            }
            // ======= NODE I2C2Mult ======
            if (check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=")) {
                I2C2Mult.nodetype = .multi;
                I2C2Mult.parents = switch (I2C2CLockSelectionValue) {
                    .RCC_I2C2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C2CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE I2C2output ======
            if (check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=")) {
                I2C2output.nodetype = .output;
                I2C2output.parents = &.{&I2C2Mult};
            }
            // ======= NODE I2C1Mult ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                I2C1Mult.nodetype = .multi;
                I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE I2C1output ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                I2C1output.nodetype = .output;
                I2C1output.parents = &.{&I2C3Mult};
            }
            // ======= NODE I2C3Mult ======
            if (check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"=")) {
                I2C3Mult.nodetype = .multi;
                I2C3Mult.parents = switch (I2C3CLockSelectionValue) {
                    .RCC_I2C3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C3CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE I2C3output ======
            if (check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"=")) {
                I2C3output.nodetype = .output;
                I2C3output.parents = &.{&I2C3Mult};
            }
            // ======= NODE I2S2Mult ======
            if (check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"=")) {
                I2S2Mult.nodetype = .multi;
                I2S2Mult.parents = switch (I2S2CLockSelectionValue) {
                    .RCC_I2S2CLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_I2S2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2S2CLKSOURCE_PIN => &.{&I2S_CKIN},
                };
            }
            // ======= NODE I2S2output ======
            if (check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"=")) {
                I2S2output.nodetype = .output;
                I2S2output.parents = &.{&I2S2Mult};
            }
            // ======= NODE ADCMult ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                ADCMult.nodetype = .multi;
                ADCMult.parents = switch (ADCCLockSelectionValue) {
                    .RCC_ADCCLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_ADCCLKSOURCE_PLL => &.{&PLLP},
                    .RCC_ADCCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE ADCoutput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                ADCoutput.nodetype = .output;
                ADCoutput.parents = &.{&ADCMult};
            }
            // ======= NODE MCOMult ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCO1SourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIDIV},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLR},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO1SOURCE_MSI => &.{&MSIRC},
                    .RCC_MCO1SOURCE_PLLPCLK => &.{&PLLP},
                    .RCC_MCO1SOURCE_PLLQCLK => &.{&PLLQ},
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
            // ======= NODE AHB3Prescaler ======
            AHB3Prescaler.nodetype = .div;
            AHB3Prescaler.value = try AHB3CLKDividerValue.get();
            AHB3Prescaler.parents = &.{&SysCLKOutput};

            // ======= NODE AHB3Output ======
            AHB3Output.nodetype = .output;
            AHB3Output.parents = &.{&AHB3Prescaler};

            // ======= NODE APB3Output ======
            APB3Output.nodetype = .output;
            APB3Output.parents = &.{&AHB3Prescaler};

            // ======= NODE AHB2Prescaler ======
            if ((check_MCU("STM32WL5x") and !check_MCU("S_SINGLE_CORE"))) {
                AHB2Prescaler.nodetype = .div;
                AHB2Prescaler.value = try AHB2CLKDividerValue.get();
                AHB2Prescaler.parents = &.{&SysCLKOutput};
            }
            // ======= NODE FCLK2CortexOutput ======
            if ((check_MCU("STM32WL5x") and !check_MCU("S_SINGLE_CORE"))) {
                FCLK2CortexOutput.nodetype = .output;
                FCLK2CortexOutput.parents = &.{&AHB2Prescaler};
            }
            // ======= NODE AHB2Output ======
            if ((check_MCU("STM32WL5x") and !check_MCU("S_SINGLE_CORE"))) {
                AHB2Output.nodetype = .output;
                AHB2Output.parents = &.{&AHB2Prescaler};
            }
            // ======= NODE Cortex2Prescaler ======
            if ((check_MCU("STM32WL5x") and !check_MCU("S_SINGLE_CORE"))) {
                Cortex2Prescaler.nodetype = .div;
                Cortex2Prescaler.value = try Cortex2_DivValue.get();
                Cortex2Prescaler.parents = &.{&AHB2Prescaler};
            }
            // ======= NODE Cortex2SysOutput ======
            if ((check_MCU("STM32WL5x") and !check_MCU("S_SINGLE_CORE"))) {
                Cortex2SysOutput.nodetype = .output;
                Cortex2SysOutput.parents = &.{&Cortex2Prescaler};
            }
            // ======= NODE AHBPrescaler ======
            AHBPrescaler.nodetype = .div;
            AHBPrescaler.value = try AHBCLKDividerValue.get();
            AHBPrescaler.parents = &.{&SysCLKOutput};

            // ======= NODE PWRCLKoutput ======
            PWRCLKoutput.nodetype = .output;
            PWRCLKoutput.parents = &.{&SysCLKOutput};

            // ======= NODE AHBOutput ======
            AHBOutput.nodetype = .output;
            AHBOutput.parents = &.{&AHBPrescaler};

            // ======= NODE HCLKOutput ======
            HCLKOutput.nodetype = .output;
            HCLKOutput.parents = &.{&AHBOutput};

            // ======= NODE CortexPrescaler ======
            CortexPrescaler.nodetype = .div;
            CortexPrescaler.value = try Cortex_DivValue.get();
            CortexPrescaler.parents = &.{&AHBOutput};

            // ======= NODE CortexSysOutput ======
            CortexSysOutput.nodetype = .output;
            CortexSysOutput.parents = &.{&CortexPrescaler};

            // ======= NODE FCLKCortexOutput ======
            FCLKCortexOutput.nodetype = .output;
            FCLKCortexOutput.parents = &.{&AHBOutput};

            // ======= NODE APB1Prescaler ======
            APB1Prescaler.nodetype = .div;
            APB1Prescaler.value = try APB1CLKDividerValue.get();
            APB1Prescaler.parents = &.{&AHBOutput};

            // ======= NODE I2S_CKIN ======
            if (check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"=")) {
                I2S_CKIN.nodetype = .source;
                I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;
            }
            // ======= NODE APB1Output ======
            APB1Output.nodetype = .output;
            APB1Output.parents = &.{&APB1Prescaler};

            // ======= NODE TimPrescalerAPB1 ======
            TimPrescalerAPB1.nodetype = .mul;
            TimPrescalerAPB1.value = @floatFromInt(APB1TimCLKDividerValue);
            TimPrescalerAPB1.parents = &.{&APB1Prescaler};

            // ======= NODE TimPrescOut1 ======
            TimPrescOut1.nodetype = .output;
            TimPrescOut1.parents = &.{&TimPrescalerAPB1};

            // ======= NODE APB2Prescaler ======
            APB2Prescaler.nodetype = .div;
            APB2Prescaler.value = try APB2CLKDividerValue.get();
            APB2Prescaler.parents = &.{&AHBOutput};

            // ======= NODE APB2Output ======
            APB2Output.nodetype = .output;
            APB2Output.parents = &.{&APB2Prescaler};

            // ======= NODE TimPrescalerAPB2 ======
            TimPrescalerAPB2.nodetype = .mul;
            TimPrescalerAPB2.value = @floatFromInt(APB2TimCLKDividerValue);
            TimPrescalerAPB2.parents = &.{&APB2Prescaler};

            // ======= NODE TimPrescOut2 ======
            TimPrescOut2.nodetype = .output;
            TimPrescOut2.parents = &.{&TimPrescalerAPB2};

            // ======= NODE PLLN ======
            PLLN.nodetype = .mul;
            PLLN.value = @floatFromInt(PLLNValue);
            PLLN.parents = &.{&PLLM};

            // ======= NODE PLLP ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                PLLP.nodetype = .div;
                PLLP.value = try PLLPValue.get();
                PLLP.parents = &.{&PLLN};
            }
            // ======= NODE PLLPoutput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                PLLPoutput.nodetype = .output;
                PLLPoutput.parents = &.{&PLLP};
            }
            // ======= NODE PLLQ ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=") or check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"=")) {
                PLLQ.nodetype = .div;
                PLLQ.value = try PLLQValue.get();
                PLLQ.parents = &.{&PLLN};
            }
            // ======= NODE PLLQoutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=") or check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"=")) {
                PLLQoutput.nodetype = .output;
                PLLQoutput.parents = &.{&PLLQ};
            }
            // ======= NODE PLLR ======
            PLLR.nodetype = .div;
            PLLR.value = try PLLRValue.get();
            PLLR.parents = &.{&PLLN};

            // ======= NODE VCOInput ======
            VCOInput.nodetype = .output;
            VCOInput.parents = &.{&PLLM};

            // ======= NODE VCOOutput ======
            VCOOutput.nodetype = .output;
            VCOOutput.parents = &.{&PLLN};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLLR};

            //======== POST REFS ========

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= LSCOPinFreq_Value ========
            const LSCOPinFreq_ValueValue = LSCOOutput.get_as_ref();
            ignore_value(LSCOPinFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")))) {
                RTCOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                };
            }

            //======= LCDFreq_Value ========
            const LCDFreq_ValueValue = LCDOutput.get_as_ref();
            ignore_value(LCDFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")))) {
                LCDOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);

            //======= LPTIM3Freq_Value ========
            const LPTIM3Freq_ValueValue = LPTIM3output.get_as_ref();
            ignore_value(LPTIM3Freq_ValueValue);

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);

            RNGoutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);

            //======= I2S2Freq_Value ========
            const I2S2Freq_ValueValue = I2S2output.get_as_ref();
            ignore_value(I2S2Freq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            ADCoutput.limit = .{
                .min = 1.4e6,
                .max = 4.8e7,
            };

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= HCLK3Freq_Value ========
            const HCLK3Freq_ValueValue = AHB3Output.get_as_ref();
            ignore_value(HCLK3Freq_ValueValue);

            AHB3Output.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= APB3Freq_Value ========
            const APB3Freq_ValueValue = APB3Output.get_as_ref();
            ignore_value(APB3Freq_ValueValue);

            APB3Output.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= FCLK2Freq_Value ========
            const FCLK2Freq_ValueValue = FCLK2CortexOutput.get_as_ref();
            ignore_value(FCLK2Freq_ValueValue);

            FCLK2CortexOutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= HCLK2Freq_Value ========
            const HCLK2Freq_ValueValue = AHB2Output.get_as_ref();
            ignore_value(HCLK2Freq_ValueValue);

            AHB2Output.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= Cortex2Freq_Value ========
            const Cortex2Freq_ValueValue = Cortex2SysOutput.get_as_ref();
            ignore_value(Cortex2Freq_ValueValue);

            Cortex2SysOutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            PWRCLKoutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if (config.flags.USBUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 1.42e7,
                    .max = 4.8e7,
                };
            } else {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            }

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);

            APB1Output.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig) and MCO1SOURCE_PLLPCLK or config.flags.ADCUsed_ForRCC and ADCSourcePLL) {
                PLLPoutput.limit = .{
                    .min = null,
                    .max = 6.2e7,
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if ((RNGCLKSOURCE_PLL and config.flags.RNGUsed_ForRCC) or (config.flags.I2S2Used_ForRCC) and I2S2CLKSOURCE_PLL or ((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig) and MCO1SOURCE_PLLQCLK) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            }

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 4e6,
                    .max = 1.6e7,
                };
            }

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (SysSourceMSI and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 16000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 16000000, .@"=")))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale2 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE2;
                    };
                } else if (SysSourceMSI) {
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
                                "SysSourceMSI",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if ((SysSourceHSI or SysSourceHSE) and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 16000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 16000000, .@"=")))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale2 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE2;
                    };
                } else if ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 16000000, .@"="))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                }
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
                            "Else",
                            "No additional information",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                scale1 = true;
                break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
            };

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale1) {
                VCOOutput.limit = .{
                    .min = 9.6e7,
                    .max = 3.44e8,
                };
            } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale2) {
                VCOOutput.limit = .{
                    .min = 9.6e7,
                    .max = 1.28e8,
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if (((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig) and check_MCU("MCO1SOURCE_PLLCLK") or SysSourcePLL) {
                PLLCLK.limit = .{
                    .min = 1.2e7,
                    .max = 4.8e7,
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if ((scale1 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 18000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 18000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 6000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 6000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_0 => {},
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_2 => {},
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_0;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 36000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 36000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 12000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 12000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_2 => {},
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "FLatency",
                                    "(scale1 & ((HCLK3Freq_Value < 36000000)|(HCLK3Freq_Value= 36000000 )))|(scale2 & ((HCLK3Freq_Value < 12000000)|(HCLK3Freq_Value= 12000000 )))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_2",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 48000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 48000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 16000000, .@"="))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_2) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "(scale1 & ((HCLK3Freq_Value < 48000000)|(HCLK3Freq_Value= 48000000 ))) |(scale2 & ((HCLK3Freq_Value < 16000000)|(HCLK3Freq_Value= 16000000 )))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                }
                if (config.extra_config.FLatency) |val| {
                    if (val != .FLASH_LATENCY_2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "FLatency",
                            "Else",
                            "No additional information",
                            "FLASH_LATENCY_2",
                            val,
                        });
                    }
                }
                break :blk .FLASH_LATENCY_2;
            };
            out.HSIRC = try HSIRC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSIDIV = try LSIDIV.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.MSIRC = try MSIRC.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2output = try USART2output.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
            out.HSEPRESC = try HSEPRESC.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.PLLM = try PLLM.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.LCDOutput = try LCDOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM2Mult = try LPTIM2Mult.get_output();
            out.LPTIM2output = try LPTIM2output.get_output();
            out.LPTIM3Mult = try LPTIM3Mult.get_output();
            out.LPTIM3output = try LPTIM3output.get_output();
            out.RNGMult = try RNGMult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2output = try I2C2output.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3output = try I2C3output.get_output();
            out.I2S2Mult = try I2S2Mult.get_output();
            out.I2S2output = try I2S2output.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.AHB3Prescaler = try AHB3Prescaler.get_output();
            out.AHB3Output = try AHB3Output.get_output();
            out.APB3Output = try APB3Output.get_output();
            out.AHB2Prescaler = try AHB2Prescaler.get_output();
            out.FCLK2CortexOutput = try FCLK2CortexOutput.get_output();
            out.AHB2Output = try AHB2Output.get_output();
            out.Cortex2Prescaler = try Cortex2Prescaler.get_output();
            out.Cortex2SysOutput = try Cortex2SysOutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.PWRCLKoutput = try PWRCLKoutput.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.CortexPrescaler = try CortexPrescaler.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.APB1Prescaler = try APB1Prescaler.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.TimPrescalerAPB1 = try TimPrescalerAPB1.get_output();
            out.TimPrescOut1 = try TimPrescOut1.get_output();
            out.APB2Prescaler = try APB2Prescaler.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.TimPrescalerAPB2 = try TimPrescalerAPB2.get_output();
            out.TimPrescOut2 = try TimPrescOut2.get_output();
            out.PLLN = try PLLN.get_output();
            out.PLLP = try PLLP.get_output();
            out.PLLPoutput = try PLLPoutput.get_output();
            out.PLLQ = try PLLQ.get_output();
            out.PLLQoutput = try PLLQoutput.get_output();
            out.PLLR = try PLLR.get_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ref_out.LSIDIV = LSIDIVValue;
            ignore_value(LSE_VALUEValue);
            ref_out.MSIClockRange = MSIClockRangeValue;
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.USART2CLockSelection = USART2CLockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.LSCOSource1 = LSCOSource1Value;
            ignore_value(LSCOPinFreq_ValueValue);
            ref_out.HSEPRES = HSEPRESValue;
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLLM = PLLMValue;
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(LCDFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.USART1CLockSelection = USART1CLockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.LPUART1CLockSelection = LPUART1CLockSelectionValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM2CLockSelection = LPTIM2CLockSelectionValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.LPTIM3CLockSelection = LPTIM3CLockSelectionValue;
            ignore_value(LPTIM3Freq_ValueValue);
            ref_out.RNGCLockSelection = RNGCLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.I2C2CLockSelection = I2C2CLockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C3CLockSelection = I2C3CLockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ref_out.I2S2CLockSelection = I2S2CLockSelectionValue;
            ignore_value(I2S2Freq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.AHB3CLKDivider = AHB3CLKDividerValue;
            ignore_value(HCLK3Freq_ValueValue);
            ignore_value(APB3Freq_ValueValue);
            ref_out.AHB2CLKDivider = AHB2CLKDividerValue;
            ignore_value(FCLK2Freq_ValueValue);
            ignore_value(HCLK2Freq_ValueValue);
            ref_out.Cortex2_Div = Cortex2_DivValue;
            ignore_value(Cortex2Freq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(PWRFreq_ValueValue);
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ignore_value(APB1Freq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APB1TimFreq_ValueValue);
            ref_out.APB2CLKDivider = APB2CLKDividerValue;
            ignore_value(APB2Freq_ValueValue);
            ref_out.APB2TimCLKDivider = APB2TimCLKDividerValue;
            ignore_value(APB2TimFreq_ValueValue);
            ref_out.PLLN = PLLNValue;
            ref_out.PLLP = PLLPValue;
            ignore_value(PLLPoutputFreq_ValueValue);
            ref_out.PLLQ = PLLQValue;
            ignore_value(PLLQoutputFreq_ValueValue);
            ref_out.PLLR = PLLRValue;
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLRCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.MSICalibrationValue = MSICalibrationValueValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.MSIAutoCalibration = MSIAutoCalibrationValue;
            ref_out.Prescaler = PrescalerValue;
            ref_out.Source = SourceValue;
            ref_out.Polarity = PolarityValue;
            ref_out.ReloadValueType = ReloadValueTypeValue;
            ref_out.ReloadValue = ReloadValueValue;
            ref_out.Fsync = FsyncValue;
            ref_out.ErrorLimitValue = ErrorLimitValueValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.LPTIM3Enable = LPTIM3EnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.I2S2Enable = I2S2EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.MSIUsed = MSIUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
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
