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
            PLL_R = 5,
            LSI1 = 6,
            LSI2 = 7,
            LSE = 8,
            HSI48 = 9,
            HSE_UNSTABLE = 12,
        };
        pub const RCC_USART1SEL = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_LPTIM1SEL = enum(u2) {
            PCLK1 = 0,
            LSI = 1,
            HSI = 2,
            LSE = 3,
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
            PLLSAI1_R = 1,
            PLL1_P = 2,
            SYS = 3,
        };
        pub const RCC_LPTIM2SEL = enum(u2) {
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
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_LPUART1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_RNGSEL = enum(u2) {
            CLK48 = 0,
            LSI = 1,
            LSE = 2,
        };
        pub const RCC_PLLSRC = enum(u2) {
            MSI = 1,
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_I2C1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };

        pub const LSISource1List = enum {
            RCC_LSCOSOURCE_LSI1,
            RCC_LSCOSOURCE_LSI2,
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

        pub const HCLKRFclockSelectionVirtualList = enum {
            RCC_HCLKRFCLKSOURCE_HSE,
            RCC_HCLKRFCLKSOURCE_HSI,
        };

        pub const LPTIM1CLockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_PCLK1,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_HSI,
            RCC_LPTIM1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM1SEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                    .HSI => .RCC_LPTIM1CLKSOURCE_HSI,
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_PCLK1,
                };
            }
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

            pub fn to_enum(self: @This()) anyerror!RCC_USART1SEL {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART1CLKSOURCE_LSE => .HSE,
                    .RCC_USART1CLKSOURCE_PCLK2 => .PCLK2,
                };
            }
            pub fn from_enum(item: RCC_USART1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
                    .HSE => .RCC_USART1CLKSOURCE_LSE,
                    .PCLK2 => .RCC_USART1CLKSOURCE_PCLK2,
                };
            }
        };

        pub const LPUART1CLockSelectionList = enum {
            RCC_LPUART1CLKSOURCE_PCLK1,
            RCC_LPUART1CLKSOURCE_SYSCLK,
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPUART1SEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_LSE => .HSE,
                    .RCC_LPUART1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPUART1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_LPUART1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .HSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PCLK1 => .RCC_LPUART1CLKSOURCE_PCLK1,
                    .SYS => .RCC_LPUART1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const SMPSCLockSelectionVirtualList = enum {
            RCC_SMPSCLKSOURCE_MSI,
            RCC_SMPSCLKSOURCE_HSE,
            RCC_SMPSCLKSOURCE_HSI,
        };

        pub const SMPSDividerList = enum {
            @"1",
            @"2",
            @"3",
            @"4",
            @"6",

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .@"2" => .Div2,
                    .@"3" => .Div3,
                    .@"1" => .Div1,
                    .@"6" => .Div6,
                    .@"4" => .Div4,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div2 => .@"2",
                    .Div3 => .@"3",
                    .Div1 => .@"1",
                    .Div6 => .@"6",
                    .Div4 => .@"4",
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "SMPSDivider" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .@"1" => 1,
                    .@"2" => 2,
                    .@"3" => 3,
                    .@"4" => 4,
                    .@"6" => 6,
                };
            }
        };

        pub const SMPSFreq_ValueList = enum {
            @"4000000",
            @"8000000",
        };

        pub const LPTIM2CLockSelectionList = enum {
            RCC_LPTIM2CLKSOURCE_PCLK,
            RCC_LPTIM2CLKSOURCE_LSI,
            RCC_LPTIM2CLKSOURCE_HSI,
            RCC_LPTIM2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM2CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM2CLKSOURCE_PCLK => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .HSI => .RCC_LPTIM2CLKSOURCE_HSI,
                    .PCLK1 => .RCC_LPTIM2CLKSOURCE_PCLK,
                };
            }
        };

        pub const RFWKPClockSelectionList = enum {
            RCC_RFWKPCLKSOURCE_LSE,
            RCC_RFWKPCLKSOURCE_HSE_DIV1024,
            RCC_RFWKPCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_RTCSEL {
                return switch (self) {
                    .RCC_RFWKPCLKSOURCE_LSI => .LSI,
                    .RCC_RFWKPCLKSOURCE_LSE => .LSE,
                    .RCC_RFWKPCLKSOURCE_HSE_DIV1024 => .HSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RFWKPCLKSOURCE_LSI,
                    .LSE => .RCC_RFWKPCLKSOURCE_LSE,
                    .HSE => .RCC_RFWKPCLKSOURCE_HSE_DIV1024,
                };
            }
        };

        pub const CK48CLockSelectionList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_MSI,
        };

        pub const RNGCLockSelectionList = enum {
            RCC_RNGCLKSOURCE_CLK48,
            RCC_RNGCLKSOURCE_LSI,
            RCC_RNGCLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_RNGSEL {
                return switch (self) {
                    .RCC_RNGCLKSOURCE_LSI => .LSI,
                    .RCC_RNGCLKSOURCE_CLK48 => .CLK48,
                    .RCC_RNGCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RNGSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RNGCLKSOURCE_LSI,
                    .CLK48 => .RCC_RNGCLKSOURCE_CLK48,
                    .LSE => .RCC_RNGCLKSOURCE_LSE,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
            RCC_I2C1CLKSOURCE_PCLK1,
            RCC_I2C1CLKSOURCE_SYSCLK,
            RCC_I2C1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C1SEL {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2C1SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_I2C1CLKSOURCE_PCLK1,
                    .SYS => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
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
                    .RCC_ADCCLKSOURCE_HSI => .PLLSAI1_R,
                    .RCC_ADCCLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_ADCCLKSOURCE_PLL,
                    .PLLSAI1_R => .RCC_ADCCLKSOURCE_HSI,
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
            RCC_MCO1SOURCE_LSI1,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI1 => .LSI1,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL_R,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_MSI => .MSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI1 => .RCC_MCO1SOURCE_LSI1,
                    .PLL_R => .RCC_MCO1SOURCE_PLLCLK,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .MSI => .RCC_MCO1SOURCE_MSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_MCOSEL", @tagName(item), "RCC_MCO1Source" },
                    ),
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
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "AHB3CLKDivider" },
                    ),
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

        pub const AHB2CLKDividerList = enum {
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
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "AHB2CLKDivider" },
                    ),
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
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "AHBCLKDivider" },
                    ),
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

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLP_DIV30 => .Div30,
                    .RCC_PLLP_DIV25 => .Div25,
                    .RCC_PLLP_DIV10 => .Div10,
                    .RCC_PLLP_DIV11 => .Div11,
                    .RCC_PLLP_DIV28 => .Div28,
                    .RCC_PLLP_DIV20 => .Div20,
                    .RCC_PLLP_DIV26 => .Div26,
                    .RCC_PLLP_DIV17 => .Div17,
                    .RCC_PLLP_DIV15 => .Div15,
                    .RCC_PLLP_DIV14 => .Div14,
                    .RCC_PLLP_DIV2 => .Div2,
                    .RCC_PLLP_DIV5 => .Div5,
                    .RCC_PLLP_DIV19 => .Div19,
                    .RCC_PLLP_DIV24 => .Div24,
                    .RCC_PLLP_DIV22 => .Div22,
                    .RCC_PLLP_DIV12 => .Div12,
                    .RCC_PLLP_DIV21 => .Div21,
                    .RCC_PLLP_DIV23 => .Div23,
                    .RCC_PLLP_DIV18 => .Div18,
                    .RCC_PLLP_DIV6 => .Div6,
                    .RCC_PLLP_DIV31 => .Div31,
                    .RCC_PLLP_DIV9 => .Div9,
                    .RCC_PLLP_DIV7 => .Div7,
                    .RCC_PLLP_DIV4 => .Div4,
                    .RCC_PLLP_DIV16 => .Div16,
                    .RCC_PLLP_DIV13 => .Div13,
                    .RCC_PLLP_DIV27 => .Div27,
                    .RCC_PLLP_DIV8 => .Div8,
                    .RCC_PLLP_DIV29 => .Div29,
                    .RCC_PLLP_DIV3 => .Div3,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div30 => .RCC_PLLP_DIV30,
                    .Div25 => .RCC_PLLP_DIV25,
                    .Div10 => .RCC_PLLP_DIV10,
                    .Div11 => .RCC_PLLP_DIV11,
                    .Div28 => .RCC_PLLP_DIV28,
                    .Div20 => .RCC_PLLP_DIV20,
                    .Div26 => .RCC_PLLP_DIV26,
                    .Div17 => .RCC_PLLP_DIV17,
                    .Div15 => .RCC_PLLP_DIV15,
                    .Div14 => .RCC_PLLP_DIV14,
                    .Div2 => .RCC_PLLP_DIV2,
                    .Div5 => .RCC_PLLP_DIV5,
                    .Div19 => .RCC_PLLP_DIV19,
                    .Div24 => .RCC_PLLP_DIV24,
                    .Div22 => .RCC_PLLP_DIV22,
                    .Div12 => .RCC_PLLP_DIV12,
                    .Div21 => .RCC_PLLP_DIV21,
                    .Div23 => .RCC_PLLP_DIV23,
                    .Div18 => .RCC_PLLP_DIV18,
                    .Div6 => .RCC_PLLP_DIV6,
                    .Div31 => .RCC_PLLP_DIV31,
                    .Div9 => .RCC_PLLP_DIV9,
                    .Div7 => .RCC_PLLP_DIV7,
                    .Div4 => .RCC_PLLP_DIV4,
                    .Div16 => .RCC_PLLP_DIV16,
                    .Div13 => .RCC_PLLP_DIV13,
                    .Div27 => .RCC_PLLP_DIV27,
                    .Div8 => .RCC_PLLP_DIV8,
                    .Div29 => .RCC_PLLP_DIV29,
                    .Div3 => .RCC_PLLP_DIV3,
                };
            }
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

        pub const SMPS1Freq_ValueList = enum {
            @"8000000",
            @"16000000",
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
            FLASH_LATENCY_3,
        };

        pub const MSIAutoCalibrationList = enum {
            DISABLED,
            ENABLED,
        };

        pub const MSIOscStateList = enum {
            DISABLED,
            ENABLED,
        };

        pub const HSIOscStateList = enum {
            DISABLED,
            ENABLED,
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

        pub const EnableHSERFDevisorList = enum {
            true,
            false,
        };

        pub const EnableHCLKRList = enum {
            auto,
        };

        pub const LPTIM1EnableList = enum {
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

        pub const SMPSEnableList = enum {
            false,
            true,
        };

        pub const SMPSDivEnableList = enum {
            false,
            true,
        };

        pub const LPTIM2EnableList = enum {
            true,
            false,
        };

        pub const RFEnableList = enum {
            true,
            false,
        };

        pub const RNGEnableList = enum {
            true,
            false,
        };

        pub const I2C1EnableList = enum {
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
            LSEOscillator: bool = false,
            HSEByPass: bool = false,
            LSEByPass: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            RFUsed_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            RNGUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC3: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            EnableCSS: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEOscillator: bool = false,
            LSEOscillator: bool = false,
            HSEByPass: bool = false,
            LSEByPass: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            RFUsed_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            RNGUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC3: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            EnableCSS: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            LSIEnable: bool = false, //Reference flag
            EnableHSERFDevisor: bool = false, //Reference flag
            EnableHCLKR: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            SMPSEnable: bool = false, //Reference flag
            SMPSDivEnable: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            RFEnable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            MSIUsed: bool = false, //Reference flag
            MSIUsedForSys: bool = false, //Reference flag
            HSIUsedForSys: bool = false, //Reference flag
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
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            MSIOscState: ?MSIOscStateList = null,
            HSIOscState: ?HSIOscStateList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSE_VALUE: ?f32 = null,
            LSISource1: ?LSISource1List = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?MSIClockRangeList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            LSCOSource1: ?LSCOSource1List = null,
            HSEPRES: ?u32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?PLLMList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            SMPSCLockSelectionVirtual: ?SMPSCLockSelectionVirtualList = null,
            SMPSDivider: ?SMPSDividerList = null,
            LPTIM2CLockSelection: ?LPTIM2CLockSelectionList = null,
            RFWKPClockSelection: ?RFWKPClockSelectionList = null,
            CK48CLockSelection: ?CK48CLockSelectionList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
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

            LSISource1: LSISource1List,
            MSIClockRange: MSIClockRangeList,
            HCLKRFDiv: u32,
            HCLKRFclockSelectionVirtual: HCLKRFclockSelectionVirtualList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            LSCOSource1: LSCOSource1List,
            HSEPRES: u32,
            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLM: PLLMList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            SMPSCLockSelectionVirtual: SMPSCLockSelectionVirtualList,
            SMPSDivider: SMPSDividerList,
            SMPSDiv2: u32,
            LPTIM2CLockSelection: LPTIM2CLockSelectionList,
            RCC_RFWKP_Clock_Source_FROM_HSE: u32,
            RFWKPClockSelection: RFWKPClockSelectionList,
            CK48CLockSelection: CK48CLockSelectionList,
            RNGDiv: u32,
            RNGCLockSelection: RNGCLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
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
            MSIAutoCalibration: MSIAutoCalibrationList,
            MSIOscState: MSIOscStateList,
            HSIOscState: HSIOscStateList,
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
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            MSIOscState: ?MSIOscStateList = null,
            HSIOscState: ?HSIOscStateList = null,
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
                    .MSIAutoCalibration = self.MSIAutoCalibration,
                    .MSIOscState = self.MSIOscState,
                    .HSIOscState = self.HSIOscState,
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
            LSISource1: ?LSISource1List = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?RCC_MSIRANGE = null,
            LPTIM1CLockSelection: ?RCC_LPTIM1SEL = null,
            LSCOSource1: ?LSCOSource1List = null,
            HSEPRES: ?u32 = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?RCC_PLLM = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelection: ?RCC_USART1SEL = null,
            LPUART1CLockSelection: ?RCC_LPUART1SEL = null,
            SMPSCLockSelectionVirtual: ?SMPSCLockSelectionVirtualList = null,
            SMPSDivider: ?RCC_HPRE = null,
            LPTIM2CLockSelection: ?RCC_LPTIM2SEL = null,
            RFWKPClockSelection: ?RCC_RTCSEL = null,
            CK48CLockSelection: ?CK48CLockSelectionList = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            I2C1CLockSelection: ?RCC_I2C1SEL = null,
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
            PLLP: ?RCC_PLLP = null,
            PLLQ: ?RCC_PLLP = null,
            PLLR: ?RCC_PLLP = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSISource1 = self.LSISource1,
                    .LSE_VALUE = self.LSE_VALUE,
                    .MSIClockRange = if (self.MSIClockRange) |val| try MSIClockRangeList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .LSCOSource1 = self.LSCOSource1,
                    .HSEPRES = self.HSEPRES,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = if (self.PLLM) |val| try PLLMList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .SMPSCLockSelectionVirtual = self.SMPSCLockSelectionVirtual,
                    .SMPSDivider = if (self.SMPSDivider) |val| try SMPSDividerList.from_enum(val) else null,
                    .LPTIM2CLockSelection = if (self.LPTIM2CLockSelection) |val| try LPTIM2CLockSelectionList.from_enum(val) else null,
                    .RFWKPClockSelection = if (self.RFWKPClockSelection) |val| try RFWKPClockSelectionList.from_enum(val) else null,
                    .CK48CLockSelection = self.CK48CLockSelection,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
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
                    .PLLP = if (self.PLLP) |val| try PLLPList.from_enum(val) else null,
                    .PLLQ = if (self.PLLQ) |val| try PLLQList.from_enum(val) else null,
                    .PLLR = if (self.PLLR) |val| try PLLRList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            LSISource1: LSISource1List,
            MSIClockRange: RCC_MSIRANGE,
            HCLKRFDiv: u32,
            HCLKRFclockSelectionVirtual: HCLKRFclockSelectionVirtualList,
            LPTIM1CLockSelection: RCC_LPTIM1SEL,
            LSCOSource1: LSCOSource1List,
            HSEPRES: u32,
            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLM: RCC_PLLM,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelection: RCC_USART1SEL,
            LPUART1CLockSelection: RCC_LPUART1SEL,
            SMPSCLockSelectionVirtual: SMPSCLockSelectionVirtualList,
            SMPSDivider: RCC_HPRE,
            SMPSDiv2: u32,
            LPTIM2CLockSelection: RCC_LPTIM2SEL,
            RCC_RFWKP_Clock_Source_FROM_HSE: u32,
            RFWKPClockSelection: RCC_RTCSEL,
            CK48CLockSelection: CK48CLockSelectionList,
            RNGDiv: u32,
            RNGCLockSelection: RCC_RNGSEL,
            I2C1CLockSelection: RCC_I2C1SEL,
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
            PLLP: RCC_PLLP,
            PLLQ: RCC_PLLP,
            PLLR: RCC_PLLP,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            MSIAutoCalibration: MSIAutoCalibrationList,
            MSIOscState: MSIOscStateList,
            HSIOscState: HSIOscStateList,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .LSISource1 = cubemx_config.LSISource1,
                    .MSIClockRange = try cubemx_config.MSIClockRange.to_enum(),
                    .HCLKRFDiv = cubemx_config.HCLKRFDiv,
                    .HCLKRFclockSelectionVirtual = cubemx_config.HCLKRFclockSelectionVirtual,
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .LSCOSource1 = cubemx_config.LSCOSource1,
                    .HSEPRES = cubemx_config.HSEPRES,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = try cubemx_config.PLLM.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .SMPSCLockSelectionVirtual = cubemx_config.SMPSCLockSelectionVirtual,
                    .SMPSDivider = try cubemx_config.SMPSDivider.to_enum(),
                    .SMPSDiv2 = cubemx_config.SMPSDiv2,
                    .LPTIM2CLockSelection = try cubemx_config.LPTIM2CLockSelection.to_enum(),
                    .RCC_RFWKP_Clock_Source_FROM_HSE = cubemx_config.RCC_RFWKP_Clock_Source_FROM_HSE,
                    .RFWKPClockSelection = try cubemx_config.RFWKPClockSelection.to_enum(),
                    .CK48CLockSelection = cubemx_config.CK48CLockSelection,
                    .RNGDiv = cubemx_config.RNGDiv,
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
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
                    .PLLP = try cubemx_config.PLLP.to_enum(),
                    .PLLQ = try cubemx_config.PLLQ.to_enum(),
                    .PLLR = try cubemx_config.PLLR.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .MSICalibrationValue = cubemx_config.MSICalibrationValue,
                    .MSIAutoCalibration = cubemx_config.MSIAutoCalibration,
                    .MSIOscState = cubemx_config.MSIOscState,
                    .HSIOscState = cubemx_config.HSIOscState,
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
            LSI2RC: u32 = 0,
            LSIMult: u32 = 0,
            LSEOSC: u32 = 0,
            MSIRC: u32 = 0,
            HCLKRFMultDiv: u32 = 0,
            HCLKRFMult: u32 = 0,
            HCLKRFOutput: u32 = 0,
            APB3Output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
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
            SMPSMult: u32 = 0,
            SMPSDivider: u32 = 0,
            SMPSDiv2: u32 = 0,
            SMPSoutput: u32 = 0,
            LPTIM2Mult: u32 = 0,
            LPTIM2output: u32 = 0,
            HSERFWKPDevisor: u32 = 0,
            RFWKPClkSource: u32 = 0,
            RFWKPOutput: u32 = 0,
            CK48Mult: u32 = 0,
            RNGDiv: u32 = 0,
            RNGMult: u32 = 0,
            RNGoutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            AHB3Prescaler: u32 = 0,
            AHB3Output: u32 = 0,
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
            LSI: u32 = 0,
            SMPSDivclk: u32 = 0,
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

            var LSISourceLSI1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSISourceLSI2: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var HCLKRFSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKRFSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var SMPSSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SMPSSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SMPSSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RFWKPSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RFWKPSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RFWKPSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_CLK48: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIAutoCalibrationON: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var LSI2RC = ClockNode{
                .name = "LSI2RC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSIMult = ClockNode{
                .name = "LSIMult",
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

            var HCLKRFMultDiv = ClockNode{
                .name = "HCLKRFMultDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HCLKRFMult = ClockNode{
                .name = "HCLKRFMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HCLKRFOutput = ClockNode{
                .name = "HCLKRFOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB3Output = ClockNode{
                .name = "APB3Output",
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

            var SMPSMult = ClockNode{
                .name = "SMPSMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SMPSDivider = ClockNode{
                .name = "SMPSDivider",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SMPSDiv2 = ClockNode{
                .name = "SMPSDiv2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SMPSoutput = ClockNode{
                .name = "SMPSoutput",
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

            var HSERFWKPDevisor = ClockNode{
                .name = "HSERFWKPDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RFWKPClkSource = ClockNode{
                .name = "RFWKPClkSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RFWKPOutput = ClockNode{
                .name = "RFWKPOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CK48Mult = ClockNode{
                .name = "CK48Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RNGDiv = ClockNode{
                .name = "RNGDiv",
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

            var LSI = ClockNode{
                .name = "LSI",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SMPSDivclk = ClockNode{
                .name = "SMPSDivclk",
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
                if (check_MCU("STM32WB1MMCHx")) {
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
                                "STM32WB1MMCHx",
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
                } else if ((config.flags.HSEByPass or config.flags.HSEOscillator) and config.flags.RFUsed_ForRCC) {
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
                                "(HSEByPass | HSEOscillator)  & RFUsed_ForRCC",
                                "HSE for RF",
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

            const LSI1_VALUEValue: f32 = blk: {
                break :blk 3.2e4;
            };

            const LSI2_VALUEValue: f32 = blk: {
                break :blk 3.2e4;
            };

            const LSISource1Value: LSISource1List = blk: {
                const user_val = config.LSISource1;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LSCOSOURCE_LSI1 => LSISourceLSI1 = true,
                        .RCC_LSCOSOURCE_LSI2 => LSISourceLSI2 = true,
                    }
                }
                break :blk user_val orelse {
                    LSISourceLSI1 = true;
                    break :blk .RCC_LSCOSOURCE_LSI1;
                };
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

            const HCLKRFDivValue: u32 = blk: {
                break :blk 2;
            };

            const HCLKRFclockSelectionVirtualValue: HCLKRFclockSelectionVirtualList = blk: {
                if ((config.flags.HSEByPass or config.flags.HSEOscillator)) {
                    HCLKRFSourceHSE = true;
                    break :blk .RCC_HCLKRFCLKSOURCE_HSE;
                }
                HCLKRFSourceHSI = true;
                break :blk .RCC_HCLKRFCLKSOURCE_HSI;
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

            const SMPSCLockSelectionVirtualValue: SMPSCLockSelectionVirtualList = blk: {
                if (check_ref(@TypeOf(HSE_VALUEValue), HSE_VALUEValue, 32000000, .@"=") and (MSIRANGE_8 or MSIRANGE_9 or MSIRANGE_10 or MSIRANGE_11)) {
                    const user_val = config.SMPSCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SMPSCLKSOURCE_MSI => SMPSSourceMSI = true,
                            .RCC_SMPSCLKSOURCE_HSE => SMPSSourceHSE = true,
                            .RCC_SMPSCLKSOURCE_HSI => SMPSSourceHSI = true,
                        }
                    }
                    break :blk user_val orelse {
                        SMPSSourceHSI = true;
                        break :blk .RCC_SMPSCLKSOURCE_HSI;
                    };
                } else if (check_ref(@TypeOf(HSE_VALUEValue), HSE_VALUEValue, 32000000, .@"=")) {
                    const user_val = config.SMPSCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SMPSCLKSOURCE_HSE => SMPSSourceHSE = true,
                            .RCC_SMPSCLKSOURCE_HSI => SMPSSourceHSI = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "SMPSCLockSelectionVirtual",
                                    "HSE_VALUE=32000000",
                                    "SMPS CLock could not use MSI as clock source",
                                    @tagName(val),
                                    "RCC_SMPSCLKSOURCE_HSE",
                                    "RCC_SMPSCLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        SMPSSourceHSI = true;
                        break :blk .RCC_SMPSCLKSOURCE_HSI;
                    };
                } else if ((MSIRANGE_8 or MSIRANGE_9 or MSIRANGE_10 or MSIRANGE_11)) {
                    const user_val = config.SMPSCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SMPSCLKSOURCE_MSI => SMPSSourceMSI = true,
                            .RCC_SMPSCLKSOURCE_HSI => SMPSSourceHSI = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "SMPSCLockSelectionVirtual",
                                    "(MSIRANGE_8 | MSIRANGE_9 | MSIRANGE_10 | MSIRANGE_11)",
                                    "SMPS could not use  HSE as a clock source",
                                    @tagName(val),
                                    "RCC_SMPSCLKSOURCE_MSI",
                                    "RCC_SMPSCLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        SMPSSourceHSI = true;
                        break :blk .RCC_SMPSCLKSOURCE_HSI;
                    };
                } else if (!(check_ref(@TypeOf(HSE_VALUEValue), HSE_VALUEValue, 32000000, .@"=")) and !(MSIRANGE_8 or MSIRANGE_9 or MSIRANGE_10 or MSIRANGE_11)) {
                    if (config.SMPSCLockSelectionVirtual) |val| {
                        if (val != .RCC_SMPSCLKSOURCE_HSI) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "SMPSCLockSelectionVirtual",
                                "!(HSE_VALUE=32000000) & !(MSIRANGE_8 | MSIRANGE_9 | MSIRANGE_10 | MSIRANGE_11)",
                                "MSI should be greather than 16 Mhz OR HSE with 32 Mhz",
                                "RCC_SMPSCLKSOURCE_HSI",
                                val,
                            });
                        }
                    }
                    SMPSSourceHSI = true;
                    break :blk .RCC_SMPSCLKSOURCE_HSI;
                }
                const user_val = config.SMPSCLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SMPSCLKSOURCE_MSI => SMPSSourceMSI = true,
                        .RCC_SMPSCLKSOURCE_HSE => SMPSSourceHSE = true,
                        .RCC_SMPSCLKSOURCE_HSI => SMPSSourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    SMPSSourceHSI = true;
                    break :blk .RCC_SMPSCLKSOURCE_HSI;
                };
            };

            const SMPSDividerValue: SMPSDividerList = blk: {
                if (check_ref(@TypeOf(SMPSCLockSelectionVirtualValue), SMPSCLockSelectionVirtualValue, .RCC_SMPSCLKSOURCE_MSI, .@"=") and (MSIRANGE_9 or MSIRANGE_11)) {
                    const user_val = config.SMPSDivider;

                    if (user_val) |val| {
                        switch (val) {
                            .@"1" => {},
                            .@"2" => {},
                            .@"3" => {},
                            .@"4" => {},
                            .@"6" => {},
                        }
                    }
                    break :blk user_val orelse .@"3";
                }
                const user_val = config.SMPSDivider;

                if (user_val) |val| {
                    switch (val) {
                        .@"1" => {},
                        .@"2" => {},
                        .@"3" => {},
                        .@"4" => {},
                        .@"6" => {},
                    }
                }
                break :blk user_val orelse .@"2";
            };

            const SMPSDiv2Value: u32 = blk: {
                break :blk 2;
            };

            const LPTIM2CLockSelectionValue: LPTIM2CLockSelectionList = blk: {
                const user_val = config.LPTIM2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM2CLKSOURCE_PCLK => {},
                        .RCC_LPTIM2CLKSOURCE_LSI => LPTIM2SOURCELSI = true,
                        .RCC_LPTIM2CLKSOURCE_HSI => LPTIM2SOURCEHSI = true,
                        .RCC_LPTIM2CLKSOURCE_LSE => LPTIM2SOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM2CLKSOURCE_PCLK;
            };

            const RCC_RFWKP_Clock_Source_FROM_HSEValue: u32 = blk: {
                break :blk 1024;
            };

            const RFWKPClockSelectionValue: RFWKPClockSelectionList = blk: {
                const user_val = config.RFWKPClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RFWKPCLKSOURCE_LSE => RFWKPSourceLSE = true,
                        .RCC_RFWKPCLKSOURCE_HSE_DIV1024 => RFWKPSourceHSE = true,
                        .RCC_RFWKPCLKSOURCE_LSI => RFWKPSourceLSI = true,
                    }
                }
                break :blk user_val orelse {
                    RFWKPSourceLSI = true;
                    break :blk .RCC_RFWKPCLKSOURCE_LSI;
                };
            };

            const CK48CLockSelectionValue: CK48CLockSelectionList = blk: {
                const user_val = config.CK48CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL => CK48SourcePLLCLK = true,
                        .RCC_USBCLKSOURCE_MSI => CK48SourceMSI = true,
                    }
                }
                break :blk user_val orelse {
                    CK48SourceMSI = true;
                    break :blk .RCC_USBCLKSOURCE_MSI;
                };
            };

            const RNGDivValue: u32 = blk: {
                break :blk 3;
            };

            const RNGCLockSelectionValue: RNGCLockSelectionList = blk: {
                const user_val = config.RNGCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_CLK48 => RNGCLKSOURCE_CLK48 = true,
                        .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
                        .RCC_RNGCLKSOURCE_LSE => RNGCLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    RNGCLKSOURCE_LSI = true;
                    break :blk .RCC_RNGCLKSOURCE_LSI;
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

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                if (!check_MCU("STM32WBx0_Value_Line")) {
                    const user_val = config.ADCCLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_ADCCLKSOURCE_HSI => ADCSourceHSI = true,
                            .RCC_ADCCLKSOURCE_PLL => ADCSourcePLL = true,
                            .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                        }
                    }
                    break :blk user_val orelse {
                        ADCSourceHSI = true;
                        break :blk .RCC_ADCCLKSOURCE_HSI;
                    };
                } else if (check_MCU("STM32WBx0_Value_Line")) {
                    const user_val = config.ADCCLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_ADCCLKSOURCE_PLL => ADCSourcePLL = true,
                            .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "ADCCLockSelection",
                                    "STM32WBx0_Value_Line",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_P" else "RCC_ADCCLKSOURCE_PLL",
                                    if (patch_logs) "SYS" else "RCC_ADCCLKSOURCE_SYSCLK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        ADCSourceSys = true;
                        break :blk .RCC_ADCCLKSOURCE_SYSCLK;
                    };
                }
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_HSI => ADCSourceHSI = true,
                        .RCC_ADCCLKSOURCE_PLL => ADCSourcePLL = true,
                        .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                    }
                }
                break :blk user_val orelse {
                    ADCSourceHSI = true;
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
                        .RCC_MCO1SOURCE_LSI1 => MCOSourceLSI = true,
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
                        .RCC_SYSCLK_DIV4 => {},
                        .RCC_SYSCLK_DIV8 => {},
                        .RCC_SYSCLK_DIV16 => {},
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
                        .RCC_SYSCLK_DIV4 => {},
                        .RCC_SYSCLK_DIV8 => {},
                        .RCC_SYSCLK_DIV16 => {},
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
                        .RCC_SYSCLK_DIV1 => {},
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
                break :blk user_val orelse .RCC_SYSCLK_DIV1;
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

            const LSI_VALUEValue: f32 = blk: {
                break :blk 3.2e4;
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
                break :blk user_val orelse .@"1";
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
                if ((ADCSourcePLL and config.flags.USE_ADC1) or (SysSourcePLL) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig)) or (CK48SourcePLLCLK and ((config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if (ADCSourceHSI and config.flags.USE_ADC1 or (HCLKRFSourceHSI) or ((true) and SMPSSourceHSI) or (USART1SourceHSI and config.flags.USART1Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCEHSI and config.flags.LPTIM2Used_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (check_MCU("I2C3SourceHSI") and config.flags.I2C3Used_ForRCC) or ((PLLSourceHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig))))) {
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
                if (((true) and SMPSSourceMSI) or (check_MCU("SEM2RCC_MSI_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or (CK48SourceMSI and ((config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_MSI, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig)) or (PLLSourceMSI and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")))) {
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

            const MSIUsedForSysValue: u1 = blk: {
                if (((PLLSourceMSI) and (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"="))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const MSIOscStateValue: MSIOscStateList = blk: {
                if (((true) and (check_ref(@TypeOf(MSIUsedForSysValue), MSIUsedForSysValue, 0, .@"="))) or ((true) and (check_ref(@TypeOf(MSIUsedValue), MSIUsedValue, 0, .@"=")))) {
                    const user_val = config.extra_config.MSIOscState;

                    if (user_val) |val| {
                        switch (val) {
                            .DISABLED => {},
                            .ENABLED => {},
                        }
                    }
                    break :blk user_val orelse .ENABLED;
                }
                if (config.extra_config.MSIOscState) |val| {
                    if (val != .ENABLED) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "MSIOscState",
                            "Else",
                            "No additional information",
                            "ENABLED",
                            val,
                        });
                    }
                }
                break :blk .ENABLED;
            };

            const HSIUsedForSysValue: u1 = blk: {
                if (((PLLSourceHSI) and (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"="))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIOscStateValue: HSIOscStateList = blk: {
                if (((true) and (check_ref(@TypeOf(HSIUsedForSysValue), HSIUsedForSysValue, 0, .@"="))) or ((true) and (check_ref(@TypeOf(HSIUsedValue), HSIUsedValue, 0, .@"=")))) {
                    const user_val = config.extra_config.HSIOscState;

                    if (user_val) |val| {
                        switch (val) {
                            .DISABLED => {},
                            .ENABLED => {},
                        }
                    }
                    break :blk user_val orelse .ENABLED;
                }
                if (config.extra_config.HSIOscState) |val| {
                    if (val != .ENABLED) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "HSIOscState",
                            "Else",
                            "No additional information",
                            "ENABLED",
                            val,
                        });
                    }
                }
                break :blk .ENABLED;
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
                if ((config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_LSE) or MSIAutoCalibrationON or (config.flags.RFUsed_ForRCC and RFWKPSourceLSE) or (LSCOSSourceLSE and config.flags.LSCOConfig) or (check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM16")) or (check_MCU("SEM2RCC_LSE_REQUIRED_TIM2") and check_MCU("Semaphore_TIM2_L4_ETR_REMAPTIM2") and check_MCU("TIM2")) or (check_MCU("Semaphore_input_Channel1_directTIM15") and true and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM15")) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCELSE and config.flags.LPTIM2Used_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
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
                    break :blk user_val orelse .RCC_LSEDRIVE_MEDIUMHIGH;
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
                if (true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERFDevisorValue: EnableHSERFDevisorList = blk: {
                if (((config.flags.HSEOscillator or config.flags.HSEByPass))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHCLKRValue: EnableHCLKRList = blk: {
                break :blk .auto;
            };

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIM1Used_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LSCOEnableValue: LSCOEnableList = blk: {
                if (config.flags.LSCOConfig and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
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

            const RTCEnableValue: RTCEnableList = blk: {
                if (config.flags.RTCUsed_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LCDEnableValue: LCDEnableList = blk: {
                if (config.flags.LCDUsed_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDGUsed_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART1EnableValue: USART1EnableList = blk: {
                if (config.flags.USART1Used_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPUART1EnableValue: LPUART1EnableList = blk: {
                if (config.flags.LPUARTUsed_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SMPSEnableValue: SMPSEnableList = blk: {
                if (true) {
                    break :blk .false;
                }
                break :blk .true;
            };

            const SMPSDivEnableValue: SMPSDivEnableList = blk: {
                if (true) {
                    break :blk .false;
                }
                break :blk .true;
            };

            const LPTIM2EnableValue: LPTIM2EnableList = blk: {
                if (config.flags.LPTIM2Used_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RFEnableValue: RFEnableList = blk: {
                if (config.flags.RFUsed_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RNGEnableValue: RNGEnableList = blk: {
                if (config.flags.RNGUsed_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C1EnableValue: I2C1EnableList = blk: {
                if (config.flags.I2C1Used_ForRCC and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC)) and true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if (((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig) and true) {
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
                if (((PLLSourceHSE and SysSourcePLL) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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
            if (!check_MCU("STM32WBx0_Value_Line")) {
                HSIRC.nodetype = .source;
                HSIRC.value = HSI_VALUEValue;
            } else if (check_MCU("STM32WBx0_Value_Line")) {
                HSIRC.nodetype = .source;
                HSIRC.value = HSI_VALUEValue;
            }
            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE LSIRC ======
            if (check_MCU("STM32WB1MMCHx")) {
                LSIRC.nodetype = .source;
                LSIRC.value = LSI1_VALUEValue;
            } else if (!check_MCU("STM32WB1MMCHx")) {
                LSIRC.nodetype = .source;
                LSIRC.value = LSI1_VALUEValue;
            }
            // ======= NODE LSI2RC ======
            LSI2RC.nodetype = .source;
            LSI2RC.value = LSI2_VALUEValue;

            // ======= NODE LSIMult ======
            if (check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"=")) {
                LSIMult.nodetype = .multi;
                LSIMult.parents = switch (LSISource1Value) {
                    .RCC_LSCOSOURCE_LSI1 => &.{&LSIRC},
                    .RCC_LSCOSOURCE_LSI2 => &.{&LSI2RC},
                };
            }
            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE MSIRC ======
            MSIRC.nodetype = .source;
            MSIRC.value = try MSIClockRangeValue.get();

            // ======= NODE HCLKRFMultDiv ======
            if (check_ref(@TypeOf(EnableHSERFDevisorValue), EnableHSERFDevisorValue, .true, .@"=")) {
                HCLKRFMultDiv.nodetype = .div;
                HCLKRFMultDiv.value = @floatFromInt(HCLKRFDivValue);
                HCLKRFMultDiv.parents = &.{&HSEOSC};
            }
            // ======= NODE HCLKRFMult ======
            if (true) {
                HCLKRFMult.nodetype = .multi;
                HCLKRFMult.parents = switch (HCLKRFclockSelectionVirtualValue) {
                    .RCC_HCLKRFCLKSOURCE_HSE => &.{&HCLKRFMultDiv},
                    .RCC_HCLKRFCLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE HCLKRFOutput ======
            HCLKRFOutput.nodetype = .output;
            HCLKRFOutput.parents = &.{&HCLKRFMult};

            // ======= NODE APB3Output ======
            APB3Output.nodetype = .output;
            APB3Output.parents = &.{&HCLKRFMult};

            // ======= NODE LPTIM1Mult ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1Mult.nodetype = .multi;
                LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                    .RCC_LPTIM1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM1output ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1output.nodetype = .output;
                LPTIM1output.parents = &.{&LPTIM1Mult};
            }
            // ======= NODE LSCOMult ======
            if (check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"=")) {
                LSCOMult.nodetype = .multi;
                LSCOMult.parents = switch (LSCOSource1Value) {
                    .RCC_LSCOSOURCE_LSI => &.{&LSIRC},
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
                if (check_MCU("LPUART1_Exist")) {
                    LPUART1Mult.nodetype = .multi;
                    LPUART1Mult.parents = switch (LPUART1CLockSelectionValue) {
                        .RCC_LPUART1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                        .RCC_LPUART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
                    };
                }
            }
            // ======= NODE LPUART1output ======
            if (check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=")) {
                if (check_MCU("LPUART1_Exist")) {
                    LPUART1output.nodetype = .output;
                    LPUART1output.parents = &.{&LPUART1Mult};
                }
            }
            // ======= NODE SMPSMult ======
            if (check_ref(@TypeOf(SMPSEnableValue), SMPSEnableValue, .true, .@"=")) {
                if (!check_MCU("STM32WBx0_Value_Line")) {
                    SMPSMult.nodetype = .multi;
                    SMPSMult.parents = switch (SMPSCLockSelectionVirtualValue) {
                        .RCC_SMPSCLKSOURCE_MSI => &.{&MSIRC},
                        .RCC_SMPSCLKSOURCE_HSE => &.{&HSEOSC},
                        .RCC_SMPSCLKSOURCE_HSI => &.{&HSIRC},
                    };
                }
            }
            // ======= NODE SMPSDivider ======
            if (check_ref(@TypeOf(SMPSDivEnableValue), SMPSDivEnableValue, .true, .@"=")) {
                if (!check_MCU("STM32WBx0_Value_Line")) {
                    SMPSDivider.nodetype = .div;
                    SMPSDivider.value = try SMPSDividerValue.get();
                    SMPSDivider.parents = &.{&SMPSMult};
                }
            }
            // ======= NODE SMPSDiv2 ======
            if (check_ref(@TypeOf(SMPSEnableValue), SMPSEnableValue, .true, .@"=")) {
                if (!check_MCU("STM32WBx0_Value_Line")) {
                    SMPSDiv2.nodetype = .div;
                    SMPSDiv2.value = @floatFromInt(SMPSDiv2Value);
                    SMPSDiv2.parents = &.{&SMPSDivider};
                }
            }
            // ======= NODE SMPSoutput ======
            if (check_ref(@TypeOf(SMPSEnableValue), SMPSEnableValue, .true, .@"=")) {
                if (!check_MCU("STM32WBx0_Value_Line")) {
                    SMPSoutput.nodetype = .output;
                    SMPSoutput.parents = &.{&SMPSDiv2};
                }
            }
            // ======= NODE LPTIM2Mult ======
            if (check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=")) {
                LPTIM2Mult.nodetype = .multi;
                LPTIM2Mult.parents = switch (LPTIM2CLockSelectionValue) {
                    .RCC_LPTIM2CLKSOURCE_PCLK => &.{&APB1Prescaler},
                    .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM2output ======
            if (check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=")) {
                LPTIM2output.nodetype = .output;
                LPTIM2output.parents = &.{&LPTIM2Mult};
            }
            // ======= NODE HSERFWKPDevisor ======
            if (check_ref(@TypeOf(EnableHSERFDevisorValue), EnableHSERFDevisorValue, .true, .@"=")) {
                HSERFWKPDevisor.nodetype = .div;
                HSERFWKPDevisor.value = @floatFromInt(RCC_RFWKP_Clock_Source_FROM_HSEValue);
                HSERFWKPDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE RFWKPClkSource ======
            if (check_ref(@TypeOf(RFEnableValue), RFEnableValue, .true, .@"=")) {
                RFWKPClkSource.nodetype = .multi;
                RFWKPClkSource.parents = switch (RFWKPClockSelectionValue) {
                    .RCC_RFWKPCLKSOURCE_HSE_DIV1024 => &.{&HSERFWKPDevisor},
                    .RCC_RFWKPCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RFWKPCLKSOURCE_LSI => &.{&LSIRC},
                };
            }
            // ======= NODE RFWKPOutput ======
            if (check_ref(@TypeOf(RFEnableValue), RFEnableValue, .true, .@"=")) {
                RFWKPOutput.nodetype = .output;
                RFWKPOutput.parents = &.{&RFWKPClkSource};
            }
            // ======= NODE CK48Mult ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                CK48Mult.nodetype = .multi;
                CK48Mult.parents = switch (CK48CLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_USBCLKSOURCE_MSI => &.{&MSIRC},
                };
            }
            // ======= NODE RNGDiv ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGDiv.nodetype = .div;
                RNGDiv.value = @floatFromInt(RNGDivValue);
                RNGDiv.parents = &.{&CK48Mult};
            }
            // ======= NODE RNGMult ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGMult.nodetype = .multi;
                RNGMult.parents = switch (RNGCLockSelectionValue) {
                    .RCC_RNGCLKSOURCE_CLK48 => &.{&RNGDiv},
                    .RCC_RNGCLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_RNGCLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE RNGoutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGoutput.nodetype = .output;
                RNGoutput.parents = &.{&RNGMult};
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
                I2C1output.parents = &.{&I2C1Mult};
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
                    .RCC_MCO1SOURCE_LSI1 => &.{&LSIRC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLR},
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
            // ======= NODE AHB3Prescaler ======
            AHB3Prescaler.nodetype = .div;
            AHB3Prescaler.value = try AHB3CLKDividerValue.get();
            AHB3Prescaler.parents = &.{&SysCLKOutput};

            // ======= NODE AHB3Output ======
            AHB3Output.nodetype = .output;
            AHB3Output.parents = &.{&AHB3Prescaler};

            // ======= NODE AHB2Prescaler ======
            AHB2Prescaler.nodetype = .div;
            AHB2Prescaler.value = try AHB2CLKDividerValue.get();
            AHB2Prescaler.parents = &.{&SysCLKOutput};

            // ======= NODE FCLK2CortexOutput ======
            FCLK2CortexOutput.nodetype = .output;
            FCLK2CortexOutput.parents = &.{&AHB2Prescaler};

            // ======= NODE AHB2Output ======
            AHB2Output.nodetype = .output;
            AHB2Output.parents = &.{&AHB2Prescaler};

            // ======= NODE Cortex2Prescaler ======
            Cortex2Prescaler.nodetype = .div;
            Cortex2Prescaler.value = try Cortex2_DivValue.get();
            Cortex2Prescaler.parents = &.{&AHB2Prescaler};

            // ======= NODE Cortex2SysOutput ======
            Cortex2SysOutput.nodetype = .output;
            Cortex2SysOutput.parents = &.{&Cortex2Prescaler};

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
            PLLP.nodetype = .div;
            PLLP.value = try PLLPValue.get();
            PLLP.parents = &.{&PLLN};

            // ======= NODE PLLPoutput ======
            PLLPoutput.nodetype = .output;
            PLLPoutput.parents = &.{&PLLP};

            // ======= NODE PLLQ ======
            PLLQ.nodetype = .div;
            PLLQ.value = try PLLQValue.get();
            PLLQ.parents = &.{&PLLN};

            // ======= NODE PLLQoutput ======
            PLLQoutput.nodetype = .output;
            PLLQoutput.parents = &.{&PLLQ};

            // ======= NODE PLLR ======
            PLLR.nodetype = .div;
            PLLR.value = try PLLRValue.get();
            PLLR.parents = &.{&PLLN};

            // ======= NODE LSI ======
            LSI.nodetype = .output;
            LSI.parents = &.{&LSIRC};

            // ======= NODE SMPSDivclk ======
            SMPSDivclk.nodetype = .output;
            SMPSDivclk.parents = &.{&SMPSDivider};

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

            //======= HCLKRFFreq_Value ========
            const HCLKRFFreq_ValueValue = HCLKRFOutput.get_as_ref();
            ignore_value(HCLKRFFreq_ValueValue);

            //======= APB3Freq_Value ========
            const APB3Freq_ValueValue = APB3Output.get_as_ref();
            ignore_value(APB3Freq_ValueValue);

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);

            //======= LSCOPinFreq_Value ========
            const LSCOPinFreq_ValueValue = LSCOOutput.get_as_ref();
            ignore_value(LSCOPinFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 6.4e7,
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

            //======= SMPSFreq_Value ========
            const SMPSFreq_ValueValue = SMPSoutput.get_as_ref();
            ignore_value(SMPSFreq_ValueValue);

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);

            //======= RFWKPFreq_Value ========
            const RFWKPFreq_ValueValue = RFWKPOutput.get_as_ref();
            ignore_value(RFWKPFreq_ValueValue);

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);

            RNGoutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            ADCoutput.limit = .{
                .min = 1.4e6,
                .max = 6.4e7,
            };

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= HCLK3Freq_Value ========
            const HCLK3Freq_ValueValue = AHB3Output.get_as_ref();
            ignore_value(HCLK3Freq_ValueValue);

            AHB3Output.limit = .{
                .min = null,
                .max = 6.4e7,
            };

            //======= FCLK2Freq_Value ========
            const FCLK2Freq_ValueValue = FCLK2CortexOutput.get_as_ref();
            ignore_value(FCLK2Freq_ValueValue);

            FCLK2CortexOutput.limit = .{
                .min = null,
                .max = 3.2e7,
            };

            //======= HCLK2Freq_Value ========
            const HCLK2Freq_ValueValue = AHB2Output.get_as_ref();
            ignore_value(HCLK2Freq_ValueValue);

            AHB2Output.limit = .{
                .min = null,
                .max = 3.2e7,
            };

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            PWRCLKoutput.limit = .{
                .min = null,
                .max = 6.4e7,
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 6.4e7,
            };

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
                .max = 6.4e7,
            };

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 6.4e7,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (((check_MCU("SAI1SourcePLLP") and (config.flags.SAI1Used_ForRCC))) or (ADCSourcePLL and config.flags.USE_ADC1)) {
                PLLPoutput.limit = .{
                    .min = null,
                    .max = 6.4e7,
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if ((((config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48)) and CK48SourcePLLCLK)) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 6.4e7,
                };
            }

            //======= SMPS1Freq_Value ========
            const SMPS1Freq_ValueValue = SMPSDivclk.get_as_ref();
            ignore_value(SMPS1Freq_ValueValue);

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 2.66e6,
                    .max = 1.6e7,
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOOutput.limit = .{
                    .min = 9.6e7,
                    .max = 3.44e8,
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = null,
                    .max = 6.4e7,
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 18000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 18000000, .@"=")))) {
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
                                "((HCLK3Freq_Value < 18000000)|(HCLK3Freq_Value= 18000000 ))",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if (((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 36000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 36000000, .@"=")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_0 => {},
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
                                    "((HCLK3Freq_Value < 36000000)|(HCLK3Freq_Value= 36000000 ))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_0",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if (((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 54000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 54000000, .@"=")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_0 => {},
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "FLatency",
                                    "((HCLK3Freq_Value < 54000000)|(HCLK3Freq_Value= 54000000 ))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_0",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if (((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 64000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 64000000, .@"=")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_0 => {},
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_3;
                }
                if (config.extra_config.FLatency) |val| {
                    if (val != .FLASH_LATENCY_3) {
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
                            "FLASH_LATENCY_3",
                            val,
                        });
                    }
                }
                break :blk .FLASH_LATENCY_3;
            };
            out.HSIRC = try HSIRC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSI2RC = try LSI2RC.get_output();
            out.LSIMult = try LSIMult.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.MSIRC = try MSIRC.get_output();
            out.HCLKRFMultDiv = try HCLKRFMultDiv.get_output();
            out.HCLKRFMult = try HCLKRFMult.get_output();
            out.HCLKRFOutput = try HCLKRFOutput.get_output();
            out.APB3Output = try APB3Output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
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
            out.SMPSMult = try SMPSMult.get_output();
            out.SMPSDivider = try SMPSDivider.get_output();
            out.SMPSDiv2 = try SMPSDiv2.get_output();
            out.SMPSoutput = try SMPSoutput.get_output();
            out.LPTIM2Mult = try LPTIM2Mult.get_output();
            out.LPTIM2output = try LPTIM2output.get_output();
            out.HSERFWKPDevisor = try HSERFWKPDevisor.get_output();
            out.RFWKPClkSource = try RFWKPClkSource.get_output();
            out.RFWKPOutput = try RFWKPOutput.get_output();
            out.CK48Mult = try CK48Mult.get_output();
            out.RNGDiv = try RNGDiv.get_output();
            out.RNGMult = try RNGMult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.AHB3Prescaler = try AHB3Prescaler.get_output();
            out.AHB3Output = try AHB3Output.get_output();
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
            out.LSI = try LSI.get_extra_output();
            out.SMPSDivclk = try SMPSDivclk.get_extra_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI1_VALUEValue);
            ignore_value(LSI2_VALUEValue);
            ref_out.LSISource1 = LSISource1Value;
            ignore_value(LSE_VALUEValue);
            ref_out.MSIClockRange = MSIClockRangeValue;
            ref_out.HCLKRFDiv = HCLKRFDivValue;
            ref_out.HCLKRFclockSelectionVirtual = HCLKRFclockSelectionVirtualValue;
            ignore_value(HCLKRFFreq_ValueValue);
            ignore_value(APB3Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
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
            ref_out.SMPSCLockSelectionVirtual = SMPSCLockSelectionVirtualValue;
            ref_out.SMPSDivider = SMPSDividerValue;
            ref_out.SMPSDiv2 = SMPSDiv2Value;
            ignore_value(SMPSFreq_ValueValue);
            ref_out.LPTIM2CLockSelection = LPTIM2CLockSelectionValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.RCC_RFWKP_Clock_Source_FROM_HSE = RCC_RFWKP_Clock_Source_FROM_HSEValue;
            ref_out.RFWKPClockSelection = RFWKPClockSelectionValue;
            ignore_value(RFWKPFreq_ValueValue);
            ref_out.CK48CLockSelection = CK48CLockSelectionValue;
            ref_out.RNGDiv = RNGDivValue;
            ref_out.RNGCLockSelection = RNGCLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.AHB3CLKDivider = AHB3CLKDividerValue;
            ignore_value(HCLK3Freq_ValueValue);
            ref_out.AHB2CLKDivider = AHB2CLKDividerValue;
            ignore_value(FCLK2Freq_ValueValue);
            ignore_value(HCLK2Freq_ValueValue);
            ref_out.Cortex2_Div = Cortex2_DivValue;
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(PWRFreq_ValueValue);
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
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
            ignore_value(LSI_VALUEValue);
            ignore_value(SMPS1Freq_ValueValue);
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
            ref_out.MSIAutoCalibration = MSIAutoCalibrationValue;
            ref_out.MSIOscState = MSIOscStateValue;
            ref_out.HSIOscState = HSIOscStateValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.EnableHSERFDevisor = EnableHSERFDevisorValue == .true;
            ref_out.flags.EnableHCLKR = EnableHCLKRValue == .auto;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.SMPSEnable = SMPSEnableValue == .true;
            ref_out.flags.SMPSDivEnable = SMPSDivEnableValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.RFEnable = RFEnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.MSIUsed = MSIUsedValue != 0;
            ref_out.flags.MSIUsedForSys = MSIUsedForSysValue != 0;
            ref_out.flags.HSIUsedForSys = HSIUsedForSysValue != 0;
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
