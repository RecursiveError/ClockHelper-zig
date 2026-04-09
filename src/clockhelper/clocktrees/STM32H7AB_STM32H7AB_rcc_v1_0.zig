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
        pub const RCC_SDMMCSEL = enum(u1) {
            PLL1_Q = 0,
            PLL2_R = 1,
        };
        pub const RCC_SAISEL = enum(u3) {
            PLL1_Q = 0,
            PLL2_P = 1,
            PLL3_P = 2,
            I2S_CKIN = 3,
            PER = 4,
        };
        pub const RCC_LPTIM1SEL = enum(u3) {
            PCLK1 = 0,
            PLL2_P = 1,
            PLL3_R = 2,
            LSE = 3,
            LSI = 4,
            PER = 5,
        };
        pub const RCC_I2C1235SEL = enum(u2) {
            PCLK1 = 0,
            PLL3_R = 1,
            HSI = 2,
            CSI = 3,
        };
        pub const RCC_LPUARTSEL = enum(u3) {
            PCLK4 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            LSE = 5,
        };
        pub const RCC_SAIASEL = enum(u3) {
            PLL1_Q = 0,
            PLL2_P = 1,
            PLL3_P = 2,
            I2S_CKIN = 3,
            PER = 4,
        };
        pub const RCC_PLLSRC = enum(u2) {
            HSI = 0,
            CSI = 1,
            HSE = 2,
        };
        pub const RCC_SW = enum(u3) {
            HSI = 0,
            CSI = 1,
            HSE = 2,
            PLL1_P = 3,
        };
        pub const RCC_MCO1SEL = enum(u3) {
            HSI = 0,
            LSE = 1,
            HSE = 2,
            PLL1_Q = 3,
            HSI48 = 4,
        };
        pub const RCC_SPDIFRXSEL = enum(u2) {
            PLL1_Q = 0,
            PLL2_R = 1,
            PLL3_R = 2,
            HSI = 3,
        };
        pub const RCC_USART16910SEL = enum(u3) {
            PCLK2 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            LSE = 5,
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
        pub const RCC_PLLRGE = enum(u2) {
            Range1 = 0,
            Range2 = 1,
            Range4 = 2,
            Range8 = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_TIMPRE = enum(u1) {
            DefaultX2 = 0,
            DefaultX4 = 1,
        };
        pub const RCC_DFSDMSEL = enum(u1) {
            PCLK2 = 0,
            SYS = 1,
        };
        pub const RCC_PLLVCOSEL = enum(u1) {
            WideVCO = 0,
            MediumVCO = 1,
        };
        pub const RCC_FMCSEL = enum(u2) {
            HCLK3 = 0,
            PLL1_Q = 1,
            PLL2_R = 2,
            PER = 3,
        };
        pub const RCC_SPI6SEL = enum(u3) {
            PCLK4 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            HSE = 5,
        };
        pub const RCC_USBSEL = enum(u2) {
            PLL1_Q = 1,
            PLL3_Q = 2,
            HSI48 = 3,
        };
        pub const RCC_MCO2SEL = enum(u3) {
            SYS = 0,
            PLL2_P = 1,
            HSE = 2,
            PLL1_P = 3,
            CSI = 4,
            LSI = 5,
        };
        pub const RCC_I2C4SEL = enum(u2) {
            PCLK4 = 0,
            PLL3_R = 1,
            HSI = 2,
            CSI = 3,
        };
        pub const RCC_HSIDIV = enum(u2) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_CECSEL = enum(u2) {
            LSE = 0,
            LSI = 1,
            CSI = 2,
        };
        pub const RCC_FDCANSEL = enum(u2) {
            HSE = 0,
            PLL1_Q = 1,
            PLL2_Q = 2,
        };
        pub const PWR_VOS = enum(u2) {
            Scale3 = 0,
            Scale2 = 1,
            Scale1 = 2,
            Scale0 = 3,
        };
        pub const RCC_USART234578SEL = enum(u3) {
            PCLK1 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            LSE = 5,
        };
        pub const RCC_LPTIM2SEL = enum(u3) {
            PCLK4 = 0,
            PLL2_P = 1,
            PLL3_R = 2,
            LSE = 3,
            LSI = 4,
            PER = 5,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const RCC_SPI45SEL = enum(u3) {
            PCLK2 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            HSE = 5,
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
        pub const RCC_RNGSEL = enum(u2) {
            HSI48 = 0,
            PLL1_Q = 1,
            LSE = 2,
            LSI = 3,
        };
        pub const RCC_ADCSEL = enum(u2) {
            PLL2_P = 0,
            PLL3_R = 1,
            PER = 2,
        };
        pub const RCC_SWPMISEL = enum(u1) {
            PCLK1 = 0,
            HSI = 1,
        };

        pub const HSIDivList = enum {
            RCC_PLLSAIDIVR_1,
            RCC_PLLSAIDIVR_2,
            RCC_PLLSAIDIVR_4,
            RCC_PLLSAIDIVR_8,

            pub fn to_enum(self: @This()) anyerror!RCC_HSIDIV {
                return switch (self) {
                    .RCC_PLLSAIDIVR_1 => .Div1,
                    .RCC_PLLSAIDIVR_4 => .Div4,
                    .RCC_PLLSAIDIVR_2 => .Div2,
                    .RCC_PLLSAIDIVR_8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_HSIDIV) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_PLLSAIDIVR_1,
                    .Div4 => .RCC_PLLSAIDIVR_4,
                    .Div2 => .RCC_PLLSAIDIVR_2,
                    .Div8 => .RCC_PLLSAIDIVR_8,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLSAIDIVR_1 => 1,
                    .RCC_PLLSAIDIVR_2 => 2,
                    .RCC_PLLSAIDIVR_4 => 4,
                    .RCC_PLLSAIDIVR_8 => 8,
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
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_P,
                    .RCC_SYSCLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .PLL1_P => .RCC_SYSCLKSOURCE_PLLCLK,
                    .CSI => .RCC_SYSCLKSOURCE_CSI,
                };
            }
        };

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSI48,
            RCC_MCO1SOURCE_PLL1QCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_MCO1SEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_PLL1QCLK => .PLL1_Q,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_MCO1SEL) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .PLL1_Q => .RCC_MCO1SOURCE_PLL1QCLK,
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
                };
            }
        };

        pub const RCC_MCODiv1List = enum {
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
                    .RCC_MCODIV_15 => .Div15,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_10 => .Div10,
                    .RCC_MCODIV_3 => .Div3,
                    .RCC_MCODIV_6 => .Div6,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_5 => .Div5,
                    .RCC_MCODIV_14 => .Div14,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_12 => .Div12,
                    .RCC_MCODIV_11 => .Div11,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_13 => .Div13,
                    .RCC_MCODIV_7 => .Div7,
                    .RCC_MCODIV_9 => .Div9,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div15 => .RCC_MCODIV_15,
                    .Div8 => .RCC_MCODIV_8,
                    .Div10 => .RCC_MCODIV_10,
                    .Div3 => .RCC_MCODIV_3,
                    .Div6 => .RCC_MCODIV_6,
                    .Div4 => .RCC_MCODIV_4,
                    .Div5 => .RCC_MCODIV_5,
                    .Div14 => .RCC_MCODIV_14,
                    .Div1 => .RCC_MCODIV_1,
                    .Div12 => .RCC_MCODIV_12,
                    .Div11 => .RCC_MCODIV_11,
                    .Div2 => .RCC_MCODIV_2,
                    .Div13 => .RCC_MCODIV_13,
                    .Div7 => .RCC_MCODIV_7,
                    .Div9 => .RCC_MCODIV_9,
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
            RCC_MCO2SOURCE_SYSCLK,
            RCC_MCO2SOURCE_PLL2PCLK,
            RCC_MCO2SOURCE_HSE,
            RCC_MCO2SOURCE_PLLCLK,
            RCC_MCO2SOURCE_CSICLK,
            RCC_MCO2SOURCE_LSICLK,

            pub fn to_enum(self: @This()) anyerror!RCC_MCO2SEL {
                return switch (self) {
                    .RCC_MCO2SOURCE_PLLCLK => .PLL1_P,
                    .RCC_MCO2SOURCE_HSE => .HSE,
                    .RCC_MCO2SOURCE_SYSCLK => .SYS,
                    .RCC_MCO2SOURCE_CSICLK => .CSI,
                    .RCC_MCO2SOURCE_PLL2PCLK => .PLL2_P,
                    .RCC_MCO2SOURCE_LSICLK => .LSI,
                };
            }
            pub fn from_enum(item: RCC_MCO2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_MCO2SOURCE_PLLCLK,
                    .HSE => .RCC_MCO2SOURCE_HSE,
                    .SYS => .RCC_MCO2SOURCE_SYSCLK,
                    .CSI => .RCC_MCO2SOURCE_CSICLK,
                    .PLL2_P => .RCC_MCO2SOURCE_PLL2PCLK,
                    .LSI => .RCC_MCO2SOURCE_LSICLK,
                };
            }
        };

        pub const RCC_MCODiv2List = enum {
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
                    .RCC_MCODIV_15 => .Div15,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_10 => .Div10,
                    .RCC_MCODIV_3 => .Div3,
                    .RCC_MCODIV_6 => .Div6,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_5 => .Div5,
                    .RCC_MCODIV_14 => .Div14,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_12 => .Div12,
                    .RCC_MCODIV_11 => .Div11,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_13 => .Div13,
                    .RCC_MCODIV_7 => .Div7,
                    .RCC_MCODIV_9 => .Div9,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div15 => .RCC_MCODIV_15,
                    .Div8 => .RCC_MCODIV_8,
                    .Div10 => .RCC_MCODIV_10,
                    .Div3 => .RCC_MCODIV_3,
                    .Div6 => .RCC_MCODIV_6,
                    .Div4 => .RCC_MCODIV_4,
                    .Div5 => .RCC_MCODIV_5,
                    .Div14 => .RCC_MCODIV_14,
                    .Div1 => .RCC_MCODIV_1,
                    .Div12 => .RCC_MCODIV_12,
                    .Div11 => .RCC_MCODIV_11,
                    .Div2 => .RCC_MCODIV_2,
                    .Div13 => .RCC_MCODIV_13,
                    .Div7 => .RCC_MCODIV_7,
                    .Div9 => .RCC_MCODIV_9,
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

        pub const traceClkSourceVirtualList = enum {
            RCC_TRACECLKSOURCE_HSI,
            RCC_TRACECLKSOURCE_CSI,
            RCC_TRACECLKSOURCE_HSE,
            RCC_TRACECLKSOURCE_PLLCLK,
        };

        pub const CDCPREList = enum {
            RCC_SYSCLK_DIV1,
            RCC_SYSCLK_DIV2,
            RCC_SYSCLK_DIV4,
            RCC_SYSCLK_DIV8,
            RCC_SYSCLK_DIV16,
            RCC_SYSCLK_DIV64,
            RCC_SYSCLK_DIV128,
            RCC_SYSCLK_DIV256,
            RCC_SYSCLK_DIV512,

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

        pub const HPREList = enum {
            RCC_HCLK_DIV1,
            RCC_HCLK_DIV2,
            RCC_HCLK_DIV4,
            RCC_HCLK_DIV8,
            RCC_HCLK_DIV16,
            RCC_HCLK_DIV64,
            RCC_HCLK_DIV128,
            RCC_HCLK_DIV256,
            RCC_HCLK_DIV512,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_HCLK_DIV512 => .Div512,
                    .RCC_HCLK_DIV128 => .Div128,
                    .RCC_HCLK_DIV2 => .Div2,
                    .RCC_HCLK_DIV4 => .Div4,
                    .RCC_HCLK_DIV16 => .Div16,
                    .RCC_HCLK_DIV64 => .Div64,
                    .RCC_HCLK_DIV8 => .Div8,
                    .RCC_HCLK_DIV256 => .Div256,
                    .RCC_HCLK_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div512 => .RCC_HCLK_DIV512,
                    .Div128 => .RCC_HCLK_DIV128,
                    .Div2 => .RCC_HCLK_DIV2,
                    .Div4 => .RCC_HCLK_DIV4,
                    .Div16 => .RCC_HCLK_DIV16,
                    .Div64 => .RCC_HCLK_DIV64,
                    .Div8 => .RCC_HCLK_DIV8,
                    .Div256 => .RCC_HCLK_DIV256,
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
                    .RCC_HCLK_DIV64 => 64,
                    .RCC_HCLK_DIV128 => 128,
                    .RCC_HCLK_DIV256 => 256,
                    .RCC_HCLK_DIV512 => 512,
                };
            }
        };

        pub const CDPPREList = enum {
            RCC_APB3_DIV1,
            RCC_APB3_DIV2,
            RCC_APB3_DIV4,
            RCC_APB3_DIV8,
            RCC_APB3_DIV16,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_APB3_DIV1 => 1,
                    .RCC_APB3_DIV2 => 2,
                    .RCC_APB3_DIV4 => 4,
                    .RCC_APB3_DIV8 => 8,
                    .RCC_APB3_DIV16 => 16,
                };
            }
        };

        pub const CDPPRE1List = enum {
            RCC_APB1_DIV1,
            RCC_APB1_DIV2,
            RCC_APB1_DIV4,
            RCC_APB1_DIV8,
            RCC_APB1_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB1_DIV4 => .Div4,
                    .RCC_APB1_DIV16 => .Div16,
                    .RCC_APB1_DIV2 => .Div2,
                    .RCC_APB1_DIV1 => .Div1,
                    .RCC_APB1_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_APB1_DIV4,
                    .Div16 => .RCC_APB1_DIV16,
                    .Div2 => .RCC_APB1_DIV2,
                    .Div1 => .RCC_APB1_DIV1,
                    .Div8 => .RCC_APB1_DIV8,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_APB1_DIV1 => 1,
                    .RCC_APB1_DIV2 => 2,
                    .RCC_APB1_DIV4 => 4,
                    .RCC_APB1_DIV8 => 8,
                    .RCC_APB1_DIV16 => 16,
                };
            }
        };

        pub const CDPPRE2List = enum {
            RCC_APB2_DIV1,
            RCC_APB2_DIV2,
            RCC_APB2_DIV4,
            RCC_APB2_DIV8,
            RCC_APB2_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB2_DIV4 => .Div4,
                    .RCC_APB2_DIV2 => .Div2,
                    .RCC_APB2_DIV8 => .Div8,
                    .RCC_APB2_DIV1 => .Div1,
                    .RCC_APB2_DIV16 => .Div16,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_APB2_DIV4,
                    .Div2 => .RCC_APB2_DIV2,
                    .Div8 => .RCC_APB2_DIV8,
                    .Div1 => .RCC_APB2_DIV1,
                    .Div16 => .RCC_APB2_DIV16,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_APB2_DIV1 => 1,
                    .RCC_APB2_DIV2 => 2,
                    .RCC_APB2_DIV4 => 4,
                    .RCC_APB2_DIV8 => 8,
                    .RCC_APB2_DIV16 => 16,
                };
            }
        };

        pub const SRDPPREList = enum {
            RCC_APB4_DIV1,
            RCC_APB4_DIV2,
            RCC_APB4_DIV4,
            RCC_APB4_DIV8,
            RCC_APB4_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB4_DIV8 => .Div8,
                    .RCC_APB4_DIV2 => .Div2,
                    .RCC_APB4_DIV16 => .Div16,
                    .RCC_APB4_DIV4 => .Div4,
                    .RCC_APB4_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div8 => .RCC_APB4_DIV8,
                    .Div2 => .RCC_APB4_DIV2,
                    .Div16 => .RCC_APB4_DIV16,
                    .Div4 => .RCC_APB4_DIV4,
                    .Div1 => .RCC_APB4_DIV1,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_APB4_DIV1 => 1,
                    .RCC_APB4_DIV2 => 2,
                    .RCC_APB4_DIV4 => 4,
                    .RCC_APB4_DIV8 => 8,
                    .RCC_APB4_DIV16 => 16,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_CSI => .CSI,
                    .RCC_PLLSOURCE_HSE => .HSE,
                    .RCC_PLLSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_PLLSOURCE_CSI,
                    .HSE => .RCC_PLLSOURCE_HSE,
                    .HSI => .RCC_PLLSOURCE_HSI,
                };
            }
        };

        pub const CKPERSourceSelectionList = enum {
            RCC_CLKPSOURCE_HSI,
            RCC_CLKPSOURCE_CSI,
            RCC_CLKPSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_CLKPSOURCE_CSI => .CSI,
                    .RCC_CLKPSOURCE_HSE => .HSE,
                    .RCC_CLKPSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_CLKPSOURCE_CSI,
                    .HSE => .RCC_CLKPSOURCE_HSE,
                    .HSI => .RCC_CLKPSOURCE_HSI,
                };
            }
        };

        pub const DIVP1List = enum {
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
                    .@"122" => .Div122,
                    .@"10" => .Div10,
                    .@"46" => .Div46,
                    .@"98" => .Div98,
                    .@"34" => .Div34,
                    .@"118" => .Div118,
                    .@"66" => .Div66,
                    .@"18" => .Div18,
                    .@"54" => .Div54,
                    .@"44" => .Div44,
                    .@"72" => .Div72,
                    .@"38" => .Div38,
                    .@"78" => .Div78,
                    .@"108" => .Div108,
                    .@"60" => .Div60,
                    .@"114" => .Div114,
                    .@"128" => .Div128,
                    .@"48" => .Div48,
                    .@"64" => .Div64,
                    .@"88" => .Div88,
                    .@"20" => .Div20,
                    .@"50" => .Div50,
                    .@"104" => .Div104,
                    .@"42" => .Div42,
                    .@"94" => .Div94,
                    .@"62" => .Div62,
                    .@"112" => .Div112,
                    .@"96" => .Div96,
                    .@"56" => .Div56,
                    .@"80" => .Div80,
                    .@"74" => .Div74,
                    .@"28" => .Div28,
                    .@"26" => .Div26,
                    .@"102" => .Div102,
                    .@"110" => .Div110,
                    .@"82" => .Div82,
                    .@"116" => .Div116,
                    .@"76" => .Div76,
                    .@"6" => .Div6,
                    .@"30" => .Div30,
                    .@"40" => .Div40,
                    .@"84" => .Div84,
                    .@"22" => .Div22,
                    .@"124" => .Div124,
                    .@"2" => .Div2,
                    .@"32" => .Div32,
                    .@"36" => .Div36,
                    .@"92" => .Div92,
                    .@"14" => .Div14,
                    .@"100" => .Div100,
                    .@"8" => .Div8,
                    .@"52" => .Div52,
                    .@"58" => .Div58,
                    .@"70" => .Div70,
                    .@"126" => .Div126,
                    .@"120" => .Div120,
                    .@"68" => .Div68,
                    .@"16" => .Div16,
                    .@"12" => .Div12,
                    .@"24" => .Div24,
                    .@"106" => .Div106,
                    .@"4" => .Div4,
                    .@"90" => .Div90,
                    .@"86" => .Div86,
                };
            }
            pub fn from_enum(item: RCC_PLLDIV) anyerror!@This() {
                return switch (item) {
                    .Div122 => .@"122",
                    .Div10 => .@"10",
                    .Div46 => .@"46",
                    .Div98 => .@"98",
                    .Div34 => .@"34",
                    .Div118 => .@"118",
                    .Div66 => .@"66",
                    .Div18 => .@"18",
                    .Div54 => .@"54",
                    .Div44 => .@"44",
                    .Div72 => .@"72",
                    .Div38 => .@"38",
                    .Div78 => .@"78",
                    .Div108 => .@"108",
                    .Div60 => .@"60",
                    .Div114 => .@"114",
                    .Div128 => .@"128",
                    .Div48 => .@"48",
                    .Div64 => .@"64",
                    .Div88 => .@"88",
                    .Div20 => .@"20",
                    .Div50 => .@"50",
                    .Div104 => .@"104",
                    .Div42 => .@"42",
                    .Div94 => .@"94",
                    .Div62 => .@"62",
                    .Div112 => .@"112",
                    .Div96 => .@"96",
                    .Div56 => .@"56",
                    .Div80 => .@"80",
                    .Div74 => .@"74",
                    .Div28 => .@"28",
                    .Div26 => .@"26",
                    .Div102 => .@"102",
                    .Div110 => .@"110",
                    .Div82 => .@"82",
                    .Div116 => .@"116",
                    .Div76 => .@"76",
                    .Div6 => .@"6",
                    .Div30 => .@"30",
                    .Div40 => .@"40",
                    .Div84 => .@"84",
                    .Div22 => .@"22",
                    .Div124 => .@"124",
                    .Div2 => .@"2",
                    .Div32 => .@"32",
                    .Div36 => .@"36",
                    .Div92 => .@"92",
                    .Div14 => .@"14",
                    .Div100 => .@"100",
                    .Div8 => .@"8",
                    .Div52 => .@"52",
                    .Div58 => .@"58",
                    .Div70 => .@"70",
                    .Div126 => .@"126",
                    .Div120 => .@"120",
                    .Div68 => .@"68",
                    .Div16 => .@"16",
                    .Div12 => .@"12",
                    .Div24 => .@"24",
                    .Div106 => .@"106",
                    .Div4 => .@"4",
                    .Div90 => .@"90",
                    .Div86 => .@"86",
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLDIV", @tagName(item), "DIVP1" },
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

        pub const RCC_RTC_Clock_Source_FROM_HSEList = enum {
            RCC_RTCCLKSOURCE_HSE_DIV2,
            RCC_RTCCLKSOURCE_HSE_DIV3,
            RCC_RTCCLKSOURCE_HSE_DIV4,
            RCC_RTCCLKSOURCE_HSE_DIV5,
            RCC_RTCCLKSOURCE_HSE_DIV6,
            RCC_RTCCLKSOURCE_HSE_DIV7,
            RCC_RTCCLKSOURCE_HSE_DIV8,
            RCC_RTCCLKSOURCE_HSE_DIV9,
            RCC_RTCCLKSOURCE_HSE_DIV10,
            RCC_RTCCLKSOURCE_HSE_DIV11,
            RCC_RTCCLKSOURCE_HSE_DIV12,
            RCC_RTCCLKSOURCE_HSE_DIV13,
            RCC_RTCCLKSOURCE_HSE_DIV14,
            RCC_RTCCLKSOURCE_HSE_DIV15,
            RCC_RTCCLKSOURCE_HSE_DIV16,
            RCC_RTCCLKSOURCE_HSE_DIV17,
            RCC_RTCCLKSOURCE_HSE_DIV18,
            RCC_RTCCLKSOURCE_HSE_DIV19,
            RCC_RTCCLKSOURCE_HSE_DIV20,
            RCC_RTCCLKSOURCE_HSE_DIV21,
            RCC_RTCCLKSOURCE_HSE_DIV22,
            RCC_RTCCLKSOURCE_HSE_DIV23,
            RCC_RTCCLKSOURCE_HSE_DIV24,
            RCC_RTCCLKSOURCE_HSE_DIV25,
            RCC_RTCCLKSOURCE_HSE_DIV26,
            RCC_RTCCLKSOURCE_HSE_DIV27,
            RCC_RTCCLKSOURCE_HSE_DIV28,
            RCC_RTCCLKSOURCE_HSE_DIV29,
            RCC_RTCCLKSOURCE_HSE_DIV30,
            RCC_RTCCLKSOURCE_HSE_DIV31,
            RCC_RTCCLKSOURCE_HSE_DIV32,
            RCC_RTCCLKSOURCE_HSE_DIV33,
            RCC_RTCCLKSOURCE_HSE_DIV34,
            RCC_RTCCLKSOURCE_HSE_DIV35,
            RCC_RTCCLKSOURCE_HSE_DIV36,
            RCC_RTCCLKSOURCE_HSE_DIV37,
            RCC_RTCCLKSOURCE_HSE_DIV38,
            RCC_RTCCLKSOURCE_HSE_DIV39,
            RCC_RTCCLKSOURCE_HSE_DIV40,
            RCC_RTCCLKSOURCE_HSE_DIV41,
            RCC_RTCCLKSOURCE_HSE_DIV42,
            RCC_RTCCLKSOURCE_HSE_DIV43,
            RCC_RTCCLKSOURCE_HSE_DIV44,
            RCC_RTCCLKSOURCE_HSE_DIV45,
            RCC_RTCCLKSOURCE_HSE_DIV46,
            RCC_RTCCLKSOURCE_HSE_DIV47,
            RCC_RTCCLKSOURCE_HSE_DIV48,
            RCC_RTCCLKSOURCE_HSE_DIV49,
            RCC_RTCCLKSOURCE_HSE_DIV50,
            RCC_RTCCLKSOURCE_HSE_DIV51,
            RCC_RTCCLKSOURCE_HSE_DIV52,
            RCC_RTCCLKSOURCE_HSE_DIV53,
            RCC_RTCCLKSOURCE_HSE_DIV54,
            RCC_RTCCLKSOURCE_HSE_DIV55,
            RCC_RTCCLKSOURCE_HSE_DIV56,
            RCC_RTCCLKSOURCE_HSE_DIV57,
            RCC_RTCCLKSOURCE_HSE_DIV58,
            RCC_RTCCLKSOURCE_HSE_DIV59,
            RCC_RTCCLKSOURCE_HSE_DIV60,
            RCC_RTCCLKSOURCE_HSE_DIV61,
            RCC_RTCCLKSOURCE_HSE_DIV62,
            RCC_RTCCLKSOURCE_HSE_DIV63,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_RTCCLKSOURCE_HSE_DIV2 => 2,
                    .RCC_RTCCLKSOURCE_HSE_DIV3 => 3,
                    .RCC_RTCCLKSOURCE_HSE_DIV4 => 4,
                    .RCC_RTCCLKSOURCE_HSE_DIV5 => 5,
                    .RCC_RTCCLKSOURCE_HSE_DIV6 => 6,
                    .RCC_RTCCLKSOURCE_HSE_DIV7 => 7,
                    .RCC_RTCCLKSOURCE_HSE_DIV8 => 8,
                    .RCC_RTCCLKSOURCE_HSE_DIV9 => 9,
                    .RCC_RTCCLKSOURCE_HSE_DIV10 => 10,
                    .RCC_RTCCLKSOURCE_HSE_DIV11 => 11,
                    .RCC_RTCCLKSOURCE_HSE_DIV12 => 12,
                    .RCC_RTCCLKSOURCE_HSE_DIV13 => 13,
                    .RCC_RTCCLKSOURCE_HSE_DIV14 => 14,
                    .RCC_RTCCLKSOURCE_HSE_DIV15 => 15,
                    .RCC_RTCCLKSOURCE_HSE_DIV16 => 16,
                    .RCC_RTCCLKSOURCE_HSE_DIV17 => 17,
                    .RCC_RTCCLKSOURCE_HSE_DIV18 => 18,
                    .RCC_RTCCLKSOURCE_HSE_DIV19 => 19,
                    .RCC_RTCCLKSOURCE_HSE_DIV20 => 20,
                    .RCC_RTCCLKSOURCE_HSE_DIV21 => 21,
                    .RCC_RTCCLKSOURCE_HSE_DIV22 => 22,
                    .RCC_RTCCLKSOURCE_HSE_DIV23 => 23,
                    .RCC_RTCCLKSOURCE_HSE_DIV24 => 24,
                    .RCC_RTCCLKSOURCE_HSE_DIV25 => 25,
                    .RCC_RTCCLKSOURCE_HSE_DIV26 => 26,
                    .RCC_RTCCLKSOURCE_HSE_DIV27 => 27,
                    .RCC_RTCCLKSOURCE_HSE_DIV28 => 28,
                    .RCC_RTCCLKSOURCE_HSE_DIV29 => 29,
                    .RCC_RTCCLKSOURCE_HSE_DIV30 => 30,
                    .RCC_RTCCLKSOURCE_HSE_DIV31 => 31,
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => 32,
                    .RCC_RTCCLKSOURCE_HSE_DIV33 => 33,
                    .RCC_RTCCLKSOURCE_HSE_DIV34 => 34,
                    .RCC_RTCCLKSOURCE_HSE_DIV35 => 35,
                    .RCC_RTCCLKSOURCE_HSE_DIV36 => 36,
                    .RCC_RTCCLKSOURCE_HSE_DIV37 => 37,
                    .RCC_RTCCLKSOURCE_HSE_DIV38 => 38,
                    .RCC_RTCCLKSOURCE_HSE_DIV39 => 39,
                    .RCC_RTCCLKSOURCE_HSE_DIV40 => 40,
                    .RCC_RTCCLKSOURCE_HSE_DIV41 => 41,
                    .RCC_RTCCLKSOURCE_HSE_DIV42 => 42,
                    .RCC_RTCCLKSOURCE_HSE_DIV43 => 43,
                    .RCC_RTCCLKSOURCE_HSE_DIV44 => 44,
                    .RCC_RTCCLKSOURCE_HSE_DIV45 => 45,
                    .RCC_RTCCLKSOURCE_HSE_DIV46 => 46,
                    .RCC_RTCCLKSOURCE_HSE_DIV47 => 47,
                    .RCC_RTCCLKSOURCE_HSE_DIV48 => 48,
                    .RCC_RTCCLKSOURCE_HSE_DIV49 => 49,
                    .RCC_RTCCLKSOURCE_HSE_DIV50 => 50,
                    .RCC_RTCCLKSOURCE_HSE_DIV51 => 51,
                    .RCC_RTCCLKSOURCE_HSE_DIV52 => 52,
                    .RCC_RTCCLKSOURCE_HSE_DIV53 => 53,
                    .RCC_RTCCLKSOURCE_HSE_DIV54 => 54,
                    .RCC_RTCCLKSOURCE_HSE_DIV55 => 55,
                    .RCC_RTCCLKSOURCE_HSE_DIV56 => 56,
                    .RCC_RTCCLKSOURCE_HSE_DIV57 => 57,
                    .RCC_RTCCLKSOURCE_HSE_DIV58 => 58,
                    .RCC_RTCCLKSOURCE_HSE_DIV59 => 59,
                    .RCC_RTCCLKSOURCE_HSE_DIV60 => 60,
                    .RCC_RTCCLKSOURCE_HSE_DIV61 => 61,
                    .RCC_RTCCLKSOURCE_HSE_DIV62 => 62,
                    .RCC_RTCCLKSOURCE_HSE_DIV63 => 63,
                };
            }
        };

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,
            HSERTCDevisor,

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

        pub const SPI123CLockSelectionList = enum {
            RCC_SPI123CLKSOURCE_PLL,
            RCC_SPI123CLKSOURCE_PLL2,
            RCC_SPI123CLKSOURCE_PLL3,
            RCC_SPI123CLKSOURCE_PIN,
            RCC_SPI123CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SPI123CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SPI123CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SPI123CLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SPI123CLKSOURCE_CLKP => .PER,
                    .RCC_SPI123CLKSOURCE_PLL3 => .PLL3_P,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_SPI123CLKSOURCE_PIN,
                    .PLL2_P => .RCC_SPI123CLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SPI123CLKSOURCE_PLL,
                    .PER => .RCC_SPI123CLKSOURCE_CLKP,
                    .PLL3_P => .RCC_SPI123CLKSOURCE_PLL3,
                };
            }
        };

        pub const SAI1CLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_PLL,
            RCC_SAI1CLKSOURCE_PLL2,
            RCC_SAI1CLKSOURCE_PLL3,
            RCC_SAI1CLKSOURCE_PIN,
            RCC_SAI1CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SAIASEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI1CLKSOURCE_PLL3 => .PLL3_P,
                    .RCC_SAI1CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI1CLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SAI1CLKSOURCE_CLKP => .PER,
                };
            }
            pub fn from_enum(item: RCC_SAIASEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_SAI1CLKSOURCE_PIN,
                    .PLL3_P => .RCC_SAI1CLKSOURCE_PLL3,
                    .PLL2_P => .RCC_SAI1CLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SAI1CLKSOURCE_PLL,
                    .PER => .RCC_SAI1CLKSOURCE_CLKP,
                };
            }
        };

        pub const SAI2BCLockSelectionList = enum {
            RCC_SAI2BCLKSOURCE_PLL,
            RCC_SAI2BCLKSOURCE_PLL2,
            RCC_SAI2BCLKSOURCE_PLL3,
            RCC_SAI2BCLKSOURCE_PIN,
            RCC_SAI2BCLKSOURCE_CLKP,
            RCC_SAI2BCLKSOURCE_SPDIF,

            pub fn to_enum(self: @This()) anyerror!RCC_SAIASEL {
                return switch (self) {
                    .RCC_SAI2BCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SAI2BCLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI2BCLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI2BCLKSOURCE_CLKP => .PER,
                    .RCC_SAI2BCLKSOURCE_PLL3 => .PLL3_P,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "SAI2BCLockSelection", @tagName(self), "RCC_SAIASEL" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_SAIASEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_SAI2BCLKSOURCE_PLL,
                    .I2S_CKIN => .RCC_SAI2BCLKSOURCE_PIN,
                    .PLL2_P => .RCC_SAI2BCLKSOURCE_PLL2,
                    .PER => .RCC_SAI2BCLKSOURCE_CLKP,
                    .PLL3_P => .RCC_SAI2BCLKSOURCE_PLL3,
                };
            }
        };

        pub const SAI2ACLockSelectionList = enum {
            RCC_SAI2ACLKSOURCE_PLL,
            RCC_SAI2ACLKSOURCE_PLL2,
            RCC_SAI2ACLKSOURCE_PLL3,
            RCC_SAI2ACLKSOURCE_PIN,
            RCC_SAI2ACLKSOURCE_CLKP,
            RCC_SAI2ACLKSOURCE_SPDIF,

            pub fn to_enum(self: @This()) anyerror!RCC_SAIASEL {
                return switch (self) {
                    .RCC_SAI2ACLKSOURCE_SPDIF => .PER,
                    .RCC_SAI2ACLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI2ACLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SAI2ACLKSOURCE_PLL3 => .PLL3_P,
                    .RCC_SAI2ACLKSOURCE_CLKP => .I2S_CKIN,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "SAI2ACLockSelection", @tagName(self), "RCC_SAIASEL" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_SAIASEL) anyerror!@This() {
                return switch (item) {
                    .PER => .RCC_SAI2ACLKSOURCE_SPDIF,
                    .PLL2_P => .RCC_SAI2ACLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SAI2ACLKSOURCE_PLL,
                    .PLL3_P => .RCC_SAI2ACLKSOURCE_PLL3,
                    .I2S_CKIN => .RCC_SAI2ACLKSOURCE_CLKP,
                };
            }
        };

        pub const RNGCLockSelectionList = enum {
            RCC_RNGCLKSOURCE_HSI48,
            RCC_RNGCLKSOURCE_PLL,
            RCC_RNGCLKSOURCE_LSE,
            RCC_RNGCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_RNGSEL {
                return switch (self) {
                    .RCC_RNGCLKSOURCE_LSE => .LSE,
                    .RCC_RNGCLKSOURCE_HSI48 => .HSI48,
                    .RCC_RNGCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_RNGCLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_RNGSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_RNGCLKSOURCE_LSE,
                    .HSI48 => .RCC_RNGCLKSOURCE_HSI48,
                    .PLL1_Q => .RCC_RNGCLKSOURCE_PLL,
                    .LSI => .RCC_RNGCLKSOURCE_LSI,
                };
            }
        };

        pub const I2C123CLockSelectionList = enum {
            RCC_I2C123CLKSOURCE_D2PCLK1,
            RCC_I2C123CLKSOURCE_PLL3,
            RCC_I2C123CLKSOURCE_HSI,
            RCC_I2C123CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C1235SEL {
                return switch (self) {
                    .RCC_I2C123CLKSOURCE_HSI => .HSI,
                    .RCC_I2C123CLKSOURCE_CSI => .CSI,
                    .RCC_I2C123CLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_I2C123CLKSOURCE_D2PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2C1235SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C123CLKSOURCE_HSI,
                    .CSI => .RCC_I2C123CLKSOURCE_CSI,
                    .PLL3_R => .RCC_I2C123CLKSOURCE_PLL3,
                    .PCLK1 => .RCC_I2C123CLKSOURCE_D2PCLK1,
                };
            }
        };

        pub const I2C4CLockSelectionList = enum {
            RCC_I2C4CLKSOURCE_D3PCLK1,
            RCC_I2C4CLKSOURCE_PLL3,
            RCC_I2C4CLKSOURCE_HSI,
            RCC_I2C4CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C4SEL {
                return switch (self) {
                    .RCC_I2C4CLKSOURCE_CSI => .CSI,
                    .RCC_I2C4CLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_I2C4CLKSOURCE_HSI => .HSI,
                    .RCC_I2C4CLKSOURCE_D3PCLK1 => .PCLK4,
                };
            }
            pub fn from_enum(item: RCC_I2C4SEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_I2C4CLKSOURCE_CSI,
                    .PLL3_R => .RCC_I2C4CLKSOURCE_PLL3,
                    .HSI => .RCC_I2C4CLKSOURCE_HSI,
                    .PCLK4 => .RCC_I2C4CLKSOURCE_D3PCLK1,
                };
            }
        };

        pub const SPDIFCLockSelectionList = enum {
            RCC_SPDIFRXCLKSOURCE_PLL,
            RCC_SPDIFRXCLKSOURCE_PLL2,
            RCC_SPDIFRXCLKSOURCE_PLL3,
            RCC_SPDIFRXCLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SPDIFRXSEL {
                return switch (self) {
                    .RCC_SPDIFRXCLKSOURCE_PLL2 => .PLL2_R,
                    .RCC_SPDIFRXCLKSOURCE_HSI => .HSI,
                    .RCC_SPDIFRXCLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_SPDIFRXCLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_SPDIFRXSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_R => .RCC_SPDIFRXCLKSOURCE_PLL2,
                    .HSI => .RCC_SPDIFRXCLKSOURCE_HSI,
                    .PLL3_R => .RCC_SPDIFRXCLKSOURCE_PLL3,
                    .PLL1_Q => .RCC_SPDIFRXCLKSOURCE_PLL,
                };
            }
        };

        pub const QSPICLockSelectionList = enum {
            RCC_OSPICLKSOURCE_D1HCLK,
            RCC_OSPICLKSOURCE_PLL,
            RCC_OSPICLKSOURCE_PLL2,
            RCC_OSPICLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SPDIFRXSEL {
                return switch (self) {
                    .RCC_OSPICLKSOURCE_PLL2 => .PLL2_R,
                    .RCC_OSPICLKSOURCE_CLKP => .PLL3_R,
                    .RCC_OSPICLKSOURCE_PLL => .PLL1_Q,
                    .RCC_OSPICLKSOURCE_D1HCLK => .HSI,
                };
            }
            pub fn from_enum(item: RCC_SPDIFRXSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_R => .RCC_OSPICLKSOURCE_PLL2,
                    .PLL3_R => .RCC_OSPICLKSOURCE_CLKP,
                    .PLL1_Q => .RCC_OSPICLKSOURCE_PLL,
                    .HSI => .RCC_OSPICLKSOURCE_D1HCLK,
                };
            }
        };

        pub const FMCCLockSelectionList = enum {
            RCC_FMCCLKSOURCE_D1HCLK,
            RCC_FMCCLKSOURCE_PLL,
            RCC_FMCCLKSOURCE_PLL2,
            RCC_FMCCLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_FMCSEL {
                return switch (self) {
                    .RCC_FMCCLKSOURCE_CLKP => .PER,
                    .RCC_FMCCLKSOURCE_D1HCLK => .HCLK3,
                    .RCC_FMCCLKSOURCE_PLL2 => .PLL2_R,
                    .RCC_FMCCLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_FMCSEL) anyerror!@This() {
                return switch (item) {
                    .PER => .RCC_FMCCLKSOURCE_CLKP,
                    .HCLK3 => .RCC_FMCCLKSOURCE_D1HCLK,
                    .PLL2_R => .RCC_FMCCLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_FMCCLKSOURCE_PLL,
                };
            }
        };

        pub const SWPCLockSelectionList = enum {
            RCC_SWPMI1CLKSOURCE_D2PCLK1,
            RCC_SWPMI1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SWPMISEL {
                return switch (self) {
                    .RCC_SWPMI1CLKSOURCE_HSI => .HSI,
                    .RCC_SWPMI1CLKSOURCE_D2PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_SWPMISEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SWPMI1CLKSOURCE_HSI,
                    .PCLK1 => .RCC_SWPMI1CLKSOURCE_D2PCLK1,
                };
            }
        };

        pub const SDMMC1CLockSelectionList = enum {
            RCC_SDMMCCLKSOURCE_PLL,
            RCC_SDMMCCLKSOURCE_PLL2,

            pub fn to_enum(self: @This()) anyerror!RCC_SDMMCSEL {
                return switch (self) {
                    .RCC_SDMMCCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SDMMCCLKSOURCE_PLL2 => .PLL2_R,
                };
            }
            pub fn from_enum(item: RCC_SDMMCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_SDMMCCLKSOURCE_PLL,
                    .PLL2_R => .RCC_SDMMCCLKSOURCE_PLL2,
                };
            }
        };

        pub const DFSDMCLockSelectionList = enum {
            RCC_DFSDM1CLKSOURCE_D2PCLK1,
            RCC_DFSDM1CLKSOURCE_SYS,

            pub fn to_enum(self: @This()) anyerror!RCC_DFSDMSEL {
                return switch (self) {
                    .RCC_DFSDM1CLKSOURCE_SYS => .SYS,
                    .RCC_DFSDM1CLKSOURCE_D2PCLK1 => .PCLK2,
                };
            }
            pub fn from_enum(item: RCC_DFSDMSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_DFSDM1CLKSOURCE_SYS,
                    .PCLK2 => .RCC_DFSDM1CLKSOURCE_D2PCLK1,
                };
            }
        };

        pub const DFSDM2CLockSelectionList = enum {
            RCC_DFSDM2CLKSOURCE_SRDPCLK1,
            RCC_DFSDM2CLKSOURCE_SYS,

            pub fn to_enum(self: @This()) anyerror!RCC_DFSDMSEL {
                return switch (self) {
                    .RCC_DFSDM2CLKSOURCE_SYS => .SYS,
                    .RCC_DFSDM2CLKSOURCE_SRDPCLK1 => .PCLK2,
                };
            }
            pub fn from_enum(item: RCC_DFSDMSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_DFSDM2CLKSOURCE_SYS,
                    .PCLK2 => .RCC_DFSDM2CLKSOURCE_SRDPCLK1,
                };
            }
        };

        pub const USART16CLockSelectionList = enum {
            RCC_USART16910CLKSOURCE_D2PCLK2,
            RCC_USART16910CLKSOURCE_PLL2,
            RCC_USART16910CLKSOURCE_PLL3,
            RCC_USART16910CLKSOURCE_HSI,
            RCC_USART16910CLKSOURCE_CSI,
            RCC_USART16910CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART16910SEL {
                return switch (self) {
                    .RCC_USART16910CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_USART16910CLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_USART16910CLKSOURCE_D2PCLK2 => .PCLK2,
                    .RCC_USART16910CLKSOURCE_CSI => .CSI,
                    .RCC_USART16910CLKSOURCE_HSI => .HSI,
                    .RCC_USART16910CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USART16910SEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_USART16910CLKSOURCE_PLL2,
                    .PLL3_Q => .RCC_USART16910CLKSOURCE_PLL3,
                    .PCLK2 => .RCC_USART16910CLKSOURCE_D2PCLK2,
                    .CSI => .RCC_USART16910CLKSOURCE_CSI,
                    .HSI => .RCC_USART16910CLKSOURCE_HSI,
                    .LSE => .RCC_USART16910CLKSOURCE_LSE,
                };
            }
        };

        pub const USART234578CLockSelectionList = enum {
            RCC_USART234578CLKSOURCE_D2PCLK1,
            RCC_USART234578CLKSOURCE_PLL2,
            RCC_USART234578CLKSOURCE_PLL3,
            RCC_USART234578CLKSOURCE_HSI,
            RCC_USART234578CLKSOURCE_CSI,
            RCC_USART234578CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART234578SEL {
                return switch (self) {
                    .RCC_USART234578CLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_USART234578CLKSOURCE_CSI => .CSI,
                    .RCC_USART234578CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_USART234578CLKSOURCE_LSE => .LSE,
                    .RCC_USART234578CLKSOURCE_HSI => .HSI,
                    .RCC_USART234578CLKSOURCE_D2PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USART234578SEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_Q => .RCC_USART234578CLKSOURCE_PLL3,
                    .CSI => .RCC_USART234578CLKSOURCE_CSI,
                    .PLL2_Q => .RCC_USART234578CLKSOURCE_PLL2,
                    .LSE => .RCC_USART234578CLKSOURCE_LSE,
                    .HSI => .RCC_USART234578CLKSOURCE_HSI,
                    .PCLK1 => .RCC_USART234578CLKSOURCE_D2PCLK1,
                };
            }
        };

        pub const LPUART1CLockSelectionList = enum {
            RCC_LPUART1CLKSOURCE_D3PCLK1,
            RCC_LPUART1CLKSOURCE_PLL2,
            RCC_LPUART1CLKSOURCE_PLL3,
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_CSI,
            RCC_LPUART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPUARTSEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_LPUART1CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_LPUART1CLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_LPUARTSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_Q => .RCC_LPUART1CLKSOURCE_PLL3,
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PCLK4 => .RCC_LPUART1CLKSOURCE_D3PCLK1,
                    .PLL2_Q => .RCC_LPUART1CLKSOURCE_PLL2,
                    .CSI => .RCC_LPUART1CLKSOURCE_CSI,
                };
            }
        };

        pub const LPTIM1CLockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_D2PCLK1,
            RCC_LPTIM1CLKSOURCE_PLL2,
            RCC_LPTIM1CLKSOURCE_PLL3,
            RCC_LPTIM1CLKSOURCE_LSE,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM1SEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_LPTIM1CLKSOURCE_D2PCLK1 => .PCLK1,
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM1CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM1CLKSOURCE_CLKP => .PER,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_R => .RCC_LPTIM1CLKSOURCE_PLL3,
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_D2PCLK1,
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .PLL2_P => .RCC_LPTIM1CLKSOURCE_PLL2,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                    .PER => .RCC_LPTIM1CLKSOURCE_CLKP,
                };
            }
        };

        pub const LPTIM345CLockSelectionList = enum {
            RCC_LPTIM3CLKSOURCE_D3PCLK1,
            RCC_LPTIM3CLKSOURCE_PLL2,
            RCC_LPTIM3CLKSOURCE_PLL3,
            RCC_LPTIM3CLKSOURCE_LSE,
            RCC_LPTIM3CLKSOURCE_LSI,
            RCC_LPTIM3CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM3CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM3CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM3CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_LPTIM3CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM3CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_LPTIM3CLKSOURCE_PLL3 => .PLL3_R,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_LPTIM3CLKSOURCE_LSI,
                    .LSE => .RCC_LPTIM3CLKSOURCE_LSE,
                    .PCLK4 => .RCC_LPTIM3CLKSOURCE_D3PCLK1,
                    .PER => .RCC_LPTIM3CLKSOURCE_CLKP,
                    .PLL2_P => .RCC_LPTIM3CLKSOURCE_PLL2,
                    .PLL3_R => .RCC_LPTIM3CLKSOURCE_PLL3,
                };
            }
        };

        pub const LPTIM2CLockSelectionList = enum {
            RCC_LPTIM2CLKSOURCE_D3PCLK1,
            RCC_LPTIM2CLKSOURCE_PLL2,
            RCC_LPTIM2CLKSOURCE_PLL3,
            RCC_LPTIM2CLKSOURCE_LSE,
            RCC_LPTIM2CLKSOURCE_LSI,
            RCC_LPTIM2CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM2CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_LPTIM2CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_LPTIM2CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_LPTIM2CLKSOURCE_CLKP => .PER,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .PLL3_R => .RCC_LPTIM2CLKSOURCE_PLL3,
                    .PLL2_P => .RCC_LPTIM2CLKSOURCE_PLL2,
                    .PCLK4 => .RCC_LPTIM2CLKSOURCE_D3PCLK1,
                    .PER => .RCC_LPTIM2CLKSOURCE_CLKP,
                };
            }
        };

        pub const SPI6CLockSelectionList = enum {
            RCC_SPI6CLKSOURCE_D3PCLK1,
            RCC_SPI6CLKSOURCE_PLL2,
            RCC_SPI6CLKSOURCE_PLL3,
            RCC_SPI6CLKSOURCE_HSI,
            RCC_SPI6CLKSOURCE_CSI,
            RCC_SPI6CLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI6SEL {
                return switch (self) {
                    .RCC_SPI6CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_SPI6CLKSOURCE_HSI => .HSI,
                    .RCC_SPI6CLKSOURCE_HSE => .HSE,
                    .RCC_SPI6CLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_SPI6CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_SPI6CLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_SPI6SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK4 => .RCC_SPI6CLKSOURCE_D3PCLK1,
                    .HSI => .RCC_SPI6CLKSOURCE_HSI,
                    .HSE => .RCC_SPI6CLKSOURCE_HSE,
                    .PLL3_Q => .RCC_SPI6CLKSOURCE_PLL3,
                    .PLL2_Q => .RCC_SPI6CLKSOURCE_PLL2,
                    .CSI => .RCC_SPI6CLKSOURCE_CSI,
                };
            }
        };

        pub const Spi45ClockSelectionList = enum {
            RCC_SPI45CLKSOURCE_D2PCLK1,
            RCC_SPI45CLKSOURCE_PLL2,
            RCC_SPI45CLKSOURCE_PLL3,
            RCC_SPI45CLKSOURCE_HSI,
            RCC_SPI45CLKSOURCE_CSI,
            RCC_SPI45CLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI45SEL {
                return switch (self) {
                    .RCC_SPI45CLKSOURCE_HSE => .HSE,
                    .RCC_SPI45CLKSOURCE_HSI => .HSI,
                    .RCC_SPI45CLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_SPI45CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_SPI45CLKSOURCE_D2PCLK1 => .PCLK2,
                    .RCC_SPI45CLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_SPI45SEL) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SPI45CLKSOURCE_HSE,
                    .HSI => .RCC_SPI45CLKSOURCE_HSI,
                    .PLL3_Q => .RCC_SPI45CLKSOURCE_PLL3,
                    .PLL2_Q => .RCC_SPI45CLKSOURCE_PLL2,
                    .PCLK2 => .RCC_SPI45CLKSOURCE_D2PCLK1,
                    .CSI => .RCC_SPI45CLKSOURCE_CSI,
                };
            }
        };

        pub const USBCLockSelectionList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_PLL3,
            RCC_USBCLKSOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_USBSEL {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_USBCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_USBCLKSOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_USBSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_Q => .RCC_USBCLKSOURCE_PLL3,
                    .PLL1_Q => .RCC_USBCLKSOURCE_PLL,
                    .HSI48 => .RCC_USBCLKSOURCE_HSI48,
                };
            }
        };

        pub const FDCANCLockSelectionList = enum {
            RCC_FDCANCLKSOURCE_HSE,
            RCC_FDCANCLKSOURCE_PLL,
            RCC_FDCANCLKSOURCE_PLL2,

            pub fn to_enum(self: @This()) anyerror!RCC_FDCANSEL {
                return switch (self) {
                    .RCC_FDCANCLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_FDCANCLKSOURCE_HSE => .HSE,
                    .RCC_FDCANCLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_FDCANSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_FDCANCLKSOURCE_PLL2,
                    .HSE => .RCC_FDCANCLKSOURCE_HSE,
                    .PLL1_Q => .RCC_FDCANCLKSOURCE_PLL,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCCLKSOURCE_PLL2,
            RCC_ADCCLKSOURCE_PLL3,
            RCC_ADCCLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADCCLKSOURCE_CLKP => .PER,
                    .RCC_ADCCLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_ADCCLKSOURCE_PLL2 => .PLL2_P,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PER => .RCC_ADCCLKSOURCE_CLKP,
                    .PLL3_R => .RCC_ADCCLKSOURCE_PLL3,
                    .PLL2_P => .RCC_ADCCLKSOURCE_PLL2,
                };
            }
        };

        pub const CECCLockSelectionList = enum {
            RCC_CECCLKSOURCE_LSE,
            RCC_CECCLKSOURCE_LSI,
            RCC_CECCLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_CECSEL {
                return switch (self) {
                    .RCC_CECCLKSOURCE_CSI => .CSI,
                    .RCC_CECCLKSOURCE_LSE => .LSE,
                    .RCC_CECCLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_CECSEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_CECCLKSOURCE_CSI,
                    .LSE => .RCC_CECCLKSOURCE_LSE,
                    .LSI => .RCC_CECCLKSOURCE_LSI,
                };
            }
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

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE0,
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE3,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE0 => .Scale3,
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .Scale1,
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .Scale2,
                    .PWR_REGULATOR_VOLTAGE_SCALE3 => .Scale0,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .Scale3 => .PWR_REGULATOR_VOLTAGE_SCALE0,
                    .Scale1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .Scale2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .Scale0 => .PWR_REGULATOR_VOLTAGE_SCALE3,
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

        pub const FLatencyList = enum {
            FLASH_LATENCY_6,
            FLASH_LATENCY_5,
            FLASH_LATENCY_4,
            FLASH_LATENCY_3,
            FLASH_LATENCY_2,
            FLASH_LATENCY_1,
            FLASH_LATENCY_0,
        };

        pub const PLL1_VCI_RangeList = enum {
            RCC_PLL1VCIRANGE_0,
            RCC_PLL1VCIRANGE_1,
            RCC_PLL1VCIRANGE_2,
            RCC_PLL1VCIRANGE_3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL1VCIRANGE_0 => .Range1,
                    .RCC_PLL1VCIRANGE_2 => .Range4,
                    .RCC_PLL1VCIRANGE_1 => .Range2,
                    .RCC_PLL1VCIRANGE_3 => .Range8,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range1 => .RCC_PLL1VCIRANGE_0,
                    .Range4 => .RCC_PLL1VCIRANGE_2,
                    .Range2 => .RCC_PLL1VCIRANGE_1,
                    .Range8 => .RCC_PLL1VCIRANGE_3,
                };
            }
        };

        pub const PLL2_VCI_RangeList = enum {
            RCC_PLL2VCIRANGE_0,
            RCC_PLL2VCIRANGE_1,
            RCC_PLL2VCIRANGE_2,
            RCC_PLL2VCIRANGE_3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL2VCIRANGE_2 => .Range4,
                    .RCC_PLL2VCIRANGE_3 => .Range8,
                    .RCC_PLL2VCIRANGE_0 => .Range1,
                    .RCC_PLL2VCIRANGE_1 => .Range2,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range4 => .RCC_PLL2VCIRANGE_2,
                    .Range8 => .RCC_PLL2VCIRANGE_3,
                    .Range1 => .RCC_PLL2VCIRANGE_0,
                    .Range2 => .RCC_PLL2VCIRANGE_1,
                };
            }
        };

        pub const PLL3_VCI_RangeList = enum {
            RCC_PLL3VCIRANGE_0,
            RCC_PLL3VCIRANGE_1,
            RCC_PLL3VCIRANGE_2,
            RCC_PLL3VCIRANGE_3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL3VCIRANGE_3 => .Range8,
                    .RCC_PLL3VCIRANGE_0 => .Range1,
                    .RCC_PLL3VCIRANGE_1 => .Range2,
                    .RCC_PLL3VCIRANGE_2 => .Range4,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range8 => .RCC_PLL3VCIRANGE_3,
                    .Range1 => .RCC_PLL3VCIRANGE_0,
                    .Range2 => .RCC_PLL3VCIRANGE_1,
                    .Range4 => .RCC_PLL3VCIRANGE_2,
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
            RCC_CRS_SYNC_SOURCE_PIN,
            RCC_CRS_SYNC_SOURCE_LSE,
            RCC_CRS_SYNC_SOURCE_USB2,
            RCC_CRS_SYNC_SOURCE_USB1,
        };

        pub const PolarityList = enum {
            RCC_CRS_SYNC_POLARITY_RISING,
            RCC_CRS_SYNC_POLARITY_FALLING,
        };

        pub const ReloadValueTypeList = enum {
            UserValue,
            automatic,
        };

        pub const PLL1_VCO_SELList = enum {
            RCC_PLL1VCOMEDIUM,
            RCC_PLL1VCOWIDE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL1VCOMEDIUM => .MediumVCO,
                    .RCC_PLL1VCOWIDE => .WideVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .MediumVCO => .RCC_PLL1VCOMEDIUM,
                    .WideVCO => .RCC_PLL1VCOWIDE,
                };
            }
        };

        pub const PLL2_VCO_SELList = enum {
            RCC_PLL2VCOMEDIUM,
            RCC_PLL2VCOWIDE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL2VCOMEDIUM => .MediumVCO,
                    .RCC_PLL2VCOWIDE => .WideVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .MediumVCO => .RCC_PLL2VCOMEDIUM,
                    .WideVCO => .RCC_PLL2VCOWIDE,
                };
            }
        };

        pub const PLL3_VCO_SELList = enum {
            RCC_PLL3VCOMEDIUM,
            RCC_PLL3VCOWIDE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL3VCOMEDIUM => .MediumVCO,
                    .RCC_PLL3VCOWIDE => .WideVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .MediumVCO => .RCC_PLL3VCOMEDIUM,
                    .WideVCO => .RCC_PLL3VCOWIDE,
                };
            }
        };

        pub const LSIEnableList = enum {
            true,
        };

        pub const ExtClockEnableList = enum {
            true,
            false,
        };

        pub const MCO1OutPutEnableList = enum {
            true,
            false,
        };

        pub const MCO2OutPutEnableList = enum {
            true,
            false,
        };

        pub const TraceEnableList = enum {
            auto,
        };

        pub const cKPerEnableList = enum {
            true,
            false,
        };

        pub const SAI1EnableList = enum {
            true,
            false,
        };

        pub const RNGEnableList = enum {
            true,
            false,
        };

        pub const SDMMC1EnableList = enum {
            true,
            false,
        };

        pub const SAI2AEnableList = enum {
            true,
            false,
        };

        pub const SAI2BEnableList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const SPI123EnableList = enum {
            true,
            false,
        };

        pub const SPDIFEnableList = enum {
            true,
            false,
        };

        pub const FDCANEnableList = enum {
            true,
            false,
        };

        pub const FMCEnableList = enum {
            true,
            false,
        };

        pub const OCSPIEnableList = enum {
            true,
            false,
        };

        pub const TraceEnablePllList = enum {
            true,
            false,
        };

        pub const LPTIM2EnableList = enum {
            true,
            false,
        };

        pub const LPTIM345EnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const LPTIM1EnableList = enum {
            true,
            false,
        };

        pub const SPI6EnableList = enum {
            true,
            false,
        };

        pub const LPUART1EnableList = enum {
            true,
            false,
        };

        pub const USART234578EnableList = enum {
            true,
            false,
        };

        pub const USART16910EnableList = enum {
            true,
            false,
        };

        pub const SPI45EnableList = enum {
            true,
            false,
        };

        pub const LTDCEnableList = enum {
            true,
            false,
        };

        pub const I2C4EnableList = enum {
            true,
            false,
        };

        pub const I2C123EnableList = enum {
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

        pub const DAC1EnableList = enum {
            true,
            false,
        };

        pub const DAC2EnableList = enum {
            true,
            false,
        };

        pub const EnableDFSDMAudioList = enum {
            true,
            false,
        };

        pub const SWPEnableList = enum {
            true,
            false,
        };

        pub const DFSDMEnableList = enum {
            true,
            false,
        };

        pub const DFSDM2EnableList = enum {
            true,
            false,
        };

        pub const SPI6OutputEnableList = enum {
            true,
            false,
        };

        pub const EnableDFSDM2AudioList = enum {
            true,
            false,
        };

        pub const CECEnableList = enum {
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

        pub const MCO2I2SEnableList = enum {
            true,
            false,
        };

        pub const EnbaleCSSList = enum {
            true,
            false,
        };

        pub const EnableCSSLSEList = enum {
            true,
            false,
        };

        //=======ClockTree Flags========

        pub const Flags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCO1Config: bool = false,
            MCO2Config: bool = false,
            AudioClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            USB_OTG_HSUsed_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            OCTOSPI1Used_ForRCC: bool = false,
            OCTOSPI2Used_ForRCC: bool = false,
            FMCUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USART6Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            UART9Used_ForRCC: bool = false,
            USART10Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            SPI6Used_ForRCC: bool = false,
            DFSDM2Used_ForRCC: bool = false,
            SPI4Used_ForRCC: bool = false,
            SPI5Used_ForRCC: bool = false,
            RBGEnable: bool = false,
            I2S6Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCO1Config: bool = false,
            MCO2Config: bool = false,
            AudioClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            USB_OTG_HSUsed_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            OCTOSPI1Used_ForRCC: bool = false,
            OCTOSPI2Used_ForRCC: bool = false,
            FMCUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USART6Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            UART9Used_ForRCC: bool = false,
            USART10Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            SPI6Used_ForRCC: bool = false,
            DFSDM2Used_ForRCC: bool = false,
            SPI4Used_ForRCC: bool = false,
            SPI5Used_ForRCC: bool = false,
            RBGEnable: bool = false,
            I2S6Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            LSIEnable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            MCO1OutPutEnable: bool = false, //Reference flag
            MCO2OutPutEnable: bool = false, //Reference flag
            TraceEnable: bool = false, //Reference flag
            cKPerEnable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            SDMMC1Enable: bool = false, //Reference flag
            SAI2AEnable: bool = false, //Reference flag
            SAI2BEnable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            SPI123Enable: bool = false, //Reference flag
            SPDIFEnable: bool = false, //Reference flag
            FDCANEnable: bool = false, //Reference flag
            FMCEnable: bool = false, //Reference flag
            OCSPIEnable: bool = false, //Reference flag
            TraceEnablePll: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            LPTIM345Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            SPI6Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            USART234578Enable: bool = false, //Reference flag
            USART16910Enable: bool = false, //Reference flag
            SPI45Enable: bool = false, //Reference flag
            LTDCEnable: bool = false, //Reference flag
            I2C4Enable: bool = false, //Reference flag
            I2C123Enable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            DAC1Enable: bool = false, //Reference flag
            DAC2Enable: bool = false, //Reference flag
            EnableDFSDMAudio: bool = false, //Reference flag
            SWPEnable: bool = false, //Reference flag
            DFSDMEnable: bool = false, //Reference flag
            DFSDM2Enable: bool = false, //Reference flag
            SPI6OutputEnable: bool = false, //Reference flag
            EnableDFSDM2Audio: bool = false, //Reference flag
            CECEnable: bool = false, //Reference flag
            PLL1QUsed: bool = false, //Reference flag
            PLL1PUsed: bool = false, //Reference flag
            PLL1RUsed: bool = false, //Reference flag
            PLL2PUsed: bool = false, //Reference flag
            PLL2QUsed: bool = false, //Reference flag
            PLL2RUsed: bool = false, //Reference flag
            PLL3PUsed: bool = false, //Reference flag
            PLL3QUsed: bool = false, //Reference flag
            PLL3RUsed: bool = false, //Reference flag
            PLL3Used: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            PLL2Used: bool = false, //Reference flag
            CSIUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            MCO2I2SEnable: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag
            HSI48Used: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            cKPerUsed: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionList = null,
            VDD_VALUE: ?f32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            FLatency: ?FLatencyList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            CSICalibrationValue: ?u32 = null,
            HSICalibrationValue: ?u32 = null,
            EnbaleCSS: ?EnbaleCSSList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
        };

        pub const CubeMXConfig = struct {
            HSIDiv: ?HSIDivList = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv1: ?RCC_MCODiv1List = null,
            RCC_MCO2Source: ?RCC_MCO2SourceList = null,
            RCC_MCODiv2: ?RCC_MCODiv2List = null,
            CDCPRE: ?CDCPREList = null,
            Cortex_Div: ?Cortex_DivList = null,
            HPRE: ?HPREList = null,
            CDPPRE: ?CDPPREList = null,
            CDPPRE1: ?CDPPRE1List = null,
            CDPPRE2: ?CDPPRE2List = null,
            SRDPPRE: ?SRDPPREList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            CKPERSourceSelection: ?CKPERSourceSelectionList = null,
            DIVM1: ?u32 = null,
            DIVM2: ?u32 = null,
            DIVM3: ?u32 = null,
            DIVN1: ?u32 = null,
            PLLFRACN: ?u32 = null,
            DIVP1: ?DIVP1List = null,
            DIVQ1: ?u32 = null,
            DIVR1: ?u32 = null,
            DIVN2: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            DIVP2: ?u32 = null,
            DIVQ2: ?u32 = null,
            DIVR2: ?u32 = null,
            DIVN3: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            DIVP3: ?u32 = null,
            DIVQ3: ?u32 = null,
            DIVR3: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            SPI123CLockSelection: ?SPI123CLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
            SAI2BCLockSelection: ?SAI2BCLockSelectionList = null,
            SAI2ACLockSelection: ?SAI2ACLockSelectionList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            I2C123CLockSelection: ?I2C123CLockSelectionList = null,
            I2C4CLockSelection: ?I2C4CLockSelectionList = null,
            SPDIFCLockSelection: ?SPDIFCLockSelectionList = null,
            QSPICLockSelection: ?QSPICLockSelectionList = null,
            FMCCLockSelection: ?FMCCLockSelectionList = null,
            SWPCLockSelection: ?SWPCLockSelectionList = null,
            SDMMC1CLockSelection: ?SDMMC1CLockSelectionList = null,
            DFSDMCLockSelection: ?DFSDMCLockSelectionList = null,
            DFSDM2CLockSelection: ?DFSDM2CLockSelectionList = null,
            USART16CLockSelection: ?USART16CLockSelectionList = null,
            USART234578CLockSelection: ?USART234578CLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            LPTIM345CLockSelection: ?LPTIM345CLockSelectionList = null,
            LPTIM2CLockSelection: ?LPTIM2CLockSelectionList = null,
            SPI6CLockSelection: ?SPI6CLockSelectionList = null,
            Spi45ClockSelection: ?Spi45ClockSelectionList = null,
            USBCLockSelection: ?USBCLockSelectionList = null,
            FDCANCLockSelection: ?FDCANCLockSelectionList = null,
            ADCCLockSelection: ?ADCCLockSelectionList = null,
            CECCLockSelection: ?CECCLockSelectionList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDiv: HSIDivList,
            SYSCLKSource: SYSCLKSourceList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv1: RCC_MCODiv1List,
            RCC_MCO2Source: RCC_MCO2SourceList,
            RCC_MCODiv2: RCC_MCODiv2List,
            traceClkSourceVirtual: traceClkSourceVirtualList,
            CDCPRE: CDCPREList,
            Cortex_Div: Cortex_DivList,
            HPRE: HPREList,
            CDPPRE: CDPPREList,
            CDPPRE1: CDPPRE1List,
            Tim1Mul: u32,
            CDPPRE2: CDPPRE2List,
            Tim2Mul: u32,
            SRDPPRE: SRDPPREList,
            PLLSourceVirtual: PLLSourceVirtualList,
            CKPERSourceSelection: CKPERSourceSelectionList,
            DIVM1: u32,
            DIVM2: u32,
            DIVM3: u32,
            DIVN1: u32,
            DIVP1: DIVP1List,
            DIVQ1: u32,
            DIVR1: u32,
            DIVN2: u32,
            DIVP2: u32,
            DIVQ2: u32,
            DIVR2: u32,
            DIVN3: u32,
            DIVP3: u32,
            DIVQ3: u32,
            DIVR3: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RTCClockSelectionList,
            SPI123CLockSelection: SPI123CLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
            SAI2BCLockSelection: SAI2BCLockSelectionList,
            SAI2ACLockSelection: SAI2ACLockSelectionList,
            RNGCLockSelection: RNGCLockSelectionList,
            I2C123CLockSelection: I2C123CLockSelectionList,
            I2C4CLockSelection: I2C4CLockSelectionList,
            SPDIFCLockSelection: SPDIFCLockSelectionList,
            QSPICLockSelection: QSPICLockSelectionList,
            FMCCLockSelection: FMCCLockSelectionList,
            SWPCLockSelection: SWPCLockSelectionList,
            SDMMC1CLockSelection: SDMMC1CLockSelectionList,
            DFSDMCLockSelection: DFSDMCLockSelectionList,
            DFSDM2CLockSelection: DFSDM2CLockSelectionList,
            USART16CLockSelection: USART16CLockSelectionList,
            USART234578CLockSelection: USART234578CLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            LPTIM345CLockSelection: LPTIM345CLockSelectionList,
            LPTIM2CLockSelection: LPTIM2CLockSelectionList,
            SPI6CLockSelection: SPI6CLockSelectionList,
            Spi45ClockSelection: Spi45ClockSelectionList,
            USBCLockSelection: USBCLockSelectionList,
            FDCANCLockSelection: FDCANCLockSelectionList,
            ADCCLockSelection: ADCCLockSelectionList,
            CECCLockSelection: CECCLockSelectionList,
            RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionList,
            VDD_VALUE: f32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
            FLatency: FLatencyList,
            PLL1_VCI_Range: PLL1_VCI_RangeList,
            PLL2_VCI_Range: PLL2_VCI_RangeList,
            PLL3_VCI_Range: PLL3_VCI_RangeList,
            Prescaler: ?PrescalerList,
            Source: ?SourceList,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            Fsync: ?f32,
            ErrorLimitValue: ?u32,
            HSI48CalibrationValue: ?u32,
            CSICalibrationValue: u32,
            HSICalibrationValue: u32,
            PLL1_VCO_SEL: PLL1_VCO_SELList,
            PLL2_VCO_SEL: PLL2_VCO_SELList,
            PLL3_VCO_SEL: PLL3_VCO_SELList,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            RCC_TIM_PRescaler_Selection: ?RCC_TIMPRE = null,
            VDD_VALUE: ?f32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            FLatency: ?FLatencyList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            CSICalibrationValue: ?u32 = null,
            HSICalibrationValue: ?u32 = null,
            EnbaleCSS: ?EnbaleCSSList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .RCC_TIM_PRescaler_Selection = if (self.RCC_TIM_PRescaler_Selection) |val| try RCC_TIM_PRescaler_SelectionList.from_enum(val) else null,
                    .VDD_VALUE = self.VDD_VALUE,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .FLatency = self.FLatency,
                    .Prescaler = self.Prescaler,
                    .Polarity = self.Polarity,
                    .ReloadValueType = self.ReloadValueType,
                    .ReloadValue = self.ReloadValue,
                    .Fsync = self.Fsync,
                    .ErrorLimitValue = self.ErrorLimitValue,
                    .HSI48CalibrationValue = self.HSI48CalibrationValue,
                    .CSICalibrationValue = self.CSICalibrationValue,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .EnbaleCSS = self.EnbaleCSS,
                    .EnableCSSLSE = self.EnableCSSLSE,
                };
            }
        };

        pub const Config = struct {
            HSIDiv: ?RCC_HSIDIV = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            RCC_MCO1Source: ?RCC_MCO1SEL = null,
            RCC_MCODiv1: ?RCC_MCOPRE = null,
            RCC_MCO2Source: ?RCC_MCO2SEL = null,
            RCC_MCODiv2: ?RCC_MCOPRE = null,
            CDCPRE: ?CDCPREList = null,
            Cortex_Div: ?Cortex_DivList = null,
            HPRE: ?RCC_HPRE = null,
            CDPPRE: ?CDPPREList = null,
            CDPPRE1: ?RCC_PPRE = null,
            CDPPRE2: ?RCC_PPRE = null,
            SRDPPRE: ?RCC_PPRE = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            CKPERSourceSelection: ?RCC_PLLSRC = null,
            DIVM1: ?u32 = null,
            DIVM2: ?u32 = null,
            DIVM3: ?u32 = null,
            DIVN1: ?u32 = null,
            PLLFRACN: ?u32 = null,
            DIVP1: ?RCC_PLLDIV = null,
            DIVQ1: ?u32 = null,
            DIVR1: ?u32 = null,
            DIVN2: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            DIVP2: ?u32 = null,
            DIVQ2: ?u32 = null,
            DIVR2: ?u32 = null,
            DIVN3: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            DIVP3: ?u32 = null,
            DIVQ3: ?u32 = null,
            DIVR3: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            SPI123CLockSelection: ?RCC_SAISEL = null,
            SAI1CLockSelection: ?RCC_SAIASEL = null,
            SAI2BCLockSelection: ?RCC_SAIASEL = null,
            SAI2ACLockSelection: ?RCC_SAIASEL = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            I2C123CLockSelection: ?RCC_I2C1235SEL = null,
            I2C4CLockSelection: ?RCC_I2C4SEL = null,
            SPDIFCLockSelection: ?RCC_SPDIFRXSEL = null,
            QSPICLockSelection: ?RCC_SPDIFRXSEL = null,
            FMCCLockSelection: ?RCC_FMCSEL = null,
            SWPCLockSelection: ?RCC_SWPMISEL = null,
            SDMMC1CLockSelection: ?RCC_SDMMCSEL = null,
            DFSDMCLockSelection: ?RCC_DFSDMSEL = null,
            DFSDM2CLockSelection: ?RCC_DFSDMSEL = null,
            USART16CLockSelection: ?RCC_USART16910SEL = null,
            USART234578CLockSelection: ?RCC_USART234578SEL = null,
            LPUART1CLockSelection: ?RCC_LPUARTSEL = null,
            LPTIM1CLockSelection: ?RCC_LPTIM1SEL = null,
            LPTIM345CLockSelection: ?RCC_LPTIM2SEL = null,
            LPTIM2CLockSelection: ?RCC_LPTIM2SEL = null,
            SPI6CLockSelection: ?RCC_SPI6SEL = null,
            Spi45ClockSelection: ?RCC_SPI45SEL = null,
            USBCLockSelection: ?RCC_USBSEL = null,
            FDCANCLockSelection: ?RCC_FDCANSEL = null,
            ADCCLockSelection: ?RCC_ADCSEL = null,
            CECCLockSelection: ?RCC_CECSEL = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSIDiv = if (self.HSIDiv) |val| try HSIDivList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSI_VALUE = self.LSI_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv1 = if (self.RCC_MCODiv1) |val| try RCC_MCODiv1List.from_enum(val) else null,
                    .RCC_MCO2Source = if (self.RCC_MCO2Source) |val| try RCC_MCO2SourceList.from_enum(val) else null,
                    .RCC_MCODiv2 = if (self.RCC_MCODiv2) |val| try RCC_MCODiv2List.from_enum(val) else null,
                    .CDCPRE = self.CDCPRE,
                    .Cortex_Div = self.Cortex_Div,
                    .HPRE = if (self.HPRE) |val| try HPREList.from_enum(val) else null,
                    .CDPPRE = self.CDPPRE,
                    .CDPPRE1 = if (self.CDPPRE1) |val| try CDPPRE1List.from_enum(val) else null,
                    .CDPPRE2 = if (self.CDPPRE2) |val| try CDPPRE2List.from_enum(val) else null,
                    .SRDPPRE = if (self.SRDPPRE) |val| try SRDPPREList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .CKPERSourceSelection = if (self.CKPERSourceSelection) |val| try CKPERSourceSelectionList.from_enum(val) else null,
                    .DIVM1 = self.DIVM1,
                    .DIVM2 = self.DIVM2,
                    .DIVM3 = self.DIVM3,
                    .DIVN1 = self.DIVN1,
                    .PLLFRACN = self.PLLFRACN,
                    .DIVP1 = if (self.DIVP1) |val| try DIVP1List.from_enum(val) else null,
                    .DIVQ1 = self.DIVQ1,
                    .DIVR1 = self.DIVR1,
                    .DIVN2 = self.DIVN2,
                    .PLL2FRACN = self.PLL2FRACN,
                    .DIVP2 = self.DIVP2,
                    .DIVQ2 = self.DIVQ2,
                    .DIVR2 = self.DIVR2,
                    .DIVN3 = self.DIVN3,
                    .PLL3FRACN = self.PLL3FRACN,
                    .DIVP3 = self.DIVP3,
                    .DIVQ3 = self.DIVQ3,
                    .DIVR3 = self.DIVR3,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .SPI123CLockSelection = if (self.SPI123CLockSelection) |val| try SPI123CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
                    .SAI2BCLockSelection = if (self.SAI2BCLockSelection) |val| try SAI2BCLockSelectionList.from_enum(val) else null,
                    .SAI2ACLockSelection = if (self.SAI2ACLockSelection) |val| try SAI2ACLockSelectionList.from_enum(val) else null,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .I2C123CLockSelection = if (self.I2C123CLockSelection) |val| try I2C123CLockSelectionList.from_enum(val) else null,
                    .I2C4CLockSelection = if (self.I2C4CLockSelection) |val| try I2C4CLockSelectionList.from_enum(val) else null,
                    .SPDIFCLockSelection = if (self.SPDIFCLockSelection) |val| try SPDIFCLockSelectionList.from_enum(val) else null,
                    .QSPICLockSelection = if (self.QSPICLockSelection) |val| try QSPICLockSelectionList.from_enum(val) else null,
                    .FMCCLockSelection = if (self.FMCCLockSelection) |val| try FMCCLockSelectionList.from_enum(val) else null,
                    .SWPCLockSelection = if (self.SWPCLockSelection) |val| try SWPCLockSelectionList.from_enum(val) else null,
                    .SDMMC1CLockSelection = if (self.SDMMC1CLockSelection) |val| try SDMMC1CLockSelectionList.from_enum(val) else null,
                    .DFSDMCLockSelection = if (self.DFSDMCLockSelection) |val| try DFSDMCLockSelectionList.from_enum(val) else null,
                    .DFSDM2CLockSelection = if (self.DFSDM2CLockSelection) |val| try DFSDM2CLockSelectionList.from_enum(val) else null,
                    .USART16CLockSelection = if (self.USART16CLockSelection) |val| try USART16CLockSelectionList.from_enum(val) else null,
                    .USART234578CLockSelection = if (self.USART234578CLockSelection) |val| try USART234578CLockSelectionList.from_enum(val) else null,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .LPTIM345CLockSelection = if (self.LPTIM345CLockSelection) |val| try LPTIM345CLockSelectionList.from_enum(val) else null,
                    .LPTIM2CLockSelection = if (self.LPTIM2CLockSelection) |val| try LPTIM2CLockSelectionList.from_enum(val) else null,
                    .SPI6CLockSelection = if (self.SPI6CLockSelection) |val| try SPI6CLockSelectionList.from_enum(val) else null,
                    .Spi45ClockSelection = if (self.Spi45ClockSelection) |val| try Spi45ClockSelectionList.from_enum(val) else null,
                    .USBCLockSelection = if (self.USBCLockSelection) |val| try USBCLockSelectionList.from_enum(val) else null,
                    .FDCANCLockSelection = if (self.FDCANCLockSelection) |val| try FDCANCLockSelectionList.from_enum(val) else null,
                    .ADCCLockSelection = if (self.ADCCLockSelection) |val| try ADCCLockSelectionList.from_enum(val) else null,
                    .CECCLockSelection = if (self.CECCLockSelection) |val| try CECCLockSelectionList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDiv: RCC_HSIDIV,
            SYSCLKSource: RCC_SW,
            RCC_MCO1Source: RCC_MCO1SEL,
            RCC_MCODiv1: RCC_MCOPRE,
            RCC_MCO2Source: RCC_MCO2SEL,
            RCC_MCODiv2: RCC_MCOPRE,
            traceClkSourceVirtual: traceClkSourceVirtualList,
            CDCPRE: CDCPREList,
            Cortex_Div: Cortex_DivList,
            HPRE: RCC_HPRE,
            CDPPRE: CDPPREList,
            CDPPRE1: RCC_PPRE,
            Tim1Mul: u32,
            CDPPRE2: RCC_PPRE,
            Tim2Mul: u32,
            SRDPPRE: RCC_PPRE,
            PLLSourceVirtual: RCC_PLLSRC,
            CKPERSourceSelection: RCC_PLLSRC,
            DIVM1: u32,
            DIVM2: u32,
            DIVM3: u32,
            DIVN1: u32,
            DIVP1: RCC_PLLDIV,
            DIVQ1: u32,
            DIVR1: u32,
            DIVN2: u32,
            DIVP2: u32,
            DIVQ2: u32,
            DIVR2: u32,
            DIVN3: u32,
            DIVP3: u32,
            DIVQ3: u32,
            DIVR3: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RCC_RTCSEL,
            SPI123CLockSelection: RCC_SAISEL,
            SAI1CLockSelection: RCC_SAIASEL,
            SAI2BCLockSelection: RCC_SAIASEL,
            SAI2ACLockSelection: RCC_SAIASEL,
            RNGCLockSelection: RCC_RNGSEL,
            I2C123CLockSelection: RCC_I2C1235SEL,
            I2C4CLockSelection: RCC_I2C4SEL,
            SPDIFCLockSelection: RCC_SPDIFRXSEL,
            QSPICLockSelection: RCC_SPDIFRXSEL,
            FMCCLockSelection: RCC_FMCSEL,
            SWPCLockSelection: RCC_SWPMISEL,
            SDMMC1CLockSelection: RCC_SDMMCSEL,
            DFSDMCLockSelection: RCC_DFSDMSEL,
            DFSDM2CLockSelection: RCC_DFSDMSEL,
            USART16CLockSelection: RCC_USART16910SEL,
            USART234578CLockSelection: RCC_USART234578SEL,
            LPUART1CLockSelection: RCC_LPUARTSEL,
            LPTIM1CLockSelection: RCC_LPTIM1SEL,
            LPTIM345CLockSelection: RCC_LPTIM2SEL,
            LPTIM2CLockSelection: RCC_LPTIM2SEL,
            SPI6CLockSelection: RCC_SPI6SEL,
            Spi45ClockSelection: RCC_SPI45SEL,
            USBCLockSelection: RCC_USBSEL,
            FDCANCLockSelection: RCC_FDCANSEL,
            ADCCLockSelection: RCC_ADCSEL,
            CECCLockSelection: RCC_CECSEL,
            RCC_TIM_PRescaler_Selection: RCC_TIMPRE,
            VDD_VALUE: f32,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,
            FLatency: FLatencyList,
            PLL1_VCI_Range: RCC_PLLRGE,
            PLL2_VCI_Range: RCC_PLLRGE,
            PLL3_VCI_Range: RCC_PLLRGE,
            Prescaler: ?PrescalerList,
            Source: ?SourceList,
            Polarity: ?PolarityList,
            ReloadValueType: ?ReloadValueTypeList,
            ReloadValue: ?u32,
            Fsync: ?f32,
            ErrorLimitValue: ?u32,
            HSI48CalibrationValue: ?u32,
            CSICalibrationValue: u32,
            HSICalibrationValue: u32,
            PLL1_VCO_SEL: RCC_PLLVCOSEL,
            PLL2_VCO_SEL: RCC_PLLVCOSEL,
            PLL3_VCO_SEL: RCC_PLLVCOSEL,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSIDiv = try cubemx_config.HSIDiv.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv1 = try cubemx_config.RCC_MCODiv1.to_enum(),
                    .RCC_MCO2Source = try cubemx_config.RCC_MCO2Source.to_enum(),
                    .RCC_MCODiv2 = try cubemx_config.RCC_MCODiv2.to_enum(),
                    .traceClkSourceVirtual = cubemx_config.traceClkSourceVirtual,
                    .CDCPRE = cubemx_config.CDCPRE,
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .HPRE = try cubemx_config.HPRE.to_enum(),
                    .CDPPRE = cubemx_config.CDPPRE,
                    .CDPPRE1 = try cubemx_config.CDPPRE1.to_enum(),
                    .Tim1Mul = cubemx_config.Tim1Mul,
                    .CDPPRE2 = try cubemx_config.CDPPRE2.to_enum(),
                    .Tim2Mul = cubemx_config.Tim2Mul,
                    .SRDPPRE = try cubemx_config.SRDPPRE.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .CKPERSourceSelection = try cubemx_config.CKPERSourceSelection.to_enum(),
                    .DIVM1 = cubemx_config.DIVM1,
                    .DIVM2 = cubemx_config.DIVM2,
                    .DIVM3 = cubemx_config.DIVM3,
                    .DIVN1 = cubemx_config.DIVN1,
                    .DIVP1 = try cubemx_config.DIVP1.to_enum(),
                    .DIVQ1 = cubemx_config.DIVQ1,
                    .DIVR1 = cubemx_config.DIVR1,
                    .DIVN2 = cubemx_config.DIVN2,
                    .DIVP2 = cubemx_config.DIVP2,
                    .DIVQ2 = cubemx_config.DIVQ2,
                    .DIVR2 = cubemx_config.DIVR2,
                    .DIVN3 = cubemx_config.DIVN3,
                    .DIVP3 = cubemx_config.DIVP3,
                    .DIVQ3 = cubemx_config.DIVQ3,
                    .DIVR3 = cubemx_config.DIVR3,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .SPI123CLockSelection = try cubemx_config.SPI123CLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
                    .SAI2BCLockSelection = try cubemx_config.SAI2BCLockSelection.to_enum(),
                    .SAI2ACLockSelection = try cubemx_config.SAI2ACLockSelection.to_enum(),
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .I2C123CLockSelection = try cubemx_config.I2C123CLockSelection.to_enum(),
                    .I2C4CLockSelection = try cubemx_config.I2C4CLockSelection.to_enum(),
                    .SPDIFCLockSelection = try cubemx_config.SPDIFCLockSelection.to_enum(),
                    .QSPICLockSelection = try cubemx_config.QSPICLockSelection.to_enum(),
                    .FMCCLockSelection = try cubemx_config.FMCCLockSelection.to_enum(),
                    .SWPCLockSelection = try cubemx_config.SWPCLockSelection.to_enum(),
                    .SDMMC1CLockSelection = try cubemx_config.SDMMC1CLockSelection.to_enum(),
                    .DFSDMCLockSelection = try cubemx_config.DFSDMCLockSelection.to_enum(),
                    .DFSDM2CLockSelection = try cubemx_config.DFSDM2CLockSelection.to_enum(),
                    .USART16CLockSelection = try cubemx_config.USART16CLockSelection.to_enum(),
                    .USART234578CLockSelection = try cubemx_config.USART234578CLockSelection.to_enum(),
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .LPTIM345CLockSelection = try cubemx_config.LPTIM345CLockSelection.to_enum(),
                    .LPTIM2CLockSelection = try cubemx_config.LPTIM2CLockSelection.to_enum(),
                    .SPI6CLockSelection = try cubemx_config.SPI6CLockSelection.to_enum(),
                    .Spi45ClockSelection = try cubemx_config.Spi45ClockSelection.to_enum(),
                    .USBCLockSelection = try cubemx_config.USBCLockSelection.to_enum(),
                    .FDCANCLockSelection = try cubemx_config.FDCANCLockSelection.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .CECCLockSelection = try cubemx_config.CECCLockSelection.to_enum(),
                    .RCC_TIM_PRescaler_Selection = try cubemx_config.RCC_TIM_PRescaler_Selection.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
                    .LSE_Drive_Capability = if (cubemx_config.LSE_Drive_Capability) |val| try val.to_enum() else null,
                    .FLatency = cubemx_config.FLatency,
                    .PLL1_VCI_Range = try cubemx_config.PLL1_VCI_Range.to_enum(),
                    .PLL2_VCI_Range = try cubemx_config.PLL2_VCI_Range.to_enum(),
                    .PLL3_VCI_Range = try cubemx_config.PLL3_VCI_Range.to_enum(),
                    .Prescaler = cubemx_config.Prescaler,
                    .Source = cubemx_config.Source,
                    .Polarity = cubemx_config.Polarity,
                    .ReloadValueType = cubemx_config.ReloadValueType,
                    .ReloadValue = cubemx_config.ReloadValue,
                    .Fsync = cubemx_config.Fsync,
                    .ErrorLimitValue = cubemx_config.ErrorLimitValue,
                    .HSI48CalibrationValue = cubemx_config.HSI48CalibrationValue,
                    .CSICalibrationValue = cubemx_config.CSICalibrationValue,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .PLL1_VCO_SEL = try cubemx_config.PLL1_VCO_SEL.to_enum(),
                    .PLL2_VCO_SEL = try cubemx_config.PLL2_VCO_SEL.to_enum(),
                    .PLL3_VCO_SEL = try cubemx_config.PLL3_VCO_SEL.to_enum(),
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
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            CSIRC: u32 = 0,
            RC48: u32 = 0,
            I2S_CKIN: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            MCO1Mult: u32 = 0,
            MCO1Div: u32 = 0,
            MCO1Pin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            traceClkSource: u32 = 0,
            TraceCLKOutput: u32 = 0,
            CDCPRE: u32 = 0,
            CDCPREOutput: u32 = 0,
            CpuClockOutput: u32 = 0,
            CortexPrescaler: u32 = 0,
            CortexSysOutput: u32 = 0,
            HPRE: u32 = 0,
            AHBOutput: u32 = 0,
            AXIClockOutput: u32 = 0,
            HCLK3Output: u32 = 0,
            CDPPRE: u32 = 0,
            APB3Output: u32 = 0,
            CDPPRE1: u32 = 0,
            Tim1Mul: u32 = 0,
            Tim1Output: u32 = 0,
            AHB12Output: u32 = 0,
            APB1Output: u32 = 0,
            CDPPRE2: u32 = 0,
            APB2Output: u32 = 0,
            Tim2Mul: u32 = 0,
            Tim2Output: u32 = 0,
            AHB4Output: u32 = 0,
            SRDPPRE: u32 = 0,
            APB4Output: u32 = 0,
            PLLSource: u32 = 0,
            CKPERSource: u32 = 0,
            CKPERoutput: u32 = 0,
            DIVM1: u32 = 0,
            DIVM2: u32 = 0,
            DIVM3: u32 = 0,
            DIVN1: u32 = 0,
            PLLFRACN: u32 = 0,
            DIVP1: u32 = 0,
            DIVQ1: u32 = 0,
            DIVQ1output: u32 = 0,
            DIVR1: u32 = 0,
            DIVR1output: u32 = 0,
            DIVN2: u32 = 0,
            PLL2FRACN: u32 = 0,
            DIVP2: u32 = 0,
            DIVP2output: u32 = 0,
            DIVQ2: u32 = 0,
            DIVQ2output: u32 = 0,
            DIVR2: u32 = 0,
            DIVR2output: u32 = 0,
            DIVN3: u32 = 0,
            PLL3FRACN: u32 = 0,
            DIVP3: u32 = 0,
            DIVP3output: u32 = 0,
            DIVQ3: u32 = 0,
            DIVQ3output: u32 = 0,
            DIVR3: u32 = 0,
            LTDCOutput: u32 = 0,
            DIVR3output: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            DAC1Output: u32 = 0,
            DAC2Output: u32 = 0,
            SPI123Mult: u32 = 0,
            SPI123output: u32 = 0,
            SAI1Mult: u32 = 0,
            DFSDMACLKoutput: u32 = 0,
            SAI1output: u32 = 0,
            SAI2BMult: u32 = 0,
            SAI2Boutput: u32 = 0,
            SAI2AMult: u32 = 0,
            SAI2Aoutput: u32 = 0,
            RNGMult: u32 = 0,
            RNGoutput: u32 = 0,
            I2C123Mult: u32 = 0,
            I2C123output: u32 = 0,
            I2C4Mult: u32 = 0,
            I2C4output: u32 = 0,
            SPDIFMult: u32 = 0,
            SPDIFoutput: u32 = 0,
            QSPIMult: u32 = 0,
            QSPIoutput: u32 = 0,
            FMCMult: u32 = 0,
            FMCoutput: u32 = 0,
            SWPMult: u32 = 0,
            SWPoutput: u32 = 0,
            SDMMCMult: u32 = 0,
            SDMMCoutput: u32 = 0,
            DFSDMMult: u32 = 0,
            DFSDMoutput: u32 = 0,
            DFSDM2Mult: u32 = 0,
            DFSDM2output: u32 = 0,
            USART16Mult: u32 = 0,
            USART16output: u32 = 0,
            USART234578Mult: u32 = 0,
            USART234578output: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            LPTIM345Mult: u32 = 0,
            LPTIM345output: u32 = 0,
            LPTIM2Mult: u32 = 0,
            LPTIM2output: u32 = 0,
            SPI6Mult: u32 = 0,
            SPI6output: u32 = 0,
            DFSDM2ACLKoutput: u32 = 0,
            SPI45Mult: u32 = 0,
            SPI45output: u32 = 0,
            USBMult: u32 = 0,
            USBoutput: u32 = 0,
            FDCANMult: u32 = 0,
            FDCANoutput: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            CECMult: u32 = 0,
            CECoutput: u32 = 0,
            VCOInput: u32 = 0,
            VCO2Input: u32 = 0,
            VCO3Input: u32 = 0,
            VCO1Output: u32 = 0,
            PLL1CLK: u32 = 0,
            VCO2Output: u32 = 0,
            VCO3Output: u32 = 0,
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

            var SYSCLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SYSCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SYSCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SYSCLKSOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_RC48: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_SYSCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_PLL2PCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var TRACECLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var TRACECLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var TRACECLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var TRACECLKSOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var CDPPRE1_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var CDPPRE1_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var CDPPRE1_4: bool = false; //semaphore for processing, not an actual flag in the output;
            var CDPPRE2_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var CDPPRE2_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var CDPPRE2_4: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PERSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PERSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PERSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI123CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI123CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI123CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI123CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI123CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2BCLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2BCLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2BCLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2BCLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2BCLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2BCLKSOURCE_SPDIF: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2ACLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2ACLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2ACLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2ACLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2ACLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2ACLKSOURCE_SPDIF: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_RC48: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C123CLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C123CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C123CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C123CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_PLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_PLL3R: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var QSPICLKSOURCE_HCLK3: bool = false; //semaphore for processing, not an actual flag in the output;
            var QSPICLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var QSPICLKSOURCE_PLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var QSPICLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_HCLK3: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_PLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SWPCLKSOURCE_HCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SWPCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1CLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1CLKSOURCE_PLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMCLKSOURCE_PCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMCLKSOURCE_SYS: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDM2CLKSOURCE_SRDPCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDM2CLKSOURCE_SYS: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16910CLKSOURCE_PCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16910CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16910CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16910CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16910CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16910CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1CLKSOURCE_PCLK3: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1CLKSOURCE_PLL2Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1CLKSOURCE_PLL3Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1CLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM345CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM345CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM345CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM345CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM345CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM345CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBCLKSOURCE_PLL3Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBCLKSOURCE_RC48: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_PLL2Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCCLKSOURCE_PLL2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCCLKSOURCE_PLL3R: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCCLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECCLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var TimPrescalerEnabled: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale0: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var pll1meduim: bool = false; //semaphore for processing, not an actual flag in the output;
            var pll1wide: bool = false; //semaphore for processing, not an actual flag in the output;
            var CSSEnabled: bool = false; //semaphore for processing, not an actual flag in the output;
            var RCC_LSECSS_ENABLED: bool = false; //semaphore for processing, not an actual flag in the output;

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

            var RC48 = ClockNode{
                .name = "RC48",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S_CKIN = ClockNode{
                .name = "I2S_CKIN",
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

            var MCO1Mult = ClockNode{
                .name = "MCO1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCO1Div = ClockNode{
                .name = "MCO1Div",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MCO1Pin = ClockNode{
                .name = "MCO1Pin",
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

            var traceClkSource = ClockNode{
                .name = "traceClkSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TraceCLKOutput = ClockNode{
                .name = "TraceCLKOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CDCPRE = ClockNode{
                .name = "CDCPRE",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CDCPREOutput = ClockNode{
                .name = "CDCPREOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CpuClockOutput = ClockNode{
                .name = "CpuClockOutput",
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

            var HPRE = ClockNode{
                .name = "HPRE",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHBOutput = ClockNode{
                .name = "AHBOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AXIClockOutput = ClockNode{
                .name = "AXIClockOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HCLK3Output = ClockNode{
                .name = "HCLK3Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CDPPRE = ClockNode{
                .name = "CDPPRE",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB3Output = ClockNode{
                .name = "APB3Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CDPPRE1 = ClockNode{
                .name = "CDPPRE1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Tim1Mul = ClockNode{
                .name = "Tim1Mul",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Tim1Output = ClockNode{
                .name = "Tim1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHB12Output = ClockNode{
                .name = "AHB12Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB1Output = ClockNode{
                .name = "APB1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CDPPRE2 = ClockNode{
                .name = "CDPPRE2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB2Output = ClockNode{
                .name = "APB2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Tim2Mul = ClockNode{
                .name = "Tim2Mul",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Tim2Output = ClockNode{
                .name = "Tim2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHB4Output = ClockNode{
                .name = "AHB4Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SRDPPRE = ClockNode{
                .name = "SRDPPRE",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB4Output = ClockNode{
                .name = "APB4Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSource = ClockNode{
                .name = "PLLSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CKPERSource = ClockNode{
                .name = "CKPERSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CKPERoutput = ClockNode{
                .name = "CKPERoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVM1 = ClockNode{
                .name = "DIVM1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVM2 = ClockNode{
                .name = "DIVM2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVM3 = ClockNode{
                .name = "DIVM3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVN1 = ClockNode{
                .name = "DIVN1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLFRACN = ClockNode{
                .name = "PLLFRACN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVP1 = ClockNode{
                .name = "DIVP1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVQ1 = ClockNode{
                .name = "DIVQ1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVQ1output = ClockNode{
                .name = "DIVQ1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVR1 = ClockNode{
                .name = "DIVR1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVR1output = ClockNode{
                .name = "DIVR1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVN2 = ClockNode{
                .name = "DIVN2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2FRACN = ClockNode{
                .name = "PLL2FRACN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVP2 = ClockNode{
                .name = "DIVP2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVP2output = ClockNode{
                .name = "DIVP2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVQ2 = ClockNode{
                .name = "DIVQ2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVQ2output = ClockNode{
                .name = "DIVQ2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVR2 = ClockNode{
                .name = "DIVR2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVR2output = ClockNode{
                .name = "DIVR2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVN3 = ClockNode{
                .name = "DIVN3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3FRACN = ClockNode{
                .name = "PLL3FRACN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVP3 = ClockNode{
                .name = "DIVP3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVP3output = ClockNode{
                .name = "DIVP3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVQ3 = ClockNode{
                .name = "DIVQ3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVQ3output = ClockNode{
                .name = "DIVQ3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVR3 = ClockNode{
                .name = "DIVR3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LTDCOutput = ClockNode{
                .name = "LTDCOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVR3output = ClockNode{
                .name = "DIVR3output",
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

            var DAC1Output = ClockNode{
                .name = "DAC1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DAC2Output = ClockNode{
                .name = "DAC2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI123Mult = ClockNode{
                .name = "SPI123Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI123output = ClockNode{
                .name = "SPI123output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI1Mult = ClockNode{
                .name = "SAI1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DFSDMACLKoutput = ClockNode{
                .name = "DFSDMACLKoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI1output = ClockNode{
                .name = "SAI1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI2BMult = ClockNode{
                .name = "SAI2BMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI2Boutput = ClockNode{
                .name = "SAI2Boutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI2AMult = ClockNode{
                .name = "SAI2AMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI2Aoutput = ClockNode{
                .name = "SAI2Aoutput",
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

            var I2C123Mult = ClockNode{
                .name = "I2C123Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C123output = ClockNode{
                .name = "I2C123output",
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

            var SPDIFMult = ClockNode{
                .name = "SPDIFMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPDIFoutput = ClockNode{
                .name = "SPDIFoutput",
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

            var FMCMult = ClockNode{
                .name = "FMCMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FMCoutput = ClockNode{
                .name = "FMCoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SWPMult = ClockNode{
                .name = "SWPMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SWPoutput = ClockNode{
                .name = "SWPoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SDMMCMult = ClockNode{
                .name = "SDMMCMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SDMMCoutput = ClockNode{
                .name = "SDMMCoutput",
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

            var DFSDM2Mult = ClockNode{
                .name = "DFSDM2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DFSDM2output = ClockNode{
                .name = "DFSDM2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART16Mult = ClockNode{
                .name = "USART16Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART16output = ClockNode{
                .name = "USART16output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART234578Mult = ClockNode{
                .name = "USART234578Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART234578output = ClockNode{
                .name = "USART234578output",
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

            var LPTIM345Mult = ClockNode{
                .name = "LPTIM345Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM345output = ClockNode{
                .name = "LPTIM345output",
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

            var SPI6Mult = ClockNode{
                .name = "SPI6Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI6output = ClockNode{
                .name = "SPI6output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DFSDM2ACLKoutput = ClockNode{
                .name = "DFSDM2ACLKoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI45Mult = ClockNode{
                .name = "SPI45Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI45output = ClockNode{
                .name = "SPI45output",
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

            var VCOInput = ClockNode{
                .name = "VCOInput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCO2Input = ClockNode{
                .name = "VCO2Input",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCO3Input = ClockNode{
                .name = "VCO3Input",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCO1Output = ClockNode{
                .name = "VCO1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL1CLK = ClockNode{
                .name = "PLL1CLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCO2Output = ClockNode{
                .name = "VCO2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCO3Output = ClockNode{
                .name = "VCO3Output",
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
                        .RCC_PLLSAIDIVR_1 => {},
                        .RCC_PLLSAIDIVR_2 => {},
                        .RCC_PLLSAIDIVR_4 => {},
                        .RCC_PLLSAIDIVR_8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLSAIDIVR_1;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 5e7,
                    };

                    break :blk user_val orelse 2.4e7;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 5e7,
                };

                break :blk user_val orelse 2.4e7;
            };

            const LSI_VALUEValue: f32 = blk: {
                const user_val = config.LSI_VALUE;
                LSIRC.limit = .{
                    .min = 3.14e4,
                    .max = 3.26e4,
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

            const CSI_VALUEValue: f32 = blk: {
                break :blk 4e6;
            };

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 1.2288e7;
            };

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_CSI => SYSCLKSOURCE_CSI = true,
                        .RCC_SYSCLKSOURCE_HSI => SYSCLKSOURCE_HSI = true,
                        .RCC_SYSCLKSOURCE_HSE => SYSCLKSOURCE_HSE = true,
                        .RCC_SYSCLKSOURCE_PLLCLK => SYSCLKSOURCE_PLLCLK = true,
                    }
                }
                break :blk user_val orelse {
                    SYSCLKSOURCE_HSI = true;
                    break :blk .RCC_SYSCLKSOURCE_HSI;
                };
            };

            const RCC_MCO1SourceValue: RCC_MCO1SourceList = blk: {
                const user_val = config.RCC_MCO1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_LSE => MCO1SOURCE_LSE = true,
                        .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                        .RCC_MCO1SOURCE_HSI => MCO1SOURCE_HSI = true,
                        .RCC_MCO1SOURCE_HSI48 => MCO1SOURCE_RC48 = true,
                        .RCC_MCO1SOURCE_PLL1QCLK => MCO1SOURCE_PLLCLK = true,
                    }
                }
                break :blk user_val orelse {
                    MCO1SOURCE_HSI = true;
                    break :blk .RCC_MCO1SOURCE_HSI;
                };
            };

            const RCC_MCODiv1Value: RCC_MCODiv1List = blk: {
                const user_val = config.RCC_MCODiv1;

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
                        .RCC_MCO2SOURCE_SYSCLK => MCO2SOURCE_SYSCLK = true,
                        .RCC_MCO2SOURCE_PLL2PCLK => MCO2SOURCE_PLL2PCLK = true,
                        .RCC_MCO2SOURCE_HSE => MCO2SOURCE_HSE = true,
                        .RCC_MCO2SOURCE_PLLCLK => MCO2SOURCE_PLLCLK = true,
                        .RCC_MCO2SOURCE_CSICLK => MCO2SOURCE_CSI = true,
                        .RCC_MCO2SOURCE_LSICLK => MCO2SOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    MCO2SOURCE_SYSCLK = true;
                    break :blk .RCC_MCO2SOURCE_SYSCLK;
                };
            };

            const RCC_MCODiv2Value: RCC_MCODiv2List = blk: {
                const user_val = config.RCC_MCODiv2;

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

            const traceClkSourceVirtualValue: traceClkSourceVirtualList = blk: {
                if (!(check_MCU("SWD") or check_MCU("JTAG")) or SYSCLKSOURCE_HSI) {
                    TRACECLKSOURCE_HSI = true;
                    break :blk .RCC_TRACECLKSOURCE_HSI;
                } else if (SYSCLKSOURCE_CSI) {
                    TRACECLKSOURCE_CSI = true;
                    break :blk .RCC_TRACECLKSOURCE_CSI;
                } else if (SYSCLKSOURCE_HSE) {
                    TRACECLKSOURCE_HSE = true;
                    break :blk .RCC_TRACECLKSOURCE_HSE;
                } else if (SYSCLKSOURCE_PLLCLK) {
                    TRACECLKSOURCE_PLLCLK = true;
                    break :blk .RCC_TRACECLKSOURCE_PLLCLK;
                }
                TRACECLKSOURCE_HSI = true;
                break :blk .RCC_TRACECLKSOURCE_HSI;
            };

            const CDCPREValue: CDCPREList = blk: {
                const user_val = config.CDCPRE;

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

            const HPREValue: HPREList = blk: {
                const user_val = config.HPRE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HCLK_DIV1 => {},
                        .RCC_HCLK_DIV2 => {},
                        .RCC_HCLK_DIV4 => {},
                        .RCC_HCLK_DIV8 => {},
                        .RCC_HCLK_DIV16 => {},
                        .RCC_HCLK_DIV64 => {},
                        .RCC_HCLK_DIV128 => {},
                        .RCC_HCLK_DIV256 => {},
                        .RCC_HCLK_DIV512 => {},
                    }
                }
                break :blk user_val orelse .RCC_HCLK_DIV1;
            };

            const CDPPREValue: CDPPREList = blk: {
                const user_val = config.CDPPRE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB3_DIV1 => {},
                        .RCC_APB3_DIV2 => {},
                        .RCC_APB3_DIV4 => {},
                        .RCC_APB3_DIV8 => {},
                        .RCC_APB3_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_APB3_DIV1;
            };

            const CDPPRE1Value: CDPPRE1List = blk: {
                const user_val = config.CDPPRE1;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB1_DIV1 => CDPPRE1_1 = true,
                        .RCC_APB1_DIV2 => CDPPRE1_2 = true,
                        .RCC_APB1_DIV4 => CDPPRE1_4 = true,
                        .RCC_APB1_DIV8 => {},
                        .RCC_APB1_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    CDPPRE1_1 = true;
                    break :blk .RCC_APB1_DIV1;
                };
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

            const Tim1MulValue: u32 = blk: {
                if (((CDPPRE1_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((CDPPRE1_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((CDPPRE1_2) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((CDPPRE1_4) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                }
                break :blk 2;
            };

            const CDPPRE2Value: CDPPRE2List = blk: {
                const user_val = config.CDPPRE2;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB2_DIV1 => CDPPRE2_1 = true,
                        .RCC_APB2_DIV2 => CDPPRE2_2 = true,
                        .RCC_APB2_DIV4 => CDPPRE2_4 = true,
                        .RCC_APB2_DIV8 => {},
                        .RCC_APB2_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    CDPPRE2_1 = true;
                    break :blk .RCC_APB2_DIV1;
                };
            };

            const Tim2MulValue: u32 = blk: {
                if (((CDPPRE2_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((CDPPRE2_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((CDPPRE2_2) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((CDPPRE2_4) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                }
                break :blk 2;
            };

            const SRDPPREValue: SRDPPREList = blk: {
                const user_val = config.SRDPPRE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB4_DIV1 => {},
                        .RCC_APB4_DIV2 => {},
                        .RCC_APB4_DIV4 => {},
                        .RCC_APB4_DIV8 => {},
                        .RCC_APB4_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_APB4_DIV1;
            };

            const USBCLockSelectionValue: USBCLockSelectionList = blk: {
                const user_val = config.USBCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL => USBCLKSOURCE_PLL1Q = true,
                        .RCC_USBCLKSOURCE_PLL3 => USBCLKSOURCE_PLL3Q = true,
                        .RCC_USBCLKSOURCE_HSI48 => USBCLKSOURCE_RC48 = true,
                    }
                }
                break :blk user_val orelse {
                    USBCLKSOURCE_PLL1Q = true;
                    break :blk .RCC_USBCLKSOURCE_PLL;
                };
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) and (USBCLKSOURCE_PLL3Q or USBCLKSOURCE_PLL1Q))) {
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
                                "(((USB_OTG_FSUsed_ForRCC | USB_OTG_HSUsed_ForRCC)|USB_OTG_HSEmbeddedPHYUsed_ForRCC)& (USBCLKSOURCE_PLL3Q|USBCLKSOURCE_PLL1Q)) ",
                                "PLL Mux should have HSE as input",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    PLLSOURCE_HSE = true;
                    break :blk .RCC_PLLSOURCE_HSE;
                }
                const user_val = config.PLLSourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_HSI => PLLSOURCE_HSI = true,
                        .RCC_PLLSOURCE_CSI => PLLSOURCE_CSI = true,
                        .RCC_PLLSOURCE_HSE => PLLSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLLSOURCE_HSI = true;
                    break :blk .RCC_PLLSOURCE_HSI;
                };
            };

            const CKPERSourceSelectionValue: CKPERSourceSelectionList = blk: {
                const user_val = config.CKPERSourceSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CLKPSOURCE_HSI => PERSOURCE_HSI = true,
                        .RCC_CLKPSOURCE_CSI => PERSOURCE_CSI = true,
                        .RCC_CLKPSOURCE_HSE => PERSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    PERSOURCE_HSI = true;
                    break :blk .RCC_CLKPSOURCE_HSI;
                };
            };

            const DIVM1Value: u32 = blk: {
                const user_val = config.DIVM1;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVM1",
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
                            "DIVM1",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 32;
            };

            const DIVM2Value: u32 = blk: {
                const user_val = config.DIVM2;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVM2",
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
                            "DIVM2",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 32;
            };

            const DIVM3Value: u32 = blk: {
                const user_val = config.DIVM3;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVM3",
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
                            "DIVM3",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 32;
            };

            const DIVN1Value: u32 = blk: {
                const user_val = config.DIVN1;
                if (user_val) |val| {
                    if (val < 8) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVN1",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                    if (val > 420) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVN1",
                            "Else",
                            "No additional information",
                            420,
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
                };

                break :blk user_val orelse 0;
            };

            const DIVP1Value: DIVP1List = blk: {
                const user_val = config.DIVP1;

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

            const DIVQ1Value: u32 = blk: {
                const user_val = config.DIVQ1;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVQ1",
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
                            "DIVQ1",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVR1Value: u32 = blk: {
                const user_val = config.DIVR1;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVR1",
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
                            "DIVR1",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVN2Value: u32 = blk: {
                const user_val = config.DIVN2;
                if (user_val) |val| {
                    if (val < 8) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVN2",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                    if (val > 420) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVN2",
                            "Else",
                            "No additional information",
                            420,
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
                };

                break :blk user_val orelse 0;
            };

            const DIVP2Value: u32 = blk: {
                const user_val = config.DIVP2;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVP2",
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
                            "DIVP2",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVQ2Value: u32 = blk: {
                const user_val = config.DIVQ2;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVQ2",
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
                            "DIVQ2",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVR2Value: u32 = blk: {
                const user_val = config.DIVR2;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVR2",
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
                            "DIVR2",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVN3Value: u32 = blk: {
                const user_val = config.DIVN3;
                if (user_val) |val| {
                    if (val < 8) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVN3",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                    if (val > 420) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVN3",
                            "Else",
                            "No additional information",
                            420,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 129;
            };

            const PLL3FRACNValue: u32 = blk: {
                const user_val = config.PLL3FRACN;
                PLL3FRACN.limit = .{
                    .min = 0,
                    .max = 8191,
                };

                break :blk user_val orelse 0;
            };

            const DIVP3Value: u32 = blk: {
                const user_val = config.DIVP3;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVP3",
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
                            "DIVP3",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVQ3Value: u32 = blk: {
                const user_val = config.DIVQ3;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVQ3",
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
                            "DIVQ3",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVR3Value: u32 = blk: {
                const user_val = config.DIVR3;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVR3",
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
                            "DIVR3",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: RCC_RTC_Clock_Source_FROM_HSEList = blk: {
                const user_val = config.RCC_RTC_Clock_Source_FROM_HSE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_HSE_DIV2 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV3 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV4 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV5 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV6 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV7 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV8 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV9 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV10 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV11 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV12 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV13 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV14 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV15 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV16 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV17 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV18 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV19 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV20 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV21 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV22 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV23 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV24 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV25 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV26 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV27 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV28 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV29 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV30 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV31 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV32 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV33 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV34 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV35 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV36 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV37 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV38 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV39 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV40 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV41 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV42 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV43 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV44 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV45 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV46 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV47 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV48 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV49 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV50 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV51 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV52 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV53 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV54 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV55 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV56 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV57 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV58 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV59 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV60 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV61 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV62 => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV63 => {},
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_HSE_DIV2;
            };

            const RTCClockSelectionValue: RTCClockSelectionList = blk: {
                const user_val = config.RTCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => {},
                        .RCC_RTCCLKSOURCE_LSI => {},
                        .HSERTCDevisor => {},
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_LSI;
            };

            const SPI123CLockSelectionValue: SPI123CLockSelectionList = blk: {
                const user_val = config.SPI123CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI123CLKSOURCE_PLL => SPI123CLKSOURCE_PLLQ1 = true,
                        .RCC_SPI123CLKSOURCE_PLL2 => SPI123CLKSOURCE_PLLP2 = true,
                        .RCC_SPI123CLKSOURCE_PLL3 => SPI123CLKSOURCE_PLLP3 = true,
                        .RCC_SPI123CLKSOURCE_PIN => SPI123CLKSOURCE_CKIN = true,
                        .RCC_SPI123CLKSOURCE_CLKP => SPI123CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SPI123CLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SPI123CLKSOURCE_PLL;
                };
            };

            const SAI1CLockSelectionValue: SAI1CLockSelectionList = blk: {
                const user_val = config.SAI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_PLL => SAI1CLKSOURCE_PLLQ1 = true,
                        .RCC_SAI1CLKSOURCE_PLL2 => SAI1CLKSOURCE_PLLP2 = true,
                        .RCC_SAI1CLKSOURCE_PLL3 => SAI1CLKSOURCE_PLLP3 = true,
                        .RCC_SAI1CLKSOURCE_PIN => SAI1CLKSOURCE_CKIN = true,
                        .RCC_SAI1CLKSOURCE_CLKP => SAI1CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SAI1CLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI1CLKSOURCE_PLL;
                };
            };

            const SAI2BCLockSelectionValue: SAI2BCLockSelectionList = blk: {
                const user_val = config.SAI2BCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI2BCLKSOURCE_PLL => SAI2BCLKSOURCE_PLLQ1 = true,
                        .RCC_SAI2BCLKSOURCE_PLL2 => SAI2BCLKSOURCE_PLLP2 = true,
                        .RCC_SAI2BCLKSOURCE_PLL3 => SAI2BCLKSOURCE_PLLP3 = true,
                        .RCC_SAI2BCLKSOURCE_PIN => SAI2BCLKSOURCE_CKIN = true,
                        .RCC_SAI2BCLKSOURCE_CLKP => SAI2BCLKSOURCE_PER = true,
                        .RCC_SAI2BCLKSOURCE_SPDIF => SAI2BCLKSOURCE_SPDIF = true,
                    }
                }
                break :blk user_val orelse {
                    SAI2BCLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI2BCLKSOURCE_PLL;
                };
            };

            const SAI2ACLockSelectionValue: SAI2ACLockSelectionList = blk: {
                const user_val = config.SAI2ACLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI2ACLKSOURCE_PLL => SAI2ACLKSOURCE_PLLQ1 = true,
                        .RCC_SAI2ACLKSOURCE_PLL2 => SAI2ACLKSOURCE_PLLP2 = true,
                        .RCC_SAI2ACLKSOURCE_PLL3 => SAI2ACLKSOURCE_PLLP3 = true,
                        .RCC_SAI2ACLKSOURCE_PIN => SAI2ACLKSOURCE_CKIN = true,
                        .RCC_SAI2ACLKSOURCE_CLKP => SAI2ACLKSOURCE_PER = true,
                        .RCC_SAI2ACLKSOURCE_SPDIF => SAI2ACLKSOURCE_SPDIF = true,
                    }
                }
                break :blk user_val orelse {
                    SAI2ACLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI2ACLKSOURCE_PLL;
                };
            };

            const RNGCLockSelectionValue: RNGCLockSelectionList = blk: {
                const user_val = config.RNGCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_HSI48 => RNGCLKSOURCE_RC48 = true,
                        .RCC_RNGCLKSOURCE_PLL => RNGCLKSOURCE_PLLQ1 = true,
                        .RCC_RNGCLKSOURCE_LSE => RNGCLKSOURCE_LSE = true,
                        .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    RNGCLKSOURCE_RC48 = true;
                    break :blk .RCC_RNGCLKSOURCE_HSI48;
                };
            };

            const I2C123CLockSelectionValue: I2C123CLockSelectionList = blk: {
                const user_val = config.I2C123CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C123CLKSOURCE_D2PCLK1 => I2C123CLKSOURCE_PCLK1 = true,
                        .RCC_I2C123CLKSOURCE_PLL3 => I2C123CLKSOURCE_PLLR3 = true,
                        .RCC_I2C123CLKSOURCE_HSI => I2C123CLKSOURCE_HSI = true,
                        .RCC_I2C123CLKSOURCE_CSI => I2C123CLKSOURCE_CSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C123CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_I2C123CLKSOURCE_D2PCLK1;
                };
            };

            const I2C4CLockSelectionValue: I2C4CLockSelectionList = blk: {
                const user_val = config.I2C4CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C4CLKSOURCE_D3PCLK1 => I2C4CLKSOURCE_PCLK4 = true,
                        .RCC_I2C4CLKSOURCE_PLL3 => I2C4CLKSOURCE_PLLR3 = true,
                        .RCC_I2C4CLKSOURCE_HSI => I2C4CLKSOURCE_HSI = true,
                        .RCC_I2C4CLKSOURCE_CSI => I2C4CLKSOURCE_CSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C4CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_I2C4CLKSOURCE_D3PCLK1;
                };
            };

            const SPDIFCLockSelectionValue: SPDIFCLockSelectionList = blk: {
                const user_val = config.SPDIFCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPDIFRXCLKSOURCE_PLL => SPDIFCLKSOURCE_PLL1Q = true,
                        .RCC_SPDIFRXCLKSOURCE_PLL2 => SPDIFCLKSOURCE_PLL2R = true,
                        .RCC_SPDIFRXCLKSOURCE_PLL3 => SPDIFCLKSOURCE_PLL3R = true,
                        .RCC_SPDIFRXCLKSOURCE_HSI => SPDIFCLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse {
                    SPDIFCLKSOURCE_PLL1Q = true;
                    break :blk .RCC_SPDIFRXCLKSOURCE_PLL;
                };
            };

            const QSPICLockSelectionValue: QSPICLockSelectionList = blk: {
                const user_val = config.QSPICLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_OSPICLKSOURCE_D1HCLK => QSPICLKSOURCE_HCLK3 = true,
                        .RCC_OSPICLKSOURCE_PLL => QSPICLKSOURCE_PLL1Q = true,
                        .RCC_OSPICLKSOURCE_PLL2 => QSPICLKSOURCE_PLL2R = true,
                        .RCC_OSPICLKSOURCE_CLKP => QSPICLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    QSPICLKSOURCE_HCLK3 = true;
                    break :blk .RCC_OSPICLKSOURCE_D1HCLK;
                };
            };

            const FMCCLockSelectionValue: FMCCLockSelectionList = blk: {
                const user_val = config.FMCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FMCCLKSOURCE_D1HCLK => FMCCLKSOURCE_HCLK3 = true,
                        .RCC_FMCCLKSOURCE_PLL => FMCCLKSOURCE_PLL1Q = true,
                        .RCC_FMCCLKSOURCE_PLL2 => FMCCLKSOURCE_PLL2R = true,
                        .RCC_FMCCLKSOURCE_CLKP => FMCCLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    FMCCLKSOURCE_HCLK3 = true;
                    break :blk .RCC_FMCCLKSOURCE_D1HCLK;
                };
            };

            const SWPCLockSelectionValue: SWPCLockSelectionList = blk: {
                const user_val = config.SWPCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SWPMI1CLKSOURCE_D2PCLK1 => SWPCLKSOURCE_HCLK1 = true,
                        .RCC_SWPMI1CLKSOURCE_HSI => SWPCLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse {
                    SWPCLKSOURCE_HCLK1 = true;
                    break :blk .RCC_SWPMI1CLKSOURCE_D2PCLK1;
                };
            };

            const SDMMC1CLockSelectionValue: SDMMC1CLockSelectionList = blk: {
                const user_val = config.SDMMC1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SDMMCCLKSOURCE_PLL => SDMMC1CLKSOURCE_PLL1Q = true,
                        .RCC_SDMMCCLKSOURCE_PLL2 => SDMMC1CLKSOURCE_PLL2R = true,
                    }
                }
                break :blk user_val orelse {
                    SDMMC1CLKSOURCE_PLL1Q = true;
                    break :blk .RCC_SDMMCCLKSOURCE_PLL;
                };
            };

            const DFSDMCLockSelectionValue: DFSDMCLockSelectionList = blk: {
                const user_val = config.DFSDMCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DFSDM1CLKSOURCE_D2PCLK1 => DFSDMCLKSOURCE_PCLK2 = true,
                        .RCC_DFSDM1CLKSOURCE_SYS => DFSDMCLKSOURCE_SYS = true,
                    }
                }
                break :blk user_val orelse {
                    DFSDMCLKSOURCE_PCLK2 = true;
                    break :blk .RCC_DFSDM1CLKSOURCE_D2PCLK1;
                };
            };

            const DFSDM2CLockSelectionValue: DFSDM2CLockSelectionList = blk: {
                const user_val = config.DFSDM2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DFSDM2CLKSOURCE_SRDPCLK1 => DFSDM2CLKSOURCE_SRDPCLK1 = true,
                        .RCC_DFSDM2CLKSOURCE_SYS => DFSDM2CLKSOURCE_SYS = true,
                    }
                }
                break :blk user_val orelse {
                    DFSDM2CLKSOURCE_SRDPCLK1 = true;
                    break :blk .RCC_DFSDM2CLKSOURCE_SRDPCLK1;
                };
            };

            const USART16CLockSelectionValue: USART16CLockSelectionList = blk: {
                const user_val = config.USART16CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART16910CLKSOURCE_D2PCLK2 => USART16910CLKSOURCE_PCLK2 = true,
                        .RCC_USART16910CLKSOURCE_PLL2 => USART16910CLKSOURCE_PLLQ2 = true,
                        .RCC_USART16910CLKSOURCE_PLL3 => USART16910CLKSOURCE_PLLQ3 = true,
                        .RCC_USART16910CLKSOURCE_HSI => USART16910CLKSOURCE_HSI = true,
                        .RCC_USART16910CLKSOURCE_CSI => USART16910CLKSOURCE_CSI = true,
                        .RCC_USART16910CLKSOURCE_LSE => USART16910CLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART16910CLKSOURCE_PCLK2 = true;
                    break :blk .RCC_USART16910CLKSOURCE_D2PCLK2;
                };
            };

            const USART234578CLockSelectionValue: USART234578CLockSelectionList = blk: {
                const user_val = config.USART234578CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART234578CLKSOURCE_D2PCLK1 => USART2CLKSOURCE_PCLK1 = true,
                        .RCC_USART234578CLKSOURCE_PLL2 => USART2CLKSOURCE_PLLQ2 = true,
                        .RCC_USART234578CLKSOURCE_PLL3 => USART2CLKSOURCE_PLLQ3 = true,
                        .RCC_USART234578CLKSOURCE_HSI => USART2CLKSOURCE_HSI = true,
                        .RCC_USART234578CLKSOURCE_CSI => USART2CLKSOURCE_CSI = true,
                        .RCC_USART234578CLKSOURCE_LSE => USART2CLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART2CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_USART234578CLKSOURCE_D2PCLK1;
                };
            };

            const LPUART1CLockSelectionValue: LPUART1CLockSelectionList = blk: {
                const user_val = config.LPUART1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_D3PCLK1 => LPUART1CLKSOURCE_PCLK3 = true,
                        .RCC_LPUART1CLKSOURCE_PLL2 => LPUART1CLKSOURCE_PLL2Q = true,
                        .RCC_LPUART1CLKSOURCE_PLL3 => LPUART1CLKSOURCE_PLL3Q = true,
                        .RCC_LPUART1CLKSOURCE_HSI => LPUART1CLKSOURCE_HSI = true,
                        .RCC_LPUART1CLKSOURCE_CSI => LPUART1CLKSOURCE_CSI = true,
                        .RCC_LPUART1CLKSOURCE_LSE => LPUART1CLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    LPUART1CLKSOURCE_PCLK3 = true;
                    break :blk .RCC_LPUART1CLKSOURCE_D3PCLK1;
                };
            };

            const LPTIM1CLockSelectionValue: LPTIM1CLockSelectionList = blk: {
                const user_val = config.LPTIM1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_D2PCLK1 => LPTIM1CLKSOURCE_PCLK1 = true,
                        .RCC_LPTIM1CLKSOURCE_PLL2 => LPTIM1CLKSOURCE_PLLP2 = true,
                        .RCC_LPTIM1CLKSOURCE_PLL3 => LPTIM1CLKSOURCE_PLLR3 = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1CLKSOURCE_LSE = true,
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1CLKSOURCE_LSI = true,
                        .RCC_LPTIM1CLKSOURCE_CLKP => LPTIM1CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM1CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_LPTIM1CLKSOURCE_D2PCLK1;
                };
            };

            const LPTIM345CLockSelectionValue: LPTIM345CLockSelectionList = blk: {
                const user_val = config.LPTIM345CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM3CLKSOURCE_D3PCLK1 => LPTIM345CLKSOURCE_PCLK4 = true,
                        .RCC_LPTIM3CLKSOURCE_PLL2 => LPTIM345CLKSOURCE_PLLP2 = true,
                        .RCC_LPTIM3CLKSOURCE_PLL3 => LPTIM345CLKSOURCE_PLLR3 = true,
                        .RCC_LPTIM3CLKSOURCE_LSE => LPTIM345CLKSOURCE_LSE = true,
                        .RCC_LPTIM3CLKSOURCE_LSI => LPTIM345CLKSOURCE_LSI = true,
                        .RCC_LPTIM3CLKSOURCE_CLKP => LPTIM345CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM345CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_LPTIM3CLKSOURCE_D3PCLK1;
                };
            };

            const LPTIM2CLockSelectionValue: LPTIM2CLockSelectionList = blk: {
                const user_val = config.LPTIM2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM2CLKSOURCE_D3PCLK1 => LPTIM2CLKSOURCE_PCLK4 = true,
                        .RCC_LPTIM2CLKSOURCE_PLL2 => LPTIM2CLKSOURCE_PLLP2 = true,
                        .RCC_LPTIM2CLKSOURCE_PLL3 => LPTIM2CLKSOURCE_PLLR3 = true,
                        .RCC_LPTIM2CLKSOURCE_LSE => LPTIM2CLKSOURCE_LSE = true,
                        .RCC_LPTIM2CLKSOURCE_LSI => LPTIM2CLKSOURCE_LSI = true,
                        .RCC_LPTIM2CLKSOURCE_CLKP => LPTIM2CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM2CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_LPTIM2CLKSOURCE_D3PCLK1;
                };
            };

            const SPI6CLockSelectionValue: SPI6CLockSelectionList = blk: {
                const user_val = config.SPI6CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI6CLKSOURCE_D3PCLK1 => SPI6CLKSOURCE_PCLK4 = true,
                        .RCC_SPI6CLKSOURCE_PLL2 => SPI6CLKSOURCE_PLLQ2 = true,
                        .RCC_SPI6CLKSOURCE_PLL3 => SPI6CLKSOURCE_PLLQ3 = true,
                        .RCC_SPI6CLKSOURCE_HSI => SPI6CLKSOURCE_HSI = true,
                        .RCC_SPI6CLKSOURCE_CSI => SPI6CLKSOURCE_CSI = true,
                        .RCC_SPI6CLKSOURCE_HSE => SPI6CLKSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    SPI6CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_SPI6CLKSOURCE_D3PCLK1;
                };
            };

            const Spi45ClockSelectionValue: Spi45ClockSelectionList = blk: {
                const user_val = config.Spi45ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI45CLKSOURCE_D2PCLK1 => SPI45CLKSOURCE_PCLK1 = true,
                        .RCC_SPI45CLKSOURCE_PLL2 => SPI45CLKSOURCE_PLLQ2 = true,
                        .RCC_SPI45CLKSOURCE_PLL3 => SPI45CLKSOURCE_PLLQ3 = true,
                        .RCC_SPI45CLKSOURCE_HSI => SPI45CLKSOURCE_HSI = true,
                        .RCC_SPI45CLKSOURCE_CSI => SPI45CLKSOURCE_CSI = true,
                        .RCC_SPI45CLKSOURCE_HSE => SPI45CLKSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    SPI45CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_SPI45CLKSOURCE_D2PCLK1;
                };
            };

            const FDCANCLockSelectionValue: FDCANCLockSelectionList = blk: {
                const user_val = config.FDCANCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FDCANCLKSOURCE_HSE => FDCANCLKSOURCE_HSE = true,
                        .RCC_FDCANCLKSOURCE_PLL => FDCANCLKSOURCE_PLL1Q = true,
                        .RCC_FDCANCLKSOURCE_PLL2 => FDCANCLKSOURCE_PLL2Q = true,
                    }
                }
                break :blk user_val orelse {
                    FDCANCLKSOURCE_PLL1Q = true;
                    break :blk .RCC_FDCANCLKSOURCE_PLL;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_PLL2 => ADCCLKSOURCE_PLL2P = true,
                        .RCC_ADCCLKSOURCE_PLL3 => ADCCLKSOURCE_PLL3R = true,
                        .RCC_ADCCLKSOURCE_CLKP => ADCCLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    ADCCLKSOURCE_PLL2P = true;
                    break :blk .RCC_ADCCLKSOURCE_PLL2;
                };
            };

            const CECCLockSelectionValue: CECCLockSelectionList = blk: {
                const user_val = config.CECCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CECCLKSOURCE_LSE => CECCLKSOURCE_LSE = true,
                        .RCC_CECCLKSOURCE_LSI => CECCLKSOURCE_LSI = true,
                        .RCC_CECCLKSOURCE_CSI => CECCLKSOURCE_CSI = true,
                    }
                }
                break :blk user_val orelse {
                    CECCLKSOURCE_LSI = true;
                    break :blk .RCC_CECCLKSOURCE_LSI;
                };
            };

            const VDD_VALUEValue: f32 = blk: {
                const user_val = config.extra_config.VDD_VALUE;
                if (user_val) |val| {
                    if (val < 1.62e0) {
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
                            1.62e0,
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
                if (config.flags.CRSActivatedSourceLSE or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC)) or (config.flags.MCO1Config and MCO1SOURCE_LSE) or (LPTIM1CLKSOURCE_LSE and config.flags.LPTIM1Used_ForRCC) or (CECCLKSOURCE_LSE and config.flags.CECUsed_ForRCC) or (RNGCLKSOURCE_LSE and config.flags.RNGUsed_ForRCC) or (LPTIM2CLKSOURCE_LSE and config.flags.LPTIM2Used_ForRCC) or (LPUART1CLKSOURCE_LSE and config.flags.LPUARTUsed_ForRCC) or (USART16910CLKSOURCE_LSE and (config.flags.USART1Used_ForRCC or config.flags.USART6Used_ForRCC or config.flags.USART10Used_ForRCC or config.flags.UART9Used_ForRCC)) or (USART2CLKSOURCE_LSE and (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC)) or (LPTIM345CLKSOURCE_LSE and (config.flags.LPTIM3Used_ForRCC))) {
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

            const PrescalerValue: ?PrescalerList = blk: {
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    if (config.extra_config.Prescaler) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Prescaler", " !CRSActivatedSourceLSE & !CRSActivatedSourceUSB & !CRSActivatedSourceGPIO", "" });
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
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    break :blk null;
                } else if (config.flags.CRSActivatedSourceGPIO) {
                    break :blk .RCC_CRS_SYNC_SOURCE_PIN;
                } else if (config.flags.CRSActivatedSourceLSE) {
                    break :blk .RCC_CRS_SYNC_SOURCE_LSE;
                } else if (config.flags.CRSActivatedSourceUSB and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB2;
                } else if (config.flags.CRSActivatedSourceUSB and (config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB1;
                }
                break :blk .RCC_CRS_SYNC_SOURCE_USB1;
            };

            const PolarityValue: ?PolarityList = blk: {
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    if (config.extra_config.Polarity) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Polarity", " !CRSActivatedSourceLSE & !CRSActivatedSourceUSB & !CRSActivatedSourceGPIO", "" });
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
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    if (config.extra_config.ReloadValueType) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ReloadValueType", " !CRSActivatedSourceLSE & !CRSActivatedSourceUSB & !CRSActivatedSourceGPIO", "" });
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
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    if (config.extra_config.ReloadValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ReloadValue", " !CRSActivatedSourceLSE & !CRSActivatedSourceUSB & !CRSActivatedSourceGPIO", "" });
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
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    if (config.extra_config.Fsync) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "Fsync", " !CRSActivatedSourceLSE & !CRSActivatedSourceUSB & !CRSActivatedSourceGPIO", "" });
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
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    if (config.extra_config.ErrorLimitValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "ErrorLimitValue", "!CRSActivatedSourceLSE & !CRSActivatedSourceUSB & !CRSActivatedSourceGPIO", "" });
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
                if (!config.flags.CRSActivatedSourceLSE and !config.flags.CRSActivatedSourceUSB and !config.flags.CRSActivatedSourceGPIO) {
                    if (config.extra_config.HSI48CalibrationValue) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "HSI48CalibrationValue", " !CRSActivatedSourceLSE & !CRSActivatedSourceUSB & !CRSActivatedSourceGPIO", "" });
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

            const PLLUsedValue: u1 = blk: {
                if (TRACECLKSOURCE_PLLCLK and (check_MCU("SWD") or check_MCU("JTAG")) or (SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config) or (SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLQ1 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLQ1 and config.flags.SAI2_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL1Q and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and ((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC)) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2UsedValue: u1 = blk: {
                if (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLP2 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLP2 and config.flags.SAI2_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC))) or (USART16910CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC or config.flags.UART9Used_ForRCC or config.flags.USART10Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and (config.flags.SPI6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)) or (SPDIFCLKSOURCE_PLL2R and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL2R and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3UsedValue: u1 = blk: {
                if (config.flags.LTDCUsed_ForRCC or (SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLP3 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLP3 and config.flags.SAI2_SAIAUsed_ForRCC) or (USART16910CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC or config.flags.UART9Used_ForRCC or config.flags.USART10Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and (config.flags.SPI6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and ((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC)) or (I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const cKPerUsedValue: u1 = blk: {
                if ((QSPICLKSOURCE_PER and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PER and config.flags.FMCUsed_ForRCC) or (SAI1CLKSOURCE_PER and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (LPTIM1CLKSOURCE_PER and config.flags.LPTIM1Used_ForRCC) or (SAI2BCLKSOURCE_PER and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PER and config.flags.SAI2_SAIAUsed_ForRCC) or (ADCCLKSOURCE_PER and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC))) or (LPTIM2CLKSOURCE_PER and config.flags.LPTIM2Used_ForRCC) or (SPI123CLKSOURCE_PER and (config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (LPTIM345CLKSOURCE_PER and (config.flags.LPTIM3Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const CSIUsedValue: u1 = blk: {
                if (TRACECLKSOURCE_CSI and (check_MCU("SWD") or check_MCU("JTAG")) or (config.flags.MCO2Config and MCO2SOURCE_CSI) or (PLLSOURCE_CSI and ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=") or check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) or (config.flags.MCO2Config and MCO2SOURCE_PLL2PCLK))) or (PERSOURCE_CSI and (check_ref(@TypeOf(cKPerUsedValue), cKPerUsedValue, 1, .@"="))) or (SYSCLKSOURCE_CSI) or (I2C4CLKSOURCE_CSI and config.flags.I2C4Used_ForRCC) or (I2C123CLKSOURCE_CSI and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (USART16910CLKSOURCE_CSI and (config.flags.USART1Used_ForRCC or config.flags.USART6Used_ForRCC or config.flags.USART10Used_ForRCC or config.flags.UART9Used_ForRCC)) or (USART2CLKSOURCE_CSI and (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC)) or (LPUART1CLKSOURCE_CSI and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_CSI and (config.flags.SPI6Used_ForRCC or config.flags.I2S6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_CSI and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (CECCLKSOURCE_CSI and config.flags.CECUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const CSICalibrationValueValue: u32 = blk: {
                if (check_ref(@TypeOf(CSIUsedValue), CSIUsedValue, 1, .@"=")) {
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
                                "CSIUsed=1",
                                "CSI used",
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
                                "CSIUsed=1",
                                "CSI used",
                                31,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 16;
                }
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

            const HSIUsedValue: u1 = blk: {
                if (TRACECLKSOURCE_HSI and (check_MCU("SWD") or check_MCU("JTAG")) or (config.flags.MCO1Config and MCO1SOURCE_HSI) or (PLLSOURCE_HSI and ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=") or check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) or (config.flags.MCO2Config and MCO2SOURCE_PLL2PCLK))) or (PERSOURCE_HSI and (check_ref(@TypeOf(cKPerUsedValue), cKPerUsedValue, 1, .@"="))) or (SYSCLKSOURCE_HSI) or (I2C4CLKSOURCE_HSI and config.flags.I2C4Used_ForRCC) or (I2C123CLKSOURCE_HSI and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (SPDIFCLKSOURCE_HSI and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (SWPCLKSOURCE_HSI and config.flags.SWPMI1Used_ForRCC) or (USART16910CLKSOURCE_HSI and (config.flags.USART1Used_ForRCC or config.flags.USART6Used_ForRCC or config.flags.USART10Used_ForRCC or config.flags.UART9Used_ForRCC)) or (USART2CLKSOURCE_HSI and (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC)) or (LPUART1CLKSOURCE_HSI and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_HSI and (config.flags.SPI6Used_ForRCC or config.flags.I2S6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_HSI and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC))) {
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

            const LSIEnableValue: LSIEnableList = blk: {
                break :blk .true;
            };

            const ExtClockEnableValue: ExtClockEnableList = blk: {
                if (config.flags.AudioClockConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCO1OutPutEnableValue: MCO1OutPutEnableList = blk: {
                if (config.flags.MCO1Config) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCO2OutPutEnableValue: MCO2OutPutEnableList = blk: {
                if (config.flags.MCO2Config) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const TraceEnableValue: TraceEnableList = blk: {
                break :blk .auto;
            };

            const cKPerEnableValue: cKPerEnableList = blk: {
                if (((config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (config.flags.FMCUsed_ForRCC) or (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) or (config.flags.LPTIM1Used_ForRCC) or (config.flags.SAI2_SAIBUsed_ForRCC) or (config.flags.SAI2_SAIAUsed_ForRCC) or (((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC))) or (config.flags.LPTIM2Used_ForRCC) or (config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC or config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) or (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC) or (config.flags.LPTIM3Used_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")) or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1"))) {
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

            const SDMMC1EnableValue: SDMMC1EnableList = blk: {
                if (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI2AEnableValue: SAI2AEnableList = blk: {
                if (config.flags.SAI2_SAIAUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI2BEnableValue: SAI2BEnableList = blk: {
                if (config.flags.SAI2_SAIBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if ((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI123EnableValue: SPI123EnableList = blk: {
                if (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPDIFEnableValue: SPDIFEnableList = blk: {
                if (config.flags.SPDIFRXUsed_ForRCC or config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FDCANEnableValue: FDCANEnableList = blk: {
                if (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FMCEnableValue: FMCEnableList = blk: {
                if (config.flags.FMCUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const OCSPIEnableValue: OCSPIEnableList = blk: {
                if (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const TraceEnablePllValue: TraceEnablePllList = blk: {
                if (check_MCU("SWD") or check_MCU("JTAG")) {
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

            const LPTIM345EnableValue: LPTIM345EnableList = blk: {
                if (config.flags.LPTIM3Used_ForRCC) {
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

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIM1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI6EnableValue: SPI6EnableList = blk: {
                if ((config.flags.SPI6Used_ForRCC or config.flags.I2S6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2"))) or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2"))) {
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

            const USART234578EnableValue: USART234578EnableList = blk: {
                if (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART16910EnableValue: USART16910EnableList = blk: {
                if (config.flags.USART1Used_ForRCC or config.flags.USART6Used_ForRCC or config.flags.USART10Used_ForRCC or config.flags.UART9Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI45EnableValue: SPI45EnableList = blk: {
                if (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LTDCEnableValue: LTDCEnableList = blk: {
                if (config.flags.LTDCUsed_ForRCC) {
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

            const I2C123EnableValue: I2C123EnableList = blk: {
                if (config.flags.I2C1Used_ForRCC or config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            const DAC1EnableValue: DAC1EnableList = blk: {
                if (check_MCU("DAC1")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const DAC2EnableValue: DAC2EnableList = blk: {
                if (check_MCU("DAC2")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableDFSDMAudioValue: EnableDFSDMAudioList = blk: {
                if (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SWPEnableValue: SWPEnableList = blk: {
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

            const DFSDM2EnableValue: DFSDM2EnableList = blk: {
                if (config.flags.DFSDM2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI6OutputEnableValue: SPI6OutputEnableList = blk: {
                if (config.flags.SPI6Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableDFSDM2AudioValue: EnableDFSDM2AudioList = blk: {
                if (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const CECEnableValue: CECEnableList = blk: {
                if (config.flags.CECUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const PLL1QUsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or (SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLQ1 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLQ1 and config.flags.SAI2_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL1Q and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and ((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC)) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1PUsedValue: u1 = blk: {
                if ((SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1RUsedValue: u1 = blk: {
                if (TRACECLKSOURCE_PLLCLK and (check_MCU("SWD") or check_MCU("JTAG"))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2PUsedValue: u1 = blk: {
                if (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLP2 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLP2 and config.flags.SAI2_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2QUsedValue: u1 = blk: {
                if ((USART16910CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC or config.flags.UART9Used_ForRCC or config.flags.USART10Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and (config.flags.SPI6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2RUsedValue: u1 = blk: {
                if ((SPDIFCLKSOURCE_PLL2R and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL2R and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3PUsedValue: u1 = blk: {
                if ((SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLP3 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLP3 and config.flags.SAI2_SAIAUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3QUsedValue: u1 = blk: {
                if ((USART16910CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC or config.flags.UART9Used_ForRCC or config.flags.USART10Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and (config.flags.SPI6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and ((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3RUsedValue: u1 = blk: {
                if (config.flags.LTDCUsed_ForRCC or (I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if ((config.flags.RTCUsed_ForRCC) and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
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

            const MCO2I2SEnableValue: MCO2I2SEnableList = blk: {
                if ((config.flags.MCO2Config)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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
                if ((USBCLKSOURCE_RC48 and ((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC)) or (MCO1SOURCE_RC48 and config.flags.MCO1Config) or (RNGCLKSOURCE_RC48 and config.flags.RNGUsed_ForRCC) or config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnableCSSLSEValue: EnableCSSLSEList = blk: {
                if ((((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"="))) and (config.flags.RTCUsed_ForRCC))) {
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
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE HSIDiv ======
            HSIDiv.nodetype = .div;
            HSIDiv.value = try HSIDivValue.get();
            HSIDiv.parents = &.{&HSIRC};

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE LSIRC ======
            if (check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"=")) {
                LSIRC.nodetype = .source;
                LSIRC.value = LSI_VALUEValue;
            }
            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE CSIRC ======
            CSIRC.nodetype = .source;
            CSIRC.value = CSI_VALUEValue;

            // ======= NODE RC48 ======
            RC48.nodetype = .source;
            RC48.value = HSI48_VALUEValue;

            // ======= NODE I2S_CKIN ======
            if (check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"=")) {
                I2S_CKIN.nodetype = .source;
                I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;
            }
            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_SYSCLKSOURCE_CSI => &.{&CSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&DIVP1},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE MCO1Mult ======
            if (check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=")) {
                MCO1Mult.nodetype = .multi;
                MCO1Mult.parents = switch (RCC_MCO1SourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIDiv},
                    .RCC_MCO1SOURCE_HSI48 => &.{&RC48},
                    .RCC_MCO1SOURCE_PLL1QCLK => &.{&DIVQ1},
                };
            }
            // ======= NODE MCO1Div ======
            if (check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=")) {
                MCO1Div.nodetype = .div;
                MCO1Div.value = try RCC_MCODiv1Value.get();
                MCO1Div.parents = &.{&MCO1Mult};
            }
            // ======= NODE MCO1Pin ======
            if (check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=")) {
                MCO1Pin.nodetype = .output;
                MCO1Pin.parents = &.{&MCO1Div};
            }
            // ======= NODE MCO2Mult ======
            if (check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=")) {
                MCO2Mult.nodetype = .multi;
                MCO2Mult.parents = switch (RCC_MCO2SourceValue) {
                    .RCC_MCO2SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO2SOURCE_PLL2PCLK => &.{&DIVP2},
                    .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO2SOURCE_PLLCLK => &.{&DIVP1},
                    .RCC_MCO2SOURCE_CSICLK => &.{&CSIRC},
                    .RCC_MCO2SOURCE_LSICLK => &.{&LSIRC},
                };
            }
            // ======= NODE MCO2Div ======
            if (check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=")) {
                MCO2Div.nodetype = .div;
                MCO2Div.value = try RCC_MCODiv2Value.get();
                MCO2Div.parents = &.{&MCO2Mult};
            }
            // ======= NODE MCO2Pin ======
            if (check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=")) {
                MCO2Pin.nodetype = .output;
                MCO2Pin.parents = &.{&MCO2Div};
            }
            // ======= NODE traceClkSource ======
            if (true) {
                traceClkSource.nodetype = .multi;
                traceClkSource.parents = switch (traceClkSourceVirtualValue) {
                    .RCC_TRACECLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_TRACECLKSOURCE_CSI => &.{&CSIRC},
                    .RCC_TRACECLKSOURCE_HSE => &.{&HSEOSC},
                    .RCC_TRACECLKSOURCE_PLLCLK => &.{&DIVR1},
                };
            }
            // ======= NODE TraceCLKOutput ======
            if (true) {
                TraceCLKOutput.nodetype = .output;
                TraceCLKOutput.parents = &.{&traceClkSource};
            }
            // ======= NODE CDCPRE ======
            CDCPRE.nodetype = .div;
            CDCPRE.value = try CDCPREValue.get();
            CDCPRE.parents = &.{&SysCLKOutput};

            // ======= NODE CDCPREOutput ======
            CDCPREOutput.nodetype = .output;
            CDCPREOutput.parents = &.{&CDCPRE};

            // ======= NODE CpuClockOutput ======
            CpuClockOutput.nodetype = .output;
            CpuClockOutput.parents = &.{&CDCPREOutput};

            // ======= NODE CortexPrescaler ======
            CortexPrescaler.nodetype = .div;
            CortexPrescaler.value = try Cortex_DivValue.get();
            CortexPrescaler.parents = &.{&CDCPREOutput};

            // ======= NODE CortexSysOutput ======
            CortexSysOutput.nodetype = .output;
            CortexSysOutput.parents = &.{&CortexPrescaler};

            // ======= NODE HPRE ======
            HPRE.nodetype = .div;
            HPRE.value = try HPREValue.get();
            HPRE.parents = &.{&CDCPREOutput};

            // ======= NODE AHBOutput ======
            AHBOutput.nodetype = .output;
            AHBOutput.parents = &.{&HPRE};

            // ======= NODE AXIClockOutput ======
            AXIClockOutput.nodetype = .output;
            AXIClockOutput.parents = &.{&AHBOutput};

            // ======= NODE HCLK3Output ======
            HCLK3Output.nodetype = .output;
            HCLK3Output.parents = &.{&AHBOutput};

            // ======= NODE CDPPRE ======
            CDPPRE.nodetype = .div;
            CDPPRE.value = try CDPPREValue.get();
            CDPPRE.parents = &.{&AHBOutput};

            // ======= NODE APB3Output ======
            APB3Output.nodetype = .output;
            APB3Output.parents = &.{&CDPPRE};

            // ======= NODE CDPPRE1 ======
            CDPPRE1.nodetype = .div;
            CDPPRE1.value = try CDPPRE1Value.get();
            CDPPRE1.parents = &.{&AHBOutput};

            // ======= NODE Tim1Mul ======
            Tim1Mul.nodetype = .mul;
            Tim1Mul.value = @floatFromInt(Tim1MulValue);
            Tim1Mul.parents = &.{&CDPPRE1};

            // ======= NODE Tim1Output ======
            Tim1Output.nodetype = .output;
            Tim1Output.parents = &.{&Tim1Mul};

            // ======= NODE AHB12Output ======
            AHB12Output.nodetype = .output;
            AHB12Output.parents = &.{&AHBOutput};

            // ======= NODE APB1Output ======
            APB1Output.nodetype = .output;
            APB1Output.parents = &.{&CDPPRE1};

            // ======= NODE CDPPRE2 ======
            CDPPRE2.nodetype = .div;
            CDPPRE2.value = try CDPPRE2Value.get();
            CDPPRE2.parents = &.{&AHBOutput};

            // ======= NODE APB2Output ======
            APB2Output.nodetype = .output;
            APB2Output.parents = &.{&CDPPRE2};

            // ======= NODE Tim2Mul ======
            Tim2Mul.nodetype = .mul;
            Tim2Mul.value = @floatFromInt(Tim2MulValue);
            Tim2Mul.parents = &.{&CDPPRE2};

            // ======= NODE Tim2Output ======
            Tim2Output.nodetype = .output;
            Tim2Output.parents = &.{&Tim2Mul};

            // ======= NODE AHB4Output ======
            AHB4Output.nodetype = .output;
            AHB4Output.parents = &.{&AHBOutput};

            // ======= NODE SRDPPRE ======
            SRDPPRE.nodetype = .div;
            SRDPPRE.value = try SRDPPREValue.get();
            SRDPPRE.parents = &.{&AHBOutput};

            // ======= NODE APB4Output ======
            APB4Output.nodetype = .output;
            APB4Output.parents = &.{&SRDPPRE};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI => &.{&HSIDiv},
                .RCC_PLLSOURCE_CSI => &.{&CSIRC},
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE CKPERSource ======
            if (check_ref(@TypeOf(cKPerEnableValue), cKPerEnableValue, .true, .@"=")) {
                CKPERSource.nodetype = .multi;
                CKPERSource.parents = switch (CKPERSourceSelectionValue) {
                    .RCC_CLKPSOURCE_HSI => &.{&HSIDiv},
                    .RCC_CLKPSOURCE_CSI => &.{&CSIRC},
                    .RCC_CLKPSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE CKPERoutput ======
            if (check_ref(@TypeOf(cKPerEnableValue), cKPerEnableValue, .true, .@"=")) {
                CKPERoutput.nodetype = .output;
                CKPERoutput.parents = &.{&CKPERSource};
            }
            // ======= NODE DIVM1 ======
            DIVM1.nodetype = .div;
            DIVM1.value = @floatFromInt(DIVM1Value);
            DIVM1.parents = &.{&PLLSource};

            // ======= NODE DIVM2 ======
            DIVM2.nodetype = .div;
            DIVM2.value = @floatFromInt(DIVM2Value);
            DIVM2.parents = &.{&PLLSource};

            // ======= NODE DIVM3 ======
            DIVM3.nodetype = .div;
            DIVM3.value = @floatFromInt(DIVM3Value);
            DIVM3.parents = &.{&PLLSource};

            // ======= NODE DIVN1 ======
            DIVN1.nodetype = .mulfrac;
            DIVN1.value = @floatFromInt(DIVN1Value);
            DIVN1.parents = &.{ &DIVM1, &PLLFRACN };

            // ======= NODE PLLFRACN ======
            PLLFRACN.nodetype = .source;
            PLLFRACN.value = @floatFromInt(PLLFRACNValue);

            // ======= NODE DIVP1 ======
            DIVP1.nodetype = .div;
            DIVP1.value = try DIVP1Value.get();
            DIVP1.parents = &.{&DIVN1};

            // ======= NODE DIVQ1 ======
            if (check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=") or config.flags.RBGEnable or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPIEnableValue), OCSPIEnableValue, .true, .@"=") or false) {
                DIVQ1.nodetype = .div;
                DIVQ1.value = @floatFromInt(DIVQ1Value);
                DIVQ1.parents = &.{&DIVN1};
            }
            // ======= NODE DIVQ1output ======
            if (check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=") or config.flags.RBGEnable or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPIEnableValue), OCSPIEnableValue, .true, .@"=") or false) {
                DIVQ1output.nodetype = .output;
                DIVQ1output.parents = &.{&DIVQ1};
            }
            // ======= NODE DIVR1 ======
            if (check_ref(@TypeOf(TraceEnablePllValue), TraceEnablePllValue, .true, .@"=")) {
                DIVR1.nodetype = .div;
                DIVR1.value = @floatFromInt(DIVR1Value);
                DIVR1.parents = &.{&DIVN1};
            }
            // ======= NODE DIVR1output ======
            if (check_ref(@TypeOf(TraceEnablePllValue), TraceEnablePllValue, .true, .@"=")) {
                DIVR1output.nodetype = .output;
                DIVR1output.parents = &.{&DIVR1};
            }
            // ======= NODE DIVN2 ======
            DIVN2.nodetype = .mulfrac;
            DIVN2.value = @floatFromInt(DIVN2Value);
            DIVN2.parents = &.{ &DIVM2, &PLL2FRACN };

            // ======= NODE PLL2FRACN ======
            PLL2FRACN.nodetype = .source;
            PLL2FRACN.value = @floatFromInt(PLL2FRACNValue);

            // ======= NODE DIVP2 ======
            if (check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=")) {
                DIVP2.nodetype = .div;
                DIVP2.value = @floatFromInt(DIVP2Value);
                DIVP2.parents = &.{&DIVN2};
            }
            // ======= NODE DIVP2output ======
            if (check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=")) {
                DIVP2output.nodetype = .output;
                DIVP2output.parents = &.{&DIVP2};
            }
            // ======= NODE DIVQ2 ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16910EnableValue), USART16910EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=")) {
                DIVQ2.nodetype = .div;
                DIVQ2.value = @floatFromInt(DIVQ2Value);
                DIVQ2.parents = &.{&DIVN2};
            }
            // ======= NODE DIVQ2output ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16910EnableValue), USART16910EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=")) {
                DIVQ2output.nodetype = .output;
                DIVQ2output.parents = &.{&DIVQ2};
            }
            // ======= NODE DIVR2 ======
            if (check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPIEnableValue), OCSPIEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                DIVR2.nodetype = .div;
                DIVR2.value = @floatFromInt(DIVR2Value);
                DIVR2.parents = &.{&DIVN2};
            }
            // ======= NODE DIVR2output ======
            if (check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPIEnableValue), OCSPIEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                DIVR2output.nodetype = .output;
                DIVR2output.parents = &.{&DIVR2};
            }
            // ======= NODE DIVN3 ======
            DIVN3.nodetype = .mulfrac;
            DIVN3.value = @floatFromInt(DIVN3Value);
            DIVN3.parents = &.{ &DIVM3, &PLL3FRACN };

            // ======= NODE PLL3FRACN ======
            PLL3FRACN.nodetype = .source;
            PLL3FRACN.value = @floatFromInt(PLL3FRACNValue);

            // ======= NODE DIVP3 ======
            if (check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=")) {
                DIVP3.nodetype = .div;
                DIVP3.value = @floatFromInt(DIVP3Value);
                DIVP3.parents = &.{&DIVN3};
            }
            // ======= NODE DIVP3output ======
            if (check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=")) {
                DIVP3output.nodetype = .output;
                DIVP3output.parents = &.{&DIVP3};
            }
            // ======= NODE DIVQ3 ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16910EnableValue), USART16910EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=")) {
                DIVQ3.nodetype = .div;
                DIVQ3.value = @floatFromInt(DIVQ3Value);
                DIVQ3.parents = &.{&DIVN3};
            }
            // ======= NODE DIVQ3output ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16910EnableValue), USART16910EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=")) {
                DIVQ3output.nodetype = .output;
                DIVQ3output.parents = &.{&DIVQ3};
            }
            // ======= NODE DIVR3 ======
            if (check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                DIVR3.nodetype = .div;
                DIVR3.value = @floatFromInt(DIVR3Value);
                DIVR3.parents = &.{&DIVN3};
            }
            // ======= NODE LTDCOutput ======
            if (check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"=")) {
                LTDCOutput.nodetype = .output;
                LTDCOutput.parents = &.{&DIVR3};
            }
            // ======= NODE DIVR3output ======
            if (check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                DIVR3output.nodetype = .output;
                DIVR3output.parents = &.{&DIVR3};
            }
            // ======= NODE HSERTCDevisor ======
            if (check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=")) {
                HSERTCDevisor.nodetype = .div;
                HSERTCDevisor.value = try RCC_RTC_Clock_Source_FROM_HSEValue.get();
                HSERTCDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE RTCClkSource ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RTCClockSelectionValue) {
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
            // ======= NODE IWDGOutput ======
            if (check_ref(@TypeOf(IWDGEnableValue), IWDGEnableValue, .true, .@"=")) {
                IWDGOutput.nodetype = .output;
                IWDGOutput.parents = &.{&LSIRC};
            }
            // ======= NODE DAC1Output ======
            if (check_ref(@TypeOf(DAC1EnableValue), DAC1EnableValue, .true, .@"=")) {
                DAC1Output.nodetype = .output;
                DAC1Output.parents = &.{&LSIRC};
            }
            // ======= NODE DAC2Output ======
            if (check_ref(@TypeOf(DAC2EnableValue), DAC2EnableValue, .true, .@"=")) {
                DAC2Output.nodetype = .output;
                DAC2Output.parents = &.{&LSIRC};
            }
            // ======= NODE SPI123Mult ======
            if (check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=")) {
                SPI123Mult.nodetype = .multi;
                SPI123Mult.parents = switch (SPI123CLockSelectionValue) {
                    .RCC_SPI123CLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_SPI123CLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_SPI123CLKSOURCE_PLL3 => &.{&DIVP3},
                    .RCC_SPI123CLKSOURCE_PIN => &.{&I2S_CKIN},
                    .RCC_SPI123CLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE SPI123output ======
            if (check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=")) {
                SPI123output.nodetype = .output;
                SPI123output.parents = &.{&SPI123Mult};
            }
            // ======= NODE SAI1Mult ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1Mult.nodetype = .multi;
                SAI1Mult.parents = switch (SAI1CLockSelectionValue) {
                    .RCC_SAI1CLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_SAI1CLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_SAI1CLKSOURCE_PLL3 => &.{&DIVP3},
                    .RCC_SAI1CLKSOURCE_PIN => &.{&I2S_CKIN},
                    .RCC_SAI1CLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE DFSDMACLKoutput ======
            if (check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                DFSDMACLKoutput.nodetype = .output;
                DFSDMACLKoutput.parents = &.{&SAI1Mult};
            }
            // ======= NODE SAI1output ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1output.nodetype = .output;
                SAI1output.parents = &.{&SAI1Mult};
            }
            // ======= NODE SAI2BMult ======
            if (check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=")) {
                SAI2BMult.nodetype = .multi;
                SAI2BMult.parents = switch (SAI2BCLockSelectionValue) {
                    .RCC_SAI2BCLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_SAI2BCLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_SAI2BCLKSOURCE_PLL3 => &.{&DIVP3},
                    .RCC_SAI2BCLKSOURCE_PIN => &.{&I2S_CKIN},
                    .RCC_SAI2BCLKSOURCE_CLKP => &.{&CKPERSource},
                    .RCC_SAI2BCLKSOURCE_SPDIF => &.{&SPDIFMult},
                };
            }
            // ======= NODE SAI2Boutput ======
            if (check_ref(@TypeOf(SAI2BEnableValue), SAI2BEnableValue, .true, .@"=")) {
                SAI2Boutput.nodetype = .output;
                SAI2Boutput.parents = &.{&SAI2BMult};
            }
            // ======= NODE SAI2AMult ======
            if (check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=")) {
                SAI2AMult.nodetype = .multi;
                SAI2AMult.parents = switch (SAI2ACLockSelectionValue) {
                    .RCC_SAI2ACLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_SAI2ACLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_SAI2ACLKSOURCE_PLL3 => &.{&DIVP3},
                    .RCC_SAI2ACLKSOURCE_PIN => &.{&I2S_CKIN},
                    .RCC_SAI2ACLKSOURCE_CLKP => &.{&CKPERSource},
                    .RCC_SAI2ACLKSOURCE_SPDIF => &.{&SPDIFMult},
                };
            }
            // ======= NODE SAI2Aoutput ======
            if (check_ref(@TypeOf(SAI2AEnableValue), SAI2AEnableValue, .true, .@"=")) {
                SAI2Aoutput.nodetype = .output;
                SAI2Aoutput.parents = &.{&SAI2AMult};
            }
            // ======= NODE RNGMult ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGMult.nodetype = .multi;
                RNGMult.parents = switch (RNGCLockSelectionValue) {
                    .RCC_RNGCLKSOURCE_HSI48 => &.{&RC48},
                    .RCC_RNGCLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_RNGCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RNGCLKSOURCE_LSI => &.{&LSIRC},
                };
            }
            // ======= NODE RNGoutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGoutput.nodetype = .output;
                RNGoutput.parents = &.{&RNGMult};
            }
            // ======= NODE I2C123Mult ======
            if (check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"=")) {
                I2C123Mult.nodetype = .multi;
                I2C123Mult.parents = switch (I2C123CLockSelectionValue) {
                    .RCC_I2C123CLKSOURCE_D2PCLK1 => &.{&CDPPRE1},
                    .RCC_I2C123CLKSOURCE_PLL3 => &.{&DIVR3},
                    .RCC_I2C123CLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_I2C123CLKSOURCE_CSI => &.{&CSIRC},
                };
            }
            // ======= NODE I2C123output ======
            if (check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"=")) {
                I2C123output.nodetype = .output;
                I2C123output.parents = &.{&I2C123Mult};
            }
            // ======= NODE I2C4Mult ======
            if (check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=")) {
                I2C4Mult.nodetype = .multi;
                I2C4Mult.parents = switch (I2C4CLockSelectionValue) {
                    .RCC_I2C4CLKSOURCE_D3PCLK1 => &.{&SRDPPRE},
                    .RCC_I2C4CLKSOURCE_PLL3 => &.{&DIVR3},
                    .RCC_I2C4CLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_I2C4CLKSOURCE_CSI => &.{&CSIRC},
                };
            }
            // ======= NODE I2C4output ======
            if (check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=")) {
                I2C4output.nodetype = .output;
                I2C4output.parents = &.{&I2C4Mult};
            }
            // ======= NODE SPDIFMult ======
            if (check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                SPDIFMult.nodetype = .multi;
                SPDIFMult.parents = switch (SPDIFCLockSelectionValue) {
                    .RCC_SPDIFRXCLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_SPDIFRXCLKSOURCE_PLL2 => &.{&DIVR2},
                    .RCC_SPDIFRXCLKSOURCE_PLL3 => &.{&DIVR3},
                    .RCC_SPDIFRXCLKSOURCE_HSI => &.{&HSIDiv},
                };
            }
            // ======= NODE SPDIFoutput ======
            if (check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                SPDIFoutput.nodetype = .output;
                SPDIFoutput.parents = &.{&SPDIFMult};
            }
            // ======= NODE QSPIMult ======
            if (check_ref(@TypeOf(OCSPIEnableValue), OCSPIEnableValue, .true, .@"=")) {
                QSPIMult.nodetype = .multi;
                QSPIMult.parents = switch (QSPICLockSelectionValue) {
                    .RCC_OSPICLKSOURCE_D1HCLK => &.{&HCLK3Output},
                    .RCC_OSPICLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_OSPICLKSOURCE_PLL2 => &.{&DIVR2},
                    .RCC_OSPICLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE QSPIoutput ======
            if (check_ref(@TypeOf(OCSPIEnableValue), OCSPIEnableValue, .true, .@"=")) {
                QSPIoutput.nodetype = .output;
                QSPIoutput.parents = &.{&QSPIMult};
            }
            // ======= NODE FMCMult ======
            if (check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=")) {
                FMCMult.nodetype = .multi;
                FMCMult.parents = switch (FMCCLockSelectionValue) {
                    .RCC_FMCCLKSOURCE_D1HCLK => &.{&HCLK3Output},
                    .RCC_FMCCLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_FMCCLKSOURCE_PLL2 => &.{&DIVR2},
                    .RCC_FMCCLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE FMCoutput ======
            if (check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=")) {
                FMCoutput.nodetype = .output;
                FMCoutput.parents = &.{&FMCMult};
            }
            // ======= NODE SWPMult ======
            if (check_ref(@TypeOf(SWPEnableValue), SWPEnableValue, .true, .@"=")) {
                SWPMult.nodetype = .multi;
                SWPMult.parents = switch (SWPCLockSelectionValue) {
                    .RCC_SWPMI1CLKSOURCE_D2PCLK1 => &.{&CDPPRE1},
                    .RCC_SWPMI1CLKSOURCE_HSI => &.{&HSIDiv},
                };
            }
            // ======= NODE SWPoutput ======
            if (check_ref(@TypeOf(SWPEnableValue), SWPEnableValue, .true, .@"=")) {
                SWPoutput.nodetype = .output;
                SWPoutput.parents = &.{&SWPMult};
            }
            // ======= NODE SDMMCMult ======
            if (check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=")) {
                SDMMCMult.nodetype = .multi;
                SDMMCMult.parents = switch (SDMMC1CLockSelectionValue) {
                    .RCC_SDMMCCLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_SDMMCCLKSOURCE_PLL2 => &.{&DIVR2},
                };
            }
            // ======= NODE SDMMCoutput ======
            if (check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=")) {
                SDMMCoutput.nodetype = .output;
                SDMMCoutput.parents = &.{&SDMMCMult};
            }
            // ======= NODE DFSDMMult ======
            if (check_ref(@TypeOf(DFSDMEnableValue), DFSDMEnableValue, .true, .@"=")) {
                DFSDMMult.nodetype = .multi;
                DFSDMMult.parents = switch (DFSDMCLockSelectionValue) {
                    .RCC_DFSDM1CLKSOURCE_D2PCLK1 => &.{&CDPPRE2},
                    .RCC_DFSDM1CLKSOURCE_SYS => &.{&SysCLKOutput},
                };
            }
            // ======= NODE DFSDMoutput ======
            if (check_ref(@TypeOf(DFSDMEnableValue), DFSDMEnableValue, .true, .@"=")) {
                DFSDMoutput.nodetype = .output;
                DFSDMoutput.parents = &.{&DFSDMMult};
            }
            // ======= NODE DFSDM2Mult ======
            if (check_ref(@TypeOf(DFSDM2EnableValue), DFSDM2EnableValue, .true, .@"=")) {
                DFSDM2Mult.nodetype = .multi;
                DFSDM2Mult.parents = switch (DFSDM2CLockSelectionValue) {
                    .RCC_DFSDM2CLKSOURCE_SRDPCLK1 => &.{&SRDPPRE},
                    .RCC_DFSDM2CLKSOURCE_SYS => &.{&SysCLKOutput},
                };
            }
            // ======= NODE DFSDM2output ======
            if (check_ref(@TypeOf(DFSDM2EnableValue), DFSDM2EnableValue, .true, .@"=")) {
                DFSDM2output.nodetype = .output;
                DFSDM2output.parents = &.{&DFSDM2Mult};
            }
            // ======= NODE USART16Mult ======
            if (check_ref(@TypeOf(USART16910EnableValue), USART16910EnableValue, .true, .@"=")) {
                USART16Mult.nodetype = .multi;
                USART16Mult.parents = switch (USART16CLockSelectionValue) {
                    .RCC_USART16910CLKSOURCE_D2PCLK2 => &.{&CDPPRE2},
                    .RCC_USART16910CLKSOURCE_PLL2 => &.{&DIVQ2},
                    .RCC_USART16910CLKSOURCE_PLL3 => &.{&DIVQ3},
                    .RCC_USART16910CLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_USART16910CLKSOURCE_CSI => &.{&CSIRC},
                    .RCC_USART16910CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART16output ======
            if (check_ref(@TypeOf(USART16910EnableValue), USART16910EnableValue, .true, .@"=")) {
                USART16output.nodetype = .output;
                USART16output.parents = &.{&USART16Mult};
            }
            // ======= NODE USART234578Mult ======
            if (check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=")) {
                USART234578Mult.nodetype = .multi;
                USART234578Mult.parents = switch (USART234578CLockSelectionValue) {
                    .RCC_USART234578CLKSOURCE_D2PCLK1 => &.{&CDPPRE1},
                    .RCC_USART234578CLKSOURCE_PLL2 => &.{&DIVQ2},
                    .RCC_USART234578CLKSOURCE_PLL3 => &.{&DIVQ3},
                    .RCC_USART234578CLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_USART234578CLKSOURCE_CSI => &.{&CSIRC},
                    .RCC_USART234578CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART234578output ======
            if (check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=")) {
                USART234578output.nodetype = .output;
                USART234578output.parents = &.{&USART234578Mult};
            }
            // ======= NODE LPUART1Mult ======
            if (check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=")) {
                LPUART1Mult.nodetype = .multi;
                LPUART1Mult.parents = switch (LPUART1CLockSelectionValue) {
                    .RCC_LPUART1CLKSOURCE_D3PCLK1 => &.{&CDPPRE},
                    .RCC_LPUART1CLKSOURCE_PLL2 => &.{&DIVQ2},
                    .RCC_LPUART1CLKSOURCE_PLL3 => &.{&DIVQ3},
                    .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_LPUART1CLKSOURCE_CSI => &.{&CSIRC},
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
                    .RCC_LPTIM1CLKSOURCE_D2PCLK1 => &.{&CDPPRE1},
                    .RCC_LPTIM1CLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_LPTIM1CLKSOURCE_PLL3 => &.{&DIVR3},
                    .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM1CLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE LPTIM1output ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1output.nodetype = .output;
                LPTIM1output.parents = &.{&LPTIM1Mult};
            }
            // ======= NODE LPTIM345Mult ======
            if (check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=")) {
                LPTIM345Mult.nodetype = .multi;
                LPTIM345Mult.parents = switch (LPTIM345CLockSelectionValue) {
                    .RCC_LPTIM3CLKSOURCE_D3PCLK1 => &.{&SRDPPRE},
                    .RCC_LPTIM3CLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_LPTIM3CLKSOURCE_PLL3 => &.{&DIVR3},
                    .RCC_LPTIM3CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_LPTIM3CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM3CLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE LPTIM345output ======
            if (check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=")) {
                LPTIM345output.nodetype = .output;
                LPTIM345output.parents = &.{&LPTIM345Mult};
            }
            // ======= NODE LPTIM2Mult ======
            if (check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=")) {
                LPTIM2Mult.nodetype = .multi;
                LPTIM2Mult.parents = switch (LPTIM2CLockSelectionValue) {
                    .RCC_LPTIM2CLKSOURCE_D3PCLK1 => &.{&SRDPPRE},
                    .RCC_LPTIM2CLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_LPTIM2CLKSOURCE_PLL3 => &.{&DIVR3},
                    .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM2CLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE LPTIM2output ======
            if (check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=")) {
                LPTIM2output.nodetype = .output;
                LPTIM2output.parents = &.{&LPTIM2Mult};
            }
            // ======= NODE SPI6Mult ======
            if (check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=")) {
                SPI6Mult.nodetype = .multi;
                SPI6Mult.parents = switch (SPI6CLockSelectionValue) {
                    .RCC_SPI6CLKSOURCE_D3PCLK1 => &.{&SRDPPRE},
                    .RCC_SPI6CLKSOURCE_PLL2 => &.{&DIVQ2},
                    .RCC_SPI6CLKSOURCE_PLL3 => &.{&DIVQ3},
                    .RCC_SPI6CLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_SPI6CLKSOURCE_CSI => &.{&CSIRC},
                    .RCC_SPI6CLKSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE SPI6output ======
            if (check_ref(@TypeOf(SPI6OutputEnableValue), SPI6OutputEnableValue, .true, .@"=")) {
                SPI6output.nodetype = .output;
                SPI6output.parents = &.{&SPI6Mult};
            }
            // ======= NODE DFSDM2ACLKoutput ======
            if (check_ref(@TypeOf(EnableDFSDM2AudioValue), EnableDFSDM2AudioValue, .true, .@"=")) {
                DFSDM2ACLKoutput.nodetype = .output;
                DFSDM2ACLKoutput.parents = &.{&SPI6Mult};
            }
            // ======= NODE SPI45Mult ======
            if (check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=")) {
                SPI45Mult.nodetype = .multi;
                SPI45Mult.parents = switch (Spi45ClockSelectionValue) {
                    .RCC_SPI45CLKSOURCE_D2PCLK1 => &.{&CDPPRE1},
                    .RCC_SPI45CLKSOURCE_PLL2 => &.{&DIVQ2},
                    .RCC_SPI45CLKSOURCE_PLL3 => &.{&DIVQ3},
                    .RCC_SPI45CLKSOURCE_HSI => &.{&HSIDiv},
                    .RCC_SPI45CLKSOURCE_CSI => &.{&CSIRC},
                    .RCC_SPI45CLKSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE SPI45output ======
            if (check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=")) {
                SPI45output.nodetype = .output;
                SPI45output.parents = &.{&SPI45Mult};
            }
            // ======= NODE USBMult ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                USBMult.nodetype = .multi;
                USBMult.parents = switch (USBCLockSelectionValue) {
                    .RCC_USBCLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_USBCLKSOURCE_PLL3 => &.{&DIVQ3},
                    .RCC_USBCLKSOURCE_HSI48 => &.{&RC48},
                };
            }
            // ======= NODE USBoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                USBoutput.nodetype = .output;
                USBoutput.parents = &.{&USBMult};
            }
            // ======= NODE FDCANMult ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=")) {
                FDCANMult.nodetype = .multi;
                FDCANMult.parents = switch (FDCANCLockSelectionValue) {
                    .RCC_FDCANCLKSOURCE_HSE => &.{&HSEOSC},
                    .RCC_FDCANCLKSOURCE_PLL => &.{&DIVQ1},
                    .RCC_FDCANCLKSOURCE_PLL2 => &.{&DIVQ2},
                };
            }
            // ======= NODE FDCANoutput ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=")) {
                FDCANoutput.nodetype = .output;
                FDCANoutput.parents = &.{&FDCANMult};
            }
            // ======= NODE ADCMult ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                ADCMult.nodetype = .multi;
                ADCMult.parents = switch (ADCCLockSelectionValue) {
                    .RCC_ADCCLKSOURCE_PLL2 => &.{&DIVP2},
                    .RCC_ADCCLKSOURCE_PLL3 => &.{&DIVR3},
                    .RCC_ADCCLKSOURCE_CLKP => &.{&CKPERSource},
                };
            }
            // ======= NODE ADCoutput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=")) {
                ADCoutput.nodetype = .output;
                ADCoutput.parents = &.{&ADCMult};
            }
            // ======= NODE CECMult ======
            if (check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"=")) {
                CECMult.nodetype = .multi;
                CECMult.parents = switch (CECCLockSelectionValue) {
                    .RCC_CECCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_CECCLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_CECCLKSOURCE_CSI => &.{&CSIRC},
                };
            }
            // ======= NODE CECoutput ======
            if (check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"=")) {
                CECoutput.nodetype = .output;
                CECoutput.parents = &.{&CECMult};
            }
            // ======= NODE VCOInput ======
            VCOInput.nodetype = .output;
            VCOInput.parents = &.{&DIVM1};

            // ======= NODE VCO2Input ======
            VCO2Input.nodetype = .output;
            VCO2Input.parents = &.{&DIVM2};

            // ======= NODE VCO3Input ======
            VCO3Input.nodetype = .output;
            VCO3Input.parents = &.{&DIVM3};

            // ======= NODE VCO1Output ======
            VCO1Output.nodetype = .output;
            VCO1Output.parents = &.{&DIVN1};

            // ======= NODE PLL1CLK ======
            PLL1CLK.nodetype = .output;
            PLL1CLK.parents = &.{&DIVP1};

            // ======= NODE VCO2Output ======
            VCO2Output.nodetype = .output;
            VCO2Output.parents = &.{&DIVN2};

            // ======= NODE VCO3Output ======
            VCO3Output.nodetype = .output;
            VCO3Output.parents = &.{&DIVN3};

            //======== POST REFS ========

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCO1Pin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= MCO2PinFreq_Value ========
            const MCO2PinFreq_ValueValue = MCO2Pin.get_as_ref();
            ignore_value(MCO2PinFreq_ValueValue);

            //======= CpuClockFreq_Value ========
            const CpuClockFreq_ValueValue = CpuClockOutput.get_as_ref();
            ignore_value(CpuClockFreq_ValueValue);

            CpuClockOutput.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if ((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 88000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 88000000, .@"="))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => scale3 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale3 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                    };
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 160000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 160000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 88000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                        }
                    }
                    break :blk user_val orelse {
                        scale2 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE2;
                    };
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 225000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 225000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 160000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 280000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 280000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 225000000, .@">"))) {
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
                } else if ((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 280000000, .@">"))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE0) {
                            const patch_str = if (patch_logs) "Scale3" else "PWR_REGULATOR_VOLTAGE_SCALE0";
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
                                "(CpuClockFreq_Value > 280000000)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    scale0 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE0;
                }
                const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                if (user_val) |val| {
                    switch (val) {
                        .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE3 => scale3 = true,
                    }
                }
                break :blk user_val orelse {
                    scale3 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                };
            };

            //======= TraceFreq_Value ========
            const TraceFreq_ValueValue = TraceCLKOutput.get_as_ref();
            ignore_value(TraceFreq_ValueValue);
            if (scale0) {
                TraceCLKOutput.limit = .{
                    .min = null,
                    .max = 4e7,
                };
            } else if (scale1) {
                TraceCLKOutput.limit = .{
                    .min = null,
                    .max = 3.5e7,
                };
            } else if (scale2) {
                TraceCLKOutput.limit = .{
                    .min = null,
                    .max = 4e7,
                };
            } else if (scale3) {
                TraceCLKOutput.limit = .{
                    .min = null,
                    .max = 2e7,
                };
            }

            //======= CDCPREFreq_Value ========
            const CDCPREFreq_ValueValue = CDCPREOutput.get_as_ref();
            ignore_value(CDCPREFreq_ValueValue);

            CDCPREOutput.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            CortexSysOutput.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            //======= AXIClockFreq_Value ========
            const AXIClockFreq_ValueValue = AXIClockOutput.get_as_ref();
            ignore_value(AXIClockFreq_ValueValue);

            AXIClockOutput.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            //======= HCLK3ClockFreq_Value ========
            const HCLK3ClockFreq_ValueValue = HCLK3Output.get_as_ref();
            ignore_value(HCLK3ClockFreq_ValueValue);

            HCLK3Output.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            //======= APB3Freq_Value ========
            const APB3Freq_ValueValue = APB3Output.get_as_ref();
            ignore_value(APB3Freq_ValueValue);

            APB3Output.limit = .{
                .min = null,
                .max = 1.4e8,
            };

            //======= Tim1OutputFreq_Value ========
            const Tim1OutputFreq_ValueValue = Tim1Output.get_as_ref();
            ignore_value(Tim1OutputFreq_ValueValue);

            //======= AHB12Freq_Value ========
            const AHB12Freq_ValueValue = AHB12Output.get_as_ref();
            ignore_value(AHB12Freq_ValueValue);

            AHB12Output.limit = .{
                .min = null,
                .max = 2.8e8,
            };

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);

            APB1Output.limit = .{
                .min = null,
                .max = 1.4e8,
            };

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 1.4e8,
            };

            //======= Tim2OutputFreq_Value ========
            const Tim2OutputFreq_ValueValue = Tim2Output.get_as_ref();
            ignore_value(Tim2OutputFreq_ValueValue);

            //======= AHB4Freq_Value ========
            const AHB4Freq_ValueValue = AHB4Output.get_as_ref();
            ignore_value(AHB4Freq_ValueValue);

            //======= APB4Freq_Value ========
            const APB4Freq_ValueValue = APB4Output.get_as_ref();
            ignore_value(APB4Freq_ValueValue);

            APB4Output.limit = .{
                .min = null,
                .max = 1.4e8,
            };

            //======= CKPERFreq_Value ========
            const CKPERFreq_ValueValue = CKPERoutput.get_as_ref();
            ignore_value(CKPERFreq_ValueValue);

            //======= DIVQ1Freq_Value ========
            const DIVQ1Freq_ValueValue = DIVQ1output.get_as_ref();
            ignore_value(DIVQ1Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0 and check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= DIVR1Freq_Value ========
            const DIVR1Freq_ValueValue = DIVR1output.get_as_ref();
            ignore_value(DIVR1Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL1RUsedValue), PLL1RUsedValue, 1, .@"=")) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL1RUsedValue), PLL1RUsedValue, 1, .@"=")) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL1RUsedValue), PLL1RUsedValue, 1, .@"=")) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0 and check_ref(@TypeOf(PLL1RUsedValue), PLL1RUsedValue, 1, .@"=")) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= DIVP2Freq_Value ========
            const DIVP2Freq_ValueValue = DIVP2output.get_as_ref();
            ignore_value(DIVP2Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= DIVQ2Freq_Value ========
            const DIVQ2Freq_ValueValue = DIVQ2output.get_as_ref();
            ignore_value(DIVQ2Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= DIVR2Freq_Value ========
            const DIVR2Freq_ValueValue = DIVR2output.get_as_ref();
            ignore_value(DIVR2Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= DIVP3Freq_Value ========
            const DIVP3Freq_ValueValue = DIVP3output.get_as_ref();
            ignore_value(DIVP3Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0 and check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= DIVQ3Freq_Value ========
            const DIVQ3Freq_ValueValue = DIVQ3output.get_as_ref();
            ignore_value(DIVQ3Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0 and check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= LTDCFreq_Value ========
            const LTDCFreq_ValueValue = LTDCOutput.get_as_ref();
            ignore_value(LTDCFreq_ValueValue);
            if (scale0) {
                LTDCOutput.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                LTDCOutput.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                LTDCOutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                LTDCOutput.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= DIVR3Freq_Value ========
            const DIVR3Freq_ValueValue = DIVR3output.get_as_ref();
            ignore_value(DIVR3Freq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL3RUsedValue), PLL3RUsedValue, 1, .@"=")) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL3RUsedValue), PLL3RUsedValue, 1, .@"=")) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL3RUsedValue), PLL3RUsedValue, 1, .@"=")) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            } else if (scale0 and check_ref(@TypeOf(PLL3RUsedValue), PLL3RUsedValue, 1, .@"=")) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= DAC1Freq_Value ========
            const DAC1Freq_ValueValue = DAC1Output.get_as_ref();
            ignore_value(DAC1Freq_ValueValue);
            if (scale0) {
                DAC1Output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                DAC1Output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                DAC1Output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                DAC1Output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= DAC2Freq_Value ========
            const DAC2Freq_ValueValue = DAC2Output.get_as_ref();
            ignore_value(DAC2Freq_ValueValue);
            if (scale0) {
                DAC2Output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                DAC2Output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                DAC2Output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                DAC2Output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= SPI123Freq_Value ========
            const SPI123Freq_ValueValue = SPI123output.get_as_ref();
            ignore_value(SPI123Freq_ValueValue);
            if (scale0) {
                SPI123output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            } else if (scale1) {
                SPI123output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2) {
                SPI123output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3) {
                SPI123output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            }

            //======= DFSDMACLkFreq_Value ========
            const DFSDMACLkFreq_ValueValue = DFSDMACLKoutput.get_as_ref();
            ignore_value(DFSDMACLkFreq_ValueValue);

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);
            if (scale0) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                };
            } else if (scale1) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                };
            } else if (scale2) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            }

            //======= SAI2BFreq_Value ========
            const SAI2BFreq_ValueValue = SAI2Boutput.get_as_ref();
            ignore_value(SAI2BFreq_ValueValue);
            if (scale0) {
                SAI2Boutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                };
            } else if (scale1) {
                SAI2Boutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                };
            } else if (scale2) {
                SAI2Boutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                SAI2Boutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            }

            //======= SAI2AFreq_Value ========
            const SAI2AFreq_ValueValue = SAI2Aoutput.get_as_ref();
            ignore_value(SAI2AFreq_ValueValue);
            if (scale0) {
                SAI2Aoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                };
            } else if (scale1) {
                SAI2Aoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                };
            } else if (scale2) {
                SAI2Aoutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                SAI2Aoutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            }

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);
            if (scale0) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= I2C123Freq_Value ========
            const I2C123Freq_ValueValue = I2C123output.get_as_ref();
            ignore_value(I2C123Freq_ValueValue);
            if (scale0) {
                I2C123output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                I2C123output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                I2C123output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                I2C123output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= I2C4Freq_Value ========
            const I2C4Freq_ValueValue = I2C4output.get_as_ref();
            ignore_value(I2C4Freq_ValueValue);
            if (scale0) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= SPDIFRXFreq_Value ========
            const SPDIFRXFreq_ValueValue = SPDIFoutput.get_as_ref();
            ignore_value(SPDIFRXFreq_ValueValue);
            if (scale0) {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            } else if (scale1) {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2) {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3) {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            }

            //======= QSPIFreq_Value ========
            const QSPIFreq_ValueValue = QSPIoutput.get_as_ref();
            ignore_value(QSPIFreq_ValueValue);
            if (scale0) {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            } else if (scale1) {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2) {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3) {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            }

            //======= FMCFreq_Value ========
            const FMCFreq_ValueValue = FMCoutput.get_as_ref();
            ignore_value(FMCFreq_ValueValue);

            //======= SWPMI1Freq_Value ========
            const SWPMI1Freq_ValueValue = SWPoutput.get_as_ref();
            ignore_value(SWPMI1Freq_ValueValue);

            //======= SDMMCFreq_Value ========
            const SDMMCFreq_ValueValue = SDMMCoutput.get_as_ref();
            ignore_value(SDMMCFreq_ValueValue);
            if (scale0) {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            } else if (scale1) {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2) {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3) {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            }

            //======= DFSDMFreq_Value ========
            const DFSDMFreq_ValueValue = DFSDMoutput.get_as_ref();
            ignore_value(DFSDMFreq_ValueValue);
            if (scale0) {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= DFSDM2Freq_Value ========
            const DFSDM2Freq_ValueValue = DFSDM2output.get_as_ref();
            ignore_value(DFSDM2Freq_ValueValue);
            if (scale0) {
                DFSDM2output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                DFSDM2output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                DFSDM2output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                DFSDM2output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= USART16Freq_Value ========
            const USART16Freq_ValueValue = USART16output.get_as_ref();
            ignore_value(USART16Freq_ValueValue);
            if (scale0) {
                USART16output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            } else if (scale1) {
                USART16output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2) {
                USART16output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3) {
                USART16output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            }

            //======= USART234578Freq_Value ========
            const USART234578Freq_ValueValue = USART234578output.get_as_ref();
            ignore_value(USART234578Freq_ValueValue);
            if (scale0) {
                USART234578output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            } else if (scale1) {
                USART234578output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2) {
                USART234578output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3) {
                USART234578output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            }

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);
            if (scale0) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);
            if (scale0) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= LPTIM345Freq_Value ========
            const LPTIM345Freq_ValueValue = LPTIM345output.get_as_ref();
            ignore_value(LPTIM345Freq_ValueValue);
            if (scale0) {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);
            if (scale0) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= SPI6Freq_Value ========
            const SPI6Freq_ValueValue = SPI6output.get_as_ref();
            ignore_value(SPI6Freq_ValueValue);
            if (scale0) {
                SPI6output.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            } else if (scale1) {
                SPI6output.limit = .{
                    .min = null,
                    .max = 2.25e8,
                };
            } else if (scale2) {
                SPI6output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale3) {
                SPI6output.limit = .{
                    .min = null,
                    .max = 8.8e7,
                };
            }

            //======= DFSDM2ACLkFreq_Value ========
            const DFSDM2ACLkFreq_ValueValue = DFSDM2ACLKoutput.get_as_ref();
            ignore_value(DFSDM2ACLkFreq_ValueValue);

            //======= SPI45Freq_Value ========
            const SPI45Freq_ValueValue = SPI45output.get_as_ref();
            ignore_value(SPI45Freq_ValueValue);

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);

            USBoutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= FDCANFreq_Value ========
            const FDCANFreq_ValueValue = FDCANoutput.get_as_ref();
            ignore_value(FDCANFreq_ValueValue);
            if (scale0) {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 1.4e8,
                };
            } else if (scale1) {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 1.125e8,
                };
            } else if (scale2) {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 8e7,
                };
            } else if (scale3) {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            ADCoutput.limit = .{
                .min = null,
                .max = 5e7,
            };

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECoutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);
            if (scale0) {
                CECoutput.limit = .{
                    .min = null,
                    .max = 6.6e7,
                };
            } else if (scale1) {
                CECoutput.limit = .{
                    .min = null,
                    .max = 6.6e7,
                };
            } else if (scale2) {
                CECoutput.limit = .{
                    .min = null,
                    .max = 6.6e7,
                };
            } else if (scale3) {
                CECoutput.limit = .{
                    .min = null,
                    .max = 4.4e7,
                };
            }

            //======= VCOInput1Freq_Value ========
            const VCOInput1Freq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInput1Freq_ValueValue);
            if ((SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config) or (SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2ACLKSOURCE_PLLQ1 and config.flags.SAI2_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL1Q and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                VCOInput.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                };
            }

            //======= VCOInput2Freq_Value ========
            const VCOInput2Freq_ValueValue = VCO2Input.get_as_ref();
            ignore_value(VCOInput2Freq_ValueValue);
            if (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLP2 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLP2 and config.flags.SAI2_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC))) or (USART16910CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC or config.flags.UART9Used_ForRCC or config.flags.USART10Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and (config.flags.SPI6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)) or (SPDIFCLKSOURCE_PLL2R and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL2R and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                VCO2Input.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                };
            }

            //======= VCOInput3Freq_Value ========
            const VCOInput3Freq_ValueValue = VCO3Input.get_as_ref();
            ignore_value(VCOInput3Freq_ValueValue);
            if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                VCO3Input.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                };
            }

            //======= VCO1OutputFreq_Value ========
            const VCO1OutputFreq_ValueValue = VCO1Output.get_as_ref();
            ignore_value(VCO1OutputFreq_ValueValue);
            if ((((SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config) or (SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLQ1 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLQ1 and config.flags.SAI2_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL1Q and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))))) {
                VCO1Output.limit = .{
                    .min = 1.28e8,
                    .max = 5.6e8,
                };
            }

            //======= DIVP1Freq_Value ========
            const DIVP1Freq_ValueValue = PLL1CLK.get_as_ref();
            ignore_value(DIVP1Freq_ValueValue);
            if (check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) {
                PLL1CLK.limit = .{
                    .min = null,
                    .max = 2.8e8,
                };
            }

            //======= VCO2OutputFreq_Value ========
            const VCO2OutputFreq_ValueValue = VCO2Output.get_as_ref();
            ignore_value(VCO2OutputFreq_ValueValue);
            if ((((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1")))) or (SAI2BCLKSOURCE_PLLP2 and config.flags.SAI2_SAIBUsed_ForRCC) or (SAI2ACLKSOURCE_PLLP2 and config.flags.SAI2_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC))) or (USART16910CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC or config.flags.UART9Used_ForRCC or config.flags.USART10Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and (config.flags.SPI6Used_ForRCC or (config.flags.DFSDM2Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM2")))) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)) or (SPDIFCLKSOURCE_PLL2R and (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC and SAI2ACLKSOURCE_SPDIF) or (config.flags.SAI2_SAIBUsed_ForRCC and SAI2BCLKSOURCE_SPDIF))) or (QSPICLKSOURCE_PLL2R and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)))) {
                VCO2Output.limit = .{
                    .min = 1.28e8,
                    .max = 5.6e8,
                };
            }

            //======= VCO3OutputFreq_Value ========
            const VCO3OutputFreq_ValueValue = VCO3Output.get_as_ref();
            ignore_value(VCO3OutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                VCO3Output.limit = .{
                    .min = 1.28e8,
                    .max = 5.6e8,
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 252000000, .@">")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_6) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "(scale0 &  (HCLKFreq_Value > 252000000))",
                                "",
                                "FLASH_LATENCY_6",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_6;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "(scale0 &  (HCLKFreq_Value > 210000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_5;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "(scale0 &  (HCLKFreq_Value > 168000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_4;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 126000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale0 &  (HCLKFreq_Value > 126000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_3;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 84000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                , .{
                                    "FLatency",
                                    "(scale0 &  (HCLKFreq_Value > 84000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 42000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale0 &  (HCLKFreq_Value > 42000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 190000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "(scale1 &  (HCLKFreq_Value > 190000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_5;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 152000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "(scale1 &  (HCLKFreq_Value > 152000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_4;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 114000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale1 &  (HCLKFreq_Value > 114000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_3;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 76000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                , .{
                                    "FLatency",
                                    "(scale1 &  (HCLKFreq_Value > 76000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 38000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale1 &  (HCLKFreq_Value > 38000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if ((scale2 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 136000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "(scale2 &  (HCLKFreq_Value > 136000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_4;
                } else if ((scale2 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 102000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale2 &  (HCLKFreq_Value > 102000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_3;
                } else if ((scale2 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 68000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                , .{
                                    "FLatency",
                                    "(scale2 &  (HCLKFreq_Value > 68000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if ((scale2 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 34000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale2 &  (HCLKFreq_Value > 34000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if ((scale3 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 66000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale3 &  (HCLKFreq_Value > 66000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_3;
                } else if ((scale3 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 44000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                , .{
                                    "FLatency",
                                    "(scale3 &  (HCLKFreq_Value > 44000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if ((scale3 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 22000000, .@">")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_5 => {},
                            .FLASH_LATENCY_6 => {},
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
                                    "FLatency",
                                    "(scale3 &  (HCLKFreq_Value > 22000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_5",
                                    "FLASH_LATENCY_6",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                }
                const user_val = config.extra_config.FLatency;

                if (user_val) |val| {
                    switch (val) {
                        .FLASH_LATENCY_0 => {},
                        .FLASH_LATENCY_1 => {},
                        .FLASH_LATENCY_2 => {},
                        .FLASH_LATENCY_3 => {},
                        .FLASH_LATENCY_4 => {},
                        .FLASH_LATENCY_5 => {},
                        .FLASH_LATENCY_6 => {},
                    }
                }
                break :blk user_val orelse .FLASH_LATENCY_0;
            };

            const PLL1_VCI_RangeValue: PLL1_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_1;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_2;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_3;
                } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_3;
                }
                break :blk .RCC_PLL1VCIRANGE_3;
            };

            const PLL2_VCI_RangeValue: PLL2_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2VCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2VCIRANGE_1;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2VCIRANGE_2;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1600000, .@"<")) and ((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2VCIRANGE_3;
                } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2VCIRANGE_3;
                }
                break :blk .RCC_PLL2VCIRANGE_3;
            };

            const PLL3_VCI_RangeValue: PLL3_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCIRANGE_1;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCIRANGE_2;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCIRANGE_3;
                } else if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCIRANGE_3;
                }
                break :blk .RCC_PLL3VCIRANGE_3;
            };

            const PLL1_VCO_SELValue: PLL1_VCO_SELList = blk: {
                if ((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@"<")) and ((check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 150000000, .@">")) or (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 150000000, .@"="))) and ((check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 420000000, .@">") or (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 420000000, .@"=")))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    pll1meduim = true;
                    break :blk .RCC_PLL1VCOMEDIUM;
                } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    pll1wide = true;
                    break :blk .RCC_PLL1VCOWIDE;
                }
                break :blk .RCC_PLL1VCOWIDE;
            };

            const PLL2_VCO_SELValue: PLL2_VCO_SELList = blk: {
                if ((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@"<")) and ((check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 150000000, .@">")) or (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 150000000, .@"="))) and ((check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 420000000, .@">") or (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 420000000, .@"=")))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2VCOMEDIUM;
                } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL2VCOWIDE;
                }
                break :blk .RCC_PLL2VCOWIDE;
            };

            const PLL3_VCO_SELValue: PLL3_VCO_SELList = blk: {
                if ((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 2000000, .@"<")) and ((check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 150000000, .@">")) or (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 150000000, .@"="))) and ((check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 420000000, .@">") or (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 420000000, .@"=")))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCOMEDIUM;
                } else if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCOWIDE;
                }
                break :blk .RCC_PLL3VCOWIDE;
            };
            out.HSIRC = try HSIRC.get_output();
            out.HSIDiv = try HSIDiv.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.CSIRC = try CSIRC.get_output();
            out.RC48 = try RC48.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.MCO1Mult = try MCO1Mult.get_output();
            out.MCO1Div = try MCO1Div.get_output();
            out.MCO1Pin = try MCO1Pin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.traceClkSource = try traceClkSource.get_output();
            out.TraceCLKOutput = try TraceCLKOutput.get_output();
            out.CDCPRE = try CDCPRE.get_output();
            out.CDCPREOutput = try CDCPREOutput.get_output();
            out.CpuClockOutput = try CpuClockOutput.get_output();
            out.CortexPrescaler = try CortexPrescaler.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.HPRE = try HPRE.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.AXIClockOutput = try AXIClockOutput.get_output();
            out.HCLK3Output = try HCLK3Output.get_output();
            out.CDPPRE = try CDPPRE.get_output();
            out.APB3Output = try APB3Output.get_output();
            out.CDPPRE1 = try CDPPRE1.get_output();
            out.Tim1Mul = try Tim1Mul.get_output();
            out.Tim1Output = try Tim1Output.get_output();
            out.AHB12Output = try AHB12Output.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.CDPPRE2 = try CDPPRE2.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.Tim2Mul = try Tim2Mul.get_output();
            out.Tim2Output = try Tim2Output.get_output();
            out.AHB4Output = try AHB4Output.get_output();
            out.SRDPPRE = try SRDPPRE.get_output();
            out.APB4Output = try APB4Output.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.CKPERSource = try CKPERSource.get_output();
            out.CKPERoutput = try CKPERoutput.get_output();
            out.DIVM1 = try DIVM1.get_output();
            out.DIVM2 = try DIVM2.get_output();
            out.DIVM3 = try DIVM3.get_output();
            out.DIVN1 = try DIVN1.get_output();
            out.PLLFRACN = try PLLFRACN.get_output();
            out.DIVP1 = try DIVP1.get_output();
            out.DIVQ1 = try DIVQ1.get_output();
            out.DIVQ1output = try DIVQ1output.get_output();
            out.DIVR1 = try DIVR1.get_output();
            out.DIVR1output = try DIVR1output.get_output();
            out.DIVN2 = try DIVN2.get_output();
            out.PLL2FRACN = try PLL2FRACN.get_output();
            out.DIVP2 = try DIVP2.get_output();
            out.DIVP2output = try DIVP2output.get_output();
            out.DIVQ2 = try DIVQ2.get_output();
            out.DIVQ2output = try DIVQ2output.get_output();
            out.DIVR2 = try DIVR2.get_output();
            out.DIVR2output = try DIVR2output.get_output();
            out.DIVN3 = try DIVN3.get_output();
            out.PLL3FRACN = try PLL3FRACN.get_output();
            out.DIVP3 = try DIVP3.get_output();
            out.DIVP3output = try DIVP3output.get_output();
            out.DIVQ3 = try DIVQ3.get_output();
            out.DIVQ3output = try DIVQ3output.get_output();
            out.DIVR3 = try DIVR3.get_output();
            out.LTDCOutput = try LTDCOutput.get_output();
            out.DIVR3output = try DIVR3output.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.DAC1Output = try DAC1Output.get_output();
            out.DAC2Output = try DAC2Output.get_output();
            out.SPI123Mult = try SPI123Mult.get_output();
            out.SPI123output = try SPI123output.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.DFSDMACLKoutput = try DFSDMACLKoutput.get_output();
            out.SAI1output = try SAI1output.get_output();
            out.SAI2BMult = try SAI2BMult.get_output();
            out.SAI2Boutput = try SAI2Boutput.get_output();
            out.SAI2AMult = try SAI2AMult.get_output();
            out.SAI2Aoutput = try SAI2Aoutput.get_output();
            out.RNGMult = try RNGMult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.I2C123Mult = try I2C123Mult.get_output();
            out.I2C123output = try I2C123output.get_output();
            out.I2C4Mult = try I2C4Mult.get_output();
            out.I2C4output = try I2C4output.get_output();
            out.SPDIFMult = try SPDIFMult.get_output();
            out.SPDIFoutput = try SPDIFoutput.get_output();
            out.QSPIMult = try QSPIMult.get_output();
            out.QSPIoutput = try QSPIoutput.get_output();
            out.FMCMult = try FMCMult.get_output();
            out.FMCoutput = try FMCoutput.get_output();
            out.SWPMult = try SWPMult.get_output();
            out.SWPoutput = try SWPoutput.get_output();
            out.SDMMCMult = try SDMMCMult.get_output();
            out.SDMMCoutput = try SDMMCoutput.get_output();
            out.DFSDMMult = try DFSDMMult.get_output();
            out.DFSDMoutput = try DFSDMoutput.get_output();
            out.DFSDM2Mult = try DFSDM2Mult.get_output();
            out.DFSDM2output = try DFSDM2output.get_output();
            out.USART16Mult = try USART16Mult.get_output();
            out.USART16output = try USART16output.get_output();
            out.USART234578Mult = try USART234578Mult.get_output();
            out.USART234578output = try USART234578output.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.LPTIM345Mult = try LPTIM345Mult.get_output();
            out.LPTIM345output = try LPTIM345output.get_output();
            out.LPTIM2Mult = try LPTIM2Mult.get_output();
            out.LPTIM2output = try LPTIM2output.get_output();
            out.SPI6Mult = try SPI6Mult.get_output();
            out.SPI6output = try SPI6output.get_output();
            out.DFSDM2ACLKoutput = try DFSDM2ACLKoutput.get_output();
            out.SPI45Mult = try SPI45Mult.get_output();
            out.SPI45output = try SPI45output.get_output();
            out.USBMult = try USBMult.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.FDCANMult = try FDCANMult.get_output();
            out.FDCANoutput = try FDCANoutput.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.CECMult = try CECMult.get_output();
            out.CECoutput = try CECoutput.get_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCO2Input = try VCO2Input.get_extra_output();
            out.VCO3Input = try VCO3Input.get_extra_output();
            out.VCO1Output = try VCO1Output.get_extra_output();
            out.PLL1CLK = try PLL1CLK.get_extra_output();
            out.VCO2Output = try VCO2Output.get_extra_output();
            out.VCO3Output = try VCO3Output.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ref_out.HSIDiv = HSIDivValue;
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ignore_value(CSI_VALUEValue);
            ignore_value(HSI48_VALUEValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv1 = RCC_MCODiv1Value;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCODiv2 = RCC_MCODiv2Value;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.traceClkSourceVirtual = traceClkSourceVirtualValue;
            ignore_value(TraceFreq_ValueValue);
            ref_out.CDCPRE = CDCPREValue;
            ignore_value(CDCPREFreq_ValueValue);
            ignore_value(CpuClockFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ref_out.HPRE = HPREValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AXIClockFreq_ValueValue);
            ignore_value(HCLK3ClockFreq_ValueValue);
            ref_out.CDPPRE = CDPPREValue;
            ignore_value(APB3Freq_ValueValue);
            ref_out.CDPPRE1 = CDPPRE1Value;
            ref_out.Tim1Mul = Tim1MulValue;
            ignore_value(Tim1OutputFreq_ValueValue);
            ignore_value(AHB12Freq_ValueValue);
            ignore_value(APB1Freq_ValueValue);
            ref_out.CDPPRE2 = CDPPRE2Value;
            ignore_value(APB2Freq_ValueValue);
            ref_out.Tim2Mul = Tim2MulValue;
            ignore_value(Tim2OutputFreq_ValueValue);
            ignore_value(AHB4Freq_ValueValue);
            ref_out.SRDPPRE = SRDPPREValue;
            ignore_value(APB4Freq_ValueValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.CKPERSourceSelection = CKPERSourceSelectionValue;
            ignore_value(CKPERFreq_ValueValue);
            ref_out.DIVM1 = DIVM1Value;
            ref_out.DIVM2 = DIVM2Value;
            ref_out.DIVM3 = DIVM3Value;
            ref_out.DIVN1 = DIVN1Value;
            ignore_value(PLLFRACNValue);
            ref_out.DIVP1 = DIVP1Value;
            ref_out.DIVQ1 = DIVQ1Value;
            ignore_value(DIVQ1Freq_ValueValue);
            ref_out.DIVR1 = DIVR1Value;
            ignore_value(DIVR1Freq_ValueValue);
            ref_out.DIVN2 = DIVN2Value;
            ignore_value(PLL2FRACNValue);
            ref_out.DIVP2 = DIVP2Value;
            ignore_value(DIVP2Freq_ValueValue);
            ref_out.DIVQ2 = DIVQ2Value;
            ignore_value(DIVQ2Freq_ValueValue);
            ref_out.DIVR2 = DIVR2Value;
            ignore_value(DIVR2Freq_ValueValue);
            ref_out.DIVN3 = DIVN3Value;
            ignore_value(PLL3FRACNValue);
            ref_out.DIVP3 = DIVP3Value;
            ignore_value(DIVP3Freq_ValueValue);
            ref_out.DIVQ3 = DIVQ3Value;
            ignore_value(DIVQ3Freq_ValueValue);
            ref_out.DIVR3 = DIVR3Value;
            ignore_value(LTDCFreq_ValueValue);
            ignore_value(DIVR3Freq_ValueValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ignore_value(DAC1Freq_ValueValue);
            ignore_value(DAC2Freq_ValueValue);
            ref_out.SPI123CLockSelection = SPI123CLockSelectionValue;
            ignore_value(SPI123Freq_ValueValue);
            ref_out.SAI1CLockSelection = SAI1CLockSelectionValue;
            ignore_value(DFSDMACLkFreq_ValueValue);
            ignore_value(SAI1Freq_ValueValue);
            ref_out.SAI2BCLockSelection = SAI2BCLockSelectionValue;
            ignore_value(SAI2BFreq_ValueValue);
            ref_out.SAI2ACLockSelection = SAI2ACLockSelectionValue;
            ignore_value(SAI2AFreq_ValueValue);
            ref_out.RNGCLockSelection = RNGCLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.I2C123CLockSelection = I2C123CLockSelectionValue;
            ignore_value(I2C123Freq_ValueValue);
            ref_out.I2C4CLockSelection = I2C4CLockSelectionValue;
            ignore_value(I2C4Freq_ValueValue);
            ref_out.SPDIFCLockSelection = SPDIFCLockSelectionValue;
            ignore_value(SPDIFRXFreq_ValueValue);
            ref_out.QSPICLockSelection = QSPICLockSelectionValue;
            ignore_value(QSPIFreq_ValueValue);
            ref_out.FMCCLockSelection = FMCCLockSelectionValue;
            ignore_value(FMCFreq_ValueValue);
            ref_out.SWPCLockSelection = SWPCLockSelectionValue;
            ignore_value(SWPMI1Freq_ValueValue);
            ref_out.SDMMC1CLockSelection = SDMMC1CLockSelectionValue;
            ignore_value(SDMMCFreq_ValueValue);
            ref_out.DFSDMCLockSelection = DFSDMCLockSelectionValue;
            ignore_value(DFSDMFreq_ValueValue);
            ref_out.DFSDM2CLockSelection = DFSDM2CLockSelectionValue;
            ignore_value(DFSDM2Freq_ValueValue);
            ref_out.USART16CLockSelection = USART16CLockSelectionValue;
            ignore_value(USART16Freq_ValueValue);
            ref_out.USART234578CLockSelection = USART234578CLockSelectionValue;
            ignore_value(USART234578Freq_ValueValue);
            ref_out.LPUART1CLockSelection = LPUART1CLockSelectionValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.LPTIM345CLockSelection = LPTIM345CLockSelectionValue;
            ignore_value(LPTIM345Freq_ValueValue);
            ref_out.LPTIM2CLockSelection = LPTIM2CLockSelectionValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.SPI6CLockSelection = SPI6CLockSelectionValue;
            ignore_value(SPI6Freq_ValueValue);
            ignore_value(DFSDM2ACLkFreq_ValueValue);
            ref_out.Spi45ClockSelection = Spi45ClockSelectionValue;
            ignore_value(SPI45Freq_ValueValue);
            ref_out.USBCLockSelection = USBCLockSelectionValue;
            ignore_value(USBFreq_ValueValue);
            ref_out.FDCANCLockSelection = FDCANCLockSelectionValue;
            ignore_value(FDCANFreq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.CECCLockSelection = CECCLockSelectionValue;
            ignore_value(CECFreq_ValueValue);
            ignore_value(VCOInput1Freq_ValueValue);
            ignore_value(VCOInput2Freq_ValueValue);
            ignore_value(VCOInput3Freq_ValueValue);
            ignore_value(VCO1OutputFreq_ValueValue);
            ignore_value(DIVP1Freq_ValueValue);
            ignore_value(VCO2OutputFreq_ValueValue);
            ignore_value(VCO3OutputFreq_ValueValue);
            ref_out.RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_SelectionValue;
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.FLatency = FLatencyValue;
            ref_out.PLL1_VCI_Range = PLL1_VCI_RangeValue;
            ref_out.PLL2_VCI_Range = PLL2_VCI_RangeValue;
            ref_out.PLL3_VCI_Range = PLL3_VCI_RangeValue;
            ref_out.Prescaler = PrescalerValue;
            ref_out.Source = SourceValue;
            ref_out.Polarity = PolarityValue;
            ref_out.ReloadValueType = ReloadValueTypeValue;
            ref_out.ReloadValue = ReloadValueValue;
            ref_out.Fsync = FsyncValue;
            ref_out.ErrorLimitValue = ErrorLimitValueValue;
            ref_out.HSI48CalibrationValue = HSI48CalibrationValueValue;
            ref_out.CSICalibrationValue = CSICalibrationValueValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.PLL1_VCO_SEL = PLL1_VCO_SELValue;
            ref_out.PLL2_VCO_SEL = PLL2_VCO_SELValue;
            ref_out.PLL3_VCO_SEL = PLL3_VCO_SELValue;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.MCO1OutPutEnable = MCO1OutPutEnableValue == .true;
            ref_out.flags.MCO2OutPutEnable = MCO2OutPutEnableValue == .true;
            ref_out.flags.TraceEnable = TraceEnableValue == .auto;
            ref_out.flags.cKPerEnable = cKPerEnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.SDMMC1Enable = SDMMC1EnableValue == .true;
            ref_out.flags.SAI2AEnable = SAI2AEnableValue == .true;
            ref_out.flags.SAI2BEnable = SAI2BEnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.SPI123Enable = SPI123EnableValue == .true;
            ref_out.flags.SPDIFEnable = SPDIFEnableValue == .true;
            ref_out.flags.FDCANEnable = FDCANEnableValue == .true;
            ref_out.flags.FMCEnable = FMCEnableValue == .true;
            ref_out.flags.OCSPIEnable = OCSPIEnableValue == .true;
            ref_out.flags.TraceEnablePll = TraceEnablePllValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.LPTIM345Enable = LPTIM345EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.SPI6Enable = SPI6EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.USART234578Enable = USART234578EnableValue == .true;
            ref_out.flags.USART16910Enable = USART16910EnableValue == .true;
            ref_out.flags.SPI45Enable = SPI45EnableValue == .true;
            ref_out.flags.LTDCEnable = LTDCEnableValue == .true;
            ref_out.flags.I2C4Enable = I2C4EnableValue == .true;
            ref_out.flags.I2C123Enable = I2C123EnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.DAC1Enable = DAC1EnableValue == .true;
            ref_out.flags.DAC2Enable = DAC2EnableValue == .true;
            ref_out.flags.EnableDFSDMAudio = EnableDFSDMAudioValue == .true;
            ref_out.flags.SWPEnable = SWPEnableValue == .true;
            ref_out.flags.DFSDMEnable = DFSDMEnableValue == .true;
            ref_out.flags.DFSDM2Enable = DFSDM2EnableValue == .true;
            ref_out.flags.SPI6OutputEnable = SPI6OutputEnableValue == .true;
            ref_out.flags.EnableDFSDM2Audio = EnableDFSDM2AudioValue == .true;
            ref_out.flags.CECEnable = CECEnableValue == .true;
            ref_out.flags.PLL1QUsed = PLL1QUsedValue != 0;
            ref_out.flags.PLL1PUsed = PLL1PUsedValue != 0;
            ref_out.flags.PLL1RUsed = PLL1RUsedValue != 0;
            ref_out.flags.PLL2PUsed = PLL2PUsedValue != 0;
            ref_out.flags.PLL2QUsed = PLL2QUsedValue != 0;
            ref_out.flags.PLL2RUsed = PLL2RUsedValue != 0;
            ref_out.flags.PLL3PUsed = PLL3PUsedValue != 0;
            ref_out.flags.PLL3QUsed = PLL3QUsedValue != 0;
            ref_out.flags.PLL3RUsed = PLL3RUsedValue != 0;
            ref_out.flags.PLL3Used = PLL3UsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.PLL2Used = PLL2UsedValue != 0;
            ref_out.flags.CSIUsed = CSIUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.MCO2I2SEnable = MCO2I2SEnableValue == .true;
            ref_out.flags.EnbaleCSS = EnbaleCSSValue == .true;
            ref_out.flags.HSI48Used = HSI48UsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.cKPerUsed = cKPerUsedValue != 0;

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
