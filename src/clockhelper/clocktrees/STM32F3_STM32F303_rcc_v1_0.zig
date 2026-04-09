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
        pub const RCC_MCOSEL = enum(u3) {
            LSI = 2,
            LSE = 3,
            SYS = 4,
            HSI = 5,
            HSE = 6,
            PLL = 7,
        };
        pub const RCC_SW = enum(u2) {
            HSI = 0,
            HSE = 1,
            PLL1_P = 2,
        };
        pub const RCC_ICSW = enum(u1) {
            HSI = 0,
            SYS = 1,
        };
        pub const RCC_ISSRC = enum(u1) {
            SYS = 0,
            CKIN = 1,
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
        pub const RCC_TIMSW = enum(u1) {
            PCLK2_TIM = 0,
            PLL1_P = 1,
        };
        pub const RCC_PLLSRC = enum(u1) {
            HSI_Div2 = 0,
            HSE_Div_PREDIV = 1,
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
        pub const RCC_USART1SW = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            LSE = 2,
            HSI = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumHigh = 1,
            MediumLow = 2,
            High = 3,
        };
        pub const RCC_ADCPRES = enum(u5) {
            Div1 = 16,
            Div2 = 17,
            Div4 = 18,
            Div6 = 19,
            Div8 = 20,
            Div10 = 21,
            Div12 = 22,
            Div16 = 23,
            Div32 = 24,
            Div64 = 25,
            Div128 = 26,
            Div256 = 27,
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
        pub const RCC_USBPRE = enum(u1) {
            Div1_5 = 0,
            Div1 = 1,
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
            WS2 = 2,
        };

        pub const RCC_PLLsource_Clock_Source_FROM_HSEList = enum {
            RCC_HSE_PREDIV_DIV1,
            RCC_HSE_PREDIV_DIV2,
            RCC_HSE_PREDIV_DIV3,
            RCC_HSE_PREDIV_DIV4,
            RCC_HSE_PREDIV_DIV5,
            RCC_HSE_PREDIV_DIV6,
            RCC_HSE_PREDIV_DIV7,
            RCC_HSE_PREDIV_DIV8,
            RCC_HSE_PREDIV_DIV9,
            RCC_HSE_PREDIV_DIV10,
            RCC_HSE_PREDIV_DIV11,
            RCC_HSE_PREDIV_DIV12,
            RCC_HSE_PREDIV_DIV13,
            RCC_HSE_PREDIV_DIV14,
            RCC_HSE_PREDIV_DIV15,
            RCC_HSE_PREDIV_DIV16,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HSE_PREDIV_DIV1 => 1,
                    .RCC_HSE_PREDIV_DIV2 => 2,
                    .RCC_HSE_PREDIV_DIV3 => 3,
                    .RCC_HSE_PREDIV_DIV4 => 4,
                    .RCC_HSE_PREDIV_DIV5 => 5,
                    .RCC_HSE_PREDIV_DIV6 => 6,
                    .RCC_HSE_PREDIV_DIV7 => 7,
                    .RCC_HSE_PREDIV_DIV8 => 8,
                    .RCC_HSE_PREDIV_DIV9 => 9,
                    .RCC_HSE_PREDIV_DIV10 => 10,
                    .RCC_HSE_PREDIV_DIV11 => 11,
                    .RCC_HSE_PREDIV_DIV12 => 12,
                    .RCC_HSE_PREDIV_DIV13 => 13,
                    .RCC_HSE_PREDIV_DIV14 => 14,
                    .RCC_HSE_PREDIV_DIV15 => 15,
                    .RCC_HSE_PREDIV_DIV16 => 16,
                };
            }
        };

        pub const PRESCALERUSBList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_PLL_DIV1_5,

            pub fn to_enum(self: @This()) anyerror!RCC_USBPRE {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL => .Div1,
                    .RCC_USBCLKSOURCE_PLL_DIV1_5 => .Div1_5,
                };
            }
            pub fn from_enum(item: RCC_USBPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_USBCLKSOURCE_PLL,
                    .Div1_5 => .RCC_USBCLKSOURCE_PLL_DIV1_5,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL => 1,
                    .RCC_USBCLKSOURCE_PLL_DIV1_5 => 1.5,
                };
            }
        };

        pub const SYSCLKSourceVirtualList = enum {
            RCC_SYSCLKSOURCE_PLLCLK,
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_P,
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_SYSCLKSOURCE_PLLCLK,
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
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
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_PLLCLK_DIV2,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_LSE,
            MCOMultDivisor,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                    .RCC_MCO1SOURCE_PLLCLK_DIV2 => .PLL,
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
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                    .PLL => .RCC_MCO1SOURCE_PLLCLK_DIV2,
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
                    .RCC_MCODIV_16 => .Div16,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_32 => .Div32,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_64 => .Div64,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div128 => .RCC_MCODIV_128,
                    .Div16 => .RCC_MCODIV_16,
                    .Div8 => .RCC_MCODIV_8,
                    .Div32 => .RCC_MCODIV_32,
                    .Div4 => .RCC_MCODIV_4,
                    .Div1 => .RCC_MCODIV_1,
                    .Div2 => .RCC_MCODIV_2,
                    .Div64 => .RCC_MCODIV_64,
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

        pub const ADC12PRESList = enum {
            RCC_ADC12PLLCLK_DIV1,
            RCC_ADC12PLLCLK_DIV2,
            RCC_ADC12PLLCLK_DIV4,
            RCC_ADC12PLLCLK_DIV6,
            RCC_ADC12PLLCLK_DIV8,
            RCC_ADC12PLLCLK_DIV10,
            RCC_ADC12PLLCLK_DIV12,
            RCC_ADC12PLLCLK_DIV16,
            RCC_ADC12PLLCLK_DIV32,
            RCC_ADC12PLLCLK_DIV64,
            RCC_ADC12PLLCLK_DIV128,
            RCC_ADC12PLLCLK_DIV256,
            RCC_ADC1PLLCLK_DIV1,
            RCC_ADC1PLLCLK_DIV2,
            RCC_ADC1PLLCLK_DIV4,
            RCC_ADC1PLLCLK_DIV6,
            RCC_ADC1PLLCLK_DIV8,
            RCC_ADC1PLLCLK_DIV10,
            RCC_ADC1PLLCLK_DIV12,
            RCC_ADC1PLLCLK_DIV16,
            RCC_ADC1PLLCLK_DIV32,
            RCC_ADC1PLLCLK_DIV64,
            RCC_ADC1PLLCLK_DIV128,
            RCC_ADC1PLLCLK_DIV256,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCPRES {
                return switch (self) {
                    .RCC_ADC12PLLCLK_DIV2 => .Div2,
                    .RCC_ADC1PLLCLK_DIV12 => .Div12,
                    .RCC_ADC12PLLCLK_DIV8 => .Div8,
                    .RCC_ADC12PLLCLK_DIV16 => .Div16,
                    .RCC_ADC12PLLCLK_DIV12 => .Div12,
                    .RCC_ADC1PLLCLK_DIV4 => .Div4,
                    .RCC_ADC12PLLCLK_DIV4 => .Div4,
                    .RCC_ADC12PLLCLK_DIV1 => .Div1,
                    .RCC_ADC12PLLCLK_DIV6 => .Div6,
                    .RCC_ADC1PLLCLK_DIV64 => .Div64,
                    .RCC_ADC12PLLCLK_DIV256 => .Div256,
                    .RCC_ADC12PLLCLK_DIV32 => .Div32,
                    .RCC_ADC1PLLCLK_DIV32 => .Div32,
                    .RCC_ADC12PLLCLK_DIV10 => .Div10,
                    .RCC_ADC12PLLCLK_DIV64 => .Div64,
                    .RCC_ADC1PLLCLK_DIV2 => .Div2,
                    .RCC_ADC1PLLCLK_DIV256 => .Div256,
                    .RCC_ADC1PLLCLK_DIV10 => .Div10,
                    .RCC_ADC1PLLCLK_DIV8 => .Div8,
                    .RCC_ADC12PLLCLK_DIV128 => .Div128,
                    .RCC_ADC1PLLCLK_DIV1 => .Div1,
                    .RCC_ADC1PLLCLK_DIV16 => .Div16,
                    .RCC_ADC1PLLCLK_DIV128 => .Div128,
                    .RCC_ADC1PLLCLK_DIV6 => .Div6,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "ADC12PRES", @tagName(self), "RCC_ADCPRES" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_ADCPRES) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_ADC12PLLCLK_DIV2,
                    .Div12 => .RCC_ADC1PLLCLK_DIV12,
                    .Div8 => .RCC_ADC12PLLCLK_DIV8,
                    .Div16 => .RCC_ADC12PLLCLK_DIV16,
                    .Div12 => .RCC_ADC12PLLCLK_DIV12,
                    .Div4 => .RCC_ADC1PLLCLK_DIV4,
                    .Div4 => .RCC_ADC12PLLCLK_DIV4,
                    .Div1 => .RCC_ADC12PLLCLK_DIV1,
                    .Div6 => .RCC_ADC12PLLCLK_DIV6,
                    .Div64 => .RCC_ADC1PLLCLK_DIV64,
                    .Div256 => .RCC_ADC12PLLCLK_DIV256,
                    .Div32 => .RCC_ADC12PLLCLK_DIV32,
                    .Div32 => .RCC_ADC1PLLCLK_DIV32,
                    .Div10 => .RCC_ADC12PLLCLK_DIV10,
                    .Div64 => .RCC_ADC12PLLCLK_DIV64,
                    .Div2 => .RCC_ADC1PLLCLK_DIV2,
                    .Div256 => .RCC_ADC1PLLCLK_DIV256,
                    .Div10 => .RCC_ADC1PLLCLK_DIV10,
                    .Div8 => .RCC_ADC1PLLCLK_DIV8,
                    .Div128 => .RCC_ADC12PLLCLK_DIV128,
                    .Div1 => .RCC_ADC1PLLCLK_DIV1,
                    .Div16 => .RCC_ADC1PLLCLK_DIV16,
                    .Div128 => .RCC_ADC1PLLCLK_DIV128,
                    .Div6 => .RCC_ADC1PLLCLK_DIV6,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_ADC12PLLCLK_DIV1 => 1,
                    .RCC_ADC12PLLCLK_DIV2 => 2,
                    .RCC_ADC12PLLCLK_DIV4 => 4,
                    .RCC_ADC12PLLCLK_DIV6 => 6,
                    .RCC_ADC12PLLCLK_DIV8 => 8,
                    .RCC_ADC12PLLCLK_DIV10 => 10,
                    .RCC_ADC12PLLCLK_DIV12 => 12,
                    .RCC_ADC12PLLCLK_DIV16 => 16,
                    .RCC_ADC12PLLCLK_DIV32 => 32,
                    .RCC_ADC12PLLCLK_DIV64 => 64,
                    .RCC_ADC12PLLCLK_DIV128 => 128,
                    .RCC_ADC12PLLCLK_DIV256 => 256,
                    .RCC_ADC1PLLCLK_DIV1 => 1,
                    .RCC_ADC1PLLCLK_DIV2 => 2,
                    .RCC_ADC1PLLCLK_DIV4 => 4,
                    .RCC_ADC1PLLCLK_DIV6 => 6,
                    .RCC_ADC1PLLCLK_DIV8 => 8,
                    .RCC_ADC1PLLCLK_DIV10 => 10,
                    .RCC_ADC1PLLCLK_DIV12 => 12,
                    .RCC_ADC1PLLCLK_DIV16 => 16,
                    .RCC_ADC1PLLCLK_DIV32 => 32,
                    .RCC_ADC1PLLCLK_DIV64 => 64,
                    .RCC_ADC1PLLCLK_DIV128 => 128,
                    .RCC_ADC1PLLCLK_DIV256 => 256,
                };
            }
        };

        pub const ADC34PRESList = enum {
            RCC_ADC34PLLCLK_DIV1,
            RCC_ADC34PLLCLK_DIV2,
            RCC_ADC34PLLCLK_DIV4,
            RCC_ADC34PLLCLK_DIV6,
            RCC_ADC34PLLCLK_DIV8,
            RCC_ADC34PLLCLK_DIV10,
            RCC_ADC34PLLCLK_DIV12,
            RCC_ADC34PLLCLK_DIV16,
            RCC_ADC34PLLCLK_DIV32,
            RCC_ADC34PLLCLK_DIV64,
            RCC_ADC34PLLCLK_DIV128,
            RCC_ADC34PLLCLK_DIV256,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCPRES {
                return switch (self) {
                    .RCC_ADC34PLLCLK_DIV4 => .Div4,
                    .RCC_ADC34PLLCLK_DIV12 => .Div12,
                    .RCC_ADC34PLLCLK_DIV8 => .Div8,
                    .RCC_ADC34PLLCLK_DIV1 => .Div1,
                    .RCC_ADC34PLLCLK_DIV6 => .Div6,
                    .RCC_ADC34PLLCLK_DIV16 => .Div16,
                    .RCC_ADC34PLLCLK_DIV32 => .Div32,
                    .RCC_ADC34PLLCLK_DIV128 => .Div128,
                    .RCC_ADC34PLLCLK_DIV256 => .Div256,
                    .RCC_ADC34PLLCLK_DIV64 => .Div64,
                    .RCC_ADC34PLLCLK_DIV10 => .Div10,
                    .RCC_ADC34PLLCLK_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_ADCPRES) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_ADC34PLLCLK_DIV4,
                    .Div12 => .RCC_ADC34PLLCLK_DIV12,
                    .Div8 => .RCC_ADC34PLLCLK_DIV8,
                    .Div1 => .RCC_ADC34PLLCLK_DIV1,
                    .Div6 => .RCC_ADC34PLLCLK_DIV6,
                    .Div16 => .RCC_ADC34PLLCLK_DIV16,
                    .Div32 => .RCC_ADC34PLLCLK_DIV32,
                    .Div128 => .RCC_ADC34PLLCLK_DIV128,
                    .Div256 => .RCC_ADC34PLLCLK_DIV256,
                    .Div64 => .RCC_ADC34PLLCLK_DIV64,
                    .Div10 => .RCC_ADC34PLLCLK_DIV10,
                    .Div2 => .RCC_ADC34PLLCLK_DIV2,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_ADC34PLLCLK_DIV1 => 1,
                    .RCC_ADC34PLLCLK_DIV2 => 2,
                    .RCC_ADC34PLLCLK_DIV4 => 4,
                    .RCC_ADC34PLLCLK_DIV6 => 6,
                    .RCC_ADC34PLLCLK_DIV8 => 8,
                    .RCC_ADC34PLLCLK_DIV10 => 10,
                    .RCC_ADC34PLLCLK_DIV12 => 12,
                    .RCC_ADC34PLLCLK_DIV16 => 16,
                    .RCC_ADC34PLLCLK_DIV32 => 32,
                    .RCC_ADC34PLLCLK_DIV64 => 64,
                    .RCC_ADC34PLLCLK_DIV128 => 128,
                    .RCC_ADC34PLLCLK_DIV256 => 256,
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

        pub const TIM1SelectionList = enum {
            RCC_TIM1CLK_HCLK,
            RCC_TIM1CLK_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMSW {
                return switch (self) {
                    .RCC_TIM1CLK_PLLCLK => .PLL1_P,
                    .RCC_TIM1CLK_HCLK => .PCLK2_TIM,
                };
            }
            pub fn from_enum(item: RCC_TIMSW) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_TIM1CLK_PLLCLK,
                    .PCLK2_TIM => .RCC_TIM1CLK_HCLK,
                };
            }
        };

        pub const TIM8SelectionList = enum {
            RCC_TIM8CLK_HCLK,
            RCC_TIM8CLK_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMSW {
                return switch (self) {
                    .RCC_TIM8CLK_PLLCLK => .PLL1_P,
                    .RCC_TIM8CLK_HCLK => .PCLK2_TIM,
                };
            }
            pub fn from_enum(item: RCC_TIMSW) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_TIM8CLK_PLLCLK,
                    .PCLK2_TIM => .RCC_TIM8CLK_HCLK,
                };
            }
        };

        pub const TIM15SelectionList = enum {
            RCC_TIM15CLK_HCLK,
            RCC_TIM15CLK_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMSW {
                return switch (self) {
                    .RCC_TIM15CLK_PLLCLK => .PLL1_P,
                    .RCC_TIM15CLK_HCLK => .PCLK2_TIM,
                };
            }
            pub fn from_enum(item: RCC_TIMSW) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_TIM15CLK_PLLCLK,
                    .PCLK2_TIM => .RCC_TIM15CLK_HCLK,
                };
            }
        };

        pub const TIM16SelectionList = enum {
            RCC_TIM16CLK_HCLK,
            RCC_TIM16CLK_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMSW {
                return switch (self) {
                    .RCC_TIM16CLK_PLLCLK => .PLL1_P,
                    .RCC_TIM16CLK_HCLK => .PCLK2_TIM,
                };
            }
            pub fn from_enum(item: RCC_TIMSW) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_TIM16CLK_PLLCLK,
                    .PCLK2_TIM => .RCC_TIM16CLK_HCLK,
                };
            }
        };

        pub const TIM17SelectionList = enum {
            RCC_TIM17CLK_HCLK,
            RCC_TIM17CLK_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMSW {
                return switch (self) {
                    .RCC_TIM17CLK_HCLK => .PCLK2_TIM,
                    .RCC_TIM17CLK_PLLCLK => .PLL1_P,
                };
            }
            pub fn from_enum(item: RCC_TIMSW) anyerror!@This() {
                return switch (item) {
                    .PCLK2_TIM => .RCC_TIM17CLK_HCLK,
                    .PLL1_P => .RCC_TIM17CLK_PLLCLK,
                };
            }
        };

        pub const HRTIMSelectionList = enum {
            RCC_HRTIM1CLK_HCLK,
            RCC_HRTIM1CLK_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMSW {
                return switch (self) {
                    .RCC_HRTIM1CLK_PLLCLK => .PLL1_P,
                    .RCC_HRTIM1CLK_HCLK => .PCLK2_TIM,
                };
            }
            pub fn from_enum(item: RCC_TIMSW) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_HRTIM1CLK_PLLCLK,
                    .PCLK2_TIM => .RCC_HRTIM1CLK_HCLK,
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

        pub const I2c2ClockSelectionList = enum {
            RCC_I2C2CLKSOURCE_SYSCLK,
            RCC_I2C2CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_ICSW {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                    .RCC_I2C2CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ICSW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C2CLKSOURCE_HSI,
                    .SYS => .RCC_I2C2CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const I2c3ClockSelectionList = enum {
            RCC_I2C3CLKSOURCE_SYSCLK,
            RCC_I2C3CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_ICSW {
                return switch (self) {
                    .RCC_I2C3CLKSOURCE_HSI => .HSI,
                    .RCC_I2C3CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ICSW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C3CLKSOURCE_HSI,
                    .SYS => .RCC_I2C3CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const I2SClockSourceList = enum {
            RCC_I2SCLKSOURCE_SYSCLK,
            RCC_I2SCLKSOURCE_EXT,

            pub fn to_enum(self: @This()) anyerror!RCC_ISSRC {
                return switch (self) {
                    .RCC_I2SCLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2SCLKSOURCE_EXT => .CKIN,
                };
            }
            pub fn from_enum(item: RCC_ISSRC) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_I2SCLKSOURCE_SYSCLK,
                    .CKIN => .RCC_I2SCLKSOURCE_EXT,
                };
            }
        };

        pub const Usart1ClockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK1,
            RCC_USART1CLKSOURCE_SYSCLK,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,
            RCC_USART1CLKSOURCE_PCLK2,

            pub fn to_enum(self: @This()) anyerror!RCC_USART1SW {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_PCLK2 => .PCLK2,
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                    .RCC_USART1CLKSOURCE_SYSCLK => .SYS,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "Usart1ClockSelection", @tagName(self), "RCC_USART1SW" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_USART1SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .PCLK2 => .RCC_USART1CLKSOURCE_PCLK2,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
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
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
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
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .SYS => .RCC_USART3CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
                };
            }
        };

        pub const Uart4ClockSelectionList = enum {
            RCC_UART4CLKSOURCE_PCLK1,
            RCC_UART4CLKSOURCE_SYSCLK,
            RCC_UART4CLKSOURCE_HSI,
            RCC_UART4CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSW {
                return switch (self) {
                    .RCC_UART4CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_UART4CLKSOURCE_HSI => .HSI,
                    .RCC_UART4CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART4CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_UART4CLKSOURCE_PCLK1,
                    .HSI => .RCC_UART4CLKSOURCE_HSI,
                    .SYS => .RCC_UART4CLKSOURCE_SYSCLK,
                    .LSE => .RCC_UART4CLKSOURCE_LSE,
                };
            }
        };

        pub const Uart5ClockSelectionList = enum {
            RCC_UART5CLKSOURCE_PCLK1,
            RCC_UART5CLKSOURCE_SYSCLK,
            RCC_UART5CLKSOURCE_HSI,
            RCC_UART5CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSW {
                return switch (self) {
                    .RCC_UART5CLKSOURCE_LSE => .LSE,
                    .RCC_UART5CLKSOURCE_HSI => .HSI,
                    .RCC_UART5CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART5CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_UART5CLKSOURCE_LSE,
                    .HSI => .RCC_UART5CLKSOURCE_HSI,
                    .SYS => .RCC_UART5CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_UART5CLKSOURCE_PCLK1,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSE => .HSE_Div_PREDIV,
                    .RCC_PLLSOURCE_HSI => .HSI_Div2,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE_Div_PREDIV => .RCC_PLLSOURCE_HSE,
                    .HSI_Div2 => .RCC_PLLSOURCE_HSI,
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
                    .RCC_PLL_MUL14 => .Mul14,
                    .RCC_PLL_MUL12 => .Mul12,
                    .RCC_PLL_MUL5 => .Mul5,
                    .RCC_PLL_MUL13 => .Mul13,
                    .RCC_PLL_MUL7 => .Mul7,
                    .RCC_PLL_MUL3 => .Mul3,
                    .RCC_PLL_MUL9 => .Mul9,
                    .RCC_PLL_MUL16 => .Mul16,
                    .RCC_PLL_MUL10 => .Mul10,
                    .RCC_PLL_MUL2 => .Mul2,
                    .RCC_PLL_MUL8 => .Mul8,
                    .RCC_PLL_MUL4 => .Mul4,
                    .RCC_PLL_MUL6 => .Mul6,
                    .RCC_PLL_MUL15 => .Mul15,
                    .RCC_PLL_MUL11 => .Mul11,
                };
            }
            pub fn from_enum(item: RCC_PLLMUL) anyerror!@This() {
                return switch (item) {
                    .Mul14 => .RCC_PLL_MUL14,
                    .Mul12 => .RCC_PLL_MUL12,
                    .Mul5 => .RCC_PLL_MUL5,
                    .Mul13 => .RCC_PLL_MUL13,
                    .Mul7 => .RCC_PLL_MUL7,
                    .Mul3 => .RCC_PLL_MUL3,
                    .Mul9 => .RCC_PLL_MUL9,
                    .Mul16 => .RCC_PLL_MUL16,
                    .Mul10 => .RCC_PLL_MUL10,
                    .Mul2 => .RCC_PLL_MUL2,
                    .Mul8 => .RCC_PLL_MUL8,
                    .Mul4 => .RCC_PLL_MUL4,
                    .Mul6 => .RCC_PLL_MUL6,
                    .Mul15 => .RCC_PLL_MUL15,
                    .Mul11 => .RCC_PLL_MUL11,
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

        pub const PREFETCH_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const FLatencyList = enum {
            FLASH_LATENCY_0,
            FLASH_LATENCY_1,
            FLASH_LATENCY_2,

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_2 => .WS2,
                    .FLASH_LATENCY_0 => .WS0,
                    .FLASH_LATENCY_1 => .WS1,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS2 => .FLASH_LATENCY_2,
                    .WS0 => .FLASH_LATENCY_0,
                    .WS1 => .FLASH_LATENCY_1,
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

        pub const EnableLSEList = enum {
            true,
            false,
        };

        pub const EnableHSEList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
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

        pub const ADC1EnableList = enum {
            true,
            false,
        };

        pub const ADC2EnableList = enum {
            true,
            false,
        };

        pub const ADC3EnableList = enum {
            true,
            false,
        };

        pub const ADC4EnableList = enum {
            true,
            false,
        };

        pub const Tim1EnableList = enum {
            true,
            false,
        };

        pub const Tim8EnableList = enum {
            true,
            false,
        };

        pub const Tim15EnableList = enum {
            true,
            false,
        };

        pub const Tim16EnableList = enum {
            true,
            false,
        };

        pub const Tim17EnableList = enum {
            true,
            false,
        };

        pub const HRTIMEnableList = enum {
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

        pub const ExtClockEnableList = enum {
            true,
            false,
        };

        pub const I2SEnableList = enum {
            false,
            true,
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

        pub const EnableHSIRTCDevisorList = enum {
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

        pub const FLITFCLKFEnableList = enum {
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
            AudioClockConfig: bool = false,
            HRTIM1Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            ADC4UsedAsynchronousCLK_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            MCOUsed_ForRCC: bool = false,
            FLITFUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            AudioClockConfig: bool = false,
            HRTIM1Used_ForRCC: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            ADC4UsedAsynchronousCLK_ForRCC: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            MCOUsed_ForRCC: bool = false,
            FLITFUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            PREFETCH_ENABLE: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            ADC1Enable: bool = false, //Reference flag
            ADC2Enable: bool = false, //Reference flag
            ADC3Enable: bool = false, //Reference flag
            ADC4Enable: bool = false, //Reference flag
            Tim1Enable: bool = false, //Reference flag
            Tim8Enable: bool = false, //Reference flag
            Tim15Enable: bool = false, //Reference flag
            Tim16Enable: bool = false, //Reference flag
            Tim17Enable: bool = false, //Reference flag
            HRTIMEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            I2SEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            UART4Enable: bool = false, //Reference flag
            UART5Enable: bool = false, //Reference flag
            EnableHSIRTCDevisor: bool = false, //Reference flag
            EnableMCOMultDivisor: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            FLITFCLKFEnable: bool = false, //Reference flag
            HSEUsed: bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            I2SEnable: ?I2SEnableList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            LSE_VALUE: ?f32 = null,
            HSE_VALUE: ?f32 = null,
            RCC_PLLsource_Clock_Source_FROM_HSE: ?RCC_PLLsource_Clock_Source_FROM_HSEList = null,
            PRESCALERUSB: ?PRESCALERUSBList = null,
            SYSCLKSourceVirtual: ?SYSCLKSourceVirtualList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: ?RCC_MCOMult_Clock_Source_FROM_PLLMULList = null,
            RCC_MCOSource: ?RCC_MCOSourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            ADC12PRES: ?ADC12PRESList = null,
            ADC34PRES: ?ADC34PRESList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            TIM1Selection: ?TIM1SelectionList = null,
            TIM8Selection: ?TIM8SelectionList = null,
            TIM15Selection: ?TIM15SelectionList = null,
            TIM16Selection: ?TIM16SelectionList = null,
            TIM17Selection: ?TIM17SelectionList = null,
            HRTIMSelection: ?HRTIMSelectionList = null,
            I2c1ClockSelection: ?I2c1ClockSelectionList = null,
            I2c2ClockSelection: ?I2c2ClockSelectionList = null,
            I2c3ClockSelection: ?I2c3ClockSelectionList = null,
            I2SClockSource: ?I2SClockSourceList = null,
            Usart1ClockSelection: ?Usart1ClockSelectionList = null,
            Usart2ClockSelection: ?Usart2ClockSelectionList = null,
            Usart3ClockSelection: ?Usart3ClockSelectionList = null,
            Uart4ClockSelection: ?Uart4ClockSelectionList = null,
            Uart5ClockSelection: ?Uart5ClockSelectionList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLMUL: ?PLLMULList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSIRCDiv: u32,
            RCC_PLLsource_Clock_Source_FROM_HSE: RCC_PLLsource_Clock_Source_FROM_HSEList,
            PRESCALERUSB: PRESCALERUSBList,
            SYSCLKSourceVirtual: SYSCLKSourceVirtualList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: RCC_MCOMult_Clock_Source_FROM_PLLMULList,
            RCC_MCOSource: RCC_MCOSourceList,
            RCC_MCODiv: RCC_MCODivList,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: Cortex_DivList,
            ADC12PRES: ADC12PRESList,
            ADC34PRES: ADC34PRESList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB2TimCLKDivider: u32,
            TIMMUL: u32,
            TIM1Selection: TIM1SelectionList,
            TIM8Selection: TIM8SelectionList,
            TIM15Selection: TIM15SelectionList,
            TIM16Selection: TIM16SelectionList,
            TIM17Selection: TIM17SelectionList,
            HRTIMSelection: HRTIMSelectionList,
            I2c1ClockSelection: I2c1ClockSelectionList,
            I2c2ClockSelection: I2c2ClockSelectionList,
            I2c3ClockSelection: I2c3ClockSelectionList,
            I2SClockSource: I2SClockSourceList,
            Usart1ClockSelection: Usart1ClockSelectionList,
            Usart2ClockSelection: Usart2ClockSelectionList,
            Usart3ClockSelection: Usart3ClockSelectionList,
            Uart4ClockSelection: Uart4ClockSelectionList,
            Uart5ClockSelection: Uart5ClockSelectionList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLMUL: PLLMULList,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            I2SEnable: ?I2SEnableList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .I2SEnable = self.I2SEnable,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            LSE_VALUE: ?f32 = null,
            HSE_VALUE: ?f32 = null,
            RCC_PLLsource_Clock_Source_FROM_HSE: ?RCC_PLLsource_Clock_Source_FROM_HSEList = null,
            PRESCALERUSB: ?RCC_USBPRE = null,
            SYSCLKSourceVirtual: ?RCC_SW = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: ?RCC_MCOMult_Clock_Source_FROM_PLLMULList = null,
            RCC_MCOSource: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            ADC12PRES: ?RCC_ADCPRES = null,
            ADC34PRES: ?RCC_ADCPRES = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            TIM1Selection: ?RCC_TIMSW = null,
            TIM8Selection: ?RCC_TIMSW = null,
            TIM15Selection: ?RCC_TIMSW = null,
            TIM16Selection: ?RCC_TIMSW = null,
            TIM17Selection: ?RCC_TIMSW = null,
            HRTIMSelection: ?RCC_TIMSW = null,
            I2c1ClockSelection: ?RCC_ICSW = null,
            I2c2ClockSelection: ?RCC_ICSW = null,
            I2c3ClockSelection: ?RCC_ICSW = null,
            I2SClockSource: ?RCC_ISSRC = null,
            Usart1ClockSelection: ?RCC_USART1SW = null,
            Usart2ClockSelection: ?RCC_USARTSW = null,
            Usart3ClockSelection: ?RCC_USARTSW = null,
            Uart4ClockSelection: ?RCC_USARTSW = null,
            Uart5ClockSelection: ?RCC_USARTSW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLMUL: ?RCC_PLLMUL = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .LSE_VALUE = self.LSE_VALUE,
                    .HSE_VALUE = self.HSE_VALUE,
                    .RCC_PLLsource_Clock_Source_FROM_HSE = self.RCC_PLLsource_Clock_Source_FROM_HSE,
                    .PRESCALERUSB = if (self.PRESCALERUSB) |val| try PRESCALERUSBList.from_enum(val) else null,
                    .SYSCLKSourceVirtual = if (self.SYSCLKSourceVirtual) |val| try SYSCLKSourceVirtualList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .RCC_MCOMult_Clock_Source_FROM_PLLMUL = self.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
                    .RCC_MCOSource = if (self.RCC_MCOSource) |val| try RCC_MCOSourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .ADC12PRES = if (self.ADC12PRES) |val| try ADC12PRESList.from_enum(val) else null,
                    .ADC34PRES = if (self.ADC34PRES) |val| try ADC34PRESList.from_enum(val) else null,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .TIM1Selection = if (self.TIM1Selection) |val| try TIM1SelectionList.from_enum(val) else null,
                    .TIM8Selection = if (self.TIM8Selection) |val| try TIM8SelectionList.from_enum(val) else null,
                    .TIM15Selection = if (self.TIM15Selection) |val| try TIM15SelectionList.from_enum(val) else null,
                    .TIM16Selection = if (self.TIM16Selection) |val| try TIM16SelectionList.from_enum(val) else null,
                    .TIM17Selection = if (self.TIM17Selection) |val| try TIM17SelectionList.from_enum(val) else null,
                    .HRTIMSelection = if (self.HRTIMSelection) |val| try HRTIMSelectionList.from_enum(val) else null,
                    .I2c1ClockSelection = if (self.I2c1ClockSelection) |val| try I2c1ClockSelectionList.from_enum(val) else null,
                    .I2c2ClockSelection = if (self.I2c2ClockSelection) |val| try I2c2ClockSelectionList.from_enum(val) else null,
                    .I2c3ClockSelection = if (self.I2c3ClockSelection) |val| try I2c3ClockSelectionList.from_enum(val) else null,
                    .I2SClockSource = if (self.I2SClockSource) |val| try I2SClockSourceList.from_enum(val) else null,
                    .Usart1ClockSelection = if (self.Usart1ClockSelection) |val| try Usart1ClockSelectionList.from_enum(val) else null,
                    .Usart2ClockSelection = if (self.Usart2ClockSelection) |val| try Usart2ClockSelectionList.from_enum(val) else null,
                    .Usart3ClockSelection = if (self.Usart3ClockSelection) |val| try Usart3ClockSelectionList.from_enum(val) else null,
                    .Uart4ClockSelection = if (self.Uart4ClockSelection) |val| try Uart4ClockSelectionList.from_enum(val) else null,
                    .Uart5ClockSelection = if (self.Uart5ClockSelection) |val| try Uart5ClockSelectionList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLMUL = if (self.PLLMUL) |val| try PLLMULList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSIRCDiv: u32,
            RCC_PLLsource_Clock_Source_FROM_HSE: RCC_PLLsource_Clock_Source_FROM_HSEList,
            PRESCALERUSB: RCC_USBPRE,
            SYSCLKSourceVirtual: RCC_SW,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: RCC_MCOMult_Clock_Source_FROM_PLLMULList,
            RCC_MCOSource: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            ADC12PRES: RCC_ADCPRES,
            ADC34PRES: RCC_ADCPRES,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            TIMMUL: u32,
            TIM1Selection: RCC_TIMSW,
            TIM8Selection: RCC_TIMSW,
            TIM15Selection: RCC_TIMSW,
            TIM16Selection: RCC_TIMSW,
            TIM17Selection: RCC_TIMSW,
            HRTIMSelection: RCC_TIMSW,
            I2c1ClockSelection: RCC_ICSW,
            I2c2ClockSelection: RCC_ICSW,
            I2c3ClockSelection: RCC_ICSW,
            I2SClockSource: RCC_ISSRC,
            Usart1ClockSelection: RCC_USART1SW,
            Usart2ClockSelection: RCC_USARTSW,
            Usart3ClockSelection: RCC_USARTSW,
            Uart4ClockSelection: RCC_USARTSW,
            Uart5ClockSelection: RCC_USARTSW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLMUL: RCC_PLLMUL,
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSIRCDiv = cubemx_config.HSIRCDiv,
                    .RCC_PLLsource_Clock_Source_FROM_HSE = cubemx_config.RCC_PLLsource_Clock_Source_FROM_HSE,
                    .PRESCALERUSB = try cubemx_config.PRESCALERUSB.to_enum(),
                    .SYSCLKSourceVirtual = try cubemx_config.SYSCLKSourceVirtual.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .RCC_MCOMult_Clock_Source_FROM_PLLMUL = cubemx_config.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
                    .RCC_MCOSource = try cubemx_config.RCC_MCOSource.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .ADC12PRES = try cubemx_config.ADC12PRES.to_enum(),
                    .ADC34PRES = try cubemx_config.ADC34PRES.to_enum(),
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .TIMMUL = cubemx_config.TIMMUL,
                    .TIM1Selection = try cubemx_config.TIM1Selection.to_enum(),
                    .TIM8Selection = try cubemx_config.TIM8Selection.to_enum(),
                    .TIM15Selection = try cubemx_config.TIM15Selection.to_enum(),
                    .TIM16Selection = try cubemx_config.TIM16Selection.to_enum(),
                    .TIM17Selection = try cubemx_config.TIM17Selection.to_enum(),
                    .HRTIMSelection = try cubemx_config.HRTIMSelection.to_enum(),
                    .I2c1ClockSelection = try cubemx_config.I2c1ClockSelection.to_enum(),
                    .I2c2ClockSelection = try cubemx_config.I2c2ClockSelection.to_enum(),
                    .I2c3ClockSelection = try cubemx_config.I2c3ClockSelection.to_enum(),
                    .I2SClockSource = try cubemx_config.I2SClockSource.to_enum(),
                    .Usart1ClockSelection = try cubemx_config.Usart1ClockSelection.to_enum(),
                    .Usart2ClockSelection = try cubemx_config.Usart2ClockSelection.to_enum(),
                    .Usart3ClockSelection = try cubemx_config.Usart3ClockSelection.to_enum(),
                    .Uart4ClockSelection = try cubemx_config.Uart4ClockSelection.to_enum(),
                    .Uart5ClockSelection = try cubemx_config.Uart5ClockSelection.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLMUL = try cubemx_config.PLLMUL.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = try cubemx_config.FLatency.to_enum(),
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
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
            HSIRCDiv: u32 = 0,
            FLITFCLKoutput: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            HSEOSC: u32 = 0,
            HSEPLLsourceDevisor: u32 = 0,
            PRESCALERUSB: u32 = 0,
            USBoutput: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            MCOMultDivisor: u32 = 0,
            MCOMult: u32 = 0,
            MCODivisor: u32 = 0,
            MCOoutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            CortexPrescaler: u32 = 0,
            CortexSysOutput: u32 = 0,
            ADC12PRES: u32 = 0,
            ADC12output: u32 = 0,
            ADC34PRES: u32 = 0,
            ADC34output: u32 = 0,
            APB1Prescaler: u32 = 0,
            APB1Output: u32 = 0,
            TimPrescalerAPB1: u32 = 0,
            TimPrescOut1: u32 = 0,
            APB2Prescaler: u32 = 0,
            APB2Output: u32 = 0,
            TimPrescalerAPB2: u32 = 0,
            TimPrescOut2: u32 = 0,
            TIMMUL: u32 = 0,
            TIMMUX1: u32 = 0,
            TIM1out: u32 = 0,
            TIMMUX8: u32 = 0,
            TIM8out: u32 = 0,
            TIMMUX15: u32 = 0,
            TIM15out: u32 = 0,
            TIMMUX16: u32 = 0,
            TIM16out: u32 = 0,
            TIMMUX17: u32 = 0,
            TIM17out: u32 = 0,
            HRTIMMux: u32 = 0,
            HRTIMout: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1Output: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2Output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3Output: u32 = 0,
            I2S_CKIN: u32 = 0,
            I2SSrc: u32 = 0,
            I2SClocksOutput: u32 = 0,
            USART1Mult: u32 = 0,
            USART1Output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2Output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3Output: u32 = 0,
            UART4Mult: u32 = 0,
            UART4Output: u32 = 0,
            UART5Mult: u32 = 0,
            UART5Output: u32 = 0,
            PLLSource: u32 = 0,
            VCO2output: u32 = 0,
            PLLMUL: u32 = 0,
            HSI_PLL: u32 = 0,
            HSE_PLL: u32 = 0,
            HSE_RTC: u32 = 0,
            PLLCLK_MCO: u32 = 0,
            PLLCLK: u32 = 0,
            Tim2CLK: u32 = 0,
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

            var HSEDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv2: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv3: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv4: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv5: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv6: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv7: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv8: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv9: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv10: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv11: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv12: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv13: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv14: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv15: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv16: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var APB2DIV1: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM1SourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM8SourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM15SourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM16SourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var TIM17SourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var HRTIM1SourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourceIsSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourceIsExt: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var FLASH_LATENCY0: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var HSIRCDiv = ClockNode{
                .name = "HSIRCDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FLITFCLKoutput = ClockNode{
                .name = "FLITFCLKoutput",
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

            var HSEOSC = ClockNode{
                .name = "HSEOSC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSEPLLsourceDevisor = ClockNode{
                .name = "HSEPLLsourceDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PRESCALERUSB = ClockNode{
                .name = "PRESCALERUSB",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBoutput = ClockNode{
                .name = "USBoutput",
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

            var MCODivisor = ClockNode{
                .name = "MCODivisor",
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

            var ADC12PRES = ClockNode{
                .name = "ADC12PRES",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADC12output = ClockNode{
                .name = "ADC12output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADC34PRES = ClockNode{
                .name = "ADC34PRES",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADC34output = ClockNode{
                .name = "ADC34output",
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

            var TIMMUL = ClockNode{
                .name = "TIMMUL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIMMUX1 = ClockNode{
                .name = "TIMMUX1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM1out = ClockNode{
                .name = "TIM1out",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIMMUX8 = ClockNode{
                .name = "TIMMUX8",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM8out = ClockNode{
                .name = "TIM8out",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIMMUX15 = ClockNode{
                .name = "TIMMUX15",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM15out = ClockNode{
                .name = "TIM15out",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIMMUX16 = ClockNode{
                .name = "TIMMUX16",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM16out = ClockNode{
                .name = "TIM16out",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIMMUX17 = ClockNode{
                .name = "TIMMUX17",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TIM17out = ClockNode{
                .name = "TIM17out",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HRTIMMux = ClockNode{
                .name = "HRTIMMux",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HRTIMout = ClockNode{
                .name = "HRTIMout",
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

            var I2C2Mult = ClockNode{
                .name = "I2C2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C2Output = ClockNode{
                .name = "I2C2Output",
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

            var I2S_CKIN = ClockNode{
                .name = "I2S_CKIN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2SSrc = ClockNode{
                .name = "I2SSrc",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2SClocksOutput = ClockNode{
                .name = "I2SClocksOutput",
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

            var UART4Mult = ClockNode{
                .name = "UART4Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART4Output = ClockNode{
                .name = "UART4Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART5Mult = ClockNode{
                .name = "UART5Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART5Output = ClockNode{
                .name = "UART5Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSource = ClockNode{
                .name = "PLLSource",
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

            var HSI_PLL = ClockNode{
                .name = "HSI_PLL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSE_PLL = ClockNode{
                .name = "HSE_PLL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSE_RTC = ClockNode{
                .name = "HSE_RTC",
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

            const HSIRCDivValue: u32 = blk: {
                break :blk 2;
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
                    };
                    break :blk 3.2768e4;
                }
                const user_val = config.LSE_VALUE;
                LSEOSC.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                };

                break :blk user_val orelse 3.2768e4;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 3.2e7,
                    };

                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 3.2e7,
                };

                break :blk user_val orelse 8e6;
            };

            const RCC_PLLsource_Clock_Source_FROM_HSEValue: RCC_PLLsource_Clock_Source_FROM_HSEList = blk: {
                const user_val = config.RCC_PLLsource_Clock_Source_FROM_HSE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSE_PREDIV_DIV1 => HSEDiv1 = true,
                        .RCC_HSE_PREDIV_DIV2 => HSEDiv2 = true,
                        .RCC_HSE_PREDIV_DIV3 => HSEDiv3 = true,
                        .RCC_HSE_PREDIV_DIV4 => HSEDiv4 = true,
                        .RCC_HSE_PREDIV_DIV5 => HSEDiv5 = true,
                        .RCC_HSE_PREDIV_DIV6 => HSEDiv6 = true,
                        .RCC_HSE_PREDIV_DIV7 => HSEDiv7 = true,
                        .RCC_HSE_PREDIV_DIV8 => HSEDiv8 = true,
                        .RCC_HSE_PREDIV_DIV9 => HSEDiv9 = true,
                        .RCC_HSE_PREDIV_DIV10 => HSEDiv10 = true,
                        .RCC_HSE_PREDIV_DIV11 => HSEDiv11 = true,
                        .RCC_HSE_PREDIV_DIV12 => HSEDiv12 = true,
                        .RCC_HSE_PREDIV_DIV13 => HSEDiv13 = true,
                        .RCC_HSE_PREDIV_DIV14 => HSEDiv14 = true,
                        .RCC_HSE_PREDIV_DIV15 => HSEDiv15 = true,
                        .RCC_HSE_PREDIV_DIV16 => HSEDiv16 = true,
                    }
                }
                break :blk user_val orelse {
                    HSEDiv1 = true;
                    break :blk .RCC_HSE_PREDIV_DIV1;
                };
            };

            const PRESCALERUSBValue: PRESCALERUSBList = blk: {
                const user_val = config.PRESCALERUSB;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL => {},
                        .RCC_USBCLKSOURCE_PLL_DIV1_5 => {},
                    }
                }
                break :blk user_val orelse .RCC_USBCLKSOURCE_PLL;
            };

            const HRTIMSelectionValue: HRTIMSelectionList = blk: {
                const user_val = config.HRTIMSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HRTIM1CLK_HCLK => {},
                        .RCC_HRTIM1CLK_PLLCLK => HRTIM1SourcePLL = true,
                    }
                }
                break :blk user_val orelse .RCC_HRTIM1CLK_HCLK;
            };

            const TIM1SelectionValue: TIM1SelectionList = blk: {
                const user_val = config.TIM1Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_TIM1CLK_HCLK => {},
                        .RCC_TIM1CLK_PLLCLK => TIM1SourcePLL = true,
                    }
                }
                break :blk user_val orelse .RCC_TIM1CLK_HCLK;
            };

            const TIM8SelectionValue: TIM8SelectionList = blk: {
                const user_val = config.TIM8Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_TIM8CLK_HCLK => {},
                        .RCC_TIM8CLK_PLLCLK => TIM8SourcePLL = true,
                    }
                }
                break :blk user_val orelse .RCC_TIM8CLK_HCLK;
            };

            const TIM15SelectionValue: TIM15SelectionList = blk: {
                const user_val = config.TIM15Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_TIM15CLK_HCLK => {},
                        .RCC_TIM15CLK_PLLCLK => TIM15SourcePLL = true,
                    }
                }
                break :blk user_val orelse .RCC_TIM15CLK_HCLK;
            };

            const TIM16SelectionValue: TIM16SelectionList = blk: {
                const user_val = config.TIM16Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_TIM16CLK_HCLK => {},
                        .RCC_TIM16CLK_PLLCLK => TIM16SourcePLL = true,
                    }
                }
                break :blk user_val orelse .RCC_TIM16CLK_HCLK;
            };

            const TIM17SelectionValue: TIM17SelectionList = blk: {
                const user_val = config.TIM17Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_TIM17CLK_HCLK => {},
                        .RCC_TIM17CLK_PLLCLK => TIM17SourcePLL = true,
                    }
                }
                break :blk user_val orelse .RCC_TIM17CLK_HCLK;
            };

            const SYSCLKSourceVirtualValue: SYSCLKSourceVirtualList = blk: {
                if ((HRTIM1SourcePLL and config.flags.HRTIM1Used_ForRCC) or (TIM1SourcePLL and true) or (TIM8SourcePLL and check_MCU("TIM8")) or (TIM15SourcePLL and true) or (TIM16SourcePLL and check_MCU("TIM16")) or (TIM17SourcePLL and check_MCU("TIM17"))) {
                    if (config.SYSCLKSourceVirtual) |val| {
                        if (val != .RCC_SYSCLKSOURCE_PLLCLK) {
                            const patch_str = if (patch_logs) "PLL1_P" else "RCC_SYSCLKSOURCE_PLLCLK";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "SYSCLKSourceVirtual",
                                "(HRTIM1SourcePLL &HRTIM1Used_ForRCC)|(TIM1SourcePLL &TIM1)|(TIM8SourcePLL &TIM8)|(TIM15SourcePLL &TIM15)|(TIM16SourcePLL &TIM16)|(TIM17SourcePLL &TIM17)",
                                "PLL Clock must be selected",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    SysSourcePLL = true;
                    break :blk .RCC_SYSCLKSOURCE_PLLCLK;
                }
                const user_val = config.SYSCLKSourceVirtual;

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
                if (check_MCU("DIE439") or check_MCU("DIE438")) {
                    const user_val = config.RCC_MCOMult_Clock_Source_FROM_PLLMUL;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MCO1SOURCE_PLLCLK => {},
                            .RCC_MCO1SOURCE_PLLCLK_DIV2 => {},
                        }
                    }
                    break :blk user_val orelse .RCC_MCO1SOURCE_PLLCLK;
                }
                if (config.RCC_MCOMult_Clock_Source_FROM_PLLMUL) |val| {
                    if (val != .RCC_MCO1SOURCE_PLLCLK_DIV2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "RCC_MCOMult_Clock_Source_FROM_PLLMUL",
                            "Else",
                            "No additional information",
                            "RCC_MCO1SOURCE_PLLCLK_DIV2",
                            val,
                        });
                    }
                }
                break :blk .RCC_MCO1SOURCE_PLLCLK_DIV2;
            };

            const RCC_MCOSourceValue: RCC_MCOSourceList = blk: {
                if (check_MCU("DIE439") or check_MCU("DIE438")) {
                    const user_val = config.RCC_MCOSource;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MCO1SOURCE_SYSCLK => {},
                            .RCC_MCO1SOURCE_HSI => {},
                            .RCC_MCO1SOURCE_HSE => {},
                            .RCC_MCO1SOURCE_PLLCLK_DIV2 => {},
                            .RCC_MCO1SOURCE_LSI => {},
                            .RCC_MCO1SOURCE_LSE => {},
                            .MCOMultDivisor => {},
                        }
                    }
                    break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
                }
                const user_val = config.RCC_MCOSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => {},
                        .RCC_MCO1SOURCE_HSI => {},
                        .RCC_MCO1SOURCE_HSE => {},
                        .RCC_MCO1SOURCE_PLLCLK_DIV2 => {},
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
                            , .{
                                "RCC_MCOSource",
                                "Else",
                                "No additional information",
                                if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                if (patch_logs) "SYS" else "RCC_MCO1SOURCE_SYSCLK",
                                if (patch_logs) "HSI" else "RCC_MCO1SOURCE_HSI",
                                if (patch_logs) "HSE" else "RCC_MCO1SOURCE_HSE",
                                if (patch_logs) "PLL" else "RCC_MCO1SOURCE_PLLCLK_DIV2",
                                if (patch_logs) "LSI" else "RCC_MCO1SOURCE_LSI",
                                if (patch_logs) "LSE" else "RCC_MCO1SOURCE_LSE",
                            });
                        },
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
            };

            const RCC_MCODivValue: RCC_MCODivList = blk: {
                if (check_MCU("DIE439") or check_MCU("DIE438")) {
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
                }
                if (config.RCC_MCODiv) |val| {
                    if (val != .RCC_MCODIV_1) {
                        const patch_str = if (patch_logs) "Div1" else "RCC_MCODIV_1";
                        const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: .{s}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "RCC_MCODiv",
                            "Else",
                            "No additional information",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                break :blk .RCC_MCODIV_1;
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

            const ADC12PRESValue: ADC12PRESList = blk: {
                if (!check_MCU("DIE439")) {
                    const user_val = config.ADC12PRES;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_ADC12PLLCLK_DIV1 => {},
                            .RCC_ADC12PLLCLK_DIV2 => {},
                            .RCC_ADC12PLLCLK_DIV4 => {},
                            .RCC_ADC12PLLCLK_DIV6 => {},
                            .RCC_ADC12PLLCLK_DIV8 => {},
                            .RCC_ADC12PLLCLK_DIV10 => {},
                            .RCC_ADC12PLLCLK_DIV12 => {},
                            .RCC_ADC12PLLCLK_DIV16 => {},
                            .RCC_ADC12PLLCLK_DIV32 => {},
                            .RCC_ADC12PLLCLK_DIV64 => {},
                            .RCC_ADC12PLLCLK_DIV128 => {},
                            .RCC_ADC12PLLCLK_DIV256 => {},
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
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "ADC12PRES",
                                    "!DIE439",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Div1" else "RCC_ADC12PLLCLK_DIV1",
                                    if (patch_logs) "Div2" else "RCC_ADC12PLLCLK_DIV2",
                                    if (patch_logs) "Div4" else "RCC_ADC12PLLCLK_DIV4",
                                    if (patch_logs) "Div6" else "RCC_ADC12PLLCLK_DIV6",
                                    if (patch_logs) "Div8" else "RCC_ADC12PLLCLK_DIV8",
                                    if (patch_logs) "Div10" else "RCC_ADC12PLLCLK_DIV10",
                                    if (patch_logs) "Div12" else "RCC_ADC12PLLCLK_DIV12",
                                    if (patch_logs) "Div16" else "RCC_ADC12PLLCLK_DIV16",
                                    if (patch_logs) "Div32" else "RCC_ADC12PLLCLK_DIV32",
                                    if (patch_logs) "Div64" else "RCC_ADC12PLLCLK_DIV64",
                                    if (patch_logs) "Div128" else "RCC_ADC12PLLCLK_DIV128",
                                    if (patch_logs) "Div256" else "RCC_ADC12PLLCLK_DIV256",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_ADC12PLLCLK_DIV1;
                } else if (check_MCU("DIE439")) {
                    const user_val = config.ADC12PRES;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_ADC1PLLCLK_DIV1 => {},
                            .RCC_ADC1PLLCLK_DIV2 => {},
                            .RCC_ADC1PLLCLK_DIV4 => {},
                            .RCC_ADC1PLLCLK_DIV6 => {},
                            .RCC_ADC1PLLCLK_DIV8 => {},
                            .RCC_ADC1PLLCLK_DIV10 => {},
                            .RCC_ADC1PLLCLK_DIV12 => {},
                            .RCC_ADC1PLLCLK_DIV16 => {},
                            .RCC_ADC1PLLCLK_DIV32 => {},
                            .RCC_ADC1PLLCLK_DIV64 => {},
                            .RCC_ADC1PLLCLK_DIV128 => {},
                            .RCC_ADC1PLLCLK_DIV256 => {},
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
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "ADC12PRES",
                                    "DIE439",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Div1" else "RCC_ADC1PLLCLK_DIV1",
                                    if (patch_logs) "Div2" else "RCC_ADC1PLLCLK_DIV2",
                                    if (patch_logs) "Div4" else "RCC_ADC1PLLCLK_DIV4",
                                    if (patch_logs) "Div6" else "RCC_ADC1PLLCLK_DIV6",
                                    if (patch_logs) "Div8" else "RCC_ADC1PLLCLK_DIV8",
                                    if (patch_logs) "Div10" else "RCC_ADC1PLLCLK_DIV10",
                                    if (patch_logs) "Div12" else "RCC_ADC1PLLCLK_DIV12",
                                    if (patch_logs) "Div16" else "RCC_ADC1PLLCLK_DIV16",
                                    if (patch_logs) "Div32" else "RCC_ADC1PLLCLK_DIV32",
                                    if (patch_logs) "Div64" else "RCC_ADC1PLLCLK_DIV64",
                                    if (patch_logs) "Div128" else "RCC_ADC1PLLCLK_DIV128",
                                    if (patch_logs) "Div256" else "RCC_ADC1PLLCLK_DIV256",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_ADC1PLLCLK_DIV1;
                }
                if (config.ADC12PRES) |_| {
                    return comptime_fail_or_error(error.InvalidConfig,
                        \\
                        \\Error on {s} | expr: {s} diagnostic: {s} 
                        \\Value should be null.
                        \\note: some configurations are invalid in certain cases.
                        \\
                        \\
                    , .{ "ADC12PRES", "Else", "No additional information" });
                }
                break :blk null;
            };

            const ADC34PRESValue: ADC34PRESList = blk: {
                const user_val = config.ADC34PRES;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADC34PLLCLK_DIV1 => {},
                        .RCC_ADC34PLLCLK_DIV2 => {},
                        .RCC_ADC34PLLCLK_DIV4 => {},
                        .RCC_ADC34PLLCLK_DIV6 => {},
                        .RCC_ADC34PLLCLK_DIV8 => {},
                        .RCC_ADC34PLLCLK_DIV10 => {},
                        .RCC_ADC34PLLCLK_DIV12 => {},
                        .RCC_ADC34PLLCLK_DIV16 => {},
                        .RCC_ADC34PLLCLK_DIV32 => {},
                        .RCC_ADC34PLLCLK_DIV64 => {},
                        .RCC_ADC34PLLCLK_DIV128 => {},
                        .RCC_ADC34PLLCLK_DIV256 => {},
                    }
                }
                break :blk user_val orelse .RCC_ADC34PLLCLK_DIV1;
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
                        .RCC_HCLK_DIV1 => APB2DIV1 = true,
                        .RCC_HCLK_DIV2 => {},
                        .RCC_HCLK_DIV4 => {},
                        .RCC_HCLK_DIV8 => {},
                        .RCC_HCLK_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    APB2DIV1 = true;
                    break :blk .RCC_HCLK_DIV1;
                };
            };

            const APB2TimCLKDividerValue: u32 = blk: {
                if (check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) {
                    break :blk 1;
                }
                break :blk 2;
            };

            const TIMMULValue: u32 = blk: {
                break :blk 2;
            };

            const I2c1ClockSelectionValue: I2c1ClockSelectionList = blk: {
                const user_val = config.I2c1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_SYSCLK => {},
                        .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C1SourceHSI = true;
                    break :blk .RCC_I2C1CLKSOURCE_HSI;
                };
            };

            const I2c2ClockSelectionValue: I2c2ClockSelectionList = blk: {
                const user_val = config.I2c2ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C2CLKSOURCE_SYSCLK => {},
                        .RCC_I2C2CLKSOURCE_HSI => I2C2SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C2SourceHSI = true;
                    break :blk .RCC_I2C2CLKSOURCE_HSI;
                };
            };

            const I2c3ClockSelectionValue: I2c3ClockSelectionList = blk: {
                const user_val = config.I2c3ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C3CLKSOURCE_SYSCLK => {},
                        .RCC_I2C3CLKSOURCE_HSI => I2C3SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C3SourceHSI = true;
                    break :blk .RCC_I2C3CLKSOURCE_HSI;
                };
            };

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 8e6;
            };

            const I2SClockSourceValue: I2SClockSourceList = blk: {
                const user_val = config.I2SClockSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2SCLKSOURCE_SYSCLK => I2SSourceIsSys = true,
                        .RCC_I2SCLKSOURCE_EXT => I2SSourceIsExt = true,
                    }
                }
                break :blk user_val orelse {
                    I2SSourceIsSys = true;
                    break :blk .RCC_I2SCLKSOURCE_SYSCLK;
                };
            };

            const Usart1ClockSelectionValue: Usart1ClockSelectionList = blk: {
                if (check_MCU("DIE439") or check_MCU("DIE438")) {
                    const user_val = config.Usart1ClockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART1CLKSOURCE_PCLK1 => {},
                            .RCC_USART1CLKSOURCE_SYSCLK => {},
                            .RCC_USART1CLKSOURCE_HSI => {},
                            .RCC_USART1CLKSOURCE_LSE => {},
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
                                , .{
                                    "Usart1ClockSelection",
                                    "DIE439|DIE438",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    "RCC_USART1CLKSOURCE_PCLK1",
                                    if (patch_logs) "SYS" else "RCC_USART1CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_USART1CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_USART1CLKSOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK2;
                }
                const user_val = config.Usart1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK2 => {},
                        .RCC_USART1CLKSOURCE_SYSCLK => {},
                        .RCC_USART1CLKSOURCE_HSI => {},
                        .RCC_USART1CLKSOURCE_LSE => {},
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
                            , .{
                                "Usart1ClockSelection",
                                "Else",
                                "No additional information",
                                if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                if (patch_logs) "PCLK2" else "RCC_USART1CLKSOURCE_PCLK2",
                                if (patch_logs) "SYS" else "RCC_USART1CLKSOURCE_SYSCLK",
                                if (patch_logs) "HSI" else "RCC_USART1CLKSOURCE_HSI",
                                if (patch_logs) "LSE" else "RCC_USART1CLKSOURCE_LSE",
                            });
                        },
                    }
                }
                break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK2;
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

            const Uart4ClockSelectionValue: Uart4ClockSelectionList = blk: {
                const user_val = config.Uart4ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART4CLKSOURCE_PCLK1 => {},
                        .RCC_UART4CLKSOURCE_SYSCLK => {},
                        .RCC_UART4CLKSOURCE_HSI => {},
                        .RCC_UART4CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_UART4CLKSOURCE_PCLK1;
            };

            const Uart5ClockSelectionValue: Uart5ClockSelectionList = blk: {
                const user_val = config.Uart5ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART5CLKSOURCE_PCLK1 => {},
                        .RCC_UART5CLKSOURCE_SYSCLK => {},
                        .RCC_UART5CLKSOURCE_HSI => {},
                        .RCC_UART5CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_UART5CLKSOURCE_PCLK1;
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((config.flags.USBUsed_ForRCC)) {
                    if (config.PLLSourceVirtual) |val| {
                        if (val != .RCC_PLLSOURCE_HSE) {
                            const patch_str = if (patch_logs) "HSE_Div_PREDIV" else "RCC_PLLSOURCE_HSE";
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
                    PLLSourceHSE = true;
                    break :blk .RCC_PLLSOURCE_HSE;
                }
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
                if (!check_MCU("STM32F3x8")) {
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
                                "!STM32F3x8",
                                "HCLK2 not changed",
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
                                "!STM32F3x8",
                                "HCLK2 not changed",
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
                    if (val > 1.95e0) {
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
                            1.95e0,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1.8e0;
            };

            const PREFETCH_ENABLEValue: PREFETCH_ENABLEList = blk: {
                if (!AHBCLKDivider1) {
                    if (config.extra_config.PREFETCH_ENABLE) |val| {
                        if (val != .@"1") {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PREFETCH_ENABLE",
                                "!AHBCLKDivider1",
                                "",
                                "1",
                                val,
                            });
                        }
                    }
                    break :blk .@"1";
                }
                const user_val = config.extra_config.PREFETCH_ENABLE;

                if (user_val) |val| {
                    switch (val) {
                        .@"1" => {},
                        .@"0" => {},
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
                if (((config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_LSE, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_LSE, .@"="))) or (config.flags.USART3Used_ForRCC and (check_ref(@TypeOf(Usart3ClockSelectionValue), Usart3ClockSelectionValue, .RCC_USART3CLKSOURCE_LSE, .@"="))) or (config.flags.UART4Used_ForRCC and (check_ref(@TypeOf(Uart4ClockSelectionValue), Uart4ClockSelectionValue, .RCC_UART4CLKSOURCE_LSE, .@"="))) or (config.flags.UART5Used_ForRCC and (check_ref(@TypeOf(Uart5ClockSelectionValue), Uart5ClockSelectionValue, .RCC_UART5CLKSOURCE_LSE, .@"="))) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or config.flags.MCOConfig)) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=") and config.flags.RTCUsed_ForRCC))) {
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

            const PLLUsedValue: u1 = blk: {
                if (((true and check_ref(@TypeOf(TIM1SelectionValue), TIM1SelectionValue, .RCC_TIM1CLK_PLLCLK, .@"=")) or (check_MCU("TIM8") and check_ref(@TypeOf(TIM8SelectionValue), TIM8SelectionValue, .RCC_TIM8CLK_PLLCLK, .@"=")) or (true and check_ref(@TypeOf(TIM15SelectionValue), TIM15SelectionValue, .RCC_TIM15CLK_PLLCLK, .@"=")) or (check_MCU("TIM16") and TIM16SourcePLL) or (check_MCU("TIM17") and check_ref(@TypeOf(TIM17SelectionValue), TIM17SelectionValue, .RCC_TIM17CLK_PLLCLK, .@"=")) or (config.flags.HRTIM1Used_ForRCC and check_ref(@TypeOf(HRTIMSelectionValue), HRTIMSelectionValue, .RCC_HRTIM1CLK_PLLCLK, .@"=")) or (check_ref(@TypeOf(SYSCLKSourceVirtualValue), SYSCLKSourceVirtualValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_PLLCLK_DIV2, .@"=") or false) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or config.flags.MCOConfig)) or config.flags.USBUsed_ForRCC or (check_MCU("channelSelectedADC1") and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (check_MCU("channelSelectedADC2") and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (check_MCU("channelSelectedADC3") and config.flags.ADC3UsedAsynchronousCLK_ForRCC) or (check_MCU("channelSelectedADC4") and config.flags.ADC4UsedAsynchronousCLK_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
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

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
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
                if ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or config.flags.MCOConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADC1EnableValue: ADC1EnableList = blk: {
                if (check_MCU("channelSelectedADC1") and config.flags.ADC1UsedAsynchronousCLK_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADC2EnableValue: ADC2EnableList = blk: {
                if (check_MCU("channelSelectedADC2") and config.flags.ADC2UsedAsynchronousCLK_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADC3EnableValue: ADC3EnableList = blk: {
                if ((check_MCU("channelSelectedADC3") and config.flags.ADC3UsedAsynchronousCLK_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADC4EnableValue: ADC4EnableList = blk: {
                if (check_MCU("channelSelectedADC4") and config.flags.ADC4UsedAsynchronousCLK_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const Tim1EnableValue: Tim1EnableList = blk: {
                if (true) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const Tim8EnableValue: Tim8EnableList = blk: {
                if (check_MCU("TIM8")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const Tim15EnableValue: Tim15EnableList = blk: {
                if (true and check_MCU("DIE439")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const Tim16EnableValue: Tim16EnableList = blk: {
                if (check_MCU("TIM16") and check_MCU("DIE439")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const Tim17EnableValue: Tim17EnableList = blk: {
                if (check_MCU("TIM17") and check_MCU("DIE439")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HRTIMEnableValue: HRTIMEnableList = blk: {
                if (config.flags.HRTIM1Used_ForRCC) {
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

            const ExtClockEnableValue: ExtClockEnableList = blk: {
                if (config.flags.AudioClockConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2SEnableValue: I2SEnableList = blk: {
                if (!config.flags.I2S2Used_ForRCC and !config.flags.I2S3Used_ForRCC) {
                    if (config.extra_config.I2SEnable) |val| {
                        if (val != .false) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "I2SEnable",
                                "!I2S2Used_ForRCC & !I2S3Used_ForRCC",
                                "I2S ip not used",
                                "false",
                                val,
                            });
                        }
                    }
                    break :blk .false;
                } else if (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) {
                    if (config.extra_config.I2SEnable) |val| {
                        if (val != .true) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "I2SEnable",
                                "I2S2Used_ForRCC | I2S3Used_ForRCC",
                                "I2S ip used",
                                "true",
                                val,
                            });
                        }
                    }
                    break :blk .true;
                }
                const user_val = config.extra_config.I2SEnable;

                if (user_val) |val| {
                    switch (val) {
                        .true => {},
                        .false => {},
                    }
                }
                break :blk user_val orelse .true;
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

            const EnableHSIRTCDevisorValue: EnableHSIRTCDevisorList = blk: {
                if (config.flags.RTCUsed_ForRCC) {
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

            const FLITFCLKFEnableValue: FLITFCLKFEnableList = blk: {
                if (config.flags.FLITFUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HSEUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_HSE_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or ((config.flags.RTCUsed_ForRCC) and !((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) or ((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceVirtualValue), SYSCLKSourceVirtualValue, .RCC_SYSCLKSOURCE_HSE, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSE, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSIUsedValue: u1 = blk: {
                if ((config.flags.IWDGUsed_ForRCC or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (config.flags.RTCUsed_ForRCC)) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSI, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSI, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceVirtualValue), SYSCLKSourceVirtualValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM16") and check_MCU("TIM16") and check_MCU("Semaphore_input_Channel1TIM16")) or config.flags.MCOConfig)) or (config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_HSI, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_HSI, .@"="))) or (config.flags.USART3Used_ForRCC and (check_ref(@TypeOf(Usart3ClockSelectionValue), Usart3ClockSelectionValue, .RCC_USART3CLKSOURCE_HSI, .@"="))) or (config.flags.UART4Used_ForRCC and (check_ref(@TypeOf(Uart4ClockSelectionValue), Uart4ClockSelectionValue, .RCC_UART4CLKSOURCE_HSI, .@"="))) or (config.flags.UART5Used_ForRCC and (check_ref(@TypeOf(Uart5ClockSelectionValue), Uart5ClockSelectionValue, .RCC_UART5CLKSOURCE_HSI, .@"="))) or (config.flags.I2C1Used_ForRCC and (I2C1SourceHSI)) or (config.flags.I2C2Used_ForRCC and (I2C2SourceHSI)) or (config.flags.I2C3Used_ForRCC and (I2C3SourceHSI)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and check_ref(@TypeOf(SYSCLKSourceVirtualValue), SYSCLKSourceVirtualValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or (check_ref(@TypeOf(SYSCLKSourceVirtualValue), SYSCLKSourceVirtualValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            // ======= NODE HSIRCDiv ======
            HSIRCDiv.nodetype = .div;
            HSIRCDiv.value = @floatFromInt(HSIRCDivValue);
            HSIRCDiv.parents = &.{&HSIRC};

            // ======= NODE FLITFCLKoutput ======
            FLITFCLKoutput.nodetype = .output;
            FLITFCLKoutput.parents = &.{&HSIRC};

            // ======= NODE LSIRC ======
            if (!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("UQFN32")) {
                LSIRC.nodetype = .source;
                LSIRC.value = LSI_VALUEValue;
            }
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            if (check_ref(@TypeOf(EnableLSEValue), EnableLSEValue, .true, .@"=")) {
                if (!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("UQFN32")) {
                    LSEOSC.nodetype = .source;
                    LSEOSC.value = LSE_VALUEValue;
                }
            }
            // ======= NODE HSEOSC ======
            if (check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"=")) {
                HSEOSC.nodetype = .source;
                HSEOSC.value = HSE_VALUEValue;
            }
            // ======= NODE HSEPLLsourceDevisor ======
            if (check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"=")) {
                HSEPLLsourceDevisor.nodetype = .div;
                HSEPLLsourceDevisor.value = try RCC_PLLsource_Clock_Source_FROM_HSEValue.get();
                HSEPLLsourceDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE PRESCALERUSB ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                PRESCALERUSB.nodetype = .div;
                PRESCALERUSB.value = try PRESCALERUSBValue.get();
                PRESCALERUSB.parents = &.{&PLLMUL};
            }
            // ======= NODE USBoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                USBoutput.nodetype = .output;
                USBoutput.parents = &.{&PRESCALERUSB};
            }
            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceVirtualValue) {
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLMUL},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE HSERTCDevisor ======
            if (check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=")) {
                HSERTCDevisor.nodetype = .div;
                HSERTCDevisor.value = @floatFromInt(RCC_RTC_Clock_Source_FROM_HSEValue);
                HSERTCDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE RTCClkSource ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RTCClockSelectionValue) {
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => &.{&HSERTCDevisor},
                    .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RTCCLKSOURCE_LSI => &.{&LSIRC},
                };
            }
            // ======= NODE RTCOutput ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")) {
                if (!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("UQFN32")) {
                    RTCOutput.nodetype = .output;
                    RTCOutput.parents = &.{&RTCClkSource};
                }
                RTCOutput.nodetype = .output;
                RTCOutput.parents = &.{&RTCClkSource};
            }
            // ======= NODE IWDGOutput ======
            if (check_ref(@TypeOf(IWDGEnableValue), IWDGEnableValue, .true, .@"=")) {
                IWDGOutput.nodetype = .output;
                IWDGOutput.parents = &.{&LSIRC};
            }
            // ======= NODE MCOMultDivisor ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                if ((check_MCU("DIE439") or check_MCU("DIE438")) and (!check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("UQFN32"))) {
                    MCOMultDivisor.nodetype = .div;
                    MCOMultDivisor.value = try RCC_MCOMult_Clock_Source_FROM_PLLMULValue.get();
                    MCOMultDivisor.parents = &.{&PLLMUL};
                } else if ((check_MCU("DIE439") or check_MCU("DIE438"))) {
                    MCOMultDivisor.nodetype = .div;
                    MCOMultDivisor.value = try RCC_MCOMult_Clock_Source_FROM_PLLMULValue.get();
                    MCOMultDivisor.parents = &.{&PLLMUL};
                }
                MCOMultDivisor.nodetype = .div;
                MCOMultDivisor.value = try RCC_MCOMult_Clock_Source_FROM_PLLMULValue.get();
                MCOMultDivisor.parents = &.{&PLLMUL};
            }
            // ======= NODE MCOMult ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                if ((check_MCU("DIE439") or check_MCU("DIE438")) and !check_MCU("LQFP32") and !check_MCU("UFQFPN32") and !check_MCU("UQFN32")) {
                    MCOMult.nodetype = .multi;
                    MCOMult.parents = switch (RCC_MCOSourceValue) {
                        .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                        .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                        .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                        .MCOMultDivisor => &.{&MCOMultDivisor},
                        .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                        .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    };
                } else if (check_MCU("DIE439") or check_MCU("DIE438")) {
                    MCOMult.nodetype = .multi;
                    MCOMult.parents = switch (RCC_MCOSourceValue) {
                        .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                        .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                        .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                        .MCOMultDivisor => &.{&MCOMultDivisor},
                        .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                        .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    };
                }
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCOSourceValue) {
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_PLLCLK_DIV2 => &.{&MCOMultDivisor},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE MCODivisor ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                if (check_MCU("DIE439") or check_MCU("DIE438")) {
                    MCODivisor.nodetype = .div;
                    MCODivisor.value = try RCC_MCODivValue.get();
                    MCODivisor.parents = &.{&MCOMult};
                }
            }
            // ======= NODE MCOoutput ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                if (check_MCU("DIE439") or check_MCU("DIE438")) {
                    MCOoutput.nodetype = .output;
                    MCOoutput.parents = &.{&MCODivisor};
                }
                MCOoutput.nodetype = .output;
                MCOoutput.parents = &.{&MCOMult};
            }
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

            // ======= NODE CortexPrescaler ======
            CortexPrescaler.nodetype = .div;
            CortexPrescaler.value = try Cortex_DivValue.get();
            CortexPrescaler.parents = &.{&AHBOutput};

            // ======= NODE CortexSysOutput ======
            CortexSysOutput.nodetype = .output;
            CortexSysOutput.parents = &.{&CortexPrescaler};

            // ======= NODE ADC12PRES ======
            if (check_ref(@TypeOf(ADC1EnableValue), ADC1EnableValue, .true, .@"=") or check_ref(@TypeOf(ADC2EnableValue), ADC2EnableValue, .true, .@"=")) {
                ADC12PRES.nodetype = .div;
                ADC12PRES.value = try ADC12PRESValue.get();
                ADC12PRES.parents = &.{&PLLMUL};
            }
            // ======= NODE ADC12output ======
            if (check_ref(@TypeOf(ADC1EnableValue), ADC1EnableValue, .true, .@"=") or check_ref(@TypeOf(ADC2EnableValue), ADC2EnableValue, .true, .@"=")) {
                ADC12output.nodetype = .output;
                ADC12output.parents = &.{&ADC12PRES};
            }
            // ======= NODE ADC34PRES ======
            if (check_ref(@TypeOf(ADC3EnableValue), ADC3EnableValue, .true, .@"=") or check_ref(@TypeOf(ADC4EnableValue), ADC4EnableValue, .true, .@"=")) {
                ADC34PRES.nodetype = .div;
                ADC34PRES.value = try ADC34PRESValue.get();
                ADC34PRES.parents = &.{&PLLMUL};
            }
            // ======= NODE ADC34output ======
            if (check_ref(@TypeOf(ADC3EnableValue), ADC3EnableValue, .true, .@"=") or check_ref(@TypeOf(ADC4EnableValue), ADC4EnableValue, .true, .@"=")) {
                ADC34output.nodetype = .output;
                ADC34output.parents = &.{&ADC34PRES};
            }
            // ======= NODE APB1Prescaler ======
            if (check_MCU("DIE439") or check_MCU("DIE438")) {
                APB1Prescaler.nodetype = .div;
                APB1Prescaler.value = try APB1CLKDividerValue.get();
                APB1Prescaler.parents = &.{&AHBOutput};
            }
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
            if ((check_MCU("DIE439") or check_MCU("DIE438"))) {
                APB2Prescaler.nodetype = .div;
                APB2Prescaler.value = try APB2CLKDividerValue.get();
                APB2Prescaler.parents = &.{&AHBOutput};
            }
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

            // ======= NODE TIMMUL ======
            TIMMUL.nodetype = .mul;
            TIMMUL.value = @floatFromInt(TIMMULValue);
            TIMMUL.parents = &.{&PLLMUL};

            // ======= NODE TIMMUX1 ======
            if (check_ref(@TypeOf(Tim1EnableValue), Tim1EnableValue, .true, .@"=")) {
                TIMMUX1.nodetype = .multi;
                TIMMUX1.parents = switch (TIM1SelectionValue) {
                    .RCC_TIM1CLK_PLLCLK => &.{&TIMMUL},
                    .RCC_TIM1CLK_HCLK => &.{&TimPrescOut2},
                };
            }
            // ======= NODE TIM1out ======
            if (check_ref(@TypeOf(Tim1EnableValue), Tim1EnableValue, .true, .@"=")) {
                TIM1out.nodetype = .output;
                TIM1out.parents = &.{&TIMMUX1};
            }
            // ======= NODE TIMMUX8 ======
            if (check_ref(@TypeOf(Tim8EnableValue), Tim8EnableValue, .true, .@"=")) {
                TIMMUX8.nodetype = .multi;
                TIMMUX8.parents = switch (TIM8SelectionValue) {
                    .RCC_TIM8CLK_PLLCLK => &.{&TIMMUL},
                    .RCC_TIM8CLK_HCLK => &.{&TimPrescOut2},
                };
            }
            // ======= NODE TIM8out ======
            if (check_ref(@TypeOf(Tim8EnableValue), Tim8EnableValue, .true, .@"=")) {
                TIM8out.nodetype = .output;
                TIM8out.parents = &.{&TIMMUX8};
            }
            // ======= NODE TIMMUX15 ======
            if (check_ref(@TypeOf(Tim15EnableValue), Tim15EnableValue, .true, .@"=")) {
                if (check_MCU("DIE439")) {
                    TIMMUX15.nodetype = .multi;
                    TIMMUX15.parents = switch (TIM15SelectionValue) {
                        .RCC_TIM15CLK_PLLCLK => &.{&TIMMUL},
                        .RCC_TIM15CLK_HCLK => &.{&TimPrescOut2},
                    };
                }
            }
            // ======= NODE TIM15out ======
            if (check_ref(@TypeOf(Tim15EnableValue), Tim15EnableValue, .true, .@"=")) {
                if (check_MCU("DIE439")) {
                    TIM15out.nodetype = .output;
                    TIM15out.parents = &.{&TIMMUX15};
                }
            }
            // ======= NODE TIMMUX16 ======
            if (check_ref(@TypeOf(Tim16EnableValue), Tim16EnableValue, .true, .@"=")) {
                if (check_MCU("DIE439")) {
                    TIMMUX16.nodetype = .multi;
                    TIMMUX16.parents = switch (TIM16SelectionValue) {
                        .RCC_TIM16CLK_PLLCLK => &.{&TIMMUL},
                        .RCC_TIM16CLK_HCLK => &.{&TimPrescOut2},
                    };
                }
            }
            // ======= NODE TIM16out ======
            if (check_ref(@TypeOf(Tim16EnableValue), Tim16EnableValue, .true, .@"=")) {
                if (check_MCU("DIE439")) {
                    TIM16out.nodetype = .output;
                    TIM16out.parents = &.{&TIMMUX16};
                }
            }
            // ======= NODE TIMMUX17 ======
            if (check_ref(@TypeOf(Tim17EnableValue), Tim17EnableValue, .true, .@"=")) {
                if (check_MCU("DIE439")) {
                    TIMMUX17.nodetype = .multi;
                    TIMMUX17.parents = switch (TIM17SelectionValue) {
                        .RCC_TIM17CLK_PLLCLK => &.{&TIMMUL},
                        .RCC_TIM17CLK_HCLK => &.{&TimPrescOut2},
                    };
                }
            }
            // ======= NODE TIM17out ======
            if (check_ref(@TypeOf(Tim17EnableValue), Tim17EnableValue, .true, .@"=")) {
                if (check_MCU("DIE439")) {
                    TIM17out.nodetype = .output;
                    TIM17out.parents = &.{&TIMMUX17};
                }
            }
            // ======= NODE HRTIMMux ======
            if (check_ref(@TypeOf(HRTIMEnableValue), HRTIMEnableValue, .true, .@"=")) {
                HRTIMMux.nodetype = .multi;
                HRTIMMux.parents = switch (HRTIMSelectionValue) {
                    .RCC_HRTIM1CLK_PLLCLK => &.{&TIMMUL},
                    .RCC_HRTIM1CLK_HCLK => &.{&TimPrescOut2},
                };
            }
            // ======= NODE HRTIMout ======
            if (check_ref(@TypeOf(HRTIMEnableValue), HRTIMEnableValue, .true, .@"=")) {
                HRTIMout.nodetype = .output;
                HRTIMout.parents = &.{&HRTIMMux};
            }
            // ======= NODE I2C1Mult ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                if (check_MCU("I2C2_Exist")) {
                    I2C1Mult.nodetype = .multi;
                    I2C1Mult.parents = switch (I2c1ClockSelectionValue) {
                        .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    };
                }
                I2C1Mult.nodetype = .multi;
                I2C1Mult.parents = switch (I2c1ClockSelectionValue) {
                    .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE I2C1Output ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                if (check_MCU("I2C2_Exist")) {
                    I2C1Output.nodetype = .output;
                    I2C1Output.parents = &.{&I2C1Mult};
                }
                I2C1Output.nodetype = .output;
                I2C1Output.parents = &.{&I2C1Mult};
            }
            // ======= NODE I2C2Mult ======
            if (check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=")) {
                I2C2Mult.nodetype = .multi;
                I2C2Mult.parents = switch (I2c2ClockSelectionValue) {
                    .RCC_I2C2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE I2C2Output ======
            if (check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=")) {
                I2C2Output.nodetype = .output;
                I2C2Output.parents = &.{&I2C2Mult};
            }
            // ======= NODE I2C3Mult ======
            if (check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"=")) {
                I2C3Mult.nodetype = .multi;
                I2C3Mult.parents = switch (I2c3ClockSelectionValue) {
                    .RCC_I2C3CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE I2C3Output ======
            if (check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"=")) {
                I2C3Output.nodetype = .output;
                I2C3Output.parents = &.{&I2C3Mult};
            }
            // ======= NODE I2S_CKIN ======
            if (check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"=")) {
                if ((check_MCU("I2S2_Exist") or check_MCU("I2S3_Exist")) and ((!check_MCU("LQFP48") and !check_MCU("WLCSP49") and !check_MCU("UFQFPN32") and !check_MCU("UQFN32") and !check_MCU("LQFP32")) or check_MCU("DIE439") or (check_MCU("DIE422") and !check_MCU("LQFP48")))) {
                    I2S_CKIN.nodetype = .source;
                    I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;
                }
            }
            // ======= NODE I2SSrc ======
            if (check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                I2SSrc.nodetype = .multi;
                I2SSrc.parents = switch (I2SClockSourceValue) {
                    .RCC_I2SCLKSOURCE_EXT => &.{&I2S_CKIN},
                    .RCC_I2SCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE I2SClocksOutput ======
            if (check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                if ((check_MCU("I2S2_Exist") or check_MCU("I2S3_Exist")) and ((!check_MCU("LQFP48") and !check_MCU("WLCSP49") and !check_MCU("UFQFPN32") and !check_MCU("UQFN32") and !check_MCU("LQFP32")) or check_MCU("DIE439") or (check_MCU("DIE422") and !check_MCU("LQFP48")))) {
                    I2SClocksOutput.nodetype = .output;
                    I2SClocksOutput.parents = &.{&I2SSrc};
                }
            }
            // ======= NODE USART1Mult ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                if (check_MCU("DIE439") or check_MCU("DIE438")) {
                    USART1Mult.nodetype = .multi;
                    USART1Mult.parents = switch (Usart1ClockSelectionValue) {
                        .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
                        .RCC_USART1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    };
                }
                USART1Mult.nodetype = .multi;
                USART1Mult.parents = switch (Usart1ClockSelectionValue) {
                    .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_USART1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                };
            }
            // ======= NODE USART1Output ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1Output.nodetype = .output;
                USART1Output.parents = &.{&USART1Mult};
            }
            // ======= NODE USART2Mult ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                if (!(check_MCU("DIE438") or check_MCU("DIE439"))) {
                    USART2Mult.nodetype = .multi;
                    USART2Mult.parents = switch (Usart2ClockSelectionValue) {
                        .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_USART2CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                        .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    };
                }
            }
            // ======= NODE USART2Output ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                if (!(check_MCU("DIE438") or check_MCU("DIE439"))) {
                    USART2Output.nodetype = .output;
                    USART2Output.parents = &.{&USART2Mult};
                }
            }
            // ======= NODE USART3Mult ======
            if (check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=")) {
                if (!(check_MCU("DIE438") or check_MCU("DIE439"))) {
                    USART3Mult.nodetype = .multi;
                    USART3Mult.parents = switch (Usart3ClockSelectionValue) {
                        .RCC_USART3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_USART3CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_USART3CLKSOURCE_LSE => &.{&LSEOSC},
                        .RCC_USART3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    };
                }
            }
            // ======= NODE USART3Output ======
            if (check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=")) {
                if (!(check_MCU("DIE438") or check_MCU("DIE439"))) {
                    USART3Output.nodetype = .output;
                    USART3Output.parents = &.{&USART3Mult};
                }
            }
            // ======= NODE UART4Mult ======
            if (check_ref(@TypeOf(UART4EnableValue), UART4EnableValue, .true, .@"=")) {
                UART4Mult.nodetype = .multi;
                UART4Mult.parents = switch (Uart4ClockSelectionValue) {
                    .RCC_UART4CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_UART4CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_UART4CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_UART4CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                };
            }
            // ======= NODE UART4Output ======
            if (check_ref(@TypeOf(UART4EnableValue), UART4EnableValue, .true, .@"=")) {
                UART4Output.nodetype = .output;
                UART4Output.parents = &.{&UART4Mult};
            }
            // ======= NODE UART5Mult ======
            if (check_ref(@TypeOf(UART5EnableValue), UART5EnableValue, .true, .@"=")) {
                UART5Mult.nodetype = .multi;
                UART5Mult.parents = switch (Uart5ClockSelectionValue) {
                    .RCC_UART5CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_UART5CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_UART5CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_UART5CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                };
            }
            // ======= NODE UART5Output ======
            if (check_ref(@TypeOf(UART5EnableValue), UART5EnableValue, .true, .@"=")) {
                UART5Output.nodetype = .output;
                UART5Output.parents = &.{&UART5Mult};
            }
            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI => &.{&HSIRCDiv},
                .RCC_PLLSOURCE_HSE => &.{&HSEPLLsourceDevisor},
            };

            // ======= NODE VCO2output ======
            VCO2output.nodetype = .output;
            VCO2output.parents = &.{&PLLSource};

            // ======= NODE PLLMUL ======
            PLLMUL.nodetype = .mul;
            PLLMUL.value = try PLLMULValue.get();
            PLLMUL.parents = &.{&VCO2output};

            // ======= NODE HSI_PLL ======
            HSI_PLL.nodetype = .output;
            HSI_PLL.parents = &.{&HSIRCDiv};

            // ======= NODE HSE_PLL ======
            HSE_PLL.nodetype = .output;
            HSE_PLL.parents = &.{&HSEPLLsourceDevisor};

            // ======= NODE HSE_RTC ======
            HSE_RTC.nodetype = .output;
            HSE_RTC.parents = &.{&HSERTCDevisor};

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

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);

            USBoutput.limit = .{
                .min = 4.788e7,
                .max = 4.812e7,
            };

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 7.2e7,
            };

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(false) and !(false))) {
                RTCOutput.limit = .{
                    .min = null,
                    .max = 1e6,
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
                .max = 7.2e7,
            };

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            //======= ADC12outputFreq_Value ========
            const ADC12outputFreq_ValueValue = ADC12output.get_as_ref();
            ignore_value(ADC12outputFreq_ValueValue);

            //======= ADC34outputFreq_Value ========
            const ADC34outputFreq_ValueValue = ADC34output.get_as_ref();
            ignore_value(ADC34outputFreq_ValueValue);

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);
            if (config.flags.USBUsed_ForRCC) {
                APB1Output.limit = .{
                    .min = 1e7,
                    .max = 3.6e7,
                };
            } else if (config.flags.RTCUsed_ForRCC and !config.flags.USBUsed_ForRCC) {
                const max_APB1Output = 36000000;
                const min_APB1Output = RTCFreq_ValueValue;

                APB1Output.limit = .{
                    .min = min_APB1Output,
                    .max = max_APB1Output,
                    .min_expr = "=RTCFreq_Value",
                    .max_expr = "36000000",
                };
            } else {
                APB1Output.limit = .{
                    .min = null,
                    .max = 3.6e7,
                };
            }

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);
            if ((HRTIM1SourcePLL and config.flags.HRTIM1Used_ForRCC) or ((check_MCU("DIE438") and !check_MCU("STM32F3x4")) or check_MCU("DIE439")) and ((TIM1SourcePLL and true) or (TIM8SourcePLL and check_MCU("TIM8")) or (TIM15SourcePLL and true) or (TIM16SourcePLL and check_MCU("TIM16")) or (TIM17SourcePLL and check_MCU("TIM17")))) {
                const max_APB2Output = SYSCLKFreq_VALUEValue;
                const min_APB2Output = try math_op(?@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 2, .@"/", "SYSCLKFreq_VALUE");

                APB2Output.limit = .{
                    .min = min_APB2Output,
                    .max = max_APB2Output,
                    .min_expr = "=SYSCLKFreq_VALUE/2",
                    .max_expr = "=SYSCLKFreq_VALUE",
                };
            } else {
                APB2Output.limit = .{
                    .min = null,
                    .max = 7.2e7,
                };
            }

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= TIM1Freq_Value ========
            const TIM1Freq_ValueValue = TIM1out.get_as_ref();
            ignore_value(TIM1Freq_ValueValue);

            //======= TIM8Freq_Value ========
            const TIM8Freq_ValueValue = TIM8out.get_as_ref();
            ignore_value(TIM8Freq_ValueValue);

            //======= TIM15Freq_Value ========
            const TIM15Freq_ValueValue = TIM15out.get_as_ref();
            ignore_value(TIM15Freq_ValueValue);

            //======= TIM16Freq_Value ========
            const TIM16Freq_ValueValue = TIM16out.get_as_ref();
            ignore_value(TIM16Freq_ValueValue);

            //======= TIM17Freq_Value ========
            const TIM17Freq_ValueValue = TIM17out.get_as_ref();
            ignore_value(TIM17Freq_ValueValue);

            //======= HRTIM1Freq_Value ========
            const HRTIM1Freq_ValueValue = HRTIMout.get_as_ref();
            ignore_value(HRTIM1Freq_ValueValue);

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1Output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2Output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3Output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);

            //======= I2SClocksFreq_Value ========
            const I2SClocksFreq_ValueValue = I2SClocksOutput.get_as_ref();
            ignore_value(I2SClocksFreq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1Output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2Output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);
            const max_USART2Output = 36000000;
            const min_USART2Output = 10000000;

            USART2Output.limit = .{
                .min = min_USART2Output,
                .max = max_USART2Output,
                .min_expr = "10000000",
                .max_expr = "36000000",
            };

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3Output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);
            const max_USART3Output = 36000000;
            const min_USART3Output = 10000000;

            USART3Output.limit = .{
                .min = min_USART3Output,
                .max = max_USART3Output,
                .min_expr = "10000000",
                .max_expr = "36000000",
            };

            //======= UART4Freq_Value ========
            const UART4Freq_ValueValue = UART4Output.get_as_ref();
            ignore_value(UART4Freq_ValueValue);

            //======= UART5Freq_Value ========
            const UART5Freq_ValueValue = UART5Output.get_as_ref();
            ignore_value(UART5Freq_ValueValue);

            //======= VCOOutput2Freq_Value ========
            const VCOOutput2Freq_ValueValue = VCO2output.get_as_ref();
            ignore_value(VCOOutput2Freq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCO2output.limit = .{
                    .min = 1e6,
                    .max = 2.4e7,
                };
            }

            //======= HSIPLLFreq_Value ========
            const HSIPLLFreq_ValueValue = HSI_PLL.get_as_ref();
            ignore_value(HSIPLLFreq_ValueValue);

            //======= HSEPLLFreq_Value ========
            const HSEPLLFreq_ValueValue = HSE_PLL.get_as_ref();
            ignore_value(HSEPLLFreq_ValueValue);

            //======= RTCHSEDivFreq_Value ========
            const RTCHSEDivFreq_ValueValue = HSE_RTC.get_as_ref();
            ignore_value(RTCHSEDivFreq_ValueValue);

            //======= PLLMCOFreq_Value ========
            const PLLMCOFreq_ValueValue = PLLCLK_MCO.get_as_ref();
            ignore_value(PLLMCOFreq_ValueValue);

            //======= PLLCLKFreq_Value ========
            const PLLCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = 1.6e7,
                    .max = 7.2e7,
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"=")))))) {
                    FLASH_LATENCY0 = true;
                    break :blk .FLASH_LATENCY_0;
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"=")))))) {
                    break :blk .FLASH_LATENCY_1;
                }
                break :blk .FLASH_LATENCY_2;
            };
            out.HSIRC = try HSIRC.get_output();
            out.HSIRCDiv = try HSIRCDiv.get_output();
            out.FLITFCLKoutput = try FLITFCLKoutput.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.HSEPLLsourceDevisor = try HSEPLLsourceDevisor.get_output();
            out.PRESCALERUSB = try PRESCALERUSB.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.MCOMultDivisor = try MCOMultDivisor.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODivisor = try MCODivisor.get_output();
            out.MCOoutput = try MCOoutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.CortexPrescaler = try CortexPrescaler.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.ADC12PRES = try ADC12PRES.get_output();
            out.ADC12output = try ADC12output.get_output();
            out.ADC34PRES = try ADC34PRES.get_output();
            out.ADC34output = try ADC34output.get_output();
            out.APB1Prescaler = try APB1Prescaler.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.TimPrescalerAPB1 = try TimPrescalerAPB1.get_output();
            out.TimPrescOut1 = try TimPrescOut1.get_output();
            out.APB2Prescaler = try APB2Prescaler.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.TimPrescalerAPB2 = try TimPrescalerAPB2.get_output();
            out.TimPrescOut2 = try TimPrescOut2.get_output();
            out.TIMMUL = try TIMMUL.get_output();
            out.TIMMUX1 = try TIMMUX1.get_output();
            out.TIM1out = try TIM1out.get_output();
            out.TIMMUX8 = try TIMMUX8.get_output();
            out.TIM8out = try TIM8out.get_output();
            out.TIMMUX15 = try TIMMUX15.get_output();
            out.TIM15out = try TIM15out.get_output();
            out.TIMMUX16 = try TIMMUX16.get_output();
            out.TIM16out = try TIM16out.get_output();
            out.TIMMUX17 = try TIMMUX17.get_output();
            out.TIM17out = try TIM17out.get_output();
            out.HRTIMMux = try HRTIMMux.get_output();
            out.HRTIMout = try HRTIMout.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1Output = try I2C1Output.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2Output = try I2C2Output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3Output = try I2C3Output.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.I2SSrc = try I2SSrc.get_output();
            out.I2SClocksOutput = try I2SClocksOutput.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1Output = try USART1Output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2Output = try USART2Output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3Output = try USART3Output.get_output();
            out.UART4Mult = try UART4Mult.get_output();
            out.UART4Output = try UART4Output.get_output();
            out.UART5Mult = try UART5Mult.get_output();
            out.UART5Output = try UART5Output.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.VCO2output = try VCO2output.get_output();
            out.PLLMUL = try PLLMUL.get_output();
            out.HSI_PLL = try HSI_PLL.get_extra_output();
            out.HSE_PLL = try HSE_PLL.get_extra_output();
            out.HSE_RTC = try HSE_RTC.get_extra_output();
            out.PLLCLK_MCO = try PLLCLK_MCO.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.Tim2CLK = 0;
            ignore_value(HSI_VALUEValue);
            ref_out.HSIRCDiv = HSIRCDivValue;
            ignore_value(FLITFCLKFreq_ValueValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ref_out.RCC_PLLsource_Clock_Source_FROM_HSE = RCC_PLLsource_Clock_Source_FROM_HSEValue;
            ref_out.PRESCALERUSB = PRESCALERUSBValue;
            ignore_value(USBFreq_ValueValue);
            ref_out.SYSCLKSourceVirtual = SYSCLKSourceVirtualValue;
            ignore_value(SYSCLKFreq_VALUEValue);
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
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ref_out.ADC12PRES = ADC12PRESValue;
            ignore_value(ADC12outputFreq_ValueValue);
            ref_out.ADC34PRES = ADC34PRESValue;
            ignore_value(ADC34outputFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APB1Freq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APB1TimFreq_ValueValue);
            ref_out.APB2CLKDivider = APB2CLKDividerValue;
            ignore_value(APB2Freq_ValueValue);
            ref_out.APB2TimCLKDivider = APB2TimCLKDividerValue;
            ignore_value(APB2TimFreq_ValueValue);
            ref_out.TIMMUL = TIMMULValue;
            ref_out.TIM1Selection = TIM1SelectionValue;
            ignore_value(TIM1Freq_ValueValue);
            ref_out.TIM8Selection = TIM8SelectionValue;
            ignore_value(TIM8Freq_ValueValue);
            ref_out.TIM15Selection = TIM15SelectionValue;
            ignore_value(TIM15Freq_ValueValue);
            ref_out.TIM16Selection = TIM16SelectionValue;
            ignore_value(TIM16Freq_ValueValue);
            ref_out.TIM17Selection = TIM17SelectionValue;
            ignore_value(TIM17Freq_ValueValue);
            ref_out.HRTIMSelection = HRTIMSelectionValue;
            ignore_value(HRTIM1Freq_ValueValue);
            ref_out.I2c1ClockSelection = I2c1ClockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2c2ClockSelection = I2c2ClockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.I2c3ClockSelection = I2c3ClockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.I2SClockSource = I2SClockSourceValue;
            ignore_value(I2SClocksFreq_ValueValue);
            ref_out.Usart1ClockSelection = Usart1ClockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.Usart2ClockSelection = Usart2ClockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.Usart3ClockSelection = Usart3ClockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.Uart4ClockSelection = Uart4ClockSelectionValue;
            ignore_value(UART4Freq_ValueValue);
            ref_out.Uart5ClockSelection = Uart5ClockSelectionValue;
            ignore_value(UART5Freq_ValueValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ignore_value(VCOOutput2Freq_ValueValue);
            ref_out.PLLMUL = PLLMULValue;
            ignore_value(HSIPLLFreq_ValueValue);
            ignore_value(HSEPLLFreq_ValueValue);
            ignore_value(RTCHSEDivFreq_ValueValue);
            ignore_value(PLLMCOFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.ADC1Enable = ADC1EnableValue == .true;
            ref_out.flags.ADC2Enable = ADC2EnableValue == .true;
            ref_out.flags.ADC3Enable = ADC3EnableValue == .true;
            ref_out.flags.ADC4Enable = ADC4EnableValue == .true;
            ref_out.flags.Tim1Enable = Tim1EnableValue == .true;
            ref_out.flags.Tim8Enable = Tim8EnableValue == .true;
            ref_out.flags.Tim15Enable = Tim15EnableValue == .true;
            ref_out.flags.Tim16Enable = Tim16EnableValue == .true;
            ref_out.flags.Tim17Enable = Tim17EnableValue == .true;
            ref_out.flags.HRTIMEnable = HRTIMEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.I2SEnable = I2SEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.UART4Enable = UART4EnableValue == .true;
            ref_out.flags.UART5Enable = UART5EnableValue == .true;
            ref_out.flags.EnableHSIRTCDevisor = EnableHSIRTCDevisorValue == .true;
            ref_out.flags.EnableMCOMultDivisor = EnableMCOMultDivisorValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.FLITFCLKFEnable = FLITFCLKFEnableValue == .true;
            ref_out.flags.HSEUsed = HSEUsedValue != 0;
            ref_out.flags.LSIUsed = LSIUsedValue != 0;
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
