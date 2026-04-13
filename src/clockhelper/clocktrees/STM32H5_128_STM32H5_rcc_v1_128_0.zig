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
        pub const RCC_LPTIM1SEL = enum(u3) {
            PCLK3 = 0,
            PLL2_P = 1,
            LSE = 3,
            LSI = 4,
            PER = 5,
        };
        pub const RCC_I2CSEL = enum(u2) {
            PCLK1 = 0,
            PLL3_R = 1,
            HSI = 2,
            CSI = 3,
        };
        pub const RCC_PERSEL = enum(u2) {
            HSI = 0,
            CSI = 1,
            HSE = 2,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_PLLDIV = enum(u7) {
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
            Div33 = 32,
            Div34 = 33,
            Div35 = 34,
            Div36 = 35,
            Div37 = 36,
            Div38 = 37,
            Div39 = 38,
            Div40 = 39,
            Div41 = 40,
            Div42 = 41,
            Div43 = 42,
            Div44 = 43,
            Div45 = 44,
            Div46 = 45,
            Div47 = 46,
            Div48 = 47,
            Div49 = 48,
            Div50 = 49,
            Div51 = 50,
            Div52 = 51,
            Div53 = 52,
            Div54 = 53,
            Div55 = 54,
            Div56 = 55,
            Div57 = 56,
            Div58 = 57,
            Div59 = 58,
            Div60 = 59,
            Div61 = 60,
            Div62 = 61,
            Div63 = 62,
            Div64 = 63,
            Div65 = 64,
            Div66 = 65,
            Div67 = 66,
            Div68 = 67,
            Div69 = 68,
            Div70 = 69,
            Div71 = 70,
            Div72 = 71,
            Div73 = 72,
            Div74 = 73,
            Div75 = 74,
            Div76 = 75,
            Div77 = 76,
            Div78 = 77,
            Div79 = 78,
            Div80 = 79,
            Div81 = 80,
            Div82 = 81,
            Div83 = 82,
            Div84 = 83,
            Div85 = 84,
            Div86 = 85,
            Div87 = 86,
            Div88 = 87,
            Div89 = 88,
            Div90 = 89,
            Div91 = 90,
            Div92 = 91,
            Div93 = 92,
            Div94 = 93,
            Div95 = 94,
            Div96 = 95,
            Div97 = 96,
            Div98 = 97,
            Div99 = 98,
            Div100 = 99,
            Div101 = 100,
            Div102 = 101,
            Div103 = 102,
            Div104 = 103,
            Div105 = 104,
            Div106 = 105,
            Div107 = 106,
            Div108 = 107,
            Div109 = 108,
            Div110 = 109,
            Div111 = 110,
            Div112 = 111,
            Div113 = 112,
            Div114 = 113,
            Div115 = 114,
            Div116 = 115,
            Div117 = 116,
            Div118 = 117,
            Div119 = 118,
            Div120 = 119,
            Div121 = 120,
            Div122 = 121,
            Div123 = 122,
            Div124 = 123,
            Div125 = 124,
            Div126 = 125,
            Div127 = 126,
            Div128 = 127,
        };
        pub const RCC_LPTIM2SEL = enum(u3) {
            PCLK1 = 0,
            PLL2_P = 1,
            LSE = 3,
            LSI = 4,
            PER = 5,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_MCOPRE = enum(u4) {
            Div1 = 1,
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
        };
        pub const RCC_LPUARTSEL = enum(u3) {
            PCLK3 = 0,
            PLL2_Q = 1,
            HSI = 3,
            CSI = 4,
            LSE = 5,
        };
        pub const RCC_SW = enum(u3) {
            HSI = 0,
            CSI = 1,
            HSE = 2,
            PLL1_P = 3,
        };
        pub const RCC_MCO2SEL = enum(u3) {
            SYS = 0,
            PLL2_P = 1,
            HSE = 2,
            PLL1_P = 3,
            CSI = 4,
            LSI = 5,
        };
        pub const RCC_TIMPRE = enum(u1) {
            DefaultX2 = 0,
            DefaultX4 = 1,
        };
        pub const RCC_MCO1SEL = enum(u3) {
            HSI = 0,
            LSE = 1,
            HSE = 2,
            PLL1_Q = 3,
            HSI48 = 4,
        };
        pub const RCC_LSCOSEL = enum(u1) {
            LSI = 0,
            LSE = 1,
        };
        pub const CRS_SYNCSRC = enum(u2) {
            GPIO = 0,
            LSE = 1,
            USB = 2,
        };
        pub const RCC_HSIDIV = enum(u2) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
        };
        pub const RCC_RNGSEL = enum(u2) {
            HSI48 = 0,
            PLL1_Q = 1,
            LSE = 2,
            LSI = 3,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE_DIV_RTCPRE = 3,
        };
        pub const PWR_VOS = enum(u2) {
            Scale3 = 0,
            Scale2 = 1,
            Scale1 = 2,
            Scale0 = 3,
        };
        pub const RCC_USART1SEL = enum(u3) {
            PCLK2 = 0,
            PLL2_Q = 1,
            HSI = 3,
            CSI = 4,
            LSE = 5,
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
        pub const RCC_PLLRGE = enum(u2) {
            Range1 = 0,
            Range2 = 1,
            Range4 = 2,
            Range8 = 3,
        };
        pub const RCC_PLLSRC = enum(u2) {
            HSI = 1,
            CSI = 2,
            HSE = 3,
        };
        pub const RCC_FDCANSEL = enum(u2) {
            HSE = 0,
            PLL1_Q = 1,
            PLL2_Q = 2,
        };
        pub const RCC_ADCDACSEL = enum(u3) {
            HCLK2 = 0,
            SYS = 1,
            PLL2_R = 2,
            HSE = 3,
            HSI = 4,
            CSI = 5,
        };
        pub const RCC_USBSEL = enum(u2) {
            PLL1_Q = 1,
            HSI48 = 3,
        };
        pub const RCC_I3C2SEL = enum(u2) {
            PCLK3 = 0,
            PLL3_R = 1,
            HSI = 2,
            CSI = 3,
        };
        pub const RCC_PLLVCOSEL = enum(u1) {
            WideVCO = 0,
            MediumVCO = 1,
        };
        pub const RCC_SPISEL = enum(u3) {
            PLL1_Q = 0,
            PLL2_P = 1,
            AUDIOCLK = 3,
            PER = 4,
        };
        pub const RCC_USARTSEL = enum(u3) {
            PCLK1 = 0,
            PLL2_Q = 1,
            HSI = 3,
            CSI = 4,
            LSE = 5,
        };

        pub const HSIDivList = enum {
            RCC_HSI_DIV1,
            RCC_HSI_DIV2,
            RCC_HSI_DIV4,
            RCC_HSI_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_HSIDIV {
                return switch (self) {
                    .RCC_HSI_DIV4 => .Div4,
                    .RCC_HSI_DIV8 => .Div8,
                    .RCC_HSI_DIV1 => .Div1,
                    .RCC_HSI_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_HSIDIV) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_HSI_DIV4,
                    .Div8 => .RCC_HSI_DIV8,
                    .Div1 => .RCC_HSI_DIV1,
                    .Div2 => .RCC_HSI_DIV2,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HSI_DIV1 => 1,
                    .RCC_HSI_DIV2 => 2,
                    .RCC_HSI_DIV4 => 4,
                    .RCC_HSI_DIV8 => 8,
                };
            }
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_CSI,
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_CSI => .CSI,
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_P,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .CSI => .RCC_SYSCLKSOURCE_CSI,
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .PLL1_P => .RCC_SYSCLKSOURCE_PLLCLK,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLL1_SOURCE_CSI,
            RCC_PLL1_SOURCE_HSI,
            RCC_PLL1_SOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLL1_SOURCE_HSE => .HSE,
                    .RCC_PLL1_SOURCE_CSI => .CSI,
                    .RCC_PLL1_SOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_PLL1_SOURCE_HSE,
                    .CSI => .RCC_PLL1_SOURCE_CSI,
                    .HSI => .RCC_PLL1_SOURCE_HSI,
                };
            }
        };

        pub const PLL2SourceList = enum {
            RCC_PLL2_SOURCE_CSI,
            RCC_PLL2_SOURCE_HSI,
            RCC_PLL2_SOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLL2_SOURCE_CSI => .CSI,
                    .RCC_PLL2_SOURCE_HSE => .HSE,
                    .RCC_PLL2_SOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_PLL2_SOURCE_CSI,
                    .HSE => .RCC_PLL2_SOURCE_HSE,
                    .HSI => .RCC_PLL2_SOURCE_HSI,
                };
            }
        };

        pub const RCC_RTC_Clock_Source_FROM_HSEList = enum {
            RCC_RTC_HSE_NOCLOCK,
            RCC_RTC_HSE_DIV2,
            RCC_RTC_HSE_DIV3,
            RCC_RTC_HSE_DIV4,
            RCC_RTC_HSE_DIV5,
            RCC_RTC_HSE_DIV6,
            RCC_RTC_HSE_DIV7,
            RCC_RTC_HSE_DIV8,
            RCC_RTC_HSE_DIV9,
            RCC_RTC_HSE_DIV10,
            RCC_RTC_HSE_DIV11,
            RCC_RTC_HSE_DIV12,
            RCC_RTC_HSE_DIV13,
            RCC_RTC_HSE_DIV14,
            RCC_RTC_HSE_DIV15,
            RCC_RTC_HSE_DIV16,
            RCC_RTC_HSE_DIV17,
            RCC_RTC_HSE_DIV18,
            RCC_RTC_HSE_DIV19,
            RCC_RTC_HSE_DIV20,
            RCC_RTC_HSE_DIV21,
            RCC_RTC_HSE_DIV22,
            RCC_RTC_HSE_DIV23,
            RCC_RTC_HSE_DIV24,
            RCC_RTC_HSE_DIV25,
            RCC_RTC_HSE_DIV26,
            RCC_RTC_HSE_DIV27,
            RCC_RTC_HSE_DIV28,
            RCC_RTC_HSE_DIV29,
            RCC_RTC_HSE_DIV30,
            RCC_RTC_HSE_DIV31,
            RCC_RTC_HSE_DIV32,
            RCC_RTC_HSE_DIV33,
            RCC_RTC_HSE_DIV34,
            RCC_RTC_HSE_DIV35,
            RCC_RTC_HSE_DIV36,
            RCC_RTC_HSE_DIV37,
            RCC_RTC_HSE_DIV38,
            RCC_RTC_HSE_DIV39,
            RCC_RTC_HSE_DIV40,
            RCC_RTC_HSE_DIV41,
            RCC_RTC_HSE_DIV42,
            RCC_RTC_HSE_DIV43,
            RCC_RTC_HSE_DIV44,
            RCC_RTC_HSE_DIV45,
            RCC_RTC_HSE_DIV46,
            RCC_RTC_HSE_DIV47,
            RCC_RTC_HSE_DIV48,
            RCC_RTC_HSE_DIV49,
            RCC_RTC_HSE_DIV50,
            RCC_RTC_HSE_DIV51,
            RCC_RTC_HSE_DIV52,
            RCC_RTC_HSE_DIV53,
            RCC_RTC_HSE_DIV54,
            RCC_RTC_HSE_DIV55,
            RCC_RTC_HSE_DIV56,
            RCC_RTC_HSE_DIV57,
            RCC_RTC_HSE_DIV58,
            RCC_RTC_HSE_DIV59,
            RCC_RTC_HSE_DIV60,
            RCC_RTC_HSE_DIV61,
            RCC_RTC_HSE_DIV62,
            RCC_RTC_HSE_DIV63,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_RTC_HSE_NOCLOCK => 1,
                    .RCC_RTC_HSE_DIV2 => 2,
                    .RCC_RTC_HSE_DIV3 => 3,
                    .RCC_RTC_HSE_DIV4 => 4,
                    .RCC_RTC_HSE_DIV5 => 5,
                    .RCC_RTC_HSE_DIV6 => 6,
                    .RCC_RTC_HSE_DIV7 => 7,
                    .RCC_RTC_HSE_DIV8 => 8,
                    .RCC_RTC_HSE_DIV9 => 9,
                    .RCC_RTC_HSE_DIV10 => 10,
                    .RCC_RTC_HSE_DIV11 => 11,
                    .RCC_RTC_HSE_DIV12 => 12,
                    .RCC_RTC_HSE_DIV13 => 13,
                    .RCC_RTC_HSE_DIV14 => 14,
                    .RCC_RTC_HSE_DIV15 => 15,
                    .RCC_RTC_HSE_DIV16 => 16,
                    .RCC_RTC_HSE_DIV17 => 17,
                    .RCC_RTC_HSE_DIV18 => 18,
                    .RCC_RTC_HSE_DIV19 => 19,
                    .RCC_RTC_HSE_DIV20 => 20,
                    .RCC_RTC_HSE_DIV21 => 21,
                    .RCC_RTC_HSE_DIV22 => 22,
                    .RCC_RTC_HSE_DIV23 => 23,
                    .RCC_RTC_HSE_DIV24 => 24,
                    .RCC_RTC_HSE_DIV25 => 25,
                    .RCC_RTC_HSE_DIV26 => 26,
                    .RCC_RTC_HSE_DIV27 => 27,
                    .RCC_RTC_HSE_DIV28 => 28,
                    .RCC_RTC_HSE_DIV29 => 29,
                    .RCC_RTC_HSE_DIV30 => 30,
                    .RCC_RTC_HSE_DIV31 => 31,
                    .RCC_RTC_HSE_DIV32 => 32,
                    .RCC_RTC_HSE_DIV33 => 33,
                    .RCC_RTC_HSE_DIV34 => 34,
                    .RCC_RTC_HSE_DIV35 => 35,
                    .RCC_RTC_HSE_DIV36 => 36,
                    .RCC_RTC_HSE_DIV37 => 37,
                    .RCC_RTC_HSE_DIV38 => 38,
                    .RCC_RTC_HSE_DIV39 => 39,
                    .RCC_RTC_HSE_DIV40 => 40,
                    .RCC_RTC_HSE_DIV41 => 41,
                    .RCC_RTC_HSE_DIV42 => 42,
                    .RCC_RTC_HSE_DIV43 => 43,
                    .RCC_RTC_HSE_DIV44 => 44,
                    .RCC_RTC_HSE_DIV45 => 45,
                    .RCC_RTC_HSE_DIV46 => 46,
                    .RCC_RTC_HSE_DIV47 => 47,
                    .RCC_RTC_HSE_DIV48 => 48,
                    .RCC_RTC_HSE_DIV49 => 49,
                    .RCC_RTC_HSE_DIV50 => 50,
                    .RCC_RTC_HSE_DIV51 => 51,
                    .RCC_RTC_HSE_DIV52 => 52,
                    .RCC_RTC_HSE_DIV53 => 53,
                    .RCC_RTC_HSE_DIV54 => 54,
                    .RCC_RTC_HSE_DIV55 => 55,
                    .RCC_RTC_HSE_DIV56 => 56,
                    .RCC_RTC_HSE_DIV57 => 57,
                    .RCC_RTC_HSE_DIV58 => 58,
                    .RCC_RTC_HSE_DIV59 => 59,
                    .RCC_RTC_HSE_DIV60 => 60,
                    .RCC_RTC_HSE_DIV61 => 61,
                    .RCC_RTC_HSE_DIV62 => 62,
                    .RCC_RTC_HSE_DIV63 => 63,
                };
            }
        };

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_HSE_DIV32,
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_RTCSEL {
                return switch (self) {
                    .RCC_RTCCLKSOURCE_LSI => .LSI,
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => .HSE_DIV_RTCPRE,
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .HSE_DIV_RTCPRE => .RCC_RTCCLKSOURCE_HSE_DIV32,
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
                };
            }
        };

        pub const USART1CLockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK2,
            RCC_USART1CLKSOURCE_PLL2Q,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,
            RCC_USART1CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_USART1SEL {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_PCLK2 => .PCLK2,
                    .RCC_USART1CLKSOURCE_CSI => .CSI,
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                    .RCC_USART1CLKSOURCE_PLL2Q => .PLL2_Q,
                };
            }
            pub fn from_enum(item: RCC_USART1SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK2 => .RCC_USART1CLKSOURCE_PCLK2,
                    .CSI => .RCC_USART1CLKSOURCE_CSI,
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
                    .PLL2_Q => .RCC_USART1CLKSOURCE_PLL2Q,
                };
            }
        };

        pub const USART2CLockSelectionList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_PLL2Q,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,
            RCC_USART2CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_CSI => .CSI,
                    .RCC_USART2CLKSOURCE_HSI => .HSI,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART2CLKSOURCE_PLL2Q => .PLL2_Q,
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_USART2CLKSOURCE_CSI,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                    .PLL2_Q => .RCC_USART2CLKSOURCE_PLL2Q,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                };
            }
        };

        pub const USART3CLockSelectionList = enum {
            RCC_USART3CLKSOURCE_PCLK1,
            RCC_USART3CLKSOURCE_PLL2Q,
            RCC_USART3CLKSOURCE_HSI,
            RCC_USART3CLKSOURCE_LSE,
            RCC_USART3CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_USART3CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_PLL2Q => .PLL2_Q,
                    .RCC_USART3CLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                    .PLL2_Q => .RCC_USART3CLKSOURCE_PLL2Q,
                    .CSI => .RCC_USART3CLKSOURCE_CSI,
                };
            }
        };

        pub const LPUART1CLockSelectionList = enum {
            RCC_LPUART1CLKSOURCE_PCLK3,
            RCC_LPUART1CLKSOURCE_PLL2Q,
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_LSE,
            RCC_LPUART1CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_LPUARTSEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_CSI => .CSI,
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_PCLK3 => .PCLK3,
                    .RCC_LPUART1CLKSOURCE_PLL2Q => .PLL2_Q,
                };
            }
            pub fn from_enum(item: RCC_LPUARTSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .CSI => .RCC_LPUART1CLKSOURCE_CSI,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PCLK3 => .RCC_LPUART1CLKSOURCE_PCLK3,
                    .PLL2_Q => .RCC_LPUART1CLKSOURCE_PLL2Q,
                };
            }
        };

        pub const LPTIM1CLockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_CLKP,
            RCC_LPTIM1CLKSOURCE_LSE,
            RCC_LPTIM1CLKSOURCE_PCLK3,
            RCC_LPTIM1CLKSOURCE_PLL2P,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM1SEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_PCLK3 => .PCLK3,
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM1CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_LPTIM1CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK3 => .RCC_LPTIM1CLKSOURCE_PCLK3,
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .PLL2_P => .RCC_LPTIM1CLKSOURCE_PLL2P,
                    .PER => .RCC_LPTIM1CLKSOURCE_CLKP,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                };
            }
        };

        pub const LPTIM2CLockSelectionList = enum {
            RCC_LPTIM2CLKSOURCE_PCLK1,
            RCC_LPTIM2CLKSOURCE_LSI,
            RCC_LPTIM2CLKSOURCE_PLL2P,
            RCC_LPTIM2CLKSOURCE_LSE,
            RCC_LPTIM2CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM2CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPTIM2CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_LPTIM2CLKSOURCE_CLKP => .PER,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .PCLK1 => .RCC_LPTIM2CLKSOURCE_PCLK1,
                    .PLL2_P => .RCC_LPTIM2CLKSOURCE_PLL2P,
                    .PER => .RCC_LPTIM2CLKSOURCE_CLKP,
                };
            }
        };

        pub const DACLowPowerCLockSelectionList = enum {
            RCC_DACLPCLKSOURCE_LSE,
            RCC_DACLPCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_LSCOSEL {
                return switch (self) {
                    .RCC_DACLPCLKSOURCE_LSI => .LSI,
                    .RCC_DACLPCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LSCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_DACLPCLKSOURCE_LSI,
                    .LSE => .RCC_DACLPCLKSOURCE_LSE,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCDACCLKSOURCE_HCLK,
            RCC_ADCDACCLKSOURCE_SYSCLK,
            RCC_ADCDACCLKSOURCE_PLL2R,
            RCC_ADCDACCLKSOURCE_HSE,
            RCC_ADCDACCLKSOURCE_HSI,
            RCC_ADCDACCLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCDACSEL {
                return switch (self) {
                    .RCC_ADCDACCLKSOURCE_CSI => .CSI,
                    .RCC_ADCDACCLKSOURCE_PLL2R => .PLL2_R,
                    .RCC_ADCDACCLKSOURCE_SYSCLK => .SYS,
                    .RCC_ADCDACCLKSOURCE_HSI => .HSI,
                    .RCC_ADCDACCLKSOURCE_HCLK => .HCLK2,
                    .RCC_ADCDACCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_ADCDACSEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_ADCDACCLKSOURCE_CSI,
                    .PLL2_R => .RCC_ADCDACCLKSOURCE_PLL2R,
                    .SYS => .RCC_ADCDACCLKSOURCE_SYSCLK,
                    .HSI => .RCC_ADCDACCLKSOURCE_HSI,
                    .HCLK2 => .RCC_ADCDACCLKSOURCE_HCLK,
                    .HSE => .RCC_ADCDACCLKSOURCE_HSE,
                };
            }
        };

        pub const USBCLockSelectionList = enum {
            RCC_USBCLKSOURCE_PLL2Q,
            RCC_USBCLKSOURCE_PLL1Q,
            RCC_USBCLKSOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_USBSEL {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL1Q => .PLL1_Q,
                    .RCC_USBCLKSOURCE_HSI48 => .HSI48,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "USBCLockSelection", @tagName(self), "RCC_USBSEL" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_USBSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_USBCLKSOURCE_PLL1Q,
                    .HSI48 => .RCC_USBCLKSOURCE_HSI48,
                };
            }
        };

        pub const FDCANClockSelectionList = enum {
            RCC_FDCANCLKSOURCE_PLL1Q,
            RCC_FDCANCLKSOURCE_PLL2Q,
            RCC_FDCANCLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_FDCANSEL {
                return switch (self) {
                    .RCC_FDCANCLKSOURCE_PLL2Q => .PLL2_Q,
                    .RCC_FDCANCLKSOURCE_HSE => .HSE,
                    .RCC_FDCANCLKSOURCE_PLL1Q => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_FDCANSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_FDCANCLKSOURCE_PLL2Q,
                    .HSE => .RCC_FDCANCLKSOURCE_HSE,
                    .PLL1_Q => .RCC_FDCANCLKSOURCE_PLL1Q,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
            RCC_I2C1CLKSOURCE_PCLK1,
            RCC_I2C1CLKSOURCE_PLL2R,
            RCC_I2C1CLKSOURCE_HSI,
            RCC_I2C1CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                    .RCC_I2C1CLKSOURCE_CSI => .CSI,
                    .RCC_I2C1CLKSOURCE_PLL2R => .PLL3_R,
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
                    .CSI => .RCC_I2C1CLKSOURCE_CSI,
                    .PLL3_R => .RCC_I2C1CLKSOURCE_PLL2R,
                    .PCLK1 => .RCC_I2C1CLKSOURCE_PCLK1,
                };
            }
        };

        pub const I2C2CLockSelectionList = enum {
            RCC_I2C2CLKSOURCE_PCLK1,
            RCC_I2C2CLKSOURCE_PLL2R,
            RCC_I2C2CLKSOURCE_HSI,
            RCC_I2C2CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_PLL2R => .PLL3_R,
                    .RCC_I2C2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                    .RCC_I2C2CLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_R => .RCC_I2C2CLKSOURCE_PLL2R,
                    .PCLK1 => .RCC_I2C2CLKSOURCE_PCLK1,
                    .HSI => .RCC_I2C2CLKSOURCE_HSI,
                    .CSI => .RCC_I2C2CLKSOURCE_CSI,
                };
            }
        };

        pub const I3C2CLockSelectionList = enum {
            RCC_I3C2CLKSOURCE_PCLK3,
            RCC_I3C2CLKSOURCE_PLL2R,
            RCC_I3C2CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I3C2SEL {
                return switch (self) {
                    .RCC_I3C2CLKSOURCE_PLL2R => .PLL3_R,
                    .RCC_I3C2CLKSOURCE_PCLK3 => .PCLK3,
                    .RCC_I3C2CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I3C2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_R => .RCC_I3C2CLKSOURCE_PLL2R,
                    .PCLK3 => .RCC_I3C2CLKSOURCE_PCLK3,
                    .HSI => .RCC_I3C2CLKSOURCE_HSI,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_I3C2SEL", @tagName(item), "I3C2CLockSelection" },
                    ),
                };
            }
        };

        pub const I3C1CLockSelectionList = enum {
            RCC_I3C1CLKSOURCE_PCLK1,
            RCC_I3C1CLKSOURCE_PLL2R,
            RCC_I3C1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I3C1CLKSOURCE_HSI => .HSI,
                    .RCC_I3C1CLKSOURCE_PLL2R => .PLL3_R,
                    .RCC_I3C1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I3C1CLKSOURCE_HSI,
                    .PLL3_R => .RCC_I3C1CLKSOURCE_PLL2R,
                    .PCLK1 => .RCC_I3C1CLKSOURCE_PCLK1,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_I2CSEL", @tagName(item), "I3C1CLockSelection" },
                    ),
                };
            }
        };

        pub const RNGCLockSelectionList = enum {
            RCC_RNGCLKSOURCE_HSI48,
            RCC_RNGCLKSOURCE_PLL1Q,
            RCC_RNGCLKSOURCE_LSE,
            RCC_RNGCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_RNGSEL {
                return switch (self) {
                    .RCC_RNGCLKSOURCE_HSI48 => .HSI48,
                    .RCC_RNGCLKSOURCE_LSI => .LSI,
                    .RCC_RNGCLKSOURCE_PLL1Q => .PLL1_Q,
                    .RCC_RNGCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RNGSEL) anyerror!@This() {
                return switch (item) {
                    .HSI48 => .RCC_RNGCLKSOURCE_HSI48,
                    .LSI => .RCC_RNGCLKSOURCE_LSI,
                    .PLL1_Q => .RCC_RNGCLKSOURCE_PLL1Q,
                    .LSE => .RCC_RNGCLKSOURCE_LSE,
                };
            }
        };

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_PLL1Q,
            RCC_MCO1SOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_MCO1SEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                    .RCC_MCO1SOURCE_PLL1Q => .PLL1_Q,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_MCO1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
                    .PLL1_Q => .RCC_MCO1SOURCE_PLL1Q,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                };
            }
        };

        pub const RCC_MCODivList = enum {
            RCC_MCODIV_1,
            RCC_MCODIV_2,
            RCC_MCODIV_3,
            RCC_MCODIV_4,
            RCC_MCODIV_5,
            RCC_MCODIV_6,
            RCC_MCODIV_7,
            RCC_MCODIV_8,
            RCC_MCODIV_9,
            RCC_MCODIV_10,
            RCC_MCODIV_11,
            RCC_MCODIV_12,
            RCC_MCODIV_13,
            RCC_MCODIV_14,
            RCC_MCODIV_15,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCODIV_12 => .Div12,
                    .RCC_MCODIV_11 => .Div11,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_7 => .Div7,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_5 => .Div5,
                    .RCC_MCODIV_9 => .Div9,
                    .RCC_MCODIV_13 => .Div13,
                    .RCC_MCODIV_14 => .Div14,
                    .RCC_MCODIV_15 => .Div15,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_6 => .Div6,
                    .RCC_MCODIV_3 => .Div3,
                    .RCC_MCODIV_10 => .Div10,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div12 => .RCC_MCODIV_12,
                    .Div11 => .RCC_MCODIV_11,
                    .Div1 => .RCC_MCODIV_1,
                    .Div4 => .RCC_MCODIV_4,
                    .Div7 => .RCC_MCODIV_7,
                    .Div2 => .RCC_MCODIV_2,
                    .Div5 => .RCC_MCODIV_5,
                    .Div9 => .RCC_MCODIV_9,
                    .Div13 => .RCC_MCODIV_13,
                    .Div14 => .RCC_MCODIV_14,
                    .Div15 => .RCC_MCODIV_15,
                    .Div8 => .RCC_MCODIV_8,
                    .Div6 => .RCC_MCODIV_6,
                    .Div3 => .RCC_MCODIV_3,
                    .Div10 => .RCC_MCODIV_10,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCODIV_1 => 1,
                    .RCC_MCODIV_2 => 2,
                    .RCC_MCODIV_3 => 3,
                    .RCC_MCODIV_4 => 4,
                    .RCC_MCODIV_5 => 5,
                    .RCC_MCODIV_6 => 6,
                    .RCC_MCODIV_7 => 7,
                    .RCC_MCODIV_8 => 8,
                    .RCC_MCODIV_9 => 9,
                    .RCC_MCODIV_10 => 10,
                    .RCC_MCODIV_11 => 11,
                    .RCC_MCODIV_12 => 12,
                    .RCC_MCODIV_13 => 13,
                    .RCC_MCODIV_14 => 14,
                    .RCC_MCODIV_15 => 15,
                };
            }
        };

        pub const RCC_MCO2SourceList = enum {
            RCC_MCO2SOURCE_LSI,
            RCC_MCO2SOURCE_HSE,
            RCC_MCO2SOURCE_CSI,
            RCC_MCO2SOURCE_PLL1P,
            RCC_MCO2SOURCE_PLL2P,
            RCC_MCO2SOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_MCO2SEL {
                return switch (self) {
                    .RCC_MCO2SOURCE_PLL1P => .PLL1_P,
                    .RCC_MCO2SOURCE_PLL2P => .PLL2_P,
                    .RCC_MCO2SOURCE_LSI => .LSI,
                    .RCC_MCO2SOURCE_HSE => .HSE,
                    .RCC_MCO2SOURCE_SYSCLK => .SYS,
                    .RCC_MCO2SOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_MCO2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_MCO2SOURCE_PLL1P,
                    .PLL2_P => .RCC_MCO2SOURCE_PLL2P,
                    .LSI => .RCC_MCO2SOURCE_LSI,
                    .HSE => .RCC_MCO2SOURCE_HSE,
                    .SYS => .RCC_MCO2SOURCE_SYSCLK,
                    .CSI => .RCC_MCO2SOURCE_CSI,
                };
            }
        };

        pub const RCC_MCO2DivList = enum {
            RCC_MCODIV_1,
            RCC_MCODIV_2,
            RCC_MCODIV_3,
            RCC_MCODIV_4,
            RCC_MCODIV_5,
            RCC_MCODIV_6,
            RCC_MCODIV_7,
            RCC_MCODIV_8,
            RCC_MCODIV_9,
            RCC_MCODIV_10,
            RCC_MCODIV_11,
            RCC_MCODIV_12,
            RCC_MCODIV_13,
            RCC_MCODIV_14,
            RCC_MCODIV_15,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCODIV_12 => .Div12,
                    .RCC_MCODIV_11 => .Div11,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_7 => .Div7,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_5 => .Div5,
                    .RCC_MCODIV_9 => .Div9,
                    .RCC_MCODIV_13 => .Div13,
                    .RCC_MCODIV_14 => .Div14,
                    .RCC_MCODIV_15 => .Div15,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_6 => .Div6,
                    .RCC_MCODIV_3 => .Div3,
                    .RCC_MCODIV_10 => .Div10,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div12 => .RCC_MCODIV_12,
                    .Div11 => .RCC_MCODIV_11,
                    .Div1 => .RCC_MCODIV_1,
                    .Div4 => .RCC_MCODIV_4,
                    .Div7 => .RCC_MCODIV_7,
                    .Div2 => .RCC_MCODIV_2,
                    .Div5 => .RCC_MCODIV_5,
                    .Div9 => .RCC_MCODIV_9,
                    .Div13 => .RCC_MCODIV_13,
                    .Div14 => .RCC_MCODIV_14,
                    .Div15 => .RCC_MCODIV_15,
                    .Div8 => .RCC_MCODIV_8,
                    .Div6 => .RCC_MCODIV_6,
                    .Div3 => .RCC_MCODIV_3,
                    .Div10 => .RCC_MCODIV_10,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCODIV_1 => 1,
                    .RCC_MCODIV_2 => 2,
                    .RCC_MCODIV_3 => 3,
                    .RCC_MCODIV_4 => 4,
                    .RCC_MCODIV_5 => 5,
                    .RCC_MCODIV_6 => 6,
                    .RCC_MCODIV_7 => 7,
                    .RCC_MCODIV_8 => 8,
                    .RCC_MCODIV_9 => 9,
                    .RCC_MCODIV_10 => 10,
                    .RCC_MCODIV_11 => 11,
                    .RCC_MCODIV_12 => 12,
                    .RCC_MCODIV_13 => 13,
                    .RCC_MCODIV_14 => 14,
                    .RCC_MCODIV_15 => 15,
                };
            }
        };

        pub const LSCOSource1List = enum {
            RCC_LSCOSOURCE_LSI,
            RCC_LSCOSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LSCOSEL {
                return switch (self) {
                    .RCC_LSCOSOURCE_LSE => .LSE,
                    .RCC_LSCOSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_LSCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LSCOSOURCE_LSE,
                    .LSI => .RCC_LSCOSOURCE_LSI,
                };
            }
        };

        pub const CKPERSourceSelectionList = enum {
            RCC_CLKPSOURCE_HSI,
            RCC_CLKPSOURCE_CSI,
            RCC_CLKPSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PERSEL {
                return switch (self) {
                    .RCC_CLKPSOURCE_HSI => .HSI,
                    .RCC_CLKPSOURCE_CSI => .CSI,
                    .RCC_CLKPSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_PERSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_CLKPSOURCE_HSI,
                    .CSI => .RCC_CLKPSOURCE_CSI,
                    .HSE => .RCC_CLKPSOURCE_HSE,
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

        pub const CortexCLockSelectionList = enum {
            SYSTICK_CLKSOURCE_HCLK_1_8,
            SYSTICK_CLKSOURCE_LSE,
            SYSTICK_CLKSOURCE_LSI,
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

        pub const APB3CLKDividerList = enum {
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

        pub const SPI1CLockSelectionList = enum {
            RCC_SPI1CLKSOURCE_PLL1Q,
            RCC_SPI1CLKSOURCE_PLL2P,
            RCC_SPI1CLKSOURCE_PIN,
            RCC_SPI1CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SPISEL {
                return switch (self) {
                    .RCC_SPI1CLKSOURCE_PIN => .AUDIOCLK,
                    .RCC_SPI1CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_SPI1CLKSOURCE_CLKP => .PER,
                    .RCC_SPI1CLKSOURCE_PLL1Q => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_SPISEL) anyerror!@This() {
                return switch (item) {
                    .AUDIOCLK => .RCC_SPI1CLKSOURCE_PIN,
                    .PLL2_P => .RCC_SPI1CLKSOURCE_PLL2P,
                    .PER => .RCC_SPI1CLKSOURCE_CLKP,
                    .PLL1_Q => .RCC_SPI1CLKSOURCE_PLL1Q,
                };
            }
        };

        pub const SPI3CLockSelectionList = enum {
            RCC_SPI3CLKSOURCE_PLL1Q,
            RCC_SPI3CLKSOURCE_PLL2P,
            RCC_SPI3CLKSOURCE_PIN,
            RCC_SPI3CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SPISEL {
                return switch (self) {
                    .RCC_SPI3CLKSOURCE_PIN => .PER,
                    .RCC_SPI3CLKSOURCE_CLKP => .AUDIOCLK,
                    .RCC_SPI3CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_SPI3CLKSOURCE_PLL1Q => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_SPISEL) anyerror!@This() {
                return switch (item) {
                    .PER => .RCC_SPI3CLKSOURCE_PIN,
                    .AUDIOCLK => .RCC_SPI3CLKSOURCE_CLKP,
                    .PLL2_P => .RCC_SPI3CLKSOURCE_PLL2P,
                    .PLL1_Q => .RCC_SPI3CLKSOURCE_PLL1Q,
                };
            }
        };

        pub const SPI2CLockSelectionList = enum {
            RCC_SPI2CLKSOURCE_PLL1Q,
            RCC_SPI2CLKSOURCE_PLL2P,
            RCC_SPI2CLKSOURCE_PIN,
            RCC_SPI2CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SPISEL {
                return switch (self) {
                    .RCC_SPI2CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_SPI2CLKSOURCE_PLL1Q => .PLL1_Q,
                    .RCC_SPI2CLKSOURCE_CLKP => .PER,
                    .RCC_SPI2CLKSOURCE_PIN => .AUDIOCLK,
                };
            }
            pub fn from_enum(item: RCC_SPISEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_SPI2CLKSOURCE_PLL2P,
                    .PLL1_Q => .RCC_SPI2CLKSOURCE_PLL1Q,
                    .PER => .RCC_SPI2CLKSOURCE_CLKP,
                    .AUDIOCLK => .RCC_SPI2CLKSOURCE_PIN,
                };
            }
        };

        pub const PLL1PList = enum {
            @"2",
            @"4",
            @"6",
            @"8",
            @"10",
            @"12",
            @"14",
            @"16",
            @"18",
            @"20",
            @"22",
            @"24",
            @"26",
            @"28",
            @"30",
            @"32",
            @"34",
            @"36",
            @"38",
            @"40",
            @"42",
            @"44",
            @"46",
            @"48",
            @"50",
            @"52",
            @"54",
            @"56",
            @"58",
            @"60",
            @"62",
            @"64",
            @"66",
            @"68",
            @"70",
            @"72",
            @"74",
            @"76",
            @"78",
            @"80",
            @"82",
            @"84",
            @"86",
            @"88",
            @"90",
            @"92",
            @"94",
            @"96",
            @"98",
            @"100",
            @"102",
            @"104",
            @"106",
            @"108",
            @"110",
            @"112",
            @"114",
            @"116",
            @"118",
            @"120",
            @"122",
            @"124",
            @"126",
            @"128",

            pub fn to_enum(self: @This()) anyerror!RCC_PLLDIV {
                return switch (self) {
                    .@"112" => .Div112,
                    .@"18" => .Div18,
                    .@"56" => .Div56,
                    .@"22" => .Div22,
                    .@"2" => .Div2,
                    .@"52" => .Div52,
                    .@"76" => .Div76,
                    .@"106" => .Div106,
                    .@"116" => .Div116,
                    .@"122" => .Div122,
                    .@"48" => .Div48,
                    .@"16" => .Div16,
                    .@"54" => .Div54,
                    .@"60" => .Div60,
                    .@"90" => .Div90,
                    .@"124" => .Div124,
                    .@"36" => .Div36,
                    .@"88" => .Div88,
                    .@"40" => .Div40,
                    .@"58" => .Div58,
                    .@"108" => .Div108,
                    .@"14" => .Div14,
                    .@"4" => .Div4,
                    .@"34" => .Div34,
                    .@"80" => .Div80,
                    .@"84" => .Div84,
                    .@"78" => .Div78,
                    .@"126" => .Div126,
                    .@"64" => .Div64,
                    .@"98" => .Div98,
                    .@"32" => .Div32,
                    .@"100" => .Div100,
                    .@"120" => .Div120,
                    .@"102" => .Div102,
                    .@"82" => .Div82,
                    .@"50" => .Div50,
                    .@"8" => .Div8,
                    .@"26" => .Div26,
                    .@"42" => .Div42,
                    .@"24" => .Div24,
                    .@"70" => .Div70,
                    .@"92" => .Div92,
                    .@"128" => .Div128,
                    .@"6" => .Div6,
                    .@"110" => .Div110,
                    .@"28" => .Div28,
                    .@"30" => .Div30,
                    .@"114" => .Div114,
                    .@"74" => .Div74,
                    .@"10" => .Div10,
                    .@"72" => .Div72,
                    .@"44" => .Div44,
                    .@"118" => .Div118,
                    .@"20" => .Div20,
                    .@"68" => .Div68,
                    .@"96" => .Div96,
                    .@"86" => .Div86,
                    .@"38" => .Div38,
                    .@"12" => .Div12,
                    .@"46" => .Div46,
                    .@"94" => .Div94,
                    .@"62" => .Div62,
                    .@"66" => .Div66,
                    .@"104" => .Div104,
                };
            }
            pub fn from_enum(item: RCC_PLLDIV) anyerror!@This() {
                return switch (item) {
                    .Div112 => .@"112",
                    .Div18 => .@"18",
                    .Div56 => .@"56",
                    .Div22 => .@"22",
                    .Div2 => .@"2",
                    .Div52 => .@"52",
                    .Div76 => .@"76",
                    .Div106 => .@"106",
                    .Div116 => .@"116",
                    .Div122 => .@"122",
                    .Div48 => .@"48",
                    .Div16 => .@"16",
                    .Div54 => .@"54",
                    .Div60 => .@"60",
                    .Div90 => .@"90",
                    .Div124 => .@"124",
                    .Div36 => .@"36",
                    .Div88 => .@"88",
                    .Div40 => .@"40",
                    .Div58 => .@"58",
                    .Div108 => .@"108",
                    .Div14 => .@"14",
                    .Div4 => .@"4",
                    .Div34 => .@"34",
                    .Div80 => .@"80",
                    .Div84 => .@"84",
                    .Div78 => .@"78",
                    .Div126 => .@"126",
                    .Div64 => .@"64",
                    .Div98 => .@"98",
                    .Div32 => .@"32",
                    .Div100 => .@"100",
                    .Div120 => .@"120",
                    .Div102 => .@"102",
                    .Div82 => .@"82",
                    .Div50 => .@"50",
                    .Div8 => .@"8",
                    .Div26 => .@"26",
                    .Div42 => .@"42",
                    .Div24 => .@"24",
                    .Div70 => .@"70",
                    .Div92 => .@"92",
                    .Div128 => .@"128",
                    .Div6 => .@"6",
                    .Div110 => .@"110",
                    .Div28 => .@"28",
                    .Div30 => .@"30",
                    .Div114 => .@"114",
                    .Div74 => .@"74",
                    .Div10 => .@"10",
                    .Div72 => .@"72",
                    .Div44 => .@"44",
                    .Div118 => .@"118",
                    .Div20 => .@"20",
                    .Div68 => .@"68",
                    .Div96 => .@"96",
                    .Div86 => .@"86",
                    .Div38 => .@"38",
                    .Div12 => .@"12",
                    .Div46 => .@"46",
                    .Div94 => .@"94",
                    .Div62 => .@"62",
                    .Div66 => .@"66",
                    .Div104 => .@"104",
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLDIV", @tagName(item), "PLL1P" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .@"2" => 2,
                    .@"4" => 4,
                    .@"6" => 6,
                    .@"8" => 8,
                    .@"10" => 10,
                    .@"12" => 12,
                    .@"14" => 14,
                    .@"16" => 16,
                    .@"18" => 18,
                    .@"20" => 20,
                    .@"22" => 22,
                    .@"24" => 24,
                    .@"26" => 26,
                    .@"28" => 28,
                    .@"30" => 30,
                    .@"32" => 32,
                    .@"34" => 34,
                    .@"36" => 36,
                    .@"38" => 38,
                    .@"40" => 40,
                    .@"42" => 42,
                    .@"44" => 44,
                    .@"46" => 46,
                    .@"48" => 48,
                    .@"50" => 50,
                    .@"52" => 52,
                    .@"54" => 54,
                    .@"56" => 56,
                    .@"58" => 58,
                    .@"60" => 60,
                    .@"62" => 62,
                    .@"64" => 64,
                    .@"66" => 66,
                    .@"68" => 68,
                    .@"70" => 70,
                    .@"72" => 72,
                    .@"74" => 74,
                    .@"76" => 76,
                    .@"78" => 78,
                    .@"80" => 80,
                    .@"82" => 82,
                    .@"84" => 84,
                    .@"86" => 86,
                    .@"88" => 88,
                    .@"90" => 90,
                    .@"92" => 92,
                    .@"94" => 94,
                    .@"96" => 96,
                    .@"98" => 98,
                    .@"100" => 100,
                    .@"102" => 102,
                    .@"104" => 104,
                    .@"106" => 106,
                    .@"108" => 108,
                    .@"110" => 110,
                    .@"112" => 112,
                    .@"114" => 114,
                    .@"116" => 116,
                    .@"118" => 118,
                    .@"120" => 120,
                    .@"122" => 122,
                    .@"124" => 124,
                    .@"126" => 126,
                    .@"128" => 128,
                };
            }
        };

        pub const FLatencyList = enum {
            FLASH_LATENCY_0,
            FLASH_LATENCY_1,
            FLASH_LATENCY_2,
            FLASH_LATENCY_3,
            FLASH_LATENCY_4,
            FLASH_LATENCY_5,
        };

        pub const Flash_DelayList = enum {
            FLASH_PROGRAMMING_DELAY_0,
            FLASH_PROGRAMMING_DELAY_1,
            FLASH_PROGRAMMING_DELAY_2,
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE3,
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE0,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .Scale2,
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .Scale1,
                    .PWR_REGULATOR_VOLTAGE_SCALE0 => .Scale3,
                    .PWR_REGULATOR_VOLTAGE_SCALE3 => .Scale0,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .Scale2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .Scale1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .Scale3 => .PWR_REGULATOR_VOLTAGE_SCALE0,
                    .Scale0 => .PWR_REGULATOR_VOLTAGE_SCALE3,
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

        pub const PLL1_VCI_RangeList = enum {
            RCC_PLL1_VCIRANGE_0,
            RCC_PLL1_VCIRANGE_1,
            RCC_PLL1_VCIRANGE_2,
            RCC_PLL1_VCIRANGE_3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL1_VCIRANGE_1 => .Range2,
                    .RCC_PLL1_VCIRANGE_0 => .Range1,
                    .RCC_PLL1_VCIRANGE_3 => .Range8,
                    .RCC_PLL1_VCIRANGE_2 => .Range4,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range2 => .RCC_PLL1_VCIRANGE_1,
                    .Range1 => .RCC_PLL1_VCIRANGE_0,
                    .Range8 => .RCC_PLL1_VCIRANGE_3,
                    .Range4 => .RCC_PLL1_VCIRANGE_2,
                };
            }
        };

        pub const PLL2_VCI_RangeList = enum {
            RCC_PLL2_VCIRANGE_0,
            RCC_PLL2_VCIRANGE_1,
            RCC_PLL2_VCIRANGE_2,
            RCC_PLL2_VCIRANGE_3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL2_VCIRANGE_3 => .Range8,
                    .RCC_PLL2_VCIRANGE_1 => .Range2,
                    .RCC_PLL2_VCIRANGE_0 => .Range1,
                    .RCC_PLL2_VCIRANGE_2 => .Range4,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range8 => .RCC_PLL2_VCIRANGE_3,
                    .Range2 => .RCC_PLL2_VCIRANGE_1,
                    .Range1 => .RCC_PLL2_VCIRANGE_0,
                    .Range4 => .RCC_PLL2_VCIRANGE_2,
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

        pub const LSIEnableList = enum {
            true,
        };

        pub const EnableExtClockForSAI1List = enum {
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

        pub const DACEnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const FDCANEnableList = enum {
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

        pub const I3C2EnableList = enum {
            true,
            false,
        };

        pub const I3C1EnableList = enum {
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

        pub const CKPEREnableList = enum {
            true,
            false,
        };

        pub const SystickEnableList = enum {
            true,
            false,
        };

        pub const UCPDEnableList = enum {
            true,
            false,
        };

        pub const SPI1EnableList = enum {
            true,
            false,
        };

        pub const SPI3EnableList = enum {
            true,
            false,
        };

        pub const SPI2EnableList = enum {
            true,
            false,
        };

        pub const RCC_TIM_PRescaler_SelectionList = enum {
            RCC_TIMPRES_ACTIVATED,
            RCC_TIMPRES_DESACTIVATED,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMPRE {
                return switch (self) {
                    .RCC_TIMPRES_ACTIVATED => .DefaultX4,
                    .RCC_TIMPRES_DESACTIVATED => .DefaultX2,
                };
            }
            pub fn from_enum(item: RCC_TIMPRE) anyerror!@This() {
                return switch (item) {
                    .DefaultX4 => .RCC_TIMPRES_ACTIVATED,
                    .DefaultX2 => .RCC_TIMPRES_DESACTIVATED,
                };
            }
        };

        pub const EnableCSSLSEList = enum {
            true,
            false,
        };

        pub const EnbaleCSSList = enum {
            true,
            false,
        };

        pub const PLL1_VCO_SELList = enum {
            RCC_PLL1_VCORANGE_MEDIUM,
            RCC_PLL1_VCORANGE_WIDE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL1_VCORANGE_WIDE => .WideVCO,
                    .RCC_PLL1_VCORANGE_MEDIUM => .MediumVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .WideVCO => .RCC_PLL1_VCORANGE_WIDE,
                    .MediumVCO => .RCC_PLL1_VCORANGE_MEDIUM,
                };
            }
        };

        pub const PLL2_VCO_SELList = enum {
            RCC_PLL2_VCORANGE_MEDIUM,
            RCC_PLL2_VCORANGE_WIDE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL2_VCORANGE_WIDE => .WideVCO,
                    .RCC_PLL2_VCORANGE_MEDIUM => .MediumVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .WideVCO => .RCC_PLL2_VCORANGE_WIDE,
                    .MediumVCO => .RCC_PLL2_VCORANGE_MEDIUM,
                };
            }
        };

        //=======ClockTree Flags========

        pub const Flags = struct {
            RCC_TZ_PRIV: bool = false,
            RMVF_SEC: bool = false,
            HSEByPass: bool = false,
            HSEDIGByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEDIGByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            MCO2Config: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            RNGUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I3C2Used_ForRCC: bool = false,
            I3C1Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            DAC1_Used: bool = false,
            ADC1_Used: bool = false,
            ADC2_Used: bool = false,
            EnableCSS: bool = false,
            UCPD_Used: bool = false,
            OCTOSPI1_Used: bool = false,
            LPTIM2_Used: bool = false,
            HDMI_CEC_Used: bool = false,
            USB_Used: bool = false,
            SPI1_Used: bool = false,
            I2S1_Used: bool = false,
            SPI2_Used: bool = false,
            I2S2_Used: bool = false,
            SPI3_Used: bool = false,
            I2S3_Used: bool = false,
            LPTIM1_Used: bool = false,
            ETH_Used: bool = false,
            SDMMC1_Used: bool = false,
            SDMMC2_Used: bool = false,
            FDCAN1_Used: bool = false,
            OCTOSPI2_Used: bool = false,
            RNG_Used: bool = false,
            USART1_Used: bool = false,
            USART2_Used: bool = false,
            USART3_Used: bool = false,
            LPUART1_Used: bool = false,
            I3C2_Used: bool = false,
            I3C1_Used: bool = false,
            I2C2_Used: bool = false,
            I2C1_Used: bool = false,
            DAC2_Used: bool = false,
            TIM12_Used: bool = false,
            TIM15_Used: bool = false,
            RCC_PLL1VCIRANGE_0: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            Semaphore_input_Channel1TIM15: bool = false,
            Semaphore_input_Channel1TIM12: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            Systick_External: bool = false,
            RCC_HCLK_DIV1: bool = false,
            RCC_TIMPRES_DESACTIVATED: bool = false,
            RCC_TIMPRES_ACTIVATED: bool = false,
            RCC_HCLK_DIV2: bool = false,
            RCC_HCLK_DIV4: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            TIM15: bool = true,
            Semaphore_input_Channel1_directTIM15: bool = false,
            RCC_PLL1_VCIRANGE_0: bool = false,
            TIM2: bool = false,
            RCC_PLL2_VCIRANGE_0: bool = false,
            OCTOSPI_PLL2R: bool = false,
            FLASH_LATENCY_0: bool = false,
            FLASH_LATENCY_1: bool = false,
            FLASH_LATENCY_2: bool = false,
            FLASH_LATENCY_3: bool = false,
            FLASH_LATENCY_4: bool = false,
            FLASH_LATENCY_5: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            CEC_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            TIM16: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            TIM17: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            SDMMC2_PLL2: bool = false,
            SDMMC1_PLL2: bool = false,
            SDMMC1SourceIsPllQ: bool = false,
            SDMMC2SourceIsPllQ: bool = false,
            OCTOSPI_PLL1Q: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            RCC_TZ_PRIV: bool = false,
            RMVF_SEC: bool = false,
            HSEByPass: bool = false,
            HSEDIGByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEDIGByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            MCO2Config: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            RNGUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            LCDUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I3C2Used_ForRCC: bool = false,
            I3C1Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            DAC1_Used: bool = false,
            ADC1_Used: bool = false,
            ADC2_Used: bool = false,
            EnableCSS: bool = false,
            UCPD_Used: bool = false,
            OCTOSPI1_Used: bool = false,
            LPTIM2_Used: bool = false,
            HDMI_CEC_Used: bool = false,
            USB_Used: bool = false,
            SPI1_Used: bool = false,
            I2S1_Used: bool = false,
            SPI2_Used: bool = false,
            I2S2_Used: bool = false,
            SPI3_Used: bool = false,
            I2S3_Used: bool = false,
            LPTIM1_Used: bool = false,
            ETH_Used: bool = false,
            SDMMC1_Used: bool = false,
            SDMMC2_Used: bool = false,
            FDCAN1_Used: bool = false,
            OCTOSPI2_Used: bool = false,
            RNG_Used: bool = false,
            USART1_Used: bool = false,
            USART2_Used: bool = false,
            USART3_Used: bool = false,
            LPUART1_Used: bool = false,
            I3C2_Used: bool = false,
            I3C1_Used: bool = false,
            I2C2_Used: bool = false,
            I2C1_Used: bool = false,
            DAC2_Used: bool = false,
            TIM12_Used: bool = false,
            TIM15_Used: bool = false,
            RCC_PLL1VCIRANGE_0: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            RCC_MCO1SOURCE_HSI48: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            Semaphore_input_Channel1TIM15: bool = false,
            Semaphore_input_Channel1TIM12: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            Systick_External: bool = false,
            RCC_HCLK_DIV1: bool = false,
            RCC_TIMPRES_DESACTIVATED: bool = false,
            RCC_TIMPRES_ACTIVATED: bool = false,
            RCC_HCLK_DIV2: bool = false,
            RCC_HCLK_DIV4: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            TIM15: bool = true,
            Semaphore_input_Channel1_directTIM15: bool = false,
            RCC_PLL1_VCIRANGE_0: bool = false,
            TIM2: bool = false,
            RCC_PLL2_VCIRANGE_0: bool = false,
            OCTOSPI_PLL2R: bool = false,
            FLASH_LATENCY_0: bool = false,
            FLASH_LATENCY_1: bool = false,
            FLASH_LATENCY_2: bool = false,
            FLASH_LATENCY_3: bool = false,
            FLASH_LATENCY_4: bool = false,
            FLASH_LATENCY_5: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            CEC_LSE: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            TIM16: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            TIM17: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            SDMMC2_PLL2: bool = false,
            SDMMC1_PLL2: bool = false,
            SDMMC1SourceIsPllQ: bool = false,
            SDMMC2SourceIsPllQ: bool = false,
            OCTOSPI_PLL1Q: bool = false,
            EnableCRS: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            LSIEnable: bool = false, //Reference flag
            EnableExtClockForSAI1: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            EnableHSELCDDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            DACEnable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            FDCANEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            I3C2Enable: bool = false, //Reference flag
            I3C1Enable: bool = false, //Reference flag
            MCO2Enable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            CKPEREnable: bool = false, //Reference flag
            SystickEnable: bool = false, //Reference flag
            UCPDEnable: bool = false, //Reference flag
            SPI1Enable: bool = false, //Reference flag
            SPI3Enable: bool = false, //Reference flag
            SPI2Enable: bool = false, //Reference flag
            PLL1QUsed: bool = false, //Reference flag
            PLL2PUsed: bool = false, //Reference flag
            PLL2QUsed: bool = false, //Reference flag
            PLL2RUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            PLL2Used: bool = false, //Reference flag
            PLL1PUsed: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag
            HSI48Used: bool = false, //Reference flag
            false: bool = false, //Node enable flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            HSICalibrationValue: ?u32 = null,
            CSICalibrationValue: ?u32 = null,
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
            RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSIDiv: ?HSIDivList = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLL2Source: ?PLL2SourceList = null,
            PLLM: ?u32 = null,
            PLL2M: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            USART2CLockSelection: ?USART2CLockSelectionList = null,
            USART3CLockSelection: ?USART3CLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            LPTIM2CLockSelection: ?LPTIM2CLockSelectionList = null,
            DACLowPowerCLockSelection: ?DACLowPowerCLockSelectionList = null,
            ADCCLockSelection: ?ADCCLockSelectionList = null,
            USBCLockSelection: ?USBCLockSelectionList = null,
            FDCANClockSelection: ?FDCANClockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C2CLockSelection: ?I2C2CLockSelectionList = null,
            I3C2CLockSelection: ?I3C2CLockSelectionList = null,
            I3C1CLockSelection: ?I3C1CLockSelectionList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            RCC_MCO2Source: ?RCC_MCO2SourceList = null,
            RCC_MCO2Div: ?RCC_MCO2DivList = null,
            LSCOSource1: ?LSCOSource1List = null,
            CKPERSourceSelection: ?CKPERSourceSelectionList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            CortexCLockSelection: ?CortexCLockSelectionList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            APB3CLKDivider: ?APB3CLKDividerList = null,
            SPI1CLockSelection: ?SPI1CLockSelectionList = null,
            SPI3CLockSelection: ?SPI3CLockSelectionList = null,
            SPI2CLockSelection: ?SPI2CLockSelectionList = null,
            PLLN: ?u32 = null,
            PLLFRACN: ?u32 = null,
            PLL1P: ?PLL1PList = null,
            PLL1Q: ?u32 = null,
            PLL1R: ?u32 = null,
            PLL2N: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            PLL2P: ?u32 = null,
            PLL2Q: ?u32 = null,
            PLL2R: ?u32 = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDiv: HSIDivList,
            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLL2Source: PLL2SourceList,
            PLLM: u32,
            PLL2M: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            USART2CLockSelection: USART2CLockSelectionList,
            USART3CLockSelection: USART3CLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            LPTIM2CLockSelection: LPTIM2CLockSelectionList,
            DACLowPowerCLockSelection: DACLowPowerCLockSelectionList,
            ADCCLockSelection: ADCCLockSelectionList,
            USBCLockSelection: USBCLockSelectionList,
            FDCANClockSelection: FDCANClockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C2CLockSelection: I2C2CLockSelectionList,
            I3C2CLockSelection: I3C2CLockSelectionList,
            I3C1CLockSelection: I3C1CLockSelectionList,
            RNGCLockSelection: RNGCLockSelectionList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv: RCC_MCODivList,
            RCC_MCO2Source: RCC_MCO2SourceList,
            RCC_MCO2Div: RCC_MCO2DivList,
            LSCOSource1: LSCOSource1List,
            CKPERSourceSelection: CKPERSourceSelectionList,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: Cortex_DivList,
            CortexCLockSelection: CortexCLockSelectionList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB3CLKDivider: APB3CLKDividerList,
            APB2TimCLKDivider: u32,
            hsidivToUCPD: u32,
            SPI1CLockSelection: SPI1CLockSelectionList,
            SPI3CLockSelection: SPI3CLockSelectionList,
            SPI2CLockSelection: SPI2CLockSelectionList,
            PLLN: u32,
            PLL1P: PLL1PList,
            PLL1Q: u32,
            PLL1R: u32,
            PLL2N: u32,
            PLL2P: u32,
            PLL2Q: u32,
            PLL2R: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            Flash_Delay: ?Flash_DelayList,
            HSICalibrationValue: u32,
            CSICalibrationValue: u32,
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
            PLL1_VCI_Range: PLL1_VCI_RangeList,
            PLL2_VCI_Range: PLL2_VCI_RangeList,
            RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionList,
            LSEUsed: u32,
            HSIUsed: u32,
            PLL1_VCO_SEL: PLL1_VCO_SELList,
            PLL2_VCO_SEL: PLL2_VCO_SELList,
            PLL1RUsed: u32,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            HSICalibrationValue: ?u32 = null,
            CSICalibrationValue: ?u32 = null,
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
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            RCC_TIM_PRescaler_Selection: ?RCC_TIMPRE = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .CSICalibrationValue = self.CSICalibrationValue,
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
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .RCC_TIM_PRescaler_Selection = if (self.RCC_TIM_PRescaler_Selection) |val| try RCC_TIM_PRescaler_SelectionList.from_enum(val) else null,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSIDiv: ?RCC_HSIDIV = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLL2Source: ?RCC_PLLSRC = null,
            PLLM: ?u32 = null,
            PLL2M: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelection: ?RCC_USART1SEL = null,
            USART2CLockSelection: ?RCC_USARTSEL = null,
            USART3CLockSelection: ?RCC_USARTSEL = null,
            LPUART1CLockSelection: ?RCC_LPUARTSEL = null,
            LPTIM1CLockSelection: ?RCC_LPTIM1SEL = null,
            LPTIM2CLockSelection: ?RCC_LPTIM2SEL = null,
            DACLowPowerCLockSelection: ?RCC_LSCOSEL = null,
            ADCCLockSelection: ?RCC_ADCDACSEL = null,
            USBCLockSelection: ?RCC_USBSEL = null,
            FDCANClockSelection: ?RCC_FDCANSEL = null,
            I2C1CLockSelection: ?RCC_I2CSEL = null,
            I2C2CLockSelection: ?RCC_I2CSEL = null,
            I3C2CLockSelection: ?RCC_I3C2SEL = null,
            I3C1CLockSelection: ?RCC_I2CSEL = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            RCC_MCO1Source: ?RCC_MCO1SEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            RCC_MCO2Source: ?RCC_MCO2SEL = null,
            RCC_MCO2Div: ?RCC_MCOPRE = null,
            LSCOSource1: ?RCC_LSCOSEL = null,
            CKPERSourceSelection: ?RCC_PERSEL = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            CortexCLockSelection: ?CortexCLockSelectionList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            APB3CLKDivider: ?RCC_PPRE = null,
            SPI1CLockSelection: ?RCC_SPISEL = null,
            SPI3CLockSelection: ?RCC_SPISEL = null,
            SPI2CLockSelection: ?RCC_SPISEL = null,
            PLLN: ?u32 = null,
            PLLFRACN: ?u32 = null,
            PLL1P: ?RCC_PLLDIV = null,
            PLL1Q: ?u32 = null,
            PLL1R: ?u32 = null,
            PLL2N: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            PLL2P: ?u32 = null,
            PLL2Q: ?u32 = null,
            PLL2R: ?u32 = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSIDiv = if (self.HSIDiv) |val| try HSIDivList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSI_VALUE = self.LSI_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLL2Source = if (self.PLL2Source) |val| try PLL2SourceList.from_enum(val) else null,
                    .PLLM = self.PLLM,
                    .PLL2M = self.PLL2M,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .USART2CLockSelection = if (self.USART2CLockSelection) |val| try USART2CLockSelectionList.from_enum(val) else null,
                    .USART3CLockSelection = if (self.USART3CLockSelection) |val| try USART3CLockSelectionList.from_enum(val) else null,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .LPTIM2CLockSelection = if (self.LPTIM2CLockSelection) |val| try LPTIM2CLockSelectionList.from_enum(val) else null,
                    .DACLowPowerCLockSelection = if (self.DACLowPowerCLockSelection) |val| try DACLowPowerCLockSelectionList.from_enum(val) else null,
                    .ADCCLockSelection = if (self.ADCCLockSelection) |val| try ADCCLockSelectionList.from_enum(val) else null,
                    .USBCLockSelection = if (self.USBCLockSelection) |val| try USBCLockSelectionList.from_enum(val) else null,
                    .FDCANClockSelection = if (self.FDCANClockSelection) |val| try FDCANClockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C2CLockSelection = if (self.I2C2CLockSelection) |val| try I2C2CLockSelectionList.from_enum(val) else null,
                    .I3C2CLockSelection = if (self.I3C2CLockSelection) |val| try I3C2CLockSelectionList.from_enum(val) else null,
                    .I3C1CLockSelection = if (self.I3C1CLockSelection) |val| try I3C1CLockSelectionList.from_enum(val) else null,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .RCC_MCO2Source = if (self.RCC_MCO2Source) |val| try RCC_MCO2SourceList.from_enum(val) else null,
                    .RCC_MCO2Div = if (self.RCC_MCO2Div) |val| try RCC_MCO2DivList.from_enum(val) else null,
                    .LSCOSource1 = if (self.LSCOSource1) |val| try LSCOSource1List.from_enum(val) else null,
                    .CKPERSourceSelection = if (self.CKPERSourceSelection) |val| try CKPERSourceSelectionList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .CortexCLockSelection = self.CortexCLockSelection,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .APB3CLKDivider = if (self.APB3CLKDivider) |val| try APB3CLKDividerList.from_enum(val) else null,
                    .SPI1CLockSelection = if (self.SPI1CLockSelection) |val| try SPI1CLockSelectionList.from_enum(val) else null,
                    .SPI3CLockSelection = if (self.SPI3CLockSelection) |val| try SPI3CLockSelectionList.from_enum(val) else null,
                    .SPI2CLockSelection = if (self.SPI2CLockSelection) |val| try SPI2CLockSelectionList.from_enum(val) else null,
                    .PLLN = self.PLLN,
                    .PLLFRACN = self.PLLFRACN,
                    .PLL1P = if (self.PLL1P) |val| try PLL1PList.from_enum(val) else null,
                    .PLL1Q = self.PLL1Q,
                    .PLL1R = self.PLL1R,
                    .PLL2N = self.PLL2N,
                    .PLL2FRACN = self.PLL2FRACN,
                    .PLL2P = self.PLL2P,
                    .PLL2Q = self.PLL2Q,
                    .PLL2R = self.PLL2R,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDiv: RCC_HSIDIV,
            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLL2Source: RCC_PLLSRC,
            PLLM: u32,
            PLL2M: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelection: RCC_USART1SEL,
            USART2CLockSelection: RCC_USARTSEL,
            USART3CLockSelection: RCC_USARTSEL,
            LPUART1CLockSelection: RCC_LPUARTSEL,
            LPTIM1CLockSelection: RCC_LPTIM1SEL,
            LPTIM2CLockSelection: RCC_LPTIM2SEL,
            DACLowPowerCLockSelection: RCC_LSCOSEL,
            ADCCLockSelection: RCC_ADCDACSEL,
            USBCLockSelection: RCC_USBSEL,
            FDCANClockSelection: RCC_FDCANSEL,
            I2C1CLockSelection: RCC_I2CSEL,
            I2C2CLockSelection: RCC_I2CSEL,
            I3C2CLockSelection: RCC_I3C2SEL,
            I3C1CLockSelection: RCC_I2CSEL,
            RNGCLockSelection: RCC_RNGSEL,
            RCC_MCO1Source: RCC_MCO1SEL,
            RCC_MCODiv: RCC_MCOPRE,
            RCC_MCO2Source: RCC_MCO2SEL,
            RCC_MCO2Div: RCC_MCOPRE,
            LSCOSource1: RCC_LSCOSEL,
            CKPERSourceSelection: RCC_PERSEL,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            CortexCLockSelection: CortexCLockSelectionList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB3CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            hsidivToUCPD: u32,
            SPI1CLockSelection: RCC_SPISEL,
            SPI3CLockSelection: RCC_SPISEL,
            SPI2CLockSelection: RCC_SPISEL,
            PLLN: u32,
            PLL1P: RCC_PLLDIV,
            PLL1Q: u32,
            PLL1R: u32,
            PLL2N: u32,
            PLL2P: u32,
            PLL2Q: u32,
            PLL2R: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            Flash_Delay: ?Flash_DelayList,
            HSICalibrationValue: u32,
            CSICalibrationValue: u32,
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
            LSE_Drive_Capability: ?RCC_LSEDRV,
            PLL1_VCI_Range: RCC_PLLRGE,
            PLL2_VCI_Range: RCC_PLLRGE,
            RCC_TIM_PRescaler_Selection: RCC_TIMPRE,
            LSEUsed: u32,
            HSIUsed: u32,
            PLL1_VCO_SEL: RCC_PLLVCOSEL,
            PLL2_VCO_SEL: RCC_PLLVCOSEL,
            PLL1RUsed: u32,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSIDiv = try cubemx_config.HSIDiv.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLL2Source = try cubemx_config.PLL2Source.to_enum(),
                    .PLLM = cubemx_config.PLLM,
                    .PLL2M = cubemx_config.PLL2M,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .USART2CLockSelection = try cubemx_config.USART2CLockSelection.to_enum(),
                    .USART3CLockSelection = try cubemx_config.USART3CLockSelection.to_enum(),
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .LPTIM2CLockSelection = try cubemx_config.LPTIM2CLockSelection.to_enum(),
                    .DACLowPowerCLockSelection = try cubemx_config.DACLowPowerCLockSelection.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .USBCLockSelection = try cubemx_config.USBCLockSelection.to_enum(),
                    .FDCANClockSelection = try cubemx_config.FDCANClockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C2CLockSelection = try cubemx_config.I2C2CLockSelection.to_enum(),
                    .I3C2CLockSelection = try cubemx_config.I3C2CLockSelection.to_enum(),
                    .I3C1CLockSelection = try cubemx_config.I3C1CLockSelection.to_enum(),
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .RCC_MCO2Source = try cubemx_config.RCC_MCO2Source.to_enum(),
                    .RCC_MCO2Div = try cubemx_config.RCC_MCO2Div.to_enum(),
                    .LSCOSource1 = try cubemx_config.LSCOSource1.to_enum(),
                    .CKPERSourceSelection = try cubemx_config.CKPERSourceSelection.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .CortexCLockSelection = cubemx_config.CortexCLockSelection,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB3CLKDivider = try cubemx_config.APB3CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .hsidivToUCPD = cubemx_config.hsidivToUCPD,
                    .SPI1CLockSelection = try cubemx_config.SPI1CLockSelection.to_enum(),
                    .SPI3CLockSelection = try cubemx_config.SPI3CLockSelection.to_enum(),
                    .SPI2CLockSelection = try cubemx_config.SPI2CLockSelection.to_enum(),
                    .PLLN = cubemx_config.PLLN,
                    .PLL1P = try cubemx_config.PLL1P.to_enum(),
                    .PLL1Q = cubemx_config.PLL1Q,
                    .PLL1R = cubemx_config.PLL1R,
                    .PLL2N = cubemx_config.PLL2N,
                    .PLL2P = cubemx_config.PLL2P,
                    .PLL2Q = cubemx_config.PLL2Q,
                    .PLL2R = cubemx_config.PLL2R,
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .Flash_Delay = cubemx_config.Flash_Delay,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .CSICalibrationValue = cubemx_config.CSICalibrationValue,
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
                    .LSE_Drive_Capability = if (cubemx_config.LSE_Drive_Capability) |val| try val.to_enum() else null,
                    .PLL1_VCI_Range = try cubemx_config.PLL1_VCI_Range.to_enum(),
                    .PLL2_VCI_Range = try cubemx_config.PLL2_VCI_Range.to_enum(),
                    .RCC_TIM_PRescaler_Selection = try cubemx_config.RCC_TIM_PRescaler_Selection.to_enum(),
                    .LSEUsed = cubemx_config.LSEUsed,
                    .HSIUsed = cubemx_config.HSIUsed,
                    .PLL1_VCO_SEL = try cubemx_config.PLL1_VCO_SEL.to_enum(),
                    .PLL2_VCO_SEL = try cubemx_config.PLL2_VCO_SEL.to_enum(),
                    .PLL1RUsed = cubemx_config.PLL1RUsed,
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
            HSIDiv: u32 = 0,
            CRSCLKoutput: u32 = 0,
            HSI48RC: u32 = 0,
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            CSIRC: u32 = 0,
            AUDIOCLK: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PLLSource: u32 = 0,
            PLL2Source: u32 = 0,
            PLLM: u32 = 0,
            PLL2M: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3output: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            LPTIM2Mult: u32 = 0,
            LPTIM2output: u32 = 0,
            DACMult: u32 = 0,
            DACoutput: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            CK48Mult: u32 = 0,
            USBoutput: u32 = 0,
            FDCANMult: u32 = 0,
            FDCANOutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2output: u32 = 0,
            I3C2Mult: u32 = 0,
            I3C2output: u32 = 0,
            I3C1Mult: u32 = 0,
            I3C1output: u32 = 0,
            RNGMult: u32 = 0,
            RNGoutput: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
            CKPERMult: u32 = 0,
            CKPERoutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            PWRCLKoutput: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            CortexPrescaler: u32 = 0,
            CortexCLockSelection: u32 = 0,
            CortexSysOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            APB1Prescaler: u32 = 0,
            APB1Output: u32 = 0,
            TimPrescalerAPB1: u32 = 0,
            TimPrescOut1: u32 = 0,
            APB2Prescaler: u32 = 0,
            APB2Output: u32 = 0,
            APB3Prescaler: u32 = 0,
            APB3Output: u32 = 0,
            TimPrescalerAPB2: u32 = 0,
            TimPrescOut2: u32 = 0,
            hsidivToUCPD: u32 = 0,
            UCPD1Output: u32 = 0,
            SPI1Mult: u32 = 0,
            SPI1output: u32 = 0,
            SPI3Mult: u32 = 0,
            SPI3output: u32 = 0,
            SPI2Mult: u32 = 0,
            SPI2output: u32 = 0,
            PLLN: u32 = 0,
            PLLFRACN: u32 = 0,
            PLL1P: u32 = 0,
            PLL1Q: u32 = 0,
            PLLQoutput: u32 = 0,
            PLL1R: u32 = 0,
            PLL2N: u32 = 0,
            PLL2FRACN: u32 = 0,
            PLL2P: u32 = 0,
            PLL2Poutput: u32 = 0,
            PLL2Q: u32 = 0,
            PLL2Qoutput: u32 = 0,
            PLL2R: u32 = 0,
            PLL2Routput: u32 = 0,
            LSI: u32 = 0,
            PLLSRC: u32 = 0,
            VCOInput: u32 = 0,
            VCOInput2: u32 = 0,
            VCOOutput: u32 = 0,
            PLLPCLK: u32 = 0,
            VCOPLL2Output: u32 = 0,
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

            var SysSourceCSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceCSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL2SourceCSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL2SourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1_CLKP: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2_CLKP: bool = false; //semaphore for processing, not an actual flag in the output;
            var DAC1LPCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var DAC1LPCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceCSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBCLKSOURCE_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBSourcePLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBSourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCAN_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCAN_PLL2Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCAN_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceCSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceCSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I3C2_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var I3C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I3C1_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var I3C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_HSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1_PLL1QCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2_PLL1PCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2_PLL2PCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CKPER_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CKPER_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CKPER_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_HCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_HCLK_DIV8: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_HCLK_1_8: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1_PLL1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1_CLKP: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI3_PLL1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI3_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI3_CLKP: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI2_PLL1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI2_PLL2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI2_CLKP: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale3: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale0: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var TimPrescalerEnabled: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var HSIDiv = ClockNode{
                .name = "HSIDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CRSCLKoutput = ClockNode{
                .name = "CRSCLKoutput",
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

            var CSIRC = ClockNode{
                .name = "CSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AUDIOCLK = ClockNode{
                .name = "AUDIOCLK",
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

            var PLL2Source = ClockNode{
                .name = "PLL2Source",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLM = ClockNode{
                .name = "PLLM",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2M = ClockNode{
                .name = "PLL2M",
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

            var DACMult = ClockNode{
                .name = "DACMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DACoutput = ClockNode{
                .name = "DACoutput",
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

            var USBoutput = ClockNode{
                .name = "USBoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FDCANMult = ClockNode{
                .name = "FDCANMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FDCANOutput = ClockNode{
                .name = "FDCANOutput",
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

            var I3C2Mult = ClockNode{
                .name = "I3C2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I3C2output = ClockNode{
                .name = "I3C2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I3C1Mult = ClockNode{
                .name = "I3C1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I3C1output = ClockNode{
                .name = "I3C1output",
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

            var CKPERMult = ClockNode{
                .name = "CKPERMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CKPERoutput = ClockNode{
                .name = "CKPERoutput",
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

            var CortexCLockSelection = ClockNode{
                .name = "CortexCLockSelection",
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

            var APB3Prescaler = ClockNode{
                .name = "APB3Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB3Output = ClockNode{
                .name = "APB3Output",
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

            var hsidivToUCPD = ClockNode{
                .name = "hsidivToUCPD",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UCPD1Output = ClockNode{
                .name = "UCPD1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI1Mult = ClockNode{
                .name = "SPI1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI1output = ClockNode{
                .name = "SPI1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI3Mult = ClockNode{
                .name = "SPI3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI3output = ClockNode{
                .name = "SPI3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI2Mult = ClockNode{
                .name = "SPI2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI2output = ClockNode{
                .name = "SPI2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLN = ClockNode{
                .name = "PLLN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLFRACN = ClockNode{
                .name = "PLLFRACN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL1P = ClockNode{
                .name = "PLL1P",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL1Q = ClockNode{
                .name = "PLL1Q",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLQoutput = ClockNode{
                .name = "PLLQoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL1R = ClockNode{
                .name = "PLL1R",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2N = ClockNode{
                .name = "PLL2N",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2FRACN = ClockNode{
                .name = "PLL2FRACN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2P = ClockNode{
                .name = "PLL2P",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2Poutput = ClockNode{
                .name = "PLL2Poutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2Q = ClockNode{
                .name = "PLL2Q",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2Qoutput = ClockNode{
                .name = "PLL2Qoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2R = ClockNode{
                .name = "PLL2R",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2Routput = ClockNode{
                .name = "PLL2Routput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOInput = ClockNode{
                .name = "VCOInput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOInput2 = ClockNode{
                .name = "VCOInput2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOOutput = ClockNode{
                .name = "VCOOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLPCLK = ClockNode{
                .name = "PLLPCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOPLL2Output = ClockNode{
                .name = "VCOPLL2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 6.4e7;
            };

            const HSIDivValue: HSIDivList = blk: {
                const user_val = config.HSIDiv;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSI_DIV1 => {},
                        .RCC_HSI_DIV2 => {},
                        .RCC_HSI_DIV4 => {},
                        .RCC_HSI_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_HSI_DIV2;
            };

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass or config.flags.HSEDIGByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 5e7,
                        .main_expr = "HSEByPass  | HSEDIGByPass",
                        .main_dialog = "HSE in bypass Mode",
                    };
                    break :blk user_val orelse 2.5e7;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 5e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 2.5e7;
            };

            const LSI_VALUEValue: f32 = blk: {
                const user_val = config.LSI_VALUE;
                LSIRC.limit = .{
                    .min = 3.14e4,
                    .max = 3.26e4,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 3.2e4;
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

            const CSI_VALUEValue: f32 = blk: {
                break :blk 4e6;
            };

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 1.2288e7;
            };

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_CSI => SysSourceCSI = true,
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
                        .RCC_PLL1_SOURCE_CSI => PLLSourceCSI = true,
                        .RCC_PLL1_SOURCE_HSI => PLLSourceHSI = true,
                        .RCC_PLL1_SOURCE_HSE => PLLSourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLLSourceCSI = true;
                    break :blk .RCC_PLL1_SOURCE_CSI;
                };
            };

            const PLL2SourceValue: PLL2SourceList = blk: {
                const user_val = config.PLL2Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLL2_SOURCE_CSI => PLL2SourceCSI = true,
                        .RCC_PLL2_SOURCE_HSI => PLL2SourceHSI = true,
                        .RCC_PLL2_SOURCE_HSE => PLL2SourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLL2SourceCSI = true;
                    break :blk .RCC_PLL2_SOURCE_CSI;
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
                    if (val > 63) {
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
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
            };

            const PLL2MValue: u32 = blk: {
                const user_val = config.PLL2M;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2M",
                            "Else",
                            "No additional information",
                            1,
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
                            "PLL2M",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: RCC_RTC_Clock_Source_FROM_HSEList = blk: {
                const user_val = config.RCC_RTC_Clock_Source_FROM_HSE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTC_HSE_NOCLOCK => {},
                        .RCC_RTC_HSE_DIV2 => {},
                        .RCC_RTC_HSE_DIV3 => {},
                        .RCC_RTC_HSE_DIV4 => {},
                        .RCC_RTC_HSE_DIV5 => {},
                        .RCC_RTC_HSE_DIV6 => {},
                        .RCC_RTC_HSE_DIV7 => {},
                        .RCC_RTC_HSE_DIV8 => {},
                        .RCC_RTC_HSE_DIV9 => {},
                        .RCC_RTC_HSE_DIV10 => {},
                        .RCC_RTC_HSE_DIV11 => {},
                        .RCC_RTC_HSE_DIV12 => {},
                        .RCC_RTC_HSE_DIV13 => {},
                        .RCC_RTC_HSE_DIV14 => {},
                        .RCC_RTC_HSE_DIV15 => {},
                        .RCC_RTC_HSE_DIV16 => {},
                        .RCC_RTC_HSE_DIV17 => {},
                        .RCC_RTC_HSE_DIV18 => {},
                        .RCC_RTC_HSE_DIV19 => {},
                        .RCC_RTC_HSE_DIV20 => {},
                        .RCC_RTC_HSE_DIV21 => {},
                        .RCC_RTC_HSE_DIV22 => {},
                        .RCC_RTC_HSE_DIV23 => {},
                        .RCC_RTC_HSE_DIV24 => {},
                        .RCC_RTC_HSE_DIV25 => {},
                        .RCC_RTC_HSE_DIV26 => {},
                        .RCC_RTC_HSE_DIV27 => {},
                        .RCC_RTC_HSE_DIV28 => {},
                        .RCC_RTC_HSE_DIV29 => {},
                        .RCC_RTC_HSE_DIV30 => {},
                        .RCC_RTC_HSE_DIV31 => {},
                        .RCC_RTC_HSE_DIV32 => {},
                        .RCC_RTC_HSE_DIV33 => {},
                        .RCC_RTC_HSE_DIV34 => {},
                        .RCC_RTC_HSE_DIV35 => {},
                        .RCC_RTC_HSE_DIV36 => {},
                        .RCC_RTC_HSE_DIV37 => {},
                        .RCC_RTC_HSE_DIV38 => {},
                        .RCC_RTC_HSE_DIV39 => {},
                        .RCC_RTC_HSE_DIV40 => {},
                        .RCC_RTC_HSE_DIV41 => {},
                        .RCC_RTC_HSE_DIV42 => {},
                        .RCC_RTC_HSE_DIV43 => {},
                        .RCC_RTC_HSE_DIV44 => {},
                        .RCC_RTC_HSE_DIV45 => {},
                        .RCC_RTC_HSE_DIV46 => {},
                        .RCC_RTC_HSE_DIV47 => {},
                        .RCC_RTC_HSE_DIV48 => {},
                        .RCC_RTC_HSE_DIV49 => {},
                        .RCC_RTC_HSE_DIV50 => {},
                        .RCC_RTC_HSE_DIV51 => {},
                        .RCC_RTC_HSE_DIV52 => {},
                        .RCC_RTC_HSE_DIV53 => {},
                        .RCC_RTC_HSE_DIV54 => {},
                        .RCC_RTC_HSE_DIV55 => {},
                        .RCC_RTC_HSE_DIV56 => {},
                        .RCC_RTC_HSE_DIV57 => {},
                        .RCC_RTC_HSE_DIV58 => {},
                        .RCC_RTC_HSE_DIV59 => {},
                        .RCC_RTC_HSE_DIV60 => {},
                        .RCC_RTC_HSE_DIV61 => {},
                        .RCC_RTC_HSE_DIV62 => {},
                        .RCC_RTC_HSE_DIV63 => {},
                    }
                }
                break :blk user_val orelse .RCC_RTC_HSE_NOCLOCK;
            };

            const RTCClockSelectionValue: RTCClockSelectionList = blk: {
                const user_val = config.RTCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_HSE_DIV32 => RTCSourceHSE = true,
                        .RCC_RTCCLKSOURCE_LSE => RTCSourceLSE = true,
                        .RCC_RTCCLKSOURCE_LSI => RTCSourceLSI = true,
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
                        .RCC_USART1CLKSOURCE_PCLK2 => {},
                        .RCC_USART1CLKSOURCE_PLL2Q => USART1_PLL2 = true,
                        .RCC_USART1CLKSOURCE_HSI => USART1_HSI = true,
                        .RCC_USART1CLKSOURCE_LSE => USART1_LSE = true,
                        .RCC_USART1CLKSOURCE_CSI => USART1_CSI = true,
                    }
                }
                break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK2;
            };

            const USART2CLockSelectionValue: USART2CLockSelectionList = blk: {
                const user_val = config.USART2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART2CLKSOURCE_PCLK1 => {},
                        .RCC_USART2CLKSOURCE_PLL2Q => USART2_PLL2 = true,
                        .RCC_USART2CLKSOURCE_HSI => USART2_HSI = true,
                        .RCC_USART2CLKSOURCE_LSE => USART2_LSE = true,
                        .RCC_USART2CLKSOURCE_CSI => USART2_CSI = true,
                    }
                }
                break :blk user_val orelse .RCC_USART2CLKSOURCE_PCLK1;
            };

            const USART3CLockSelectionValue: USART3CLockSelectionList = blk: {
                const user_val = config.USART3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART3CLKSOURCE_PCLK1 => {},
                        .RCC_USART3CLKSOURCE_PLL2Q => USART3_PLL2 = true,
                        .RCC_USART3CLKSOURCE_HSI => USART3_HSI = true,
                        .RCC_USART3CLKSOURCE_LSE => USART3_LSE = true,
                        .RCC_USART3CLKSOURCE_CSI => USART3_CSI = true,
                    }
                }
                break :blk user_val orelse .RCC_USART3CLKSOURCE_PCLK1;
            };

            const LPUART1CLockSelectionValue: LPUART1CLockSelectionList = blk: {
                const user_val = config.LPUART1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_PCLK3 => {},
                        .RCC_LPUART1CLKSOURCE_PLL2Q => LPUART1_PLL2 = true,
                        .RCC_LPUART1CLKSOURCE_HSI => LPUART1_HSI = true,
                        .RCC_LPUART1CLKSOURCE_LSE => LPUART1_LSE = true,
                        .RCC_LPUART1CLKSOURCE_CSI => LPUART1_CSI = true,
                    }
                }
                break :blk user_val orelse .RCC_LPUART1CLKSOURCE_PCLK3;
            };

            const LPTIM1CLockSelectionValue: LPTIM1CLockSelectionList = blk: {
                const user_val = config.LPTIM1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_CLKP => LPTIM1_CLKP = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1SOURCELSE = true,
                        .RCC_LPTIM1CLKSOURCE_PCLK3 => {},
                        .RCC_LPTIM1CLKSOURCE_PLL2P => LPTIM1_PLL2 = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK3;
            };

            const LPTIM2CLockSelectionValue: LPTIM2CLockSelectionList = blk: {
                const user_val = config.LPTIM2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM2CLKSOURCE_PCLK1 => {},
                        .RCC_LPTIM2CLKSOURCE_LSI => LPTIM2SOURCELSI = true,
                        .RCC_LPTIM2CLKSOURCE_PLL2P => LPTIM2_PLL2 = true,
                        .RCC_LPTIM2CLKSOURCE_LSE => LPTIM2SOURCELSE = true,
                        .RCC_LPTIM2CLKSOURCE_CLKP => LPTIM2_CLKP = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM2CLKSOURCE_PCLK1;
            };

            const DACLowPowerCLockSelectionValue: DACLowPowerCLockSelectionList = blk: {
                const user_val = config.DACLowPowerCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DACLPCLKSOURCE_LSE => DAC1LPCLKSOURCE_LSE = true,
                        .RCC_DACLPCLKSOURCE_LSI => DAC1LPCLKSOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    DAC1LPCLKSOURCE_LSE = true;
                    break :blk .RCC_DACLPCLKSOURCE_LSE;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCDACCLKSOURCE_HCLK => {},
                        .RCC_ADCDACCLKSOURCE_SYSCLK => ADCSourceSys = true,
                        .RCC_ADCDACCLKSOURCE_PLL2R => ADCSourcePLL2R = true,
                        .RCC_ADCDACCLKSOURCE_HSE => ADCSourceHSE = true,
                        .RCC_ADCDACCLKSOURCE_HSI => ADCSourceHSI = true,
                        .RCC_ADCDACCLKSOURCE_CSI => ADCSourceCSI = true,
                    }
                }
                break :blk user_val orelse .RCC_ADCDACCLKSOURCE_HCLK;
            };

            const USBCLockSelectionValue: USBCLockSelectionList = blk: {
                const user_val = config.USBCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL2Q => USBCLKSOURCE_PLL2 = true,
                        .RCC_USBCLKSOURCE_PLL1Q => USBSourcePLL1Q = true,
                        .RCC_USBCLKSOURCE_HSI48 => USBSourceHSI48 = true,
                    }
                }
                break :blk user_val orelse {
                    USBSourceHSI48 = true;
                    break :blk .RCC_USBCLKSOURCE_HSI48;
                };
            };

            const FDCANClockSelectionValue: FDCANClockSelectionList = blk: {
                const user_val = config.FDCANClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FDCANCLKSOURCE_PLL1Q => FDCAN_PLL1Q = true,
                        .RCC_FDCANCLKSOURCE_PLL2Q => FDCAN_PLL2Q = true,
                        .RCC_FDCANCLKSOURCE_HSE => FDCAN_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    FDCAN_HSE = true;
                    break :blk .RCC_FDCANCLKSOURCE_HSE;
                };
            };

            const I2C1CLockSelectionValue: I2C1CLockSelectionList = blk: {
                const user_val = config.I2C1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_PCLK1 => {},
                        .RCC_I2C1CLKSOURCE_PLL2R => I2C1_PLL2 = true,
                        .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                        .RCC_I2C1CLKSOURCE_CSI => I2C1SourceCSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C1CLKSOURCE_PCLK1;
            };

            const I2C2CLockSelectionValue: I2C2CLockSelectionList = blk: {
                const user_val = config.I2C2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C2CLKSOURCE_PCLK1 => {},
                        .RCC_I2C2CLKSOURCE_PLL2R => I2C2_PLL2 = true,
                        .RCC_I2C2CLKSOURCE_HSI => I2C2SourceHSI = true,
                        .RCC_I2C2CLKSOURCE_CSI => I2C2SourceCSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C2CLKSOURCE_PCLK1;
            };

            const I3C2CLockSelectionValue: I3C2CLockSelectionList = blk: {
                const user_val = config.I3C2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I3C2CLKSOURCE_PCLK3 => {},
                        .RCC_I3C2CLKSOURCE_PLL2R => I3C2_PLL2 = true,
                        .RCC_I3C2CLKSOURCE_HSI => I3C2SourceHSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I3C2CLKSOURCE_PCLK3;
            };

            const I3C1CLockSelectionValue: I3C1CLockSelectionList = blk: {
                const user_val = config.I3C1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I3C1CLKSOURCE_PCLK1 => {},
                        .RCC_I3C1CLKSOURCE_PLL2R => I3C1_PLL2 = true,
                        .RCC_I3C1CLKSOURCE_HSI => I3C1SourceHSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I3C1CLKSOURCE_PCLK1;
            };

            const RNGCLockSelectionValue: RNGCLockSelectionList = blk: {
                const user_val = config.RNGCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_HSI48 => RNGCLKSOURCE_HSI48 = true,
                        .RCC_RNGCLKSOURCE_PLL1Q => RNGCLKSOURCE_PLL1Q = true,
                        .RCC_RNGCLKSOURCE_LSE => RNGCLKSOURCE_LSE = true,
                        .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    RNGCLKSOURCE_HSI48 = true;
                    break :blk .RCC_RNGCLKSOURCE_HSI48;
                };
            };

            const RCC_MCO1SourceValue: RCC_MCO1SourceList = blk: {
                const user_val = config.RCC_MCO1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_LSE => {},
                        .RCC_MCO1SOURCE_HSE => MCO1_HSE = true,
                        .RCC_MCO1SOURCE_HSI => MCO1_HSI = true,
                        .RCC_MCO1SOURCE_PLL1Q => MCO1_PLL1QCLK = true,
                        .RCC_MCO1SOURCE_HSI48 => {},
                    }
                }
                break :blk user_val orelse {
                    MCO1_HSI = true;
                    break :blk .RCC_MCO1SOURCE_HSI;
                };
            };

            const RCC_MCODivValue: RCC_MCODivList = blk: {
                const user_val = config.RCC_MCODiv;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCODIV_1 => {},
                        .RCC_MCODIV_2 => {},
                        .RCC_MCODIV_3 => {},
                        .RCC_MCODIV_4 => {},
                        .RCC_MCODIV_5 => {},
                        .RCC_MCODIV_6 => {},
                        .RCC_MCODIV_7 => {},
                        .RCC_MCODIV_8 => {},
                        .RCC_MCODIV_9 => {},
                        .RCC_MCODIV_10 => {},
                        .RCC_MCODIV_11 => {},
                        .RCC_MCODIV_12 => {},
                        .RCC_MCODIV_13 => {},
                        .RCC_MCODIV_14 => {},
                        .RCC_MCODIV_15 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCODIV_1;
            };

            const RCC_MCO2SourceValue: RCC_MCO2SourceList = blk: {
                const user_val = config.RCC_MCO2Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO2SOURCE_LSI => MCO2_LSI = true,
                        .RCC_MCO2SOURCE_HSE => MCO2_HSE = true,
                        .RCC_MCO2SOURCE_CSI => MCO2_CSI = true,
                        .RCC_MCO2SOURCE_PLL1P => MCO2_PLL1PCLK = true,
                        .RCC_MCO2SOURCE_PLL2P => MCO2_PLL2PCLK = true,
                        .RCC_MCO2SOURCE_SYSCLK => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO2SOURCE_SYSCLK;
            };

            const RCC_MCO2DivValue: RCC_MCO2DivList = blk: {
                const user_val = config.RCC_MCO2Div;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCODIV_1 => {},
                        .RCC_MCODIV_2 => {},
                        .RCC_MCODIV_3 => {},
                        .RCC_MCODIV_4 => {},
                        .RCC_MCODIV_5 => {},
                        .RCC_MCODIV_6 => {},
                        .RCC_MCODIV_7 => {},
                        .RCC_MCODIV_8 => {},
                        .RCC_MCODIV_9 => {},
                        .RCC_MCODIV_10 => {},
                        .RCC_MCODIV_11 => {},
                        .RCC_MCODIV_12 => {},
                        .RCC_MCODIV_13 => {},
                        .RCC_MCODIV_14 => {},
                        .RCC_MCODIV_15 => {},
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

            const CKPERSourceSelectionValue: CKPERSourceSelectionList = blk: {
                const user_val = config.CKPERSourceSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CLKPSOURCE_HSI => CKPER_HSI = true,
                        .RCC_CLKPSOURCE_CSI => CKPER_CSI = true,
                        .RCC_CLKPSOURCE_HSE => CKPER_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    CKPER_HSI = true;
                    break :blk .RCC_CLKPSOURCE_HSI;
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
                        .SYSTICK_CLKSOURCE_HCLK => CLKSOURCE_HCLK = true,
                        .SYSTICK_CLKSOURCE_HCLK_DIV8 => CLKSOURCE_HCLK_DIV8 = true,
                    }
                }
                break :blk user_val orelse {
                    CLKSOURCE_HCLK = true;
                    break :blk .SYSTICK_CLKSOURCE_HCLK;
                };
            };

            const CortexCLockSelectionValue: CortexCLockSelectionList = blk: {
                const user_val = config.CortexCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .SYSTICK_CLKSOURCE_HCLK_1_8 => CLKSOURCE_HCLK_1_8 = true,
                        .SYSTICK_CLKSOURCE_LSE => CLKSOURCE_LSE = true,
                        .SYSTICK_CLKSOURCE_LSI => CLKSOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    CLKSOURCE_HCLK_1_8 = true;
                    break :blk .SYSTICK_CLKSOURCE_HCLK_1_8;
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

            const RCC_TIM_PRescaler_SelectionValue: RCC_TIM_PRescaler_SelectionList = blk: {
                const user_val = config.extra_config.RCC_TIM_PRescaler_Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_TIMPRES_ACTIVATED => TimPrescalerEnabled = true,
                        .RCC_TIMPRES_DESACTIVATED => {},
                    }
                }
                break :blk user_val orelse .RCC_TIMPRES_DESACTIVATED;
            };

            const APB1TimCLKDividerValue: u32 = blk: {
                if (((check_ref(@TypeOf(APB1CLKDividerValue), APB1CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((check_ref(@TypeOf(APB1CLKDividerValue), APB1CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(APB1CLKDividerValue), APB1CLKDividerValue, .RCC_HCLK_DIV2, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((check_ref(@TypeOf(APB1CLKDividerValue), APB1CLKDividerValue, .RCC_HCLK_DIV4, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
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

            const APB3CLKDividerValue: APB3CLKDividerList = blk: {
                const user_val = config.APB3CLKDivider;

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
                if (((check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV2, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV4, .@"=")) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                }
                break :blk 2;
            };

            const hsidivToUCPDValue: u32 = blk: {
                break :blk 4;
            };

            const SPI1CLockSelectionValue: SPI1CLockSelectionList = blk: {
                const user_val = config.SPI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI1CLKSOURCE_PLL1Q => SPI1_PLL1 = true,
                        .RCC_SPI1CLKSOURCE_PLL2P => SPI1_PLL2 = true,
                        .RCC_SPI1CLKSOURCE_PIN => {},
                        .RCC_SPI1CLKSOURCE_CLKP => SPI1_CLKP = true,
                    }
                }
                break :blk user_val orelse {
                    SPI1_PLL1 = true;
                    break :blk .RCC_SPI1CLKSOURCE_PLL1Q;
                };
            };

            const SPI3CLockSelectionValue: SPI3CLockSelectionList = blk: {
                const user_val = config.SPI3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI3CLKSOURCE_PLL1Q => SPI3_PLL1 = true,
                        .RCC_SPI3CLKSOURCE_PLL2P => SPI3_PLL2 = true,
                        .RCC_SPI3CLKSOURCE_PIN => {},
                        .RCC_SPI3CLKSOURCE_CLKP => SPI3_CLKP = true,
                    }
                }
                break :blk user_val orelse {
                    SPI3_PLL1 = true;
                    break :blk .RCC_SPI3CLKSOURCE_PLL1Q;
                };
            };

            const SPI2CLockSelectionValue: SPI2CLockSelectionList = blk: {
                const user_val = config.SPI2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI2CLKSOURCE_PLL1Q => SPI2_PLL1 = true,
                        .RCC_SPI2CLKSOURCE_PLL2P => SPI2_PLL2 = true,
                        .RCC_SPI2CLKSOURCE_PIN => {},
                        .RCC_SPI2CLKSOURCE_CLKP => SPI2_CLKP = true,
                    }
                }
                break :blk user_val orelse {
                    SPI2_PLL1 = true;
                    break :blk .RCC_SPI2CLKSOURCE_PLL1Q;
                };
            };

            const PLLNValue: u32 = blk: {
                const user_val = config.PLLN;
                if (user_val) |val| {
                    if (val < 4) {
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
                            4,
                            val,
                        });
                    }
                    if (val > 512) {
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
                            512,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 129;
            };

            const PLLFRACNValue: u32 = blk: {
                const user_val = config.PLLFRACN;
                PLLFRACN.limit = .{
                    .min = 0,
                    .max = 8191,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 0;
            };

            const PLL1PValue: PLL1PList = blk: {
                const user_val = config.PLL1P;

                if (user_val) |val| {
                    switch (val) {
                        .@"2" => {},
                        .@"4" => {},
                        .@"6" => {},
                        .@"8" => {},
                        .@"10" => {},
                        .@"12" => {},
                        .@"14" => {},
                        .@"16" => {},
                        .@"18" => {},
                        .@"20" => {},
                        .@"22" => {},
                        .@"24" => {},
                        .@"26" => {},
                        .@"28" => {},
                        .@"30" => {},
                        .@"32" => {},
                        .@"34" => {},
                        .@"36" => {},
                        .@"38" => {},
                        .@"40" => {},
                        .@"42" => {},
                        .@"44" => {},
                        .@"46" => {},
                        .@"48" => {},
                        .@"50" => {},
                        .@"52" => {},
                        .@"54" => {},
                        .@"56" => {},
                        .@"58" => {},
                        .@"60" => {},
                        .@"62" => {},
                        .@"64" => {},
                        .@"66" => {},
                        .@"68" => {},
                        .@"70" => {},
                        .@"72" => {},
                        .@"74" => {},
                        .@"76" => {},
                        .@"78" => {},
                        .@"80" => {},
                        .@"82" => {},
                        .@"84" => {},
                        .@"86" => {},
                        .@"88" => {},
                        .@"90" => {},
                        .@"92" => {},
                        .@"94" => {},
                        .@"96" => {},
                        .@"98" => {},
                        .@"100" => {},
                        .@"102" => {},
                        .@"104" => {},
                        .@"106" => {},
                        .@"108" => {},
                        .@"110" => {},
                        .@"112" => {},
                        .@"114" => {},
                        .@"116" => {},
                        .@"118" => {},
                        .@"120" => {},
                        .@"122" => {},
                        .@"124" => {},
                        .@"126" => {},
                        .@"128" => {},
                    }
                }
                break :blk user_val orelse .@"2";
            };

            const PLL1QValue: u32 = blk: {
                const user_val = config.PLL1Q;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL1Q",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 128) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL1Q",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLL1RValue: u32 = blk: {
                const user_val = config.PLL1R;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL1R",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 128) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL1R",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLL2NValue: u32 = blk: {
                const user_val = config.PLL2N;
                if (user_val) |val| {
                    if (val < 4) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2N",
                            "Else",
                            "No additional information",
                            4,
                            val,
                        });
                    }
                    if (val > 512) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2N",
                            "Else",
                            "No additional information",
                            512,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 129;
            };

            const PLL2FRACNValue: u32 = blk: {
                const user_val = config.PLL2FRACN;
                PLL2FRACN.limit = .{
                    .min = 0,
                    .max = 8191,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 0;
            };

            const PLL2PValue: u32 = blk: {
                const user_val = config.PLL2P;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2P",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 128) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2P",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLL2QValue: u32 = blk: {
                const user_val = config.PLL2Q;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2Q",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 128) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2Q",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLL2RValue: u32 = blk: {
                const user_val = config.PLL2R;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2R",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 128) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL2R",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
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

            const CSICalibrationValueValue: u32 = blk: {
                const user_val = config.extra_config.CSICalibrationValue;
                if (user_val) |val| {
                    if (val < 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "CSICalibrationValue",
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
                            "CSICalibrationValue",
                            "Else",
                            "No additional information",
                            31,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 16;
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

            const LSEUsedValue: u32 = blk: {
                if ((LSCOSSourceLSE and config.flags.LSCOConfig) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM16) or (config.flags.SEM2RCC_LSE_REQUIRED_TIM2 and config.flags.Semaphore_TIM2_L4_ETR_REMAPTIM2 and config.flags.TIM2) or (config.flags.Semaphore_input_Channel1_directTIM15 and config.flags.TIM15 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM15) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig))) {
                    break :blk 1;
                } else if (config.flags.RTCUsed_ForRCC and RTCSourceLSE or config.flags.USART1_Used and USART1_LSE or config.flags.USART2_Used and USART2_LSE or config.flags.USART3_Used and USART3_LSE) {
                    break :blk 1;
                } else if (config.flags.LPUART1_Used and LPUART1_LSE or LPTIM1SOURCELSE and config.flags.LPTIM1_Used or LPTIM2SOURCELSE and config.flags.LPTIM2_Used) {
                    break :blk 1;
                } else if (DAC1LPCLKSOURCE_LSE and (config.flags.DAC1_Used or config.flags.DAC2_Used) or (config.flags.SEM2RCC_LSE_REQUIRED_TIM2 and config.flags.Semaphore_TIM2_L4_ETR_REMAPTIM2 and config.flags.TIM2) or (config.flags.Semaphore_input_Channel1_directTIM15 and config.flags.TIM15 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM15) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM16) or RNGCLKSOURCE_LSE and config.flags.RNG_Used or LSCOSSourceLSE and config.flags.LSCOConfig or CLKSOURCE_LSE or config.flags.CEC_LSE and config.flags.HDMI_CEC_Used) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSE_Drive_CapabilityValue: ?LSE_Drive_CapabilityList = blk: {
                if ((config.flags.LSEOscillator) and (check_ref(@TypeOf(LSEUsedValue), LSEUsedValue, 1, .@"="))) {
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

            const EnableCRSValue: EnableCRSList = blk: {
                if (config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USB_Used) {
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

            const MCOEnableValue: MCOEnableList = blk: {
                if ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LSIEnableValue: LSIEnableList = blk: {
                break :blk .true;
            };

            const EnableExtClockForSAI1Value: EnableExtClockForSAI1List = blk: {
                if (config.flags.SAI1EXTCLK) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass or config.flags.HSEDIGByPass))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSELCDDevisorValue: EnableHSELCDDevisorList = blk: {
                if (config.flags.LCDUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass or config.flags.HSEDIGByPass)) {
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

            const DACEnableValue: DACEnableList = blk: {
                if (config.flags.DAC1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FDCANEnableValue: FDCANEnableList = blk: {
                if (config.flags.FDCAN1Used_ForRCC) {
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

            const I3C2EnableValue: I3C2EnableList = blk: {
                if (config.flags.I3C2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I3C1EnableValue: I3C1EnableList = blk: {
                if (config.flags.I3C1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCO2EnableValue: MCO2EnableList = blk: {
                if (config.flags.MCO2Config) {
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

            const CKPEREnableValue: CKPEREnableList = blk: {
                if ((config.flags.SPI1_Used or config.flags.I2S1_Used) or (config.flags.SPI2_Used or config.flags.I2S2_Used) or (config.flags.SPI3_Used or config.flags.I2S3_Used) or config.flags.LPTIM1_Used or config.flags.LPTIM2_Used or config.flags.OCTOSPI1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SystickEnableValue: SystickEnableList = blk: {
                if (config.flags.Systick_External) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const UCPDEnableValue: UCPDEnableList = blk: {
                if ((config.flags.UCPD_Used)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI1EnableValue: SPI1EnableList = blk: {
                if (config.flags.SPI1Used_ForRCC or config.flags.I2S1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI3EnableValue: SPI3EnableList = blk: {
                if (config.flags.SPI3Used_ForRCC or config.flags.I2S3_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI2EnableValue: SPI2EnableList = blk: {
                if (config.flags.SPI2Used_ForRCC or config.flags.I2S2_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const PLL1QUsedValue: u1 = blk: {
                if (config.flags.ETH_Used or USBSourcePLL1Q and config.flags.USB_Used or config.flags.SDMMC1SourceIsPllQ and config.flags.SDMMC1_Used or config.flags.SDMMC2SourceIsPllQ and config.flags.SDMMC2_Used or FDCAN_PLL1Q and config.flags.FDCAN1_Used or config.flags.OCTOSPI_PLL1Q and (config.flags.OCTOSPI1_Used or config.flags.OCTOSPI2_Used) or RNGCLKSOURCE_PLL1Q and config.flags.RNG_Used or MCO1_PLL1QCLK and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig) or SPI1_PLL1 and (config.flags.SPI1_Used or config.flags.I2S1_Used) or SPI3_PLL1 and (config.flags.SPI3_Used or config.flags.I2S3_Used) or SPI2_PLL1 and (config.flags.SPI2_Used or config.flags.I2S2_Used)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2PUsedValue: u1 = blk: {
                if (config.flags.LPTIM2_Used and LPTIM2_PLL2 or config.flags.LPTIM1_Used and LPTIM1_PLL2 or config.flags.MCO2Config and MCO2_PLL2PCLK or (config.flags.SPI1_Used or config.flags.I2S1_Used) and SPI1_PLL2 or (config.flags.SPI3_Used or config.flags.I2S3_Used) and SPI3_PLL2 or (config.flags.SPI2_Used or config.flags.I2S2_Used) and SPI2_PLL2) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2QUsedValue: u1 = blk: {
                if (config.flags.USART1_Used and USART1_PLL2 or config.flags.USART2_Used and USART2_PLL2 or config.flags.USART3_Used and USART3_PLL2 or config.flags.LPUART1_Used and LPUART1_PLL2 or config.flags.FDCAN1_Used and FDCAN_PLL2Q) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2RUsedValue: u1 = blk: {
                if (config.flags.I3C2_Used and I3C2_PLL2 or config.flags.I3C1_Used and I3C1_PLL2 or config.flags.I2C2_Used and I2C2_PLL2 or config.flags.I2C1_Used and I2C1_PLL2 or ADCSourcePLL2R and (config.flags.ADC1_Used and config.flags.ADC1UsedAsynchronousCLK_ForRCC or config.flags.ADC2_Used and config.flags.ADC2UsedAsynchronousCLK_ForRCC or config.flags.DAC1_Used or config.flags.DAC2_Used) or config.flags.SDMMC1_PLL2 and config.flags.SDMMC1_Used or config.flags.SDMMC2_PLL2 and config.flags.SDMMC2_Used or config.flags.OCTOSPI_PLL2R and (config.flags.OCTOSPI1_Used or config.flags.OCTOSPI2_Used)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1PUsedValue: u1 = blk: {
                if (MCO2_PLL1PCLK and config.flags.MCO2Config or SysSourcePLL) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1RUsedValue: u32 = blk: {
                break :blk 0;
            };

            const PLLUsedValue: u1 = blk: {
                if (check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL1RUsedValue), PLL1RUsedValue, 1, .@"=")) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2UsedValue: u1 = blk: {
                if (check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
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

            const HSIUsedValue: u32 = blk: {
                if (config.flags.Semaphore_input_Channel1TIM12 and config.flags.TIM12_Used or config.flags.Semaphore_input_Channel1TIM15 and config.flags.TIM15_Used or config.flags.UCPD_Used or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig))))) {
                    break :blk 1;
                } else if (config.flags.I2C1_Used and I2C1SourceHSI or config.flags.I2C2_Used and I2C2SourceHSI or config.flags.I3C2_Used and I3C2SourceHSI or config.flags.I3C1_Used and I3C1SourceHSI) {
                    break :blk 1;
                } else if ((config.flags.ADC1_Used and config.flags.ADC1UsedAsynchronousCLK_ForRCC or config.flags.ADC2_Used and config.flags.ADC2UsedAsynchronousCLK_ForRCC or config.flags.DAC1_Used or config.flags.DAC2_Used) and ADCSourceHSI) {
                    break :blk 1;
                } else if (config.flags.USART1_Used and USART1_HSI or config.flags.USART2_Used and check_MCU("USART2_HSI-USART3_Used") and USART3_HSI) {
                    break :blk 1;
                } else if (SysSourceHSI or PLLSourceHSI and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or PLL2SourceHSI and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=") or config.flags.LPUART1_Used and LPUART1_HSI) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if (((PLLSourceHSE and SysSourcePLL) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass or config.flags.HSEDIGByPass)) {
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
                if (USBSourceHSI48 and config.flags.USB_Used or RNGCLKSOURCE_HSI48 and config.flags.RNG_Used or config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI48, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig))))) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE HSIDiv ======
            HSIDiv.nodetype = .div;
            HSIDiv.value = try HSIDivValue.get();
            HSIDiv.parents = &.{&HSIRC};

            // ======= NODE CRSCLKoutput ======
            CRSCLKoutput.nodetype = .output;
            CRSCLKoutput.parents = &.{&HSI48RC};

            // ======= NODE HSI48RC ======
            HSI48RC.nodetype = .source;
            HSI48RC.value = HSI48_VALUEValue;

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE CSIRC ======
            CSIRC.nodetype = .source;
            CSIRC.value = CSI_VALUEValue;

            // ======= NODE AUDIOCLK ======
            AUDIOCLK.nodetype = .source;
            AUDIOCLK.value = EXTERNAL_CLOCK_VALUEValue;

            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_SYSCLKSOURCE_CSI => &.{&CSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLL1P},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLL1_SOURCE_CSI => &.{&CSIRC},
                .RCC_PLL1_SOURCE_HSI => &.{&HSIDiv},
                .RCC_PLL1_SOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE PLL2Source ======
            PLL2Source.nodetype = .multi;
            PLL2Source.parents = switch (PLL2SourceValue) {
                .RCC_PLL2_SOURCE_CSI => &.{&CSIRC},
                .RCC_PLL2_SOURCE_HSI => &.{&HSIDiv},
                .RCC_PLL2_SOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE PLLM ======
            PLLM.nodetype = .div;
            PLLM.value = @floatFromInt(PLLMValue);
            PLLM.parents = &.{&PLLSource};

            // ======= NODE PLL2M ======
            PLL2M.nodetype = .div;
            PLL2M.value = @floatFromInt(PLL2MValue);
            PLL2M.parents = &.{&PLL2Source};

            // ======= NODE HSERTCDevisor ======
            HSERTCDevisor.nodetype = .div;
            HSERTCDevisor.value = try RCC_RTC_Clock_Source_FROM_HSEValue.get();
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

            // ======= NODE USART1Mult ======
            USART1Mult.nodetype = .multi;
            USART1Mult.parents = switch (USART1CLockSelectionValue) {
                .RCC_USART1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                .RCC_USART1CLKSOURCE_PLL2Q => &.{&PLL2Q},
                .RCC_USART1CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_USART1CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE USART1output ======
            USART1output.nodetype = .output;
            USART1output.parents = &.{&USART1Mult};

            // ======= NODE USART2Mult ======
            USART2Mult.nodetype = .multi;
            USART2Mult.parents = switch (USART2CLockSelectionValue) {
                .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_USART2CLKSOURCE_PLL2Q => &.{&PLL2Q},
                .RCC_USART2CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_USART2CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE USART2output ======
            USART2output.nodetype = .output;
            USART2output.parents = &.{&USART2Mult};

            // ======= NODE USART3Mult ======
            USART3Mult.nodetype = .multi;
            USART3Mult.parents = switch (USART3CLockSelectionValue) {
                .RCC_USART3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_USART3CLKSOURCE_PLL2Q => &.{&PLL2Q},
                .RCC_USART3CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_USART3CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_USART3CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE USART3output ======
            USART3output.nodetype = .output;
            USART3output.parents = &.{&USART3Mult};

            // ======= NODE LPUART1Mult ======
            LPUART1Mult.nodetype = .multi;
            LPUART1Mult.parents = switch (LPUART1CLockSelectionValue) {
                .RCC_LPUART1CLKSOURCE_PCLK3 => &.{&APB3Output},
                .RCC_LPUART1CLKSOURCE_PLL2Q => &.{&PLL2Q},
                .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPUART1CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE LPUART1output ======
            LPUART1output.nodetype = .output;
            LPUART1output.parents = &.{&LPUART1Mult};

            // ======= NODE LPTIM1Mult ======
            LPTIM1Mult.nodetype = .multi;
            LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                .RCC_LPTIM1CLKSOURCE_PCLK3 => &.{&APB3Output},
                .RCC_LPTIM1CLKSOURCE_PLL2P => &.{&PLL2P},
                .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM1CLKSOURCE_CLKP => &.{&CKPERMult},
            };

            // ======= NODE LPTIM1output ======
            LPTIM1output.nodetype = .output;
            LPTIM1output.parents = &.{&LPTIM1Mult};

            // ======= NODE LPTIM2Mult ======
            LPTIM2Mult.nodetype = .multi;
            LPTIM2Mult.parents = switch (LPTIM2CLockSelectionValue) {
                .RCC_LPTIM2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_LPTIM2CLKSOURCE_PLL2P => &.{&PLL2P},
                .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM2CLKSOURCE_CLKP => &.{&CKPERMult},
            };

            // ======= NODE LPTIM2output ======
            LPTIM2output.nodetype = .output;
            LPTIM2output.parents = &.{&LPTIM2Mult};

            // ======= NODE DACMult ======
            DACMult.nodetype = .multi;
            DACMult.parents = switch (DACLowPowerCLockSelectionValue) {
                .RCC_DACLPCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_DACLPCLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE DACoutput ======
            DACoutput.nodetype = .output;
            DACoutput.parents = &.{&DACMult};

            // ======= NODE ADCMult ======
            ADCMult.nodetype = .multi;
            ADCMult.parents = switch (ADCCLockSelectionValue) {
                .RCC_ADCDACCLKSOURCE_HCLK => &.{&AHBOutput},
                .RCC_ADCDACCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_ADCDACCLKSOURCE_PLL2R => &.{&PLL2R},
                .RCC_ADCDACCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_ADCDACCLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_ADCDACCLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&ADCMult};

            // ======= NODE CK48Mult ======
            if (check_MCU("USB_Exist")) {
                CK48Mult.nodetype = .multi;
                CK48Mult.parents = switch (USBCLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLL2Q => &.{&PLL2Q},
                    .RCC_USBCLKSOURCE_PLL1Q => &.{&PLL1Q},
                    .RCC_USBCLKSOURCE_HSI48 => &.{&HSI48RC},
                };
            }
            // ======= NODE USBoutput ======
            if (check_MCU("USB_Exist")) {
                USBoutput.nodetype = .output;
                USBoutput.parents = &.{&CK48Mult};
            }
            // ======= NODE FDCANMult ======
            if (check_MCU("FDCAN1_Exist")) {
                FDCANMult.nodetype = .multi;
                FDCANMult.parents = switch (FDCANClockSelectionValue) {
                    .RCC_FDCANCLKSOURCE_PLL1Q => &.{&PLL1Q},
                    .RCC_FDCANCLKSOURCE_PLL2Q => &.{&PLL2Q},
                    .RCC_FDCANCLKSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE FDCANOutput ======
            if (check_MCU("FDCAN1_Exist")) {
                FDCANOutput.nodetype = .output;
                FDCANOutput.parents = &.{&FDCANMult};
            }
            // ======= NODE I2C1Mult ======
            I2C1Mult.nodetype = .multi;
            I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_I2C1CLKSOURCE_PLL2R => &.{&PLL2R},
                .RCC_I2C1CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_I2C1CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE I2C1output ======
            I2C1output.nodetype = .output;
            I2C1output.parents = &.{&I2C1Mult};

            // ======= NODE I2C2Mult ======
            I2C2Mult.nodetype = .multi;
            I2C2Mult.parents = switch (I2C2CLockSelectionValue) {
                .RCC_I2C2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_I2C2CLKSOURCE_PLL2R => &.{&PLL2R},
                .RCC_I2C2CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_I2C2CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE I2C2output ======
            I2C2output.nodetype = .output;
            I2C2output.parents = &.{&I2C2Mult};

            // ======= NODE I3C2Mult ======
            I3C2Mult.nodetype = .multi;
            I3C2Mult.parents = switch (I3C2CLockSelectionValue) {
                .RCC_I3C2CLKSOURCE_PCLK3 => &.{&APB3Output},
                .RCC_I3C2CLKSOURCE_PLL2R => &.{&PLL2R},
                .RCC_I3C2CLKSOURCE_HSI => &.{&HSIDiv},
            };

            // ======= NODE I3C2output ======
            I3C2output.nodetype = .output;
            I3C2output.parents = &.{&I3C2Mult};

            // ======= NODE I3C1Mult ======
            I3C1Mult.nodetype = .multi;
            I3C1Mult.parents = switch (I3C1CLockSelectionValue) {
                .RCC_I3C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                .RCC_I3C1CLKSOURCE_PLL2R => &.{&PLL2R},
                .RCC_I3C1CLKSOURCE_HSI => &.{&HSIDiv},
            };

            // ======= NODE I3C1output ======
            I3C1output.nodetype = .output;
            I3C1output.parents = &.{&I3C1Mult};

            // ======= NODE RNGMult ======
            RNGMult.nodetype = .multi;
            RNGMult.parents = switch (RNGCLockSelectionValue) {
                .RCC_RNGCLKSOURCE_HSI48 => &.{&HSI48RC},
                .RCC_RNGCLKSOURCE_PLL1Q => &.{&PLL1Q},
                .RCC_RNGCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_RNGCLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE RNGoutput ======
            RNGoutput.nodetype = .output;
            RNGoutput.parents = &.{&RNGMult};

            // ======= NODE MCOMult ======
            MCOMult.nodetype = .multi;
            MCOMult.parents = switch (RCC_MCO1SourceValue) {
                .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_HSI => &.{&HSIDiv},
                .RCC_MCO1SOURCE_PLL1Q => &.{&PLL1Q},
                .RCC_MCO1SOURCE_HSI48 => &.{&HSI48RC},
            };

            // ======= NODE MCODiv ======
            MCODiv.nodetype = .div;
            MCODiv.value = try RCC_MCODivValue.get();
            MCODiv.parents = &.{&MCOMult};

            // ======= NODE MCOPin ======
            MCOPin.nodetype = .output;
            MCOPin.parents = &.{&MCODiv};

            // ======= NODE MCO2Mult ======
            if (check_MCU("STM32H503RBTx")) {
                MCO2Mult.nodetype = .multi;
                MCO2Mult.parents = switch (RCC_MCO2SourceValue) {
                    .RCC_MCO2SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO2SOURCE_CSI => &.{&CSIRC},
                    .RCC_MCO2SOURCE_PLL1P => &.{&PLL1P},
                    .RCC_MCO2SOURCE_PLL2P => &.{&PLL2P},
                    .RCC_MCO2SOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE MCO2Div ======
            if (check_MCU("STM32H503RBTx")) {
                MCO2Div.nodetype = .div;
                MCO2Div.value = try RCC_MCO2DivValue.get();
                MCO2Div.parents = &.{&MCO2Mult};
            }
            // ======= NODE MCO2Pin ======
            if (check_MCU("STM32H503RBTx")) {
                MCO2Pin.nodetype = .output;
                MCO2Pin.parents = &.{&MCO2Div};
            }
            // ======= NODE LSCOMult ======
            if (!(check_MCU("STM32H503EBYx") or check_MCU("STM32H503KBUx"))) {
                LSCOMult.nodetype = .multi;
                LSCOMult.parents = switch (LSCOSource1Value) {
                    .RCC_LSCOSOURCE_LSI => &.{&LSIRC},
                    .RCC_LSCOSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LSCOOutput ======
            if (!(check_MCU("STM32H503EBYx") or check_MCU("STM32H503KBUx"))) {
                LSCOOutput.nodetype = .output;
                LSCOOutput.parents = &.{&LSCOMult};
            }
            // ======= NODE CKPERMult ======
            CKPERMult.nodetype = .multi;
            CKPERMult.parents = switch (CKPERSourceSelectionValue) {
                .RCC_CLKPSOURCE_HSI => &.{&HSIDiv},
                .RCC_CLKPSOURCE_HSE => &.{&HSEOSC},
                .RCC_CLKPSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE CKPERoutput ======
            CKPERoutput.nodetype = .output;
            CKPERoutput.parents = &.{&CKPERMult};

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

            // ======= NODE CortexCLockSelection ======
            CortexCLockSelection.nodetype = .multi;
            CortexCLockSelection.parents = switch (CortexCLockSelectionValue) {
                .SYSTICK_CLKSOURCE_HCLK_1_8 => &.{&CortexPrescaler},
                .SYSTICK_CLKSOURCE_LSE => &.{&LSEOSC},
                .SYSTICK_CLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE CortexSysOutput ======
            CortexSysOutput.nodetype = .output;
            CortexSysOutput.parents = &.{&CortexCLockSelection};

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

            // ======= NODE APB3Prescaler ======
            APB3Prescaler.nodetype = .div;
            APB3Prescaler.value = try APB3CLKDividerValue.get();
            APB3Prescaler.parents = &.{&AHBOutput};

            // ======= NODE APB3Output ======
            APB3Output.nodetype = .output;
            APB3Output.parents = &.{&APB3Prescaler};

            // ======= NODE TimPrescalerAPB2 ======
            TimPrescalerAPB2.nodetype = .mul;
            TimPrescalerAPB2.value = @floatFromInt(APB2TimCLKDividerValue);
            TimPrescalerAPB2.parents = &.{&APB2Prescaler};

            // ======= NODE TimPrescOut2 ======
            TimPrescOut2.nodetype = .output;
            TimPrescOut2.parents = &.{&TimPrescalerAPB2};

            // ======= NODE hsidivToUCPD ======
            if (check_MCU("UCPD_Exist")) {
                hsidivToUCPD.nodetype = .div;
                hsidivToUCPD.value = @floatFromInt(hsidivToUCPDValue);
                hsidivToUCPD.parents = &.{&HSIDiv};
            }
            // ======= NODE UCPD1Output ======
            if (check_MCU("UCPD_Exist")) {
                UCPD1Output.nodetype = .output;
                UCPD1Output.parents = &.{&hsidivToUCPD};
            }
            // ======= NODE SPI1Mult ======
            SPI1Mult.nodetype = .multi;
            SPI1Mult.parents = switch (SPI1CLockSelectionValue) {
                .RCC_SPI1CLKSOURCE_PLL1Q => &.{&PLL1Q},
                .RCC_SPI1CLKSOURCE_PLL2P => &.{&PLL2P},
                .RCC_SPI1CLKSOURCE_CLKP => &.{&CKPERMult},
                .RCC_SPI1CLKSOURCE_PIN => &.{&AUDIOCLK},
            };

            // ======= NODE SPI1output ======
            SPI1output.nodetype = .output;
            SPI1output.parents = &.{&SPI1Mult};

            // ======= NODE SPI3Mult ======
            SPI3Mult.nodetype = .multi;
            SPI3Mult.parents = switch (SPI3CLockSelectionValue) {
                .RCC_SPI3CLKSOURCE_PLL1Q => &.{&PLL1Q},
                .RCC_SPI3CLKSOURCE_PLL2P => &.{&PLL2P},
                .RCC_SPI3CLKSOURCE_CLKP => &.{&CKPERMult},
                .RCC_SPI3CLKSOURCE_PIN => &.{&AUDIOCLK},
            };

            // ======= NODE SPI3output ======
            SPI3output.nodetype = .output;
            SPI3output.parents = &.{&SPI3Mult};

            // ======= NODE SPI2Mult ======
            SPI2Mult.nodetype = .multi;
            SPI2Mult.parents = switch (SPI2CLockSelectionValue) {
                .RCC_SPI2CLKSOURCE_PLL1Q => &.{&PLL1Q},
                .RCC_SPI2CLKSOURCE_PLL2P => &.{&PLL2P},
                .RCC_SPI2CLKSOURCE_CLKP => &.{&CKPERMult},
                .RCC_SPI2CLKSOURCE_PIN => &.{&AUDIOCLK},
            };

            // ======= NODE SPI2output ======
            SPI2output.nodetype = .output;
            SPI2output.parents = &.{&SPI2Mult};

            // ======= NODE PLLN ======
            PLLN.nodetype = .mulfrac;
            PLLN.value = @floatFromInt(PLLNValue);
            PLLN.parents = &.{ &PLLM, &PLLFRACN };

            // ======= NODE PLLFRACN ======
            PLLFRACN.nodetype = .source;
            PLLFRACN.value = @floatFromInt(PLLFRACNValue);

            // ======= NODE PLL1P ======
            PLL1P.nodetype = .div;
            PLL1P.value = try PLL1PValue.get();
            PLL1P.parents = &.{&PLLN};

            // ======= NODE PLL1Q ======
            PLL1Q.nodetype = .div;
            PLL1Q.value = @floatFromInt(PLL1QValue);
            PLL1Q.parents = &.{&PLLN};

            // ======= NODE PLLQoutput ======
            PLLQoutput.nodetype = .output;
            PLLQoutput.parents = &.{&PLL1Q};

            // ======= NODE PLL1R ======
            PLL1R.nodetype = .div;
            PLL1R.value = @floatFromInt(PLL1RValue);
            PLL1R.parents = &.{&PLLN};

            // ======= NODE PLL2N ======
            PLL2N.nodetype = .mulfrac;
            PLL2N.value = @floatFromInt(PLL2NValue);
            PLL2N.parents = &.{ &PLL2M, &PLL2FRACN };

            // ======= NODE PLL2FRACN ======
            PLL2FRACN.nodetype = .source;
            PLL2FRACN.value = @floatFromInt(PLL2FRACNValue);

            // ======= NODE PLL2P ======
            PLL2P.nodetype = .div;
            PLL2P.value = @floatFromInt(PLL2PValue);
            PLL2P.parents = &.{&PLL2N};

            // ======= NODE PLL2Poutput ======
            PLL2Poutput.nodetype = .output;
            PLL2Poutput.parents = &.{&PLL2P};

            // ======= NODE PLL2Q ======
            PLL2Q.nodetype = .div;
            PLL2Q.value = @floatFromInt(PLL2QValue);
            PLL2Q.parents = &.{&PLL2N};

            // ======= NODE PLL2Qoutput ======
            PLL2Qoutput.nodetype = .output;
            PLL2Qoutput.parents = &.{&PLL2Q};

            // ======= NODE PLL2R ======
            PLL2R.nodetype = .div;
            PLL2R.value = @floatFromInt(PLL2RValue);
            PLL2R.parents = &.{&PLL2N};

            // ======= NODE PLL2Routput ======
            PLL2Routput.nodetype = .output;
            PLL2Routput.parents = &.{&PLL2R};

            // ======= NODE VCOInput ======
            VCOInput.nodetype = .output;
            VCOInput.parents = &.{&PLLM};

            // ======= NODE VCOInput2 ======
            VCOInput2.nodetype = .output;
            VCOInput2.parents = &.{&PLL2M};

            // ======= NODE VCOOutput ======
            VCOOutput.nodetype = .output;
            VCOOutput.parents = &.{&PLLN};

            // ======= NODE PLLPCLK ======
            PLLPCLK.nodetype = .output;
            PLLPCLK.parents = &.{&PLL1P};

            // ======= NODE VCOPLL2Output ======
            VCOPLL2Output.nodetype = .output;
            VCOPLL2Output.parents = &.{&PLL2N};

            //======== POST REFS ========

            //======= CRSFreq_Value ========
            const CRSFreq_ValueValue = CRSCLKoutput.get_as_ref();
            ignore_value(CRSFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);

            RTCOutput.limit = .{
                .min = null,
                .max = 5e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 100000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 100000000, .@"=")))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => scale3 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale3 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                    };
                } else if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 150000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 150000000, .@"="))) and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 100000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale2 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE2;
                    };
                } else if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 200000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 200000000, .@"="))) and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 150000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                } else if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 250000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 250000000, .@"="))) and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 200000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale0 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE0;
                    };
                } else if ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 250000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale0 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE0;
                    };
                }
                const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                if (user_val) |val| {
                    switch (val) {
                        .PWR_REGULATOR_VOLTAGE_SCALE3 => scale3 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                    }
                }
                break :blk user_val orelse {
                    scale3 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                };
            };

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);
            if (scale1) {
                USART1output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                USART1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                USART1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                USART1output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);
            if (scale1) {
                USART2output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                USART2output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                USART2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                USART2output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);
            if (scale1) {
                USART3output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                USART3output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                USART3output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                USART3output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);
            if (scale1) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);
            if (scale1) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);
            if (scale1) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= DACFreq_Value ========
            const DACFreq_ValueValue = DACoutput.get_as_ref();
            ignore_value(DACFreq_ValueValue);
            if (scale1) {
                DACoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                DACoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                DACoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                DACoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);
            if (scale1 and config.flags.DAC1_Used and !config.flags.ADC1_Used and !config.flags.ADC2_Used) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1 & DAC1_Used & !ADC1_Used & !ADC2_Used",
                    .main_dialog = "",
                };
            } else if (scale2 and config.flags.DAC1_Used and !config.flags.ADC1_Used and !config.flags.ADC2_Used) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2 & DAC1_Used & !ADC1_Used & !ADC2_Used",
                    .main_dialog = "",
                };
            } else if (scale3 and config.flags.DAC1_Used and !config.flags.ADC1_Used and !config.flags.ADC2_Used) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3 & DAC1_Used & !ADC1_Used & !ADC2_Used",
                    .main_dialog = "",
                };
            } else if (scale0 and config.flags.DAC1_Used and !config.flags.ADC1_Used and !config.flags.ADC2_Used) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0 & DAC1_Used & !ADC1_Used & !ADC2_Used",
                    .main_dialog = "",
                };
            } else if (scale1) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);

            USBoutput.limit = .{
                .min = null,
                .max = 5e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= FDCANFreq_Value ========
            const FDCANFreq_ValueValue = FDCANOutput.get_as_ref();
            ignore_value(FDCANFreq_ValueValue);
            if (scale1) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);
            if (scale1) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);
            if (scale1) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= I3C2Freq_Value ========
            const I3C2Freq_ValueValue = I3C2output.get_as_ref();
            ignore_value(I3C2Freq_ValueValue);
            if (scale1) {
                I3C2output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I3C2output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                I3C2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                I3C2output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= I3C1Freq_Value ========
            const I3C1Freq_ValueValue = I3C1output.get_as_ref();
            ignore_value(I3C1Freq_ValueValue);
            if (scale1) {
                I3C1output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I3C1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                I3C1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                I3C1output.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);
            if (scale1) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
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

            //======= CKPERFreq_Value ========
            const CKPERFreq_ValueValue = CKPERoutput.get_as_ref();
            ignore_value(CKPERFreq_ValueValue);

            CKPERoutput.limit = .{
                .min = null,
                .max = 6.4e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            PWRCLKoutput.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            HCLKOutput.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            CortexSysOutput.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            FCLKCortexOutput.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);

            APB1Output.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            TimPrescOut1.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB3Freq_Value ========
            const APB3Freq_ValueValue = APB3Output.get_as_ref();
            ignore_value(APB3Freq_ValueValue);

            APB3Output.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            TimPrescOut2.limit = .{
                .min = null,
                .max = 2.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= UCPD1outputFreq_Value ========
            const UCPD1outputFreq_ValueValue = UCPD1Output.get_as_ref();
            ignore_value(UCPD1outputFreq_ValueValue);

            //======= SPI1Freq_Value ========
            const SPI1Freq_ValueValue = SPI1output.get_as_ref();
            ignore_value(SPI1Freq_ValueValue);
            if (scale1) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= SPI3Freq_Value ========
            const SPI3Freq_ValueValue = SPI3output.get_as_ref();
            ignore_value(SPI3Freq_ValueValue);
            if (scale1) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= SPI2Freq_Value ========
            const SPI2Freq_ValueValue = SPI2output.get_as_ref();
            ignore_value(SPI2Freq_ValueValue);
            if (scale1) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale0) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "scale0",
                    .main_dialog = "",
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1 & PLL1QUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale2 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2 & PLL1QUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale3 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3 & PLL1QUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale0 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0 & PLL1QUsed=1",
                    .main_dialog = " ",
                };
            }

            //======= PLL2PoutputFreq_Value ========
            const PLL2PoutputFreq_ValueValue = PLL2Poutput.get_as_ref();
            ignore_value(PLL2PoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                PLL2Poutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1 & PLL2PUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                PLL2Poutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2 & PLL2PUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                PLL2Poutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3 & PLL2PUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale0 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                PLL2Poutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0 & PLL2PUsed=1",
                    .main_dialog = " ",
                };
            }

            //======= PLL2QoutputFreq_Value ========
            const PLL2QoutputFreq_ValueValue = PLL2Qoutput.get_as_ref();
            ignore_value(PLL2QoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1 & PLL2QUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2 & PLL2QUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3 & PLL2QUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale0 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0 & PLL2QUsed=1",
                    .main_dialog = " ",
                };
            }

            //======= PLL2RoutputFreq_Value ========
            const PLL2RoutputFreq_ValueValue = PLL2Routput.get_as_ref();
            ignore_value(PLL2RoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                PLL2Routput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1 & PLL2RUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                PLL2Routput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2 & PLL2RUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                PLL2Routput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3 & PLL2RUsed=1",
                    .main_dialog = " ",
                };
            } else if (scale0 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                PLL2Routput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale0 & PLL2RUsed=1",
                    .main_dialog = " ",
                };
            }

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = "(PLLUsed=1) ",
                    .main_dialog = " PLLUsed=1",
                };
            }

            //======= VCOInput2Freq_Value ========
            const VCOInput2Freq_ValueValue = VCOInput2.get_as_ref();
            ignore_value(VCOInput2Freq_ValueValue);
            if ((check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"="))) {
                VCOInput2.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = "(PLL2Used=1) ",
                    .main_dialog = "PLL2Used=1",
                };
            }

            const PLL1_VCI_RangeValue: PLL1_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1_VCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1_VCIRANGE_1;
                } else if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1_VCIRANGE_2;
                } else if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"="))) and (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"<")) or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"="))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1_VCIRANGE_3;
                }
                break :blk .RCC_PLL1_VCIRANGE_3;
            };

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLL1_VCI_RangeValue), PLL1_VCI_RangeValue, .RCC_PLL1_VCIRANGE_0, .@"=")) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOOutput.limit = .{
                    .min = 1.5e8,
                    .max = 4.2e8,
                    .main_expr = "(PLL1_VCI_Range=RCC_PLL1_VCIRANGE_0) & PLLUsed=1",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOOutput.limit = .{
                    .min = 1.28e8,
                    .max = 5.6e8,
                    .main_expr = "PLLUsed=1",
                    .main_dialog = "PLLUsed=1 ",
                };
            }

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPCLK.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) {
                PLLPCLK.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "PLL1PUsed=1",
                    .main_dialog = " ",
                };
            }

            const PLL2_VCI_RangeValue: PLL2_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2_VCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2_VCIRANGE_1;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2_VCIRANGE_2;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2_VCIRANGE_3;
                }
                break :blk .RCC_PLL2_VCIRANGE_3;
            };

            //======= VCOPLL2OutputFreq_Value ========
            const VCOPLL2OutputFreq_ValueValue = VCOPLL2Output.get_as_ref();
            ignore_value(VCOPLL2OutputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLL2_VCI_RangeValue), PLL2_VCI_RangeValue, .RCC_PLL2_VCIRANGE_0, .@"=")) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                VCOPLL2Output.limit = .{
                    .min = 1.5e8,
                    .max = 4.2e8,
                    .main_expr = "(PLL2_VCI_Range=RCC_PLL2_VCIRANGE_0) & PLL2Used=1",
                    .main_dialog = "PLL2Used=1 ",
                };
            } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                VCOPLL2Output.limit = .{
                    .min = 1.28e8,
                    .max = 5.6e8,
                    .main_expr = "PLL2Used=1",
                    .main_dialog = "PLL2Used=1 ",
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if ((scale3 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 20000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 20000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale3 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 40000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 40000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale3 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 60000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 60000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale3 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 80000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 80000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale3 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 100000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 100000000, .@"="))))) {
                    break :blk .FLASH_LATENCY_4;
                } else if (scale2 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 30000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 30000000, .@"=")))) {
                    break :blk .FLASH_LATENCY_0;
                } else if (scale2 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 60000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 60000000, .@"="))) {
                    break :blk .FLASH_LATENCY_1;
                } else if (scale2 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 90000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 90000000, .@"="))) {
                    break :blk .FLASH_LATENCY_2;
                } else if (scale2 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 120000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 120000000, .@"="))) {
                    break :blk .FLASH_LATENCY_3;
                } else if (scale2 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 150000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 150000000, .@"="))) {
                    break :blk .FLASH_LATENCY_4;
                } else if (scale1 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 34000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 34000000, .@"=")))) {
                    break :blk .FLASH_LATENCY_0;
                } else if (scale1 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 68000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 68000000, .@"="))) {
                    break :blk .FLASH_LATENCY_1;
                } else if (scale1 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 102000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 102000000, .@"="))) {
                    break :blk .FLASH_LATENCY_2;
                } else if (scale1 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 136000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 136000000, .@"="))) {
                    break :blk .FLASH_LATENCY_3;
                } else if (scale1 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 170000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 170000000, .@"="))) {
                    break :blk .FLASH_LATENCY_4;
                } else if (scale1 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 200000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 200000000, .@"="))) {
                    break :blk .FLASH_LATENCY_5;
                } else if (scale0 and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 42000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 42000000, .@"=")))) {
                    break :blk .FLASH_LATENCY_0;
                } else if (scale0 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 84000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 84000000, .@"="))) {
                    break :blk .FLASH_LATENCY_1;
                } else if (scale0 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 126000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 126000000, .@"="))) {
                    break :blk .FLASH_LATENCY_2;
                } else if (scale0 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 168000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 168000000, .@"="))) {
                    break :blk .FLASH_LATENCY_3;
                } else if (scale0 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 210000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 210000000, .@"="))) {
                    break :blk .FLASH_LATENCY_4;
                } else if (scale0 and (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 250000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 250000000, .@"="))) {
                    break :blk .FLASH_LATENCY_5;
                }
                break :blk .FLASH_LATENCY_0;
            };

            const Flash_DelayValue: ?Flash_DelayList = blk: {
                if ((check_ref(@TypeOf(FLatencyValue), FLatencyValue, .FLASH_LATENCY_0, .@"=")) or (check_ref(@TypeOf(FLatencyValue), FLatencyValue, .FLASH_LATENCY_1, .@"="))) {
                    break :blk .FLASH_PROGRAMMING_DELAY_0;
                } else if ((check_ref(@TypeOf(FLatencyValue), FLatencyValue, .FLASH_LATENCY_2, .@"=")) or (check_ref(@TypeOf(FLatencyValue), FLatencyValue, .FLASH_LATENCY_3, .@"="))) {
                    break :blk .FLASH_PROGRAMMING_DELAY_1;
                } else if ((check_ref(@TypeOf(FLatencyValue), FLatencyValue, .FLASH_LATENCY_4, .@"=")) or (check_ref(@TypeOf(FLatencyValue), FLatencyValue, .FLASH_LATENCY_5, .@"="))) {
                    break :blk .FLASH_PROGRAMMING_DELAY_2;
                }
                break :blk null;
            };

            const PLL1_VCO_SELValue: PLL1_VCO_SELList = blk: {
                if ((false) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1_VCORANGE_MEDIUM;
                } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1_VCORANGE_WIDE;
                }
                break :blk .RCC_PLL1_VCORANGE_WIDE;
            };

            const PLL2_VCO_SELValue: PLL2_VCO_SELList = blk: {
                if ((check_ref(@TypeOf(PLL2_VCI_RangeValue), PLL2_VCI_RangeValue, .RCC_PLL2_VCIRANGE_0, .@"=")) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2_VCORANGE_MEDIUM;
                } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2_VCORANGE_WIDE;
                }
                break :blk .RCC_PLL2_VCORANGE_WIDE;
            };
            if (!(check_ref(@TypeOf(EnableCRSValue), EnableCRSValue, .true, .@"="))) {
                CRSCLKoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableCRSValue), EnableCRSValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                HSI48RC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"="))) {
                LSIRC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableExtClockForSAI1Value), EnableExtClockForSAI1Value, .true, .@"="))) {
                AUDIOCLK.nodetype = .off;
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
            if (!(check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"="))) {
                DACMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"="))) {
                DACoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"="))) {
                ADCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                CK48Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                USBoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANOutput.nodetype = .off;
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
            if (!(check_ref(@TypeOf(I3C2EnableValue), I3C2EnableValue, .true, .@"="))) {
                I3C2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I3C2EnableValue), I3C2EnableValue, .true, .@"="))) {
                I3C2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I3C1EnableValue), I3C1EnableValue, .true, .@"="))) {
                I3C1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I3C1EnableValue), I3C1EnableValue, .true, .@"="))) {
                I3C1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGoutput.nodetype = .off;
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
            if (!(check_ref(@TypeOf(CKPEREnableValue), CKPEREnableValue, .true, .@"="))) {
                CKPERMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(CKPEREnableValue), CKPEREnableValue, .true, .@"="))) {
                CKPERoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SystickEnableValue), SystickEnableValue, .true, .@"="))) {
                CortexPrescaler.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SystickEnableValue), SystickEnableValue, .true, .@"="))) {
                CortexCLockSelection.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SystickEnableValue), SystickEnableValue, .true, .@"="))) {
                CortexSysOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(UCPDEnableValue), UCPDEnableValue, .true, .@"="))) {
                hsidivToUCPD.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(UCPDEnableValue), UCPDEnableValue, .true, .@"="))) {
                UCPD1Output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"="))) {
                SPI1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"="))) {
                SPI1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"="))) {
                SPI3Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"="))) {
                SPI3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"="))) {
                SPI2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"="))) {
                SPI2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"="))) {
                PLL1Q.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"="))) {
                PLLQoutput.nodetype = .off;
            }
            if (!(false)) {
                PLL1R.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=") or check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=") or check_ref(@TypeOf(I3C1EnableValue), I3C1EnableValue, .true, .@"=") or check_ref(@TypeOf(I3C2EnableValue), I3C2EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=") or check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2EnableValue), MCO2EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"="))) {
                PLL2N.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2EnableValue), MCO2EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"="))) {
                PLL2P.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2EnableValue), MCO2EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"="))) {
                PLL2Poutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=") or check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                PLL2Q.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=") or check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                PLL2Qoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=") or check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=") or check_ref(@TypeOf(I3C1EnableValue), I3C1EnableValue, .true, .@"=") or check_ref(@TypeOf(I3C2EnableValue), I3C2EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"="))) {
                PLL2R.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=") or check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=") or check_ref(@TypeOf(I3C1EnableValue), I3C1EnableValue, .true, .@"=") or check_ref(@TypeOf(I3C2EnableValue), I3C2EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"="))) {
                PLL2Routput.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.HSIDiv = try HSIDiv.get_output();
            out.CRSCLKoutput = try CRSCLKoutput.get_output();
            out.HSI48RC = try HSI48RC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.CSIRC = try CSIRC.get_output();
            out.AUDIOCLK = try AUDIOCLK.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.PLL2Source = try PLL2Source.get_output();
            out.PLLM = try PLLM.get_output();
            out.PLL2M = try PLL2M.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2output = try USART2output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3output = try USART3output.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.LPTIM2Mult = try LPTIM2Mult.get_output();
            out.LPTIM2output = try LPTIM2output.get_output();
            out.DACMult = try DACMult.get_output();
            out.DACoutput = try DACoutput.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.CK48Mult = try CK48Mult.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.FDCANMult = try FDCANMult.get_output();
            out.FDCANOutput = try FDCANOutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2output = try I2C2output.get_output();
            out.I3C2Mult = try I3C2Mult.get_output();
            out.I3C2output = try I3C2output.get_output();
            out.I3C1Mult = try I3C1Mult.get_output();
            out.I3C1output = try I3C1output.get_output();
            out.RNGMult = try RNGMult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
            out.CKPERMult = try CKPERMult.get_output();
            out.CKPERoutput = try CKPERoutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.PWRCLKoutput = try PWRCLKoutput.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.CortexPrescaler = try CortexPrescaler.get_output();
            out.CortexCLockSelection = try CortexCLockSelection.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.APB1Prescaler = try APB1Prescaler.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.TimPrescalerAPB1 = try TimPrescalerAPB1.get_output();
            out.TimPrescOut1 = try TimPrescOut1.get_output();
            out.APB2Prescaler = try APB2Prescaler.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.APB3Prescaler = try APB3Prescaler.get_output();
            out.APB3Output = try APB3Output.get_output();
            out.TimPrescalerAPB2 = try TimPrescalerAPB2.get_output();
            out.TimPrescOut2 = try TimPrescOut2.get_output();
            out.hsidivToUCPD = try hsidivToUCPD.get_output();
            out.UCPD1Output = try UCPD1Output.get_output();
            out.SPI1Mult = try SPI1Mult.get_output();
            out.SPI1output = try SPI1output.get_output();
            out.SPI3Mult = try SPI3Mult.get_output();
            out.SPI3output = try SPI3output.get_output();
            out.SPI2Mult = try SPI2Mult.get_output();
            out.SPI2output = try SPI2output.get_output();
            out.PLLN = try PLLN.get_output();
            out.PLLFRACN = try PLLFRACN.get_output();
            out.PLL1P = try PLL1P.get_output();
            out.PLL1Q = try PLL1Q.get_output();
            out.PLLQoutput = try PLLQoutput.get_output();
            out.PLL1R = try PLL1R.get_output();
            out.PLL2N = try PLL2N.get_output();
            out.PLL2FRACN = try PLL2FRACN.get_output();
            out.PLL2P = try PLL2P.get_output();
            out.PLL2Poutput = try PLL2Poutput.get_output();
            out.PLL2Q = try PLL2Q.get_output();
            out.PLL2Qoutput = try PLL2Qoutput.get_output();
            out.PLL2R = try PLL2R.get_output();
            out.PLL2Routput = try PLL2Routput.get_output();
            out.LSI = 0;
            out.PLLSRC = 0;
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOInput2 = try VCOInput2.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLPCLK = try PLLPCLK.get_extra_output();
            out.VCOPLL2Output = try VCOPLL2Output.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ref_out.HSIDiv = HSIDivValue;
            ignore_value(CRSFreq_ValueValue);
            ignore_value(HSI48_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ignore_value(CSI_VALUEValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLL2Source = PLL2SourceValue;
            ref_out.PLLM = PLLMValue;
            ref_out.PLL2M = PLL2MValue;
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.USART1CLockSelection = USART1CLockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.USART2CLockSelection = USART2CLockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.USART3CLockSelection = USART3CLockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.LPUART1CLockSelection = LPUART1CLockSelectionValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.LPTIM2CLockSelection = LPTIM2CLockSelectionValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.DACLowPowerCLockSelection = DACLowPowerCLockSelectionValue;
            ignore_value(DACFreq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.USBCLockSelection = USBCLockSelectionValue;
            ignore_value(USBFreq_ValueValue);
            ref_out.FDCANClockSelection = FDCANClockSelectionValue;
            ignore_value(FDCANFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C2CLockSelection = I2C2CLockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.I3C2CLockSelection = I3C2CLockSelectionValue;
            ignore_value(I3C2Freq_ValueValue);
            ref_out.I3C1CLockSelection = I3C1CLockSelectionValue;
            ignore_value(I3C1Freq_ValueValue);
            ref_out.RNGCLockSelection = RNGCLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCO2Div = RCC_MCO2DivValue;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.LSCOSource1 = LSCOSource1Value;
            ignore_value(LSCOPinFreq_ValueValue);
            ref_out.CKPERSourceSelection = CKPERSourceSelectionValue;
            ignore_value(CKPERFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(PWRFreq_ValueValue);
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ref_out.CortexCLockSelection = CortexCLockSelectionValue;
            ignore_value(CortexFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APB1Freq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APB1TimFreq_ValueValue);
            ref_out.APB2CLKDivider = APB2CLKDividerValue;
            ignore_value(APB2Freq_ValueValue);
            ref_out.APB3CLKDivider = APB3CLKDividerValue;
            ignore_value(APB3Freq_ValueValue);
            ref_out.APB2TimCLKDivider = APB2TimCLKDividerValue;
            ignore_value(APB2TimFreq_ValueValue);
            ref_out.hsidivToUCPD = hsidivToUCPDValue;
            ignore_value(UCPD1outputFreq_ValueValue);
            ref_out.SPI1CLockSelection = SPI1CLockSelectionValue;
            ignore_value(SPI1Freq_ValueValue);
            ref_out.SPI3CLockSelection = SPI3CLockSelectionValue;
            ignore_value(SPI3Freq_ValueValue);
            ref_out.SPI2CLockSelection = SPI2CLockSelectionValue;
            ignore_value(SPI2Freq_ValueValue);
            ref_out.PLLN = PLLNValue;
            ignore_value(PLLFRACNValue);
            ref_out.PLL1P = PLL1PValue;
            ref_out.PLL1Q = PLL1QValue;
            ignore_value(PLLQoutputFreq_ValueValue);
            ref_out.PLL1R = PLL1RValue;
            ref_out.PLL2N = PLL2NValue;
            ignore_value(PLL2FRACNValue);
            ref_out.PLL2P = PLL2PValue;
            ignore_value(PLL2PoutputFreq_ValueValue);
            ref_out.PLL2Q = PLL2QValue;
            ignore_value(PLL2QoutputFreq_ValueValue);
            ref_out.PLL2R = PLL2RValue;
            ignore_value(PLL2RoutputFreq_ValueValue);
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOInput2Freq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLPoutputFreq_ValueValue);
            ignore_value(VCOPLL2OutputFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.FLatency = FLatencyValue;
            ref_out.Flash_Delay = Flash_DelayValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.CSICalibrationValue = CSICalibrationValueValue;
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
            ref_out.PLL1_VCI_Range = PLL1_VCI_RangeValue;
            ref_out.PLL2_VCI_Range = PLL2_VCI_RangeValue;
            ref_out.flags.EnableCRS = EnableCRSValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.EnableExtClockForSAI1 = EnableExtClockForSAI1Value == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.EnableHSELCDDevisor = EnableHSELCDDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.DACEnable = DACEnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.FDCANEnable = FDCANEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.I3C2Enable = I3C2EnableValue == .true;
            ref_out.flags.I3C1Enable = I3C1EnableValue == .true;
            ref_out.flags.MCO2Enable = MCO2EnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.CKPEREnable = CKPEREnableValue == .true;
            ref_out.flags.SystickEnable = SystickEnableValue == .true;
            ref_out.flags.UCPDEnable = UCPDEnableValue == .true;
            ref_out.flags.SPI1Enable = SPI1EnableValue == .true;
            ref_out.flags.SPI3Enable = SPI3EnableValue == .true;
            ref_out.flags.SPI2Enable = SPI2EnableValue == .true;
            ref_out.RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_SelectionValue;
            ref_out.flags.PLL1QUsed = PLL1QUsedValue != 0;
            ref_out.flags.PLL2PUsed = PLL2PUsedValue != 0;
            ref_out.flags.PLL2QUsed = PLL2QUsedValue != 0;
            ref_out.flags.PLL2RUsed = PLL2RUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.PLL2Used = PLL2UsedValue != 0;
            ref_out.flags.PLL1PUsed = PLL1PUsedValue != 0;
            ref_out.LSEUsed = LSEUsedValue;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.HSIUsed = HSIUsedValue;
            ref_out.flags.EnbaleCSS = EnbaleCSSValue == .true;
            ref_out.flags.HSI48Used = HSI48UsedValue != 0;
            ref_out.PLL1_VCO_SEL = PLL1_VCO_SELValue;
            ref_out.PLL2_VCO_SEL = PLL2_VCO_SELValue;
            ref_out.PLL1RUsed = PLL1RUsedValue;

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
