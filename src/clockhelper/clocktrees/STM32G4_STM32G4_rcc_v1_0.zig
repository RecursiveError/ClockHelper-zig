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
        pub const RCC_SAISEL = enum(u2) {
            SYS = 0,
            PLL1_Q = 1,
            I2S_CKIN = 2,
            HSI = 3,
        };
        pub const RCC_I2CSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };
        pub const RCC_PLLSRC = enum(u2) {
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_PLLR = enum(u2) {
            Div2 = 0,
            Div4 = 1,
            Div6 = 2,
            Div8 = 3,
        };
        pub const RCC_SW = enum(u2) {
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
        pub const RCC_PLLM = enum(u4) {
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
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
        };
        pub const RCC_UARTSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_I2SSEL = enum(u2) {
            SYS = 0,
            PLL1_Q = 1,
            I2S_CKIN = 2,
            HSI = 3,
        };
        pub const RCC_PLLQ = enum(u2) {
            Div2 = 0,
            Div4 = 1,
            Div6 = 2,
            Div8 = 3,
        };
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 1,
            HSI = 3,
            HSE = 4,
            PLLCLK = 5,
            LSI = 6,
            LSE = 7,
            HSI48 = 8,
        };
        pub const RCC_CLK48SEL = enum(u2) {
            HSI48 = 0,
            PLL1_Q = 2,
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
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_QSPISEL = enum(u2) {
            SYS = 0,
            HSI = 1,
            PLL1_Q = 2,
        };
        pub const RCC_FDCANSEL = enum(u2) {
            HSE = 0,
            PLL1_Q = 1,
            PCLK1 = 2,
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
        pub const RCC_LPTIMSEL = enum(u2) {
            PCLK1 = 0,
            LSI = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE_DIV_32 = 3,
        };
        pub const RCC_ADCSEL = enum(u2) {
            PLL1_P = 1,
            SYS = 2,
        };
        pub const FLASH_LATENCY = enum(u4) {
            WS0 = 0,
            WS1 = 1,
            WS2 = 2,
            WS3 = 3,
            WS4 = 4,
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_R,
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .PLL1_R => .RCC_SYSCLKSOURCE_PLLCLK,
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_HSE,

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

        pub const PLLMList = enum {
            RCC_PLLM_DIV1,
            RCC_PLLM_DIV2,
            RCC_PLLM_DIV3,
            RCC_PLLM_DIV4,
            RCC_PLLM_DIV5,
            RCC_PLLM_DIV6,
            RCC_PLLM_DIV7,
            RCC_PLLM_DIV8,
            RCC_PLLM_DIV9,
            RCC_PLLM_DIV10,
            RCC_PLLM_DIV11,
            RCC_PLLM_DIV12,
            RCC_PLLM_DIV13,
            RCC_PLLM_DIV14,
            RCC_PLLM_DIV15,
            RCC_PLLM_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLM {
                return switch (self) {
                    .RCC_PLLM_DIV9 => .Div9,
                    .RCC_PLLM_DIV5 => .Div5,
                    .RCC_PLLM_DIV11 => .Div11,
                    .RCC_PLLM_DIV10 => .Div10,
                    .RCC_PLLM_DIV1 => .Div1,
                    .RCC_PLLM_DIV3 => .Div3,
                    .RCC_PLLM_DIV6 => .Div6,
                    .RCC_PLLM_DIV7 => .Div7,
                    .RCC_PLLM_DIV12 => .Div12,
                    .RCC_PLLM_DIV8 => .Div8,
                    .RCC_PLLM_DIV13 => .Div13,
                    .RCC_PLLM_DIV15 => .Div15,
                    .RCC_PLLM_DIV16 => .Div16,
                    .RCC_PLLM_DIV14 => .Div14,
                    .RCC_PLLM_DIV4 => .Div4,
                    .RCC_PLLM_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_PLLM) anyerror!@This() {
                return switch (item) {
                    .Div9 => .RCC_PLLM_DIV9,
                    .Div5 => .RCC_PLLM_DIV5,
                    .Div11 => .RCC_PLLM_DIV11,
                    .Div10 => .RCC_PLLM_DIV10,
                    .Div1 => .RCC_PLLM_DIV1,
                    .Div3 => .RCC_PLLM_DIV3,
                    .Div6 => .RCC_PLLM_DIV6,
                    .Div7 => .RCC_PLLM_DIV7,
                    .Div12 => .RCC_PLLM_DIV12,
                    .Div8 => .RCC_PLLM_DIV8,
                    .Div13 => .RCC_PLLM_DIV13,
                    .Div15 => .RCC_PLLM_DIV15,
                    .Div16 => .RCC_PLLM_DIV16,
                    .Div14 => .RCC_PLLM_DIV14,
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
                    .RCC_PLLM_DIV9 => 9,
                    .RCC_PLLM_DIV10 => 10,
                    .RCC_PLLM_DIV11 => 11,
                    .RCC_PLLM_DIV12 => 12,
                    .RCC_PLLM_DIV13 => 13,
                    .RCC_PLLM_DIV14 => 14,
                    .RCC_PLLM_DIV15 => 15,
                    .RCC_PLLM_DIV16 => 16,
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
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => .HSE_DIV_32,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .HSE_DIV_32 => .RCC_RTCCLKSOURCE_HSE_DIV32,
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

        pub const USART3CLockSelectionList = enum {
            RCC_USART3CLKSOURCE_PCLK1,
            RCC_USART3CLKSOURCE_SYSCLK,
            RCC_USART3CLKSOURCE_HSI,
            RCC_USART3CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_UARTSEL {
                return switch (self) {
                    .RCC_USART3CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_UARTSEL) anyerror!@This() {
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

            pub fn to_enum(self: @This()) anyerror!RCC_UARTSEL {
                return switch (self) {
                    .RCC_UART4CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_UART4CLKSOURCE_HSI => .HSI,
                    .RCC_UART4CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART4CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_UARTSEL) anyerror!@This() {
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

            pub fn to_enum(self: @This()) anyerror!RCC_UARTSEL {
                return switch (self) {
                    .RCC_UART5CLKSOURCE_LSE => .LSE,
                    .RCC_UART5CLKSOURCE_HSI => .HSI,
                    .RCC_UART5CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART5CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_UARTSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_UART5CLKSOURCE_LSE,
                    .HSI => .RCC_UART5CLKSOURCE_HSI,
                    .SYS => .RCC_UART5CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_UART5CLKSOURCE_PCLK1,
                };
            }
        };

        pub const USART2CLockSelectionList = enum {
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

        pub const I2SCLockSelectionList = enum {
            RCC_I2SCLKSOURCE_SYSCLK,
            RCC_I2SCLKSOURCE_PLL,
            RCC_I2SCLKSOURCE_EXT,
            RCC_I2SCLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2SSEL {
                return switch (self) {
                    .RCC_I2SCLKSOURCE_HSI => .HSI,
                    .RCC_I2SCLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2SCLKSOURCE_EXT => .I2S_CKIN,
                    .RCC_I2SCLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_I2SSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2SCLKSOURCE_HSI,
                    .SYS => .RCC_I2SCLKSOURCE_SYSCLK,
                    .I2S_CKIN => .RCC_I2SCLKSOURCE_EXT,
                    .PLL1_Q => .RCC_I2SCLKSOURCE_PLL,
                };
            }
        };

        pub const SAI1CLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_SYSCLK,
            RCC_SAI1CLKSOURCE_PLL,
            RCC_SAI1CLKSOURCE_EXT,
            RCC_SAI1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_EXT => .I2S_CKIN,
                    .RCC_SAI1CLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SAI1CLKSOURCE_HSI => .HSI,
                    .RCC_SAI1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_SAI1CLKSOURCE_EXT,
                    .PLL1_Q => .RCC_SAI1CLKSOURCE_PLL,
                    .HSI => .RCC_SAI1CLKSOURCE_HSI,
                    .SYS => .RCC_SAI1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const QSPICLockSelectionList = enum {
            RCC_QSPICLKSOURCE_SYSCLK,
            RCC_QSPICLKSOURCE_PLL,
            RCC_QSPICLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_QSPISEL {
                return switch (self) {
                    .RCC_QSPICLKSOURCE_HSI => .HSI,
                    .RCC_QSPICLKSOURCE_PLL => .PLL1_Q,
                    .RCC_QSPICLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_QSPISEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_QSPICLKSOURCE_HSI,
                    .PLL1_Q => .RCC_QSPICLKSOURCE_PLL,
                    .SYS => .RCC_QSPICLKSOURCE_SYSCLK,
                };
            }
        };

        pub const FDCANCLockSelectionList = enum {
            RCC_FDCANCLKSOURCE_PCLK1,
            RCC_FDCANCLKSOURCE_PLL,
            RCC_FDCANCLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_FDCANSEL {
                return switch (self) {
                    .RCC_FDCANCLKSOURCE_HSE => .HSE,
                    .RCC_FDCANCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_FDCANCLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_FDCANSEL) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_FDCANCLKSOURCE_HSE,
                    .PLL1_Q => .RCC_FDCANCLKSOURCE_PLL,
                    .PCLK1 => .RCC_FDCANCLKSOURCE_PCLK1,
                };
            }
        };

        pub const LPUART1CLockSelectionList = enum {
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

        pub const ADC12CLockSelectionList = enum {
            RCC_ADC12CLKSOURCE_SYSCLK,
            RCC_ADC12CLKSOURCE_PLL,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADC12CLKSOURCE_PLL => .PLL1_P,
                    .RCC_ADC12CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_ADC12CLKSOURCE_PLL,
                    .SYS => .RCC_ADC12CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const ADC345CLockSelectionList = enum {
            RCC_ADC345CLKSOURCE_SYSCLK,
            RCC_ADC345CLKSOURCE_PLL,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADC345CLKSOURCE_PLL => .PLL1_P,
                    .RCC_ADC345CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_ADC345CLKSOURCE_PLL,
                    .SYS => .RCC_ADC345CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const CK48CLockSelectionList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_CLK48SEL {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_USBCLKSOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_CLK48SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_USBCLKSOURCE_PLL,
                    .HSI48 => .RCC_USBCLKSOURCE_HSI48,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
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

        pub const I2C2CLockSelectionList = enum {
            RCC_I2C2CLKSOURCE_PCLK1,
            RCC_I2C2CLKSOURCE_SYSCLK,
            RCC_I2C2CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
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

        pub const I2C4CLockSelectionList = enum {
            RCC_I2C4CLKSOURCE_PCLK1,
            RCC_I2C4CLKSOURCE_SYSCLK,
            RCC_I2C4CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C4CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C4CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C4CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_I2C4CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2C4CLKSOURCE_PCLK1,
                    .HSI => .RCC_I2C4CLKSOURCE_HSI,
                };
            }
        };

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_PLLCLK,
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_PLLCLK => .PLLCLK,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .PLLCLK => .RCC_MCO1SOURCE_PLLCLK,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
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

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_2 => .WS2,
                    .FLASH_LATENCY_3 => .WS3,
                    .FLASH_LATENCY_0 => .WS0,
                    .FLASH_LATENCY_1 => .WS1,
                    .FLASH_LATENCY_4 => .WS4,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS2 => .FLASH_LATENCY_2,
                    .WS3 => .FLASH_LATENCY_3,
                    .WS0 => .FLASH_LATENCY_0,
                    .WS1 => .FLASH_LATENCY_1,
                    .WS4 => .FLASH_LATENCY_4,
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

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE1_BOOST,
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

        pub const EnableCRSList = enum {
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

        pub const MCOEnableList = enum {
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

        pub const USART2EnableList = enum {
            true,
            false,
        };

        pub const I2SEnableList = enum {
            true,
            false,
        };

        pub const SAI1EnableList = enum {
            true,
            false,
        };

        pub const QSPIEnableList = enum {
            true,
            false,
        };

        pub const FDCANEnableList = enum {
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

        pub const ADC12EnableList = enum {
            false,
            true,
        };

        pub const ADC345EnableList = enum {
            false,
            true,
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

        pub const I2C4EnableList = enum {
            true,
            false,
        };

        pub const ExtClockEnableList = enum {
            true,
            false,
        };

        pub const LSCOEnableList = enum {
            true,
            false,
        };

        pub const HRTIM1EnableList = enum {
            true,
            false,
        };

        pub const CodegenDisableForPeriphList = enum {
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
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            USE_ADC3: bool = false,
            USE_ADC4: bool = false,
            USE_ADC5: bool = false,
            RNGUsed_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SAIBUsed_ForRCC: bool = false,
            SAIAUsed_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            FDCAN3Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            ADC4UsedAsynchronousCLK_ForRCC: bool = false,
            ADC5UsedAsynchronousCLK_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            HRTIM1Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            UCPD_Used: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            USE_ADC3: bool = false,
            USE_ADC4: bool = false,
            USE_ADC5: bool = false,
            RNGUsed_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SAIBUsed_ForRCC: bool = false,
            SAIAUsed_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            FDCAN3Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            ADC4UsedAsynchronousCLK_ForRCC: bool = false,
            ADC5UsedAsynchronousCLK_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            HRTIM1Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            UCPD_Used: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            EnableCRS: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            UART4Enable: bool = false, //Reference flag
            UART5Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            I2SEnable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            QSPIEnable: bool = false, //Reference flag
            FDCANEnable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            ADC12Enable: bool = false, //Reference flag
            ADC345Enable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            I2C4Enable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            HRTIM1Enable: bool = false, //Reference flag
            CodegenDisableForPeriph: bool = false, //Reference flag
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
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            GPIOFsync: ?u32 = null,
            HSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?PLLMList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            USART3CLockSelection: ?USART3CLockSelectionList = null,
            UART4CLockSelection: ?UART4CLockSelectionList = null,
            UART5CLockSelection: ?UART5CLockSelectionList = null,
            USART2CLockSelection: ?USART2CLockSelectionList = null,
            I2SCLockSelection: ?I2SCLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
            QSPICLockSelection: ?QSPICLockSelectionList = null,
            FDCANCLockSelection: ?FDCANCLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            ADC12CLockSelection: ?ADC12CLockSelectionList = null,
            ADC345CLockSelection: ?ADC345CLockSelectionList = null,
            CK48CLockSelection: ?CK48CLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C2CLockSelection: ?I2C2CLockSelectionList = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
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
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLM: PLLMList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            USART3CLockSelection: USART3CLockSelectionList,
            UART4CLockSelection: UART4CLockSelectionList,
            UART5CLockSelection: UART5CLockSelectionList,
            USART2CLockSelection: USART2CLockSelectionList,
            I2SCLockSelection: I2SCLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
            QSPICLockSelection: QSPICLockSelectionList,
            FDCANCLockSelection: FDCANCLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            ADC12CLockSelection: ADC12CLockSelectionList,
            ADC345CLockSelection: ADC345CLockSelectionList,
            CK48CLockSelection: CK48CLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C2CLockSelection: I2C2CLockSelectionList,
            I2C3CLockSelection: I2C3CLockSelectionList,
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
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            Prescaler: ?PrescalerList,
            Source: ?SourceList,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            LSEFsync: f32,
            GPIOFsync: u32,
            USBFsync: f32,
            HSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
            ErrorLimitValue: ?u32,
            HSI48CalibrationValue: ?u32,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            GPIOFsync: ?u32 = null,
            HSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .Prescaler = self.Prescaler,
                    .Polarity = self.Polarity,
                    .ReloadValueType = self.ReloadValueType,
                    .ReloadValue = self.ReloadValue,
                    .GPIOFsync = self.GPIOFsync,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = self.PWR_Regulator_Voltage_Scale,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .ErrorLimitValue = self.ErrorLimitValue,
                    .HSI48CalibrationValue = self.HSI48CalibrationValue,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?RCC_PLLM = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelection: ?RCC_USART1SEL = null,
            USART3CLockSelection: ?RCC_UARTSEL = null,
            UART4CLockSelection: ?RCC_UARTSEL = null,
            UART5CLockSelection: ?RCC_UARTSEL = null,
            USART2CLockSelection: ?RCC_UARTSEL = null,
            I2SCLockSelection: ?RCC_I2SSEL = null,
            SAI1CLockSelection: ?RCC_SAISEL = null,
            QSPICLockSelection: ?RCC_QSPISEL = null,
            FDCANCLockSelection: ?RCC_FDCANSEL = null,
            LPUART1CLockSelection: ?RCC_UARTSEL = null,
            LPTIM1CLockSelection: ?RCC_LPTIMSEL = null,
            ADC12CLockSelection: ?RCC_ADCSEL = null,
            ADC345CLockSelection: ?RCC_ADCSEL = null,
            CK48CLockSelection: ?RCC_CLK48SEL = null,
            I2C1CLockSelection: ?RCC_I2CSEL = null,
            I2C2CLockSelection: ?RCC_I2CSEL = null,
            I2C3CLockSelection: ?RCC_I2CSEL = null,
            I2C4CLockSelection: ?RCC_I2CSEL = null,
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
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = if (self.PLLM) |val| try PLLMList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .USART3CLockSelection = if (self.USART3CLockSelection) |val| try USART3CLockSelectionList.from_enum(val) else null,
                    .UART4CLockSelection = if (self.UART4CLockSelection) |val| try UART4CLockSelectionList.from_enum(val) else null,
                    .UART5CLockSelection = if (self.UART5CLockSelection) |val| try UART5CLockSelectionList.from_enum(val) else null,
                    .USART2CLockSelection = if (self.USART2CLockSelection) |val| try USART2CLockSelectionList.from_enum(val) else null,
                    .I2SCLockSelection = if (self.I2SCLockSelection) |val| try I2SCLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
                    .QSPICLockSelection = if (self.QSPICLockSelection) |val| try QSPICLockSelectionList.from_enum(val) else null,
                    .FDCANCLockSelection = if (self.FDCANCLockSelection) |val| try FDCANCLockSelectionList.from_enum(val) else null,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .ADC12CLockSelection = if (self.ADC12CLockSelection) |val| try ADC12CLockSelectionList.from_enum(val) else null,
                    .ADC345CLockSelection = if (self.ADC345CLockSelection) |val| try ADC345CLockSelectionList.from_enum(val) else null,
                    .CK48CLockSelection = if (self.CK48CLockSelection) |val| try CK48CLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C2CLockSelection = if (self.I2C2CLockSelection) |val| try I2C2CLockSelectionList.from_enum(val) else null,
                    .I2C3CLockSelection = if (self.I2C3CLockSelection) |val| try I2C3CLockSelectionList.from_enum(val) else null,
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
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLM: RCC_PLLM,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelection: RCC_USART1SEL,
            USART3CLockSelection: RCC_UARTSEL,
            UART4CLockSelection: RCC_UARTSEL,
            UART5CLockSelection: RCC_UARTSEL,
            USART2CLockSelection: RCC_UARTSEL,
            I2SCLockSelection: RCC_I2SSEL,
            SAI1CLockSelection: RCC_SAISEL,
            QSPICLockSelection: RCC_QSPISEL,
            FDCANCLockSelection: RCC_FDCANSEL,
            LPUART1CLockSelection: RCC_UARTSEL,
            LPTIM1CLockSelection: RCC_LPTIMSEL,
            ADC12CLockSelection: RCC_ADCSEL,
            ADC345CLockSelection: RCC_ADCSEL,
            CK48CLockSelection: RCC_CLK48SEL,
            I2C1CLockSelection: RCC_I2CSEL,
            I2C2CLockSelection: RCC_I2CSEL,
            I2C3CLockSelection: RCC_I2CSEL,
            I2C4CLockSelection: RCC_I2CSEL,
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
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            Prescaler: ?PrescalerList,
            Source: ?CRS_SYNCSRC,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            LSEFsync: f32,
            GPIOFsync: u32,
            USBFsync: f32,
            HSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,
            ErrorLimitValue: ?u32,
            HSI48CalibrationValue: ?u32,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = try cubemx_config.PLLM.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .USART3CLockSelection = try cubemx_config.USART3CLockSelection.to_enum(),
                    .UART4CLockSelection = try cubemx_config.UART4CLockSelection.to_enum(),
                    .UART5CLockSelection = try cubemx_config.UART5CLockSelection.to_enum(),
                    .USART2CLockSelection = try cubemx_config.USART2CLockSelection.to_enum(),
                    .I2SCLockSelection = try cubemx_config.I2SCLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
                    .QSPICLockSelection = try cubemx_config.QSPICLockSelection.to_enum(),
                    .FDCANCLockSelection = try cubemx_config.FDCANCLockSelection.to_enum(),
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .ADC12CLockSelection = try cubemx_config.ADC12CLockSelection.to_enum(),
                    .ADC345CLockSelection = try cubemx_config.ADC345CLockSelection.to_enum(),
                    .CK48CLockSelection = try cubemx_config.CK48CLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C2CLockSelection = try cubemx_config.I2C2CLockSelection.to_enum(),
                    .I2C3CLockSelection = try cubemx_config.I2C3CLockSelection.to_enum(),
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
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = try cubemx_config.FLatency.to_enum(),
                    .Prescaler = cubemx_config.Prescaler,
                    .Source = if (cubemx_config.Source) |val| try val.to_enum() else null,
                    .Polarity = cubemx_config.Polarity,
                    .ReloadValueType = cubemx_config.ReloadValueType,
                    .ReloadValue = cubemx_config.ReloadValue,
                    .LSEFsync = cubemx_config.LSEFsync,
                    .GPIOFsync = cubemx_config.GPIOFsync,
                    .USBFsync = cubemx_config.USBFsync,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = cubemx_config.PWR_Regulator_Voltage_Scale,
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
                    .LSE_Drive_Capability = if (cubemx_config.LSE_Drive_Capability) |val| try val.to_enum() else null,
                    .ErrorLimitValue = cubemx_config.ErrorLimitValue,
                    .HSI48CalibrationValue = cubemx_config.HSI48CalibrationValue,
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
            CRSCLKoutput: u32 = 0,
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
            LCDOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3output: u32 = 0,
            UART4Mult: u32 = 0,
            UART4output: u32 = 0,
            UART5Mult: u32 = 0,
            UART5output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2output: u32 = 0,
            I2SMult: u32 = 0,
            I2Soutput: u32 = 0,
            SAI1Mult: u32 = 0,
            SAI1output: u32 = 0,
            QSPIMult: u32 = 0,
            QSPIoutput: u32 = 0,
            FDCANMult: u32 = 0,
            FDCANoutput: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            ADC12Mult: u32 = 0,
            ADC12output: u32 = 0,
            ADC345Mult: u32 = 0,
            ADC345output: u32 = 0,
            CK48Mult: u32 = 0,
            CK48output: u32 = 0,
            RNGoutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3output: u32 = 0,
            I2C4Mult: u32 = 0,
            I2C4output: u32 = 0,
            I2S_CKIN: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            HRTIM1CLKoutput: u32 = 0,
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

            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourcePCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourcePll: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePll: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var QSPISourceSYSCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var QSPISourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var QSPISourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANSourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADC12SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADC12SourcePllp: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADC345SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADC345SourcePllp: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var I2C4SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1boost: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var CRSCLKoutput = ClockNode{
                .name = "CRSCLKoutput",
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

            var I2SMult = ClockNode{
                .name = "I2SMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2Soutput = ClockNode{
                .name = "I2Soutput",
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

            var QSPIMult = ClockNode{
                .name = "QSPIMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var QSPIoutput = ClockNode{
                .name = "QSPIoutput",
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

            var ADC12Mult = ClockNode{
                .name = "ADC12Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADC12output = ClockNode{
                .name = "ADC12output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADC345Mult = ClockNode{
                .name = "ADC345Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADC345output = ClockNode{
                .name = "ADC345output",
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

            var HRTIM1CLKoutput = ClockNode{
                .name = "HRTIM1CLKoutput",
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

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 4.8e7,
                    };

                    break :blk user_val orelse 1e6;
                } else if (config.flags.HSEOscillator) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 4e6,
                        .max = 4.8e7,
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

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_HSI => SysSourceHSI = true,
                        .RCC_SYSCLKSOURCE_HSE => SysSourceHSE = true,
                        .RCC_SYSCLKSOURCE_PLLCLK => SysSourcePLL = true,
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
                        .RCC_PLLM_DIV9 => {},
                        .RCC_PLLM_DIV10 => {},
                        .RCC_PLLM_DIV11 => {},
                        .RCC_PLLM_DIV12 => {},
                        .RCC_PLLM_DIV13 => {},
                        .RCC_PLLM_DIV14 => {},
                        .RCC_PLLM_DIV15 => {},
                        .RCC_PLLM_DIV16 => {},
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
                        .RCC_UART4CLKSOURCE_SYSCLK => UART4SourceSys = true,
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
                        .RCC_UART5CLKSOURCE_SYSCLK => UART5SourceSys = true,
                        .RCC_UART5CLKSOURCE_HSI => UART5SourceHSI = true,
                        .RCC_UART5CLKSOURCE_LSE => UART4SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    UART5SourcePCLK1 = true;
                    break :blk .RCC_UART5CLKSOURCE_PCLK1;
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

            const I2SCLockSelectionValue: I2SCLockSelectionList = blk: {
                const user_val = config.I2SCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2SCLKSOURCE_SYSCLK => I2SSourcePCLK1 = true,
                        .RCC_I2SCLKSOURCE_PLL => I2SSourcePll = true,
                        .RCC_I2SCLKSOURCE_EXT => I2SSourceEXT = true,
                        .RCC_I2SCLKSOURCE_HSI => I2SSourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2SSourcePCLK1 = true;
                    break :blk .RCC_I2SCLKSOURCE_SYSCLK;
                };
            };

            const SAI1CLockSelectionValue: SAI1CLockSelectionList = blk: {
                const user_val = config.SAI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_SYSCLK => SAI1SourcePCLK1 = true,
                        .RCC_SAI1CLKSOURCE_PLL => SAI1SourcePll = true,
                        .RCC_SAI1CLKSOURCE_EXT => SAI1SourceEXT = true,
                        .RCC_SAI1CLKSOURCE_HSI => SAI1SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    SAI1SourcePCLK1 = true;
                    break :blk .RCC_SAI1CLKSOURCE_SYSCLK;
                };
            };

            const QSPICLockSelectionValue: QSPICLockSelectionList = blk: {
                const user_val = config.QSPICLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_QSPICLKSOURCE_SYSCLK => QSPISourceSYSCLK = true,
                        .RCC_QSPICLKSOURCE_PLL => QSPISourcePLL = true,
                        .RCC_QSPICLKSOURCE_HSI => QSPISourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    QSPISourceSYSCLK = true;
                    break :blk .RCC_QSPICLKSOURCE_SYSCLK;
                };
            };

            const FDCANCLockSelectionValue: FDCANCLockSelectionList = blk: {
                const user_val = config.FDCANCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FDCANCLKSOURCE_PCLK1 => FDCANSourcePCLK1 = true,
                        .RCC_FDCANCLKSOURCE_PLL => FDCANSourcePLL = true,
                        .RCC_FDCANCLKSOURCE_HSE => FDCANSourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    FDCANSourcePCLK1 = true;
                    break :blk .RCC_FDCANCLKSOURCE_PCLK1;
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

            const ADC12CLockSelectionValue: ADC12CLockSelectionList = blk: {
                const user_val = config.ADC12CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADC12CLKSOURCE_SYSCLK => ADC12SourceSys = true,
                        .RCC_ADC12CLKSOURCE_PLL => ADC12SourcePllp = true,
                    }
                }
                break :blk user_val orelse {
                    ADC12SourceSys = true;
                    break :blk .RCC_ADC12CLKSOURCE_SYSCLK;
                };
            };

            const ADC345CLockSelectionValue: ADC345CLockSelectionList = blk: {
                const user_val = config.ADC345CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADC345CLKSOURCE_SYSCLK => ADC345SourceSys = true,
                        .RCC_ADC345CLKSOURCE_PLL => ADC345SourcePllp = true,
                    }
                }
                break :blk user_val orelse {
                    ADC345SourceSys = true;
                    break :blk .RCC_ADC345CLKSOURCE_SYSCLK;
                };
            };

            const CK48CLockSelectionValue: CK48CLockSelectionList = blk: {
                const user_val = config.CK48CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL => CK48SourcePLLCLK = true,
                        .RCC_USBCLKSOURCE_HSI48 => CK48SourceHSI48 = true,
                    }
                }
                break :blk user_val orelse {
                    CK48SourcePLLCLK = true;
                    break :blk .RCC_USBCLKSOURCE_PLL;
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

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 1.2288e7;
            };

            const RCC_MCO1SourceValue: RCC_MCO1SourceList = blk: {
                const user_val = config.RCC_MCO1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_LSE => MCOSourceLSE = true,
                        .RCC_MCO1SOURCE_LSI => MCOSourceLSI = true,
                        .RCC_MCO1SOURCE_HSE => MCOSourceHSE = true,
                        .RCC_MCO1SOURCE_HSI => MCOSourceHSI = true,
                        .RCC_MCO1SOURCE_PLLCLK => MCOSourcePLL = true,
                        .RCC_MCO1SOURCE_SYSCLK => MCOSourcesys = true,
                        .RCC_MCO1SOURCE_HSI48 => MCOSourceHSI48 = true,
                    }
                }
                break :blk user_val orelse {
                    MCOSourceHSI = true;
                    break :blk .RCC_MCO1SOURCE_HSI;
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
                } else if (!config.flags.CRSActivatedSourceGPIO and !config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB) {
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

            const LSEFsyncValue: f32 = blk: {
                if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv1) {
                    const value: f32 = (LSE_VALUEValue);
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv2) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 2, .@"/", "LSE_VALUE"));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv4) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 4, .@"/", "LSE_VALUE"));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv8) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 8, .@"/", "LSE_VALUE"));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv16) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 16, .@"/", "LSE_VALUE"));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv32) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 32, .@"/", "LSE_VALUE"));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv64) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 64, .@"/", "LSE_VALUE"));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceLSE and RccCrsSyncDiv128) {
                    const value: f32 = (try math_op(?@TypeOf(LSE_VALUEValue), LSE_VALUEValue, 128, .@"/", "LSE_VALUE"));
                    break :blk value;
                }

                const value: f32 = (LSE_VALUEValue);
                break :blk value;
            };

            const GPIOFsyncValue: u32 = blk: {
                if (config.flags.CRSActivatedSourceGPIO) {
                    const user_val = config.extra_config.GPIOFsync;
                    if (user_val) |val| {
                        if (val < 1) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {d} found: {d}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "GPIOFsync",
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
                                "GPIOFsync",
                                "CRSActivatedSourceGPIO",
                                "",
                                48000000,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 1;
                }
                const user_val = config.extra_config.GPIOFsync;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "GPIOFsync",
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
                            "GPIOFsync",
                            "CRSActivatedSourceGPIO",
                            "",
                            48000000,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
            };

            const USBFsyncValue: f32 = blk: {
                if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv1) {
                    const value: f32 = (1000);
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv2) {
                    const value: f32 = (try math_op(?f32, 1000, 2, .@"/", ""));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv4) {
                    const value: f32 = (try math_op(?f32, 1000, 4, .@"/", ""));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv8) {
                    const value: f32 = (try math_op(?f32, 1000, 8, .@"/", ""));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv16) {
                    const value: f32 = (try math_op(?f32, 1000, 16, .@"/", ""));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv32) {
                    const value: f32 = (try math_op(?f32, 1000, 32, .@"/", ""));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv64) {
                    const value: f32 = (try math_op(?f32, 1000, 64, .@"/", ""));
                    break :blk value;
                } else if (config.flags.CRSActivatedSourceUSB and RccCrsSyncDiv128) {
                    const value: f32 = (try math_op(?f32, 1000, 128, .@"/", ""));
                    break :blk value;
                }

                const value: f32 = (1000);
                break :blk value;
            };

            const PLLUsedValue: u1 = blk: {
                if ((QSPISourcePLL and check_MCU("QSPI_Selected")) or (FDCANSourcePLL and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC or config.flags.FDCAN3Used_ForRCC)) or (SAI1SourcePll and (config.flags.SAIBUsed_ForRCC or config.flags.SAIAUsed_ForRCC)) or (I2SSourcePll and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or ((config.flags.USE_ADC1 or config.flags.USE_ADC2) and ADC12SourcePllp) or ((config.flags.USE_ADC3 or config.flags.USE_ADC4 or config.flags.USE_ADC5) and ADC345SourcePllp) or (SysSourcePLL) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)) or (CK48SourcePLLCLK and (config.flags.RNGUsed_ForRCC or config.flags.USBUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((I2SSourceHSI and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or config.flags.UCPD_Used or (SAI1SourceHSI and (config.flags.SAIBUsed_ForRCC or config.flags.SAIAUsed_ForRCC)) or (I2C4SourceHSI and config.flags.I2C4Used_ForRCC) or (QSPISourceHSI and check_MCU("QSPI_Selected")) or (check_MCU("ADC12SourceHsi") and (config.flags.USE_ADC1 or config.flags.USE_ADC2)) or (USART1SourceHSI and config.flags.USART1Used_ForRCC) or (USART2SourceHSI and config.flags.USART2Used_ForRCC) or (USART3SourceHSI and config.flags.USART3Used_ForRCC) or (UART4SourceHSI and config.flags.UART4Used_ForRCC) or (USART3SourceHSI and config.flags.USART3Used_ForRCC) or (UART5SourceHSI and config.flags.UART5Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C2SourceHSI and config.flags.I2C2Used_ForRCC) or (I2C3SourceHSI and config.flags.I2C3Used_ForRCC) or ((PLLSourceHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig))))) {
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
                if ((check_MCU("CECSOURCELSE") and config.flags.CECUsed_ForRCC) or (false) or (LSCOSSourceLSE and config.flags.LSCOConfig) or (check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM16")) or (check_MCU("SEM2RCC_LSE_REQUIRED_TIM2") and check_MCU("Semaphore_TIM2_L4_ETR_REMAPTIM2") and check_MCU("TIM2")) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (USART2SourceLSE and config.flags.USART2Used_ForRCC) or (USART3SourceLSE and config.flags.USART3Used_ForRCC) or (check_MCU("UART5SourceLSE") and config.flags.UART5Used_ForRCC) or (UART4SourceLSE and config.flags.UART4Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
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

            const EnableCRSValue: EnableCRSList = blk: {
                if (config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USBUsed_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RNGEnableValue: RNGEnableList = blk: {
                if (config.flags.RNGUsed_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if (config.flags.MCOConfig and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass)) and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSELCDDevisorValue: EnableHSELCDDevisorList = blk: {
                if (config.flags.LCDUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass) and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RTCEnableValue: RTCEnableList = blk: {
                if (config.flags.RTCUsed_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LCDEnableValue: LCDEnableList = blk: {
                if (config.flags.LCDUsed_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDGUsed_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART1EnableValue: USART1EnableList = blk: {
                if (config.flags.USART1Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART3EnableValue: USART3EnableList = blk: {
                if (config.flags.USART3Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const UART4EnableValue: UART4EnableList = blk: {
                if (config.flags.UART4Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const UART5EnableValue: UART5EnableList = blk: {
                if (config.flags.UART5Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART2EnableValue: USART2EnableList = blk: {
                if (config.flags.USART2Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2SEnableValue: I2SEnableList = blk: {
                if ((config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if ((config.flags.SAIBUsed_ForRCC or config.flags.SAIAUsed_ForRCC) and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const QSPIEnableValue: QSPIEnableList = blk: {
                if (check_MCU("QSPI_Selected") and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FDCANEnableValue: FDCANEnableList = blk: {
                if ((config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC or config.flags.FDCAN3Used_ForRCC) and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPUART1EnableValue: LPUART1EnableList = blk: {
                if (config.flags.LPUARTUsed_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIM1Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADC12EnableValue: ADC12EnableList = blk: {
                if (true) {
                    break :blk .false;
                } else if ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADC345EnableValue: ADC345EnableList = blk: {
                if (true) {
                    break :blk .false;
                } else if ((config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC4 and config.flags.ADC4UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC5 and config.flags.ADC5UsedAsynchronousCLK_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C1EnableValue: I2C1EnableList = blk: {
                if (config.flags.I2C1Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C2EnableValue: I2C2EnableList = blk: {
                if (config.flags.I2C2Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C3EnableValue: I2C3EnableList = blk: {
                if (config.flags.I2C3Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C4EnableValue: I2C4EnableList = blk: {
                if (config.flags.I2C4Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ExtClockEnableValue: ExtClockEnableList = blk: {
                if (config.flags.AudioClockConfig and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LSCOEnableValue: LSCOEnableList = blk: {
                if (config.flags.LSCOConfig and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HRTIM1EnableValue: HRTIM1EnableList = blk: {
                if (config.flags.HRTIM1Used_ForRCC and (true)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const CodegenDisableForPeriphValue: CodegenDisableForPeriphList = blk: {
                if (true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableCSSLSEValue: EnableCSSLSEList = blk: {
                if ((((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"="))) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC)) and (true)) {
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
                if ((config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) and config.flags.AudioClockConfig and (true)) {
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
                if ((MCOSourceHSI48 and config.flags.MCOConfig) or (CK48SourceHSI48 and config.flags.USBUsed_ForRCC) or (CK48SourceHSI48 and config.flags.RNGUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE HSI48RC ======
            if (check_ref(@TypeOf(EnableCRSValue), EnableCRSValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                HSI48RC.nodetype = .source;
                HSI48RC.value = HSI48_VALUEValue;
            }
            // ======= NODE CRSCLKoutput ======
            if (check_ref(@TypeOf(EnableCRSValue), EnableCRSValue, .true, .@"=")) {
                CRSCLKoutput.nodetype = .output;
                CRSCLKoutput.parents = &.{&HSI48RC};
            }
            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
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
                .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
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
                if (check_MCU("UART4_Exist")) {
                    UART4Mult.nodetype = .multi;
                    UART4Mult.parents = switch (UART4CLockSelectionValue) {
                        .RCC_UART4CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                        .RCC_UART4CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_UART4CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_UART4CLKSOURCE_LSE => &.{&LSEOSC},
                    };
                }
            }
            // ======= NODE UART4output ======
            if (check_ref(@TypeOf(UART4EnableValue), UART4EnableValue, .true, .@"=")) {
                if (check_MCU("UART4_Exist")) {
                    UART4output.nodetype = .output;
                    UART4output.parents = &.{&UART4Mult};
                }
            }
            // ======= NODE UART5Mult ======
            if (check_ref(@TypeOf(UART5EnableValue), UART5EnableValue, .true, .@"=")) {
                if (check_MCU("UART5_Exist")) {
                    UART5Mult.nodetype = .multi;
                    UART5Mult.parents = switch (UART5CLockSelectionValue) {
                        .RCC_UART5CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                        .RCC_UART5CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_UART5CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_UART5CLKSOURCE_LSE => &.{&LSEOSC},
                    };
                }
            }
            // ======= NODE UART5output ======
            if (check_ref(@TypeOf(UART5EnableValue), UART5EnableValue, .true, .@"=")) {
                if (check_MCU("UART5_Exist")) {
                    UART5output.nodetype = .output;
                    UART5output.parents = &.{&UART5Mult};
                }
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
            // ======= NODE I2SMult ======
            if (check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                I2SMult.nodetype = .multi;
                I2SMult.parents = switch (I2SCLockSelectionValue) {
                    .RCC_I2SCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2SCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_I2SCLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2SCLKSOURCE_EXT => &.{&I2S_CKIN},
                };
            }
            // ======= NODE I2Soutput ======
            if (check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                I2Soutput.nodetype = .output;
                I2Soutput.parents = &.{&I2SMult};
            }
            // ======= NODE SAI1Mult ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1Mult.nodetype = .multi;
                SAI1Mult.parents = switch (SAI1CLockSelectionValue) {
                    .RCC_SAI1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_SAI1CLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_SAI1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SAI1CLKSOURCE_EXT => &.{&I2S_CKIN},
                };
            }
            // ======= NODE SAI1output ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1output.nodetype = .output;
                SAI1output.parents = &.{&SAI1Mult};
            }
            // ======= NODE QSPIMult ======
            if (check_ref(@TypeOf(QSPIEnableValue), QSPIEnableValue, .true, .@"=")) {
                QSPIMult.nodetype = .multi;
                QSPIMult.parents = switch (QSPICLockSelectionValue) {
                    .RCC_QSPICLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_QSPICLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_QSPICLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE QSPIoutput ======
            if (check_ref(@TypeOf(QSPIEnableValue), QSPIEnableValue, .true, .@"=")) {
                QSPIoutput.nodetype = .output;
                QSPIoutput.parents = &.{&QSPIMult};
            }
            // ======= NODE FDCANMult ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=")) {
                FDCANMult.nodetype = .multi;
                FDCANMult.parents = switch (FDCANCLockSelectionValue) {
                    .RCC_FDCANCLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_FDCANCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_FDCANCLKSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE FDCANoutput ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=")) {
                FDCANoutput.nodetype = .output;
                FDCANoutput.parents = &.{&FDCANMult};
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
            // ======= NODE ADC12Mult ======
            if (check_ref(@TypeOf(ADC12EnableValue), ADC12EnableValue, .true, .@"=")) {
                ADC12Mult.nodetype = .multi;
                ADC12Mult.parents = switch (ADC12CLockSelectionValue) {
                    .RCC_ADC12CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_ADC12CLKSOURCE_PLL => &.{&PLLP},
                };
            }
            // ======= NODE ADC12output ======
            if (check_ref(@TypeOf(ADC12EnableValue), ADC12EnableValue, .true, .@"=")) {
                ADC12output.nodetype = .output;
                ADC12output.parents = &.{&ADC12Mult};
            }
            // ======= NODE ADC345Mult ======
            if (check_ref(@TypeOf(ADC345EnableValue), ADC345EnableValue, .true, .@"=")) {
                ADC345Mult.nodetype = .multi;
                ADC345Mult.parents = switch (ADC345CLockSelectionValue) {
                    .RCC_ADC345CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_ADC345CLKSOURCE_PLL => &.{&PLLP},
                };
            }
            // ======= NODE ADC345output ======
            if (check_ref(@TypeOf(ADC345EnableValue), ADC345EnableValue, .true, .@"=")) {
                ADC345output.nodetype = .output;
                ADC345output.parents = &.{&ADC345Mult};
            }
            // ======= NODE CK48Mult ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                CK48Mult.nodetype = .multi;
                CK48Mult.parents = switch (CK48CLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLL => &.{&PLLQ},
                    .RCC_USBCLKSOURCE_HSI48 => &.{&HSI48RC},
                };
            }
            // ======= NODE CK48output ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                CK48output.nodetype = .output;
                CK48output.parents = &.{&CK48Mult};
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
            // ======= NODE I2S_CKIN ======
            if (check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"=")) {
                I2S_CKIN.nodetype = .source;
                I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;
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

            // ======= NODE HRTIM1CLKoutput ======
            if (check_ref(@TypeOf(HRTIM1EnableValue), HRTIM1EnableValue, .true, .@"=")) {
                HRTIM1CLKoutput.nodetype = .output;
                HRTIM1CLKoutput.parents = &.{&TimPrescOut2};
            }
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
            if (check_ref(@TypeOf(CodegenDisableForPeriphValue), CodegenDisableForPeriphValue, .true, .@"=") or check_ref(@TypeOf(ADC12EnableValue), ADC12EnableValue, .true, .@"=") or check_ref(@TypeOf(ADC345EnableValue), ADC345EnableValue, .true, .@"=")) {
                PLLP.nodetype = .div;
                PLLP.value = try PLLPValue.get();
                PLLP.parents = &.{&PLLN};
            }
            // ======= NODE PLLPoutput ======
            if (check_ref(@TypeOf(CodegenDisableForPeriphValue), CodegenDisableForPeriphValue, .true, .@"=") or check_ref(@TypeOf(ADC12EnableValue), ADC12EnableValue, .true, .@"=") or check_ref(@TypeOf(ADC345EnableValue), ADC345EnableValue, .true, .@"=")) {
                PLLPoutput.nodetype = .output;
                PLLPoutput.parents = &.{&PLLP};
            }
            // ======= NODE PLLQ ======
            if (check_ref(@TypeOf(CodegenDisableForPeriphValue), CodegenDisableForPeriphValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(QSPIEnableValue), QSPIEnableValue, .true, .@"=")) {
                PLLQ.nodetype = .div;
                PLLQ.value = try PLLQValue.get();
                PLLQ.parents = &.{&PLLN};
            }
            // ======= NODE PLLQoutput ======
            if (check_ref(@TypeOf(CodegenDisableForPeriphValue), CodegenDisableForPeriphValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(QSPIEnableValue), QSPIEnableValue, .true, .@"=")) {
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

            //======= CRSFreq_Value ========
            const CRSFreq_ValueValue = CRSCLKoutput.get_as_ref();
            ignore_value(CRSFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">"))) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 1.7e8,
                };
            }

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

            IWDGOutput.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);

            //======= UART4Freq_Value ========
            const UART4Freq_ValueValue = UART4output.get_as_ref();
            ignore_value(UART4Freq_ValueValue);

            //======= UART5Freq_Value ========
            const UART5Freq_ValueValue = UART5output.get_as_ref();
            ignore_value(UART5Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= I2SFreq_Value ========
            const I2SFreq_ValueValue = I2Soutput.get_as_ref();
            ignore_value(I2SFreq_ValueValue);

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);

            //======= QSPIFreq_Value ========
            const QSPIFreq_ValueValue = QSPIoutput.get_as_ref();
            ignore_value(QSPIFreq_ValueValue);

            //======= FDCANFreq_Value ========
            const FDCANFreq_ValueValue = FDCANoutput.get_as_ref();
            ignore_value(FDCANFreq_ValueValue);

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);

            //======= ADC12Freq_Value ========
            const ADC12Freq_ValueValue = ADC12output.get_as_ref();
            ignore_value(ADC12Freq_ValueValue);

            ADC12output.limit = .{
                .min = 1.4e5,
                .max = 1.7e8,
            };

            //======= ADC345Freq_Value ========
            const ADC345Freq_ValueValue = ADC345output.get_as_ref();
            ignore_value(ADC345Freq_ValueValue);

            ADC345output.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = CK48output.get_as_ref();
            ignore_value(USBFreq_ValueValue);

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);

            //======= I2C4Freq_Value ========
            const I2C4Freq_ValueValue = I2C4output.get_as_ref();
            ignore_value(I2C4Freq_ValueValue);

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= LSCOPinFreq_Value ========
            const LSCOPinFreq_ValueValue = LSCOOutput.get_as_ref();
            ignore_value(LSCOPinFreq_ValueValue);

            //======= HRTIM1Freq_Value ========
            const HRTIM1Freq_ValueValue = HRTIM1CLKoutput.get_as_ref();
            ignore_value(HRTIM1Freq_ValueValue);
            const max_HRTIM1CLKoutput = 170000000;
            const min_HRTIM1CLKoutput = 100000000;

            HRTIM1CLKoutput.limit = .{
                .min = min_HRTIM1CLKoutput,
                .max = max_HRTIM1CLKoutput,
                .min_expr = "100000000",
                .max_expr = "170000000",
            };

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            PWRCLKoutput.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            HCLKOutput.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            CortexSysOutput.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            FCLKCortexOutput.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);

            APB1Output.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            TimPrescOut1.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            TimPrescOut2.limit = .{
                .min = null,
                .max = 1.7e8,
            };

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (((config.flags.USE_ADC1 or config.flags.USE_ADC2) and ADC12SourcePllp) or ((config.flags.USE_ADC3 or config.flags.USE_ADC4 or config.flags.USE_ADC5) and ADC345SourcePllp)) {
                PLLPoutput.limit = .{
                    .min = 2.0645e6,
                    .max = 1.7e8,
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if (((CK48SourcePLLCLK and config.flags.RNGUsed_ForRCC) or (I2SSourcePll and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or (SAI1SourcePll and (config.flags.SAIBUsed_ForRCC or config.flags.SAIAUsed_ForRCC)))) {
                PLLQoutput.limit = .{
                    .min = 8e6,
                    .max = 1.7e8,
                };
            }

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
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") and SysSourcePLL) or (MCOSourcePLL and config.flags.MCOConfig)) {
                PLLCLK.limit = .{
                    .min = 8e6,
                    .max = 1.7e8,
                };
            }

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"<")) or check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"="))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1_BOOST => scale1boost = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@"<")) or check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@"=")) and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1_BOOST => scale1boost = true,
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
                                    "((HCLKFreq_Value < 150000000)|HCLKFreq_Value = 150000000) & (HCLKFreq_Value > 26000000)",
                                    "",
                                    @tagName(val),
                                    "PWR_REGULATOR_VOLTAGE_SCALE1",
                                    "PWR_REGULATOR_VOLTAGE_SCALE1_BOOST",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 170000000, .@"<")) or check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 170000000, .@"=")) and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@">"))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE1_BOOST) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PWR_Regulator_Voltage_Scale",
                                "((HCLKFreq_Value < 170000000)|HCLKFreq_Value = 170000000) & (HCLKFreq_Value > 150000000)",
                                "",
                                "PWR_REGULATOR_VOLTAGE_SCALE1_BOOST",
                                val,
                            });
                        }
                    }
                    scale1boost = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1_BOOST;
                }
                const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                if (user_val) |val| {
                    switch (val) {
                        .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE1_BOOST => scale1boost = true,
                    }
                }
                break :blk user_val orelse {
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                };
            };

            const FLatencyValue: FLatencyList = blk: {
                if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 30000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 30000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 12000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 12000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale1boost and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 34000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 34000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale1boost and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 68000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 68000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"=")))) or (scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 26000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale1boost and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 102000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 102000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale1boost and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 136000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 136000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_4;
                } else if ((scale1boost and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 170000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 170000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_4;
                }
                break :blk .FLASH_LATENCY_0;
            };
            out.HSIRC = try HSIRC.get_output();
            out.HSI48RC = try HSI48RC.get_output();
            out.CRSCLKoutput = try CRSCLKoutput.get_output();
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
            out.LCDOutput = try LCDOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3output = try USART3output.get_output();
            out.UART4Mult = try UART4Mult.get_output();
            out.UART4output = try UART4output.get_output();
            out.UART5Mult = try UART5Mult.get_output();
            out.UART5output = try UART5output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2output = try USART2output.get_output();
            out.I2SMult = try I2SMult.get_output();
            out.I2Soutput = try I2Soutput.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.SAI1output = try SAI1output.get_output();
            out.QSPIMult = try QSPIMult.get_output();
            out.QSPIoutput = try QSPIoutput.get_output();
            out.FDCANMult = try FDCANMult.get_output();
            out.FDCANoutput = try FDCANoutput.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.ADC12Mult = try ADC12Mult.get_output();
            out.ADC12output = try ADC12output.get_output();
            out.ADC345Mult = try ADC345Mult.get_output();
            out.ADC345output = try ADC345output.get_output();
            out.CK48Mult = try CK48Mult.get_output();
            out.CK48output = try CK48output.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2output = try I2C2output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3output = try I2C3output.get_output();
            out.I2C4Mult = try I2C4Mult.get_output();
            out.I2C4output = try I2C4output.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.HRTIM1CLKoutput = try HRTIM1CLKoutput.get_output();
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
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSI48_VALUEValue);
            ignore_value(CRSFreq_ValueValue);
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
            ignore_value(LCDFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.USART1CLockSelection = USART1CLockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.USART3CLockSelection = USART3CLockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.UART4CLockSelection = UART4CLockSelectionValue;
            ignore_value(UART4Freq_ValueValue);
            ref_out.UART5CLockSelection = UART5CLockSelectionValue;
            ignore_value(UART5Freq_ValueValue);
            ref_out.USART2CLockSelection = USART2CLockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.I2SCLockSelection = I2SCLockSelectionValue;
            ignore_value(I2SFreq_ValueValue);
            ref_out.SAI1CLockSelection = SAI1CLockSelectionValue;
            ignore_value(SAI1Freq_ValueValue);
            ref_out.QSPICLockSelection = QSPICLockSelectionValue;
            ignore_value(QSPIFreq_ValueValue);
            ref_out.FDCANCLockSelection = FDCANCLockSelectionValue;
            ignore_value(FDCANFreq_ValueValue);
            ref_out.LPUART1CLockSelection = LPUART1CLockSelectionValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.ADC12CLockSelection = ADC12CLockSelectionValue;
            ignore_value(ADC12Freq_ValueValue);
            ref_out.ADC345CLockSelection = ADC345CLockSelectionValue;
            ignore_value(ADC345Freq_ValueValue);
            ref_out.CK48CLockSelection = CK48CLockSelectionValue;
            ignore_value(USBFreq_ValueValue);
            ignore_value(RNGFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C2CLockSelection = I2C2CLockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.I2C3CLockSelection = I2C3CLockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ref_out.I2C4CLockSelection = I2C4CLockSelectionValue;
            ignore_value(I2C4Freq_ValueValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.LSCOSource1 = LSCOSource1Value;
            ignore_value(LSCOPinFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(HRTIM1Freq_ValueValue);
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
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLRCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.Prescaler = PrescalerValue;
            ref_out.Source = SourceValue;
            ref_out.Polarity = PolarityValue;
            ref_out.ReloadValueType = ReloadValueTypeValue;
            ref_out.ReloadValue = ReloadValueValue;
            ref_out.LSEFsync = LSEFsyncValue;
            ref_out.GPIOFsync = GPIOFsyncValue;
            ref_out.USBFsync = USBFsyncValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.ErrorLimitValue = ErrorLimitValueValue;
            ref_out.HSI48CalibrationValue = HSI48CalibrationValueValue;
            ref_out.flags.EnableCRS = EnableCRSValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.UART4Enable = UART4EnableValue == .true;
            ref_out.flags.UART5Enable = UART5EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.I2SEnable = I2SEnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.QSPIEnable = QSPIEnableValue == .true;
            ref_out.flags.FDCANEnable = FDCANEnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.ADC12Enable = ADC12EnableValue == .true;
            ref_out.flags.ADC345Enable = ADC345EnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.I2C4Enable = I2C4EnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.HRTIM1Enable = HRTIM1EnableValue == .true;
            ref_out.flags.CodegenDisableForPeriph = CodegenDisableForPeriphValue == .true;
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
