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
        pub const RCC_RNGDIV = enum(u2) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_PLLQ = enum(u3) {
            Div2 = 1,
            Div3 = 2,
            Div4 = 3,
            Div5 = 4,
            Div6 = 5,
            Div7 = 6,
            Div8 = 7,
        };
        pub const RCC_PLLR = enum(u3) {
            Div2 = 1,
            Div3 = 2,
            Div4 = 3,
            Div5 = 4,
            Div6 = 5,
            Div7 = 6,
            Div8 = 7,
        };
        pub const RCC_LPUART2SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
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
        pub const RCC_MCOPRE = enum(u4) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
            Div32 = 5,
            Div64 = 6,
            Div128 = 7,
            Div256 = 8,
            Div512 = 9,
            Div1024 = 10,
        };
        pub const RCC_SW = enum(u3) {
            HSI = 0,
            HSE = 1,
            PLL1_R = 2,
            LSI = 3,
            LSE = 4,
        };
        pub const FLASH_LATENCY = enum(u3) {
            WS0 = 0,
            WS1 = 1,
            WS2 = 2,
        };
        pub const RCC_I2C2I2S1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            I2S_CKIN = 3,
        };
        pub const RCC_TIM15SEL = enum(u1) {
            PCLK1_TIM = 0,
            PLL1_Q = 1,
        };
        pub const RCC_LPUART1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_HSIDIV = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
            Div32 = 5,
            Div64 = 6,
            Div128 = 7,
        };
        pub const RCC_RNGSEL = enum(u2) {
            HSI_DIV_8 = 1,
            SYS = 2,
            PLL1_Q = 3,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE_DIV_32 = 3,
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
            Div32 = 31,
        };
        pub const PWR_VOS = enum(u2) {
            Range1 = 1,
            Range2 = 2,
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
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 1,
            HSI48 = 2,
            HSI = 3,
            HSE = 4,
            PLLRCLK = 5,
            LSI = 6,
            LSE = 7,
            PLL1_P = 8,
            PLL1_Q = 9,
            RTCCLK = 10,
            RTC_WKUP = 11,
        };
        pub const RCC_PLLSRC = enum(u2) {
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_FDCANSEL = enum(u2) {
            PCLK1 = 0,
            PLL1_Q = 1,
            HSE = 2,
        };
        pub const RCC_TIM1SEL = enum(u1) {
            PCLK1_TIM = 0,
            PLL1_Q = 1,
        };
        pub const RCC_CECSEL = enum(u1) {
            HSI_DIV_488 = 0,
            LSE = 1,
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
        pub const RCC_USBSEL = enum(u2) {
            HSI48 = 0,
            HSE = 1,
            PLL1_Q = 2,
        };
        pub const RCC_ADCSEL = enum(u2) {
            SYS = 0,
            PLL1_P = 1,
            HSI = 2,
        };
        pub const RCC_I2C1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };
        pub const RCC_USARTSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };

        pub const HSISYSCLKDividerList = enum {
            RCC_HSI_DIV1,
            RCC_HSI_DIV2,
            RCC_HSI_DIV4,
            RCC_HSI_DIV8,
            RCC_HSI_DIV16,
            RCC_HSI_DIV32,
            RCC_HSI_DIV64,
            RCC_HSI_DIV128,

            pub fn to_enum(self: @This()) anyerror!RCC_HSIDIV {
                return switch (self) {
                    .RCC_HSI_DIV32 => .Div32,
                    .RCC_HSI_DIV1 => .Div1,
                    .RCC_HSI_DIV16 => .Div16,
                    .RCC_HSI_DIV2 => .Div2,
                    .RCC_HSI_DIV64 => .Div64,
                    .RCC_HSI_DIV8 => .Div8,
                    .RCC_HSI_DIV4 => .Div4,
                    .RCC_HSI_DIV128 => .Div128,
                };
            }
            pub fn from_enum(item: RCC_HSIDIV) anyerror!@This() {
                return switch (item) {
                    .Div32 => .RCC_HSI_DIV32,
                    .Div1 => .RCC_HSI_DIV1,
                    .Div16 => .RCC_HSI_DIV16,
                    .Div2 => .RCC_HSI_DIV2,
                    .Div64 => .RCC_HSI_DIV64,
                    .Div8 => .RCC_HSI_DIV8,
                    .Div4 => .RCC_HSI_DIV4,
                    .Div128 => .RCC_HSI_DIV128,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HSI_DIV1 => 1,
                    .RCC_HSI_DIV2 => 2,
                    .RCC_HSI_DIV4 => 4,
                    .RCC_HSI_DIV8 => 8,
                    .RCC_HSI_DIV16 => 16,
                    .RCC_HSI_DIV32 => 32,
                    .RCC_HSI_DIV64 => 64,
                    .RCC_HSI_DIV128 => 128,
                };
            }
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_LSE,
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,
            RCC_SYSCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_LSE => .LSE,
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_LSI => .LSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_R,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .LSE => .RCC_SYSCLKSOURCE_LSE,
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .LSI => .RCC_SYSCLKSOURCE_LSI,
                    .PLL1_R => .RCC_SYSCLKSOURCE_PLLCLK,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSI => .HSI,
                    .RCC_PLLSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_PLLSOURCE_HSI,
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
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => .HSE_DIV_32,
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .HSE_DIV_32 => .RCC_RTCCLKSOURCE_HSE_DIV32,
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
                };
            }
        };

        pub const USART1CLockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK1,
            RCC_USART1CLKSOURCE_SYSCLK,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_USART1CLKSOURCE_PCLK1,
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
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
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                };
            }
        };

        pub const I2S1CLockSelectionList = enum {
            RCC_I2S1CLKSOURCE_SYSCLK,
            RCC_I2S1CLKSOURCE_PLL,
            RCC_I2S1CLKSOURCE_HSI,
            RCC_I2S1CLKSOURCE_EXT,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C2I2S1SEL {
                return switch (self) {
                    .RCC_I2S1CLKSOURCE_EXT => .I2S_CKIN,
                    .RCC_I2S1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2S1CLKSOURCE_PLL => .PCLK1,
                    .RCC_I2S1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2C2I2S1SEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_I2S1CLKSOURCE_EXT,
                    .SYS => .RCC_I2S1CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2S1CLKSOURCE_PLL,
                    .HSI => .RCC_I2S1CLKSOURCE_HSI,
                };
            }
        };

        pub const I2S2CLockSelectionList = enum {
            RCC_I2S2CLKSOURCE_SYSCLK,
            RCC_I2S2CLKSOURCE_PLL,
            RCC_I2S2CLKSOURCE_HSI,
            RCC_I2S2CLKSOURCE_EXT,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C2I2S1SEL {
                return switch (self) {
                    .RCC_I2S2CLKSOURCE_EXT => .I2S_CKIN,
                    .RCC_I2S2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2S2CLKSOURCE_HSI => .HSI,
                    .RCC_I2S2CLKSOURCE_PLL => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2C2I2S1SEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_I2S2CLKSOURCE_EXT,
                    .SYS => .RCC_I2S2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2S2CLKSOURCE_HSI,
                    .PCLK1 => .RCC_I2S2CLKSOURCE_PLL,
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
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                    .SYS => .RCC_USART3CLKSOURCE_SYSCLK,
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
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
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPUART1SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_LPUART1CLKSOURCE_SYSCLK,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .PCLK1 => .RCC_LPUART1CLKSOURCE_PCLK1,
                };
            }
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

        pub const LPTIM2CLockSelectionList = enum {
            RCC_LPTIM2CLKSOURCE_PCLK1,
            RCC_LPTIM2CLKSOURCE_LSI,
            RCC_LPTIM2CLKSOURCE_HSI,
            RCC_LPTIM2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPTIM2CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM2CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .PCLK1 => .RCC_LPTIM2CLKSOURCE_PCLK1,
                    .HSI => .RCC_LPTIM2CLKSOURCE_HSI,
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                };
            }
        };

        pub const LPUART2CLockSelectionList = enum {
            RCC_LPUART2CLKSOURCE_PCLK1,
            RCC_LPUART2CLKSOURCE_SYSCLK,
            RCC_LPUART2CLKSOURCE_HSI,
            RCC_LPUART2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPUART2SEL {
                return switch (self) {
                    .RCC_LPUART2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPUART2CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_LPUART2CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LPUART2SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_LPUART2CLKSOURCE_PCLK1,
                    .HSI => .RCC_LPUART2CLKSOURCE_HSI,
                    .SYS => .RCC_LPUART2CLKSOURCE_SYSCLK,
                    .LSE => .RCC_LPUART2CLKSOURCE_LSE,
                };
            }
        };

        pub const CECCLockSelectionList = enum {
            RCC_CECCLKSOURCE_HSI_DIV488,
            RCC_CECCLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_CECSEL {
                return switch (self) {
                    .RCC_CECCLKSOURCE_LSE => .LSE,
                    .RCC_CECCLKSOURCE_HSI_DIV488 => .HSI_DIV_488,
                };
            }
            pub fn from_enum(item: RCC_CECSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_CECCLKSOURCE_LSE,
                    .HSI_DIV_488 => .RCC_CECCLKSOURCE_HSI_DIV488,
                };
            }
        };

        pub const TIM1CLockSelectionVirtualList = enum {
            RCC_TIM1CLKSOURCE_PCLK1,
            RCC_TIM1CLKSOURCE_PLL,

            pub fn to_enum(self: @This()) anyerror!RCC_TIM1SEL {
                return switch (self) {
                    .RCC_TIM1CLKSOURCE_PLL => .PLL1_Q,
                    .RCC_TIM1CLKSOURCE_PCLK1 => .PCLK1_TIM,
                };
            }
            pub fn from_enum(item: RCC_TIM1SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_TIM1CLKSOURCE_PLL,
                    .PCLK1_TIM => .RCC_TIM1CLKSOURCE_PCLK1,
                };
            }
        };

        pub const TIM15CLockSelectionVirtualList = enum {
            RCC_TIM15CLKSOURCE_PCLK1,
            RCC_TIM15CLKSOURCE_PLL,

            pub fn to_enum(self: @This()) anyerror!RCC_TIM15SEL {
                return switch (self) {
                    .RCC_TIM15CLKSOURCE_PCLK1 => .PCLK1_TIM,
                    .RCC_TIM15CLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_TIM15SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1_TIM => .RCC_TIM15CLKSOURCE_PCLK1,
                    .PLL1_Q => .RCC_TIM15CLKSOURCE_PLL,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCCLKSOURCE_SYSCLK,
            RCC_ADCCLKSOURCE_HSI,
            RCC_ADCCLKSOURCE_PLLADC,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADCCLKSOURCE_PLLADC => .PLL1_P,
                    .RCC_ADCCLKSOURCE_HSI => .HSI,
                    .RCC_ADCCLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_ADCCLKSOURCE_PLLADC,
                    .HSI => .RCC_ADCCLKSOURCE_HSI,
                    .SYS => .RCC_ADCCLKSOURCE_SYSCLK,
                };
            }
        };

        pub const RNGCLKDividerList = enum {
            RCC_RNGCLK_DIV1,
            RCC_RNGCLK_DIV2,
            RCC_RNGCLK_DIV4,
            RCC_RNGCLK_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_RNGDIV {
                return switch (self) {
                    .RCC_RNGCLK_DIV4 => .Div4,
                    .RCC_RNGCLK_DIV2 => .Div2,
                    .RCC_RNGCLK_DIV1 => .Div1,
                    .RCC_RNGCLK_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_RNGDIV) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_RNGCLK_DIV4,
                    .Div2 => .RCC_RNGCLK_DIV2,
                    .Div1 => .RCC_RNGCLK_DIV1,
                    .Div8 => .RCC_RNGCLK_DIV8,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_RNGCLK_DIV1 => 1,
                    .RCC_RNGCLK_DIV2 => 2,
                    .RCC_RNGCLK_DIV4 => 4,
                    .RCC_RNGCLK_DIV8 => 8,
                };
            }
        };

        pub const RNGCLockSelectionList = enum {
            RCC_RNGCLKSOURCE_SYSCLK,
            RCC_RNGCLKSOURCE_PLL,
            RCC_RNGCLKSOURCE_HSI_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_RNGSEL {
                return switch (self) {
                    .RCC_RNGCLKSOURCE_HSI_DIV8 => .HSI_DIV_8,
                    .RCC_RNGCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_RNGCLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_RNGSEL) anyerror!@This() {
                return switch (item) {
                    .HSI_DIV_8 => .RCC_RNGCLKSOURCE_HSI_DIV8,
                    .PLL1_Q => .RCC_RNGCLKSOURCE_PLL,
                    .SYS => .RCC_RNGCLKSOURCE_SYSCLK,
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

        pub const I2C2CLockSelectionList = enum {
            RCC_I2C2CLKSOURCE_PCLK1,
            RCC_I2C2CLKSOURCE_SYSCLK,
            RCC_I2C2CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C1SEL {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2C1SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_I2C2CLKSOURCE_PCLK1,
                    .SYS => .RCC_I2C2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C2CLKSOURCE_HSI,
                };
            }
        };

        pub const FDCANCLockSelectionList = enum {
            RCC_FDCANCLKSOURCE_PCLK1,
            RCC_FDCANCLKSOURCE_PLL,
            RCC_FDCANCLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_FDCANSEL {
                return switch (self) {
                    .RCC_FDCANCLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_FDCANCLKSOURCE_HSE => .HSE,
                    .RCC_FDCANCLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_FDCANSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_FDCANCLKSOURCE_PCLK1,
                    .HSE => .RCC_FDCANCLKSOURCE_HSE,
                    .PLL1_Q => .RCC_FDCANCLKSOURCE_PLL,
                };
            }
        };

        pub const USBCLockSelectionList = enum {
            RCC_USBCLKSOURCE_HSI48,
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USBSEL {
                return switch (self) {
                    .RCC_USBCLKSOURCE_HSE => .HSE,
                    .RCC_USBCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_USBCLKSOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_USBSEL) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_USBCLKSOURCE_HSE,
                    .PLL1_Q => .RCC_USBCLKSOURCE_PLL,
                    .HSI48 => .RCC_USBCLKSOURCE_HSI48,
                };
            }
        };

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_PLLCLK,
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_HSI48,
            RCC_MCO1SOURCE_PLLPCLK,
            RCC_MCO1SOURCE_PLLQCLK,
            RCC_MCO1SOURCE_RTCCLK,
            RCC_MCO1SOURCE_RTC_WKUP,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_RTCCLK => .RTCCLK,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_PLLCLK => .PLLRCLK,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_PLLQCLK => .PLL1_Q,
                    .RCC_MCO1SOURCE_PLLPCLK => .PLL1_P,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                    .RCC_MCO1SOURCE_RTC_WKUP => .RTC_WKUP,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .RTCCLK => .RCC_MCO1SOURCE_RTCCLK,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .PLLRCLK => .RCC_MCO1SOURCE_PLLCLK,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .PLL1_Q => .RCC_MCO1SOURCE_PLLQCLK,
                    .PLL1_P => .RCC_MCO1SOURCE_PLLPCLK,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                    .RTC_WKUP => .RCC_MCO1SOURCE_RTC_WKUP,
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
            RCC_MCODIV_256,
            RCC_MCODIV_512,
            RCC_MCODIV_1024,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCODIV_128 => .Div128,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_512 => .Div512,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_1024 => .Div1024,
                    .RCC_MCODIV_256 => .Div256,
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
                    .Div512 => .RCC_MCODIV_512,
                    .Div2 => .RCC_MCODIV_2,
                    .Div1024 => .RCC_MCODIV_1024,
                    .Div256 => .RCC_MCODIV_256,
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
                    .RCC_MCODIV_256 => 256,
                    .RCC_MCODIV_512 => 512,
                    .RCC_MCODIV_1024 => 1024,
                };
            }
        };

        pub const RCC_MCO2SourceList = enum {
            RCC_MCO2SOURCE_SYSCLK,
            RCC_MCO2SOURCE_HSI,
            RCC_MCO2SOURCE_HSE,
            RCC_MCO2SOURCE_PLLCLK,
            RCC_MCO2SOURCE_LSE,
            RCC_MCO2SOURCE_LSI,
            RCC_MCO2SOURCE_HSI48,
            RCC_MCO2SOURCE_PLLPCLK,
            RCC_MCO2SOURCE_PLLQCLK,
            RCC_MCO2SOURCE_RTCCLK,
            RCC_MCO2SOURCE_RTC_WKUP,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO2SOURCE_LSE => .LSE,
                    .RCC_MCO2SOURCE_LSI => .LSI,
                    .RCC_MCO2SOURCE_PLLCLK => .PLLRCLK,
                    .RCC_MCO2SOURCE_HSI => .HSI,
                    .RCC_MCO2SOURCE_PLLPCLK => .PLL1_P,
                    .RCC_MCO2SOURCE_HSE => .HSE,
                    .RCC_MCO2SOURCE_SYSCLK => .SYS,
                    .RCC_MCO2SOURCE_PLLQCLK => .PLL1_Q,
                    .RCC_MCO2SOURCE_RTCCLK => .RTCCLK,
                    .RCC_MCO2SOURCE_HSI48 => .HSI48,
                    .RCC_MCO2SOURCE_RTC_WKUP => .RTC_WKUP,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_MCO2SOURCE_LSE,
                    .LSI => .RCC_MCO2SOURCE_LSI,
                    .PLLRCLK => .RCC_MCO2SOURCE_PLLCLK,
                    .HSI => .RCC_MCO2SOURCE_HSI,
                    .PLL1_P => .RCC_MCO2SOURCE_PLLPCLK,
                    .HSE => .RCC_MCO2SOURCE_HSE,
                    .SYS => .RCC_MCO2SOURCE_SYSCLK,
                    .PLL1_Q => .RCC_MCO2SOURCE_PLLQCLK,
                    .RTCCLK => .RCC_MCO2SOURCE_RTCCLK,
                    .HSI48 => .RCC_MCO2SOURCE_HSI48,
                    .RTC_WKUP => .RCC_MCO2SOURCE_RTC_WKUP,
                };
            }
        };

        pub const RCC_MCO2DivList = enum {
            RCC_MCO2DIV_1,
            RCC_MCO2DIV_2,
            RCC_MCO2DIV_4,
            RCC_MCO2DIV_8,
            RCC_MCO2DIV_16,
            RCC_MCO2DIV_32,
            RCC_MCO2DIV_64,
            RCC_MCO2DIV_128,
            RCC_MCO2DIV_256,
            RCC_MCO2DIV_512,
            RCC_MCO2DIV_1024,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCO2DIV_1 => .Div1,
                    .RCC_MCO2DIV_2 => .Div2,
                    .RCC_MCO2DIV_4 => .Div4,
                    .RCC_MCO2DIV_512 => .Div512,
                    .RCC_MCO2DIV_8 => .Div8,
                    .RCC_MCO2DIV_32 => .Div32,
                    .RCC_MCO2DIV_64 => .Div64,
                    .RCC_MCO2DIV_16 => .Div16,
                    .RCC_MCO2DIV_128 => .Div128,
                    .RCC_MCO2DIV_256 => .Div256,
                    .RCC_MCO2DIV_1024 => .Div1024,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_MCO2DIV_1,
                    .Div2 => .RCC_MCO2DIV_2,
                    .Div4 => .RCC_MCO2DIV_4,
                    .Div512 => .RCC_MCO2DIV_512,
                    .Div8 => .RCC_MCO2DIV_8,
                    .Div32 => .RCC_MCO2DIV_32,
                    .Div64 => .RCC_MCO2DIV_64,
                    .Div16 => .RCC_MCO2DIV_16,
                    .Div128 => .RCC_MCO2DIV_128,
                    .Div256 => .RCC_MCO2DIV_256,
                    .Div1024 => .RCC_MCO2DIV_1024,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCO2DIV_1 => 1,
                    .RCC_MCO2DIV_2 => 2,
                    .RCC_MCO2DIV_4 => 4,
                    .RCC_MCO2DIV_8 => 8,
                    .RCC_MCO2DIV_16 => 16,
                    .RCC_MCO2DIV_32 => 32,
                    .RCC_MCO2DIV_64 => 64,
                    .RCC_MCO2DIV_128 => 128,
                    .RCC_MCO2DIV_256 => 256,
                    .RCC_MCO2DIV_512 => 512,
                    .RCC_MCO2DIV_1024 => 1024,
                };
            }
        };

        pub const LSCOSource1List = enum {
            RCC_LSCOSOURCE_LSI,
            RCC_LSCOSOURCE_LSE,
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
                    .RCC_PLLP_DIV32 => .Div32,
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
                    .Div32 => .RCC_PLLP_DIV32,
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

            pub fn to_enum(self: @This()) anyerror!RCC_PLLQ {
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
            pub fn from_enum(item: RCC_PLLQ) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLQ_DIV2,
                    .Div7 => .RCC_PLLQ_DIV7,
                    .Div8 => .RCC_PLLQ_DIV8,
                    .Div3 => .RCC_PLLQ_DIV3,
                    .Div6 => .RCC_PLLQ_DIV6,
                    .Div5 => .RCC_PLLQ_DIV5,
                    .Div4 => .RCC_PLLQ_DIV4,
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

            pub fn to_enum(self: @This()) anyerror!RCC_PLLR {
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
            pub fn from_enum(item: RCC_PLLR) anyerror!@This() {
                return switch (item) {
                    .Div5 => .RCC_PLLR_DIV5,
                    .Div2 => .RCC_PLLR_DIV2,
                    .Div7 => .RCC_PLLR_DIV7,
                    .Div4 => .RCC_PLLR_DIV4,
                    .Div8 => .RCC_PLLR_DIV8,
                    .Div3 => .RCC_PLLR_DIV3,
                    .Div6 => .RCC_PLLR_DIV6,
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

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_1 => .WS1,
                    .FLASH_LATENCY_0 => .WS0,
                    .FLASH_LATENCY_2 => .WS2,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS1 => .FLASH_LATENCY_1,
                    .WS0 => .FLASH_LATENCY_0,
                    .WS2 => .FLASH_LATENCY_2,
                };
            }
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

        pub const EnableRTCWKUPList = enum {
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

        pub const I2S1EnableList = enum {
            true,
            false,
        };

        pub const I2S2EnableList = enum {
            true,
            false,
        };

        pub const USART3EnableList = enum {
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

        pub const LPUART2EnableList = enum {
            true,
            false,
        };

        pub const EnableCECList = enum {
            true,
            false,
        };

        pub const TIM1EnableList = enum {
            true,
            false,
        };

        pub const TIM15EnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
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

        pub const FDCANEnableList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const ExtClockEnableList = enum {
            true,
            false,
        };

        pub const MCOEnableList = enum {
            true,
            false,
        };

        pub const MCO2EnableList = enum {
            true,
            false,
        };

        pub const LSCOEnableList = enum {
            true,
            false,
        };

        pub const ADCPLLEnableList = enum {
            true,
            false,
        };

        pub const I2S1PLLEnableList = enum {
            true,
            false,
        };

        pub const I2S2PLLEnableList = enum {
            true,
            false,
        };

        pub const MCOPLLEnableList = enum {
            true,
            false,
        };

        pub const MCO2PLLEnableList = enum {
            true,
            false,
        };

        pub const RNGPLLEnableList = enum {
            true,
            false,
        };

        pub const TIM1PLLEnableList = enum {
            true,
            false,
        };

        pub const TIM15PLLEnableList = enum {
            true,
            false,
        };

        pub const FDCANPllEnableList = enum {
            true,
            false,
        };

        pub const USBPllEnableList = enum {
            true,
            false,
        };

        pub const EnableCSSLSEList = enum {
            true,
            false,
        };

        pub const EnableExtClockForI2SList = enum {
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
            MCO2Config: bool = false,
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_DRD_FSUsed_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            LPUART1Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            LPUART2Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            UCPD_Used: bool = false,
            RCC_MCO2SOURCE_HSI48: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
            RCC_MCO2SOURCE_LSE: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            Semaphore_input_Channel1_directTIM15: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            TIM16: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            RCC_SYSCLKSOURCE_LSE: bool = false,
            MCOC2onfig: bool = false,
            RCC_MCO2SOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_HCLK_DIV1: bool = false,
            ADC1_USED: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            RTC_WAKEUP_INTERRUPT: bool = false,
            TIM1: bool = true,
            TIM15: bool = true,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            TIM17: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            MCO2Config: bool = false,
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_DRD_FSUsed_ForRCC: bool = false,
            ADCUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            LPUART1Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            LPUART2Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            UCPD_Used: bool = false,
            RCC_MCO2SOURCE_HSI48: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
            RCC_MCO2SOURCE_LSE: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            Semaphore_input_Channel1_directTIM15: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            TIM16: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            RCC_SYSCLKSOURCE_LSE: bool = false,
            MCOC2onfig: bool = false,
            RCC_MCO2SOURCE_HSI: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_HCLK_DIV1: bool = false,
            ADC1_USED: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            RTC_WAKEUP_INTERRUPT: bool = false,
            TIM1: bool = true,
            TIM15: bool = true,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            TIM17: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            CodegenConfigPeriph: bool = true, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            EnableRTCWKUP: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            I2S1Enable: bool = false, //Reference flag
            I2S2Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            LPUART2Enable: bool = false, //Reference flag
            EnableCEC: bool = false, //Reference flag
            TIM1Enable: bool = false, //Reference flag
            TIM15Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            FDCANEnable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            MCO2Enable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            ADCPLLEnable: bool = false, //Reference flag
            I2S1PLLEnable: bool = false, //Reference flag
            I2S2PLLEnable: bool = false, //Reference flag
            MCOPLLEnable: bool = false, //Reference flag
            MCO2PLLEnable: bool = false, //Reference flag
            RNGPLLEnable: bool = false, //Reference flag
            TIM1PLLEnable: bool = false, //Reference flag
            TIM15PLLEnable: bool = false, //Reference flag
            FDCANPllEnable: bool = false, //Reference flag
            USBPllEnable: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            EnableExtClockForI2S: bool = false, //Reference flag
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
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            CodegenConfigPeriph: ?CodegenConfigPeriphList = null,
            SYSCLKFreq_VALUE1: ?f32 = null,
            SYSCLKFreq_VALUE2: ?u32 = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSISYSCLKDivider: ?HSISYSCLKDividerList = null,
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?PLLMList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            USART2CLockSelection: ?USART2CLockSelectionList = null,
            I2S1CLockSelection: ?I2S1CLockSelectionList = null,
            I2S2CLockSelection: ?I2S2CLockSelectionList = null,
            USART3CLockSelection: ?USART3CLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            LPTIM2CLockSelection: ?LPTIM2CLockSelectionList = null,
            LPUART2CLockSelection: ?LPUART2CLockSelectionList = null,
            CECCLockSelection: ?CECCLockSelectionList = null,
            TIM1CLockSelectionVirtual: ?TIM1CLockSelectionVirtualList = null,
            TIM15CLockSelectionVirtual: ?TIM15CLockSelectionVirtualList = null,
            ADCCLockSelection: ?ADCCLockSelectionList = null,
            RNGCLKDivider: ?RNGCLKDividerList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C2CLockSelection: ?I2C2CLockSelectionList = null,
            FDCANCLockSelection: ?FDCANCLockSelectionList = null,
            USBCLockSelection: ?USBCLockSelectionList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            RCC_MCO2Source: ?RCC_MCO2SourceList = null,
            RCC_MCO2Div: ?RCC_MCO2DivList = null,
            LSCOSource1: ?LSCOSource1List = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            PLLN: ?u32 = null,
            PLLP: ?PLLPList = null,
            PLLQ: ?PLLQList = null,
            PLLR: ?PLLRList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSISYSCLKDivider: HSISYSCLKDividerList,
            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLM: PLLMList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            USART2CLockSelection: USART2CLockSelectionList,
            I2S1CLockSelection: I2S1CLockSelectionList,
            I2S2CLockSelection: I2S2CLockSelectionList,
            USART3CLockSelection: USART3CLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            LPTIM2CLockSelection: LPTIM2CLockSelectionList,
            LPUART2CLockSelection: LPUART2CLockSelectionList,
            RCC_CEC_Clock_Source_FROM_HSI16: u32,
            CECCLockSelection: CECCLockSelectionList,
            TIM1CLockSelectionVirtual: TIM1CLockSelectionVirtualList,
            TIM15CLockSelectionVirtual: TIM15CLockSelectionVirtualList,
            ADCCLockSelection: ADCCLockSelectionList,
            RNGCLKDivider: RNGCLKDividerList,
            RNGHSIDiv: u32,
            RNGCLockSelection: RNGCLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C2CLockSelection: I2C2CLockSelectionList,
            FDCANCLockSelection: FDCANCLockSelectionList,
            USBCLockSelection: USBCLockSelectionList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv: RCC_MCODivList,
            RCC_MCO2Source: RCC_MCO2SourceList,
            RCC_MCO2Div: RCC_MCO2DivList,
            LSCOSource1: LSCOSource1List,
            AHBCLKDivider: AHBCLKDividerList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            PLLN: u32,
            PLLP: PLLPList,
            PLLQ: PLLQList,
            PLLR: PLLRList,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
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
            FLatency: ?FLASH_LATENCY = null,
            HSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            CodegenConfigPeriph: ?CodegenConfigPeriphList = null,
            SYSCLKFreq_VALUE1: ?f32 = null,
            SYSCLKFreq_VALUE2: ?u32 = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .FLatency = if (self.FLatency) |val| try FLatencyList.from_enum(val) else null,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .CodegenConfigPeriph = self.CodegenConfigPeriph,
                    .SYSCLKFreq_VALUE1 = self.SYSCLKFreq_VALUE1,
                    .SYSCLKFreq_VALUE2 = self.SYSCLKFreq_VALUE2,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSISYSCLKDivider: ?RCC_HSIDIV = null,
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?RCC_PLLM = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelection: ?RCC_USARTSEL = null,
            USART2CLockSelection: ?RCC_USARTSEL = null,
            I2S1CLockSelection: ?RCC_I2C2I2S1SEL = null,
            I2S2CLockSelection: ?RCC_I2C2I2S1SEL = null,
            USART3CLockSelection: ?RCC_USARTSEL = null,
            LPUART1CLockSelection: ?RCC_LPUART1SEL = null,
            LPTIM1CLockSelection: ?RCC_LPTIM1SEL = null,
            LPTIM2CLockSelection: ?RCC_LPTIM2SEL = null,
            LPUART2CLockSelection: ?RCC_LPUART2SEL = null,
            CECCLockSelection: ?RCC_CECSEL = null,
            TIM1CLockSelectionVirtual: ?RCC_TIM1SEL = null,
            TIM15CLockSelectionVirtual: ?RCC_TIM15SEL = null,
            ADCCLockSelection: ?RCC_ADCSEL = null,
            RNGCLKDivider: ?RCC_RNGDIV = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            I2C1CLockSelection: ?RCC_I2C1SEL = null,
            I2C2CLockSelection: ?RCC_I2C1SEL = null,
            FDCANCLockSelection: ?RCC_FDCANSEL = null,
            USBCLockSelection: ?RCC_USBSEL = null,
            RCC_MCO1Source: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            RCC_MCO2Source: ?RCC_MCOSEL = null,
            RCC_MCO2Div: ?RCC_MCOPRE = null,
            LSCOSource1: ?LSCOSource1List = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            PLLN: ?u32 = null,
            PLLP: ?RCC_PLLP = null,
            PLLQ: ?RCC_PLLQ = null,
            PLLR: ?RCC_PLLR = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSISYSCLKDivider = if (self.HSISYSCLKDivider) |val| try HSISYSCLKDividerList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = if (self.PLLM) |val| try PLLMList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .USART2CLockSelection = if (self.USART2CLockSelection) |val| try USART2CLockSelectionList.from_enum(val) else null,
                    .I2S1CLockSelection = if (self.I2S1CLockSelection) |val| try I2S1CLockSelectionList.from_enum(val) else null,
                    .I2S2CLockSelection = if (self.I2S2CLockSelection) |val| try I2S2CLockSelectionList.from_enum(val) else null,
                    .USART3CLockSelection = if (self.USART3CLockSelection) |val| try USART3CLockSelectionList.from_enum(val) else null,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .LPTIM2CLockSelection = if (self.LPTIM2CLockSelection) |val| try LPTIM2CLockSelectionList.from_enum(val) else null,
                    .LPUART2CLockSelection = if (self.LPUART2CLockSelection) |val| try LPUART2CLockSelectionList.from_enum(val) else null,
                    .CECCLockSelection = if (self.CECCLockSelection) |val| try CECCLockSelectionList.from_enum(val) else null,
                    .TIM1CLockSelectionVirtual = if (self.TIM1CLockSelectionVirtual) |val| try TIM1CLockSelectionVirtualList.from_enum(val) else null,
                    .TIM15CLockSelectionVirtual = if (self.TIM15CLockSelectionVirtual) |val| try TIM15CLockSelectionVirtualList.from_enum(val) else null,
                    .ADCCLockSelection = if (self.ADCCLockSelection) |val| try ADCCLockSelectionList.from_enum(val) else null,
                    .RNGCLKDivider = if (self.RNGCLKDivider) |val| try RNGCLKDividerList.from_enum(val) else null,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C2CLockSelection = if (self.I2C2CLockSelection) |val| try I2C2CLockSelectionList.from_enum(val) else null,
                    .FDCANCLockSelection = if (self.FDCANCLockSelection) |val| try FDCANCLockSelectionList.from_enum(val) else null,
                    .USBCLockSelection = if (self.USBCLockSelection) |val| try USBCLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .RCC_MCO2Source = if (self.RCC_MCO2Source) |val| try RCC_MCO2SourceList.from_enum(val) else null,
                    .RCC_MCO2Div = if (self.RCC_MCO2Div) |val| try RCC_MCO2DivList.from_enum(val) else null,
                    .LSCOSource1 = self.LSCOSource1,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
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

            HSISYSCLKDivider: RCC_HSIDIV,
            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLM: RCC_PLLM,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelection: RCC_USARTSEL,
            USART2CLockSelection: RCC_USARTSEL,
            I2S1CLockSelection: RCC_I2C2I2S1SEL,
            I2S2CLockSelection: RCC_I2C2I2S1SEL,
            USART3CLockSelection: RCC_USARTSEL,
            LPUART1CLockSelection: RCC_LPUART1SEL,
            LPTIM1CLockSelection: RCC_LPTIM1SEL,
            LPTIM2CLockSelection: RCC_LPTIM2SEL,
            LPUART2CLockSelection: RCC_LPUART2SEL,
            RCC_CEC_Clock_Source_FROM_HSI16: u32,
            CECCLockSelection: RCC_CECSEL,
            TIM1CLockSelectionVirtual: RCC_TIM1SEL,
            TIM15CLockSelectionVirtual: RCC_TIM15SEL,
            ADCCLockSelection: RCC_ADCSEL,
            RNGCLKDivider: RCC_RNGDIV,
            RNGHSIDiv: u32,
            RNGCLockSelection: RCC_RNGSEL,
            I2C1CLockSelection: RCC_I2C1SEL,
            I2C2CLockSelection: RCC_I2C1SEL,
            FDCANCLockSelection: RCC_FDCANSEL,
            USBCLockSelection: RCC_USBSEL,
            RCC_MCO1Source: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            RCC_MCO2Source: RCC_MCOSEL,
            RCC_MCO2Div: RCC_MCOPRE,
            LSCOSource1: LSCOSource1List,
            AHBCLKDivider: RCC_HPRE,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            PLLN: u32,
            PLLP: RCC_PLLP,
            PLLQ: RCC_PLLQ,
            PLLR: RCC_PLLR,
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSISYSCLKDivider = try cubemx_config.HSISYSCLKDivider.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = try cubemx_config.PLLM.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .USART2CLockSelection = try cubemx_config.USART2CLockSelection.to_enum(),
                    .I2S1CLockSelection = try cubemx_config.I2S1CLockSelection.to_enum(),
                    .I2S2CLockSelection = try cubemx_config.I2S2CLockSelection.to_enum(),
                    .USART3CLockSelection = try cubemx_config.USART3CLockSelection.to_enum(),
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .LPTIM2CLockSelection = try cubemx_config.LPTIM2CLockSelection.to_enum(),
                    .LPUART2CLockSelection = try cubemx_config.LPUART2CLockSelection.to_enum(),
                    .RCC_CEC_Clock_Source_FROM_HSI16 = cubemx_config.RCC_CEC_Clock_Source_FROM_HSI16,
                    .CECCLockSelection = try cubemx_config.CECCLockSelection.to_enum(),
                    .TIM1CLockSelectionVirtual = try cubemx_config.TIM1CLockSelectionVirtual.to_enum(),
                    .TIM15CLockSelectionVirtual = try cubemx_config.TIM15CLockSelectionVirtual.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .RNGCLKDivider = try cubemx_config.RNGCLKDivider.to_enum(),
                    .RNGHSIDiv = cubemx_config.RNGHSIDiv,
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C2CLockSelection = try cubemx_config.I2C2CLockSelection.to_enum(),
                    .FDCANCLockSelection = try cubemx_config.FDCANCLockSelection.to_enum(),
                    .USBCLockSelection = try cubemx_config.USBCLockSelection.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .RCC_MCO2Source = try cubemx_config.RCC_MCO2Source.to_enum(),
                    .RCC_MCO2Div = try cubemx_config.RCC_MCO2Div.to_enum(),
                    .LSCOSource1 = cubemx_config.LSCOSource1,
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .PLLN = cubemx_config.PLLN,
                    .PLLP = try cubemx_config.PLLP.to_enum(),
                    .PLLQ = try cubemx_config.PLLQ.to_enum(),
                    .PLLR = try cubemx_config.PLLR.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = try cubemx_config.FLatency.to_enum(),
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
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
            HSISYS: u32 = 0,
            HSI48RC: u32 = 0,
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PLLSource: u32 = 0,
            PLLM: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            RTCWkupOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2output: u32 = 0,
            I2S1Mult: u32 = 0,
            I2S1output: u32 = 0,
            I2S2Mult: u32 = 0,
            I2S2output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3output: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            LPTIM2Mult: u32 = 0,
            LPTIM2output: u32 = 0,
            LPUART2Mult: u32 = 0,
            LPUART2output: u32 = 0,
            HSICECCDevisor: u32 = 0,
            CECMult: u32 = 0,
            CECoutput: u32 = 0,
            TIM1Mult: u32 = 0,
            TIM1output: u32 = 0,
            TIM15Mult: u32 = 0,
            TIM15output: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            RNGDIV: u32 = 0,
            RNGHSIDiv: u32 = 0,
            CK48Mult: u32 = 0,
            RNGoutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2output: u32 = 0,
            FDCANMult: u32 = 0,
            FDCANoutput: u32 = 0,
            USBMult: u32 = 0,
            USBoutput: u32 = 0,
            I2S_CKIN: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            PWRCLKoutput: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            CortexSysOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            APBPrescaler: u32 = 0,
            APBOutput: u32 = 0,
            TimPrescalerAPB: u32 = 0,
            TimPrescOut1: u32 = 0,
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

            if (@inComptime()) @setEvalBranchQuota(1000000);
            var out = ClockOutput{};
            var ref_out: CubeMXOutputConfig = undefined;

            var SysSourceLse: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceLsi: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var I2S1SourceSysclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourcePll: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceHsi: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceExt: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourceSysclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourcePll: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourceHsi: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourceExt: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var LPUART2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECSOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECSOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM1SOURCEPclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM1SOURCEPll: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM15SOURCEPclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM15SOURCEPll: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHsi: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePllp: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGClockisSysclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGClockisPll: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGClockisHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_PLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBCLKSOURCE_HSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBCLKSOURCE_PLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_HSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_PLLPCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_PLLQCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_RTCCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_RTC_WKUP: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_HSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_PLLPCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_PLLQCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_RTCCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_RTC_WKUP: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLQ4: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLQ5: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLQ6: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLQ7: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLQ8: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLR2: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLR4: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLR5: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLR6: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLR7: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLR8: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY1: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var HSISYS = ClockNode{
                .name = "HSISYS",
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

            var RTCWkupOutput = ClockNode{
                .name = "RTCWkupOutput",
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

            var I2S1Mult = ClockNode{
                .name = "I2S1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S1output = ClockNode{
                .name = "I2S1output",
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

            var LPUART2Mult = ClockNode{
                .name = "LPUART2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPUART2output = ClockNode{
                .name = "LPUART2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSICECCDevisor = ClockNode{
                .name = "HSICECCDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CECMult = ClockNode{
                .name = "CECMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CECoutput = ClockNode{
                .name = "CECoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM1Mult = ClockNode{
                .name = "TIM1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM1output = ClockNode{
                .name = "TIM1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM15Mult = ClockNode{
                .name = "TIM15Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM15output = ClockNode{
                .name = "TIM15output",
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

            var RNGDIV = ClockNode{
                .name = "RNGDIV",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RNGHSIDiv = ClockNode{
                .name = "RNGHSIDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CK48Mult = ClockNode{
                .name = "CK48Mult",
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

            var FDCANMult = ClockNode{
                .name = "FDCANMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FDCANoutput = ClockNode{
                .name = "FDCANoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBMult = ClockNode{
                .name = "USBMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBoutput = ClockNode{
                .name = "USBoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S_CKIN = ClockNode{
                .name = "I2S_CKIN",
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

            var MCO2Mult = ClockNode{
                .name = "MCO2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCO2Div = ClockNode{
                .name = "MCO2Div",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCO2Pin = ClockNode{
                .name = "MCO2Pin",
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

            var APBPrescaler = ClockNode{
                .name = "APBPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APBOutput = ClockNode{
                .name = "APBOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimPrescalerAPB = ClockNode{
                .name = "TimPrescalerAPB",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimPrescOut1 = ClockNode{
                .name = "TimPrescOut1",
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

            const HSISYSCLKDividerValue: HSISYSCLKDividerList = blk: {
                const user_val = config.HSISYSCLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSI_DIV1 => {},
                        .RCC_HSI_DIV2 => {},
                        .RCC_HSI_DIV4 => {},
                        .RCC_HSI_DIV8 => {},
                        .RCC_HSI_DIV16 => {},
                        .RCC_HSI_DIV32 => {},
                        .RCC_HSI_DIV64 => {},
                        .RCC_HSI_DIV128 => {},
                    }
                }
                break :blk user_val orelse .RCC_HSI_DIV1;
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

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_LSE => SysSourceLse = true,
                        .RCC_SYSCLKSOURCE_HSI => SysSourceHSI = true,
                        .RCC_SYSCLKSOURCE_HSE => SysSourceHSE = true,
                        .RCC_SYSCLKSOURCE_PLLCLK => SysSourcePLL = true,
                        .RCC_SYSCLKSOURCE_LSI => SysSourceLsi = true,
                    }
                }
                break :blk user_val orelse {
                    SysSourceHSI = true;
                    break :blk .RCC_SYSCLKSOURCE_HSI;
                };
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                const user_val = config.PLLSourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_HSI => PLLSourceHSI = true,
                        .RCC_PLLSOURCE_HSE => PLLSourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLLSourceHSI = true;
                    break :blk .RCC_PLLSOURCE_HSI;
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
                        .RCC_USART1CLKSOURCE_PCLK1 => USART1SourcePCLK2 = true,
                        .RCC_USART1CLKSOURCE_SYSCLK => USART1SourceSys = true,
                        .RCC_USART1CLKSOURCE_HSI => USART1SourceHSI = true,
                        .RCC_USART1CLKSOURCE_LSE => USART1SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART1SourcePCLK2 = true;
                    break :blk .RCC_USART1CLKSOURCE_PCLK1;
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

            const I2S1CLockSelectionValue: I2S1CLockSelectionList = blk: {
                const user_val = config.I2S1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2S1CLKSOURCE_SYSCLK => I2S1SourceSysclk = true,
                        .RCC_I2S1CLKSOURCE_PLL => I2S1SourcePll = true,
                        .RCC_I2S1CLKSOURCE_HSI => I2S1SourceHsi = true,
                        .RCC_I2S1CLKSOURCE_EXT => I2S1SourceExt = true,
                    }
                }
                break :blk user_val orelse {
                    I2S1SourceSysclk = true;
                    break :blk .RCC_I2S1CLKSOURCE_SYSCLK;
                };
            };

            const I2S2CLockSelectionValue: I2S2CLockSelectionList = blk: {
                const user_val = config.I2S2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2S2CLKSOURCE_SYSCLK => I2S2SourceSysclk = true,
                        .RCC_I2S2CLKSOURCE_PLL => I2S2SourcePll = true,
                        .RCC_I2S2CLKSOURCE_HSI => I2S2SourceHsi = true,
                        .RCC_I2S2CLKSOURCE_EXT => I2S2SourceExt = true,
                    }
                }
                break :blk user_val orelse {
                    I2S2SourceSysclk = true;
                    break :blk .RCC_I2S2CLKSOURCE_SYSCLK;
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
                        .RCC_LPTIM1CLKSOURCE_PCLK1 => {},
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1SOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK1;
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

            const LPUART2CLockSelectionValue: LPUART2CLockSelectionList = blk: {
                const user_val = config.LPUART2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART2CLKSOURCE_PCLK1 => LPUART2SourcePCLK1 = true,
                        .RCC_LPUART2CLKSOURCE_SYSCLK => LPUART2SourceSys = true,
                        .RCC_LPUART2CLKSOURCE_HSI => LPUART2SourceHSI = true,
                        .RCC_LPUART2CLKSOURCE_LSE => LPUART2SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    LPUART2SourcePCLK1 = true;
                    break :blk .RCC_LPUART2CLKSOURCE_PCLK1;
                };
            };

            const RCC_CEC_Clock_Source_FROM_HSI16Value: u32 = blk: {
                break :blk 488;
            };

            const CECCLockSelectionValue: CECCLockSelectionList = blk: {
                const user_val = config.CECCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CECCLKSOURCE_HSI_DIV488 => CECSOURCEHSI = true,
                        .RCC_CECCLKSOURCE_LSE => CECSOURCELSE = true,
                    }
                }
                break :blk user_val orelse {
                    CECSOURCEHSI = true;
                    break :blk .RCC_CECCLKSOURCE_HSI_DIV488;
                };
            };

            const PLLRValue: PLLRList = blk: {
                const user_val = config.PLLR;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLR_DIV2 => PLLR2 = true,
                        .RCC_PLLR_DIV3 => PLLR3 = true,
                        .RCC_PLLR_DIV4 => PLLR4 = true,
                        .RCC_PLLR_DIV5 => PLLR5 = true,
                        .RCC_PLLR_DIV6 => PLLR6 = true,
                        .RCC_PLLR_DIV7 => PLLR7 = true,
                        .RCC_PLLR_DIV8 => PLLR8 = true,
                    }
                }
                break :blk user_val orelse {
                    PLLR2 = true;
                    break :blk .RCC_PLLR_DIV2;
                };
            };

            const PLLQValue: PLLQList = blk: {
                const user_val = config.PLLQ;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLQ_DIV2 => PLLQ2 = true,
                        .RCC_PLLQ_DIV3 => PLLQ3 = true,
                        .RCC_PLLQ_DIV4 => PLLQ4 = true,
                        .RCC_PLLQ_DIV5 => PLLQ5 = true,
                        .RCC_PLLQ_DIV6 => PLLQ6 = true,
                        .RCC_PLLQ_DIV7 => PLLQ7 = true,
                        .RCC_PLLQ_DIV8 => PLLQ8 = true,
                    }
                }
                break :blk user_val orelse {
                    PLLQ2 = true;
                    break :blk .RCC_PLLQ_DIV2;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                        .RCC_ADCCLKSOURCE_HSI => ADCSourceHsi = true,
                        .RCC_ADCCLKSOURCE_PLLADC => ADCSourcePllp = true,
                    }
                }
                break :blk user_val orelse {
                    ADCSourceSys = true;
                    break :blk .RCC_ADCCLKSOURCE_SYSCLK;
                };
            };

            const RNGCLKDividerValue: RNGCLKDividerList = blk: {
                const user_val = config.RNGCLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLK_DIV1 => {},
                        .RCC_RNGCLK_DIV2 => {},
                        .RCC_RNGCLK_DIV4 => {},
                        .RCC_RNGCLK_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_RNGCLK_DIV1;
            };

            const RNGHSIDivValue: u32 = blk: {
                break :blk 8;
            };

            const RNGCLockSelectionValue: RNGCLockSelectionList = blk: {
                const user_val = config.RNGCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_SYSCLK => RNGClockisSysclk = true,
                        .RCC_RNGCLKSOURCE_PLL => RNGClockisPll = true,
                        .RCC_RNGCLKSOURCE_HSI_DIV8 => RNGClockisHSI = true,
                    }
                }
                break :blk user_val orelse {
                    RNGClockisHSI = true;
                    break :blk .RCC_RNGCLKSOURCE_HSI_DIV8;
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

            const FDCANCLockSelectionValue: FDCANCLockSelectionList = blk: {
                const user_val = config.FDCANCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FDCANCLKSOURCE_PCLK1 => FDCANCLKSOURCE_PCLK1 = true,
                        .RCC_FDCANCLKSOURCE_PLL => FDCANCLKSOURCE_PLL = true,
                        .RCC_FDCANCLKSOURCE_HSE => FDCANCLKSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    FDCANCLKSOURCE_PCLK1 = true;
                    break :blk .RCC_FDCANCLKSOURCE_PCLK1;
                };
            };

            const USBCLockSelectionValue: USBCLockSelectionList = blk: {
                if (!check_MCU("STM32G0x0_Value_line")) {
                    const user_val = config.USBCLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USBCLKSOURCE_HSI48 => USBCLKSOURCE_HSI48 = true,
                            .RCC_USBCLKSOURCE_PLL => USBCLKSOURCE_PLL = true,
                            .RCC_USBCLKSOURCE_HSE => USBCLKSOURCE_HSE = true,
                        }
                    }
                    break :blk user_val orelse {
                        USBCLKSOURCE_HSI48 = true;
                        break :blk .RCC_USBCLKSOURCE_HSI48;
                    };
                } else if (check_MCU("STM32G0x0_Value_line")) {
                    const user_val = config.USBCLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USBCLKSOURCE_PLL => USBCLKSOURCE_PLL = true,
                            .RCC_USBCLKSOURCE_HSE => USBCLKSOURCE_HSE = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "USBCLockSelection",
                                    "STM32G0x0_Value_line",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_Q" else "RCC_USBCLKSOURCE_PLL",
                                    if (patch_logs) "HSE" else "RCC_USBCLKSOURCE_HSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        USBCLKSOURCE_PLL = true;
                        break :blk .RCC_USBCLKSOURCE_PLL;
                    };
                }
                const user_val = config.USBCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_HSI48 => USBCLKSOURCE_HSI48 = true,
                        .RCC_USBCLKSOURCE_PLL => USBCLKSOURCE_PLL = true,
                        .RCC_USBCLKSOURCE_HSE => USBCLKSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    USBCLKSOURCE_HSI48 = true;
                    break :blk .RCC_USBCLKSOURCE_HSI48;
                };
            };

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 4.8e4;
            };

            const RCC_MCO1SourceValue: RCC_MCO1SourceList = blk: {
                const user_val = config.RCC_MCO1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => MCOSourcesys = true,
                        .RCC_MCO1SOURCE_HSI => MCOSourceHSI = true,
                        .RCC_MCO1SOURCE_HSE => MCOSourceHSE = true,
                        .RCC_MCO1SOURCE_PLLCLK => MCOSourcePLL = true,
                        .RCC_MCO1SOURCE_LSE => MCOSourceLSE = true,
                        .RCC_MCO1SOURCE_LSI => MCOSourceLSI = true,
                        .RCC_MCO1SOURCE_HSI48 => MCO1SOURCE_HSI48 = true,
                        .RCC_MCO1SOURCE_PLLPCLK => MCO1SOURCE_PLLPCLK = true,
                        .RCC_MCO1SOURCE_PLLQCLK => MCO1SOURCE_PLLQCLK = true,
                        .RCC_MCO1SOURCE_RTCCLK => MCO1SOURCE_RTCCLK = true,
                        .RCC_MCO1SOURCE_RTC_WKUP => MCO1SOURCE_RTC_WKUP = true,
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
                        .RCC_MCODIV_32 => {},
                        .RCC_MCODIV_64 => {},
                        .RCC_MCODIV_128 => {},
                        .RCC_MCODIV_256 => {},
                        .RCC_MCODIV_512 => {},
                        .RCC_MCODIV_1024 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCODIV_1;
            };

            const RCC_MCO2SourceValue: RCC_MCO2SourceList = blk: {
                const user_val = config.RCC_MCO2Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO2SOURCE_SYSCLK => MCO2Sourcesys = true,
                        .RCC_MCO2SOURCE_HSI => MCO2SourceHSI = true,
                        .RCC_MCO2SOURCE_HSE => MCO2SourceHSE = true,
                        .RCC_MCO2SOURCE_PLLCLK => MCO2SourcePLL = true,
                        .RCC_MCO2SOURCE_LSE => MCO2SourceLSE = true,
                        .RCC_MCO2SOURCE_LSI => MCO2SourceLSI = true,
                        .RCC_MCO2SOURCE_HSI48 => MCO2SOURCE_HSI48 = true,
                        .RCC_MCO2SOURCE_PLLPCLK => MCO2SOURCE_PLLPCLK = true,
                        .RCC_MCO2SOURCE_PLLQCLK => MCO2SOURCE_PLLQCLK = true,
                        .RCC_MCO2SOURCE_RTCCLK => MCO2SOURCE_RTCCLK = true,
                        .RCC_MCO2SOURCE_RTC_WKUP => MCO2SOURCE_RTC_WKUP = true,
                    }
                }
                break :blk user_val orelse {
                    MCO2Sourcesys = true;
                    break :blk .RCC_MCO2SOURCE_SYSCLK;
                };
            };

            const RCC_MCO2DivValue: RCC_MCO2DivList = blk: {
                const user_val = config.RCC_MCO2Div;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO2DIV_1 => {},
                        .RCC_MCO2DIV_2 => {},
                        .RCC_MCO2DIV_4 => {},
                        .RCC_MCO2DIV_8 => {},
                        .RCC_MCO2DIV_16 => {},
                        .RCC_MCO2DIV_32 => {},
                        .RCC_MCO2DIV_64 => {},
                        .RCC_MCO2DIV_128 => {},
                        .RCC_MCO2DIV_256 => {},
                        .RCC_MCO2DIV_512 => {},
                        .RCC_MCO2DIV_1024 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO2DIV_1;
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
                        .RCC_PLLP_DIV32 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLP_DIV2;
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
                if ((CECSOURCELSE and config.flags.CECUsed_ForRCC) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_LSE, .@"=")) or (LSCOSSourceLSE and config.flags.LSCOConfig) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM16) or (config.flags.SEM2RCC_LSE_REQUIRED_TIM2 and config.flags.Semaphore_TIM2_L4_ETR_REMAPTIM2 and config.flags.TIM2) or (config.flags.Semaphore_input_Channel1_directTIM15 and config.flags.TIM15 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM15) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (USART2SourceLSE and config.flags.USART2Used_ForRCC) or (USART3SourceLSE and config.flags.USART3Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUART1Used_ForRCC) or (LPUART2SourceLSE and config.flags.LPUART2Used_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCELSE and config.flags.LPTIM2Used_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_LSE, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCO2Config)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and config.flags.RTCUsed_ForRCC)) {
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

            const EnableRTCWKUPValue: EnableRTCWKUPList = blk: {
                if (config.flags.RTCUsed_ForRCC and config.flags.RTC_WAKEUP_INTERRUPT) {
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

            const USART2EnableValue: USART2EnableList = blk: {
                if (config.flags.USART2Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S1EnableValue: I2S1EnableList = blk: {
                if (config.flags.I2S1Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S2EnableValue: I2S2EnableList = blk: {
                if (config.flags.I2S2Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART3EnableValue: USART3EnableList = blk: {
                if (config.flags.USART3Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPUART1EnableValue: LPUART1EnableList = blk: {
                if (config.flags.LPUART1Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIM1Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM2EnableValue: LPTIM2EnableList = blk: {
                if (config.flags.LPTIM2Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPUART2EnableValue: LPUART2EnableList = blk: {
                if (config.flags.LPUART2Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableCECValue: EnableCECList = blk: {
                if (config.flags.CECUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const TIM1EnableValue: TIM1EnableList = blk: {
                if (config.flags.TIM1 and !check_MCU("STM32G0x0_Value_line") and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const TIM15EnableValue: TIM15EnableList = blk: {
                if (config.flags.TIM15 and !check_MCU("STM32G0x0_Value_line") and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (config.flags.ADC1_USED and config.flags.ADCUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
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

            const I2C2EnableValue: I2C2EnableList = blk: {
                if (config.flags.I2C2Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FDCANEnableValue: FDCANEnableList = blk: {
                if ((config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if ((config.flags.USBUsed_ForRCC) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ExtClockEnableValue: ExtClockEnableList = blk: {
                if (config.flags.AudioClockConfig and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if (config.flags.MCOConfig and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCO2EnableValue: MCO2EnableList = blk: {
                if (config.flags.MCO2Config and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
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

            const ADCPLLEnableValue: ADCPLLEnableList = blk: {
                if (config.flags.ADC1_USED and config.flags.ADCUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S1PLLEnableValue: I2S1PLLEnableList = blk: {
                if (config.flags.I2S1Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S2PLLEnableValue: I2S2PLLEnableList = blk: {
                if (config.flags.I2S2Used_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOPLLEnableValue: MCOPLLEnableList = blk: {
                if (config.flags.MCOConfig and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCO2PLLEnableValue: MCO2PLLEnableList = blk: {
                if (config.flags.MCO2Config and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RNGPLLEnableValue: RNGPLLEnableList = blk: {
                if (config.flags.RNGUsed_ForRCC and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const TIM1PLLEnableValue: TIM1PLLEnableList = blk: {
                if (config.flags.TIM1 and !check_MCU("STM32G0x0_Value_line") and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const TIM15PLLEnableValue: TIM15PLLEnableList = blk: {
                if (config.flags.TIM15 and !check_MCU("STM32G0x0_Value_line") and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FDCANPllEnableValue: FDCANPllEnableList = blk: {
                if ((config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBPllEnableValue: USBPllEnableList = blk: {
                if ((config.flags.USBUsed_ForRCC) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=") or check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .false, .@"=")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableCSSLSEValue: EnableCSSLSEList = blk: {
                if ((((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"="))) and config.flags.RTCUsed_ForRCC)) {
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

            const EnableExtClockForI2SValue: EnableExtClockForI2SList = blk: {
                if (((config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC) and config.flags.AudioClockConfig) and check_ref(@TypeOf(CodegenConfigPeriphValue), CodegenConfigPeriphValue, .true, .@"=")) {
                    break :blk .true;
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
                if (config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB or (check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI48, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig))) or (check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_HSI48, .@"=")) and config.flags.MCO2Config or USBCLKSOURCE_HSI48 and config.flags.USBUsed_ForRCC) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE HSISYS ======
            HSISYS.nodetype = .div;
            HSISYS.value = try HSISYSCLKDividerValue.get();
            HSISYS.parents = &.{&HSIRC};

            // ======= NODE HSI48RC ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                HSI48RC.nodetype = .source;
                HSI48RC.value = HSI48_VALUEValue;
            }
            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_SYSCLKSOURCE_HSI => &.{&HSISYS},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLR},
                .RCC_SYSCLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE PLLM ======
            PLLM.nodetype = .div;
            PLLM.value = try PLLMValue.get();
            PLLM.parents = &.{&PLLSource};

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

            // ======= NODE RTCWkupOutput ======
            RTCWkupOutput.nodetype = .output;
            RTCWkupOutput.parents = &.{&RTCClkSource};

            // ======= NODE IWDGOutput ======
            IWDGOutput.nodetype = .output;
            IWDGOutput.parents = &.{&LSIRC};

            // ======= NODE USART1Mult ======
            USART1Mult.nodetype = .multi;
            USART1Mult.parents = switch (USART1CLockSelectionValue) {
                .RCC_USART1CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART1output ======
            USART1output.nodetype = .output;
            USART1output.parents = &.{&USART1Mult};

            // ======= NODE USART2Mult ======
            USART2Mult.nodetype = .multi;
            USART2Mult.parents = switch (USART2CLockSelectionValue) {
                .RCC_USART2CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_USART2CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART2output ======
            USART2output.nodetype = .output;
            USART2output.parents = &.{&USART2Mult};

            // ======= NODE I2S1Mult ======
            I2S1Mult.nodetype = .multi;
            I2S1Mult.parents = switch (I2S1CLockSelectionValue) {
                .RCC_I2S1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2S1CLKSOURCE_PLL => &.{&PLLP},
                .RCC_I2S1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_I2S1CLKSOURCE_EXT => &.{&I2S_CKIN},
            };

            // ======= NODE I2S1output ======
            I2S1output.nodetype = .output;
            I2S1output.parents = &.{&I2S1Mult};

            // ======= NODE I2S2Mult ======
            I2S2Mult.nodetype = .multi;
            I2S2Mult.parents = switch (I2S2CLockSelectionValue) {
                .RCC_I2S2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2S2CLKSOURCE_PLL => &.{&PLLP},
                .RCC_I2S2CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_I2S2CLKSOURCE_EXT => &.{&I2S_CKIN},
            };

            // ======= NODE I2S2output ======
            I2S2output.nodetype = .output;
            I2S2output.parents = &.{&I2S2Mult};

            // ======= NODE USART3Mult ======
            USART3Mult.nodetype = .multi;
            USART3Mult.parents = switch (USART3CLockSelectionValue) {
                .RCC_USART3CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                .RCC_USART3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_USART3CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_USART3CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART3output ======
            USART3output.nodetype = .output;
            USART3output.parents = &.{&USART3Mult};

            // ======= NODE LPUART1Mult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPUART1Mult.nodetype = .multi;
                LPUART1Mult.parents = switch (LPUART1CLockSelectionValue) {
                    .RCC_LPUART1CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                    .RCC_LPUART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPUART1output ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPUART1output.nodetype = .output;
                LPUART1output.parents = &.{&LPUART1Mult};
            }
            // ======= NODE LPTIM1Mult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPTIM1Mult.nodetype = .multi;
                LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                    .RCC_LPTIM1CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                    .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM1output ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPTIM1output.nodetype = .output;
                LPTIM1output.parents = &.{&LPTIM1Mult};
            }
            // ======= NODE LPTIM2Mult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPTIM2Mult.nodetype = .multi;
                LPTIM2Mult.parents = switch (LPTIM2CLockSelectionValue) {
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                    .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM2output ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPTIM2output.nodetype = .output;
                LPTIM2output.parents = &.{&LPTIM2Mult};
            }
            // ======= NODE LPUART2Mult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPUART2Mult.nodetype = .multi;
                LPUART2Mult.parents = switch (LPUART2CLockSelectionValue) {
                    .RCC_LPUART2CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                    .RCC_LPUART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_LPUART2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPUART2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPUART2output ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                LPUART2output.nodetype = .output;
                LPUART2output.parents = &.{&LPUART2Mult};
            }
            // ======= NODE HSICECCDevisor ======
            HSICECCDevisor.nodetype = .div;
            HSICECCDevisor.value = @floatFromInt(RCC_CEC_Clock_Source_FROM_HSI16Value);
            HSICECCDevisor.parents = &.{&HSIRC};

            // ======= NODE CECMult ======
            CECMult.nodetype = .multi;
            CECMult.parents = switch (CECCLockSelectionValue) {
                .RCC_CECCLKSOURCE_HSI_DIV488 => &.{&HSICECCDevisor},
                .RCC_CECCLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE CECoutput ======
            CECoutput.nodetype = .output;
            CECoutput.parents = &.{&CECMult};

            // ======= NODE TIM1output ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                TIM1output.nodetype = .output;
                TIM1output.parents = &.{&TIM1Mult};
            }
            // ======= NODE TIM15output ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                TIM15output.nodetype = .output;
                TIM15output.parents = &.{&TIM15Mult};
            }
            // ======= NODE ADCMult ======
            ADCMult.nodetype = .multi;
            ADCMult.parents = switch (ADCCLockSelectionValue) {
                .RCC_ADCCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_ADCCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_ADCCLKSOURCE_PLLADC => &.{&PLLP},
            };

            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&ADCMult};

            // ======= NODE RNGDIV ======
            if (check_MCU("RNG_Exist")) {
                RNGDIV.nodetype = .div;
                RNGDIV.value = try RNGCLKDividerValue.get();
                RNGDIV.parents = &.{&CK48Mult};
            }
            // ======= NODE RNGHSIDiv ======
            if (check_MCU("RNG_Exist")) {
                RNGHSIDiv.nodetype = .div;
                RNGHSIDiv.value = @floatFromInt(RNGHSIDivValue);
                RNGHSIDiv.parents = &.{&HSIRC};
            }
            // ======= NODE CK48Mult ======
            if (check_MCU("RNG_Exist")) {
                CK48Mult.nodetype = .multi;
                CK48Mult.parents = switch (RNGCLockSelectionValue) {
                    .RCC_RNGCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_RNGCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_RNGCLKSOURCE_HSI_DIV8 => &.{&RNGHSIDiv},
                };
            }
            // ======= NODE RNGoutput ======
            if (check_MCU("RNG_Exist")) {
                RNGoutput.nodetype = .output;
                RNGoutput.parents = &.{&dummy};
            }
            // ======= NODE I2C1Mult ======
            I2C1Mult.nodetype = .multi;
            I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE I2C1output ======
            I2C1output.nodetype = .output;
            I2C1output.parents = &.{&I2C1Mult};

            // ======= NODE I2C2Mult ======
            I2C2Mult.nodetype = .multi;
            I2C2Mult.parents = switch (I2C2CLockSelectionValue) {
                .RCC_I2C2CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                .RCC_I2C2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2C2CLKSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE I2C2output ======
            I2C2output.nodetype = .output;
            I2C2output.parents = &.{&I2C2Mult};

            // ======= NODE FDCANMult ======
            if (check_MCU("FDCAN1_Exist") or check_MCU("FDCAN2_Exist")) {
                FDCANMult.nodetype = .multi;
                FDCANMult.parents = switch (FDCANCLockSelectionValue) {
                    .RCC_FDCANCLKSOURCE_PCLK1 => &.{&APBPrescaler},
                    .RCC_FDCANCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_FDCANCLKSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE FDCANoutput ======
            if (check_MCU("FDCAN1_Exist") or check_MCU("FDCAN2_Exist")) {
                FDCANoutput.nodetype = .output;
                FDCANoutput.parents = &.{&FDCANMult};
            }
            // ======= NODE USBMult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                USBMult.nodetype = .multi;
                USBMult.parents = switch (USBCLockSelectionValue) {
                    .RCC_USBCLKSOURCE_HSI48 => &.{&HSI48RC},
                    .RCC_USBCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_USBCLKSOURCE_HSE => &.{&HSEOSC},
                };
            } else if (check_MCU("STM32G0x0_Value_line")) {
                USBMult.nodetype = .multi;
                USBMult.parents = switch (USBCLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_USBCLKSOURCE_HSE => &.{&HSEOSC},
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
                        "USBMult",
                        "STM32G0x0_Value_line",
                        "",
                        "USBCLockSelection",
                        if (patch_logs) @tagName(try USBCLockSelectionValue.to_enum()) else @tagName(USBCLockSelectionValue),
                        if (patch_logs) @tagName(try USBCLockSelectionList.to_enum(.RCC_USBCLKSOURCE_PLL)) else @tagName(USBCLockSelectionList.RCC_USBCLKSOURCE_PLL),
                        if (patch_logs) @tagName(try USBCLockSelectionList.to_enum(.RCC_USBCLKSOURCE_HSE)) else @tagName(USBCLockSelectionList.RCC_USBCLKSOURCE_HSE),
                    }),
                };
            }
            // ======= NODE USBoutput ======
            USBoutput.nodetype = .output;
            USBoutput.parents = &.{&USBMult};

            // ======= NODE I2S_CKIN ======
            I2S_CKIN.nodetype = .source;
            I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;

            // ======= NODE MCOMult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCO1SourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLR},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO1SOURCE_HSI48 => &.{&HSI48RC},
                    .RCC_MCO1SOURCE_PLLPCLK => &.{&PLLP},
                    .RCC_MCO1SOURCE_PLLQCLK => &.{&PLLQ},
                    .RCC_MCO1SOURCE_RTCCLK => &.{&RTCClkSource},
                    .RCC_MCO1SOURCE_RTC_WKUP => &.{&RTCWkupOutput},
                };
            } else if (check_MCU("STM32G0x0_Value_line")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCO1SourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLR},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO1SOURCE_PLLPCLK => &.{&PLLP},
                    .RCC_MCO1SOURCE_PLLQCLK => &.{&PLLQ},
                    .RCC_MCO1SOURCE_RTCCLK => &.{&RTCClkSource},
                    .RCC_MCO1SOURCE_RTC_WKUP => &.{&RTCWkupOutput},
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
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                    , .{
                        "MCOMult",
                        "STM32G0x0_Value_line",
                        "",
                        "RCC_MCO1Source",
                        if (patch_logs) @tagName(try RCC_MCO1SourceValue.to_enum()) else @tagName(RCC_MCO1SourceValue),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_LSE)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_LSE),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_LSI)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_LSI),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_HSE)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_HSE),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_HSI)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_HSI),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_PLLCLK)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_PLLCLK),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_SYSCLK)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_SYSCLK),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_PLLPCLK)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_PLLPCLK),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_PLLQCLK)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_PLLQCLK),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_RTCCLK)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_RTCCLK),
                        if (patch_logs) @tagName(try RCC_MCO1SourceList.to_enum(.RCC_MCO1SOURCE_RTC_WKUP)) else @tagName(RCC_MCO1SourceList.RCC_MCO1SOURCE_RTC_WKUP),
                    }),
                };
            }
            // ======= NODE MCODiv ======
            MCODiv.nodetype = .div;
            MCODiv.value = try RCC_MCODivValue.get();
            MCODiv.parents = &.{&MCOMult};

            // ======= NODE MCOPin ======
            MCOPin.nodetype = .output;
            MCOPin.parents = &.{&MCODiv};

            // ======= NODE MCO2Mult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                MCO2Mult.nodetype = .multi;
                MCO2Mult.parents = switch (RCC_MCO2SourceValue) {
                    .RCC_MCO2SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO2SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO2SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO2SOURCE_PLLCLK => &.{&PLLR},
                    .RCC_MCO2SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO2SOURCE_HSI48 => &.{&HSI48RC},
                    .RCC_MCO2SOURCE_PLLPCLK => &.{&PLLP},
                    .RCC_MCO2SOURCE_PLLQCLK => &.{&PLLQ},
                    .RCC_MCO2SOURCE_RTCCLK => &.{&RTCClkSource},
                    .RCC_MCO2SOURCE_RTC_WKUP => &.{&RTCWkupOutput},
                };
            } else if (check_MCU("STM32G0x0_Value_line")) {
                MCO2Mult.nodetype = .multi;
                MCO2Mult.parents = switch (RCC_MCO2SourceValue) {
                    .RCC_MCO2SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO2SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO2SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO2SOURCE_PLLCLK => &.{&PLLR},
                    .RCC_MCO2SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO2SOURCE_PLLPCLK => &.{&PLLP},
                    .RCC_MCO2SOURCE_PLLQCLK => &.{&PLLQ},
                    .RCC_MCO2SOURCE_RTCCLK => &.{&RTCClkSource},
                    .RCC_MCO2SOURCE_RTC_WKUP => &.{&RTCWkupOutput},
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
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                        \\  - {s}
                        \\
                    , .{
                        "MCO2Mult",
                        "STM32G0x0_Value_line",
                        "",
                        "RCC_MCO2Source",
                        if (patch_logs) @tagName(try RCC_MCO2SourceValue.to_enum()) else @tagName(RCC_MCO2SourceValue),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_LSE)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_LSE),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_LSI)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_LSI),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_HSE)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_HSE),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_HSI)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_HSI),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_PLLCLK)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_PLLCLK),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_SYSCLK)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_SYSCLK),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_PLLPCLK)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_PLLPCLK),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_PLLQCLK)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_PLLQCLK),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_RTCCLK)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_RTCCLK),
                        if (patch_logs) @tagName(try RCC_MCO2SourceList.to_enum(.RCC_MCO2SOURCE_RTC_WKUP)) else @tagName(RCC_MCO2SourceList.RCC_MCO2SOURCE_RTC_WKUP),
                    }),
                };
            }
            // ======= NODE MCO2Div ======
            MCO2Div.nodetype = .div;
            MCO2Div.value = try RCC_MCO2DivValue.get();
            MCO2Div.parents = &.{&MCO2Mult};

            // ======= NODE MCO2Pin ======
            MCO2Pin.nodetype = .output;
            MCO2Pin.parents = &.{&MCO2Div};

            // ======= NODE LSCOMult ======
            LSCOMult.nodetype = .multi;
            LSCOMult.parents = switch (LSCOSource1Value) {
                .RCC_LSCOSOURCE_LSI => &.{&LSIRC},
                .RCC_LSCOSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LSCOOutput ======
            LSCOOutput.nodetype = .output;
            LSCOOutput.parents = &.{&LSCOMult};

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

            // ======= NODE CortexSysOutput ======
            CortexSysOutput.nodetype = .output;
            CortexSysOutput.parents = &.{&AHBOutput};

            // ======= NODE FCLKCortexOutput ======
            FCLKCortexOutput.nodetype = .output;
            FCLKCortexOutput.parents = &.{&AHBOutput};

            // ======= NODE APBPrescaler ======
            APBPrescaler.nodetype = .div;
            APBPrescaler.value = try APB1CLKDividerValue.get();
            APBPrescaler.parents = &.{&AHBOutput};

            // ======= NODE APBOutput ======
            APBOutput.nodetype = .output;
            APBOutput.parents = &.{&APBPrescaler};

            // ======= NODE TimPrescalerAPB ======
            TimPrescalerAPB.nodetype = .mul;
            TimPrescalerAPB.value = @floatFromInt(APB1TimCLKDividerValue);
            TimPrescalerAPB.parents = &.{&APBPrescaler};

            // ======= NODE TimPrescOut1 ======
            TimPrescOut1.nodetype = .output;
            TimPrescOut1.parents = &.{&TimPrescalerAPB};

            // ======= NODE PLLN ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                PLLN.nodetype = .mul;
                PLLN.value = @floatFromInt(PLLNValue);
                PLLN.parents = &.{&PLLM};
            }
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

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 6.4e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"=")))) {
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
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@">")))) {
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
                }
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
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass and (scale2 and SysSourceHSE)) {
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

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">"))) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 6.4e7,
                    .main_expr = "(VDD_VALUE< 1.8)|(VDD_VALUE> 2.1)",
                    .main_dialog = "overDrive activated",
                };
            }

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

            //======= RTCWUPFreq_Value ========
            const RTCWUPFreq_ValueValue = RTCWkupOutput.get_as_ref();
            ignore_value(RTCWUPFreq_ValueValue);

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= I2S1Freq_Value ========
            const I2S1Freq_ValueValue = I2S1output.get_as_ref();
            ignore_value(I2S1Freq_ValueValue);

            //======= I2S2Freq_Value ========
            const I2S2Freq_ValueValue = I2S2output.get_as_ref();
            ignore_value(I2S2Freq_ValueValue);

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);

            //======= LPUART2Freq_Value ========
            const LPUART2Freq_ValueValue = LPUART2output.get_as_ref();
            ignore_value(LPUART2Freq_ValueValue);

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECoutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);

            //======= SYSCLKFreq_VALUE1 ========
            const SYSCLKFreq_VALUE1Value = try math_op(?@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 1000000, .@"/", "SYSCLKFreq_VALUE");
            ignore_value(SYSCLKFreq_VALUE1Value);

            //======= SYSCLKFreq_VALUE2 ========
            const SYSCLKFreq_VALUE2Value = round(try math_op(?@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 1000000, .@"/", "SYSCLKFreq_VALUE")).?;
            ignore_value(SYSCLKFreq_VALUE2Value);

            const TIM1CLockSelectionVirtualValue: TIM1CLockSelectionVirtualList = blk: {
                if (!(((PLLR2 and PLLQ2) or (PLLR3 and PLLQ3) or (PLLR4 and (PLLQ4 or PLLQ2)) or (PLLR5 and PLLQ5) or (PLLR6 and (PLLQ3 or PLLQ2 or PLLQ6)) or (PLLR7 and PLLQ7) or (PLLR8 and (PLLQ8 or PLLQ4 or PLLQ2))) and (check_ref(@TypeOf(SYSCLKFreq_VALUE1Value), SYSCLKFreq_VALUE1Value, SYSCLKFreq_VALUE2Value, .@"=")) and SysSourcePLL) and !check_MCU("STM32G0x0_Value_line")) {
                    if (config.TIM1CLockSelectionVirtual) |val| {
                        if (val != .RCC_TIM1CLKSOURCE_PCLK1) {
                            const patch_str = if (patch_logs) "PCLK1_TIM" else "RCC_TIM1CLKSOURCE_PCLK1";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "TIM1CLockSelectionVirtual",
                                "!(((PLLR2 & PLLQ2) |(PLLR3 & PLLQ3) | (PLLR4 & (PLLQ4 | PLLQ2)) | (PLLR5 & PLLQ5) | (PLLR6 & (PLLQ3 | PLLQ2 | PLLQ6)) | (PLLR7 & PLLQ7) | (PLLR8 & (PLLQ8 | PLLQ4 | PLLQ2))) & (SYSCLKFreq_VALUE1=SYSCLKFreq_VALUE2) & SysSourcePLL) & !STM32G0x0_Value_line",
                                "When TIM1/TIM15 derives from PLLQ, they can be only an integer multiple of PCLK and must be aligned with it.",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    TIM1SOURCEPclk = true;
                    break :blk .RCC_TIM1CLKSOURCE_PCLK1;
                } else if (!check_MCU("STM32G0x0_Value_line")) {
                    const user_val = config.TIM1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_TIM1CLKSOURCE_PCLK1 => TIM1SOURCEPclk = true,
                            .RCC_TIM1CLKSOURCE_PLL => TIM1SOURCEPll = true,
                        }
                    }
                    break :blk user_val orelse {
                        TIM1SOURCEPclk = true;
                        break :blk .RCC_TIM1CLKSOURCE_PCLK1;
                    };
                }
                if (config.TIM1CLockSelectionVirtual) |val| {
                    if (val != .RCC_TIM1CLKSOURCE_PCLK1) {
                        const patch_str = if (patch_logs) "PCLK1_TIM" else "RCC_TIM1CLKSOURCE_PCLK1";
                        const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: .{s}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "TIM1CLockSelectionVirtual",
                            "!(((PLLR2 & PLLQ2) |(PLLR3 & PLLQ3) | (PLLR4 & (PLLQ4 | PLLQ2)) | (PLLR5 & PLLQ5) | (PLLR6 & (PLLQ3 | PLLQ2 | PLLQ6)) | (PLLR7 & PLLQ7) | (PLLR8 & (PLLQ8 | PLLQ4 | PLLQ2))) & (SYSCLKFreq_VALUE1=SYSCLKFreq_VALUE2) & SysSourcePLL) & !STM32G0x0_Value_line",
                            "When TIM1/TIM15 derives from PLLQ, they can be only an integer multiple of PCLK and must be aligned with it.",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                TIM1SOURCEPclk = true;
                break :blk .RCC_TIM1CLKSOURCE_PCLK1;
            };

            // ======= NODE TIM1Mult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                TIM1Mult.nodetype = .multi;
                TIM1Mult.parents = switch (TIM1CLockSelectionVirtualValue) {
                    .RCC_TIM1CLKSOURCE_PCLK1 => &.{&TimPrescalerAPB},
                    .RCC_TIM1CLKSOURCE_PLL => &.{&PLLQ},
                };
            }
            //======= APBTimFreq_Value ========
            const APBTimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APBTimFreq_ValueValue);

            //======= TIM1Freq_Value ========
            const TIM1Freq_ValueValue = TIM1output.get_as_ref();
            ignore_value(TIM1Freq_ValueValue);
            if (!check_MCU("STM32G0x0_Value_line")) {
                TIM1output.limit = .{
                    .min = null,
                    .max = 1.28e8,
                    .main_expr = "!STM32G0x0_Value_line",
                    .main_dialog = "",
                };
            }

            const TIM15CLockSelectionVirtualValue: TIM15CLockSelectionVirtualList = blk: {
                if (!(((PLLR2 and PLLQ2) or (PLLR3 and PLLQ3) or (PLLR4 and (PLLQ4 or PLLQ2)) or (PLLR5 and PLLQ5) or (PLLR6 and (PLLQ3 or PLLQ2 or PLLQ6)) or (PLLR7 and PLLQ7) or (PLLR8 and (PLLQ8 or PLLQ4 or PLLQ2))) and (check_ref(@TypeOf(SYSCLKFreq_VALUE1Value), SYSCLKFreq_VALUE1Value, SYSCLKFreq_VALUE2Value, .@"=")) and SysSourcePLL) and !check_MCU("STM32G0x0_Value_line")) {
                    if (config.TIM15CLockSelectionVirtual) |val| {
                        if (val != .RCC_TIM15CLKSOURCE_PCLK1) {
                            const patch_str = if (patch_logs) "PCLK1_TIM" else "RCC_TIM15CLKSOURCE_PCLK1";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "TIM15CLockSelectionVirtual",
                                "!(((PLLR2 & PLLQ2) |(PLLR3 & PLLQ3) | (PLLR4 & (PLLQ4 | PLLQ2)) | (PLLR5 & PLLQ5) | (PLLR6 & (PLLQ3 | PLLQ2 | PLLQ6)) | (PLLR7 & PLLQ7) | (PLLR8 & (PLLQ8 | PLLQ4 | PLLQ2))) & (SYSCLKFreq_VALUE1=SYSCLKFreq_VALUE2) & SysSourcePLL) & !STM32G0x0_Value_line",
                                "When TIM1/TIM15 derives from PLLQ, they can be only an integer multiple of PCLK and must be aligned with it.",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    TIM15SOURCEPclk = true;
                    break :blk .RCC_TIM15CLKSOURCE_PCLK1;
                } else if (!check_MCU("STM32G0x0_Value_line")) {
                    const user_val = config.TIM15CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_TIM15CLKSOURCE_PCLK1 => TIM15SOURCEPclk = true,
                            .RCC_TIM15CLKSOURCE_PLL => TIM15SOURCEPll = true,
                        }
                    }
                    break :blk user_val orelse {
                        TIM15SOURCEPclk = true;
                        break :blk .RCC_TIM15CLKSOURCE_PCLK1;
                    };
                }
                if (config.TIM15CLockSelectionVirtual) |val| {
                    if (val != .RCC_TIM15CLKSOURCE_PCLK1) {
                        const patch_str = if (patch_logs) "PCLK1_TIM" else "RCC_TIM15CLKSOURCE_PCLK1";
                        const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: .{s}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "TIM15CLockSelectionVirtual",
                            "!(((PLLR2 & PLLQ2) |(PLLR3 & PLLQ3) | (PLLR4 & (PLLQ4 | PLLQ2)) | (PLLR5 & PLLQ5) | (PLLR6 & (PLLQ3 | PLLQ2 | PLLQ6)) | (PLLR7 & PLLQ7) | (PLLR8 & (PLLQ8 | PLLQ4 | PLLQ2))) & (SYSCLKFreq_VALUE1=SYSCLKFreq_VALUE2) & SysSourcePLL) & !STM32G0x0_Value_line",
                            "When TIM1/TIM15 derives from PLLQ, they can be only an integer multiple of PCLK and must be aligned with it.",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                TIM15SOURCEPclk = true;
                break :blk .RCC_TIM15CLKSOURCE_PCLK1;
            };

            // ======= NODE TIM15Mult ======
            if (!check_MCU("STM32G0x0_Value_line")) {
                TIM15Mult.nodetype = .multi;
                TIM15Mult.parents = switch (TIM15CLockSelectionVirtualValue) {
                    .RCC_TIM15CLKSOURCE_PCLK1 => &.{&TimPrescalerAPB},
                    .RCC_TIM15CLKSOURCE_PLL => &.{&PLLQ},
                };
            }
            //======= TIM15Freq_Value ========
            const TIM15Freq_ValueValue = TIM15output.get_as_ref();
            ignore_value(TIM15Freq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);
            if (scale1) {
                ADCoutput.limit = .{
                    .min = 1.4e5,
                    .max = 3.5e7,
                    .main_expr = "scale1",
                    .main_dialog = "HSE in bypass Mode",
                };
            } else if (scale2) {
                ADCoutput.limit = .{
                    .min = 1.4e5,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "HSE in bypass Mode",
                };
            } else {
                ADCoutput.limit = .{
                    .min = 1.4e5,
                    .max = 8e7,
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

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);

            //======= FDCANFreq_Value ========
            const FDCANFreq_ValueValue = FDCANoutput.get_as_ref();
            ignore_value(FDCANFreq_ValueValue);

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);
            if (config.flags.USB_DRD_FSUsed_ForRCC) {
                USBoutput.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                    .main_expr = "USB_DRD_FSUsed_ForRCC",
                    .main_dialog = "HSE in bypass Mode",
                };
            } else {
                USBoutput.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= MCO2PinFreq_Value ========
            const MCO2PinFreq_ValueValue = MCO2Pin.get_as_ref();
            ignore_value(MCO2PinFreq_ValueValue);

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

            //======= APBFreq_Value ========
            const APBFreq_ValueValue = APBOutput.get_as_ref();
            ignore_value(APBFreq_ValueValue);

            APBOutput.limit = .{
                .min = null,
                .max = 6.4e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (scale1 and ((config.flags.ADC1_USED and ADCSourcePllp and config.flags.ADCUsed_ForRCC) or (I2S1SourcePll and config.flags.I2S1Used_ForRCC) or (I2S2SourcePll and config.flags.I2S2Used_ForRCC))) {
                PLLPoutput.limit = .{
                    .min = 3.09e6,
                    .max = 1.22e8,
                    .main_expr = "scale1 & ((ADC1_USED & ADCSourcePllp & ADCUsed_ForRCC) | (I2S1SourcePll & I2S1Used_ForRCC) | (I2S2SourcePll & I2S2Used_ForRCC))",
                    .main_dialog = " ",
                };
            } else {
                PLLPoutput.limit = .{
                    .min = 3.09e6,
                    .max = 4e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);

            PLLQoutput.limit = .{
                .min = 1.2e7,
                .max = 1.28e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            const PLLUsedValue: u1 = blk: {
                if (config.flags.USBUsed_ForRCC and USBCLKSOURCE_PLL or (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC) and FDCANCLKSOURCE_PLL or (I2S1SourcePll and config.flags.I2S1Used_ForRCC) or (I2S2SourcePll and config.flags.I2S2Used_ForRCC) or (config.flags.ADC1_USED and config.flags.ADCUsed_ForRCC and ADCSourcePllp) or (config.flags.TIM15 and TIM15SOURCEPll) or (config.flags.TIM1 and TIM1SOURCEPll) or (SysSourcePLL) or (((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) or MCO1SOURCE_PLLPCLK or MCO1SOURCE_PLLQCLK) and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig)) or (RNGClockisPll and (config.flags.RNGUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 2.66e6,
                    .max = 1.6e7,
                    .main_expr = "(PLLUsed=1) ",
                    .main_dialog = " PLLUsed=1",
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (scale1 and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                VCOOutput.limit = .{
                    .min = 9.6e7,
                    .max = 3.44e8,
                    .main_expr = "scale1 & (PLLUsed=1)",
                    .main_dialog = "PLLUsed=1 ",
                };
            } else {
                VCOOutput.limit = .{
                    .min = 9.6e7,
                    .max = 1.28e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if (scale1 and ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and SysSourcePLL) or (MCOSourcePLL and config.flags.MCOConfig) or (MCO2SourcePLL and config.flags.MCO2Config))) {
                PLLCLK.limit = .{
                    .min = 1.2e7,
                    .max = 6.4e7,
                    .main_expr = "scale1 & ((PLLUsed=1 & SysSourcePLL) | (MCOSourcePLL & MCOConfig) | (MCO2SourcePLL & MCO2Config))",
                    .main_dialog = " ",
                };
            } else {
                PLLCLK.limit = .{
                    .min = 1.2e7,
                    .max = 1.6e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"=")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_0) {
                            const patch_str = if (patch_logs) "WS0" else "FLASH_LATENCY_0";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "((HCLKFreq_Value < 8000000)|(HCLKFreq_Value= 8000000 ))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"=")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_1) {
                            const patch_str = if (patch_logs) "WS1" else "FLASH_LATENCY_1";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "scale2 & ((HCLKFreq_Value < 16000000)|(HCLKFreq_Value= 16000000))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if (scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"=")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_0) {
                            const patch_str = if (patch_logs) "WS0" else "FLASH_LATENCY_0";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "scale1 &((HCLKFreq_Value < 24000000)|(HCLKFreq_Value= 24000000 ))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if (scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"=")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_1) {
                            const patch_str = if (patch_logs) "WS1" else "FLASH_LATENCY_1";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "scale1 & ((HCLKFreq_Value < 48000000)|(HCLKFreq_Value= 48000000))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if (scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 64000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 64000000, .@"=")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_2) {
                            const patch_str = if (patch_logs) "WS2" else "FLASH_LATENCY_2";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "scale1 &((HCLKFreq_Value < 64000000)|(HCLKFreq_Value= 64000000 ))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                }
                const user_val = config.extra_config.FLatency;

                if (user_val) |val| {
                    switch (val) {
                        .FLASH_LATENCY_0 => {},
                        .FLASH_LATENCY_1 => FLASH_LATENCY1 = true,
                        .FLASH_LATENCY_2 => FLASH_LATENCY2 = true,
                    }
                }
                break :blk user_val orelse .FLASH_LATENCY_0;
            };

            const HSIUsedValue: u1 = blk: {
                if (config.flags.UCPD_Used or (CECSOURCEHSI and config.flags.CECUsed_ForRCC) or (I2S1SourceHsi and config.flags.I2S1Used_ForRCC) or (I2S2SourceHsi and config.flags.I2S2Used_ForRCC) or (ADCSourceHsi and config.flags.ADC1_USED and config.flags.ADCUsed_ForRCC) or (RNGClockisHSI and config.flags.RNGUsed_ForRCC) or (USART1SourceHSI and config.flags.USART1Used_ForRCC) or (USART2SourceHSI and config.flags.USART2Used_ForRCC) or (USART3SourceHSI and config.flags.USART3Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUART1Used_ForRCC) or (LPUART2SourceHSI and config.flags.LPUART2Used_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCEHSI and config.flags.LPTIM2Used_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C2SourceHSI and config.flags.I2C2Used_ForRCC) or ((PLLSourceHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig)))) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_HSI, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOC2onfig))))) {
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
            if (!(check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=") or check_ref(@TypeOf(EnableHSELCDDevisorValue), EnableHSELCDDevisorValue, .true, .@"="))) {
                HSERTCDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=") or check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"="))) {
                RTCClkSource.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"="))) {
                RTCOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableRTCWKUPValue), EnableRTCWKUPValue, .true, .@"="))) {
                RTCWkupOutput.nodetype = .off;
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
            if (!(check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"="))) {
                USART2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"="))) {
                USART2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S1EnableValue), I2S1EnableValue, .true, .@"="))) {
                I2S1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S1EnableValue), I2S1EnableValue, .true, .@"="))) {
                I2S1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"="))) {
                I2S2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"="))) {
                I2S2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"="))) {
                USART3Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"="))) {
                USART3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"="))) {
                LPUART1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"="))) {
                LPUART1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"="))) {
                LPTIM1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"="))) {
                LPTIM1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"="))) {
                LPTIM2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"="))) {
                LPTIM2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPUART2EnableValue), LPUART2EnableValue, .true, .@"="))) {
                LPUART2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPUART2EnableValue), LPUART2EnableValue, .true, .@"="))) {
                LPUART2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableCECValue), EnableCECValue, .true, .@"="))) {
                HSICECCDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableCECValue), EnableCECValue, .true, .@"="))) {
                CECMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableCECValue), EnableCECValue, .true, .@"="))) {
                CECoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(TIM1EnableValue), TIM1EnableValue, .true, .@"="))) {
                TIM1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(TIM1EnableValue), TIM1EnableValue, .true, .@"="))) {
                TIM1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(TIM15EnableValue), TIM15EnableValue, .true, .@"="))) {
                TIM15Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(TIM15EnableValue), TIM15EnableValue, .true, .@"="))) {
                TIM15output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGDIV.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGHSIDiv.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                CK48Mult.nodetype = .off;
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
            if (!(check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"="))) {
                I2C2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"="))) {
                I2C2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                USBMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                USBoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"="))) {
                I2S_CKIN.nodetype = .off;
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
            if (!(check_ref(@TypeOf(MCO2EnableValue), MCO2EnableValue, .true, .@"="))) {
                MCO2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO2EnableValue), MCO2EnableValue, .true, .@"="))) {
                MCO2Div.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO2EnableValue), MCO2EnableValue, .true, .@"="))) {
                MCO2Pin.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"="))) {
                LSCOMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"="))) {
                LSCOOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCPLLEnableValue), ADCPLLEnableValue, .true, .@"=") or check_ref(@TypeOf(I2S1PLLEnableValue), I2S1PLLEnableValue, .true, .@"=") or check_ref(@TypeOf(I2S2PLLEnableValue), I2S2PLLEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOPLLEnableValue), MCOPLLEnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2PLLEnableValue), MCO2PLLEnableValue, .true, .@"="))) {
                PLLP.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCPLLEnableValue), ADCPLLEnableValue, .true, .@"=") or check_ref(@TypeOf(I2S1PLLEnableValue), I2S1PLLEnableValue, .true, .@"=") or check_ref(@TypeOf(I2S2PLLEnableValue), I2S2PLLEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOPLLEnableValue), MCOPLLEnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2PLLEnableValue), MCO2PLLEnableValue, .true, .@"="))) {
                PLLPoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                PLLQ.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGPLLEnableValue), RNGPLLEnableValue, .true, .@"=") or check_ref(@TypeOf(TIM1PLLEnableValue), TIM1PLLEnableValue, .true, .@"=") or check_ref(@TypeOf(TIM15PLLEnableValue), TIM15PLLEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANPllEnableValue), FDCANPllEnableValue, .true, .@"=") or check_ref(@TypeOf(USBPllEnableValue), USBPllEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOPLLEnableValue), MCOPLLEnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2PLLEnableValue), MCO2PLLEnableValue, .true, .@"="))) {
                PLLQoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                PLLR.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                PLLCLK.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.HSISYS = try HSISYS.get_output();
            out.HSI48RC = try HSI48RC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.PLLM = try PLLM.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.RTCWkupOutput = try RTCWkupOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2output = try USART2output.get_output();
            out.I2S1Mult = try I2S1Mult.get_output();
            out.I2S1output = try I2S1output.get_output();
            out.I2S2Mult = try I2S2Mult.get_output();
            out.I2S2output = try I2S2output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3output = try USART3output.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.LPTIM2Mult = try LPTIM2Mult.get_output();
            out.LPTIM2output = try LPTIM2output.get_output();
            out.LPUART2Mult = try LPUART2Mult.get_output();
            out.LPUART2output = try LPUART2output.get_output();
            out.HSICECCDevisor = try HSICECCDevisor.get_output();
            out.CECMult = try CECMult.get_output();
            out.CECoutput = try CECoutput.get_output();
            out.TIM1Mult = try TIM1Mult.get_output();
            out.TIM1output = try TIM1output.get_output();
            out.TIM15Mult = try TIM15Mult.get_output();
            out.TIM15output = try TIM15output.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.RNGDIV = try RNGDIV.get_output();
            out.RNGHSIDiv = try RNGHSIDiv.get_output();
            out.CK48Mult = try CK48Mult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2output = try I2C2output.get_output();
            out.FDCANMult = try FDCANMult.get_output();
            out.FDCANoutput = try FDCANoutput.get_output();
            out.USBMult = try USBMult.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.PWRCLKoutput = try PWRCLKoutput.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.APBPrescaler = try APBPrescaler.get_output();
            out.APBOutput = try APBOutput.get_output();
            out.TimPrescalerAPB = try TimPrescalerAPB.get_output();
            out.TimPrescOut1 = try TimPrescOut1.get_output();
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
            ref_out.HSISYSCLKDivider = HSISYSCLKDividerValue;
            ignore_value(HSI48_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLLM = PLLMValue;
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(RTCWUPFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.USART1CLockSelection = USART1CLockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.USART2CLockSelection = USART2CLockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.I2S1CLockSelection = I2S1CLockSelectionValue;
            ignore_value(I2S1Freq_ValueValue);
            ref_out.I2S2CLockSelection = I2S2CLockSelectionValue;
            ignore_value(I2S2Freq_ValueValue);
            ref_out.USART3CLockSelection = USART3CLockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.LPUART1CLockSelection = LPUART1CLockSelectionValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.LPTIM2CLockSelection = LPTIM2CLockSelectionValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.LPUART2CLockSelection = LPUART2CLockSelectionValue;
            ignore_value(LPUART2Freq_ValueValue);
            ref_out.RCC_CEC_Clock_Source_FROM_HSI16 = RCC_CEC_Clock_Source_FROM_HSI16Value;
            ref_out.CECCLockSelection = CECCLockSelectionValue;
            ignore_value(CECFreq_ValueValue);
            ref_out.TIM1CLockSelectionVirtual = TIM1CLockSelectionVirtualValue;
            ignore_value(TIM1Freq_ValueValue);
            ref_out.TIM15CLockSelectionVirtual = TIM15CLockSelectionVirtualValue;
            ignore_value(TIM15Freq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.RNGCLKDivider = RNGCLKDividerValue;
            ref_out.RNGHSIDiv = RNGHSIDivValue;
            ref_out.RNGCLockSelection = RNGCLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C2CLockSelection = I2C2CLockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.FDCANCLockSelection = FDCANCLockSelectionValue;
            ignore_value(FDCANFreq_ValueValue);
            ref_out.USBCLockSelection = USBCLockSelectionValue;
            ignore_value(USBFreq_ValueValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCO2Div = RCC_MCO2DivValue;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.LSCOSource1 = LSCOSource1Value;
            ignore_value(LSCOPinFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(PWRFreq_ValueValue);
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ignore_value(CortexFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APBFreq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APBTimFreq_ValueValue);
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
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.CodegenConfigPeriph = CodegenConfigPeriphValue == .true;
            ignore_value(SYSCLKFreq_VALUE1Value);
            ignore_value(SYSCLKFreq_VALUE2Value);
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.EnableRTCWKUP = EnableRTCWKUPValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.I2S1Enable = I2S1EnableValue == .true;
            ref_out.flags.I2S2Enable = I2S2EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.LPUART2Enable = LPUART2EnableValue == .true;
            ref_out.flags.EnableCEC = EnableCECValue == .true;
            ref_out.flags.TIM1Enable = TIM1EnableValue == .true;
            ref_out.flags.TIM15Enable = TIM15EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.FDCANEnable = FDCANEnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.MCO2Enable = MCO2EnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.ADCPLLEnable = ADCPLLEnableValue == .true;
            ref_out.flags.I2S1PLLEnable = I2S1PLLEnableValue == .true;
            ref_out.flags.I2S2PLLEnable = I2S2PLLEnableValue == .true;
            ref_out.flags.MCOPLLEnable = MCOPLLEnableValue == .true;
            ref_out.flags.MCO2PLLEnable = MCO2PLLEnableValue == .true;
            ref_out.flags.RNGPLLEnable = RNGPLLEnableValue == .true;
            ref_out.flags.TIM1PLLEnable = TIM1PLLEnableValue == .true;
            ref_out.flags.TIM15PLLEnable = TIM15PLLEnableValue == .true;
            ref_out.flags.FDCANPllEnable = FDCANPllEnableValue == .true;
            ref_out.flags.USBPllEnable = USBPllEnableValue == .true;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.EnableExtClockForI2S = EnableExtClockForI2SValue == .true;
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
