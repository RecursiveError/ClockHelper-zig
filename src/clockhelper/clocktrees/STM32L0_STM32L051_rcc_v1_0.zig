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
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 1,
            HSI = 2,
            MSI = 3,
            HSE = 4,
            PLL = 5,
            LSI = 6,
            LSE = 7,
        };
        pub const RCC_USART1SEL = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
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
        pub const RCC_PLLDIV = enum(u2) {
            Div2 = 1,
            Div3 = 2,
            Div4 = 3,
        };
        pub const RCC_I2CSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };
        pub const RCC_CLK48SEL = enum(u1) {
            PLL1_VCO_DIV_2 = 0,
            HSI48 = 1,
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
        pub const RCC_UARTSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const CRS_SYNCSRC = enum(u2) {
            GPIO = 0,
            LSE = 1,
            USB = 2,
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

        pub const HSIRCDivList = enum {
            @"1",
            @"4",

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .@"4" => .Div4,
                    .@"1" => .Div1,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .@"4",
                    .Div1 => .@"1",
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "HSIRCDiv" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .@"1" => 1,
                    .@"4" => 4,
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

        pub const LptimClockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_PCLK,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_HSI,
            RCC_LPTIM1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_UARTSEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_PCLK => .PCLK1,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM1CLKSOURCE_LSI => .SYS,
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_UARTSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_PCLK,
                    .HSI => .RCC_LPTIM1CLKSOURCE_HSI,
                    .SYS => .RCC_LPTIM1CLKSOURCE_LSI,
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                };
            }
        };

        pub const Lpuart1ClockSelectionList = enum {
            RCC_LPUART1CLKSOURCE_PCLK1,
            RCC_LPUART1CLKSOURCE_SYSCLK,
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_UARTSEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPUART1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_UARTSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PCLK1 => .RCC_LPUART1CLKSOURCE_PCLK1,
                    .SYS => .RCC_LPUART1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const Usart2ClockSelectionList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_UARTSEL {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART2CLKSOURCE_HSI => .HSI,
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_UARTSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                };
            }
        };

        pub const Usart1ClockSelectionList = enum {
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

        pub const I2c1ClockSelectionList = enum {
            RCC_I2C1CLKSOURCE_PCLK1,
            RCC_I2C1CLKSOURCE_SYSCLK,
            RCC_I2C1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_I2C1CLKSOURCE_PCLK1,
                    .SYS => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
                };
            }
        };

        pub const I2c3ClockSelectionList = enum {
            RCC_I2C3CLKSOURCE_PCLK1,
            RCC_I2C3CLKSOURCE_SYSCLK,
            RCC_I2C3CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C3CLKSOURCE_HSI => .HSI,
                    .RCC_I2C3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C3CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C3CLKSOURCE_HSI,
                    .SYS => .RCC_I2C3CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2C3CLKSOURCE_PCLK1,
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
            RCC_MCO1SOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_MSI => .MSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                    .RCC_MCO1SOURCE_HSI48 => .HSI,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "RCC_MCOSource", @tagName(self), "RCC_MCOSEL" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .PLL => .RCC_MCO1SOURCE_PLLCLK,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .MSI => .RCC_MCO1SOURCE_MSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                    .HSI => .RCC_MCO1SOURCE_HSI48,
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

        pub const HSI48MClockSelectionList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_CLK48SEL {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL => .PLL1_VCO_DIV_2,
                    .RCC_USBCLKSOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_CLK48SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_VCO_DIV_2 => .RCC_USBCLKSOURCE_PLL,
                    .HSI48 => .RCC_USBCLKSOURCE_HSI48,
                };
            }
        };

        pub const PLLMULList = enum {
            RCC_PLLMUL_3,
            RCC_PLLMUL_4,
            RCC_PLLMUL_6,
            RCC_PLLMUL_8,
            RCC_PLLMUL_12,
            RCC_PLLMUL_16,
            RCC_PLLMUL_24,
            RCC_PLLMUL_32,
            RCC_PLLMUL_48,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLMUL {
                return switch (self) {
                    .RCC_PLLMUL_8 => .Mul8,
                    .RCC_PLLMUL_6 => .Mul6,
                    .RCC_PLLMUL_12 => .Mul12,
                    .RCC_PLLMUL_3 => .Mul3,
                    .RCC_PLLMUL_48 => .Mul48,
                    .RCC_PLLMUL_4 => .Mul4,
                    .RCC_PLLMUL_24 => .Mul24,
                    .RCC_PLLMUL_32 => .Mul32,
                    .RCC_PLLMUL_16 => .Mul16,
                };
            }
            pub fn from_enum(item: RCC_PLLMUL) anyerror!@This() {
                return switch (item) {
                    .Mul8 => .RCC_PLLMUL_8,
                    .Mul6 => .RCC_PLLMUL_6,
                    .Mul12 => .RCC_PLLMUL_12,
                    .Mul3 => .RCC_PLLMUL_3,
                    .Mul48 => .RCC_PLLMUL_48,
                    .Mul4 => .RCC_PLLMUL_4,
                    .Mul24 => .RCC_PLLMUL_24,
                    .Mul32 => .RCC_PLLMUL_32,
                    .Mul16 => .RCC_PLLMUL_16,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLMUL_3 => 3,
                    .RCC_PLLMUL_4 => 4,
                    .RCC_PLLMUL_6 => 6,
                    .RCC_PLLMUL_8 => 8,
                    .RCC_PLLMUL_12 => 12,
                    .RCC_PLLMUL_16 => 16,
                    .RCC_PLLMUL_24 => 24,
                    .RCC_PLLMUL_32 => 32,
                    .RCC_PLLMUL_48 => 48,
                };
            }
        };

        pub const PLLDIVList = enum {
            RCC_PLLDIV_2,
            RCC_PLLDIV_3,
            RCC_PLLDIV_4,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLDIV {
                return switch (self) {
                    .RCC_PLLDIV_2 => .Div2,
                    .RCC_PLLDIV_4 => .Div4,
                    .RCC_PLLDIV_3 => .Div3,
                };
            }
            pub fn from_enum(item: RCC_PLLDIV) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLDIV_2,
                    .Div4 => .RCC_PLLDIV_4,
                    .Div3 => .RCC_PLLDIV_3,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLDIV_2 => 2,
                    .RCC_PLLDIV_3 => 3,
                    .RCC_PLLDIV_4 => 4,
                };
            }
        };

        pub const DATA_CACHE_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const PREFETCH_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const INSTRUCTION_CACHE_ENABLEList = enum {
            @"0",
            @"1",
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

        pub const EnableHSERTCDevisorList = enum {
            true,
            false,
        };

        pub const EnableHSELCDDevisorList = enum {
            true,
            false,
        };

        pub const LPTIMEnableList = enum {
            true,
            false,
        };

        pub const LPUARTEnableList = enum {
            true,
            false,
        };

        pub const USART2EnableList = enum {
            true,
            false,
        };

        pub const USART1EnableList = enum {
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

        pub const MCOEnableList = enum {
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

        pub const ADCEnableList = enum {
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

        pub const @"48MEnableList" = enum {
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
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            LPTIMUsed_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            CSSEnabled: bool = false,
            EnableCSS: bool = false,
            Semaphore_ETRpinUsedTIM22: bool = false,
            Semaphore_ETRpinUsedTIM21: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            LPTIMUsed_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            CSSEnabled: bool = false,
            EnableCSS: bool = false,
            Semaphore_ETRpinUsedTIM22: bool = false,
            Semaphore_ETRpinUsedTIM21: bool = false,
            HSIRCDiv: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            LPTIMEnable: bool = false, //Reference flag
            LPUARTEnable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            @"48MEnable": bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            HSI48Used: bool = false, //Reference flag
            MSIUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
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
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            MSIClockRange: ?MSIClockRangeList = null,
            HSIRCDiv: ?HSIRCDivList = null,
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            RTCClockSelectionVirtual: ?RTCClockSelectionVirtualList = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            TimPrescaler: ?TimPrescalerList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            LptimClockSelection: ?LptimClockSelectionList = null,
            Lpuart1ClockSelection: ?Lpuart1ClockSelectionList = null,
            Usart2ClockSelection: ?Usart2ClockSelectionList = null,
            Usart1ClockSelection: ?Usart1ClockSelectionList = null,
            I2c1ClockSelection: ?I2c1ClockSelectionList = null,
            I2c3ClockSelection: ?I2c3ClockSelectionList = null,
            RCC_MCOSource: ?RCC_MCOSourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            HSI48MClockSelection: ?HSI48MClockSelectionList = null,
            PLLMUL: ?PLLMULList = null,
            PLLDIV: ?PLLDIVList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            MSIClockRange: MSIClockRangeList,
            RTCClockSelectionVirtual: RTCClockSelectionVirtualList,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            AHBCLKDivider: AHBCLKDividerList,
            TimPrescaler: TimPrescalerList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB2TimCLKDivider: u32,
            LptimClockSelection: LptimClockSelectionList,
            Lpuart1ClockSelection: Lpuart1ClockSelectionList,
            Usart2ClockSelection: Usart2ClockSelectionList,
            Usart1ClockSelection: Usart1ClockSelectionList,
            I2c1ClockSelection: I2c1ClockSelectionList,
            I2c3ClockSelection: I2c3ClockSelectionList,
            RCC_MCOSource: RCC_MCOSourceList,
            RCC_MCODiv: RCC_MCODivList,
            HSI48MClockSelection: HSI48MClockSelectionList,
            PLLMUL: PLLMULList,
            PLLDIV: PLLDIVList,
            DIV2USB: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
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
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
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
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .FLatency = self.FLatency,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .MSICalibrationValue = self.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .Prescaler = self.Prescaler,
                    .Polarity = self.Polarity,
                    .ReloadValueType = self.ReloadValueType,
                    .ReloadValue = self.ReloadValue,
                    .Fsync = self.Fsync,
                    .ErrorLimitValue = self.ErrorLimitValue,
                    .HSI48CalibrationValue = self.HSI48CalibrationValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = self.LSE_Drive_Capability,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            MSIClockRange: ?RCC_MSIRANGE = null,
            HSIRCDiv: ?RCC_HPRE = null,
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            RTCClockSelectionVirtual: ?RCC_RTCSEL = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            TimPrescaler: ?TimPrescalerList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            LptimClockSelection: ?RCC_UARTSEL = null,
            Lpuart1ClockSelection: ?RCC_UARTSEL = null,
            Usart2ClockSelection: ?RCC_UARTSEL = null,
            Usart1ClockSelection: ?RCC_USART1SEL = null,
            I2c1ClockSelection: ?RCC_I2CSEL = null,
            I2c3ClockSelection: ?RCC_I2CSEL = null,
            RCC_MCOSource: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            HSI48MClockSelection: ?RCC_CLK48SEL = null,
            PLLMUL: ?RCC_PLLMUL = null,
            PLLDIV: ?RCC_PLLDIV = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .MSIClockRange = if (self.MSIClockRange) |val| try MSIClockRangeList.from_enum(val) else null,
                    .HSIRCDiv = if (self.HSIRCDiv) |val| try HSIRCDivList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .RTCClockSelectionVirtual = if (self.RTCClockSelectionVirtual) |val| try RTCClockSelectionVirtualList.from_enum(val) else null,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .TimPrescaler = self.TimPrescaler,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .LptimClockSelection = if (self.LptimClockSelection) |val| try LptimClockSelectionList.from_enum(val) else null,
                    .Lpuart1ClockSelection = if (self.Lpuart1ClockSelection) |val| try Lpuart1ClockSelectionList.from_enum(val) else null,
                    .Usart2ClockSelection = if (self.Usart2ClockSelection) |val| try Usart2ClockSelectionList.from_enum(val) else null,
                    .Usart1ClockSelection = if (self.Usart1ClockSelection) |val| try Usart1ClockSelectionList.from_enum(val) else null,
                    .I2c1ClockSelection = if (self.I2c1ClockSelection) |val| try I2c1ClockSelectionList.from_enum(val) else null,
                    .I2c3ClockSelection = if (self.I2c3ClockSelection) |val| try I2c3ClockSelectionList.from_enum(val) else null,
                    .RCC_MCOSource = if (self.RCC_MCOSource) |val| try RCC_MCOSourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .HSI48MClockSelection = if (self.HSI48MClockSelection) |val| try HSI48MClockSelectionList.from_enum(val) else null,
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
            RTCClockSelectionVirtual: RCC_RTCSEL,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            AHBCLKDivider: RCC_HPRE,
            TimPrescaler: TimPrescalerList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            LptimClockSelection: RCC_UARTSEL,
            Lpuart1ClockSelection: RCC_UARTSEL,
            Usart2ClockSelection: RCC_UARTSEL,
            Usart1ClockSelection: RCC_USART1SEL,
            I2c1ClockSelection: RCC_I2CSEL,
            I2c3ClockSelection: RCC_I2CSEL,
            RCC_MCOSource: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            HSI48MClockSelection: RCC_CLK48SEL,
            PLLMUL: RCC_PLLMUL,
            PLLDIV: RCC_PLLDIV,
            DIV2USB: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
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
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .MSIClockRange = try cubemx_config.MSIClockRange.to_enum(),
                    .RTCClockSelectionVirtual = try cubemx_config.RTCClockSelectionVirtual.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .TimPrescaler = cubemx_config.TimPrescaler,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .LptimClockSelection = try cubemx_config.LptimClockSelection.to_enum(),
                    .Lpuart1ClockSelection = try cubemx_config.Lpuart1ClockSelection.to_enum(),
                    .Usart2ClockSelection = try cubemx_config.Usart2ClockSelection.to_enum(),
                    .Usart1ClockSelection = try cubemx_config.Usart1ClockSelection.to_enum(),
                    .I2c1ClockSelection = try cubemx_config.I2c1ClockSelection.to_enum(),
                    .I2c3ClockSelection = try cubemx_config.I2c3ClockSelection.to_enum(),
                    .RCC_MCOSource = try cubemx_config.RCC_MCOSource.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .HSI48MClockSelection = try cubemx_config.HSI48MClockSelection.to_enum(),
                    .PLLMUL = try cubemx_config.PLLMUL.to_enum(),
                    .PLLDIV = try cubemx_config.PLLDIV.to_enum(),
                    .DIV2USB = cubemx_config.DIV2USB,
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .MSICalibrationValue = cubemx_config.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
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
                    .LSE_Drive_Capability = cubemx_config.LSE_Drive_Capability,
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
            MSIRC: u32 = 0,
            HSI48RC: u32 = 0,
            HSIRCDiv: u32 = 0,
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            LCDOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            HSERTCDevisor: u32 = 0,
            SysClkSource: u32 = 0,
            PLLSource: u32 = 0,
            AHBPrescaler: u32 = 0,
            SysCLKOutput: u32 = 0,
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
            LPTIMMult: u32 = 0,
            LPTIMOutput: u32 = 0,
            LPUARTMult: u32 = 0,
            LPUARTOutput: u32 = 0,
            USART2Mult: u32 = 0,
            USART2Output: u32 = 0,
            USART1Mult: u32 = 0,
            USART1Output: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1Output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3Output: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            HSI48MUL: u32 = 0,
            @"48USBOutput": u32 = 0,
            @"48RNGOutput": u32 = 0,
            ADCOutput: u32 = 0,
            VCOIIuput: u32 = 0,
            PLLMUL: u32 = 0,
            PLLDIV: u32 = 0,
            DIV2USB: u32 = 0,
            HSI: u32 = 0,
            MSI: u32 = 0,
            HSE_RTC: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            @"48CLK": u32 = 0,
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
            var PLLHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var APB2CLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIMSOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIMSOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIMSOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSource_HSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale11: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale3: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var MSIRC = ClockNode{
                .name = "MSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSI48RC = ClockNode{
                .name = "HSI48RC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSIRCDiv = ClockNode{
                .name = "HSIRCDiv",
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

            var HSERTCDevisor = ClockNode{
                .name = "HSERTCDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SysClkSource = ClockNode{
                .name = "SysClkSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSource = ClockNode{
                .name = "PLLSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHBPrescaler = ClockNode{
                .name = "AHBPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SysCLKOutput = ClockNode{
                .name = "SysCLKOutput",
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

            var LPTIMMult = ClockNode{
                .name = "LPTIMMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIMOutput = ClockNode{
                .name = "LPTIMOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPUARTMult = ClockNode{
                .name = "LPUARTMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPUARTOutput = ClockNode{
                .name = "LPUARTOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART2Mult = ClockNode{
                .name = "USART2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART2Output = ClockNode{
                .name = "USART2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART1Mult = ClockNode{
                .name = "USART1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART1Output = ClockNode{
                .name = "USART1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C1Mult = ClockNode{
                .name = "I2C1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C1Output = ClockNode{
                .name = "I2C1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C3Mult = ClockNode{
                .name = "I2C3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C3Output = ClockNode{
                .name = "I2C3Output",
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

            var HSI48MUL = ClockNode{
                .name = "HSI48MUL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var @"48USBOutput" = ClockNode{
                .name = "48USBOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var @"48RNGOutput" = ClockNode{
                .name = "48RNGOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADCOutput = ClockNode{
                .name = "ADCOutput",
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

            var PLLDIV = ClockNode{
                .name = "PLLDIV",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIV2USB = ClockNode{
                .name = "DIV2USB",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSI = ClockNode{
                .name = "HSI",
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

            var @"48CLK" = ClockNode{
                .name = "48CLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI16_VALUEValue: f32 = blk: {
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

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const HSIRCDivValue: HSIRCDivList = blk: {
                const user_val = config.HSIRCDiv;

                if (user_val) |val| {
                    switch (val) {
                        .@"1" => {},
                        .@"4" => {},
                    }
                }
                break :blk user_val orelse .@"1";
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

            const HSI48MClockSelectionValue: HSI48MClockSelectionList = blk: {
                const user_val = config.HSI48MClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL => {},
                        .RCC_USBCLKSOURCE_HSI48 => {},
                    }
                }
                break :blk user_val orelse .RCC_USBCLKSOURCE_PLL;
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((config.flags.USBUsed_ForRCC and (check_ref(@TypeOf(HSI48MClockSelectionValue), HSI48MClockSelectionValue, .RCC_USBCLKSOURCE_PLL, .@"=")))) {
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
                                "(USBUsed_ForRCC&(HSI48MClockSelection=RCC_USBCLKSOURCE_PLL)) ",
                                "PLL Mux should have HSE as input",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    PLLHSE = true;
                    break :blk .RCC_PLLSOURCE_HSE;
                }
                const user_val = config.PLLSourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_HSI => PLLHSI = true,
                        .RCC_PLLSOURCE_HSE => PLLHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLLHSI = true;
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

            const RTCClockSelectionVirtualValue: RTCClockSelectionVirtualList = blk: {
                if (((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1_directTIM21")))) {
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
                                    "((HSEByPass|HSEOscillator)&(SEM2RCC_HSE_REQUIRED_TIM21 & TIM21 & Semaphore_input_Channel1_directTIM21) )",
                                    "RTC Mux should have HSE as input when TIM21 remap is used",
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
                        .RCC_HCLK_DIV1 => APB2CLKDivider1 = true,
                        .RCC_HCLK_DIV2 => {},
                        .RCC_HCLK_DIV4 => {},
                        .RCC_HCLK_DIV8 => {},
                        .RCC_HCLK_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    APB2CLKDivider1 = true;
                    break :blk .RCC_HCLK_DIV1;
                };
            };

            const APB2TimCLKDividerValue: u32 = blk: {
                if (check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) {
                    break :blk 1;
                }
                break :blk 2;
            };

            const LptimClockSelectionValue: LptimClockSelectionList = blk: {
                const user_val = config.LptimClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_PCLK => {},
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIMSOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_HSI => LPTIMSOURCEHSI = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIMSOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK;
            };

            const Lpuart1ClockSelectionValue: Lpuart1ClockSelectionList = blk: {
                const user_val = config.Lpuart1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_PCLK1 => {},
                        .RCC_LPUART1CLKSOURCE_SYSCLK => {},
                        .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
                        .RCC_LPUART1CLKSOURCE_LSE => LPUART1SourceLSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPUART1CLKSOURCE_PCLK1;
            };

            const Usart2ClockSelectionValue: Usart2ClockSelectionList = blk: {
                const user_val = config.Usart2ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART2CLKSOURCE_PCLK1 => {},
                        .RCC_USART2CLKSOURCE_SYSCLK => {},
                        .RCC_USART2CLKSOURCE_HSI => {},
                        .RCC_USART2CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_USART2CLKSOURCE_PCLK1;
            };

            const Usart1ClockSelectionValue: Usart1ClockSelectionList = blk: {
                const user_val = config.Usart1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK2 => {},
                        .RCC_USART1CLKSOURCE_SYSCLK => {},
                        .RCC_USART1CLKSOURCE_HSI => {},
                        .RCC_USART1CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK2;
            };

            const I2c1ClockSelectionValue: I2c1ClockSelectionList = blk: {
                const user_val = config.I2c1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_PCLK1 => {},
                        .RCC_I2C1CLKSOURCE_SYSCLK => {},
                        .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C1CLKSOURCE_PCLK1;
            };

            const I2c3ClockSelectionValue: I2c3ClockSelectionList = blk: {
                const user_val = config.I2c3ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C3CLKSOURCE_PCLK1 => {},
                        .RCC_I2C3CLKSOURCE_SYSCLK => {},
                        .RCC_I2C3CLKSOURCE_HSI => I2C3SourceHSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C3CLKSOURCE_PCLK1;
            };

            const RCC_MCOSourceValue: RCC_MCOSourceList = blk: {
                if (check_MCU("STM32L0x0_Value_Line")) {
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
                                , .{
                                    "RCC_MCOSource",
                                    "STM32L0x0_Value_Line",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "SYS" else "RCC_MCO1SOURCE_SYSCLK",
                                    "RCC_MCO1SOURCE_HSI",
                                    if (patch_logs) "MSI" else "RCC_MCO1SOURCE_MSI",
                                    if (patch_logs) "HSE" else "RCC_MCO1SOURCE_HSE",
                                    if (patch_logs) "PLL" else "RCC_MCO1SOURCE_PLLCLK",
                                    if (patch_logs) "LSI" else "RCC_MCO1SOURCE_LSI",
                                    if (patch_logs) "LSE" else "RCC_MCO1SOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
                }
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
                        .RCC_MCO1SOURCE_HSI48 => MCOSource_HSI48 = true,
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
                        .RCC_PLLMUL_3 => {},
                        .RCC_PLLMUL_4 => {},
                        .RCC_PLLMUL_6 => {},
                        .RCC_PLLMUL_8 => {},
                        .RCC_PLLMUL_12 => {},
                        .RCC_PLLMUL_16 => {},
                        .RCC_PLLMUL_24 => {},
                        .RCC_PLLMUL_32 => {},
                        .RCC_PLLMUL_48 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLMUL_3;
            };

            const PLLDIVValue: PLLDIVList = blk: {
                const user_val = config.PLLDIV;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLDIV_2 => {},
                        .RCC_PLLDIV_3 => {},
                        .RCC_PLLDIV_4 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLDIV_2;
            };

            const DIV2USBValue: u32 = blk: {
                break :blk 2;
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const MSI_VALUEValue: f32 = blk: {
                break :blk 2.097e6;
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

            const INSTRUCTION_CACHE_ENABLEValue: INSTRUCTION_CACHE_ENABLEList = blk: {
                const user_val = config.extra_config.INSTRUCTION_CACHE_ENABLE;

                if (user_val) |val| {
                    switch (val) {
                        .@"0" => {},
                        .@"1" => {},
                    }
                }
                break :blk user_val orelse .@"1";
            };

            const HSICalibrationValueValue: u32 = blk: {
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

            const MSICalibrationValueValue: u32 = blk: {
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
                if (((check_MCU("Semaphore_ClockSourceETRMode2TIM2") or check_MCU("Semaphore_TriggerSourceETRTIM2") or check_MCU("Semaphore_ETRasClearingSourceTIM2")) and check_MCU("TIM2") and check_MCU("SEM2RCC_LSE_REQUIRED_TIM2")) or ((check_MCU("Semaphore_ClockSourceETRMode2TIM22") or check_MCU("Semaphore_TriggerSourceETRTIM22") or check_MCU("Semaphore_ETRasClearingSourceTIM22")) and check_MCU("TIM22") and check_MCU("SEM2RCC_LSE_REQUIRED_TIM22")) or ((check_MCU("Semaphore_ClockSourceETRMode2TIM21") or check_MCU("Semaphore_TriggerSourceETRTIM21") or check_MCU("Semaphore_ETRasClearingSourceTIM21")) and check_MCU("TIM21") and check_MCU("SEM2RCC_LSE_REQUIRED_TIM21")) or (check_MCU("SEM2RCC_LSE_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or (config.flags.CRSActivatedSourceLSE or (config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_LSE, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_LSE, .@"="))) or (config.flags.LPTIMUsed_ForRCC and LPTIMSOURCELSE) or (config.flags.LPUARTUsed_ForRCC and LPUART1SourceLSE) or (check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.MCOConfig)) or (SEMAPHORE_LSE_SELECTED and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
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

            const RTCEnableValue: RTCEnableList = blk: {
                if ((check_MCU("SEM2RCC_HSE_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.RTCUsed_ForRCC) {
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

            const PLLUsedValue: u1 = blk: {
                if ((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.MCOConfig)) or ((config.flags.USBUsed_ForRCC or config.flags.RNGUsed_ForRCC) and (check_ref(@TypeOf(HSI48MClockSelectionValue), HSI48MClockSelectionValue, .RCC_USBCLKSOURCE_PLL, .@"=")))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDGUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass)) or (check_MCU("SEM2RCC_HSE_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21"))) {
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

            const LPTIMEnableValue: LPTIMEnableList = blk: {
                if (config.flags.LPTIMUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPUARTEnableValue: LPUARTEnableList = blk: {
                if (config.flags.LPUARTUsed_ForRCC) {
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

            const USART1EnableValue: USART1EnableList = blk: {
                if (config.flags.USART1Used_ForRCC) {
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

            const MCOEnableValue: MCOEnableList = blk: {
                if ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.MCOConfig) {
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

            const RNGEnableValue: RNGEnableList = blk: {
                if (config.flags.RNGUsed_ForRCC) {
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

            const EnableCSSLSEValue: EnableCSSLSEList = blk: {
                if ((((check_ref(@TypeOf(RTCClockSelectionVirtualValue), RTCClockSelectionVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"="))) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
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

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEOscillator or config.flags.HSEByPass) or (check_MCU("SEM2RCC_HSE_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21"))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if ((config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC or (check_MCU("SEM2RCC_HSE_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21"))) and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
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

            const @"48MEnableValue": @"48MEnableList" = blk: {
                if (config.flags.RNGUsed_ForRCC or config.flags.USBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LSIUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_LSI_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or ((config.flags.LPTIMUsed_ForRCC and LPTIMSOURCELSI) or config.flags.IWDGUsed_ForRCC or (config.flags.USART1Used_ForRCC and (false)) or (SEMAPHORE_LSI_SELECTED and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC)) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSI, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSI48UsedValue: u1 = blk: {
                if ((check_MCU("Semaphore_TIM2_L0_ETR_REMAPTIM2") and (check_MCU("SEM2RCC_HSI48_REQUIRED_TIM2"))) or (config.flags.Semaphore_ETRpinUsedTIM22 and (check_MCU("SEM2RCC_HSI48_REQUIRED_TIM22"))) or (config.flags.Semaphore_ETRpinUsedTIM21 and (check_MCU("SEM2RCC_HSI48_REQUIRED_TIM21"))) or (check_MCU("Semaphore_TIM3_L0_ETR_REMAPTIM3") and check_MCU("SEM2RCC_HSI48_REQUIRED_TIM3")) or ((config.flags.USBUsed_ForRCC or config.flags.RNGUsed_ForRCC) and (check_ref(@TypeOf(HSI48MClockSelectionValue), HSI48MClockSelectionValue, .RCC_USBCLKSOURCE_HSI48, .@"="))) or ((MCOSource_HSI48) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const MSIUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_MSI_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_MSI, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if (((config.flags.LPTIMUsed_ForRCC and LPTIMSOURCEHSI) or ((PLLHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM21") and check_MCU("TIM21") and check_MCU("Semaphore_input_Channel1TIM21")) or config.flags.MCOConfig)) or config.flags.ADCUsed_ForRCC or (config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_HSI, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_HSI, .@"="))) or (LPUART1SourceHSI) or (config.flags.LPUARTUsed_ForRCC and (LPUART1SourceHSI)) or (config.flags.I2C1Used_ForRCC and (I2C1SourceHSI)) or (config.flags.I2C3Used_ForRCC and (I2C3SourceHSI)))) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            if ((check_MCU("LQFP32") or check_MCU("UFQFPN32") or check_MCU("WLCSP36")) and !((check_MCU("STM32L0x1") or check_MCU("STM32L0x0_Value_Line")) and (check_MCU("DIE425") or check_MCU("DIE457")))) {
                HSIRC.nodetype = .source;
                HSIRC.value = HSI16_VALUEValue;
            }
            HSIRC.nodetype = .source;
            HSIRC.value = HSI16_VALUEValue;

            // ======= NODE MSIRC ======
            MSIRC.nodetype = .source;
            MSIRC.value = try MSIClockRangeValue.get();

            // ======= NODE HSI48RC ======
            if (!check_MCU("STM32L0x1") and !check_MCU("STM32L0x0_Value_Line")) {
                HSI48RC.nodetype = .source;
                HSI48RC.value = HSI48_VALUEValue;
            }
            // ======= NODE HSIRCDiv ======
            if ((check_MCU("LQFP32") or check_MCU("UFQFPN32") or check_MCU("WLCSP36")) and !((check_MCU("DIE425") or check_MCU("DIE457")))) {
                HSIRCDiv.nodetype = .div;
                HSIRCDiv.value = HSIRCDivValue;
                HSIRCDiv.parents = &.{&HSIRC};
            }
            HSIRCDiv.nodetype = .div;
            HSIRCDiv.value = HSIRCDivValue;
            HSIRCDiv.parents = &.{&HSIRC};

            // ======= NODE LSIRC ======
            if ((!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("WLCSP36")) or (check_MCU("DIE425") or check_MCU("DIE457"))) {
                LSIRC.nodetype = .source;
                LSIRC.value = LSI_VALUEValue;
            }
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            if ((check_MCU("LQFP32") or check_MCU("UFQFPN32") or check_MCU("WLCSP36")) and !((check_MCU("DIE425") or check_MCU("DIE457")))) {
                LSEOSC.nodetype = .source;
                LSEOSC.value = LSE_VALUEValue;
            }
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE RTCClkSource ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=") or check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")) {
                if ((!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("WLCSP36")) or (check_MCU("DIE425") or check_MCU("DIE457"))) {
                    RTCClkSource.nodetype = .multi;
                    RTCClkSource.parents = switch (RTCClockSelectionVirtualValue) {
                        .HSERTCDevisor => &.{&HSERTCDevisor},
                        .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                        .RCC_RTCCLKSOURCE_LSI => &.{&LSIRC},
                    };
                }
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
            // ======= NODE HSERTCDevisor ======
            if (check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=") or check_ref(@TypeOf(EnableHSELCDDevisorValue), EnableHSELCDDevisorValue, .true, .@"=")) {
                if ((!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("WLCSP36")) or (check_MCU("DIE425") or check_MCU("DIE457"))) {
                    HSERTCDevisor.nodetype = .div;
                    HSERTCDevisor.value = try RCC_RTC_Clock_Source_FROM_HSEValue.get();
                    HSERTCDevisor.parents = &.{&HSEOSC};
                }
            }
            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_MSI => &.{&MSIRC},
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRCDiv},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLDIV},
            };

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                .RCC_PLLSOURCE_HSI => &.{&HSIRCDiv},
            };

            // ======= NODE AHBPrescaler ======
            AHBPrescaler.nodetype = .div;
            AHBPrescaler.value = try AHBCLKDividerValue.get();
            AHBPrescaler.parents = &.{&SysCLKOutput};

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

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

            // ======= NODE LPTIMMult ======
            if (check_ref(@TypeOf(LPTIMEnableValue), LPTIMEnableValue, .true, .@"=")) {
                if (!check_MCU("LPUART1_Exist")) {
                    LPTIMMult.nodetype = .multi;
                    LPTIMMult.parents = switch (LptimClockSelectionValue) {
                        .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                        .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRCDiv},
                        .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                        .RCC_LPTIM1CLKSOURCE_PCLK => &.{&APB1Prescaler},
                    };
                }
                LPTIMMult.nodetype = .multi;
                LPTIMMult.parents = switch (LptimClockSelectionValue) {
                    .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRCDiv},
                    .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_LPTIM1CLKSOURCE_PCLK => &.{&APB1Prescaler},
                };
            }
            // ======= NODE LPTIMOutput ======
            if (check_ref(@TypeOf(LPTIMEnableValue), LPTIMEnableValue, .true, .@"=")) {
                if (!check_MCU("LPUART1_Exist")) {
                    LPTIMOutput.nodetype = .output;
                    LPTIMOutput.parents = &.{&LPTIMMult};
                }
                LPTIMOutput.nodetype = .output;
                LPTIMOutput.parents = &.{&LPTIMMult};
            }
            // ======= NODE LPUARTMult ======
            if (check_ref(@TypeOf(LPUARTEnableValue), LPUARTEnableValue, .true, .@"=")) {
                LPUARTMult.nodetype = .multi;
                LPUARTMult.parents = switch (Lpuart1ClockSelectionValue) {
                    .RCC_LPUART1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIRCDiv},
                    .RCC_LPUART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE LPUARTOutput ======
            if (check_ref(@TypeOf(LPUARTEnableValue), LPUARTEnableValue, .true, .@"=")) {
                LPUARTOutput.nodetype = .output;
                LPUARTOutput.parents = &.{&LPUARTMult};
            }
            // ======= NODE USART2Mult ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                USART2Mult.nodetype = .multi;
                USART2Mult.parents = switch (Usart2ClockSelectionValue) {
                    .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART2CLKSOURCE_HSI => &.{&HSIRCDiv},
                    .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                };
            }
            // ======= NODE USART2Output ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                USART2Output.nodetype = .output;
                USART2Output.parents = &.{&USART2Mult};
            }
            // ======= NODE USART1Mult ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1Mult.nodetype = .multi;
                USART1Mult.parents = switch (Usart1ClockSelectionValue) {
                    .RCC_USART1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                    .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART1CLKSOURCE_HSI => &.{&HSIRCDiv},
                    .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART1Output ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1Output.nodetype = .output;
                USART1Output.parents = &.{&USART1Mult};
            }
            // ======= NODE I2C1Mult ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                if (!check_MCU("LPUART1_Exist")) {
                    I2C1Mult.nodetype = .multi;
                    I2C1Mult.parents = switch (I2c1ClockSelectionValue) {
                        .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                        .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRCDiv},
                        .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    };
                }
                I2C1Mult.nodetype = .multi;
                I2C1Mult.parents = switch (I2c1ClockSelectionValue) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRCDiv},
                    .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE I2C1Output ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                if (!check_MCU("LPUART1_Exist")) {
                    I2C1Output.nodetype = .output;
                    I2C1Output.parents = &.{&I2C1Mult};
                }
                I2C1Output.nodetype = .output;
                I2C1Output.parents = &.{&I2C1Mult};
            }
            // ======= NODE I2C3Mult ======
            if (check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"=")) {
                if (check_MCU("I2C3_Exist")) {
                    I2C3Mult.nodetype = .multi;
                    I2C3Mult.parents = switch (I2c3ClockSelectionValue) {
                        .RCC_I2C3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                        .RCC_I2C3CLKSOURCE_HSI => &.{&HSIRCDiv},
                        .RCC_I2C3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    };
                }
            }
            // ======= NODE I2C3Output ======
            if (check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"=")) {
                if (check_MCU("I2C3_Exist")) {
                    I2C3Output.nodetype = .output;
                    I2C3Output.parents = &.{&I2C3Mult};
                }
            }
            // ======= NODE MCOMult ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                if ((check_MCU("LQFP32") or check_MCU("UFQFPN32") or check_MCU("WLCSP36")) and (check_MCU("STM32L0x1") or check_MCU("STM32L0x0_Value_Line")) and !(check_MCU("DIE425") or check_MCU("DIE457"))) {
                    MCOMult.nodetype = .multi;
                    MCOMult.parents = switch (RCC_MCOSourceValue) {
                        .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                        .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                        .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                        .RCC_MCO1SOURCE_HSI => &.{&HSIRCDiv},
                        .RCC_MCO1SOURCE_PLLCLK => &.{&PLLDIV},
                        .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_MCO1SOURCE_MSI => &.{&MSIRC},
                        .RCC_MCO1SOURCE_HSI48 => &.{&HSI48RC},
                    };
                }
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCOSourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRCDiv},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLDIV},
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
            // ======= NODE HSI48MUL ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                HSI48MUL.nodetype = .multi;
                HSI48MUL.parents = switch (HSI48MClockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLL => &.{&DIV2USB},
                    .RCC_USBCLKSOURCE_HSI48 => &.{&HSI48RC},
                };
            }
            // ======= NODE 48USBOutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                @"48USBOutput".nodetype = .output;
                @"48USBOutput".parents = &.{&HSI48MUL};
            }
            // ======= NODE 48RNGOutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                @"48RNGOutput".nodetype = .output;
                @"48RNGOutput".parents = &.{&HSI48MUL};
            }
            // ======= NODE ADCOutput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                if (!(check_MCU("STM32L0x1") or check_MCU("STM32L0x0_Value_Line"))) {
                    ADCOutput.nodetype = .output;
                    ADCOutput.parents = &.{&HSIRCDiv};
                }
                ADCOutput.nodetype = .output;
                ADCOutput.parents = &.{&HSIRCDiv};
            }
            // ======= NODE VCOIIuput ======
            VCOIIuput.nodetype = .output;
            VCOIIuput.parents = &.{&PLLSource};

            // ======= NODE PLLMUL ======
            PLLMUL.nodetype = .mul;
            PLLMUL.value = try PLLMULValue.get();
            PLLMUL.parents = &.{&VCOIIuput};

            // ======= NODE PLLDIV ======
            PLLDIV.nodetype = .div;
            PLLDIV.value = try PLLDIVValue.get();
            PLLDIV.parents = &.{&PLLMUL};

            // ======= NODE DIV2USB ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                if ((!check_MCU("STM32L0x1") and !check_MCU("STM32L0x0_Value_Line"))) {
                    DIV2USB.nodetype = .div;
                    DIV2USB.value = @floatFromInt(DIV2USBValue);
                    DIV2USB.parents = &.{&PLLMUL};
                }
            }
            // ======= NODE HSI ======
            HSI.nodetype = .output;
            HSI.parents = &.{&HSIRCDiv};

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

            // ======= NODE 48CLK ======
            @"48CLK".nodetype = .output;
            @"48CLK".parents = &.{&DIV2USB};

            //======== POST REFS ========

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
                } else if ((((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@">"))))) {
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
                                    "(((HCLKFreq_Value > 4200000)))",
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

                    break :blk user_val orelse 8e6;
                } else if (HSEscale and config.flags.HSEByPass and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE3, .@"="))) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 8e6,
                    };

                    break :blk user_val orelse 8e6;
                } else if (HSEscale and config.flags.HSEByPass and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE2, .@"="))) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 1.6e7,
                    };

                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 3.2e7,
                    };

                    break :blk user_val orelse 8e6;
                } else if (check_MCU("DIE447") and HSEscale and config.flags.HSEOscillator and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE3, .@"="))) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 8e6,
                    };

                    break :blk user_val orelse 8e6;
                } else if (check_MCU("DIE447") and HSEscale and config.flags.HSEOscillator and (check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE2, .@"="))) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 1.6e7,
                    };

                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEOscillator) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 2.5e7,
                    };

                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 1e6,
                    .max = 2.5e7,
                };

                break :blk user_val orelse 8e6;
            };

            // ======= NODE HSEOSC ======
            if ((!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("WLCSP36")) or (check_MCU("DIE425") or check_MCU("DIE457"))) {
                HSEOSC.nodetype = .source;
                HSEOSC.value = HSE_VALUEValue;
            }
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

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if ((config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC) and (false)) {
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
            if (config.flags.USBUsed_ForRCC) {
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

            //======= LPTIMFreq_Value ========
            const LPTIMFreq_ValueValue = LPTIMOutput.get_as_ref();
            ignore_value(LPTIMFreq_ValueValue);

            //======= LPUARTFreq_Value ========
            const LPUARTFreq_ValueValue = LPUARTOutput.get_as_ref();
            ignore_value(LPUARTFreq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2Output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1Output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1Output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3Output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);

            //======= MCOPinFreq_Value ========
            const MCOPinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCOPinFreq_ValueValue);

            //======= 48USBFreq_Value ========
            const @"48USBFreq_ValueValue" = @"48USBOutput".get_as_ref();
            ignore_value(@"48USBFreq_ValueValue");

            @"48USBOutput".limit = .{
                .min = 4.788e7,
                .max = 4.812e7,
            };

            //======= 48RNGFreq_Value ========
            const @"48RNGFreq_ValueValue" = @"48RNGOutput".get_as_ref();
            ignore_value(@"48RNGFreq_ValueValue");

            @"48RNGOutput".limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCOutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOIIuput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOIIuput.limit = .{
                    .min = 2e6,
                    .max = 2.4e7,
                };
            }

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
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and ((check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE1, .@"=")))) {
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
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) and ((check_ref(@TypeOf(PWR_Regulator_Voltage_ScaleValue), PWR_Regulator_Voltage_ScaleValue, .PWR_REGULATOR_VOLTAGE_SCALE1, .@"=")))) {
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

            //======= 48CLKFreq_Value ========
            const @"48CLKFreq_ValueValue" = @"48CLK".get_as_ref();
            ignore_value(@"48CLKFreq_ValueValue");

            const VDD_VALUEValue: f32 = blk: {
                if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@">"))) {
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
                                "(HCLKFreq_Value > 16000000)",
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
                                "(HCLKFreq_Value > 16000000)",
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
                if ((((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 4200000, .@"="))))) and (scale3)) or (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"="))))) and (scale2)) or (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"="))))) and (scale1 or scale11))) {
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
                                "   (((HCLKFreq_Value > 0) & ((HCLKFreq_Value <  4200000)|((HCLKFreq_Value =4200000))))& (scale3))|   (((HCLKFreq_Value > 0) & ((HCLKFreq_Value <  8000000)|((HCLKFreq_Value =8000000))))& (scale2))|   (((HCLKFreq_Value > 0) & ((HCLKFreq_Value < 16000000)|((HCLKFreq_Value =16000000))))& (scale1|scale11))",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if ((((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"="))))) and (scale2)) or (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"="))))) and (scale1 or scale11))) {
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
                                "   (((HCLKFreq_Value > 8000000) & ((HCLKFreq_Value <  16000000)|((HCLKFreq_Value =16000000))))& (scale2))|   (((HCLKFreq_Value > 16000000) & ((HCLKFreq_Value <  32000000)|((HCLKFreq_Value =32000000))))& (scale1|scale11)) ",
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
            out.MSIRC = try MSIRC.get_output();
            out.HSI48RC = try HSI48RC.get_output();
            out.HSIRCDiv = try HSIRCDiv.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.LCDOutput = try LCDOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
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
            out.LPTIMMult = try LPTIMMult.get_output();
            out.LPTIMOutput = try LPTIMOutput.get_output();
            out.LPUARTMult = try LPUARTMult.get_output();
            out.LPUARTOutput = try LPUARTOutput.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2Output = try USART2Output.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1Output = try USART1Output.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1Output = try I2C1Output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3Output = try I2C3Output.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.HSI48MUL = try HSI48MUL.get_output();
            out.@"48USBOutput" = try @"48USBOutput".get_output();
            out.@"48RNGOutput" = try @"48RNGOutput".get_output();
            out.ADCOutput = try ADCOutput.get_output();
            out.VCOIIuput = try VCOIIuput.get_output();
            out.PLLMUL = try PLLMUL.get_output();
            out.PLLDIV = try PLLDIV.get_output();
            out.DIV2USB = try DIV2USB.get_output();
            out.HSI = try HSI.get_extra_output();
            out.MSI = try MSI.get_extra_output();
            out.HSE_RTC = try HSE_RTC.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.@"48CLK" = try @"48CLK".get_extra_output();
            out.TIMCLK = 0;
            ignore_value(HSI16_VALUEValue);
            ref_out.MSIClockRange = MSIClockRangeValue;
            ignore_value(HSI48_VALUEValue);
            ref_out.flags.HSIRCDiv = HSIRCDivValue != .@"0";
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ref_out.RTCClockSelectionVirtual = RTCClockSelectionVirtualValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(LCDFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(SYSCLKFreq_VALUEValue);
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
            ref_out.LptimClockSelection = LptimClockSelectionValue;
            ignore_value(LPTIMFreq_ValueValue);
            ref_out.Lpuart1ClockSelection = Lpuart1ClockSelectionValue;
            ignore_value(LPUARTFreq_ValueValue);
            ref_out.Usart2ClockSelection = Usart2ClockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.Usart1ClockSelection = Usart1ClockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.I2c1ClockSelection = I2c1ClockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2c3ClockSelection = I2c3ClockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ref_out.RCC_MCOSource = RCC_MCOSourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCOPinFreq_ValueValue);
            ref_out.HSI48MClockSelection = HSI48MClockSelectionValue;
            ignore_value(@"48USBFreq_ValueValue");
            ignore_value(@"48RNGFreq_ValueValue");
            ignore_value(ADCFreq_ValueValue);
            ignore_value(VCOInputFreq_ValueValue);
            ref_out.PLLMUL = PLLMULValue;
            ref_out.PLLDIV = PLLDIVValue;
            ref_out.DIV2USB = DIV2USBValue;
            ignore_value(HSI_VALUEValue);
            ignore_value(MSI_VALUEValue);
            ignore_value(RTCHSEDivFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ignore_value(@"48CLKFreq_ValueValue");
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.MSICalibrationValue = MSICalibrationValueValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
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
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.LPTIMEnable = LPTIMEnableValue == .true;
            ref_out.flags.LPUARTEnable = LPUARTEnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.@"48MEnable" = @"48MEnableValue" == .true;
            ref_out.flags.LSIUsed = LSIUsedValue != 0;
            ref_out.flags.HSI48Used = HSI48UsedValue != 0;
            ref_out.flags.MSIUsed = MSIUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
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
