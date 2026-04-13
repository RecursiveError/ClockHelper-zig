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
        pub const RCC_PLLSRC = enum(u2) {
            HSI_Div2 = 0,
            HSI_Div_PREDIV = 1,
            HSE_Div_PREDIV = 2,
            HSI48_Div_PREDIV = 3,
        };
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
            Div32 = 5,
            Div64 = 6,
            Div128 = 7,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const RCC_PLLMUL = enum(u4) {
            Mul2 = 0,
            Mul3 = 1,
            Mul4 = 2,
            Mul5 = 3,
            Mul6 = 4,
            Mul7 = 5,
            Mul8 = 6,
            Mul9 = 7,
            Mul10 = 8,
            Mul11 = 9,
            Mul12 = 10,
            Mul13 = 11,
            Mul14 = 12,
            Mul15 = 13,
            Mul16 = 14,
        };
        pub const RCC_PREDIV = enum(u4) {
            Div1 = 0,
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
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumHigh = 1,
            MediumLow = 2,
            High = 3,
        };
        pub const RCC_SW = enum(u2) {
            HSI = 0,
            HSE = 1,
            PLL1_P = 2,
            HSI48 = 3,
        };
        pub const RCC_MCOSEL = enum(u4) {
            HSI14 = 1,
            LSI = 2,
            LSE = 3,
            SYS = 4,
            HSI = 5,
            HSE = 6,
            PLL = 7,
            HSI48 = 8,
        };
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
        pub const RCC_CECSW = enum(u1) {
            HSI_DIV_244 = 0,
            LSE = 1,
        };
        pub const RCC_ICSW = enum(u1) {
            HSI = 0,
            SYS = 1,
        };
        pub const RCC_USARTSW = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            LSE = 2,
            HSI = 3,
        };
        pub const FLASH_LATENCY = enum(u3) {
            WS0 = 0,
            WS1 = 1,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };

        pub const CECClockSelectionList = enum {
            RCC_CECCLKSOURCE_HSI,
            RCC_CECCLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_CECSW {
                return switch (self) {
                    .RCC_CECCLKSOURCE_HSI => .HSI_DIV_244,
                    .RCC_CECCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_CECSW) anyerror!@This() {
                return switch (item) {
                    .HSI_DIV_244 => .RCC_CECCLKSOURCE_HSI,
                    .LSE => .RCC_CECCLKSOURCE_LSE,
                };
            }
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSI48,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_HSI48 => .HSI48,
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_P,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .HSI48 => .RCC_SYSCLKSOURCE_HSI48,
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .PLL1_P => .RCC_SYSCLKSOURCE_PLLCLK,
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

        pub const RCC_MCOMult_Clock_Source_FROM_PLLMULList = enum {
            RCC_MCO1SOURCE_PLLCLK,
            RCC_MCO1SOURCE_PLLCLK_DIV2,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCO1SOURCE_PLLCLK => 1,
                    .RCC_MCO1SOURCE_PLLCLK_DIV2 => 2,
                };
            }
        };

        pub const RCC_MCOSourceList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSI48,
            RCC_MCO1SOURCE_HSI14,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_LSE,
            MCOMultDivisor,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI14 => .HSI14,
                    .MCOMultDivisor => .PLL,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI14 => .RCC_MCO1SOURCE_HSI14,
                    .PLL => .MCOMultDivisor,
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
            RCC_MCODIV_32,
            RCC_MCODIV_64,
            RCC_MCODIV_128,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCODIV_128 => .Div128,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_32 => .Div32,
                    .RCC_MCODIV_64 => .Div64,
                    .RCC_MCODIV_16 => .Div16,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div128 => .RCC_MCODIV_128,
                    .Div1 => .RCC_MCODIV_1,
                    .Div4 => .RCC_MCODIV_4,
                    .Div2 => .RCC_MCODIV_2,
                    .Div8 => .RCC_MCODIV_8,
                    .Div32 => .RCC_MCODIV_32,
                    .Div64 => .RCC_MCODIV_64,
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
                    .RCC_MCODIV_32 => 32,
                    .RCC_MCODIV_64 => 64,
                    .RCC_MCODIV_128 => 128,
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

        pub const TimSys_DivList = enum {
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

        pub const I2c1ClockSelectionList = enum {
            RCC_I2C1CLKSOURCE_SYSCLK,
            RCC_I2C1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_ICSW {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_ICSW) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
                };
            }
        };

        pub const Usart1ClockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK1,
            RCC_USART1CLKSOURCE_SYSCLK,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSW {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_USART1CLKSOURCE_PCLK1,
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
                };
            }
        };

        pub const Usart2ClockSelectionList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSW {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART2CLKSOURCE_HSI => .HSI,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                };
            }
        };

        pub const Usart3ClockSelectionList = enum {
            RCC_USART3CLKSOURCE_PCLK1,
            RCC_USART3CLKSOURCE_SYSCLK,
            RCC_USART3CLKSOURCE_HSI,
            RCC_USART3CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSW {
                return switch (self) {
                    .RCC_USART3CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                    .SYS => .RCC_USART3CLKSOURCE_SYSCLK,
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_HSI48,
            RCC_PLLSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSI => .HSI_Div_PREDIV,
                    .RCC_PLLSOURCE_HSI48 => .HSI48_Div_PREDIV,
                    .RCC_PLLSOURCE_HSE => .HSE_Div_PREDIV,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSI_Div_PREDIV => .RCC_PLLSOURCE_HSI,
                    .HSI48_Div_PREDIV => .RCC_PLLSOURCE_HSI48,
                    .HSE_Div_PREDIV => .RCC_PLLSOURCE_HSE,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLSRC", @tagName(item), "PLLSourceVirtual" },
                    ),
                };
            }
        };

        pub const PLLDividerList = enum {
            RCC_PREDIV_DIV1,
            RCC_PREDIV_DIV2,
            RCC_PREDIV_DIV3,
            RCC_PREDIV_DIV4,
            RCC_PREDIV_DIV5,
            RCC_PREDIV_DIV6,
            RCC_PREDIV_DIV7,
            RCC_PREDIV_DIV8,
            RCC_PREDIV_DIV9,
            RCC_PREDIV_DIV10,
            RCC_PREDIV_DIV11,
            RCC_PREDIV_DIV12,
            RCC_PREDIV_DIV13,
            RCC_PREDIV_DIV14,
            RCC_PREDIV_DIV15,
            RCC_PREDIV_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PREDIV {
                return switch (self) {
                    .RCC_PREDIV_DIV8 => .Div8,
                    .RCC_PREDIV_DIV14 => .Div14,
                    .RCC_PREDIV_DIV4 => .Div4,
                    .RCC_PREDIV_DIV6 => .Div6,
                    .RCC_PREDIV_DIV11 => .Div11,
                    .RCC_PREDIV_DIV12 => .Div12,
                    .RCC_PREDIV_DIV1 => .Div1,
                    .RCC_PREDIV_DIV16 => .Div16,
                    .RCC_PREDIV_DIV3 => .Div3,
                    .RCC_PREDIV_DIV10 => .Div10,
                    .RCC_PREDIV_DIV7 => .Div7,
                    .RCC_PREDIV_DIV9 => .Div9,
                    .RCC_PREDIV_DIV13 => .Div13,
                    .RCC_PREDIV_DIV5 => .Div5,
                    .RCC_PREDIV_DIV15 => .Div15,
                    .RCC_PREDIV_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_PREDIV) anyerror!@This() {
                return switch (item) {
                    .Div8 => .RCC_PREDIV_DIV8,
                    .Div14 => .RCC_PREDIV_DIV14,
                    .Div4 => .RCC_PREDIV_DIV4,
                    .Div6 => .RCC_PREDIV_DIV6,
                    .Div11 => .RCC_PREDIV_DIV11,
                    .Div12 => .RCC_PREDIV_DIV12,
                    .Div1 => .RCC_PREDIV_DIV1,
                    .Div16 => .RCC_PREDIV_DIV16,
                    .Div3 => .RCC_PREDIV_DIV3,
                    .Div10 => .RCC_PREDIV_DIV10,
                    .Div7 => .RCC_PREDIV_DIV7,
                    .Div9 => .RCC_PREDIV_DIV9,
                    .Div13 => .RCC_PREDIV_DIV13,
                    .Div5 => .RCC_PREDIV_DIV5,
                    .Div15 => .RCC_PREDIV_DIV15,
                    .Div2 => .RCC_PREDIV_DIV2,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PREDIV_DIV1 => 1,
                    .RCC_PREDIV_DIV2 => 2,
                    .RCC_PREDIV_DIV3 => 3,
                    .RCC_PREDIV_DIV4 => 4,
                    .RCC_PREDIV_DIV5 => 5,
                    .RCC_PREDIV_DIV6 => 6,
                    .RCC_PREDIV_DIV7 => 7,
                    .RCC_PREDIV_DIV8 => 8,
                    .RCC_PREDIV_DIV9 => 9,
                    .RCC_PREDIV_DIV10 => 10,
                    .RCC_PREDIV_DIV11 => 11,
                    .RCC_PREDIV_DIV12 => 12,
                    .RCC_PREDIV_DIV13 => 13,
                    .RCC_PREDIV_DIV14 => 14,
                    .RCC_PREDIV_DIV15 => 15,
                    .RCC_PREDIV_DIV16 => 16,
                };
            }
        };

        pub const PLLMULList = enum {
            RCC_PLL_MUL2,
            RCC_PLL_MUL3,
            RCC_PLL_MUL4,
            RCC_PLL_MUL5,
            RCC_PLL_MUL6,
            RCC_PLL_MUL7,
            RCC_PLL_MUL8,
            RCC_PLL_MUL9,
            RCC_PLL_MUL10,
            RCC_PLL_MUL11,
            RCC_PLL_MUL12,
            RCC_PLL_MUL13,
            RCC_PLL_MUL14,
            RCC_PLL_MUL15,
            RCC_PLL_MUL16,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLMUL {
                return switch (self) {
                    .RCC_PLL_MUL7 => .Mul7,
                    .RCC_PLL_MUL16 => .Mul16,
                    .RCC_PLL_MUL2 => .Mul2,
                    .RCC_PLL_MUL6 => .Mul6,
                    .RCC_PLL_MUL13 => .Mul13,
                    .RCC_PLL_MUL15 => .Mul15,
                    .RCC_PLL_MUL9 => .Mul9,
                    .RCC_PLL_MUL3 => .Mul3,
                    .RCC_PLL_MUL14 => .Mul14,
                    .RCC_PLL_MUL11 => .Mul11,
                    .RCC_PLL_MUL4 => .Mul4,
                    .RCC_PLL_MUL8 => .Mul8,
                    .RCC_PLL_MUL10 => .Mul10,
                    .RCC_PLL_MUL12 => .Mul12,
                    .RCC_PLL_MUL5 => .Mul5,
                };
            }
            pub fn from_enum(item: RCC_PLLMUL) anyerror!@This() {
                return switch (item) {
                    .Mul7 => .RCC_PLL_MUL7,
                    .Mul16 => .RCC_PLL_MUL16,
                    .Mul2 => .RCC_PLL_MUL2,
                    .Mul6 => .RCC_PLL_MUL6,
                    .Mul13 => .RCC_PLL_MUL13,
                    .Mul15 => .RCC_PLL_MUL15,
                    .Mul9 => .RCC_PLL_MUL9,
                    .Mul3 => .RCC_PLL_MUL3,
                    .Mul14 => .RCC_PLL_MUL14,
                    .Mul11 => .RCC_PLL_MUL11,
                    .Mul4 => .RCC_PLL_MUL4,
                    .Mul8 => .RCC_PLL_MUL8,
                    .Mul10 => .RCC_PLL_MUL10,
                    .Mul12 => .RCC_PLL_MUL12,
                    .Mul5 => .RCC_PLL_MUL5,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLL_MUL2 => 2,
                    .RCC_PLL_MUL3 => 3,
                    .RCC_PLL_MUL4 => 4,
                    .RCC_PLL_MUL5 => 5,
                    .RCC_PLL_MUL6 => 6,
                    .RCC_PLL_MUL7 => 7,
                    .RCC_PLL_MUL8 => 8,
                    .RCC_PLL_MUL9 => 9,
                    .RCC_PLL_MUL10 => 10,
                    .RCC_PLL_MUL11 => 11,
                    .RCC_PLL_MUL12 => 12,
                    .RCC_PLL_MUL13 => 13,
                    .RCC_PLL_MUL14 => 14,
                    .RCC_PLL_MUL15 => 15,
                    .RCC_PLL_MUL16 => 16,
                };
            }
        };

        pub const INSTRUCTION_CACHE_ENABLEList = enum {
            @"0",
        };

        pub const PREFETCH_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const DATA_CACHE_ENABLEList = enum {
            @"0",
        };

        pub const FLatencyList = enum {
            FLASH_LATENCY_0,
            FLASH_LATENCY_1,

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_1 => .WS1,
                    .FLASH_LATENCY_0 => .WS0,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS1 => .FLASH_LATENCY_1,
                    .WS0 => .FLASH_LATENCY_0,
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

        pub const CECEnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const EnableLSEList = enum {
            true,
            false,
        };

        pub const EnableHSEList = enum {
            true,
            false,
        };

        pub const I2S1EnableList = enum {
            true,
            false,
        };

        pub const I2S2EnableList = enum {
            true,
            false,
        };

        pub const EnableHSERTCDevisorList = enum {
            true,
            false,
        };

        pub const RTCEnableList = enum {
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

        pub const I2C1EnableList = enum {
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

        pub const EnableMCOMultDivisorList = enum {
            true,
            false,
        };

        pub const EnableLSERTCList = enum {
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
            RTCUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            FLITFUsed_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            MCOUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSI48: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            RCC_MCO1SOURCE_HSI14: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM14: bool = false,
            RCC_I2C1CLKSOURCE_HSI: bool = false,
            TIM14: bool = false,
            RCC_USART3CLKSOURCE_HSI: bool = false,
            RCC_USART2CLKSOURCE_HSI: bool = false,
            RCC_USART1CLKSOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            Semaphore_input_Channel1TIM14: bool = false,
            RCC_RTC_Clock_Source: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_MCO1SOURCE_PLLCLK_DIV2: bool = false,
            RCC_HCLK_DIV1: bool = false,
            RCC_CECCLKSOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
            RCC_PLLSOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_LSI: bool = false,
            channelSelectedADC: bool = false,
            RCC_MCO1SOURCE_HSE: bool = false,
            RCC_USART1CLKSOURCE_LSE: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_USART2CLKSOURCE_LSE: bool = false,
            RCC_USART3CLKSOURCE_LSE: bool = false,
            SEM2RCC_HSE_REQUIRED_TIM14: bool = false,
            RCC_CECCLKSOURCE_LSE: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
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
            RTCUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            FLITFUsed_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            MCOUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSI48: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            RCC_MCO1SOURCE_HSI14: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM14: bool = false,
            RCC_I2C1CLKSOURCE_HSI: bool = false,
            TIM14: bool = false,
            RCC_USART3CLKSOURCE_HSI: bool = false,
            RCC_USART2CLKSOURCE_HSI: bool = false,
            RCC_USART1CLKSOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            Semaphore_input_Channel1TIM14: bool = false,
            RCC_RTC_Clock_Source: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_MCO1SOURCE_PLLCLK_DIV2: bool = false,
            RCC_HCLK_DIV1: bool = false,
            RCC_CECCLKSOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
            RCC_PLLSOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_LSI: bool = false,
            channelSelectedADC: bool = false,
            RCC_MCO1SOURCE_HSE: bool = false,
            RCC_USART1CLKSOURCE_LSE: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_USART2CLKSOURCE_LSE: bool = false,
            RCC_USART3CLKSOURCE_LSE: bool = false,
            SEM2RCC_HSE_REQUIRED_TIM14: bool = false,
            RCC_CECCLKSOURCE_LSE: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            PREFETCH_ENABLE: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            HSI14Used: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            CECEnable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            I2S1Enable: bool = false, //Reference flag
            I2S2Enable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            EnableMCOMultDivisor: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            HSEUsed: bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            HSI48Used: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSI14CalibrationValue: ?u32 = null,
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
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            LSE_VALUE: ?f32 = null,
            CECClockSelection: ?CECClockSelectionList = null,
            HSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: ?RCC_MCOMult_Clock_Source_FROM_PLLMULList = null,
            RCC_MCOSource: ?RCC_MCOSourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            TimSys_Div: ?TimSys_DivList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            I2c1ClockSelection: ?I2c1ClockSelectionList = null,
            Usart1ClockSelection: ?Usart1ClockSelectionList = null,
            Usart2ClockSelection: ?Usart2ClockSelectionList = null,
            Usart3ClockSelection: ?Usart3ClockSelectionList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLDivider: ?PLLDividerList = null,
            PLLMUL: ?PLLMULList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSICECDiv: u32,
            CECClockSelection: CECClockSelectionList,
            SYSCLKSource: SYSCLKSourceList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: RCC_MCOMult_Clock_Source_FROM_PLLMULList,
            RCC_MCOSource: RCC_MCOSourceList,
            RCC_MCODiv: RCC_MCODivList,
            AHBCLKDivider: AHBCLKDividerList,
            TimSys_Div: TimSys_DivList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            I2c1ClockSelection: I2c1ClockSelectionList,
            Usart1ClockSelection: Usart1ClockSelectionList,
            Usart2ClockSelection: Usart2ClockSelectionList,
            Usart3ClockSelection: Usart3ClockSelectionList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLDivider: PLLDividerList,
            PLLMUL: PLLMULList,
            VDD_VALUE: f32,
            INSTRUCTION_CACHE_ENABLE: INSTRUCTION_CACHE_ENABLEList,
            DATA_CACHE_ENABLE: DATA_CACHE_ENABLEList,
            FLatency: FLatencyList,
            HSICalibrationValue: ?u32,
            HSI14CalibrationValue: ?u32,
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
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSI14CalibrationValue: ?u32 = null,
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
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .HSI14CalibrationValue = self.HSI14CalibrationValue,
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
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            LSE_VALUE: ?f32 = null,
            CECClockSelection: ?RCC_CECSW = null,
            HSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: ?RCC_MCOMult_Clock_Source_FROM_PLLMULList = null,
            RCC_MCOSource: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            TimSys_Div: ?TimSys_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            I2c1ClockSelection: ?RCC_ICSW = null,
            Usart1ClockSelection: ?RCC_USARTSW = null,
            Usart2ClockSelection: ?RCC_USARTSW = null,
            Usart3ClockSelection: ?RCC_USARTSW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLDivider: ?RCC_PREDIV = null,
            PLLMUL: ?RCC_PLLMUL = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .LSE_VALUE = self.LSE_VALUE,
                    .CECClockSelection = if (self.CECClockSelection) |val| try CECClockSelectionList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .RCC_MCOMult_Clock_Source_FROM_PLLMUL = self.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
                    .RCC_MCOSource = if (self.RCC_MCOSource) |val| try RCC_MCOSourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .TimSys_Div = self.TimSys_Div,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .I2c1ClockSelection = if (self.I2c1ClockSelection) |val| try I2c1ClockSelectionList.from_enum(val) else null,
                    .Usart1ClockSelection = if (self.Usart1ClockSelection) |val| try Usart1ClockSelectionList.from_enum(val) else null,
                    .Usart2ClockSelection = if (self.Usart2ClockSelection) |val| try Usart2ClockSelectionList.from_enum(val) else null,
                    .Usart3ClockSelection = if (self.Usart3ClockSelection) |val| try Usart3ClockSelectionList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLDivider = if (self.PLLDivider) |val| try PLLDividerList.from_enum(val) else null,
                    .PLLMUL = if (self.PLLMUL) |val| try PLLMULList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSICECDiv: u32,
            CECClockSelection: RCC_CECSW,
            SYSCLKSource: RCC_SW,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: RCC_MCOMult_Clock_Source_FROM_PLLMULList,
            RCC_MCOSource: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            AHBCLKDivider: RCC_HPRE,
            TimSys_Div: TimSys_DivList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            I2c1ClockSelection: RCC_ICSW,
            Usart1ClockSelection: RCC_USARTSW,
            Usart2ClockSelection: RCC_USARTSW,
            Usart3ClockSelection: RCC_USARTSW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLDivider: RCC_PREDIV,
            PLLMUL: RCC_PLLMUL,
            VDD_VALUE: f32,
            INSTRUCTION_CACHE_ENABLE: INSTRUCTION_CACHE_ENABLEList,
            DATA_CACHE_ENABLE: DATA_CACHE_ENABLEList,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: ?u32,
            HSI14CalibrationValue: ?u32,
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
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSICECDiv = cubemx_config.HSICECDiv,
                    .CECClockSelection = try cubemx_config.CECClockSelection.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .RCC_MCOMult_Clock_Source_FROM_PLLMUL = cubemx_config.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
                    .RCC_MCOSource = try cubemx_config.RCC_MCOSource.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .TimSys_Div = cubemx_config.TimSys_Div,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .I2c1ClockSelection = try cubemx_config.I2c1ClockSelection.to_enum(),
                    .Usart1ClockSelection = try cubemx_config.Usart1ClockSelection.to_enum(),
                    .Usart2ClockSelection = try cubemx_config.Usart2ClockSelection.to_enum(),
                    .Usart3ClockSelection = try cubemx_config.Usart3ClockSelection.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLDivider = try cubemx_config.PLLDivider.to_enum(),
                    .PLLMUL = try cubemx_config.PLLMUL.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = cubemx_config.INSTRUCTION_CACHE_ENABLE,
                    .DATA_CACHE_ENABLE = cubemx_config.DATA_CACHE_ENABLE,
                    .FLatency = try cubemx_config.FLatency.to_enum(),
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .HSI14CalibrationValue = cubemx_config.HSI14CalibrationValue,
                    .Prescaler = cubemx_config.Prescaler,
                    .Source = cubemx_config.Source,
                    .Polarity = cubemx_config.Polarity,
                    .ReloadValueType = cubemx_config.ReloadValueType,
                    .ReloadValue = cubemx_config.ReloadValue,
                    .Fsync = cubemx_config.Fsync,
                    .ErrorLimitValue = cubemx_config.ErrorLimitValue,
                    .HSI48CalibrationValue = cubemx_config.HSI48CalibrationValue,
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
            FLITFCLKoutput: u32 = 0,
            HSICECDiv: u32 = 0,
            HSIRC48: u32 = 0,
            HSIRC14: u32 = 0,
            ADCoutput: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            CECMult: u32 = 0,
            CECOutput: u32 = 0,
            HSEOSC: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            I2SOutput: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            MCOMultDivisor: u32 = 0,
            MCOMult: u32 = 0,
            MCODivider: u32 = 0,
            MCOoutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            TimSysPresc: u32 = 0,
            TimSysOutput: u32 = 0,
            APB1Prescaler: u32 = 0,
            APB1Output: u32 = 0,
            TimPrescalerAPB1: u32 = 0,
            TimPrescOut1: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1Output: u32 = 0,
            USART1Mult: u32 = 0,
            USART1Output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2Output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3Output: u32 = 0,
            PLLSource: u32 = 0,
            PLLDiv: u32 = 0,
            VCO2output: u32 = 0,
            PLLMUL: u32 = 0,
            HSI_CEC: u32 = 0,
            PLLCLK_MCO: u32 = 0,
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

            if (@inComptime()) @setEvalBranchQuota(1000000);
            var out = ClockOutput{};
            var ref_out: CubeMXOutputConfig = undefined;

            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY0: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY1: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var FLITFCLKoutput = ClockNode{
                .name = "FLITFCLKoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSICECDiv = ClockNode{
                .name = "HSICECDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSIRC48 = ClockNode{
                .name = "HSIRC48",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSIRC14 = ClockNode{
                .name = "HSIRC14",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADCoutput = ClockNode{
                .name = "ADCoutput",
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

            var CECMult = ClockNode{
                .name = "CECMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CECOutput = ClockNode{
                .name = "CECOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSEOSC = ClockNode{
                .name = "HSEOSC",
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

            var I2SOutput = ClockNode{
                .name = "I2SOutput",
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

            var IWDGOutput = ClockNode{
                .name = "IWDGOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCOMultDivisor = ClockNode{
                .name = "MCOMultDivisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCOMult = ClockNode{
                .name = "MCOMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCODivider = ClockNode{
                .name = "MCODivider",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCOoutput = ClockNode{
                .name = "MCOoutput",
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

            var FCLKCortexOutput = ClockNode{
                .name = "FCLKCortexOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimSysPresc = ClockNode{
                .name = "TimSysPresc",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimSysOutput = ClockNode{
                .name = "TimSysOutput",
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

            var USART3Mult = ClockNode{
                .name = "USART3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART3Output = ClockNode{
                .name = "USART3Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSource = ClockNode{
                .name = "PLLSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDiv = ClockNode{
                .name = "PLLDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCO2output = ClockNode{
                .name = "VCO2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLMUL = ClockNode{
                .name = "PLLMUL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLCLK_MCO = ClockNode{
                .name = "PLLCLK_MCO",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLCLK = ClockNode{
                .name = "PLLCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 8e6;
            };

            const HSICECDivValue: u32 = blk: {
                break :blk 244;
            };

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const HSI14_VALUEValue: f32 = blk: {
                break :blk 1.4e7;
            };

            const LSI_VALUEValue: f32 = blk: {
                break :blk 4e4;
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
                        .main_expr = "LSEOscillator",
                        .main_dialog = "LSE In crystal Mode",
                    };
                    break :blk 3.2768e4;
                }
                const user_val = config.LSE_VALUE;
                LSEOSC.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 3.2768e4;
            };

            const CECClockSelectionValue: CECClockSelectionList = blk: {
                const user_val = config.CECClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CECCLKSOURCE_HSI => {},
                        .RCC_CECCLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_CECCLKSOURCE_HSI;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 3.2e7,
                        .main_expr = "HSEByPass",
                        .main_dialog = "HSE in bypass Mode",
                    };
                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 3.2e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 8e6;
            };

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_HSI => SysSourceHSI = true,
                        .RCC_SYSCLKSOURCE_HSI48 => SysSourceHSI48 = true,
                        .RCC_SYSCLKSOURCE_HSE => SysSourceHSE = true,
                        .RCC_SYSCLKSOURCE_PLLCLK => SysSourcePLL = true,
                    }
                }
                break :blk user_val orelse {
                    SysSourceHSI = true;
                    break :blk .RCC_SYSCLKSOURCE_HSI;
                };
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: u32 = blk: {
                break :blk 32;
            };

            const RTCClockSelectionValue: RTCClockSelectionList = blk: {
                const user_val = config.RTCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => {},
                        .RCC_RTCCLKSOURCE_LSI => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV32 => {},
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_LSI;
            };

            const RCC_MCOMult_Clock_Source_FROM_PLLMULValue: RCC_MCOMult_Clock_Source_FROM_PLLMULList = blk: {
                const user_val = config.RCC_MCOMult_Clock_Source_FROM_PLLMUL;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_PLLCLK => {},
                        .RCC_MCO1SOURCE_PLLCLK_DIV2 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_PLLCLK;
            };

            const RCC_MCOSourceValue: RCC_MCOSourceList = blk: {
                const user_val = config.RCC_MCOSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => {},
                        .RCC_MCO1SOURCE_HSI => {},
                        .RCC_MCO1SOURCE_HSI48 => {},
                        .RCC_MCO1SOURCE_HSI14 => {},
                        .RCC_MCO1SOURCE_HSE => {},
                        .RCC_MCO1SOURCE_LSI => {},
                        .RCC_MCO1SOURCE_LSE => {},
                        .MCOMultDivisor => {},
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
                        .RCC_MCODIV_32 => {},
                        .RCC_MCODIV_64 => {},
                        .RCC_MCODIV_128 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCODIV_1;
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

            const TimSys_DivValue: TimSys_DivList = blk: {
                const user_val = config.TimSys_Div;

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

            const I2c1ClockSelectionValue: I2c1ClockSelectionList = blk: {
                const user_val = config.I2c1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_SYSCLK => {},
                        .RCC_I2C1CLKSOURCE_HSI => {},
                    }
                }
                break :blk user_val orelse .RCC_I2C1CLKSOURCE_HSI;
            };

            const Usart1ClockSelectionValue: Usart1ClockSelectionList = blk: {
                const user_val = config.Usart1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK1 => {},
                        .RCC_USART1CLKSOURCE_SYSCLK => {},
                        .RCC_USART1CLKSOURCE_HSI => {},
                        .RCC_USART1CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK1;
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

            const Usart3ClockSelectionValue: Usart3ClockSelectionList = blk: {
                const user_val = config.Usart3ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART3CLKSOURCE_PCLK1 => {},
                        .RCC_USART3CLKSOURCE_SYSCLK => {},
                        .RCC_USART3CLKSOURCE_HSI => {},
                        .RCC_USART3CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_USART3CLKSOURCE_PCLK1;
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                const user_val = config.PLLSourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_HSI => PLLSourceHSI = true,
                        .RCC_PLLSOURCE_HSI48 => PLLSourceHSI48 = true,
                        .RCC_PLLSOURCE_HSE => PLLSourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLLSourceHSI = true;
                    break :blk .RCC_PLLSOURCE_HSI;
                };
            };

            const PLLDividerValue: PLLDividerList = blk: {
                const user_val = config.PLLDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PREDIV_DIV1 => {},
                        .RCC_PREDIV_DIV2 => {},
                        .RCC_PREDIV_DIV3 => {},
                        .RCC_PREDIV_DIV4 => {},
                        .RCC_PREDIV_DIV5 => {},
                        .RCC_PREDIV_DIV6 => {},
                        .RCC_PREDIV_DIV7 => {},
                        .RCC_PREDIV_DIV8 => {},
                        .RCC_PREDIV_DIV9 => {},
                        .RCC_PREDIV_DIV10 => {},
                        .RCC_PREDIV_DIV11 => {},
                        .RCC_PREDIV_DIV12 => {},
                        .RCC_PREDIV_DIV13 => {},
                        .RCC_PREDIV_DIV14 => {},
                        .RCC_PREDIV_DIV15 => {},
                        .RCC_PREDIV_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_PREDIV_DIV1;
            };

            const PLLMULValue: PLLMULList = blk: {
                const user_val = config.PLLMUL;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLL_MUL2 => {},
                        .RCC_PLL_MUL3 => {},
                        .RCC_PLL_MUL4 => {},
                        .RCC_PLL_MUL5 => {},
                        .RCC_PLL_MUL6 => {},
                        .RCC_PLL_MUL7 => {},
                        .RCC_PLL_MUL8 => {},
                        .RCC_PLL_MUL9 => {},
                        .RCC_PLL_MUL10 => {},
                        .RCC_PLL_MUL11 => {},
                        .RCC_PLL_MUL12 => {},
                        .RCC_PLL_MUL13 => {},
                        .RCC_PLL_MUL14 => {},
                        .RCC_PLL_MUL15 => {},
                        .RCC_PLL_MUL16 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLL_MUL2;
            };

            const VDD_VALUEValue: f32 = blk: {
                if (check_MCU("STM32F0x0_Value_Line")) {
                    const user_val = config.extra_config.VDD_VALUE;
                    if (user_val) |val| {
                        if (val < 2.4e0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {e} found: {e}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "VDD_VALUE",
                                "STM32F0x0_Value_Line",
                                "must between 2 and 3.6",
                                2.4e0,
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
                                "STM32F0x0_Value_Line",
                                "must between 2 and 3.6",
                                3.6e0,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 3.3e0;
                } else if (check_MCU("STM32F0x8")) {
                    if (config.extra_config.VDD_VALUE) |val| {
                        if (val != 1.8e0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "VDD_VALUE",
                                "STM32F0x8",
                                "must be 1.8",
                                1.8e0,
                                val,
                            });
                        }
                    }
                    break :blk 1.8e0;
                }
                const user_val = config.extra_config.VDD_VALUE;
                if (user_val) |val| {
                    if (val < 2e0) {
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
                            2e0,
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
                break :blk .@"0";
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
                break :blk .@"0";
            };

            const PLLUsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or ((false or false) and ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSI, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (config.flags.CECUsed_ForRCC and (check_ref(@TypeOf(CECClockSelectionValue), CECClockSelectionValue, .RCC_CECCLKSOURCE_HSI, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig)) or (config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_HSI, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_HSI, .@"="))) or (config.flags.USART3Used_ForRCC and (check_ref(@TypeOf(Usart3ClockSelectionValue), Usart3ClockSelectionValue, .RCC_USART3CLKSOURCE_HSI, .@"="))) or (config.flags.I2C1Used_ForRCC and (check_ref(@TypeOf(I2c1ClockSelectionValue), I2c1ClockSelectionValue, .RCC_I2C1CLKSOURCE_HSI, .@"="))) or config.flags.FLITFUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSICalibrationValueValue: ?u32 = blk: {
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
                if (config.extra_config.HSICalibrationValue) |_| {
                    return comptime_fail_or_error(error.InvalidConfig,
                        \\
                        \\Error on {s} | expr: {s} diagnostic: {s} 
                        \\Value should be null.
                        \\note: some configurations are invalid in certain cases.
                        \\
                        \\
                    , .{ "HSICalibrationValue", "Else", "No additional information" });
                }
                break :blk null;
            };

            const HSI14UsedValue: u1 = blk: {
                if ((((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI14, .@"=")) and ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig)) or (config.flags.channelSelectedADC and config.flags.ADCUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSI14CalibrationValueValue: ?u32 = blk: {
                if (check_ref(@TypeOf(HSI14UsedValue), HSI14UsedValue, 1, .@"=")) {
                    const user_val = config.extra_config.HSI14CalibrationValue;
                    if (user_val) |val| {
                        if (val < 0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "HSI14CalibrationValue",
                                "HSI14Used=1",
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
                                "HSI14CalibrationValue",
                                "HSI14Used=1",
                                "HSI used",
                                31,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 16;
                }
                if (config.extra_config.HSI14CalibrationValue) |_| {
                    return comptime_fail_or_error(error.InvalidConfig,
                        \\
                        \\Error on {s} | expr: {s} diagnostic: {s} 
                        \\Value should be null.
                        \\note: some configurations are invalid in certain cases.
                        \\
                        \\
                    , .{ "HSI14CalibrationValue", "Else", "No additional information" });
                }
                break :blk null;
            };

            const PrescalerValue: ?PrescalerList = blk: {
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    if (config.extra_config.Prescaler) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Prescaler", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE ", "" });
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    break :blk null;
                } else if (config.flags.CRSActivatedSourceGPIO) {
                    break :blk .RCC_CRS_SYNC_SOURCE_GPIO;
                } else if (config.flags.CRSActivatedSourceLSE) {
                    break :blk .RCC_CRS_SYNC_SOURCE_LSE;
                }
                break :blk .RCC_CRS_SYNC_SOURCE_GPIO;
            };

            const PolarityValue: ?PolarityList = blk: {
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    if (config.extra_config.Polarity) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Polarity", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE ", "" });
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    if (config.extra_config.ReloadValueType) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ReloadValueType", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE ", "" });
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    if (config.extra_config.ReloadValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ReloadValue", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE ", "" });
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
                } else if (UserDefinedReload) {
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
                                "UserDefinedReload  ",
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
                                "UserDefinedReload  ",
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    if (config.extra_config.Fsync) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Fsync", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE ", "" });
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    if (config.extra_config.ErrorLimitValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ErrorLimitValue", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE ", "" });
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
                if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE) {
                    if (config.extra_config.HSI48CalibrationValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "HSI48CalibrationValue", "!CRSActivatedSourceGPIO & !CRSActivatedSourceLSE ", "" });
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
                if ((config.flags.CRSActivatedSourceLSE or (config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_LSE, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_LSE, .@"="))) or (config.flags.USART3Used_ForRCC and (check_ref(@TypeOf(Usart3ClockSelectionValue), Usart3ClockSelectionValue, .RCC_USART3CLKSOURCE_LSE, .@"="))) or (config.flags.CECUsed_ForRCC and (check_ref(@TypeOf(CECClockSelectionValue), CECClockSelectionValue, .RCC_CECCLKSOURCE_LSE, .@"="))) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig)) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=") and config.flags.RTCUsed_ForRCC))) {
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
                    break :blk user_val orelse .RCC_LSEDRIVE_HIGH;
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

            const CECEnableValue: CECEnableList = blk: {
                if (config.flags.CECUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (config.flags.channelSelectedADC and config.flags.ADCUsed_ForRCC) {
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

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S1EnableValue: I2S1EnableList = blk: {
                if (config.flags.I2S1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S2EnableValue: I2S2EnableList = blk: {
                if (config.flags.I2S2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if (config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                } else if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
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

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDGUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig) {
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

            const EnableMCOMultDivisorValue: EnableMCOMultDivisorList = blk: {
                if (config.flags.MCOUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if (config.flags.RTCUsed_ForRCC and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HSEUsedValue: u1 = blk: {
                if ((config.flags.SEM2RCC_HSE_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or ((config.flags.RTCUsed_ForRCC) and !((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) or ((PLLSourceHSE) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSE, .@"=")) and ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSIUsedValue: u1 = blk: {
                if ((config.flags.IWDGUsed_ForRCC or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (config.flags.RTCUsed_ForRCC)) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSI, .@"=")) and ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSI48UsedValue: u1 = blk: {
                if ((((PLLSourceHSI48) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI48, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI48, .@"=")) and ((config.flags.SEM2RCC_MCO_REQUIRED_TIM14 and config.flags.TIM14 and config.flags.Semaphore_input_Channel1TIM14) or config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if ((((PLLSourceHSE) and check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            // ======= NODE FLITFCLKoutput ======
            FLITFCLKoutput.nodetype = .output;
            FLITFCLKoutput.parents = &.{&HSIRC};

            // ======= NODE HSICECDiv ======
            HSICECDiv.nodetype = .div;
            HSICECDiv.value = @floatFromInt(HSICECDivValue);
            HSICECDiv.parents = &.{&HSIRC};

            // ======= NODE HSIRC48 ======
            if (!check_MCU("STM32F0x0_Value_Line")) {
                HSIRC48.nodetype = .source;
                HSIRC48.value = HSI48_VALUEValue;
            }
            // ======= NODE HSIRC14 ======
            HSIRC14.nodetype = .source;
            HSIRC14.value = HSI14_VALUEValue;

            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&HSIRC14};

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE CECMult ======
            CECMult.nodetype = .multi;
            CECMult.parents = switch (CECClockSelectionValue) {
                .RCC_CECCLKSOURCE_HSI => &.{&HSICECDiv},
                .RCC_CECCLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE CECOutput ======
            CECOutput.nodetype = .output;
            CECOutput.parents = &.{&CECMult};

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE SysClkSource ======
            if (check_MCU("STM32F0x0_Value_Line")) {
                SysClkSource.nodetype = .multi;
                SysClkSource.parents = switch (SYSCLKSourceValue) {
                    .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                    .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLMUL},
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
                        "SysClkSource",
                        "STM32F0x0_Value_Line",
                        "",
                        "SYSCLKSource",
                        if (patch_logs) @tagName(try SYSCLKSourceValue.to_enum()) else @tagName(SYSCLKSourceValue),
                        if (patch_logs) @tagName(try SYSCLKSourceList.to_enum(.RCC_SYSCLKSOURCE_HSI)) else @tagName(SYSCLKSourceList.RCC_SYSCLKSOURCE_HSI),
                        if (patch_logs) @tagName(try SYSCLKSourceList.to_enum(.RCC_SYSCLKSOURCE_HSE)) else @tagName(SYSCLKSourceList.RCC_SYSCLKSOURCE_HSE),
                        if (patch_logs) @tagName(try SYSCLKSourceList.to_enum(.RCC_SYSCLKSOURCE_PLLCLK)) else @tagName(SYSCLKSourceList.RCC_SYSCLKSOURCE_PLLCLK),
                    }),
                };
            }
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSI48 => &.{&HSIRC48},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLMUL},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE I2SOutput ======
            if (!check_MCU("STM32F0x0_Value_Line")) {
                I2SOutput.nodetype = .output;
                I2SOutput.parents = &.{&SysCLKOutput};
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

            // ======= NODE IWDGOutput ======
            IWDGOutput.nodetype = .output;
            IWDGOutput.parents = &.{&LSIRC};

            // ======= NODE MCOMultDivisor ======
            if (check_MCU("STM32F0x0_Value_Line")) {
                MCOMultDivisor.nodetype = .div;
                MCOMultDivisor.value = try RCC_MCOMult_Clock_Source_FROM_PLLMULValue.get();
                MCOMultDivisor.parents = &.{&PLLMUL};
            }
            MCOMultDivisor.nodetype = .div;
            MCOMultDivisor.value = try RCC_MCOMult_Clock_Source_FROM_PLLMULValue.get();
            MCOMultDivisor.parents = &.{&PLLMUL};

            // ======= NODE MCOMult ======
            if (check_MCU("STM32F0x0_Value_Line")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCOSourceValue) {
                    .MCOMultDivisor => &.{&MCOMultDivisor},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_HSI14 => &.{&HSIRC14},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
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
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                    , .{
                        "MCOMult",
                        "STM32F0x0_Value_Line",
                        "",
                        "RCC_MCOSource",
                        if (patch_logs) @tagName(try RCC_MCOSourceValue.to_enum()) else @tagName(RCC_MCOSourceValue),
                        if (patch_logs) @tagName(try RCC_MCOSourceList.to_enum(.MCOMultDivisor)) else @tagName(RCC_MCOSourceList.MCOMultDivisor),
                        if (patch_logs) @tagName(try RCC_MCOSourceList.to_enum(.RCC_MCO1SOURCE_HSI)) else @tagName(RCC_MCOSourceList.RCC_MCO1SOURCE_HSI),
                        if (patch_logs) @tagName(try RCC_MCOSourceList.to_enum(.RCC_MCO1SOURCE_HSI14)) else @tagName(RCC_MCOSourceList.RCC_MCO1SOURCE_HSI14),
                        if (patch_logs) @tagName(try RCC_MCOSourceList.to_enum(.RCC_MCO1SOURCE_HSE)) else @tagName(RCC_MCOSourceList.RCC_MCO1SOURCE_HSE),
                        if (patch_logs) @tagName(try RCC_MCOSourceList.to_enum(.RCC_MCO1SOURCE_LSI)) else @tagName(RCC_MCOSourceList.RCC_MCO1SOURCE_LSI),
                        if (patch_logs) @tagName(try RCC_MCOSourceList.to_enum(.RCC_MCO1SOURCE_LSE)) else @tagName(RCC_MCOSourceList.RCC_MCO1SOURCE_LSE),
                        if (patch_logs) @tagName(try RCC_MCOSourceList.to_enum(.RCC_MCO1SOURCE_SYSCLK)) else @tagName(RCC_MCOSourceList.RCC_MCO1SOURCE_SYSCLK),
                    }),
                };
            }
            MCOMult.nodetype = .multi;
            MCOMult.parents = switch (RCC_MCOSourceValue) {
                .MCOMultDivisor => &.{&MCOMultDivisor},
                .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                .RCC_MCO1SOURCE_HSI48 => &.{&HSIRC48},
                .RCC_MCO1SOURCE_HSI14 => &.{&HSIRC14},
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
            };

            // ======= NODE MCODivider ======
            MCODivider.nodetype = .div;
            MCODivider.value = try RCC_MCODivValue.get();
            MCODivider.parents = &.{&MCOMult};

            // ======= NODE MCOoutput ======
            MCOoutput.nodetype = .output;
            MCOoutput.parents = &.{&MCODivider};

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

            // ======= NODE FCLKCortexOutput ======
            FCLKCortexOutput.nodetype = .output;
            FCLKCortexOutput.parents = &.{&AHBOutput};

            // ======= NODE TimSysPresc ======
            TimSysPresc.nodetype = .div;
            TimSysPresc.value = try TimSys_DivValue.get();
            TimSysPresc.parents = &.{&AHBOutput};

            // ======= NODE TimSysOutput ======
            TimSysOutput.nodetype = .output;
            TimSysOutput.parents = &.{&TimSysPresc};

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

            // ======= NODE I2C1Mult ======
            I2C1Mult.nodetype = .multi;
            I2C1Mult.parents = switch (I2c1ClockSelectionValue) {
                .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
            };

            // ======= NODE I2C1Output ======
            I2C1Output.nodetype = .output;
            I2C1Output.parents = &.{&I2C1Mult};

            // ======= NODE USART1Mult ======
            USART1Mult.nodetype = .multi;
            USART1Mult.parents = switch (Usart1ClockSelectionValue) {
                .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_USART1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
            };

            // ======= NODE USART1Output ======
            USART1Output.nodetype = .output;
            USART1Output.parents = &.{&USART1Mult};

            // ======= NODE USART2Mult ======
            if (!check_MCU("STM32F0x0_Value_Line")) {
                USART2Mult.nodetype = .multi;
                USART2Mult.parents = switch (Usart2ClockSelectionValue) {
                    .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                };
            }
            // ======= NODE USART2Output ======
            if (!check_MCU("STM32F0x0_Value_Line")) {
                USART2Output.nodetype = .output;
                USART2Output.parents = &.{&USART2Mult};
            }
            // ======= NODE USART3Mult ======
            if (!check_MCU("STM32F0x0_Value_Line")) {
                USART3Mult.nodetype = .multi;
                USART3Mult.parents = switch (Usart3ClockSelectionValue) {
                    .RCC_USART3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART3CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART3CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_USART3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                };
            }
            // ======= NODE USART3Output ======
            if (!check_MCU("STM32F0x0_Value_Line")) {
                USART3Output.nodetype = .output;
                USART3Output.parents = &.{&USART3Mult};
            }
            // ======= NODE PLLSource ======
            if (check_MCU("STM32F0x0_Value_Line")) {
                PLLSource.nodetype = .multi;
                PLLSource.parents = switch (PLLSourceVirtualValue) {
                    .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                    .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
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
                        "PLLSource",
                        "STM32F0x0_Value_Line",
                        "",
                        "PLLSourceVirtual",
                        if (patch_logs) @tagName(try PLLSourceVirtualValue.to_enum()) else @tagName(PLLSourceVirtualValue),
                        if (patch_logs) @tagName(try PLLSourceVirtualList.to_enum(.RCC_PLLSOURCE_HSI)) else @tagName(PLLSourceVirtualList.RCC_PLLSOURCE_HSI),
                        if (patch_logs) @tagName(try PLLSourceVirtualList.to_enum(.RCC_PLLSOURCE_HSE)) else @tagName(PLLSourceVirtualList.RCC_PLLSOURCE_HSE),
                    }),
                };
            }
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                .RCC_PLLSOURCE_HSI48 => &.{&HSIRC48},
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE PLLDiv ======
            PLLDiv.nodetype = .div;
            PLLDiv.value = try PLLDividerValue.get();
            PLLDiv.parents = &.{&PLLSource};

            // ======= NODE VCO2output ======
            VCO2output.nodetype = .output;
            VCO2output.parents = &.{&PLLDiv};

            // ======= NODE PLLMUL ======
            PLLMUL.nodetype = .mul;
            PLLMUL.value = try PLLMULValue.get();
            PLLMUL.parents = &.{&VCO2output};

            // ======= NODE PLLCLK_MCO ======
            PLLCLK_MCO.nodetype = .output;
            PLLCLK_MCO.parents = &.{&MCOMultDivisor};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLLMUL};

            //======== POST REFS ========

            //======= FLITFCLKFreq_Value ========
            const FLITFCLKFreq_ValueValue = FLITFCLKoutput.get_as_ref();
            ignore_value(FLITFCLKFreq_ValueValue);

            //======= ADCoutputFreq_Value ========
            const ADCoutputFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCoutputFreq_ValueValue);

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECOutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            //======= I2SFreq_Value ========
            const I2SFreq_ValueValue = I2SOutput.get_as_ref();
            ignore_value(I2SFreq_ValueValue);

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(config.flags.RCC_RTC_Clock_Source) and !(config.flags.RCC_RTC_Clock_Source))) {
                RTCOutput.limit = .{
                    .min = null,
                    .max = 1e6,
                    .main_expr = "(!(RCC_RTC_Clock_Source=RCC_RTCCLKSOURCE_LSE)&!(RCC_RTC_Clock_Source=RCC_RTCCLKSOURCE_LSI))",
                    .main_dialog = "RTC Has HSE as source",
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= MCOFreq_Value ========
            const MCOFreq_ValueValue = MCOoutput.get_as_ref();
            ignore_value(MCOFreq_ValueValue);

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 4.8e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= TimSysFreq_Value ========
            const TimSysFreq_ValueValue = TimSysOutput.get_as_ref();
            ignore_value(TimSysFreq_ValueValue);

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);
            if (config.flags.RTCUsed_ForRCC) {
                const max_APB1Output = 48000000;
                const min_APB1Output = RTCFreq_ValueValue;

                APB1Output.limit = .{
                    .min = min_APB1Output,
                    .max = max_APB1Output,
                    .min_expr = "=RTCFreq_Value",
                    .max_expr = "48000000",
                    .main_expr = "RTCUsed_ForRCC",
                    .main_dialog = "LSE In crystal Mode",
                };
            } else {
                APB1Output.limit = .{
                    .min = null,
                    .max = 4.8e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1Output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1Output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2Output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3Output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);

            //======= VCOOutput2Freq_Value ========
            const VCOOutput2Freq_ValueValue = VCO2output.get_as_ref();
            ignore_value(VCOOutput2Freq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCO2output.limit = .{
                    .min = 1e6,
                    .max = 2.4e7,
                    .main_expr = "PLLUsed=1",
                    .main_dialog = "PLL not used",
                };
            }

            //======= PLLMCOFreq_Value ========
            const PLLMCOFreq_ValueValue = PLLCLK_MCO.get_as_ref();
            ignore_value(PLLMCOFreq_ValueValue);

            //======= PLLCLKFreq_Value ========
            const PLLCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = 1.6e7,
                    .max = 4.8e7,
                    .main_expr = "PLLUsed=1",
                    .main_dialog = "PLL not used",
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 0, .@">")) and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"<")) or ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"=")))))) {
                    FLASH_LATENCY0 = true;
                    break :blk .FLASH_LATENCY_0;
                }
                FLASH_LATENCY1 = true;
                break :blk .FLASH_LATENCY_1;
            };
            if (!(check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"="))) {
                HSICECDiv.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableLSEValue), EnableLSEValue, .true, .@"="))) {
                LSEOSC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"="))) {
                CECMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"="))) {
                CECOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                HSEOSC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S1EnableValue), I2S1EnableValue, .true, .@"=") or check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"="))) {
                I2SOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"="))) {
                HSERTCDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"="))) {
                RTCClkSource.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"="))) {
                RTCOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(IWDGEnableValue), IWDGEnableValue, .true, .@"="))) {
                IWDGOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOMultDivisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCODivider.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1Output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1Output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"="))) {
                USART2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"="))) {
                USART2Output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"="))) {
                USART3Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"="))) {
                USART3Output.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.FLITFCLKoutput = try FLITFCLKoutput.get_output();
            out.HSICECDiv = try HSICECDiv.get_output();
            out.HSIRC48 = try HSIRC48.get_output();
            out.HSIRC14 = try HSIRC14.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.CECMult = try CECMult.get_output();
            out.CECOutput = try CECOutput.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.I2SOutput = try I2SOutput.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.MCOMultDivisor = try MCOMultDivisor.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODivider = try MCODivider.get_output();
            out.MCOoutput = try MCOoutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.TimSysPresc = try TimSysPresc.get_output();
            out.TimSysOutput = try TimSysOutput.get_output();
            out.APB1Prescaler = try APB1Prescaler.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.TimPrescalerAPB1 = try TimPrescalerAPB1.get_output();
            out.TimPrescOut1 = try TimPrescOut1.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1Output = try I2C1Output.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1Output = try USART1Output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2Output = try USART2Output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3Output = try USART3Output.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.PLLDiv = try PLLDiv.get_output();
            out.VCO2output = try VCO2output.get_output();
            out.PLLMUL = try PLLMUL.get_output();
            out.HSI_CEC = 0;
            out.PLLCLK_MCO = try PLLCLK_MCO.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(FLITFCLKFreq_ValueValue);
            ref_out.HSICECDiv = HSICECDivValue;
            ignore_value(HSI48_VALUEValue);
            ignore_value(HSI14_VALUEValue);
            ignore_value(ADCoutputFreq_ValueValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ref_out.CECClockSelection = CECClockSelectionValue;
            ignore_value(CECFreq_ValueValue);
            ignore_value(HSE_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ignore_value(I2SFreq_ValueValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.RCC_MCOMult_Clock_Source_FROM_PLLMUL = RCC_MCOMult_Clock_Source_FROM_PLLMULValue;
            ref_out.RCC_MCOSource = RCC_MCOSourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCOFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.TimSys_Div = TimSys_DivValue;
            ignore_value(TimSysFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APB1Freq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APB1TimFreq_ValueValue);
            ref_out.I2c1ClockSelection = I2c1ClockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.Usart1ClockSelection = Usart1ClockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.Usart2ClockSelection = Usart2ClockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.Usart3ClockSelection = Usart3ClockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLLDivider = PLLDividerValue;
            ignore_value(VCOOutput2Freq_ValueValue);
            ref_out.PLLMUL = PLLMULValue;
            ignore_value(PLLMCOFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue;
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue;
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.HSI14CalibrationValue = HSI14CalibrationValueValue;
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
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.HSI14Used = HSI14UsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.CECEnable = CECEnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.I2S1Enable = I2S1EnableValue == .true;
            ref_out.flags.I2S2Enable = I2S2EnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.EnableMCOMultDivisor = EnableMCOMultDivisorValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.HSEUsed = HSEUsedValue != 0;
            ref_out.flags.LSIUsed = LSIUsedValue != 0;
            ref_out.flags.HSI48Used = HSI48UsedValue != 0;
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
