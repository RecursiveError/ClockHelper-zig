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
        pub const RCC_LPTIM1SEL = enum(u2) {
            PCLK1 = 0,
            LSI = 1,
            HSI = 2,
            LSE = 3,
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
        pub const RCC_SAI2SEL = enum(u2) {
            PLLSAI1_P = 0,
            PLLSAI2_P = 1,
            PLL1_P = 2,
            SAI2_EXTCLK = 3,
        };
        pub const RCC_I2C2SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };
        pub const RCC_PLLR = enum(u2) {
            Div2 = 0,
            Div4 = 1,
            Div6 = 2,
            Div8 = 3,
        };
        pub const RCC_SW = enum(u2) {
            MSI = 0,
            HSI = 1,
            HSE = 2,
            PLL1_R = 3,
        };
        pub const RCC_USART1SEL = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
        };
        pub const PWR_LPR = enum(u1) {
            MainMode = 0,
            LowPowerMode = 1,
        };
        pub const RCC_I2C3SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_DFSDMSEL = enum(u1) {
            PCLK2 = 0,
            SYS = 1,
        };
        pub const RCC_USARTSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_PLLQ = enum(u2) {
            Div2 = 0,
            Div4 = 1,
            Div6 = 2,
            Div8 = 3,
        };
        pub const RCC_SAI1SEL = enum(u2) {
            PLLSAI1_P = 0,
            PLLSAI2_P = 1,
            PLL1_P = 2,
            SAI1_EXTCLK = 3,
        };
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 1,
            MSI = 2,
            HSI = 3,
            HSE = 4,
            PLL = 5,
            LSI = 6,
            LSE = 7,
            HSI48 = 8,
        };
        pub const RCC_CLK48SEL = enum(u2) {
            HSI48 = 0,
            PLLSAI1_Q = 1,
            PLL1_Q = 2,
            MSI = 3,
        };
        pub const CRS_SYNCSRC = enum(u2) {
            GPIO = 0,
            LSE = 1,
            USB = 2,
        };
        pub const RCC_LSCOSEL = enum(u1) {
            LSI = 0,
            LSE = 1,
        };
        pub const RCC_LPUART1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
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
        pub const RCC_SWPMI1SEL = enum(u1) {
            PCLK1 = 0,
            HSI = 1,
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
            Div2 = 2,
            Div3 = 3,
            Div4 = 4,
            Div5 = 5,
            Div6 = 6,
            Div7 = 7,
            Div8 = 8,
            Div9 = 9,
            Div10 = 10,
            Div11 = 11,
            Div12 = 12,
            Div13 = 13,
            Div14 = 14,
            Div15 = 15,
            Div16 = 16,
            Div17 = 17,
            Div18 = 18,
            Div19 = 19,
            Div20 = 20,
            Div21 = 21,
            Div22 = 22,
            Div23 = 23,
            Div24 = 24,
            Div25 = 25,
            Div26 = 26,
            Div27 = 27,
            Div28 = 28,
            Div29 = 29,
            Div30 = 30,
            Div31 = 31,
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
        pub const RCC_ADCSEL = enum(u2) {
            PLL1_Q = 1,
            SYS = 3,
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
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_MSI,
            RCC_PLLSOURCE_HSI,

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
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                    .RCC_USART1CLKSOURCE_PCLK2 => .PCLK2,
                };
            }
            pub fn from_enum(item: RCC_USART1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
                    .PCLK2 => .RCC_USART1CLKSOURCE_PCLK2,
                };
            }
        };

        pub const USART2CLockSelectionList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART2CLKSOURCE_HSI => .HSI,
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                };
            }
        };

        pub const USART3CLockSelectionList = enum {
            RCC_USART3CLKSOURCE_PCLK1,
            RCC_USART3CLKSOURCE_SYSCLK,
            RCC_USART3CLKSOURCE_HSI,
            RCC_USART3CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_USART3CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .SYS => .RCC_USART3CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
                };
            }
        };

        pub const UART4CLockSelectionList = enum {
            RCC_UART4CLKSOURCE_PCLK1,
            RCC_UART4CLKSOURCE_SYSCLK,
            RCC_UART4CLKSOURCE_HSI,
            RCC_UART4CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_UART4CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_UART4CLKSOURCE_HSI => .HSI,
                    .RCC_UART4CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART4CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_UART4CLKSOURCE_PCLK1,
                    .HSI => .RCC_UART4CLKSOURCE_HSI,
                    .SYS => .RCC_UART4CLKSOURCE_SYSCLK,
                    .LSE => .RCC_UART4CLKSOURCE_LSE,
                };
            }
        };

        pub const UART5CLockSelectionList = enum {
            RCC_UART5CLKSOURCE_PCLK1,
            RCC_UART5CLKSOURCE_SYSCLK,
            RCC_UART5CLKSOURCE_HSI,
            RCC_UART5CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_UART5CLKSOURCE_LSE => .LSE,
                    .RCC_UART5CLKSOURCE_HSI => .HSI,
                    .RCC_UART5CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART5CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_UART5CLKSOURCE_LSE,
                    .HSI => .RCC_UART5CLKSOURCE_HSI,
                    .SYS => .RCC_UART5CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_UART5CLKSOURCE_PCLK1,
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
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPUART1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_LPUART1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PCLK1 => .RCC_LPUART1CLKSOURCE_PCLK1,
                    .SYS => .RCC_LPUART1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const LPTIM1CLockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_PCLK,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_HSI,
            RCC_LPTIM1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM1SEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_PCLK => .PCLK1,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_PCLK,
                    .HSI => .RCC_LPTIM1CLKSOURCE_HSI,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                };
            }
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

        pub const SWPMI1CLockSelectionList = enum {
            RCC_SWPMI1CLKSOURCE_PCLK,
            RCC_SWPMI1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SWPMI1SEL {
                return switch (self) {
                    .RCC_SWPMI1CLKSOURCE_HSI => .HSI,
                    .RCC_SWPMI1CLKSOURCE_PCLK => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_SWPMI1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SWPMI1CLKSOURCE_HSI,
                    .PCLK1 => .RCC_SWPMI1CLKSOURCE_PCLK,
                };
            }
        };

        pub const DFSDMCLockSelectionList = enum {
            RCC_DFSDM1CLKSOURCE_PCLK,
            RCC_DFSDM1CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_DFSDMSEL {
                return switch (self) {
                    .RCC_DFSDM1CLKSOURCE_PCLK => .PCLK2,
                    .RCC_DFSDM1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_DFSDMSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK2 => .RCC_DFSDM1CLKSOURCE_PCLK,
                    .SYS => .RCC_DFSDM1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCCLKSOURCE_PLLSAI1,
            RCC_ADCCLKSOURCE_PLLSAI2,
            RCC_ADCCLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADCCLKSOURCE_PLLSAI1 => .PLL1_Q,
                    .RCC_ADCCLKSOURCE_SYSCLK => .SYS,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "ADCCLockSelection", @tagName(self), "RCC_ADCSEL" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_ADCCLKSOURCE_PLLSAI1,
                    .SYS => .RCC_ADCCLKSOURCE_SYSCLK,
                };
            }
        };

        pub const CK48CLockSelectionList = enum {
            RCC_USBCLKSOURCE_PLLSAI1,
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_MSI,
            RCC_USBCLKSOURCE_HSI48,

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

        pub const I2C2CLockSelectionList = enum {
            RCC_I2C2CLKSOURCE_PCLK1,
            RCC_I2C2CLKSOURCE_SYSCLK,
            RCC_I2C2CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C2SEL {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2C2SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_I2C2CLKSOURCE_PCLK1,
                    .SYS => .RCC_I2C2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C2CLKSOURCE_HSI,
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
            RCC_SAI1CLKSOURCE_PLLSAI2,
            RCC_SAI1CLKSOURCE_PLL,
            RCC_SAI1CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_SAI1SEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PIN => .SAI1_EXTCLK,
                    .RCC_SAI1CLKSOURCE_PLL => .PLL1_P,
                    .RCC_SAI1CLKSOURCE_PLLSAI2 => .PLLSAI2_P,
                    .RCC_SAI1CLKSOURCE_PLLSAI1 => .PLLSAI1_P,
                };
            }
            pub fn from_enum(item: RCC_SAI1SEL) anyerror!@This() {
                return switch (item) {
                    .SAI1_EXTCLK => .RCC_SAI1CLKSOURCE_PIN,
                    .PLL1_P => .RCC_SAI1CLKSOURCE_PLL,
                    .PLLSAI2_P => .RCC_SAI1CLKSOURCE_PLLSAI2,
                    .PLLSAI1_P => .RCC_SAI1CLKSOURCE_PLLSAI1,
                };
            }
        };

        pub const SAI2CLockSelectionList = enum {
            RCC_SAI2CLKSOURCE_PLLSAI1,
            RCC_SAI2CLKSOURCE_PLLSAI2,
            RCC_SAI2CLKSOURCE_PLL,
            RCC_SAI2CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_SAI2SEL {
                return switch (self) {
                    .RCC_SAI2CLKSOURCE_PLLSAI2 => .PLLSAI2_P,
                    .RCC_SAI2CLKSOURCE_PIN => .SAI2_EXTCLK,
                    .RCC_SAI2CLKSOURCE_PLLSAI1 => .PLLSAI1_P,
                    .RCC_SAI2CLKSOURCE_PLL => .PLL1_P,
                };
            }
            pub fn from_enum(item: RCC_SAI2SEL) anyerror!@This() {
                return switch (item) {
                    .PLLSAI2_P => .RCC_SAI2CLKSOURCE_PLLSAI2,
                    .SAI2_EXTCLK => .RCC_SAI2CLKSOURCE_PIN,
                    .PLLSAI1_P => .RCC_SAI2CLKSOURCE_PLLSAI1,
                    .PLL1_P => .RCC_SAI2CLKSOURCE_PLL,
                };
            }
        };

        pub const I2C4CLockSelectionList = enum {
            RCC_I2C4CLKSOURCE_PCLK1,
            RCC_I2C4CLKSOURCE_SYSCLK,
            RCC_I2C4CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C2SEL {
                return switch (self) {
                    .RCC_I2C4CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C4CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C4CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2C2SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_I2C4CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2C4CLKSOURCE_PCLK1,
                    .HSI => .RCC_I2C4CLKSOURCE_HSI,
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
            RCC_MCO1SOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_MSI => .MSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
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
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
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

        pub const LSCOSource1List = enum {
            RCC_LSCOSOURCE_LSI,
            RCC_LSCOSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LSCOSEL {
                return switch (self) {
                    .RCC_LSCOSOURCE_LSI => .LSI,
                    .RCC_LSCOSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LSCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_LSCOSOURCE_LSI,
                    .LSE => .RCC_LSCOSOURCE_LSE,
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
            RCC_PLLQ_DIV4,
            RCC_PLLQ_DIV6,
            RCC_PLLQ_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLQ {
                return switch (self) {
                    .RCC_PLLQ_DIV6 => .Div6,
                    .RCC_PLLQ_DIV8 => .Div8,
                    .RCC_PLLQ_DIV2 => .Div2,
                    .RCC_PLLQ_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PLLQ) anyerror!@This() {
                return switch (item) {
                    .Div6 => .RCC_PLLQ_DIV6,
                    .Div8 => .RCC_PLLQ_DIV8,
                    .Div2 => .RCC_PLLQ_DIV2,
                    .Div4 => .RCC_PLLQ_DIV4,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLQ_DIV2 => 2,
                    .RCC_PLLQ_DIV4 => 4,
                    .RCC_PLLQ_DIV6 => 6,
                    .RCC_PLLQ_DIV8 => 8,
                };
            }
        };

        pub const PLLRList = enum {
            RCC_PLLR_DIV2,
            RCC_PLLR_DIV4,
            RCC_PLLR_DIV6,
            RCC_PLLR_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLR {
                return switch (self) {
                    .RCC_PLLR_DIV2 => .Div2,
                    .RCC_PLLR_DIV6 => .Div6,
                    .RCC_PLLR_DIV4 => .Div4,
                    .RCC_PLLR_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PLLR) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLR_DIV2,
                    .Div6 => .RCC_PLLR_DIV6,
                    .Div4 => .RCC_PLLR_DIV4,
                    .Div8 => .RCC_PLLR_DIV8,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLR_DIV2 => 2,
                    .RCC_PLLR_DIV4 => 4,
                    .RCC_PLLR_DIV6 => 6,
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

        pub const PLLSAI1QList = enum {
            RCC_PLLQ_DIV2,
            RCC_PLLQ_DIV4,
            RCC_PLLQ_DIV6,
            RCC_PLLQ_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLQ_DIV6 => .Div6,
                    .RCC_PLLQ_DIV8 => .Div8,
                    .RCC_PLLQ_DIV2 => .Div2,
                    .RCC_PLLQ_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div6 => .RCC_PLLQ_DIV6,
                    .Div8 => .RCC_PLLQ_DIV8,
                    .Div2 => .RCC_PLLQ_DIV2,
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
                    .RCC_PLLQ_DIV4 => 4,
                    .RCC_PLLQ_DIV6 => 6,
                    .RCC_PLLQ_DIV8 => 8,
                };
            }
        };

        pub const PLLSAI1RList = enum {
            RCC_PLLR_DIV2,
            RCC_PLLR_DIV4,
            RCC_PLLR_DIV6,
            RCC_PLLR_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLR_DIV2 => .Div2,
                    .RCC_PLLR_DIV6 => .Div6,
                    .RCC_PLLR_DIV4 => .Div4,
                    .RCC_PLLR_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLR_DIV2,
                    .Div6 => .RCC_PLLR_DIV6,
                    .Div4 => .RCC_PLLR_DIV4,
                    .Div8 => .RCC_PLLR_DIV8,
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
                    .RCC_PLLR_DIV4 => 4,
                    .RCC_PLLR_DIV6 => 6,
                    .RCC_PLLR_DIV8 => 8,
                };
            }
        };

        pub const PLLSAI2PList = enum {
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

        pub const PLLSAI2RList = enum {
            RCC_PLLR_DIV2,
            RCC_PLLR_DIV4,
            RCC_PLLR_DIV6,
            RCC_PLLR_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLR_DIV2 => .Div2,
                    .RCC_PLLR_DIV6 => .Div6,
                    .RCC_PLLR_DIV4 => .Div4,
                    .RCC_PLLR_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLR_DIV2,
                    .Div6 => .RCC_PLLR_DIV6,
                    .Div4 => .RCC_PLLR_DIV4,
                    .Div8 => .RCC_PLLR_DIV8,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLP", @tagName(item), "PLLSAI2R" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLR_DIV2 => 2,
                    .RCC_PLLR_DIV4 => 4,
                    .RCC_PLLR_DIV6 => 6,
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
            FLASH_LATENCY_3,
            FLASH_LATENCY_4,
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE1,

            pub fn to_enum(self: @This()) anyerror!PWR_LPR {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .LowPowerMode,
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .MainMode,
                };
            }
            pub fn from_enum(item: PWR_LPR) anyerror!@This() {
                return switch (item) {
                    .LowPowerMode => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .MainMode => .PWR_REGULATOR_VOLTAGE_SCALE2,
                };
            }
        };

        pub const MSIAutoCalibrationList = enum {
            ENABLED,
            DISABLED,
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
                    .RCC_CRS_SYNC_SOURCE_LSE => .LSE,
                    .RCC_CRS_SYNC_SOURCE_GPIO => .GPIO,
                    .RCC_CRS_SYNC_SOURCE_USB => .USB,
                };
            }
            pub fn from_enum(item: CRS_SYNCSRC) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_CRS_SYNC_SOURCE_LSE,
                    .GPIO => .RCC_CRS_SYNC_SOURCE_GPIO,
                    .USB => .RCC_CRS_SYNC_SOURCE_USB,
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

        pub const EnableExtClockForSAI1List = enum {
            true,
            false,
        };

        pub const EnableExtClockForSAI2List = enum {
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

        pub const USART2EnableList = enum {
            true,
            false,
        };

        pub const USART3EnableList = enum {
            true,
            false,
        };

        pub const UART4EnableList = enum {
            true,
            false,
        };

        pub const UART5EnableList = enum {
            true,
            false,
        };

        pub const LPUART1EnableList = enum {
            true,
            false,
        };

        pub const LPTIM1EnableList = enum {
            true,
            false,
        };

        pub const LPTIM2EnableList = enum {
            true,
            false,
        };

        pub const SWPMIEnableList = enum {
            true,
            false,
        };

        pub const DFSDMEnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const SDMMCEnableList = enum {
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

        pub const I2C2EnableList = enum {
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

        pub const SAI2EnableList = enum {
            true,
            false,
        };

        pub const I2C4EnableList = enum {
            true,
            false,
        };

        pub const MCOEnableList = enum {
            true,
            false,
        };

        pub const LSCOEnableList = enum {
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

        //=======ClockTree Flags========

        pub const Flags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            SAI2EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            USE_ADC3: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            SAI2Used_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            EnableCSS: bool = false,
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
            SAI2EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            USE_ADC3: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            SAI2Used_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            EnableCSS: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            EnableExtClockForSAI1: bool = false, //Reference flag
            EnableExtClockForSAI2: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            UART4Enable: bool = false, //Reference flag
            UART5Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            SWPMIEnable: bool = false, //Reference flag
            DFSDMEnable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            SDMMCEnable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            SAI2Enable: bool = false, //Reference flag
            I2C4Enable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            PLLSAI1Used: bool = false, //Reference flag
            PLLSAI2Used: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            MSIUsed: bool = false, //Reference flag
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
            HSI48CalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            LSEState: ?LSEStateList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?MSIClockRangeList = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?u32 = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            USART2CLockSelection: ?USART2CLockSelectionList = null,
            USART3CLockSelection: ?USART3CLockSelectionList = null,
            UART4CLockSelection: ?UART4CLockSelectionList = null,
            UART5CLockSelection: ?UART5CLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            LPTIM2CLockSelection: ?LPTIM2CLockSelectionList = null,
            SWPMI1CLockSelection: ?SWPMI1CLockSelectionList = null,
            DFSDMCLockSelection: ?DFSDMCLockSelectionList = null,
            ADCCLockSelection: ?ADCCLockSelectionList = null,
            CK48CLockSelection: ?CK48CLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C2CLockSelection: ?I2C2CLockSelectionList = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
            SAI2CLockSelection: ?SAI2CLockSelectionList = null,
            I2C4CLockSelection: ?I2C4CLockSelectionList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            LSCOSource1: ?LSCOSource1List = null,
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
            PLLSAI2N: ?u32 = null,
            PLLSAI2P: ?PLLSAI2PList = null,
            PLLSAI2R: ?PLLSAI2RList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            MSIClockRange: MSIClockRangeList,
            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLM: u32,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            USART2CLockSelection: USART2CLockSelectionList,
            USART3CLockSelection: USART3CLockSelectionList,
            UART4CLockSelection: UART4CLockSelectionList,
            UART5CLockSelection: UART5CLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            LPTIM2CLockSelection: LPTIM2CLockSelectionList,
            SWPMI1CLockSelection: SWPMI1CLockSelectionList,
            DFSDMCLockSelection: DFSDMCLockSelectionList,
            ADCCLockSelection: ADCCLockSelectionList,
            CK48CLockSelection: CK48CLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C2CLockSelection: I2C2CLockSelectionList,
            I2C3CLockSelection: I2C3CLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
            SAI2CLockSelection: SAI2CLockSelectionList,
            I2C4CLockSelection: I2C4CLockSelectionList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv: RCC_MCODivList,
            LSCOSource1: LSCOSource1List,
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
            PLLSAI2N: u32,
            PLLSAI2P: PLLSAI2PList,
            PLLSAI2R: PLLSAI2RList,
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
            HSI48CalibrationValue: ?u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
            LSEState: LSEStateList,
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
            PWR_Regulator_Voltage_Scale: ?PWR_LPR = null,
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
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
            LSEState: ?LSEStateList = null,
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
                    .HSI48CalibrationValue = self.HSI48CalibrationValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .LSEState = self.LSEState,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?RCC_MSIRANGE = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?u32 = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelection: ?RCC_USART1SEL = null,
            USART2CLockSelection: ?RCC_USARTSEL = null,
            USART3CLockSelection: ?RCC_USARTSEL = null,
            UART4CLockSelection: ?RCC_USARTSEL = null,
            UART5CLockSelection: ?RCC_USARTSEL = null,
            LPUART1CLockSelection: ?RCC_LPUART1SEL = null,
            LPTIM1CLockSelection: ?RCC_LPTIM1SEL = null,
            LPTIM2CLockSelection: ?RCC_LPTIM2SEL = null,
            SWPMI1CLockSelection: ?RCC_SWPMI1SEL = null,
            DFSDMCLockSelection: ?RCC_DFSDMSEL = null,
            ADCCLockSelection: ?RCC_ADCSEL = null,
            CK48CLockSelection: ?RCC_CLK48SEL = null,
            I2C1CLockSelection: ?RCC_I2C1SEL = null,
            I2C2CLockSelection: ?RCC_I2C2SEL = null,
            I2C3CLockSelection: ?RCC_I2C3SEL = null,
            SAI1CLockSelection: ?RCC_SAI1SEL = null,
            SAI2CLockSelection: ?RCC_SAI2SEL = null,
            I2C4CLockSelection: ?RCC_I2C2SEL = null,
            RCC_MCO1Source: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            LSCOSource1: ?RCC_LSCOSEL = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            PLLN: ?u32 = null,
            PLLP: ?RCC_PLLP = null,
            PLLQ: ?RCC_PLLQ = null,
            PLLR: ?RCC_PLLR = null,
            PLLSAI1N: ?u32 = null,
            PLLSAI1P: ?RCC_PLLP = null,
            PLLSAI1Q: ?RCC_PLLP = null,
            PLLSAI1R: ?RCC_PLLP = null,
            PLLSAI2N: ?u32 = null,
            PLLSAI2P: ?RCC_PLLP = null,
            PLLSAI2R: ?RCC_PLLP = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .MSIClockRange = if (self.MSIClockRange) |val| try MSIClockRangeList.from_enum(val) else null,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = self.PLLM,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .USART2CLockSelection = if (self.USART2CLockSelection) |val| try USART2CLockSelectionList.from_enum(val) else null,
                    .USART3CLockSelection = if (self.USART3CLockSelection) |val| try USART3CLockSelectionList.from_enum(val) else null,
                    .UART4CLockSelection = if (self.UART4CLockSelection) |val| try UART4CLockSelectionList.from_enum(val) else null,
                    .UART5CLockSelection = if (self.UART5CLockSelection) |val| try UART5CLockSelectionList.from_enum(val) else null,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .LPTIM2CLockSelection = if (self.LPTIM2CLockSelection) |val| try LPTIM2CLockSelectionList.from_enum(val) else null,
                    .SWPMI1CLockSelection = if (self.SWPMI1CLockSelection) |val| try SWPMI1CLockSelectionList.from_enum(val) else null,
                    .DFSDMCLockSelection = if (self.DFSDMCLockSelection) |val| try DFSDMCLockSelectionList.from_enum(val) else null,
                    .ADCCLockSelection = if (self.ADCCLockSelection) |val| try ADCCLockSelectionList.from_enum(val) else null,
                    .CK48CLockSelection = if (self.CK48CLockSelection) |val| try CK48CLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C2CLockSelection = if (self.I2C2CLockSelection) |val| try I2C2CLockSelectionList.from_enum(val) else null,
                    .I2C3CLockSelection = if (self.I2C3CLockSelection) |val| try I2C3CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
                    .SAI2CLockSelection = if (self.SAI2CLockSelection) |val| try SAI2CLockSelectionList.from_enum(val) else null,
                    .I2C4CLockSelection = if (self.I2C4CLockSelection) |val| try I2C4CLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .LSCOSource1 = if (self.LSCOSource1) |val| try LSCOSource1List.from_enum(val) else null,
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
                    .PLLSAI2N = self.PLLSAI2N,
                    .PLLSAI2P = if (self.PLLSAI2P) |val| try PLLSAI2PList.from_enum(val) else null,
                    .PLLSAI2R = if (self.PLLSAI2R) |val| try PLLSAI2RList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            MSIClockRange: RCC_MSIRANGE,
            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLM: u32,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelection: RCC_USART1SEL,
            USART2CLockSelection: RCC_USARTSEL,
            USART3CLockSelection: RCC_USARTSEL,
            UART4CLockSelection: RCC_USARTSEL,
            UART5CLockSelection: RCC_USARTSEL,
            LPUART1CLockSelection: RCC_LPUART1SEL,
            LPTIM1CLockSelection: RCC_LPTIM1SEL,
            LPTIM2CLockSelection: RCC_LPTIM2SEL,
            SWPMI1CLockSelection: RCC_SWPMI1SEL,
            DFSDMCLockSelection: RCC_DFSDMSEL,
            ADCCLockSelection: RCC_ADCSEL,
            CK48CLockSelection: RCC_CLK48SEL,
            I2C1CLockSelection: RCC_I2C1SEL,
            I2C2CLockSelection: RCC_I2C2SEL,
            I2C3CLockSelection: RCC_I2C3SEL,
            SAI1CLockSelection: RCC_SAI1SEL,
            SAI2CLockSelection: RCC_SAI2SEL,
            I2C4CLockSelection: RCC_I2C2SEL,
            RCC_MCO1Source: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            LSCOSource1: RCC_LSCOSEL,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            PLLN: u32,
            PLLP: RCC_PLLP,
            PLLQ: RCC_PLLQ,
            PLLR: RCC_PLLR,
            PLLSAI1N: u32,
            PLLSAI1P: RCC_PLLP,
            PLLSAI1Q: RCC_PLLP,
            PLLSAI1R: RCC_PLLP,
            PLLSAI2N: u32,
            PLLSAI2P: RCC_PLLP,
            PLLSAI2R: RCC_PLLP,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_LPR,
            MSIAutoCalibration: MSIAutoCalibrationList,
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

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .MSIClockRange = try cubemx_config.MSIClockRange.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = cubemx_config.PLLM,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .USART2CLockSelection = try cubemx_config.USART2CLockSelection.to_enum(),
                    .USART3CLockSelection = try cubemx_config.USART3CLockSelection.to_enum(),
                    .UART4CLockSelection = try cubemx_config.UART4CLockSelection.to_enum(),
                    .UART5CLockSelection = try cubemx_config.UART5CLockSelection.to_enum(),
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .LPTIM2CLockSelection = try cubemx_config.LPTIM2CLockSelection.to_enum(),
                    .SWPMI1CLockSelection = try cubemx_config.SWPMI1CLockSelection.to_enum(),
                    .DFSDMCLockSelection = try cubemx_config.DFSDMCLockSelection.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .CK48CLockSelection = try cubemx_config.CK48CLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C2CLockSelection = try cubemx_config.I2C2CLockSelection.to_enum(),
                    .I2C3CLockSelection = try cubemx_config.I2C3CLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
                    .SAI2CLockSelection = try cubemx_config.SAI2CLockSelection.to_enum(),
                    .I2C4CLockSelection = try cubemx_config.I2C4CLockSelection.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .LSCOSource1 = try cubemx_config.LSCOSource1.to_enum(),
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
                    .PLLSAI2N = cubemx_config.PLLSAI2N,
                    .PLLSAI2P = try cubemx_config.PLLSAI2P.to_enum(),
                    .PLLSAI2R = try cubemx_config.PLLSAI2R.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .MSICalibrationValue = cubemx_config.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
                    .MSIAutoCalibration = cubemx_config.MSIAutoCalibration,
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
            LSEOSC: u32 = 0,
            MSIRC: u32 = 0,
            SAI1_EXT: u32 = 0,
            SAI2_EXT: u32 = 0,
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
            USART2Mult: u32 = 0,
            USART2output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3output: u32 = 0,
            UART4Mult: u32 = 0,
            UART4output: u32 = 0,
            UART5Mult: u32 = 0,
            UART5output: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            LPTIM2Mult: u32 = 0,
            LPTIM2output: u32 = 0,
            SWPMIMult: u32 = 0,
            SWPMIoutput: u32 = 0,
            DFSDMMult: u32 = 0,
            DFSDMoutput: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            CK48Mult: u32 = 0,
            CK48output: u32 = 0,
            SDMMCoutput: u32 = 0,
            RNGoutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3output: u32 = 0,
            SAI1Mult: u32 = 0,
            SAI1output: u32 = 0,
            SAI2Mult: u32 = 0,
            SAI2output: u32 = 0,
            I2C4Mult: u32 = 0,
            I2C4output: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
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
            PLLSAI2N: u32 = 0,
            PLLSAI2P: u32 = 0,
            PLLSAI2Poutput: u32 = 0,
            PLLSAI2R: u32 = 0,
            PLLSAI2Routput: u32 = 0,
            MSI: u32 = 0,
            VCOInput: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            VCOSAI1Output: u32 = 0,
            VCOSAI2Output: u32 = 0,
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
            var USART2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SWPMISourcePCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var SWPMISourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMSourcePCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLLSAI1R: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLLSAI2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLLSAI1: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLSAI1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLSAI2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLP: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLLSAI1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLLSAI2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLLP: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY1: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var SAI1_EXT = ClockNode{
                .name = "SAI1_EXT",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI2_EXT = ClockNode{
                .name = "SAI2_EXT",
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

            var USART3Mult = ClockNode{
                .name = "USART3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART3output = ClockNode{
                .name = "USART3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART4Mult = ClockNode{
                .name = "UART4Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART4output = ClockNode{
                .name = "UART4output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART5Mult = ClockNode{
                .name = "UART5Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART5output = ClockNode{
                .name = "UART5output",
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

            var SWPMIMult = ClockNode{
                .name = "SWPMIMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SWPMIoutput = ClockNode{
                .name = "SWPMIoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DFSDMMult = ClockNode{
                .name = "DFSDMMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DFSDMoutput = ClockNode{
                .name = "DFSDMoutput",
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

            var SDMMCoutput = ClockNode{
                .name = "SDMMCoutput",
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

            var SAI2Mult = ClockNode{
                .name = "SAI2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI2output = ClockNode{
                .name = "SAI2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C4Mult = ClockNode{
                .name = "I2C4Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C4output = ClockNode{
                .name = "I2C4output",
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

            var PLLSAI2N = ClockNode{
                .name = "PLLSAI2N",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI2P = ClockNode{
                .name = "PLLSAI2P",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI2Poutput = ClockNode{
                .name = "PLLSAI2Poutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI2R = ClockNode{
                .name = "PLLSAI2R",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAI2Routput = ClockNode{
                .name = "PLLSAI2Routput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MSI = ClockNode{
                .name = "MSI",
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

            var VCOSAI2Output = ClockNode{
                .name = "VCOSAI2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const LSI_VALUEValue: f32 = blk: {
                break :blk 3.2e4;
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

            const EXTERNALSAI1_CLOCK_VALUEValue: f32 = blk: {
                break :blk 2.097e6;
            };

            const EXTERNALSAI2_CLOCK_VALUEValue: f32 = blk: {
                break :blk 2.097e6;
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
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((config.flags.USB_OTG_FSUsed_ForRCC and (CK48SourcePLLCLK or CK48SourcePLLSAI1))) {
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
                                    "(USB_OTG_FSUsed_ForRCC & (CK48SourcePLLCLK| CK48SourcePLLSAI1)) ",
                                    "PLL Mux should have HSE as input",
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

            const PLLMValue: u32 = blk: {
                const user_val = config.PLLM;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLM",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 8) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLM",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
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

            const USART2CLockSelectionValue: USART2CLockSelectionList = blk: {
                const user_val = config.USART2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART2CLKSOURCE_PCLK1 => USART2SourcePCLK1 = true,
                        .RCC_USART2CLKSOURCE_SYSCLK => USART2SourceSys = true,
                        .RCC_USART2CLKSOURCE_HSI => USART2SourceHSI = true,
                        .RCC_USART2CLKSOURCE_LSE => USART2SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART2SourcePCLK1 = true;
                    break :blk .RCC_USART2CLKSOURCE_PCLK1;
                };
            };

            const USART3CLockSelectionValue: USART3CLockSelectionList = blk: {
                const user_val = config.USART3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART3CLKSOURCE_PCLK1 => USART3SourcePCLK1 = true,
                        .RCC_USART3CLKSOURCE_SYSCLK => USART3SourceSys = true,
                        .RCC_USART3CLKSOURCE_HSI => USART3SourceHSI = true,
                        .RCC_USART3CLKSOURCE_LSE => USART3SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART3SourcePCLK1 = true;
                    break :blk .RCC_USART3CLKSOURCE_PCLK1;
                };
            };

            const UART4CLockSelectionValue: UART4CLockSelectionList = blk: {
                const user_val = config.UART4CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART4CLKSOURCE_PCLK1 => UART4SourcePCLK1 = true,
                        .RCC_UART4CLKSOURCE_SYSCLK => UART4Sourcesys = true,
                        .RCC_UART4CLKSOURCE_HSI => UART4SourceHSI = true,
                        .RCC_UART4CLKSOURCE_LSE => UART4SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    UART4SourcePCLK1 = true;
                    break :blk .RCC_UART4CLKSOURCE_PCLK1;
                };
            };

            const UART5CLockSelectionValue: UART5CLockSelectionList = blk: {
                const user_val = config.UART5CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART5CLKSOURCE_PCLK1 => UART5SourcePCLK1 = true,
                        .RCC_UART5CLKSOURCE_SYSCLK => UART5Sourcesys = true,
                        .RCC_UART5CLKSOURCE_HSI => UART5SourceHSI = true,
                        .RCC_UART5CLKSOURCE_LSE => UART5SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    UART5SourcePCLK1 = true;
                    break :blk .RCC_UART5CLKSOURCE_PCLK1;
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

            const LPTIM1CLockSelectionValue: LPTIM1CLockSelectionList = blk: {
                const user_val = config.LPTIM1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_PCLK => {},
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1SOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK;
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

            const SWPMI1CLockSelectionValue: SWPMI1CLockSelectionList = blk: {
                const user_val = config.SWPMI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SWPMI1CLKSOURCE_PCLK => SWPMISourcePCLK = true,
                        .RCC_SWPMI1CLKSOURCE_HSI => SWPMISourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    SWPMISourcePCLK = true;
                    break :blk .RCC_SWPMI1CLKSOURCE_PCLK;
                };
            };

            const DFSDMCLockSelectionValue: DFSDMCLockSelectionList = blk: {
                const user_val = config.DFSDMCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DFSDM1CLKSOURCE_PCLK => DFSDMSourcePCLK = true,
                        .RCC_DFSDM1CLKSOURCE_SYSCLK => DFSDMSourceSys = true,
                    }
                }
                break :blk user_val orelse {
                    DFSDMSourcePCLK = true;
                    break :blk .RCC_DFSDM1CLKSOURCE_PCLK;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_PLLSAI1 => ADCSourcePLLSAI1R = true,
                        .RCC_ADCCLKSOURCE_PLLSAI2 => ADCSourcePLLSAI2R = true,
                        .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                    }
                }
                break :blk user_val orelse {
                    ADCSourcePLLSAI1R = true;
                    break :blk .RCC_ADCCLKSOURCE_PLLSAI1;
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
                        .RCC_SAI1CLKSOURCE_PLLSAI2 => SAI1SourcePLLSAI2P = true,
                        .RCC_SAI1CLKSOURCE_PLL => SAI1SourcePLLP = true,
                        .RCC_SAI1CLKSOURCE_PIN => SAI1SourceEXT = true,
                    }
                }
                break :blk user_val orelse {
                    SAI1SourcePLLSAI1P = true;
                    break :blk .RCC_SAI1CLKSOURCE_PLLSAI1;
                };
            };

            const SAI2CLockSelectionValue: SAI2CLockSelectionList = blk: {
                const user_val = config.SAI2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI2CLKSOURCE_PLLSAI1 => SAI2SourcePLLSAI1P = true,
                        .RCC_SAI2CLKSOURCE_PLLSAI2 => SAI2SourcePLLSAI2P = true,
                        .RCC_SAI2CLKSOURCE_PLL => SAI2SourcePLLP = true,
                        .RCC_SAI2CLKSOURCE_PIN => SAI2SourceEXT = true,
                    }
                }
                break :blk user_val orelse {
                    SAI2SourcePLLSAI1P = true;
                    break :blk .RCC_SAI2CLKSOURCE_PLLSAI1;
                };
            };

            const I2C4CLockSelectionValue: I2C4CLockSelectionList = blk: {
                const user_val = config.I2C4CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C4CLKSOURCE_PCLK1 => I2C4SourcePCLK1 = true,
                        .RCC_I2C4CLKSOURCE_SYSCLK => I2C4SourceSys = true,
                        .RCC_I2C4CLKSOURCE_HSI => I2C4SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C4SourcePCLK1 = true;
                    break :blk .RCC_I2C4CLKSOURCE_PCLK1;
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
                        .RCC_PLLQ_DIV4 => {},
                        .RCC_PLLQ_DIV6 => {},
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
                        .RCC_PLLR_DIV4 => {},
                        .RCC_PLLR_DIV6 => {},
                        .RCC_PLLR_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLR_DIV2;
            };

            const PLLSAI1NValue: u32 = blk: {
                const user_val = config.PLLSAI1N;
                if (user_val) |val| {
                    if (val < 8) {
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
                        .RCC_PLLQ_DIV4 => {},
                        .RCC_PLLQ_DIV6 => {},
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
                        .RCC_PLLR_DIV4 => {},
                        .RCC_PLLR_DIV6 => {},
                        .RCC_PLLR_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLR_DIV2;
            };

            const PLLSAI2NValue: u32 = blk: {
                const user_val = config.PLLSAI2N;
                if (user_val) |val| {
                    if (val < 8) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAI2N",
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
                            "PLLSAI2N",
                            "Else",
                            "No additional information",
                            86,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 8;
            };

            const PLLSAI2PValue: PLLSAI2PList = blk: {
                const user_val = config.PLLSAI2P;

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

            const PLLSAI2RValue: PLLSAI2RList = blk: {
                const user_val = config.PLLSAI2R;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLR_DIV2 => {},
                        .RCC_PLLR_DIV4 => {},
                        .RCC_PLLR_DIV6 => {},
                        .RCC_PLLR_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLR_DIV2;
            };

            const MSI_VALUEValue: f32 = blk: {
                break :blk 4e6;
            };

            const VDD_VALUEValue: f32 = blk: {
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
                            "Else",
                            "No additional information",
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
                if (((SAI1SourcePLLP and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLP and config.flags.SAI2Used_ForRCC)) or (SysSourcePLL) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)) or (CK48SourcePLLCLK and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLLSAI1UsedValue: u1 = blk: {
                if (((SAI1SourcePLLSAI1P and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLSAI1P and config.flags.SAI2Used_ForRCC)) or (ADCSourcePLLSAI1R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) or (CK48SourcePLLSAI1 and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLLSAI2UsedValue: u1 = blk: {
                if (((SAI1SourcePLLSAI2P and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLSAI2P and config.flags.SAI2Used_ForRCC)) or (ADCSourcePLLSAI2R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((USART1SourceHSI and config.flags.USART1Used_ForRCC) or (USART2SourceHSI and config.flags.USART2Used_ForRCC) or (USART3SourceHSI and config.flags.USART3Used_ForRCC) or (UART4SourceHSI and config.flags.UART4Used_ForRCC) or (UART5SourceHSI and config.flags.UART5Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCEHSI and config.flags.LPTIM2Used_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C2SourceHSI and config.flags.I2C2Used_ForRCC) or (I2C3SourceHSI and config.flags.I2C3Used_ForRCC) or (I2C4SourceHSI and config.flags.I2C4Used_ForRCC) or (SWPMISourceHSI and config.flags.SWPMI1Used_ForRCC) or ((PLLSourceHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI2UsedValue), PLLSAI2UsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig))))) {
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
                if ((check_MCU("SEM2RCC_MSI_REQUIRED_TIM17") and check_MCU("TIM17") and check_MCU("Semaphore_input_Channel1TIM17")) or (CK48SourceMSI and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC)) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_MSI, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)) or (PLLSourceMSI and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI2UsedValue), PLLSAI2UsedValue, 1, .@"=")))) {
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
                if (CK48SourceMSI or (config.flags.USB_OTG_FSUsed_ForRCC and CK48SourcePLLCLK and PLLSourceMSI) or (config.flags.USB_OTG_FSUsed_ForRCC and CK48SourcePLLSAI1 and PLLSourceMSI)) {
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
                                "CK48SourceMSI|(USB_OTG_FSUsed_ForRCC&CK48SourcePLLCLK&PLLSourceMSI)|(USB_OTG_FSUsed_ForRCC&CK48SourcePLLSAI1&PLLSourceMSI)",
                                "",
                                "ENABLED",
                                val,
                            });
                        }
                    }
                    MSIAutoCalibrationON = true;
                    break :blk .ENABLED;
                } else if (check_ref(@TypeOf(LSEStateValue), LSEStateValue, .RCC_LSE_OFF, .@"=")) {
                    const user_val = config.extra_config.MSIAutoCalibration;

                    if (user_val) |val| {
                        switch (val) {
                            .DISABLED => {},
                            .ENABLED => MSIAutoCalibrationON = true,
                        }
                    }
                    break :blk user_val orelse .DISABLED;
                }
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
                            "CK48SourceMSI|(USB_OTG_FSUsed_ForRCC&CK48SourcePLLCLK&PLLSourceMSI)|(USB_OTG_FSUsed_ForRCC&CK48SourcePLLSAI1&PLLSourceMSI)",
                            "",
                            "ENABLED",
                            val,
                        });
                    }
                }
                MSIAutoCalibrationON = true;
                break :blk .ENABLED;
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
                if (MSIAutoCalibrationON or (LSCOSSourceLSE and config.flags.LSCOConfig) or (check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM16")) or (check_MCU("SEM2RCC_LSE_REQUIRED_TIM2") and check_MCU("Semaphore_TIM2_L4_ETR_REMAPTIM2") and check_MCU("TIM2")) or (check_MCU("Semaphore_input_Channel1_directTIM15") and true and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM15")) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (USART2SourceLSE and config.flags.USART2Used_ForRCC) or (USART3SourceLSE and config.flags.USART3Used_ForRCC) or (UART4SourceLSE and config.flags.UART4Used_ForRCC) or (UART5SourceLSE and config.flags.UART5Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCELSE and config.flags.LPTIM2Used_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
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

            const EnableExtClockForSAI1Value: EnableExtClockForSAI1List = blk: {
                if (config.flags.SAI1EXTCLK) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableExtClockForSAI2Value: EnableExtClockForSAI2List = blk: {
                if (config.flags.SAI2EXTCLK) {
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

            const USART2EnableValue: USART2EnableList = blk: {
                if (config.flags.USART2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART3EnableValue: USART3EnableList = blk: {
                if (config.flags.USART3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const UART4EnableValue: UART4EnableList = blk: {
                if (config.flags.UART4Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const UART5EnableValue: UART5EnableList = blk: {
                if (config.flags.UART5Used_ForRCC) {
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

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIM1Used_ForRCC) {
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

            const SWPMIEnableValue: SWPMIEnableList = blk: {
                if (config.flags.SWPMI1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const DFSDMEnableValue: DFSDMEnableList = blk: {
                if (config.flags.DFSDM1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USB_OTG_FSUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SDMMCEnableValue: SDMMCEnableList = blk: {
                if (config.flags.SDMMC1Used_ForRCC) {
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

            const I2C1EnableValue: I2C1EnableList = blk: {
                if (config.flags.I2C1Used_ForRCC) {
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

            const I2C3EnableValue: I2C3EnableList = blk: {
                if (config.flags.I2C3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if ((config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI2EnableValue: SAI2EnableList = blk: {
                if (config.flags.SAI2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C4EnableValue: I2C4EnableList = blk: {
                if (config.flags.I2C4Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig) {
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
                if ((CK48SourceHSI48 and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC)) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI48, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig))))) {
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
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE SAI1_EXT ======
            if (check_ref(@TypeOf(EnableExtClockForSAI1Value), EnableExtClockForSAI1Value, .true, .@"=")) {
                SAI1_EXT.nodetype = .source;
                SAI1_EXT.value = EXTERNALSAI1_CLOCK_VALUEValue;
            }
            // ======= NODE SAI2_EXT ======
            if (check_ref(@TypeOf(EnableExtClockForSAI2Value), EnableExtClockForSAI2Value, .true, .@"=")) {
                SAI2_EXT.nodetype = .source;
                SAI2_EXT.value = EXTERNALSAI2_CLOCK_VALUEValue;
            }
            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_MSI => &.{&MSIRC},
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
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
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE PLLM ======
            PLLM.nodetype = .div;
            PLLM.value = @floatFromInt(PLLMValue);
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
            // ======= NODE USART3Mult ======
            if (check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=")) {
                USART3Mult.nodetype = .multi;
                USART3Mult.parents = switch (USART3CLockSelectionValue) {
                    .RCC_USART3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_USART3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART3CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART3CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART3output ======
            if (check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=")) {
                USART3output.nodetype = .output;
                USART3output.parents = &.{&USART3Mult};
            }
            // ======= NODE UART4Mult ======
            if (check_ref(@TypeOf(UART4EnableValue), UART4EnableValue, .true, .@"=")) {
                UART4Mult.nodetype = .multi;
                UART4Mult.parents = switch (UART4CLockSelectionValue) {
                    .RCC_UART4CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_UART4CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_UART4CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_UART4CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE UART4output ======
            if (check_ref(@TypeOf(UART4EnableValue), UART4EnableValue, .true, .@"=")) {
                UART4output.nodetype = .output;
                UART4output.parents = &.{&UART4Mult};
            }
            // ======= NODE UART5Mult ======
            if (check_ref(@TypeOf(UART5EnableValue), UART5EnableValue, .true, .@"=")) {
                UART5Mult.nodetype = .multi;
                UART5Mult.parents = switch (UART5CLockSelectionValue) {
                    .RCC_UART5CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_UART5CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_UART5CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_UART5CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE UART5output ======
            if (check_ref(@TypeOf(UART5EnableValue), UART5EnableValue, .true, .@"=")) {
                UART5output.nodetype = .output;
                UART5output.parents = &.{&UART5Mult};
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
            // ======= NODE LPTIM1Mult ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1Mult.nodetype = .multi;
                LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                    .RCC_LPTIM1CLKSOURCE_PCLK => &.{&APB1Prescaler},
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
            // ======= NODE SWPMIMult ======
            if (check_ref(@TypeOf(SWPMIEnableValue), SWPMIEnableValue, .true, .@"=")) {
                SWPMIMult.nodetype = .multi;
                SWPMIMult.parents = switch (SWPMI1CLockSelectionValue) {
                    .RCC_SWPMI1CLKSOURCE_PCLK => &.{&APB1Prescaler},
                    .RCC_SWPMI1CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE SWPMIoutput ======
            if (check_ref(@TypeOf(SWPMIEnableValue), SWPMIEnableValue, .true, .@"=")) {
                SWPMIoutput.nodetype = .output;
                SWPMIoutput.parents = &.{&SWPMIMult};
            }
            // ======= NODE DFSDMMult ======
            if (check_ref(@TypeOf(DFSDMEnableValue), DFSDMEnableValue, .true, .@"=")) {
                DFSDMMult.nodetype = .multi;
                DFSDMMult.parents = switch (DFSDMCLockSelectionValue) {
                    .RCC_DFSDM1CLKSOURCE_PCLK => &.{&APB1Prescaler},
                    .RCC_DFSDM1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE DFSDMoutput ======
            if (check_ref(@TypeOf(DFSDMEnableValue), DFSDMEnableValue, .true, .@"=")) {
                DFSDMoutput.nodetype = .output;
                DFSDMoutput.parents = &.{&DFSDMMult};
            }
            // ======= NODE ADCMult ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                ADCMult.nodetype = .multi;
                ADCMult.parents = switch (ADCCLockSelectionValue) {
                    .RCC_ADCCLKSOURCE_PLLSAI1 => &.{&PLLSAI1R},
                    .RCC_ADCCLKSOURCE_PLLSAI2 => &.{&PLLSAI2R},
                    .RCC_ADCCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE ADCoutput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                ADCoutput.nodetype = .output;
                ADCoutput.parents = &.{&ADCMult};
            }
            // ======= NODE CK48Mult ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                CK48Mult.nodetype = .multi;
                CK48Mult.parents = switch (CK48CLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLLSAI1 => &.{&PLLSAI1Q},
                    .RCC_USBCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_USBCLKSOURCE_MSI => &.{&MSIRC},
                    .RCC_USBCLKSOURCE_HSI48 => &.{&HSI48RC},
                };
            }
            // ======= NODE CK48output ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                CK48output.nodetype = .output;
                CK48output.parents = &.{&CK48Mult};
            }
            // ======= NODE SDMMCoutput ======
            if (check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=")) {
                SDMMCoutput.nodetype = .output;
                SDMMCoutput.parents = &.{&CK48Mult};
            }
            // ======= NODE RNGoutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGoutput.nodetype = .output;
                RNGoutput.parents = &.{&CK48Mult};
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
            // ======= NODE SAI1Mult ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1Mult.nodetype = .multi;
                SAI1Mult.parents = switch (SAI1CLockSelectionValue) {
                    .RCC_SAI1CLKSOURCE_PLLSAI1 => &.{&PLLSAI1P},
                    .RCC_SAI1CLKSOURCE_PLLSAI2 => &.{&PLLSAI2P},
                    .RCC_SAI1CLKSOURCE_PLL => &.{&PLLP},
                    .RCC_SAI1CLKSOURCE_PIN => &.{&SAI1_EXT},
                };
            }
            // ======= NODE SAI1output ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1output.nodetype = .output;
                SAI1output.parents = &.{&SAI1Mult};
            }
            // ======= NODE SAI2Mult ======
            if (check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                SAI2Mult.nodetype = .multi;
                SAI2Mult.parents = switch (SAI2CLockSelectionValue) {
                    .RCC_SAI2CLKSOURCE_PLLSAI1 => &.{&PLLSAI1P},
                    .RCC_SAI2CLKSOURCE_PLLSAI2 => &.{&PLLSAI2P},
                    .RCC_SAI2CLKSOURCE_PLL => &.{&PLLP},
                    .RCC_SAI2CLKSOURCE_PIN => &.{&SAI2_EXT},
                };
            }
            // ======= NODE SAI2output ======
            if (check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                SAI2output.nodetype = .output;
                SAI2output.parents = &.{&SAI2Mult};
            }
            // ======= NODE I2C4Mult ======
            if (check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=")) {
                I2C4Mult.nodetype = .multi;
                I2C4Mult.parents = switch (I2C4CLockSelectionValue) {
                    .RCC_I2C4CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C4CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C4CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE I2C4output ======
            if (check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=")) {
                I2C4output.nodetype = .output;
                I2C4output.parents = &.{&I2C4Mult};
            }
            // ======= NODE MCOMult ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCO1SourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLR},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO1SOURCE_MSI => &.{&MSIRC},
                    .RCC_MCO1SOURCE_HSI48 => &.{&HSI48RC},
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
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                PLLP.nodetype = .div;
                PLLP.value = try PLLPValue.get();
                PLLP.parents = &.{&PLLN};
            }
            // ======= NODE PLLPoutput ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                PLLPoutput.nodetype = .output;
                PLLPoutput.parents = &.{&PLLP};
            }
            // ======= NODE PLLQ ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLQ.nodetype = .div;
                PLLQ.value = try PLLQValue.get();
                PLLQ.parents = &.{&PLLN};
            }
            // ======= NODE PLLQoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLQoutput.nodetype = .output;
                PLLQoutput.parents = &.{&PLLQ};
            }
            // ======= NODE PLLR ======
            PLLR.nodetype = .div;
            PLLR.value = try PLLRValue.get();
            PLLR.parents = &.{&PLLN};

            // ======= NODE PLLSAI1N ======
            PLLSAI1N.nodetype = .mul;
            PLLSAI1N.value = @floatFromInt(PLLSAI1NValue);
            PLLSAI1N.parents = &.{&PLLM};

            // ======= NODE PLLSAI1P ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                PLLSAI1P.nodetype = .div;
                PLLSAI1P.value = try PLLSAI1PValue.get();
                PLLSAI1P.parents = &.{&PLLSAI1N};
            }
            // ======= NODE PLLSAI1Poutput ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                PLLSAI1Poutput.nodetype = .output;
                PLLSAI1Poutput.parents = &.{&PLLSAI1P};
            }
            // ======= NODE PLLSAI1Q ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLSAI1Q.nodetype = .div;
                PLLSAI1Q.value = try PLLSAI1QValue.get();
                PLLSAI1Q.parents = &.{&PLLSAI1N};
            }
            // ======= NODE PLLSAI1Qoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLSAI1Qoutput.nodetype = .output;
                PLLSAI1Qoutput.parents = &.{&PLLSAI1Q};
            }
            // ======= NODE PLLSAI1R ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                PLLSAI1R.nodetype = .div;
                PLLSAI1R.value = try PLLSAI1RValue.get();
                PLLSAI1R.parents = &.{&PLLSAI1N};
            }
            // ======= NODE PLLSAI1Routput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                PLLSAI1Routput.nodetype = .output;
                PLLSAI1Routput.parents = &.{&PLLSAI1R};
            }
            // ======= NODE PLLSAI2N ======
            PLLSAI2N.nodetype = .mul;
            PLLSAI2N.value = @floatFromInt(PLLSAI2NValue);
            PLLSAI2N.parents = &.{&PLLM};

            // ======= NODE PLLSAI2P ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                PLLSAI2P.nodetype = .div;
                PLLSAI2P.value = try PLLSAI2PValue.get();
                PLLSAI2P.parents = &.{&PLLSAI2N};
            }
            // ======= NODE PLLSAI2Poutput ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                PLLSAI2Poutput.nodetype = .output;
                PLLSAI2Poutput.parents = &.{&PLLSAI2P};
            }
            // ======= NODE PLLSAI2R ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                PLLSAI2R.nodetype = .div;
                PLLSAI2R.value = try PLLSAI2RValue.get();
                PLLSAI2R.parents = &.{&PLLSAI2N};
            }
            // ======= NODE PLLSAI2Routput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                PLLSAI2Routput.nodetype = .output;
                PLLSAI2Routput.parents = &.{&PLLSAI2R};
            }
            // ======= NODE MSI ======
            MSI.nodetype = .output;
            MSI.parents = &.{&MSIRC};

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

            // ======= NODE VCOSAI2Output ======
            VCOSAI2Output.nodetype = .output;
            VCOSAI2Output.parents = &.{&PLLSAI2N};

            //======== POST REFS ========

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if (config.flags.USB_OTG_FSUsed_ForRCC and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3) and (!config.flags.ADC1UsedAsynchronousCLK_ForRCC or !config.flags.ADC2UsedAsynchronousCLK_ForRCC or !config.flags.ADC3UsedAsynchronousCLK_ForRCC)) {
                AHBOutput.limit = .{
                    .min = 1.42e7,
                    .max = 8e7,
                };
            } else if (config.flags.USB_OTG_FSUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 1.42e7,
                    .max = 8e7,
                };
            } else {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            }

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"<")) or check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"="))) {
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
                        const patch_str = if (patch_logs) "LowPowerMode" else "PWR_REGULATOR_VOLTAGE_SCALE1";
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

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass and (scale2 and SysSourceHSE)) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 2.6e7,
                    };

                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 4.8e7,
                    };

                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEOscillator and (scale2 and SysSourceHSE)) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 4e6,
                        .max = 2.6e7,
                    };

                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 4.8e7,
                };

                break :blk user_val orelse 8e6;
            };

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            const MSIClockRangeValue: MSIClockRangeList = blk: {
                if (scale2 and SysSourceHSE) {
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
                            .RCC_MSIRANGE_7 => {},
                            .RCC_MSIRANGE_8 => {},
                            .RCC_MSIRANGE_9 => {},
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "MSIClockRange",
                                    "scale2 &SysSourceHSE",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range100K" else "RCC_MSIRANGE_0",
                                    if (patch_logs) "Range200K" else "RCC_MSIRANGE_1",
                                    if (patch_logs) "Range400K" else "RCC_MSIRANGE_2",
                                    if (patch_logs) "Range800K" else "RCC_MSIRANGE_3",
                                    if (patch_logs) "Range1M" else "RCC_MSIRANGE_4",
                                    if (patch_logs) "Range2M" else "RCC_MSIRANGE_5",
                                    if (patch_logs) "Range4M" else "RCC_MSIRANGE_6",
                                    if (patch_logs) "Range8M" else "RCC_MSIRANGE_7",
                                    if (patch_logs) "Range16M" else "RCC_MSIRANGE_8",
                                    if (patch_logs) "Range24M" else "RCC_MSIRANGE_9",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_MSIRANGE_6;
                }
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
                        .RCC_MSIRANGE_7 => {},
                        .RCC_MSIRANGE_8 => {},
                        .RCC_MSIRANGE_9 => {},
                        .RCC_MSIRANGE_10 => {},
                        .RCC_MSIRANGE_11 => {},
                    }
                }
                break :blk user_val orelse .RCC_MSIRANGE_6;
            };

            // ======= NODE MSIRC ======
            MSIRC.nodetype = .source;
            MSIRC.value = try MSIClockRangeValue.get();

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">"))) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            }

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);

            //======= LCDFreq_Value ========
            const LCDFreq_ValueValue = LCDOutput.get_as_ref();
            ignore_value(LCDFreq_ValueValue);

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);

            //======= UART4Freq_Value ========
            const UART4Freq_ValueValue = UART4output.get_as_ref();
            ignore_value(UART4Freq_ValueValue);

            //======= UART5Freq_Value ========
            const UART5Freq_ValueValue = UART5output.get_as_ref();
            ignore_value(UART5Freq_ValueValue);

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);

            //======= SWPMI1Freq_Value ========
            const SWPMI1Freq_ValueValue = SWPMIoutput.get_as_ref();
            ignore_value(SWPMI1Freq_ValueValue);

            //======= DFSDMFreq_Value ========
            const DFSDMFreq_ValueValue = DFSDMoutput.get_as_ref();
            ignore_value(DFSDMFreq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);
            if (scale2) {
                ADCoutput.limit = .{
                    .min = 1.4e6,
                    .max = 2.6e7,
                };
            } else {
                ADCoutput.limit = .{
                    .min = 1.4e6,
                    .max = 8e7,
                };
            }

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = CK48output.get_as_ref();
            ignore_value(USBFreq_ValueValue);
            if (config.flags.USB_OTG_FSUsed_ForRCC) {
                CK48output.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                };
            } else {
                CK48output.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                };
            }

            //======= SDMMCFreq_Value ========
            const SDMMCFreq_ValueValue = SDMMCoutput.get_as_ref();
            ignore_value(SDMMCFreq_ValueValue);

            SDMMCoutput.limit = .{
                .min = null,
                .max = 5e7,
            };

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

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);

            //======= SAI2Freq_Value ========
            const SAI2Freq_ValueValue = SAI2output.get_as_ref();
            ignore_value(SAI2Freq_ValueValue);

            //======= I2C4Freq_Value ========
            const I2C4Freq_ValueValue = I2C4output.get_as_ref();
            ignore_value(I2C4Freq_ValueValue);

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= LSCOPinFreq_Value ========
            const LSCOPinFreq_ValueValue = LSCOOutput.get_as_ref();
            ignore_value(LSCOPinFreq_ValueValue);

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

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
                .max = 8e7,
            };

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 8e7,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (((SAI1SourcePLLP and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLP and config.flags.SAI2Used_ForRCC)) and scale1) {
                PLLPoutput.limit = .{
                    .min = 2.064e6,
                    .max = 8e7,
                };
            } else if (((SAI1SourcePLLP and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLP and config.flags.SAI2Used_ForRCC)) and scale2) {
                PLLPoutput.limit = .{
                    .min = 2.064e6,
                    .max = 2.6e7,
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if (((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC) and CK48SourcePLLCLK) and scale1) {
                PLLQoutput.limit = .{
                    .min = 8e6,
                    .max = 8e7,
                };
            } else if (((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC) and CK48SourcePLLCLK) and scale2) {
                PLLQoutput.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                };
            }

            //======= PLLSAI1PoutputFreq_Value ========
            const PLLSAI1PoutputFreq_ValueValue = PLLSAI1Poutput.get_as_ref();
            ignore_value(PLLSAI1PoutputFreq_ValueValue);
            if (((SAI1SourcePLLSAI1P and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLSAI1P and config.flags.SAI2Used_ForRCC)) and scale1) {
                PLLSAI1Poutput.limit = .{
                    .min = 2.064e6,
                    .max = 8e7,
                };
            } else if (((SAI1SourcePLLSAI1P and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLSAI1P and config.flags.SAI2Used_ForRCC)) and scale2) {
                PLLSAI1Poutput.limit = .{
                    .min = 2.064e6,
                    .max = 2.6e7,
                };
            }

            //======= PLLSAI1QoutputFreq_Value ========
            const PLLSAI1QoutputFreq_ValueValue = PLLSAI1Qoutput.get_as_ref();
            ignore_value(PLLSAI1QoutputFreq_ValueValue);
            if (((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC) and CK48SourcePLLSAI1) and scale1) {
                PLLSAI1Qoutput.limit = .{
                    .min = 8e6,
                    .max = 8e7,
                };
            } else if (((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or config.flags.SDMMC1Used_ForRCC) and CK48SourcePLLSAI1) and scale2) {
                PLLSAI1Qoutput.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                };
            }

            //======= PLLSAI1RoutputFreq_Value ========
            const PLLSAI1RoutputFreq_ValueValue = PLLSAI1Routput.get_as_ref();
            ignore_value(PLLSAI1RoutputFreq_ValueValue);
            if ((ADCSourcePLLSAI1R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) and scale1) {
                PLLSAI1Routput.limit = .{
                    .min = 8e6,
                    .max = 8e7,
                };
            } else if ((ADCSourcePLLSAI1R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) and scale2) {
                PLLSAI1Routput.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                };
            }

            //======= PLLSAI2PoutputFreq_Value ========
            const PLLSAI2PoutputFreq_ValueValue = PLLSAI2Poutput.get_as_ref();
            ignore_value(PLLSAI2PoutputFreq_ValueValue);
            if (((SAI1SourcePLLSAI2P and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLSAI2P and config.flags.SAI2Used_ForRCC)) and scale1) {
                PLLSAI2Poutput.limit = .{
                    .min = 2.064e6,
                    .max = 8e7,
                };
            } else if (((SAI1SourcePLLSAI2P and (config.flags.SAI1Used_ForRCC or check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (SAI2SourcePLLSAI2P and config.flags.SAI2Used_ForRCC)) and scale2) {
                PLLSAI2Poutput.limit = .{
                    .min = 2.064e6,
                    .max = 2.6e7,
                };
            }

            //======= PLLSAI2RoutputFreq_Value ========
            const PLLSAI2RoutputFreq_ValueValue = PLLSAI2Routput.get_as_ref();
            ignore_value(PLLSAI2RoutputFreq_ValueValue);
            if ((ADCSourcePLLSAI2R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) and scale1) {
                PLLSAI2Routput.limit = .{
                    .min = 8e6,
                    .max = 8e7,
                };
            } else if ((ADCSourcePLLSAI2R and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC3)) and scale2) {
                PLLSAI2Routput.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                };
            }

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAI2UsedValue), PLLSAI2UsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 4e6,
                    .max = 1.6e7,
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale1) {
                VCOOutput.limit = .{
                    .min = 6.4e7,
                    .max = 3.44e8,
                };
            } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale2) {
                VCOOutput.limit = .{
                    .min = 6.4e7,
                    .max = 1.28e8,
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale1) {
                PLLCLK.limit = .{
                    .min = 8e6,
                    .max = 8e7,
                };
            } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and scale2) {
                PLLCLK.limit = .{
                    .min = 8e6,
                    .max = 2.6e7,
                };
            }

            //======= VCOSAI1OutputFreq_Value ========
            const VCOSAI1OutputFreq_ValueValue = VCOSAI1Output.get_as_ref();
            ignore_value(VCOSAI1OutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=") and scale1) {
                VCOSAI1Output.limit = .{
                    .min = 6.4e7,
                    .max = 3.44e8,
                };
            } else if (check_ref(@TypeOf(PLLSAI1UsedValue), PLLSAI1UsedValue, 1, .@"=") and scale2) {
                VCOSAI1Output.limit = .{
                    .min = 6.4e7,
                    .max = 1.28e8,
                };
            }

            //======= VCOSAI2OutputFreq_Value ========
            const VCOSAI2OutputFreq_ValueValue = VCOSAI2Output.get_as_ref();
            ignore_value(VCOSAI2OutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLSAI2UsedValue), PLLSAI2UsedValue, 1, .@"=") and scale1) {
                VCOSAI2Output.limit = .{
                    .min = 6.4e7,
                    .max = 3.44e8,
                };
            } else if (check_ref(@TypeOf(PLLSAI2UsedValue), PLLSAI2UsedValue, 1, .@"=") and scale2) {
                VCOSAI2Output.limit = .{
                    .min = 6.4e7,
                    .max = 1.28e8,
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 6000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 6000000, .@"="))))) {
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
                                "(scale1 & ((HCLKFreq_Value < 16000000)|(HCLKFreq_Value= 16000000 )))|(scale2 & ((HCLKFreq_Value < 6000000)|(HCLKFreq_Value= 6000000 )))",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 12000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 12000000, .@"="))))) {
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
                                "(scale1 & ((HCLKFreq_Value < 32000000)|(HCLKFreq_Value= 32000000 )))|(scale2 & ((HCLKFreq_Value < 12000000)|(HCLKFreq_Value= 12000000 )))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 18000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 18000000, .@"="))))) {
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
                                "(scale1 & ((HCLKFreq_Value < 48000000)|(HCLKFreq_Value= 48000000 )))|(scale2 & ((HCLKFreq_Value < 18000000)|(HCLKFreq_Value= 18000000 )))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 64000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 64000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"="))))) {
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
                                "(scale1 & ((HCLKFreq_Value < 64000000)|(HCLKFreq_Value= 64000000 )))|(scale2 & ((HCLKFreq_Value < 26000000)|(HCLKFreq_Value= 26000000 )))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 80000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 80000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"="))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_4) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "(scale1 & ((HCLKFreq_Value < 80000000)|(HCLKFreq_Value= 80000000 )))|(scale2 & ((HCLKFreq_Value < 26000000)|(HCLKFreq_Value= 26000000 )))",
                                "",
                                "FLASH_LATENCY_4",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_4;
                }
                const user_val = config.extra_config.FLatency;

                if (user_val) |val| {
                    switch (val) {
                        .FLASH_LATENCY_0 => {},
                        .FLASH_LATENCY_1 => FLASH_LATENCY1 = true,
                        .FLASH_LATENCY_2 => FLASH_LATENCY1 = true,
                        .FLASH_LATENCY_3 => FLASH_LATENCY1 = true,
                        .FLASH_LATENCY_4 => FLASH_LATENCY1 = true,
                    }
                }
                break :blk user_val orelse .FLASH_LATENCY_0;
            };
            out.HSIRC = try HSIRC.get_output();
            out.HSI48RC = try HSI48RC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.MSIRC = try MSIRC.get_output();
            out.SAI1_EXT = try SAI1_EXT.get_output();
            out.SAI2_EXT = try SAI2_EXT.get_output();
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
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2output = try USART2output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3output = try USART3output.get_output();
            out.UART4Mult = try UART4Mult.get_output();
            out.UART4output = try UART4output.get_output();
            out.UART5Mult = try UART5Mult.get_output();
            out.UART5output = try UART5output.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.LPTIM2Mult = try LPTIM2Mult.get_output();
            out.LPTIM2output = try LPTIM2output.get_output();
            out.SWPMIMult = try SWPMIMult.get_output();
            out.SWPMIoutput = try SWPMIoutput.get_output();
            out.DFSDMMult = try DFSDMMult.get_output();
            out.DFSDMoutput = try DFSDMoutput.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.CK48Mult = try CK48Mult.get_output();
            out.CK48output = try CK48output.get_output();
            out.SDMMCoutput = try SDMMCoutput.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2output = try I2C2output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3output = try I2C3output.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.SAI1output = try SAI1output.get_output();
            out.SAI2Mult = try SAI2Mult.get_output();
            out.SAI2output = try SAI2output.get_output();
            out.I2C4Mult = try I2C4Mult.get_output();
            out.I2C4output = try I2C4output.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
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
            out.PLLSAI2N = try PLLSAI2N.get_output();
            out.PLLSAI2P = try PLLSAI2P.get_output();
            out.PLLSAI2Poutput = try PLLSAI2Poutput.get_output();
            out.PLLSAI2R = try PLLSAI2R.get_output();
            out.PLLSAI2Routput = try PLLSAI2Routput.get_output();
            out.MSI = try MSI.get_extra_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.VCOSAI1Output = try VCOSAI1Output.get_extra_output();
            out.VCOSAI2Output = try VCOSAI2Output.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSI48_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ref_out.MSIClockRange = MSIClockRangeValue;
            ignore_value(EXTERNALSAI1_CLOCK_VALUEValue);
            ignore_value(EXTERNALSAI2_CLOCK_VALUEValue);
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
            ref_out.USART2CLockSelection = USART2CLockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.USART3CLockSelection = USART3CLockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.UART4CLockSelection = UART4CLockSelectionValue;
            ignore_value(UART4Freq_ValueValue);
            ref_out.UART5CLockSelection = UART5CLockSelectionValue;
            ignore_value(UART5Freq_ValueValue);
            ref_out.LPUART1CLockSelection = LPUART1CLockSelectionValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.LPTIM2CLockSelection = LPTIM2CLockSelectionValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.SWPMI1CLockSelection = SWPMI1CLockSelectionValue;
            ignore_value(SWPMI1Freq_ValueValue);
            ref_out.DFSDMCLockSelection = DFSDMCLockSelectionValue;
            ignore_value(DFSDMFreq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.CK48CLockSelection = CK48CLockSelectionValue;
            ignore_value(USBFreq_ValueValue);
            ignore_value(SDMMCFreq_ValueValue);
            ignore_value(RNGFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C2CLockSelection = I2C2CLockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.I2C3CLockSelection = I2C3CLockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ref_out.SAI1CLockSelection = SAI1CLockSelectionValue;
            ignore_value(SAI1Freq_ValueValue);
            ref_out.SAI2CLockSelection = SAI2CLockSelectionValue;
            ignore_value(SAI2Freq_ValueValue);
            ref_out.I2C4CLockSelection = I2C4CLockSelectionValue;
            ignore_value(I2C4Freq_ValueValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.LSCOSource1 = LSCOSource1Value;
            ignore_value(LSCOPinFreq_ValueValue);
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
            ref_out.PLLSAI2N = PLLSAI2NValue;
            ref_out.PLLSAI2P = PLLSAI2PValue;
            ignore_value(PLLSAI2PoutputFreq_ValueValue);
            ref_out.PLLSAI2R = PLLSAI2RValue;
            ignore_value(PLLSAI2RoutputFreq_ValueValue);
            ignore_value(MSI_VALUEValue);
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLRCLKFreq_ValueValue);
            ignore_value(VCOSAI1OutputFreq_ValueValue);
            ignore_value(VCOSAI2OutputFreq_ValueValue);
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
            ref_out.HSI48CalibrationValue = HSI48CalibrationValueValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.EnableExtClockForSAI1 = EnableExtClockForSAI1Value == .true;
            ref_out.flags.EnableExtClockForSAI2 = EnableExtClockForSAI2Value == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.UART4Enable = UART4EnableValue == .true;
            ref_out.flags.UART5Enable = UART5EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.SWPMIEnable = SWPMIEnableValue == .true;
            ref_out.flags.DFSDMEnable = DFSDMEnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.SDMMCEnable = SDMMCEnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.SAI2Enable = SAI2EnableValue == .true;
            ref_out.flags.I2C4Enable = I2C4EnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.PLLSAI1Used = PLLSAI1UsedValue != 0;
            ref_out.flags.PLLSAI2Used = PLLSAI2UsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.MSIUsed = MSIUsedValue != 0;
            ref_out.LSEState = LSEStateValue;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.EnbaleCSS = EnbaleCSSValue == .true;
            ref_out.flags.HSI48Used = HSI48UsedValue != 0;

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
