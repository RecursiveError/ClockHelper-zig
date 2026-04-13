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
        pub const RCC_LPTIM1SEL = enum(u2) {
            PCLK1 = 0,
            LSI = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_LPTIM2SEL = enum(u2) {
            PCLK1 = 0,
            LSI = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
        };
        pub const RCC_SW = enum(u2) {
            MSI = 0,
            HSI = 1,
            HSE = 2,
            PLL1_R = 3,
        };
        pub const RCC_LPUART1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            HSE = 3,
        };
        pub const CRS_SYNCSRC = enum(u2) {
            GPIO = 0,
            LSE = 1,
            USB = 2,
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
        pub const RCC_RNGSEL = enum(u2) {
            CLK48 = 0,
            LSI = 1,
            LSE = 2,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const PWR_VOS = enum(u2) {
            Range1 = 1,
            Range2 = 2,
        };
        pub const RCC_USART1SEL = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            HSI = 2,
            HSE = 3,
        };
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
        pub const RCC_CLK48SEL = enum(u2) {
            HSI48 = 0,
            PLLSAI1_Q = 1,
            PLL1_Q = 2,
            MSI = 3,
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
        pub const RCC_SAI1SEL = enum(u2) {
            PLLSAI1_P = 0,
            PLL1_P = 1,
            HSI = 2,
            SAI1_EXTCLK = 3,
        };
        pub const RCC_PLLSRC = enum(u2) {
            MSI = 1,
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_I2C3SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };
        pub const RCC_RFWKPSEL = enum(u2) {
            LSE = 1,
            HSE_DIV_1024 = 3,
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
        pub const RCC_ADCSEL = enum(u2) {
            PLLSAI1_R = 1,
            PLL1_P = 2,
            SYS = 3,
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
                    .RCC_MSIRANGE_10 => .Range32M,
                    .RCC_MSIRANGE_1 => .Range200K,
                    .RCC_MSIRANGE_6 => .Range4M,
                    .RCC_MSIRANGE_9 => .Range24M,
                    .RCC_MSIRANGE_5 => .Range2M,
                    .RCC_MSIRANGE_4 => .Range1M,
                    .RCC_MSIRANGE_3 => .Range800K,
                    .RCC_MSIRANGE_0 => .Range100K,
                    .RCC_MSIRANGE_7 => .Range8M,
                    .RCC_MSIRANGE_8 => .Range16M,
                    .RCC_MSIRANGE_11 => .Range48M,
                    .RCC_MSIRANGE_2 => .Range400K,
                };
            }
            pub fn from_enum(item: RCC_MSIRANGE) anyerror!@This() {
                return switch (item) {
                    .Range32M => .RCC_MSIRANGE_10,
                    .Range200K => .RCC_MSIRANGE_1,
                    .Range4M => .RCC_MSIRANGE_6,
                    .Range24M => .RCC_MSIRANGE_9,
                    .Range2M => .RCC_MSIRANGE_5,
                    .Range1M => .RCC_MSIRANGE_4,
                    .Range800K => .RCC_MSIRANGE_3,
                    .Range100K => .RCC_MSIRANGE_0,
                    .Range8M => .RCC_MSIRANGE_7,
                    .Range16M => .RCC_MSIRANGE_8,
                    .Range48M => .RCC_MSIRANGE_11,
                    .Range400K => .RCC_MSIRANGE_2,
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
                    .RCC_LPTIM1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_PCLK1,
                    .HSI => .RCC_LPTIM1CLKSOURCE_HSI,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
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
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_MSI => .MSI,
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_R,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .MSI => .RCC_SYSCLKSOURCE_MSI,
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .PLL1_R => .RCC_SYSCLKSOURCE_PLLCLK,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_MSI,
            RCC_PLLSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSI => .HSI,
                    .RCC_PLLSOURCE_MSI => .MSI,
                    .RCC_PLLSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_PLLSOURCE_HSI,
                    .MSI => .RCC_PLLSOURCE_MSI,
                    .HSE => .RCC_PLLSOURCE_HSE,
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
                    .RCC_PLLM_DIV6 => .Div6,
                    .RCC_PLLM_DIV2 => .Div2,
                    .RCC_PLLM_DIV1 => .Div1,
                    .RCC_PLLM_DIV8 => .Div8,
                    .RCC_PLLM_DIV4 => .Div4,
                    .RCC_PLLM_DIV3 => .Div3,
                    .RCC_PLLM_DIV7 => .Div7,
                };
            }
            pub fn from_enum(item: RCC_PLLM) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_PLLM_DIV5,
                    .Div6 => .RCC_PLLM_DIV6,
                    .Div2 => .RCC_PLLM_DIV2,
                    .Div1 => .RCC_PLLM_DIV1,
                    .Div8 => .RCC_PLLM_DIV8,
                    .Div4 => .RCC_PLLM_DIV4,
                    .Div3 => .RCC_PLLM_DIV3,
                    .Div7 => .RCC_PLLM_DIV7,
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
                    .RCC_RTCCLKSOURCE_LSI => .LSI,
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => .HSE,
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .HSE => .RCC_RTCCLKSOURCE_HSE_DIV32,
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
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
                    .RCC_USART1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART1CLKSOURCE_PCLK2 => .PCLK2,
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_LSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_USART1SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
                    .PCLK2 => .RCC_USART1CLKSOURCE_PCLK2,
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .HSE => .RCC_USART1CLKSOURCE_LSE,
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
                    .RCC_LPUART1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_LPUART1CLKSOURCE_LSE => .HSE,
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPUART1SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_LPUART1CLKSOURCE_SYSCLK,
                    .HSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .PCLK1 => .RCC_LPUART1CLKSOURCE_PCLK1,
                };
            }
        };

        pub const SMPSDividerList = enum {
            @"1",
            @"2",
            @"3",
            @"4",
            @"6",

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .@"1" => .Div1,
                    .@"6" => .Div6,
                    .@"4" => .Div4,
                    .@"2" => .Div2,
                    .@"3" => .Div3,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .@"1",
                    .Div6 => .@"6",
                    .Div4 => .@"4",
                    .Div2 => .@"2",
                    .Div3 => .@"3",
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
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM2CLKSOURCE_PCLK => .PCLK1,
                    .RCC_LPTIM2CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .HSI => .RCC_LPTIM2CLKSOURCE_HSI,
                    .PCLK1 => .RCC_LPTIM2CLKSOURCE_PCLK,
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                };
            }
        };

        pub const RFWKPClockSelectionList = enum {
            RCC_RFWKPCLKSOURCE_LSE,
            RCC_RFWKPCLKSOURCE_HSE_DIV1024,

            pub fn to_enum(self: @This()) anyerror!RCC_RFWKPSEL {
                return switch (self) {
                    .RCC_RFWKPCLKSOURCE_HSE_DIV1024 => .HSE_DIV_1024,
                    .RCC_RFWKPCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RFWKPSEL) anyerror!@This() {
                return switch (item) {
                    .HSE_DIV_1024 => .RCC_RFWKPCLKSOURCE_HSE_DIV1024,
                    .LSE => .RCC_RFWKPCLKSOURCE_LSE,
                };
            }
        };

        pub const CK48CLockSelectionList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_MSI,
            RCC_USBCLKSOURCE_HSI48,
            RCC_USBCLKSOURCE_PLLSAI1,

            pub fn to_enum(self: @This()) anyerror!RCC_CLK48SEL {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLLSAI1 => .PLLSAI1_Q,
                    .RCC_USBCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_USBCLKSOURCE_MSI => .MSI,
                    .RCC_USBCLKSOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_CLK48SEL) anyerror!@This() {
                return switch (item) {
                    .PLLSAI1_Q => .RCC_USBCLKSOURCE_PLLSAI1,
                    .PLL1_Q => .RCC_USBCLKSOURCE_PLL,
                    .MSI => .RCC_USBCLKSOURCE_MSI,
                    .HSI48 => .RCC_USBCLKSOURCE_HSI48,
                };
            }
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
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                    .RCC_I2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2C1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
                    .SYS => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2C1CLKSOURCE_PCLK1,
                };
            }
        };

        pub const I2C3CLockSelectionList = enum {
            RCC_I2C3CLKSOURCE_PCLK1,
            RCC_I2C3CLKSOURCE_SYSCLK,
            RCC_I2C3CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C3SEL {
                return switch (self) {
                    .RCC_I2C3CLKSOURCE_HSI => .HSI,
                    .RCC_I2C3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C3CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2C3SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C3CLKSOURCE_HSI,
                    .SYS => .RCC_I2C3CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2C3CLKSOURCE_PCLK1,
                };
            }
        };

        pub const SAI1CLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_PLLSAI1,
            RCC_SAI1CLKSOURCE_PLL,
            RCC_SAI1CLKSOURCE_HSI,
            RCC_SAI1CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_SAI1SEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PLL => .PLL1_P,
                    .RCC_SAI1CLKSOURCE_HSI => .HSI,
                    .RCC_SAI1CLKSOURCE_PIN => .SAI1_EXTCLK,
                    .RCC_SAI1CLKSOURCE_PLLSAI1 => .PLLSAI1_P,
                };
            }
            pub fn from_enum(item: RCC_SAI1SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_SAI1CLKSOURCE_PLL,
                    .HSI => .RCC_SAI1CLKSOURCE_HSI,
                    .SAI1_EXTCLK => .RCC_SAI1CLKSOURCE_PIN,
                    .PLLSAI1_P => .RCC_SAI1CLKSOURCE_PLLSAI1,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCCLKSOURCE_PLL,
            RCC_ADCCLKSOURCE_SYSCLK,
            RCC_ADCCLKSOURCE_PLLSAI1,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADCCLKSOURCE_PLL => .PLL1_P,
                    .RCC_ADCCLKSOURCE_PLLSAI1 => .PLLSAI1_R,
                    .RCC_ADCCLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_ADCCLKSOURCE_PLL,
                    .PLLSAI1_R => .RCC_ADCCLKSOURCE_PLLSAI1,
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
            RCC_MCO1SOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_MSI => .MSI,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL_R,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_LSI1 => .LSI1,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .MSI => .RCC_MCO1SOURCE_MSI,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .PLL_R => .RCC_MCO1SOURCE_PLLCLK,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .LSI1 => .RCC_MCO1SOURCE_LSI1,
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
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_16 => .Div16,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_MCODIV_1,
                    .Div4 => .RCC_MCODIV_4,
                    .Div2 => .RCC_MCODIV_2,
                    .Div8 => .RCC_MCODIV_8,
                    .Div16 => .RCC_MCODIV_16,
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
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV512 => .Div512,
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV8 => .Div8,
                    .RCC_SYSCLK_DIV128 => .Div128,
                    .RCC_SYSCLK_DIV256 => .Div256,
                    .RCC_SYSCLK_DIV64 => .Div64,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div512 => .RCC_SYSCLK_DIV512,
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div8 => .RCC_SYSCLK_DIV8,
                    .Div128 => .RCC_SYSCLK_DIV128,
                    .Div256 => .RCC_SYSCLK_DIV256,
                    .Div64 => .RCC_SYSCLK_DIV64,
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
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV512 => .Div512,
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV8 => .Div8,
                    .RCC_SYSCLK_DIV128 => .Div128,
                    .RCC_SYSCLK_DIV256 => .Div256,
                    .RCC_SYSCLK_DIV64 => .Div64,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div512 => .RCC_SYSCLK_DIV512,
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div8 => .RCC_SYSCLK_DIV8,
                    .Div128 => .RCC_SYSCLK_DIV128,
                    .Div256 => .RCC_SYSCLK_DIV256,
                    .Div64 => .RCC_SYSCLK_DIV64,
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
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV512 => .Div512,
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV8 => .Div8,
                    .RCC_SYSCLK_DIV128 => .Div128,
                    .RCC_SYSCLK_DIV256 => .Div256,
                    .RCC_SYSCLK_DIV64 => .Div64,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div512 => .RCC_SYSCLK_DIV512,
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div8 => .RCC_SYSCLK_DIV8,
                    .Div128 => .RCC_SYSCLK_DIV128,
                    .Div256 => .RCC_SYSCLK_DIV256,
                    .Div64 => .RCC_SYSCLK_DIV64,
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
                    .RCC_HCLK_DIV4 => .Div4,
                    .RCC_HCLK_DIV16 => .Div16,
                    .RCC_HCLK_DIV2 => .Div2,
                    .RCC_HCLK_DIV1 => .Div1,
                    .RCC_HCLK_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_HCLK_DIV4,
                    .Div16 => .RCC_HCLK_DIV16,
                    .Div2 => .RCC_HCLK_DIV2,
                    .Div1 => .RCC_HCLK_DIV1,
                    .Div8 => .RCC_HCLK_DIV8,
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
                    .RCC_HCLK_DIV4 => .Div4,
                    .RCC_HCLK_DIV16 => .Div16,
                    .RCC_HCLK_DIV2 => .Div2,
                    .RCC_HCLK_DIV1 => .Div1,
                    .RCC_HCLK_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_HCLK_DIV4,
                    .Div16 => .RCC_HCLK_DIV16,
                    .Div2 => .RCC_HCLK_DIV2,
                    .Div1 => .RCC_HCLK_DIV1,
                    .Div8 => .RCC_HCLK_DIV8,
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
                    .RCC_PLLP_DIV7 => .Div7,
                    .RCC_PLLP_DIV24 => .Div24,
                    .RCC_PLLP_DIV10 => .Div10,
                    .RCC_PLLP_DIV13 => .Div13,
                    .RCC_PLLP_DIV9 => .Div9,
                    .RCC_PLLP_DIV12 => .Div12,
                    .RCC_PLLP_DIV22 => .Div22,
                    .RCC_PLLP_DIV21 => .Div21,
                    .RCC_PLLP_DIV26 => .Div26,
                    .RCC_PLLP_DIV5 => .Div5,
                    .RCC_PLLP_DIV11 => .Div11,
                    .RCC_PLLP_DIV3 => .Div3,
                    .RCC_PLLP_DIV16 => .Div16,
                    .RCC_PLLP_DIV18 => .Div18,
                    .RCC_PLLP_DIV2 => .Div2,
                    .RCC_PLLP_DIV20 => .Div20,
                    .RCC_PLLP_DIV14 => .Div14,
                    .RCC_PLLP_DIV17 => .Div17,
                    .RCC_PLLP_DIV19 => .Div19,
                    .RCC_PLLP_DIV4 => .Div4,
                    .RCC_PLLP_DIV27 => .Div27,
                    .RCC_PLLP_DIV15 => .Div15,
                    .RCC_PLLP_DIV8 => .Div8,
                    .RCC_PLLP_DIV29 => .Div29,
                    .RCC_PLLP_DIV28 => .Div28,
                    .RCC_PLLP_DIV23 => .Div23,
                    .RCC_PLLP_DIV25 => .Div25,
                    .RCC_PLLP_DIV31 => .Div31,
                    .RCC_PLLP_DIV30 => .Div30,
                    .RCC_PLLP_DIV6 => .Div6,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div7 => .RCC_PLLP_DIV7,
                    .Div24 => .RCC_PLLP_DIV24,
                    .Div10 => .RCC_PLLP_DIV10,
                    .Div13 => .RCC_PLLP_DIV13,
                    .Div9 => .RCC_PLLP_DIV9,
                    .Div12 => .RCC_PLLP_DIV12,
                    .Div22 => .RCC_PLLP_DIV22,
                    .Div21 => .RCC_PLLP_DIV21,
                    .Div26 => .RCC_PLLP_DIV26,
                    .Div5 => .RCC_PLLP_DIV5,
                    .Div11 => .RCC_PLLP_DIV11,
                    .Div3 => .RCC_PLLP_DIV3,
                    .Div16 => .RCC_PLLP_DIV16,
                    .Div18 => .RCC_PLLP_DIV18,
                    .Div2 => .RCC_PLLP_DIV2,
                    .Div20 => .RCC_PLLP_DIV20,
                    .Div14 => .RCC_PLLP_DIV14,
                    .Div17 => .RCC_PLLP_DIV17,
                    .Div19 => .RCC_PLLP_DIV19,
                    .Div4 => .RCC_PLLP_DIV4,
                    .Div27 => .RCC_PLLP_DIV27,
                    .Div15 => .RCC_PLLP_DIV15,
                    .Div8 => .RCC_PLLP_DIV8,
                    .Div29 => .RCC_PLLP_DIV29,
                    .Div28 => .RCC_PLLP_DIV28,
                    .Div23 => .RCC_PLLP_DIV23,
                    .Div25 => .RCC_PLLP_DIV25,
                    .Div31 => .RCC_PLLP_DIV31,
                    .Div30 => .RCC_PLLP_DIV30,
                    .Div6 => .RCC_PLLP_DIV6,
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
                    .RCC_PLLQ_DIV7 => .Div7,
                    .RCC_PLLQ_DIV8 => .Div8,
                    .RCC_PLLQ_DIV3 => .Div3,
                    .RCC_PLLQ_DIV6 => .Div6,
                    .RCC_PLLQ_DIV5 => .Div5,
                    .RCC_PLLQ_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLQ_DIV2,
                    .Div7 => .RCC_PLLQ_DIV7,
                    .Div8 => .RCC_PLLQ_DIV8,
                    .Div3 => .RCC_PLLQ_DIV3,
                    .Div6 => .RCC_PLLQ_DIV6,
                    .Div5 => .RCC_PLLQ_DIV5,
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
                    .RCC_PLLR_DIV5 => .Div5,
                    .RCC_PLLR_DIV2 => .Div2,
                    .RCC_PLLR_DIV7 => .Div7,
                    .RCC_PLLR_DIV4 => .Div4,
                    .RCC_PLLR_DIV8 => .Div8,
                    .RCC_PLLR_DIV3 => .Div3,
                    .RCC_PLLR_DIV6 => .Div6,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_PLLR_DIV5,
                    .Div2 => .RCC_PLLR_DIV2,
                    .Div7 => .RCC_PLLR_DIV7,
                    .Div4 => .RCC_PLLR_DIV4,
                    .Div8 => .RCC_PLLR_DIV8,
                    .Div3 => .RCC_PLLR_DIV3,
                    .Div6 => .RCC_PLLR_DIV6,
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

        pub const PLLSAI1PList = enum {
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
                    .RCC_PLLP_DIV7 => .Div7,
                    .RCC_PLLP_DIV24 => .Div24,
                    .RCC_PLLP_DIV10 => .Div10,
                    .RCC_PLLP_DIV13 => .Div13,
                    .RCC_PLLP_DIV9 => .Div9,
                    .RCC_PLLP_DIV12 => .Div12,
                    .RCC_PLLP_DIV22 => .Div22,
                    .RCC_PLLP_DIV21 => .Div21,
                    .RCC_PLLP_DIV26 => .Div26,
                    .RCC_PLLP_DIV5 => .Div5,
                    .RCC_PLLP_DIV11 => .Div11,
                    .RCC_PLLP_DIV3 => .Div3,
                    .RCC_PLLP_DIV16 => .Div16,
                    .RCC_PLLP_DIV18 => .Div18,
                    .RCC_PLLP_DIV2 => .Div2,
                    .RCC_PLLP_DIV20 => .Div20,
                    .RCC_PLLP_DIV14 => .Div14,
                    .RCC_PLLP_DIV17 => .Div17,
                    .RCC_PLLP_DIV19 => .Div19,
                    .RCC_PLLP_DIV4 => .Div4,
                    .RCC_PLLP_DIV27 => .Div27,
                    .RCC_PLLP_DIV15 => .Div15,
                    .RCC_PLLP_DIV8 => .Div8,
                    .RCC_PLLP_DIV29 => .Div29,
                    .RCC_PLLP_DIV28 => .Div28,
                    .RCC_PLLP_DIV23 => .Div23,
                    .RCC_PLLP_DIV25 => .Div25,
                    .RCC_PLLP_DIV31 => .Div31,
                    .RCC_PLLP_DIV30 => .Div30,
                    .RCC_PLLP_DIV6 => .Div6,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div7 => .RCC_PLLP_DIV7,
                    .Div24 => .RCC_PLLP_DIV24,
                    .Div10 => .RCC_PLLP_DIV10,
                    .Div13 => .RCC_PLLP_DIV13,
                    .Div9 => .RCC_PLLP_DIV9,
                    .Div12 => .RCC_PLLP_DIV12,
                    .Div22 => .RCC_PLLP_DIV22,
                    .Div21 => .RCC_PLLP_DIV21,
                    .Div26 => .RCC_PLLP_DIV26,
                    .Div5 => .RCC_PLLP_DIV5,
                    .Div11 => .RCC_PLLP_DIV11,
                    .Div3 => .RCC_PLLP_DIV3,
                    .Div16 => .RCC_PLLP_DIV16,
                    .Div18 => .RCC_PLLP_DIV18,
                    .Div2 => .RCC_PLLP_DIV2,
                    .Div20 => .RCC_PLLP_DIV20,
                    .Div14 => .RCC_PLLP_DIV14,
                    .Div17 => .RCC_PLLP_DIV17,
                    .Div19 => .RCC_PLLP_DIV19,
                    .Div4 => .RCC_PLLP_DIV4,
                    .Div27 => .RCC_PLLP_DIV27,
                    .Div15 => .RCC_PLLP_DIV15,
                    .Div8 => .RCC_PLLP_DIV8,
                    .Div29 => .RCC_PLLP_DIV29,
                    .Div28 => .RCC_PLLP_DIV28,
                    .Div23 => .RCC_PLLP_DIV23,
                    .Div25 => .RCC_PLLP_DIV25,
                    .Div31 => .RCC_PLLP_DIV31,
                    .Div30 => .RCC_PLLP_DIV30,
                    .Div6 => .RCC_PLLP_DIV6,
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

        pub const PLLSAI1QList = enum {
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
                    .RCC_PLLQ_DIV7 => .Div7,
                    .RCC_PLLQ_DIV8 => .Div8,
                    .RCC_PLLQ_DIV3 => .Div3,
                    .RCC_PLLQ_DIV6 => .Div6,
                    .RCC_PLLQ_DIV5 => .Div5,
                    .RCC_PLLQ_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLQ_DIV2,
                    .Div7 => .RCC_PLLQ_DIV7,
                    .Div8 => .RCC_PLLQ_DIV8,
                    .Div3 => .RCC_PLLQ_DIV3,
                    .Div6 => .RCC_PLLQ_DIV6,
                    .Div5 => .RCC_PLLQ_DIV5,
                    .Div4 => .RCC_PLLQ_DIV4,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLP", @tagName(item), "PLLSAI1Q" },
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

        pub const PLLSAI1RList = enum {
            RCC_PLLR_DIV2,
            RCC_PLLR_DIV3,
            RCC_PLLR_DIV4,
            RCC_PLLR_DIV5,
            RCC_PLLR_DIV6,
            RCC_PLLR_DIV7,
            RCC_PLLR_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLR_DIV5 => .Div5,
                    .RCC_PLLR_DIV2 => .Div2,
                    .RCC_PLLR_DIV7 => .Div7,
                    .RCC_PLLR_DIV4 => .Div4,
                    .RCC_PLLR_DIV8 => .Div8,
                    .RCC_PLLR_DIV3 => .Div3,
                    .RCC_PLLR_DIV6 => .Div6,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_PLLR_DIV5,
                    .Div2 => .RCC_PLLR_DIV2,
                    .Div7 => .RCC_PLLR_DIV7,
                    .Div4 => .RCC_PLLR_DIV4,
                    .Div8 => .RCC_PLLR_DIV8,
                    .Div3 => .RCC_PLLR_DIV3,
                    .Div6 => .RCC_PLLR_DIV6,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLP", @tagName(item), "PLLSAI1R" },
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

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE1,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .Range2,
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .Range1,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .Range2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .Range1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                };
            }
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

            pub fn to_enum(self: @This()) anyerror!CRS_SYNCSRC {
                return switch (self) {
                    .RCC_CRS_SYNC_SOURCE_USB => .USB,
                    .RCC_CRS_SYNC_SOURCE_GPIO => .GPIO,
                    .RCC_CRS_SYNC_SOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: CRS_SYNCSRC) anyerror!@This() {
                return switch (item) {
                    .USB => .RCC_CRS_SYNC_SOURCE_USB,
                    .GPIO => .RCC_CRS_SYNC_SOURCE_GPIO,
                    .LSE => .RCC_CRS_SYNC_SOURCE_LSE,
                };
            }
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
                    .RCC_LSEDRIVE_MEDIUMLOW => .MediumLow,
                    .RCC_LSEDRIVE_MEDIUMHIGH => .MediumHigh,
                    .RCC_LSEDRIVE_LOW => .Low,
                    .RCC_LSEDRIVE_HIGH => .High,
                };
            }
            pub fn from_enum(item: RCC_LSEDRV) anyerror!@This() {
                return switch (item) {
                    .MediumLow => .RCC_LSEDRIVE_MEDIUMLOW,
                    .MediumHigh => .RCC_LSEDRIVE_MEDIUMHIGH,
                    .Low => .RCC_LSEDRIVE_LOW,
                    .High => .RCC_LSEDRIVE_HIGH,
                };
            }
        };

        pub const CodegenConfigPeriphList = enum {
            false,
            true,
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

        pub const EnableExtClockForSAI1List = enum {
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

        pub const USBEnableList = enum {
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

        pub const I2C3EnableList = enum {
            true,
            false,
        };

        pub const SAI1EnableList = enum {
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

        pub const LSEStateList = enum {
            RCC_LSE_BYPASS,
            RCC_LSE_ON,
            RCC_LSE_OFF,
        };

        pub const EnableCSSLSEList = enum {
            true,
            false,
        };

        pub const EnbaleCSSList = enum {
            true,
            false,
        };

        pub const SMPSCLockSelectionVirtualList = enum {
            RCC_SMPSCLKSOURCE_MSI,
            RCC_SMPSCLKSOURCE_HSE,
            RCC_SMPSCLKSOURCE_HSI,
        };

        //=======ClockTree Flags========

        pub const Flags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            RFUsed_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            USE_ADC3: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            SDMMCEnable: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            EnableCSS: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            TIM15: bool = true,
            Semaphore_input_Channel1_directTIM15: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            SEM2RCC_MSI_REQUIRED_TIM16: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            STM32WB30CEUx: bool = false,
            STM32WB35CCUx: bool = false,
            STM32WB35CEUx: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_SMPSCLKSOURCE_MSI: bool = false,
            S_BLE_HOST: bool = false,
            S_THREAD: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            RCC_HCLK_DIV1: bool = false,
            TIM16: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            RCC_MCO1SOURCE_MSI: bool = false,
            RCC_LSE_OFF: bool = false,
            RCC_SYSCLKSOURCE_MSI: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            RFUsed_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            USE_ADC3: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            SDMMCEnable: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            EnableCSS: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            TIM15: bool = true,
            Semaphore_input_Channel1_directTIM15: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            SEM2RCC_MSI_REQUIRED_TIM16: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            STM32WB30CEUx: bool = false,
            STM32WB35CCUx: bool = false,
            STM32WB35CEUx: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_SMPSCLKSOURCE_MSI: bool = false,
            S_BLE_HOST: bool = false,
            S_THREAD: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            RCC_HCLK_DIV1: bool = false,
            TIM16: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            RCC_MCO1SOURCE_MSI: bool = false,
            RCC_LSE_OFF: bool = false,
            RCC_SYSCLKSOURCE_MSI: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            CodegenConfigPeriph: bool = true, //Reference flag
            LSIEnable: bool = false, //Reference flag
            EnableHSERFDevisor: bool = false, //Reference flag
            EnableHCLKR: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            EnableExtClockForSAI1: bool = false, //Reference flag
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
            USBEnable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            PLLSAI1Used: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            MSIUsed: bool = false, //Reference flag
            MSIUsedForSys: bool = false, //Reference flag
            HSIUsedForSys: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag
            HSI48Used: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            MSIOscState: ?MSIOscStateList = null,
            HSIOscState: ?HSIOscStateList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            CodegenConfigPeriph: ?CodegenConfigPeriphList = null,
            LSEState: ?LSEStateList = null,
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
            SMPSDivider: ?SMPSDividerList = null,
            LPTIM2CLockSelection: ?LPTIM2CLockSelectionList = null,
            RFWKPClockSelection: ?RFWKPClockSelectionList = null,
            CK48CLockSelection: ?CK48CLockSelectionList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
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
            PLLSAI1N: ?u32 = null,
            PLLSAI1P: ?PLLSAI1PList = null,
            PLLSAI1Q: ?PLLSAI1QList = null,
            PLLSAI1R: ?PLLSAI1RList = null,
            SMPSCLockSelectionVirtual: ?SMPSCLockSelectionVirtualList = null,
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
            SMPSDivider: SMPSDividerList,
            SMPSDiv2: u32,
            LPTIM2CLockSelection: LPTIM2CLockSelectionList,
            RCC_RFWKP_Clock_Source_FROM_HSE: u32,
            RFWKPClockSelection: RFWKPClockSelectionList,
            CK48CLockSelection: CK48CLockSelectionList,
            RNGDiv: u32,
            RNGCLockSelection: RNGCLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C3CLockSelection: I2C3CLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
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
            PLLSAI1N: u32,
            PLLSAI1P: PLLSAI1PList,
            PLLSAI1Q: PLLSAI1QList,
            PLLSAI1R: PLLSAI1RList,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList,
            MSIAutoCalibration: MSIAutoCalibrationList,
            MSIOscState: MSIOscStateList,
            HSIOscState: HSIOscStateList,
            Prescaler: ?PrescalerList,
            Source: ?SourceList,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            Fsync: ?f32,
            ErrorLimitValue: ?u32,
            HSI48CalibrationValue: ?u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
            LSEState: LSEStateList,
            SMPSCLockSelectionVirtual: SMPSCLockSelectionVirtualList,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            MSIOscState: ?MSIOscStateList = null,
            HSIOscState: ?HSIOscStateList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            CodegenConfigPeriph: ?CodegenConfigPeriphList = null,
            LSEState: ?LSEStateList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .MSICalibrationValue = self.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .MSIAutoCalibration = self.MSIAutoCalibration,
                    .MSIOscState = self.MSIOscState,
                    .HSIOscState = self.HSIOscState,
                    .Prescaler = self.Prescaler,
                    .Polarity = self.Polarity,
                    .ReloadValueType = self.ReloadValueType,
                    .ReloadValue = self.ReloadValue,
                    .Fsync = self.Fsync,
                    .ErrorLimitValue = self.ErrorLimitValue,
                    .HSI48CalibrationValue = self.HSI48CalibrationValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .CodegenConfigPeriph = self.CodegenConfigPeriph,
                    .LSEState = self.LSEState,
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
            SMPSDivider: ?RCC_HPRE = null,
            LPTIM2CLockSelection: ?RCC_LPTIM2SEL = null,
            RFWKPClockSelection: ?RCC_RFWKPSEL = null,
            CK48CLockSelection: ?RCC_CLK48SEL = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            I2C1CLockSelection: ?RCC_I2C1SEL = null,
            I2C3CLockSelection: ?RCC_I2C3SEL = null,
            SAI1CLockSelection: ?RCC_SAI1SEL = null,
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
            PLLSAI1N: ?u32 = null,
            PLLSAI1P: ?RCC_PLLP = null,
            PLLSAI1Q: ?RCC_PLLP = null,
            PLLSAI1R: ?RCC_PLLP = null,
            SMPSCLockSelectionVirtual: ?SMPSCLockSelectionVirtualList = null,
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
                    .SMPSDivider = if (self.SMPSDivider) |val| try SMPSDividerList.from_enum(val) else null,
                    .LPTIM2CLockSelection = if (self.LPTIM2CLockSelection) |val| try LPTIM2CLockSelectionList.from_enum(val) else null,
                    .RFWKPClockSelection = if (self.RFWKPClockSelection) |val| try RFWKPClockSelectionList.from_enum(val) else null,
                    .CK48CLockSelection = if (self.CK48CLockSelection) |val| try CK48CLockSelectionList.from_enum(val) else null,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C3CLockSelection = if (self.I2C3CLockSelection) |val| try I2C3CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
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
                    .PLLSAI1N = self.PLLSAI1N,
                    .PLLSAI1P = if (self.PLLSAI1P) |val| try PLLSAI1PList.from_enum(val) else null,
                    .PLLSAI1Q = if (self.PLLSAI1Q) |val| try PLLSAI1QList.from_enum(val) else null,
                    .PLLSAI1R = if (self.PLLSAI1R) |val| try PLLSAI1RList.from_enum(val) else null,
                    .SMPSCLockSelectionVirtual = self.SMPSCLockSelectionVirtual,
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
            SMPSDivider: RCC_HPRE,
            SMPSDiv2: u32,
            LPTIM2CLockSelection: RCC_LPTIM2SEL,
            RCC_RFWKP_Clock_Source_FROM_HSE: u32,
            RFWKPClockSelection: RCC_RFWKPSEL,
            CK48CLockSelection: RCC_CLK48SEL,
            RNGDiv: u32,
            RNGCLockSelection: RCC_RNGSEL,
            I2C1CLockSelection: RCC_I2C1SEL,
            I2C3CLockSelection: RCC_I2C3SEL,
            SAI1CLockSelection: RCC_SAI1SEL,
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
            PLLSAI1N: u32,
            PLLSAI1P: RCC_PLLP,
            PLLSAI1Q: RCC_PLLP,
            PLLSAI1R: RCC_PLLP,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS,
            MSIAutoCalibration: MSIAutoCalibrationList,
            MSIOscState: MSIOscStateList,
            HSIOscState: HSIOscStateList,
            Prescaler: ?PrescalerList,
            Source: ?CRS_SYNCSRC,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            Fsync: ?f32,
            ErrorLimitValue: ?u32,
            HSI48CalibrationValue: ?u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,
            LSEState: LSEStateList,
            SMPSCLockSelectionVirtual: SMPSCLockSelectionVirtualList,

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
                    .SMPSDivider = try cubemx_config.SMPSDivider.to_enum(),
                    .SMPSDiv2 = cubemx_config.SMPSDiv2,
                    .LPTIM2CLockSelection = try cubemx_config.LPTIM2CLockSelection.to_enum(),
                    .RCC_RFWKP_Clock_Source_FROM_HSE = cubemx_config.RCC_RFWKP_Clock_Source_FROM_HSE,
                    .RFWKPClockSelection = try cubemx_config.RFWKPClockSelection.to_enum(),
                    .CK48CLockSelection = try cubemx_config.CK48CLockSelection.to_enum(),
                    .RNGDiv = cubemx_config.RNGDiv,
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C3CLockSelection = try cubemx_config.I2C3CLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
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
                    .PLLSAI1N = cubemx_config.PLLSAI1N,
                    .PLLSAI1P = try cubemx_config.PLLSAI1P.to_enum(),
                    .PLLSAI1Q = try cubemx_config.PLLSAI1Q.to_enum(),
                    .PLLSAI1R = try cubemx_config.PLLSAI1R.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .MSICalibrationValue = cubemx_config.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (cubemx_config.PWR_Regulator_Voltage_Scale) |val| try val.to_enum() else null,
                    .MSIAutoCalibration = cubemx_config.MSIAutoCalibration,
                    .MSIOscState = cubemx_config.MSIOscState,
                    .HSIOscState = cubemx_config.HSIOscState,
                    .Prescaler = cubemx_config.Prescaler,
                    .Source = if (cubemx_config.Source) |val| try val.to_enum() else null,
                    .Polarity = cubemx_config.Polarity,
                    .ReloadValueType = cubemx_config.ReloadValueType,
                    .ReloadValue = cubemx_config.ReloadValue,
                    .Fsync = cubemx_config.Fsync,
                    .ErrorLimitValue = cubemx_config.ErrorLimitValue,
                    .HSI48CalibrationValue = cubemx_config.HSI48CalibrationValue,
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
                    .LSE_Drive_Capability = if (cubemx_config.LSE_Drive_Capability) |val| try val.to_enum() else null,
                    .LSEState = cubemx_config.LSEState,
                    .SMPSCLockSelectionVirtual = cubemx_config.SMPSCLockSelectionVirtual,
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
            HSI48RC: u32 = 0,
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
            SAI1_EXT: u32 = 0,
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
            CK48output: u32 = 0,
            RNGDiv: u32 = 0,
            RNGMult: u32 = 0,
            RNGoutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3output: u32 = 0,
            SAI1Mult: u32 = 0,
            SAI1output: u32 = 0,
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
            PLLSAI1N: u32 = 0,
            PLLSAI1P: u32 = 0,
            PLLSAI1Poutput: u32 = 0,
            PLLSAI1Q: u32 = 0,
            PLLSAI1Qoutput: u32 = 0,
            PLLSAI1R: u32 = 0,
            PLLSAI1Routput: u32 = 0,
            LSI: u32 = 0,
            SMPSDivclk: u32 = 0,
            VCOInput: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            VCOSAI1Output: u32 = 0,
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

            if (@inComptime()) @setEvalBranchQuota(1000000);
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
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var RFWKPSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RFWKPSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLLSAI1: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_CLK48: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLSAI1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLP: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLLSAI1R: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var SMPSSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SMPSSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SMPSSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;

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

            var HSI48RC = ClockNode{
                .name = "HSI48RC",
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

            var SAI1_EXT = ClockNode{
                .name = "SAI1_EXT",
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

            var CK48output = ClockNode{
                .name = "CK48output",
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

            var SAI1Mult = ClockNode{
                .name = "SAI1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI1output = ClockNode{
                .name = "SAI1output",
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

            var PLLSAI1N = ClockNode{
                .name = "PLLSAI1N",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI1P = ClockNode{
                .name = "PLLSAI1P",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI1Poutput = ClockNode{
                .name = "PLLSAI1Poutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI1Q = ClockNode{
                .name = "PLLSAI1Q",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI1Qoutput = ClockNode{
                .name = "PLLSAI1Qoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI1R = ClockNode{
                .name = "PLLSAI1R",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI1Routput = ClockNode{
                .name = "PLLSAI1Routput",
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

            var VCOSAI1Output = ClockNode{
                .name = "VCOSAI1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
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
                if (check_MCU("STM32WB5MMGHx")) {
                    if (config.LSE_VALUE) |val| {
                        if (val != 3.2774e4) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSE_VALUE",
                                "STM32WB5MMGHx",
                                "LSE In STM32WB5MMGHx",
                                3.2774e4,
                                val,
                            });
                        }
                    }
                    LSEOSC.limit = .{
                        .min = 3.2774e4,
                        .max = 3.2774e4,
                        .main_expr = "STM32WB5MMGHx",
                        .main_dialog = "LSE In STM32WB5MMGHx",
                    };
                    break :blk 3.2774e4;
                } else if (config.flags.LSEOscillator) {
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
                        .main_expr = "LSEOscillator",
                        .main_dialog = "LSE In crystal Mode",
                    };
                    break :blk 3.2768e4;
                }
                const user_val = config.LSE_VALUE;
                LSEOSC.limit = .{
                    .min = 1e3,
                    .max = 1e6,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
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

            const EXTERNALSAI1_CLOCK_VALUEValue: f32 = blk: {
                break :blk 2.097e6;
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

            const CK48CLockSelectionValue: CK48CLockSelectionList = blk: {
                if (check_MCU("STM32WBx0_Value_Line")) {
                    const user_val = config.CK48CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USBCLKSOURCE_PLL => CK48SourcePLLCLK = true,
                            .RCC_USBCLKSOURCE_MSI => CK48SourceMSI = true,
                            .RCC_USBCLKSOURCE_HSI48 => CK48SourceHSI48 = true,
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
                                    "CK48CLockSelection",
                                    "STM32WBx0_Value_Line",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_Q" else "RCC_USBCLKSOURCE_PLL",
                                    if (patch_logs) "MSI" else "RCC_USBCLKSOURCE_MSI",
                                    if (patch_logs) "HSI48" else "RCC_USBCLKSOURCE_HSI48",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        CK48SourceHSI48 = true;
                        break :blk .RCC_USBCLKSOURCE_HSI48;
                    };
                } else if (!check_MCU("STM32WBx0_Value_Line")) {
                    const user_val = config.CK48CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USBCLKSOURCE_PLLSAI1 => CK48SourcePLLSAI1 = true,
                            .RCC_USBCLKSOURCE_PLL => CK48SourcePLLCLK = true,
                            .RCC_USBCLKSOURCE_MSI => CK48SourceMSI = true,
                            .RCC_USBCLKSOURCE_HSI48 => CK48SourceHSI48 = true,
                        }
                    }
                    break :blk user_val orelse {
                        CK48SourcePLLSAI1 = true;
                        break :blk .RCC_USBCLKSOURCE_PLLSAI1;
                    };
                }
                const user_val = config.CK48CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL => CK48SourcePLLCLK = true,
                        .RCC_USBCLKSOURCE_MSI => CK48SourceMSI = true,
                        .RCC_USBCLKSOURCE_HSI48 => CK48SourceHSI48 = true,
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
                                "CK48CLockSelection",
                                "STM32WBx0_Value_Line",
                                "",
                                if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                if (patch_logs) "PLL1_Q" else "RCC_USBCLKSOURCE_PLL",
                                if (patch_logs) "MSI" else "RCC_USBCLKSOURCE_MSI",
                                if (patch_logs) "HSI48" else "RCC_USBCLKSOURCE_HSI48",
                            });
                        },
                    }
                }
                break :blk user_val orelse {
                    CK48SourceHSI48 = true;
                    break :blk .RCC_USBCLKSOURCE_HSI48;
                };
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((config.flags.USBUsed_ForRCC and (CK48SourcePLLCLK or CK48SourcePLLSAI1))) {
                    const user_val = config.PLLSourceVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_PLLSOURCE_HSE => PLLSourceHSE = true,
                            .RCC_PLLSOURCE_MSI => PLLSourceMSI = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "PLLSourceVirtual",
                                    "(USBUsed_ForRCC & (CK48SourcePLLCLK| CK48SourcePLLSAI1)) ",
                                    "PLL Mux should have HSE or MSI as input",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSE" else "RCC_PLLSOURCE_HSE",
                                    if (patch_logs) "MSI" else "RCC_PLLSOURCE_MSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        PLLSourceMSI = true;
                        break :blk .RCC_PLLSOURCE_MSI;
                    };
                }
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
                    }
                }
                break :blk user_val orelse {
                    RFWKPSourceHSE = true;
                    break :blk .RCC_RFWKPCLKSOURCE_HSE_DIV1024;
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

            const SAI1CLockSelectionValue: SAI1CLockSelectionList = blk: {
                const user_val = config.SAI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_PLLSAI1 => SAI1SourcePLLSAI1P = true,
                        .RCC_SAI1CLKSOURCE_PLL => SAI1SourcePLLP = true,
                        .RCC_SAI1CLKSOURCE_HSI => SAI1SourceHSI = true,
                        .RCC_SAI1CLKSOURCE_PIN => SAI1SourceEXT = true,
                    }
                }
                break :blk user_val orelse {
                    SAI1SourcePLLSAI1P = true;
                    break :blk .RCC_SAI1CLKSOURCE_PLLSAI1;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                if (check_MCU("STM32WBx0_Value_Line")) {
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
                } else if (!check_MCU("STM32WBx0_Value_Line")) {
                    const user_val = config.ADCCLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_ADCCLKSOURCE_PLLSAI1 => ADCSourcePLLSAI1R = true,
                            .RCC_ADCCLKSOURCE_PLL => ADCSourcePLL = true,
                            .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                        }
                    }
                    break :blk user_val orelse {
                        ADCSourcePLLSAI1R = true;
                        break :blk .RCC_ADCCLKSOURCE_PLLSAI1;
                    };
                }
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
                        .RCC_MCO1SOURCE_HSI48 => MCOSourceHSI48 = true,
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
                if (check_MCU("STM32WBx0_Value_Line")) {
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
                                "STM32WBx0_Value_Line",
                                "",
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
                                "STM32WBx0_Value_Line",
                                "",
                                127,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 8;
                }
                const user_val = config.PLLN;
                if (user_val) |val| {
                    if (val < 8) {
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
                            8,
                            val,
                        });
                    }
                    if (val > 86) {
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
                            86,
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

            const PLLSAI1NValue: u32 = blk: {
                const user_val = config.PLLSAI1N;
                if (user_val) |val| {
                    if (val < 4) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAI1N",
                            "Else",
                            "No additional information",
                            4,
                            val,
                        });
                    }
                    if (val > 86) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAI1N",
                            "Else",
                            "No additional information",
                            86,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 8;
            };

            const PLLSAI1PValue: PLLSAI1PList = blk: {
                const user_val = config.PLLSAI1P;

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

            const PLLSAI1QValue: PLLSAI1QList = blk: {
                const user_val = config.PLLSAI1Q;

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

            const PLLSAI1RValue: PLLSAI1RList = blk: {
                const user_val = config.PLLSAI1R;

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

            const CodegenConfigPeriphValue: CodegenConfigPeriphList = blk: {
                const user_val = config.extra_config.CodegenConfigPeriph;

                if (user_val) |val| {
                    switch (val) {
                        .false => {},
                        .true => {},
                    }
                }
                break :blk user_val orelse .true;
            };

            const LSEStateValue: LSEStateList = blk: {
                if (config.flags.LSEByPass) {
                    if (config.extra_config.LSEState) |val| {
                        if (val != .RCC_LSE_BYPASS) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSEState",
                                "LSEByPass",
                                "LSE BYPass",
                                "RCC_LSE_BYPASS",
                                val,
                            });
                        }
                    }
                    break :blk .RCC_LSE_BYPASS;
                } else if (config.flags.LSEOscillator) {
                    if (config.extra_config.LSEState) |val| {
                        if (val != .RCC_LSE_ON) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSEState",
                                "LSEOscillator",
                                "LSE ON",
                                "RCC_LSE_ON",
                                val,
                            });
                        }
                    }
                    break :blk .RCC_LSE_ON;
                }
                const user_val = config.extra_config.LSEState;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LSE_OFF => {},
                        .RCC_LSE_ON => {},
                        .RCC_LSE_BYPASS => {},
                    }
                }
                break :blk user_val orelse .RCC_LSE_OFF;
            };

            const MSIAutoCalibrationValue: MSIAutoCalibrationList = blk: {
                if (check_ref(@TypeOf(LSEStateValue), LSEStateValue, .RCC_LSE_OFF, .@"=")) {
                    const user_val = config.extra_config.MSIAutoCalibration;

                    if (user_val) |val| {
                        switch (val) {
                            .DISABLED => {},
                            .ENABLED => MSIAutoCalibrationON = true,
                        }
                    }
                    break :blk user_val orelse .DISABLED;
                } else if (CK48SourceMSI or (config.flags.USBUsed_ForRCC and CK48SourcePLLCLK and PLLSourceMSI) or (config.flags.USBUsed_ForRCC and CK48SourcePLLSAI1 and PLLSourceMSI)) {
                    if (config.extra_config.MSIAutoCalibration) |val| {
                        if (val != .ENABLED) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "MSIAutoCalibration",
                                "CK48SourceMSI|(USBUsed_ForRCC&CK48SourcePLLCLK&PLLSourceMSI)|(USBUsed_ForRCC&CK48SourcePLLSAI1&PLLSourceMSI)",
                                "",
                                "ENABLED",
                                val,
                            });
                        }
                    }
                    MSIAutoCalibrationON = true;
                    break :blk .ENABLED;
                }
                const user_val = config.extra_config.MSIAutoCalibration;

                if (user_val) |val| {
                    switch (val) {
                        .DISABLED => {},
                        .ENABLED => MSIAutoCalibrationON = true,
                    }
                }
                break :blk user_val orelse .DISABLED;
            };

            const MSIUsedForSysValue: u1 = blk: {
                if (((PLLSourceMSI) and (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"="))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedForSysValue: u1 = blk: {
                if (((PLLSourceHSI) and (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"="))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PrescalerValue: ?PrescalerList = blk: {
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
                    break :blk null;
                } else if (config.flags.CRSActivatedSourceGPIO) {
                    break :blk .RCC_CRS_SYNC_SOURCE_GPIO;
                } else if (config.flags.CRSActivatedSourceLSE) {
                    break :blk .RCC_CRS_SYNC_SOURCE_LSE;
                } else if (config.flags.CRSActivatedSourceUSB) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB;
                }
                break :blk .RCC_CRS_SYNC_SOURCE_USB;
            };

            const PolarityValue: ?PolarityList = blk: {
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
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
                } else if (UserDefinedReload and config.flags.CRSActivatedSourceGPIO) {
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
                } else if (UserDefinedReload and config.flags.CRSActivatedSourceLSE) {
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
                } else if (UserDefinedReload and config.flags.CRSActivatedSourceUSB) {
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
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
                } else if (config.flags.CRSActivatedSourceGPIO) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv1) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv2) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv4) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv8) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv16) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv32) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv64) {
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
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv128) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv1) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv2) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv4) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv8) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv16) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv32) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv64) {
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
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv128) {
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
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

            const HSI48CalibrationValueValue: ?u32 = blk: {
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
                    if (config.extra_config.HSI48CalibrationValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "HSI48CalibrationValue", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE & !CRSActivatedSourceUSB", "" });
                    }
                    break :blk null;
                }
                const user_val = config.extra_config.HSI48CalibrationValue;
                if (user_val) |val| {
                    if (val < 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSI48CalibrationValue",
                            "Else",
                            "No additional information",
                            0,
                            val,
                        });
                    }
                    if (val > 63) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSI48CalibrationValue",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 32;
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
                if ((config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_LSE) or MSIAutoCalibrationON or (config.flags.RFUsed_ForRCC and RFWKPSourceLSE) or config.flags.CRSActivatedSourceLSE or (LSCOSSourceLSE and config.flags.LSCOConfig) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM16) or (config.flags.SEM2RCC_LSE_REQUIRED_TIM2 and config.flags.Semaphore_TIM2_L4_ETR_REMAPTIM2 and config.flags.TIM2) or (config.flags.Semaphore_input_Channel1_directTIM15 and config.flags.TIM15 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM15) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCELSE and config.flags.LPTIM2Used_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
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
                if (check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
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
                if (config.flags.LPTIM1Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableExtClockForSAI1Value: EnableExtClockForSAI1List = blk: {
                if (config.flags.SAI1EXTCLK) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LSCOEnableValue: LSCOEnableList = blk: {
                if (config.flags.LSCOConfig and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
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
                if (config.flags.RTCUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LCDEnableValue: LCDEnableList = blk: {
                if (config.flags.LCDUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDGUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART1EnableValue: USART1EnableList = blk: {
                if (config.flags.USART1Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPUART1EnableValue: LPUART1EnableList = blk: {
                if (config.flags.LPUARTUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SMPSEnableValue: SMPSEnableList = blk: {
                if (check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .false;
                }
                break :blk .true;
            };

            const SMPSDivEnableValue: SMPSDivEnableList = blk: {
                if (check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .false;
                }
                break :blk .true;
            };

            const LPTIM2EnableValue: LPTIM2EnableList = blk: {
                if (config.flags.LPTIM2Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RFEnableValue: RFEnableList = blk: {
                if (config.flags.RFUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if ((config.flags.USBUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RNGEnableValue: RNGEnableList = blk: {
                if (config.flags.RNGUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C1EnableValue: I2C1EnableList = blk: {
                if (config.flags.I2C1Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C3EnableValue: I2C3EnableList = blk: {
                if (config.flags.I2C3Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if ((config.flags.SAI1Used_ForRCC) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC)) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if (((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const PLLUsedValue: u1 = blk: {
                if ((ADCSourcePLL and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) or ((SAI1SourcePLLP and (config.flags.SAI1Used_ForRCC))) or (SysSourcePLL) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig)) or (CK48SourcePLLCLK and (config.flags.USBUsed_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48) or config.flags.SDMMC1Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLLSAI1UsedValue: u1 = blk: {
                if (((SAI1SourcePLLSAI1P and (config.flags.SAI1Used_ForRCC))) or (ADCSourcePLLSAI1R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) or (CK48SourcePLLSAI1 and (config.flags.USBUsed_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48) or config.flags.SDMMC1Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
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

            const HSI48UsedValue: u1 = blk: {
                if ((CK48SourceHSI48 and (config.flags.USBUsed_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48))) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI48, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig))))) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE HSI48RC ======
            HSI48RC.nodetype = .source;
            HSI48RC.value = HSI48_VALUEValue;

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI1_VALUEValue;

            // ======= NODE LSI2RC ======
            LSI2RC.nodetype = .source;
            LSI2RC.value = LSI2_VALUEValue;

            // ======= NODE LSIMult ======
            LSIMult.nodetype = .multi;
            LSIMult.parents = switch (LSISource1Value) {
                .RCC_LSCOSOURCE_LSI1 => &.{&LSIRC},
                .RCC_LSCOSOURCE_LSI2 => &.{&LSI2RC},
            };

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE MSIRC ======
            MSIRC.nodetype = .source;
            MSIRC.value = try MSIClockRangeValue.get();

            // ======= NODE HCLKRFMultDiv ======
            HCLKRFMultDiv.nodetype = .div;
            HCLKRFMultDiv.value = @floatFromInt(HCLKRFDivValue);
            HCLKRFMultDiv.parents = &.{&HSEOSC};

            // ======= NODE HCLKRFMult ======

            HCLKRFMult.is_auto = true;
            HCLKRFMult.nodetype = .multi;
            HCLKRFMult.parents = switch (HCLKRFclockSelectionVirtualValue) {
                .RCC_HCLKRFCLKSOURCE_HSE => &.{&HCLKRFMultDiv},
                .RCC_HCLKRFCLKSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE HCLKRFOutput ======
            HCLKRFOutput.nodetype = .output;
            HCLKRFOutput.parents = &.{&HCLKRFMult};

            // ======= NODE APB3Output ======
            APB3Output.nodetype = .output;
            APB3Output.parents = &.{&HCLKRFMult};

            // ======= NODE LPTIM1Mult ======
            LPTIM1Mult.nodetype = .multi;
            LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                .RCC_LPTIM1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LPTIM1output ======
            LPTIM1output.nodetype = .output;
            LPTIM1output.parents = &.{&LPTIM1Mult};

            // ======= NODE SAI1_EXT ======
            SAI1_EXT.nodetype = .source;
            SAI1_EXT.value = EXTERNALSAI1_CLOCK_VALUEValue;

            // ======= NODE LSCOMult ======
            LSCOMult.nodetype = .multi;
            LSCOMult.parents = switch (LSCOSource1Value) {
                .RCC_LSCOSOURCE_LSI => &.{&LSIRC},
                .RCC_LSCOSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LSCOOutput ======
            LSCOOutput.nodetype = .output;
            LSCOOutput.parents = &.{&LSCOMult};

            // ======= NODE HSEPRESC ======
            HSEPRESC.nodetype = .div;
            HSEPRESC.value = @floatFromInt(HSEPRESValue);
            HSEPRESC.parents = &.{&HSEOSC};

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
            if (check_MCU("STM32WBx0_Value_Line")) {
                PLLM.nodetype = .div;
                PLLM.value = try PLLMValue.get();
                PLLM.parents = &.{&PLLSource};
            } else if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLM.nodetype = .div;
                PLLM.value = try PLLMValue.get();
                PLLM.parents = &.{&PLLSource};
            }
            // ======= NODE HSERTCDevisor ======
            HSERTCDevisor.nodetype = .div;
            HSERTCDevisor.value = @floatFromInt(RCC_RTC_Clock_Source_FROM_HSEValue);
            HSERTCDevisor.parents = &.{&HSEOSC};

            // ======= NODE RTCClkSource ======
            RTCClkSource.nodetype = .multi;
            RTCClkSource.parents = switch (RTCClockSelectionValue) {
                .RCC_RTCCLKSOURCE_HSE_DIV32 => &.{&HSERTCDevisor},
                .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_RTCCLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE RTCOutput ======
            RTCOutput.nodetype = .output;
            RTCOutput.parents = &.{&RTCClkSource};

            // ======= NODE LCDOutput ======
            LCDOutput.nodetype = .output;
            LCDOutput.parents = &.{&RTCClkSource};

            // ======= NODE IWDGOutput ======
            IWDGOutput.nodetype = .output;
            IWDGOutput.parents = &.{&LSIRC};

            // ======= NODE USART1Mult ======
            USART1Mult.nodetype = .multi;
            USART1Mult.parents = switch (USART1CLockSelectionValue) {
                .RCC_USART1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART1output ======
            USART1output.nodetype = .output;
            USART1output.parents = &.{&USART1Mult};

            // ======= NODE LPUART1Mult ======
            if (check_MCU("LPUART1_Exist")) {
                LPUART1Mult.nodetype = .multi;
                LPUART1Mult.parents = switch (LPUART1CLockSelectionValue) {
                    .RCC_LPUART1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPUART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPUART1output ======
            if (check_MCU("LPUART1_Exist")) {
                LPUART1output.nodetype = .output;
                LPUART1output.parents = &.{&LPUART1Mult};
            }
            // ======= NODE SMPSDiv2 ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                SMPSDiv2.nodetype = .div;
                SMPSDiv2.value = @floatFromInt(SMPSDiv2Value);
                SMPSDiv2.parents = &.{&SMPSDivider};
            }
            // ======= NODE SMPSoutput ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                SMPSoutput.nodetype = .output;
                SMPSoutput.parents = &.{&SMPSDiv2};
            }
            // ======= NODE LPTIM2Mult ======
            LPTIM2Mult.nodetype = .multi;
            LPTIM2Mult.parents = switch (LPTIM2CLockSelectionValue) {
                .RCC_LPTIM2CLKSOURCE_PCLK => &.{&APB1Prescaler},
                .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM2CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LPTIM2output ======
            LPTIM2output.nodetype = .output;
            LPTIM2output.parents = &.{&LPTIM2Mult};

            // ======= NODE HSERFWKPDevisor ======
            HSERFWKPDevisor.nodetype = .div;
            HSERFWKPDevisor.value = @floatFromInt(RCC_RFWKP_Clock_Source_FROM_HSEValue);
            HSERFWKPDevisor.parents = &.{&HSEOSC};

            // ======= NODE RFWKPClkSource ======
            RFWKPClkSource.nodetype = .multi;
            RFWKPClkSource.parents = switch (RFWKPClockSelectionValue) {
                .RCC_RFWKPCLKSOURCE_HSE_DIV1024 => &.{&HSERFWKPDevisor},
                .RCC_RFWKPCLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE RFWKPOutput ======
            RFWKPOutput.nodetype = .output;
            RFWKPOutput.parents = &.{&RFWKPClkSource};

            // ======= NODE CK48Mult ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                CK48Mult.nodetype = .multi;
                CK48Mult.parents = switch (CK48CLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLLSAI1 => &.{&PLLSAI1Q},
                    .RCC_USBCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_USBCLKSOURCE_MSI => &.{&MSIRC},
                    .RCC_USBCLKSOURCE_HSI48 => &.{&HSI48RC},
                };
            } else if (check_MCU("STM32WBx0_Value_Line")) {
                CK48Mult.nodetype = .multi;
                CK48Mult.parents = switch (CK48CLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_USBCLKSOURCE_MSI => &.{&MSIRC},
                    .RCC_USBCLKSOURCE_HSI48 => &.{&HSI48RC},
                    else => return comptime_fail_or_error(error.InvalidClockSelection,
                        \\Error on node {s}: Invalid Clock Selection
                        \\current expr: {s}
                        \\diagnostic: {s}
                        \\reference {s} - .{s} cannot be selected as a clock source in the current configurations.
                        \\ Available source options:
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                    , .{
                        "CK48Mult",
                        "STM32WBx0_Value_Line",
                        "",
                        "CK48CLockSelection",
                        if (patch_logs) @tagName(try CK48CLockSelectionValue.to_enum()) else @tagName(CK48CLockSelectionValue),
                        if (patch_logs) @tagName(try CK48CLockSelectionList.to_enum(.RCC_USBCLKSOURCE_PLL)) else @tagName(CK48CLockSelectionList.RCC_USBCLKSOURCE_PLL),
                        if (patch_logs) @tagName(try CK48CLockSelectionList.to_enum(.RCC_USBCLKSOURCE_MSI)) else @tagName(CK48CLockSelectionList.RCC_USBCLKSOURCE_MSI),
                        if (patch_logs) @tagName(try CK48CLockSelectionList.to_enum(.RCC_USBCLKSOURCE_HSI48)) else @tagName(CK48CLockSelectionList.RCC_USBCLKSOURCE_HSI48),
                    }),
                };
            }
            // ======= NODE CK48output ======
            CK48output.nodetype = .output;
            CK48output.parents = &.{&CK48Mult};

            // ======= NODE RNGDiv ======
            RNGDiv.nodetype = .div;
            RNGDiv.value = @floatFromInt(RNGDivValue);
            RNGDiv.parents = &.{&CK48Mult};

            // ======= NODE RNGMult ======
            RNGMult.nodetype = .multi;
            RNGMult.parents = switch (RNGCLockSelectionValue) {
                .RCC_RNGCLKSOURCE_CLK48 => &.{&RNGDiv},
                .RCC_RNGCLKSOURCE_LSI => &.{&LSIRC},
                .RCC_RNGCLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE RNGoutput ======
            RNGoutput.nodetype = .output;
            RNGoutput.parents = &.{&RNGMult};

            // ======= NODE I2C1Mult ======
            I2C1Mult.nodetype = .multi;
            I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE I2C1output ======
            I2C1output.nodetype = .output;
            I2C1output.parents = &.{&I2C1Mult};

            // ======= NODE I2C3Mult ======
            if (check_MCU("I2C3_Exist")) {
                I2C3Mult.nodetype = .multi;
                I2C3Mult.parents = switch (I2C3CLockSelectionValue) {
                    .RCC_I2C3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C3CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE I2C3output ======
            if (check_MCU("I2C3_Exist")) {
                I2C3output.nodetype = .output;
                I2C3output.parents = &.{&I2C3Mult};
            }
            // ======= NODE SAI1Mult ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                SAI1Mult.nodetype = .multi;
                SAI1Mult.parents = switch (SAI1CLockSelectionValue) {
                    .RCC_SAI1CLKSOURCE_PLLSAI1 => &.{&PLLSAI1P},
                    .RCC_SAI1CLKSOURCE_PLL => &.{&PLLP},
                    .RCC_SAI1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SAI1CLKSOURCE_PIN => &.{&SAI1_EXT},
                };
            }
            // ======= NODE SAI1output ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                SAI1output.nodetype = .output;
                SAI1output.parents = &.{&SAI1Mult};
            }
            // ======= NODE ADCMult ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                ADCMult.nodetype = .multi;
                ADCMult.parents = switch (ADCCLockSelectionValue) {
                    .RCC_ADCCLKSOURCE_PLLSAI1 => &.{&PLLSAI1R},
                    .RCC_ADCCLKSOURCE_PLL => &.{&PLLP},
                    .RCC_ADCCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            } else if (check_MCU("STM32WBx0_Value_Line")) {
                ADCMult.nodetype = .multi;
                ADCMult.parents = switch (ADCCLockSelectionValue) {
                    .RCC_ADCCLKSOURCE_PLL => &.{&PLLP},
                    .RCC_ADCCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    else => return comptime_fail_or_error(error.InvalidClockSelection,
                        \\Error on node {s}: Invalid Clock Selection
                        \\current expr: {s}
                        \\diagnostic: {s}
                        \\reference {s} - .{s} cannot be selected as a clock source in the current configurations.
                        \\ Available source options:
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                    , .{
                        "ADCMult",
                        "STM32WBx0_Value_Line",
                        "",
                        "ADCCLockSelection",
                        if (patch_logs) @tagName(try ADCCLockSelectionValue.to_enum()) else @tagName(ADCCLockSelectionValue),
                        if (patch_logs) @tagName(try ADCCLockSelectionList.to_enum(.RCC_ADCCLKSOURCE_PLL)) else @tagName(ADCCLockSelectionList.RCC_ADCCLKSOURCE_PLL),
                        if (patch_logs) @tagName(try ADCCLockSelectionList.to_enum(.RCC_ADCCLKSOURCE_SYSCLK)) else @tagName(ADCCLockSelectionList.RCC_ADCCLKSOURCE_SYSCLK),
                    }),
                };
            }
            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&ADCMult};

            // ======= NODE MCOMult ======
            MCOMult.nodetype = .multi;
            MCOMult.parents = switch (RCC_MCO1SourceValue) {
                .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO1SOURCE_LSI1 => &.{&LSIRC},
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                .RCC_MCO1SOURCE_PLLCLK => &.{&PLLR},
                .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_MCO1SOURCE_MSI => &.{&MSIRC},
                .RCC_MCO1SOURCE_HSI48 => &.{&HSI48RC},
            };

            // ======= NODE MCODiv ======
            MCODiv.nodetype = .div;
            MCODiv.value = try RCC_MCODivValue.get();
            MCODiv.parents = &.{&MCOMult};

            // ======= NODE MCOPin ======
            MCOPin.nodetype = .output;
            MCOPin.parents = &.{&MCODiv};

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

            // ======= NODE PLLSAI1N ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLSAI1N.nodetype = .mul;
                PLLSAI1N.value = @floatFromInt(PLLSAI1NValue);
                PLLSAI1N.parents = &.{&PLLM};
            }
            // ======= NODE PLLSAI1P ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLSAI1P.nodetype = .div;
                PLLSAI1P.value = try PLLSAI1PValue.get();
                PLLSAI1P.parents = &.{&PLLSAI1N};
            }
            // ======= NODE PLLSAI1Poutput ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLSAI1Poutput.nodetype = .output;
                PLLSAI1Poutput.parents = &.{&PLLSAI1P};
            }
            // ======= NODE PLLSAI1Q ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLSAI1Q.nodetype = .div;
                PLLSAI1Q.value = try PLLSAI1QValue.get();
                PLLSAI1Q.parents = &.{&PLLSAI1N};
            }
            // ======= NODE PLLSAI1Qoutput ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLSAI1Qoutput.nodetype = .output;
                PLLSAI1Qoutput.parents = &.{&PLLSAI1Q};
            }
            // ======= NODE PLLSAI1R ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLSAI1R.nodetype = .div;
                PLLSAI1R.value = try PLLSAI1RValue.get();
                PLLSAI1R.parents = &.{&PLLSAI1N};
            }
            // ======= NODE PLLSAI1Routput ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                PLLSAI1Routput.nodetype = .output;
                PLLSAI1Routput.parents = &.{&PLLSAI1R};
            }
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

            // ======= NODE VCOSAI1Output ======
            VCOSAI1Output.nodetype = .output;
            VCOSAI1Output.parents = &.{&PLLSAI1N};

            //======== POST REFS ========

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if (config.flags.USBUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 1.42e7,
                    .max = 6.4e7,
                    .main_expr = "USBUsed_ForRCC ",
                    .main_dialog = "USB activated",
                };
            } else {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 6.4e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            const PWR_Regulator_Voltage_ScaleValue: ?PWR_Regulator_Voltage_ScaleList = blk: {
                if (check_MCU("STM32WBx0_Value_Line")) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "PWR_Regulator_Voltage_Scale", "STM32WBx0_Value_Line", "" });
                    }
                    break :blk null;
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"="))) and !check_MCU("STM32WBx0_Value_Line")) {
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
                } else if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@">")) and !check_MCU("STM32WBx0_Value_Line")) {
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
                                "(HCLKFreq_Value > 16000000) & !STM32WBx0_Value_Line",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                }
                break :blk null;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (check_MCU("STM32WB5MMGHx")) {
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
                                "STM32WB5MMGHx",
                                "HSE for RF",
                                3.2e7,
                                val,
                            });
                        }
                    }
                    HSEOSC.limit = .{
                        .min = 3.2e7,
                        .max = 3.2e7,
                        .main_expr = "STM32WB5MMGHx",
                        .main_dialog = "HSE for RF",
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
                        .main_expr = "(HSEByPass | HSEOscillator)  & RFUsed_ForRCC",
                        .main_dialog = "HSE for RF",
                    };
                    break :blk 3.2e7;
                } else if (config.flags.STM32WB30CEUx or config.flags.STM32WB35CCUx or config.flags.STM32WB35CEUx) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 3.2e7,
                        .main_expr = "STM32WB30CEUx | STM32WB35CCUx | STM32WB35CEUx",
                        .main_dialog = "",
                    };
                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEByPass and (scale2 and SysSourceHSE)) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 2.6e7,
                        .main_expr = "HSEByPass & (scale2 & SysSourceHSE)  ",
                        .main_dialog = "HSE in bypass Mode",
                    };
                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 4.8e7,
                        .main_expr = "HSEByPass  ",
                        .main_dialog = "HSE in bypass Mode",
                    };
                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEOscillator and (scale2 and SysSourceHSE)) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 4e6,
                        .max = 2.6e7,
                        .main_expr = "HSEOscillator & (scale2 & SysSourceHSE)  ",
                        .main_dialog = "HSE in bypass Mode",
                    };
                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 4.8e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 8e6;
            };

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

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
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")))) {
                RTCOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                    .main_expr = "(!(RTCClockSelection=RCC_RTCCLKSOURCE_LSE)&!(RTCClockSelection=RCC_RTCCLKSOURCE_LSI)& (RTCEnable=true))",
                    .main_dialog = "RTC Has HSE as source",
                };
            }

            //======= LCDFreq_Value ========
            const LCDFreq_ValueValue = LCDOutput.get_as_ref();
            ignore_value(LCDFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")))) {
                LCDOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                    .main_expr = "(!(RTCClockSelection=RCC_RTCCLKSOURCE_LSE)&!(RTCClockSelection=RCC_RTCCLKSOURCE_LSI)& (LCDEnable=true))",
                    .main_dialog = "RTC Has HSE as source",
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

            // ======= NODE SMPSMult ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                SMPSMult.nodetype = .multi;
                SMPSMult.parents = switch (SMPSCLockSelectionVirtualValue) {
                    .RCC_SMPSCLKSOURCE_MSI => &.{&MSIRC},
                    .RCC_SMPSCLKSOURCE_HSE => &.{&HSEOSC},
                    .RCC_SMPSCLKSOURCE_HSI => &.{&HSIRC},
                };
            }
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

            // ======= NODE SMPSDivider ======
            if (!check_MCU("STM32WBx0_Value_Line")) {
                SMPSDivider.nodetype = .div;
                SMPSDivider.value = try SMPSDividerValue.get();
                SMPSDivider.parents = &.{&SMPSMult};
            }
            //======= SMPSFreq_Value ========
            const SMPSFreq_ValueValue = SMPSoutput.get_as_ref();
            ignore_value(SMPSFreq_ValueValue);

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);

            //======= RFWKPFreq_Value ========
            const RFWKPFreq_ValueValue = RFWKPOutput.get_as_ref();
            ignore_value(RFWKPFreq_ValueValue);

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = CK48output.get_as_ref();
            ignore_value(USBFreq_ValueValue);
            if (config.flags.USBUsed_ForRCC) {
                CK48output.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                    .main_expr = "USBUsed_ForRCC",
                    .main_dialog = "HSE in bypass Mode",
                };
            } else {
                CK48output.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);

            RNGoutput.limit = .{
                .min = null,
                .max = 4.8e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            ADCoutput.limit = .{
                .min = 1.4e5,
                .max = 6.4e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
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
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= FCLK2Freq_Value ========
            const FCLK2Freq_ValueValue = FCLK2CortexOutput.get_as_ref();
            ignore_value(FCLK2Freq_ValueValue);

            FCLK2CortexOutput.limit = .{
                .min = null,
                .max = 3.2e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= HCLK2Freq_Value ========
            const HCLK2Freq_ValueValue = AHB2Output.get_as_ref();
            ignore_value(HCLK2Freq_ValueValue);

            AHB2Output.limit = .{
                .min = null,
                .max = 3.2e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            PWRCLKoutput.limit = .{
                .min = null,
                .max = 6.4e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
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
                .main_expr = "Else",
                .main_dialog = "No additional information",
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
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if ((((SAI1SourcePLLP and (config.flags.SAI1Used_ForRCC))) or (ADCSourcePLL and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3))) and scale1) {
                PLLPoutput.limit = .{
                    .min = 2e6,
                    .max = 6.4e7,
                    .main_expr = "(((SAI1SourcePLLP&(SAI1Used_ForRCC))) |(ADCSourcePLL & (USE_ADC1|USE_ADC2|USE_ADC3)))& scale1 ",
                    .main_dialog = " ",
                };
            } else if ((((SAI1SourcePLLP and (config.flags.SAI1Used_ForRCC))) or (ADCSourcePLL and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3))) and scale2) {
                PLLPoutput.limit = .{
                    .min = 2e6,
                    .max = 2.6e7,
                    .main_expr = "(((SAI1SourcePLLP&(SAI1Used_ForRCC))) |(ADCSourcePLL & (USE_ADC1|USE_ADC2|USE_ADC3)))& scale2 ",
                    .main_dialog = " ",
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if (((config.flags.USBUsed_ForRCC or config.flags.SDMMC1Used_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48)) and CK48SourcePLLCLK) and scale1) {
                PLLQoutput.limit = .{
                    .min = 8e6,
                    .max = 6.4e7,
                    .main_expr = "((USBUsed_ForRCC|SDMMC1Used_ForRCC|(RNGUsed_ForRCC & RNGCLKSOURCE_CLK48))& CK48SourcePLLCLK)& scale1 ",
                    .main_dialog = " ",
                };
            } else if (((config.flags.USBUsed_ForRCC or config.flags.SDMMC1Used_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48)) and CK48SourcePLLCLK) and scale2) {
                PLLQoutput.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                    .main_expr = "((USBUsed_ForRCC|SDMMC1Used_ForRCC|(RNGUsed_ForRCC & RNGCLKSOURCE_CLK48))& CK48SourcePLLCLK)& scale2 ",
                    .main_dialog = " ",
                };
            }

            //======= PLLSAI1PoutputFreq_Value ========
            const PLLSAI1PoutputFreq_ValueValue = PLLSAI1Poutput.get_as_ref();
            ignore_value(PLLSAI1PoutputFreq_ValueValue);
            if (((SAI1SourcePLLSAI1P and (config.flags.SAI1Used_ForRCC))) and scale1) {
                PLLSAI1Poutput.limit = .{
                    .min = 2e6,
                    .max = 6.4e7,
                    .main_expr = "((SAI1SourcePLLSAI1P&(SAI1Used_ForRCC)))& scale1 ",
                    .main_dialog = " ",
                };
            } else if (((SAI1SourcePLLSAI1P and (config.flags.SAI1Used_ForRCC))) and scale2) {
                PLLSAI1Poutput.limit = .{
                    .min = 2e6,
                    .max = 2.6e7,
                    .main_expr = "((SAI1SourcePLLSAI1P&(SAI1Used_ForRCC)))& scale2 ",
                    .main_dialog = " ",
                };
            }

            //======= PLLSAI1QoutputFreq_Value ========
            const PLLSAI1QoutputFreq_ValueValue = PLLSAI1Qoutput.get_as_ref();
            ignore_value(PLLSAI1QoutputFreq_ValueValue);
            if (((config.flags.USBUsed_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48)) and CK48SourcePLLSAI1) and scale1) {
                PLLSAI1Qoutput.limit = .{
                    .min = 8e6,
                    .max = 6.4e7,
                    .main_expr = "((USBUsed_ForRCC|(RNGUsed_ForRCC & RNGCLKSOURCE_CLK48))& CK48SourcePLLSAI1)& scale1 ",
                    .main_dialog = " ",
                };
            } else if (((config.flags.USBUsed_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48)) and CK48SourcePLLSAI1) and scale2) {
                PLLSAI1Qoutput.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                    .main_expr = "((USBUsed_ForRCC|(RNGUsed_ForRCC & RNGCLKSOURCE_CLK48))& CK48SourcePLLSAI1)& scale2 ",
                    .main_dialog = " ",
                };
            }

            //======= PLLSAI1RoutputFreq_Value ========
            const PLLSAI1RoutputFreq_ValueValue = PLLSAI1Routput.get_as_ref();
            ignore_value(PLLSAI1RoutputFreq_ValueValue);
            if ((ADCSourcePLLSAI1R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) and scale1) {
                PLLSAI1Routput.limit = .{
                    .min = 8e6,
                    .max = 6.4e7,
                    .main_expr = "(ADCSourcePLLSAI1R & (USE_ADC1|USE_ADC2|USE_ADC3))& scale1 ",
                    .main_dialog = " ",
                };
            } else if ((ADCSourcePLLSAI1R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) and scale2) {
                PLLSAI1Routput.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                    .main_expr = "(ADCSourcePLLSAI1R & (USE_ADC1|USE_ADC2|USE_ADC3)) & scale2",
                    .main_dialog = " ",
                };
            }

            //======= SMPS1Freq_Value ========
            const SMPS1Freq_ValueValue = SMPSDivclk.get_as_ref();
            ignore_value(SMPS1Freq_ValueValue);

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=")) and (check_MCU("STM32WBx0_Value_Line") or config.flags.STM32WB30CEUx or config.flags.STM32WB35CCUx or config.flags.STM32WB35CEUx)) {
                VCOInput.limit = .{
                    .min = 2.66e6,
                    .max = 1.6e7,
                    .main_expr = "(PLLUsed=1|PLLSAI1Used=1) & (STM32WBx0_Value_Line | STM32WB30CEUx | STM32WB35CCUx | STM32WB35CEUx)",
                    .main_dialog = "",
                };
            } else if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 4e6,
                    .max = 1.6e7,
                    .main_expr = "(PLLUsed=1|PLLSAI1Used=1) ",
                    .main_dialog = " PLLUsed=1|PLLSAI1Used=1",
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale1) {
                VCOOutput.limit = .{
                    .min = 9.6e7,
                    .max = 3.44e8,
                    .main_expr = "PLLUsed=1 & scale1",
                    .main_dialog = "PLLUsed=1 ",
                };
            } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale2) {
                VCOOutput.limit = .{
                    .min = 6.4e7,
                    .max = 1.28e8,
                    .main_expr = "PLLUsed=1 & scale2",
                    .main_dialog = "PLLUsed=1 ",
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if ((MCOSourcePLL or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) and scale1) {
                PLLCLK.limit = .{
                    .min = 8e6,
                    .max = 6.4e7,
                    .main_expr = "(MCOSourcePLL | (SYSCLKSource=RCC_SYSCLKSOURCE_PLLCLK))& scale1",
                    .main_dialog = "",
                };
            } else if ((MCOSourcePLL or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) and scale2) {
                PLLCLK.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                    .main_expr = "(MCOSourcePLL | (SYSCLKSource=RCC_SYSCLKSOURCE_PLLCLK))& scale2",
                    .main_dialog = "",
                };
            }

            //======= VCOSAI1OutputFreq_Value ========
            const VCOSAI1OutputFreq_ValueValue = VCOSAI1Output.get_as_ref();
            ignore_value(VCOSAI1OutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=") and scale1) {
                VCOSAI1Output.limit = .{
                    .min = 9.6e7,
                    .max = 3.44e8,
                    .main_expr = "PLLSAI1Used=1 & scale1",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=") and scale2) {
                VCOSAI1Output.limit = .{
                    .min = 6.4e7,
                    .max = 1.28e8,
                    .main_expr = "PLLSAI1Used=1 & scale2",
                    .main_dialog = "",
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (((scale1 or check_MCU("STM32WBx0_Value_Line")) and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 18000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 18000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 6000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 6000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_0;
                } else if (((scale1 or check_MCU("STM32WBx0_Value_Line")) and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 36000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 36000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 12000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 12000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_1;
                } else if (((scale1 or check_MCU("STM32WBx0_Value_Line")) and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 54000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 54000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 16000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_2;
                } else if (((scale1 or check_MCU("STM32WBx0_Value_Line")) and ((check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 64000000, .@"<")) or (check_ref(@TypeOf(HCLK3Freq_ValueValue), HCLK3Freq_ValueValue, 64000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_3;
                }
                break :blk .FLASH_LATENCY_3;
            };

            const HSIUsedValue: u1 = blk: {
                if ((HCLKRFSourceHSI) or (config.flags.SAI1Used_ForRCC and SAI1SourceHSI) or ((check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) and SMPSSourceHSI) or (USART1SourceHSI and config.flags.USART1Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCEHSI and config.flags.LPTIM2Used_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C3SourceHSI and config.flags.I2C3Used_ForRCC) or ((PLLSourceHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig))))) {
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
                if (((check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) and SMPSSourceMSI) or (config.flags.SEM2RCC_MSI_REQUIRED_TIM16 and config.flags.TIM16 and config.flags.Semaphore_input_Channel1TIM16) or (CK48SourceMSI and (config.flags.USBUsed_ForRCC or (config.flags.RNGUsed_ForRCC and RNGCLKSOURCE_CLK48))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_MSI, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig)) or (PLLSourceMSI and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=")))) {
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

            const MSIOscStateValue: MSIOscStateList = blk: {
                if (((check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) and (check_ref(@TypeOf(MSIUsedForSysValue), MSIUsedForSysValue, 0, .@"="))) or ((check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) and (check_ref(@TypeOf(MSIUsedValue), MSIUsedValue, 0, .@"=")))) {
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

            const HSIOscStateValue: HSIOscStateList = blk: {
                if (((check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) and (check_ref(@TypeOf(HSIUsedForSysValue), HSIUsedForSysValue, 0, .@"="))) or ((check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) and (check_ref(@TypeOf(HSIUsedValue), HSIUsedValue, 0, .@"=")))) {
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
            if (!(check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"="))) {
                LSIMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSERFDevisorValue), EnableHSERFDevisorValue, .true, .@"="))) {
                HCLKRFMultDiv.nodetype = .off;
            }
            if (!(true)) {
                HCLKRFMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"="))) {
                LPTIM1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"="))) {
                LPTIM1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableExtClockForSAI1Value), EnableExtClockForSAI1Value, .true, .@"="))) {
                SAI1_EXT.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"="))) {
                LSCOMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"="))) {
                LSCOOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                HSEPRESC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=") or check_ref(@TypeOf(EnableHSELCDDevisorValue), EnableHSELCDDevisorValue, .true, .@"="))) {
                HSERTCDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=") or check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"="))) {
                RTCClkSource.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"="))) {
                RTCOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"="))) {
                LCDOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(IWDGEnableValue), IWDGEnableValue, .true, .@"="))) {
                IWDGOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"="))) {
                LPUART1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"="))) {
                LPUART1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SMPSEnableValue), SMPSEnableValue, .true, .@"="))) {
                SMPSMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SMPSDivEnableValue), SMPSDivEnableValue, .true, .@"="))) {
                SMPSDivider.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SMPSEnableValue), SMPSEnableValue, .true, .@"="))) {
                SMPSDiv2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SMPSEnableValue), SMPSEnableValue, .true, .@"="))) {
                SMPSoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"="))) {
                LPTIM2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"="))) {
                LPTIM2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSERFDevisorValue), EnableHSERFDevisorValue, .true, .@"="))) {
                HSERFWKPDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RFEnableValue), RFEnableValue, .true, .@"="))) {
                RFWKPClkSource.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RFEnableValue), RFEnableValue, .true, .@"="))) {
                RFWKPOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or config.flags.SDMMCEnable or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                CK48Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                CK48output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGDiv.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"="))) {
                I2C3Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"="))) {
                I2C3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCODiv.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOPin.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or config.flags.SDMMCEnable or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                PLLSAI1N.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                PLLSAI1P.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                PLLSAI1Poutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or config.flags.SDMMCEnable or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                PLLSAI1Q.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or config.flags.SDMMCEnable or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                PLLSAI1Qoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                PLLSAI1R.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                PLLSAI1Routput.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.HSI48RC = try HSI48RC.get_output();
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
            out.SAI1_EXT = try SAI1_EXT.get_output();
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
            out.CK48output = try CK48output.get_output();
            out.RNGDiv = try RNGDiv.get_output();
            out.RNGMult = try RNGMult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3output = try I2C3output.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.SAI1output = try SAI1output.get_output();
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
            out.PLLSAI1N = try PLLSAI1N.get_output();
            out.PLLSAI1P = try PLLSAI1P.get_output();
            out.PLLSAI1Poutput = try PLLSAI1Poutput.get_output();
            out.PLLSAI1Q = try PLLSAI1Q.get_output();
            out.PLLSAI1Qoutput = try PLLSAI1Qoutput.get_output();
            out.PLLSAI1R = try PLLSAI1R.get_output();
            out.PLLSAI1Routput = try PLLSAI1Routput.get_output();
            out.LSI = try LSI.get_extra_output();
            out.SMPSDivclk = try SMPSDivclk.get_extra_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.VCOSAI1Output = try VCOSAI1Output.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSI48_VALUEValue);
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
            ignore_value(EXTERNALSAI1_CLOCK_VALUEValue);
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
            ref_out.SMPSDivider = SMPSDividerValue;
            ref_out.SMPSDiv2 = SMPSDiv2Value;
            ignore_value(SMPSFreq_ValueValue);
            ref_out.LPTIM2CLockSelection = LPTIM2CLockSelectionValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.RCC_RFWKP_Clock_Source_FROM_HSE = RCC_RFWKP_Clock_Source_FROM_HSEValue;
            ref_out.RFWKPClockSelection = RFWKPClockSelectionValue;
            ignore_value(RFWKPFreq_ValueValue);
            ref_out.CK48CLockSelection = CK48CLockSelectionValue;
            ignore_value(USBFreq_ValueValue);
            ref_out.RNGDiv = RNGDivValue;
            ref_out.RNGCLockSelection = RNGCLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C3CLockSelection = I2C3CLockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ref_out.SAI1CLockSelection = SAI1CLockSelectionValue;
            ignore_value(SAI1Freq_ValueValue);
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
            ref_out.PLLSAI1N = PLLSAI1NValue;
            ref_out.PLLSAI1P = PLLSAI1PValue;
            ignore_value(PLLSAI1PoutputFreq_ValueValue);
            ref_out.PLLSAI1Q = PLLSAI1QValue;
            ignore_value(PLLSAI1QoutputFreq_ValueValue);
            ref_out.PLLSAI1R = PLLSAI1RValue;
            ignore_value(PLLSAI1RoutputFreq_ValueValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(SMPS1Freq_ValueValue);
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLRCLKFreq_ValueValue);
            ignore_value(VCOSAI1OutputFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.MSICalibrationValue = MSICalibrationValueValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.MSIAutoCalibration = MSIAutoCalibrationValue;
            ref_out.MSIOscState = MSIOscStateValue;
            ref_out.HSIOscState = HSIOscStateValue;
            ref_out.Prescaler = PrescalerValue;
            ref_out.Source = SourceValue;
            ref_out.Polarity = PolarityValue;
            ref_out.ReloadValueType = ReloadValueTypeValue;
            ref_out.ReloadValue = ReloadValueValue;
            ref_out.Fsync = FsyncValue;
            ref_out.ErrorLimitValue = ErrorLimitValueValue;
            ref_out.HSI48CalibrationValue = HSI48CalibrationValueValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.CodegenConfigPeriph = CodegenConfigPeriphValue == .true;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.EnableHSERFDevisor = EnableHSERFDevisorValue == .true;
            ref_out.flags.EnableHCLKR = EnableHCLKRValue == .auto;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.EnableExtClockForSAI1 = EnableExtClockForSAI1Value == .true;
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
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.PLLSAI1Used = PLLSAI1UsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.MSIUsed = MSIUsedValue != 0;
            ref_out.LSEState = LSEStateValue;
            ref_out.flags.MSIUsedForSys = MSIUsedForSysValue != 0;
            ref_out.flags.HSIUsedForSys = HSIUsedForSysValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.EnbaleCSS = EnbaleCSSValue == .true;
            ref_out.flags.HSI48Used = HSI48UsedValue != 0;
            ref_out.SMPSCLockSelectionVirtual = SMPSCLockSelectionVirtualValue;

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
