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
            PCLK1 = 0,
            PLL2_P = 1,
            PLL3_R = 2,
            LSE = 3,
            LSI = 4,
            PER = 5,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumHigh = 1,
            MediumLow = 2,
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
        pub const RCC_FMCSEL = enum(u2) {
            HCLK3 = 0,
            PLL1_Q = 1,
            PLL2_R = 2,
            PER = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_I2C1235SEL = enum(u2) {
            PCLK1 = 0,
            PLL3_R = 1,
            HSI = 2,
            CSI = 3,
        };
        pub const RCC_LPTIM2SEL = enum(u3) {
            PCLK4 = 0,
            PLL2_P = 1,
            PLL3_R = 2,
            LSE = 3,
            LSI = 4,
            PER = 5,
        };
        pub const RCC_USART16910SEL = enum(u3) {
            PCLK2 = 0,
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
            PCLK4 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            LSE = 5,
        };
        pub const RCC_USART234578SEL = enum(u3) {
            PCLK1 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
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
        pub const RCC_DSISEL = enum(u1) {
            DSI_PHY = 0,
            PLL2_Q = 1,
        };
        pub const RCC_HRTIMSEL = enum(u1) {
            TIMY_KER = 0,
            C_CK = 1,
        };
        pub const RCC_SPDIFRXSEL = enum(u2) {
            PLL1_Q = 0,
            PLL2_R = 1,
            PLL3_R = 2,
            HSI = 3,
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
            HSE = 3,
        };
        pub const RCC_SWPMISEL = enum(u1) {
            PCLK1 = 0,
            HSI = 1,
        };
        pub const PWR_VOS = enum(u2) {
            Scale3 = 1,
            Scale2 = 2,
            Scale1 = 3,
        };
        pub const RCC_SPI6SEL = enum(u3) {
            PCLK4 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            HSE = 5,
        };
        pub const RCC_SDMMCSEL = enum(u1) {
            PLL1_Q = 0,
            PLL2_R = 1,
        };
        pub const RCC_SPI45SEL = enum(u3) {
            PCLK2 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            HSE = 5,
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
        pub const RCC_DFSDMSEL = enum(u1) {
            PCLK2 = 0,
            SYS = 1,
        };
        pub const RCC_PLLSRC = enum(u2) {
            HSI = 0,
            CSI = 1,
            HSE = 2,
        };
        pub const RCC_SAISEL = enum(u3) {
            PLL1_Q = 0,
            PLL2_P = 1,
            PLL3_P = 2,
            I2S_CKIN = 3,
            PER = 4,
        };
        pub const RCC_FDCANSEL = enum(u2) {
            HSE = 0,
            PLL1_Q = 1,
            PLL2_Q = 2,
        };
        pub const RCC_CECSEL = enum(u2) {
            LSE = 0,
            LSI = 1,
            CSI = 2,
        };
        pub const RCC_I2C4SEL = enum(u2) {
            PCLK4 = 0,
            PLL3_R = 1,
            HSI = 2,
            CSI = 3,
        };
        pub const RCC_USBSEL = enum(u2) {
            PLL1_Q = 1,
            PLL3_Q = 2,
            HSI48 = 3,
        };
        pub const RCC_PLLVCOSEL = enum(u1) {
            WideVCO = 0,
            MediumVCO = 1,
        };
        pub const RCC_ADCSEL = enum(u2) {
            PLL2_P = 0,
            PLL3_R = 1,
            PER = 2,
        };

        pub const HSIDivList = enum {
            RCC_PLLSAIDIVR_1,
            RCC_PLLSAIDIVR_2,
            RCC_PLLSAIDIVR_4,
            RCC_PLLSAIDIVR_8,

            pub fn to_enum(self: @This()) anyerror!RCC_HSIDIV {
                return switch (self) {
                    .RCC_PLLSAIDIVR_8 => .Div8,
                    .RCC_PLLSAIDIVR_1 => .Div1,
                    .RCC_PLLSAIDIVR_2 => .Div2,
                    .RCC_PLLSAIDIVR_4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_HSIDIV) anyerror!@This() {
                return switch (item) {
                    .Div8 => .RCC_PLLSAIDIVR_8,
                    .Div1 => .RCC_PLLSAIDIVR_1,
                    .Div2 => .RCC_PLLSAIDIVR_2,
                    .Div4 => .RCC_PLLSAIDIVR_4,
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

        pub const traceClkSourceVirtualList = enum {
            RCC_TRACECLKSOURCE_HSI,
            RCC_TRACECLKSOURCE_CSI,
            RCC_TRACECLKSOURCE_HSE,
            RCC_TRACECLKSOURCE_PLLCLK,
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

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSI48,
            RCC_MCO1SOURCE_PLL1QCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_MCO1SEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_PLL1QCLK => .PLL1_Q,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_MCO1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .PLL1_Q => .RCC_MCO1SOURCE_PLL1QCLK,
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
                    .HSE => .RCC_MCO1SOURCE_HSE,
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
                    .RCC_MCO2SOURCE_CSICLK => .CSI,
                    .RCC_MCO2SOURCE_LSICLK => .LSI,
                    .RCC_MCO2SOURCE_SYSCLK => .SYS,
                    .RCC_MCO2SOURCE_PLL2PCLK => .PLL2_P,
                };
            }
            pub fn from_enum(item: RCC_MCO2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_MCO2SOURCE_PLLCLK,
                    .HSE => .RCC_MCO2SOURCE_HSE,
                    .CSI => .RCC_MCO2SOURCE_CSICLK,
                    .LSI => .RCC_MCO2SOURCE_LSICLK,
                    .SYS => .RCC_MCO2SOURCE_SYSCLK,
                    .PLL2_P => .RCC_MCO2SOURCE_PLL2PCLK,
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

        pub const DSICLockSelectionList = enum {
            RCC_DSICLKSOURCE_PLL2,
            RCC_DSICLKSOURCE_PHY,

            pub fn to_enum(self: @This()) anyerror!RCC_DSISEL {
                return switch (self) {
                    .RCC_DSICLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_DSICLKSOURCE_PHY => .DSI_PHY,
                };
            }
            pub fn from_enum(item: RCC_DSISEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_DSICLKSOURCE_PLL2,
                    .DSI_PHY => .RCC_DSICLKSOURCE_PHY,
                };
            }
        };

        pub const PLLDSIIDFList = enum {
            DSI_PLL_IN_DIV1,
            DSI_PLL_IN_DIV2,
            DSI_PLL_IN_DIV3,
            DSI_PLL_IN_DIV4,
            DSI_PLL_IN_DIV5,
            DSI_PLL_IN_DIV6,
            DSI_PLL_IN_DIV7,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLDIV {
                return switch (self) {
                    .DSI_PLL_IN_DIV1 => .Div1,
                    .DSI_PLL_IN_DIV6 => .Div6,
                    .DSI_PLL_IN_DIV2 => .Div2,
                    .DSI_PLL_IN_DIV4 => .Div4,
                    .DSI_PLL_IN_DIV7 => .Div7,
                    .DSI_PLL_IN_DIV3 => .Div3,
                    .DSI_PLL_IN_DIV5 => .Div5,
                };
            }
            pub fn from_enum(item: RCC_PLLDIV) anyerror!@This() {
                return switch (item) {
                    .Div1 => .DSI_PLL_IN_DIV1,
                    .Div6 => .DSI_PLL_IN_DIV6,
                    .Div2 => .DSI_PLL_IN_DIV2,
                    .Div4 => .DSI_PLL_IN_DIV4,
                    .Div7 => .DSI_PLL_IN_DIV7,
                    .Div3 => .DSI_PLL_IN_DIV3,
                    .Div5 => .DSI_PLL_IN_DIV5,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLDIV", @tagName(item), "PLLDSIIDF" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .DSI_PLL_IN_DIV1 => 1,
                    .DSI_PLL_IN_DIV2 => 2,
                    .DSI_PLL_IN_DIV3 => 3,
                    .DSI_PLL_IN_DIV4 => 4,
                    .DSI_PLL_IN_DIV5 => 5,
                    .DSI_PLL_IN_DIV6 => 6,
                    .DSI_PLL_IN_DIV7 => 7,
                };
            }
        };

        pub const PLLDSIODFList = enum {
            DSI_PLL_OUT_DIV1,
            DSI_PLL_OUT_DIV2,
            DSI_PLL_OUT_DIV4,
            DSI_PLL_OUT_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLDIV {
                return switch (self) {
                    .DSI_PLL_OUT_DIV8 => .Div8,
                    .DSI_PLL_OUT_DIV1 => .Div1,
                    .DSI_PLL_OUT_DIV4 => .Div4,
                    .DSI_PLL_OUT_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_PLLDIV) anyerror!@This() {
                return switch (item) {
                    .Div8 => .DSI_PLL_OUT_DIV8,
                    .Div1 => .DSI_PLL_OUT_DIV1,
                    .Div4 => .DSI_PLL_OUT_DIV4,
                    .Div2 => .DSI_PLL_OUT_DIV2,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLDIV", @tagName(item), "PLLDSIODF" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .DSI_PLL_OUT_DIV1 => 1,
                    .DSI_PLL_OUT_DIV2 => 2,
                    .DSI_PLL_OUT_DIV4 => 4,
                    .DSI_PLL_OUT_DIV8 => 8,
                };
            }
        };

        pub const D1CPREList = enum {
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
                    .RCC_HCLK_DIV4 => .Div4,
                    .RCC_HCLK_DIV64 => .Div64,
                    .RCC_HCLK_DIV512 => .Div512,
                    .RCC_HCLK_DIV16 => .Div16,
                    .RCC_HCLK_DIV256 => .Div256,
                    .RCC_HCLK_DIV2 => .Div2,
                    .RCC_HCLK_DIV128 => .Div128,
                    .RCC_HCLK_DIV1 => .Div1,
                    .RCC_HCLK_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_HCLK_DIV4,
                    .Div64 => .RCC_HCLK_DIV64,
                    .Div512 => .RCC_HCLK_DIV512,
                    .Div16 => .RCC_HCLK_DIV16,
                    .Div256 => .RCC_HCLK_DIV256,
                    .Div2 => .RCC_HCLK_DIV2,
                    .Div128 => .RCC_HCLK_DIV128,
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
                    .RCC_HCLK_DIV64 => 64,
                    .RCC_HCLK_DIV128 => 128,
                    .RCC_HCLK_DIV256 => 256,
                    .RCC_HCLK_DIV512 => 512,
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

        pub const D1PPREList = enum {
            RCC_APB3_DIV1,
            RCC_APB3_DIV2,
            RCC_APB3_DIV4,
            RCC_APB3_DIV8,
            RCC_APB3_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB3_DIV8 => .Div8,
                    .RCC_APB3_DIV2 => .Div2,
                    .RCC_APB3_DIV1 => .Div1,
                    .RCC_APB3_DIV16 => .Div16,
                    .RCC_APB3_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div8 => .RCC_APB3_DIV8,
                    .Div2 => .RCC_APB3_DIV2,
                    .Div1 => .RCC_APB3_DIV1,
                    .Div16 => .RCC_APB3_DIV16,
                    .Div4 => .RCC_APB3_DIV4,
                };
            }
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

        pub const D2PPRE1List = enum {
            RCC_APB1_DIV1,
            RCC_APB1_DIV2,
            RCC_APB1_DIV4,
            RCC_APB1_DIV8,
            RCC_APB1_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB1_DIV8 => .Div8,
                    .RCC_APB1_DIV16 => .Div16,
                    .RCC_APB1_DIV4 => .Div4,
                    .RCC_APB1_DIV2 => .Div2,
                    .RCC_APB1_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div8 => .RCC_APB1_DIV8,
                    .Div16 => .RCC_APB1_DIV16,
                    .Div4 => .RCC_APB1_DIV4,
                    .Div2 => .RCC_APB1_DIV2,
                    .Div1 => .RCC_APB1_DIV1,
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

        pub const D2PPRE2List = enum {
            RCC_APB2_DIV1,
            RCC_APB2_DIV2,
            RCC_APB2_DIV4,
            RCC_APB2_DIV8,
            RCC_APB2_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB2_DIV8 => .Div8,
                    .RCC_APB2_DIV16 => .Div16,
                    .RCC_APB2_DIV1 => .Div1,
                    .RCC_APB2_DIV4 => .Div4,
                    .RCC_APB2_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div8 => .RCC_APB2_DIV8,
                    .Div16 => .RCC_APB2_DIV16,
                    .Div1 => .RCC_APB2_DIV1,
                    .Div4 => .RCC_APB2_DIV4,
                    .Div2 => .RCC_APB2_DIV2,
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

        pub const D3PPREList = enum {
            RCC_APB4_DIV1,
            RCC_APB4_DIV2,
            RCC_APB4_DIV4,
            RCC_APB4_DIV8,
            RCC_APB4_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB4_DIV2 => .Div2,
                    .RCC_APB4_DIV16 => .Div16,
                    .RCC_APB4_DIV8 => .Div8,
                    .RCC_APB4_DIV1 => .Div1,
                    .RCC_APB4_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_APB4_DIV2,
                    .Div16 => .RCC_APB4_DIV16,
                    .Div8 => .RCC_APB4_DIV8,
                    .Div1 => .RCC_APB4_DIV1,
                    .Div4 => .RCC_APB4_DIV4,
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
                    .RCC_PLLSOURCE_HSI => .HSI,
                    .RCC_PLLSOURCE_CSI => .CSI,
                    .RCC_PLLSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_PLLSOURCE_HSI,
                    .CSI => .RCC_PLLSOURCE_CSI,
                    .HSE => .RCC_PLLSOURCE_HSE,
                };
            }
        };

        pub const CKPERSourceSelectionList = enum {
            RCC_CLKPSOURCE_HSI,
            RCC_CLKPSOURCE_CSI,
            RCC_CLKPSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_CLKPSOURCE_HSI => .HSI,
                    .RCC_CLKPSOURCE_CSI => .CSI,
                    .RCC_CLKPSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_CLKPSOURCE_HSI,
                    .CSI => .RCC_CLKPSOURCE_CSI,
                    .HSE => .RCC_CLKPSOURCE_HSE,
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
                    .RCC_RTCCLKSOURCE_LSI => .LSI,
                    .HSERTCDevisor => .HSE,
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .HSE => .HSERTCDevisor,
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
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
                    .RCC_SPI123CLKSOURCE_CLKP => .PER,
                    .RCC_SPI123CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SPI123CLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SPI123CLKSOURCE_PLL3 => .PLL3_P,
                    .RCC_SPI123CLKSOURCE_PIN => .I2S_CKIN,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .PER => .RCC_SPI123CLKSOURCE_CLKP,
                    .PLL2_P => .RCC_SPI123CLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SPI123CLKSOURCE_PLL,
                    .PLL3_P => .RCC_SPI123CLKSOURCE_PLL3,
                    .I2S_CKIN => .RCC_SPI123CLKSOURCE_PIN,
                };
            }
        };

        pub const SAI23CLockSelectionList = enum {
            RCC_SAI23CLKSOURCE_PLL,
            RCC_SAI23CLKSOURCE_PLL2,
            RCC_SAI23CLKSOURCE_PLL3,
            RCC_SAI23CLKSOURCE_PIN,
            RCC_SAI23CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SAI23CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI23CLKSOURCE_CLKP => .PER,
                    .RCC_SAI23CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI23CLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SAI23CLKSOURCE_PLL3 => .PLL3_P,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_SAI23CLKSOURCE_PIN,
                    .PER => .RCC_SAI23CLKSOURCE_CLKP,
                    .PLL2_P => .RCC_SAI23CLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SAI23CLKSOURCE_PLL,
                    .PLL3_P => .RCC_SAI23CLKSOURCE_PLL3,
                };
            }
        };

        pub const SAI1CLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_PLL,
            RCC_SAI1CLKSOURCE_PLL2,
            RCC_SAI1CLKSOURCE_PLL3,
            RCC_SAI1CLKSOURCE_PIN,
            RCC_SAI1CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PLL3 => .PLL3_P,
                    .RCC_SAI1CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI1CLKSOURCE_CLKP => .PER,
                    .RCC_SAI1CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI1CLKSOURCE_PLL => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_P => .RCC_SAI1CLKSOURCE_PLL3,
                    .I2S_CKIN => .RCC_SAI1CLKSOURCE_PIN,
                    .PER => .RCC_SAI1CLKSOURCE_CLKP,
                    .PLL2_P => .RCC_SAI1CLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SAI1CLKSOURCE_PLL,
                };
            }
        };

        pub const SAI4BCLockSelectionList = enum {
            RCC_SAI4BCLKSOURCE_PLL,
            RCC_SAI4BCLKSOURCE_PLL2,
            RCC_SAI4BCLKSOURCE_PLL3,
            RCC_SAI4BCLKSOURCE_PIN,
            RCC_SAI4BCLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SAIASEL {
                return switch (self) {
                    .RCC_SAI4BCLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI4BCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SAI4BCLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI4BCLKSOURCE_CLKP => .PER,
                    .RCC_SAI4BCLKSOURCE_PLL3 => .PLL3_P,
                };
            }
            pub fn from_enum(item: RCC_SAIASEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_SAI4BCLKSOURCE_PIN,
                    .PLL1_Q => .RCC_SAI4BCLKSOURCE_PLL,
                    .PLL2_P => .RCC_SAI4BCLKSOURCE_PLL2,
                    .PER => .RCC_SAI4BCLKSOURCE_CLKP,
                    .PLL3_P => .RCC_SAI4BCLKSOURCE_PLL3,
                };
            }
        };

        pub const SAI4ACLockSelectionList = enum {
            RCC_SAI4ACLKSOURCE_PLL,
            RCC_SAI4ACLKSOURCE_PLL2,
            RCC_SAI4ACLKSOURCE_PLL3,
            RCC_SAI4ACLKSOURCE_PIN,
            RCC_SAI4ACLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SAIASEL {
                return switch (self) {
                    .RCC_SAI4ACLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI4ACLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SAI4ACLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI4ACLKSOURCE_PLL3 => .PLL3_P,
                    .RCC_SAI4ACLKSOURCE_CLKP => .PER,
                };
            }
            pub fn from_enum(item: RCC_SAIASEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_SAI4ACLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SAI4ACLKSOURCE_PLL,
                    .I2S_CKIN => .RCC_SAI4ACLKSOURCE_PIN,
                    .PLL3_P => .RCC_SAI4ACLKSOURCE_PLL3,
                    .PER => .RCC_SAI4ACLKSOURCE_CLKP,
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
                    .RCC_RNGCLKSOURCE_HSI48 => .HSI48,
                    .RCC_RNGCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_RNGCLKSOURCE_LSI => .LSI,
                    .RCC_RNGCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RNGSEL) anyerror!@This() {
                return switch (item) {
                    .HSI48 => .RCC_RNGCLKSOURCE_HSI48,
                    .PLL1_Q => .RCC_RNGCLKSOURCE_PLL,
                    .LSI => .RCC_RNGCLKSOURCE_LSI,
                    .LSE => .RCC_RNGCLKSOURCE_LSE,
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
                    .RCC_I2C4CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_I2C4CLKSOURCE_HSI => .HSI,
                    .RCC_I2C4CLKSOURCE_PLL3 => .PLL3_R,
                };
            }
            pub fn from_enum(item: RCC_I2C4SEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_I2C4CLKSOURCE_CSI,
                    .PCLK4 => .RCC_I2C4CLKSOURCE_D3PCLK1,
                    .HSI => .RCC_I2C4CLKSOURCE_HSI,
                    .PLL3_R => .RCC_I2C4CLKSOURCE_PLL3,
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
                    .RCC_SPDIFRXCLKSOURCE_HSI => .HSI,
                    .RCC_SPDIFRXCLKSOURCE_PLL2 => .PLL2_R,
                    .RCC_SPDIFRXCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_SPDIFRXCLKSOURCE_PLL3 => .PLL3_R,
                };
            }
            pub fn from_enum(item: RCC_SPDIFRXSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SPDIFRXCLKSOURCE_HSI,
                    .PLL2_R => .RCC_SPDIFRXCLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_SPDIFRXCLKSOURCE_PLL,
                    .PLL3_R => .RCC_SPDIFRXCLKSOURCE_PLL3,
                };
            }
        };

        pub const QSPICLockSelectionList = enum {
            RCC_QSPICLKSOURCE_D1HCLK,
            RCC_QSPICLKSOURCE_PLL,
            RCC_QSPICLKSOURCE_PLL2,
            RCC_QSPICLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_FMCSEL {
                return switch (self) {
                    .RCC_QSPICLKSOURCE_CLKP => .PER,
                    .RCC_QSPICLKSOURCE_D1HCLK => .HCLK3,
                    .RCC_QSPICLKSOURCE_PLL => .PLL1_Q,
                    .RCC_QSPICLKSOURCE_PLL2 => .PLL2_R,
                };
            }
            pub fn from_enum(item: RCC_FMCSEL) anyerror!@This() {
                return switch (item) {
                    .PER => .RCC_QSPICLKSOURCE_CLKP,
                    .HCLK3 => .RCC_QSPICLKSOURCE_D1HCLK,
                    .PLL1_Q => .RCC_QSPICLKSOURCE_PLL,
                    .PLL2_R => .RCC_QSPICLKSOURCE_PLL2,
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
                    .RCC_FMCCLKSOURCE_PLL2 => .PLL2_R,
                    .RCC_FMCCLKSOURCE_CLKP => .PER,
                    .RCC_FMCCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_FMCCLKSOURCE_D1HCLK => .HCLK3,
                };
            }
            pub fn from_enum(item: RCC_FMCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_R => .RCC_FMCCLKSOURCE_PLL2,
                    .PER => .RCC_FMCCLKSOURCE_CLKP,
                    .PLL1_Q => .RCC_FMCCLKSOURCE_PLL,
                    .HCLK3 => .RCC_FMCCLKSOURCE_D1HCLK,
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
                    .RCC_DFSDM1CLKSOURCE_D2PCLK1 => .PCLK2,
                    .RCC_DFSDM1CLKSOURCE_SYS => .SYS,
                };
            }
            pub fn from_enum(item: RCC_DFSDMSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK2 => .RCC_DFSDM1CLKSOURCE_D2PCLK1,
                    .SYS => .RCC_DFSDM1CLKSOURCE_SYS,
                };
            }
        };

        pub const USART16CLockSelectionList = enum {
            RCC_USART16CLKSOURCE_D2PCLK2,
            RCC_USART16CLKSOURCE_PLL2,
            RCC_USART16CLKSOURCE_PLL3,
            RCC_USART16CLKSOURCE_HSI,
            RCC_USART16CLKSOURCE_CSI,
            RCC_USART16CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART16910SEL {
                return switch (self) {
                    .RCC_USART16CLKSOURCE_CSI => .CSI,
                    .RCC_USART16CLKSOURCE_D2PCLK2 => .PCLK2,
                    .RCC_USART16CLKSOURCE_HSI => .HSI,
                    .RCC_USART16CLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_USART16CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_USART16CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USART16910SEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_USART16CLKSOURCE_CSI,
                    .PCLK2 => .RCC_USART16CLKSOURCE_D2PCLK2,
                    .HSI => .RCC_USART16CLKSOURCE_HSI,
                    .PLL3_Q => .RCC_USART16CLKSOURCE_PLL3,
                    .PLL2_Q => .RCC_USART16CLKSOURCE_PLL2,
                    .LSE => .RCC_USART16CLKSOURCE_LSE,
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
                    .RCC_USART234578CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_USART234578CLKSOURCE_LSE => .LSE,
                    .RCC_USART234578CLKSOURCE_CSI => .CSI,
                    .RCC_USART234578CLKSOURCE_D2PCLK1 => .PCLK1,
                    .RCC_USART234578CLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_USART234578CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_USART234578SEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_USART234578CLKSOURCE_PLL2,
                    .LSE => .RCC_USART234578CLKSOURCE_LSE,
                    .CSI => .RCC_USART234578CLKSOURCE_CSI,
                    .PCLK1 => .RCC_USART234578CLKSOURCE_D2PCLK1,
                    .PLL3_Q => .RCC_USART234578CLKSOURCE_PLL3,
                    .HSI => .RCC_USART234578CLKSOURCE_HSI,
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
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_CSI => .CSI,
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_LPUART1CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_LPUART1CLKSOURCE_PLL3 => .PLL3_Q,
                };
            }
            pub fn from_enum(item: RCC_LPUARTSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .CSI => .RCC_LPUART1CLKSOURCE_CSI,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PLL2_Q => .RCC_LPUART1CLKSOURCE_PLL2,
                    .PCLK4 => .RCC_LPUART1CLKSOURCE_D3PCLK1,
                    .PLL3_Q => .RCC_LPUART1CLKSOURCE_PLL3,
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
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM1CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_LPTIM1CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM1CLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM1CLKSOURCE_D2PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .PLL2_P => .RCC_LPTIM1CLKSOURCE_PLL2,
                    .PER => .RCC_LPTIM1CLKSOURCE_CLKP,
                    .PLL3_R => .RCC_LPTIM1CLKSOURCE_PLL3,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_D2PCLK1,
                };
            }
        };

        pub const LPTIM345CLockSelectionList = enum {
            RCC_LPTIM345CLKSOURCE_D3PCLK1,
            RCC_LPTIM345CLKSOURCE_PLL2,
            RCC_LPTIM345CLKSOURCE_PLL3,
            RCC_LPTIM345CLKSOURCE_LSE,
            RCC_LPTIM345CLKSOURCE_LSI,
            RCC_LPTIM345CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM345CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_LPTIM345CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM345CLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_LPTIM345CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM345CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_LPTIM345CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_LPTIM345CLKSOURCE_PLL2,
                    .LSI => .RCC_LPTIM345CLKSOURCE_LSI,
                    .PLL3_R => .RCC_LPTIM345CLKSOURCE_PLL3,
                    .PER => .RCC_LPTIM345CLKSOURCE_CLKP,
                    .PCLK4 => .RCC_LPTIM345CLKSOURCE_D3PCLK1,
                    .LSE => .RCC_LPTIM345CLKSOURCE_LSE,
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
                    .RCC_LPTIM2CLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_LPTIM2CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM2CLKSOURCE_PLL2 => .PLL2_P,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                    .PLL3_R => .RCC_LPTIM2CLKSOURCE_PLL3,
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .PCLK4 => .RCC_LPTIM2CLKSOURCE_D3PCLK1,
                    .PER => .RCC_LPTIM2CLKSOURCE_CLKP,
                    .PLL2_P => .RCC_LPTIM2CLKSOURCE_PLL2,
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
                    .RCC_SPI6CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_SPI6CLKSOURCE_D3PCLK1 => .PCLK4,
                    .RCC_SPI6CLKSOURCE_CSI => .CSI,
                    .RCC_SPI6CLKSOURCE_HSI => .HSI,
                    .RCC_SPI6CLKSOURCE_HSE => .HSE,
                    .RCC_SPI6CLKSOURCE_PLL3 => .PLL3_Q,
                };
            }
            pub fn from_enum(item: RCC_SPI6SEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_SPI6CLKSOURCE_PLL2,
                    .PCLK4 => .RCC_SPI6CLKSOURCE_D3PCLK1,
                    .CSI => .RCC_SPI6CLKSOURCE_CSI,
                    .HSI => .RCC_SPI6CLKSOURCE_HSI,
                    .HSE => .RCC_SPI6CLKSOURCE_HSE,
                    .PLL3_Q => .RCC_SPI6CLKSOURCE_PLL3,
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
                    .RCC_SPI45CLKSOURCE_CSI => .CSI,
                    .RCC_SPI45CLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_SPI45CLKSOURCE_HSE => .HSE,
                    .RCC_SPI45CLKSOURCE_D2PCLK1 => .PCLK2,
                    .RCC_SPI45CLKSOURCE_HSI => .HSI,
                    .RCC_SPI45CLKSOURCE_PLL3 => .PLL3_Q,
                };
            }
            pub fn from_enum(item: RCC_SPI45SEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_SPI45CLKSOURCE_CSI,
                    .PLL2_Q => .RCC_SPI45CLKSOURCE_PLL2,
                    .HSE => .RCC_SPI45CLKSOURCE_HSE,
                    .PCLK2 => .RCC_SPI45CLKSOURCE_D2PCLK1,
                    .HSI => .RCC_SPI45CLKSOURCE_HSI,
                    .PLL3_Q => .RCC_SPI45CLKSOURCE_PLL3,
                };
            }
        };

        pub const USBCLockSelectionList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_PLL3,
            RCC_USBCLKSOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_USBSEL {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL => .PLL1_Q,
                    .RCC_USBCLKSOURCE_PLL3 => .PLL3_Q,
                    .RCC_USBCLKSOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_USBSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_USBCLKSOURCE_PLL,
                    .PLL3_Q => .RCC_USBCLKSOURCE_PLL3,
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
                    .RCC_ADCCLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_ADCCLKSOURCE_PLL3 => .PLL3_R,
                    .RCC_ADCCLKSOURCE_CLKP => .PER,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_ADCCLKSOURCE_PLL2,
                    .PLL3_R => .RCC_ADCCLKSOURCE_PLL3,
                    .PER => .RCC_ADCCLKSOURCE_CLKP,
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
                    .RCC_CECCLKSOURCE_LSI => .LSI,
                    .RCC_CECCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_CECSEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_CECCLKSOURCE_CSI,
                    .LSI => .RCC_CECCLKSOURCE_LSI,
                    .LSE => .RCC_CECCLKSOURCE_LSE,
                };
            }
        };

        pub const HRTIMCLockSelectionList = enum {
            RCC_HRTIM1CLK_TIMCLK,
            RCC_HRTIM1CLK_CPUCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_HRTIMSEL {
                return switch (self) {
                    .RCC_HRTIM1CLK_CPUCLK => .C_CK,
                    .RCC_HRTIM1CLK_TIMCLK => .TIMY_KER,
                };
            }
            pub fn from_enum(item: RCC_HRTIMSEL) anyerror!@This() {
                return switch (item) {
                    .C_CK => .RCC_HRTIM1CLK_CPUCLK,
                    .TIMY_KER => .RCC_HRTIM1CLK_TIMCLK,
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
            PWR_REGULATOR_VOLTAGE_SCALE3,
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE0,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .Scale2,
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .Scale1,
                    .PWR_REGULATOR_VOLTAGE_SCALE3 => .Scale3,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "PWR_Regulator_Voltage_Scale", @tagName(self), "PWR_VOS" },
                    ),
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .Scale2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .Scale1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .Scale3 => .PWR_REGULATOR_VOLTAGE_SCALE3,
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

        pub const FLatencyList = enum {
            FLASH_LATENCY_0,
            FLASH_LATENCY_1,
            FLASH_LATENCY_2,
            FLASH_LATENCY_3,
            FLASH_LATENCY_4,
        };

        pub const ProductRevList = enum {
            revV,
            revY,
        };

        pub const PLL1_VCI_RangeList = enum {
            RCC_PLL1VCIRANGE_0,
            RCC_PLL1VCIRANGE_1,
            RCC_PLL1VCIRANGE_2,
            RCC_PLL1VCIRANGE_3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL1VCIRANGE_2 => .Range4,
                    .RCC_PLL1VCIRANGE_3 => .Range8,
                    .RCC_PLL1VCIRANGE_0 => .Range1,
                    .RCC_PLL1VCIRANGE_1 => .Range2,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range4 => .RCC_PLL1VCIRANGE_2,
                    .Range8 => .RCC_PLL1VCIRANGE_3,
                    .Range1 => .RCC_PLL1VCIRANGE_0,
                    .Range2 => .RCC_PLL1VCIRANGE_1,
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
                    .RCC_PLL2VCIRANGE_0 => .Range1,
                    .RCC_PLL2VCIRANGE_1 => .Range2,
                    .RCC_PLL2VCIRANGE_3 => .Range8,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range4 => .RCC_PLL2VCIRANGE_2,
                    .Range1 => .RCC_PLL2VCIRANGE_0,
                    .Range2 => .RCC_PLL2VCIRANGE_1,
                    .Range8 => .RCC_PLL2VCIRANGE_3,
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
                    .RCC_PLL3VCIRANGE_2 => .Range4,
                    .RCC_PLL3VCIRANGE_1 => .Range2,
                    .RCC_PLL3VCIRANGE_0 => .Range1,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range8 => .RCC_PLL3VCIRANGE_3,
                    .Range4 => .RCC_PLL3VCIRANGE_2,
                    .Range2 => .RCC_PLL3VCIRANGE_1,
                    .Range1 => .RCC_PLL3VCIRANGE_0,
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
                    .RCC_PLL2VCOWIDE => .WideVCO,
                    .RCC_PLL2VCOMEDIUM => .MediumVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .WideVCO => .RCC_PLL2VCOWIDE,
                    .MediumVCO => .RCC_PLL2VCOMEDIUM,
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

        pub const TraceEnableList = enum {
            auto,
        };

        pub const MCO1OutPutEnableList = enum {
            true,
            false,
        };

        pub const MCO2OutPutEnableList = enum {
            true,
            false,
        };

        pub const EnableHSEDSIList = enum {
            true,
            false,
        };

        pub const EnableDSIList = enum {
            true,
            false,
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

        pub const SAI4AEnableList = enum {
            true,
            false,
        };

        pub const SAI4BEnableList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const SAI23EnableList = enum {
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

        pub const QuadSPIEnableList = enum {
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

        pub const USART16EnableList = enum {
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

        pub const CECEnableList = enum {
            true,
            false,
        };

        pub const HRTIMEnableList = enum {
            true,
            false,
        };

        pub const EnablePLLRDSIList = enum {
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
            DSIUsed_ForRCC: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            USB_OTG_HSUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            SAI3_SAIAUsed_ForRCC: bool = false,
            SAI3_SAIBUsed_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            SAI4_SAIBUsed_ForRCC: bool = false,
            SAI4_SAIAUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SPDIFRX1Used_ForRCC: bool = false,
            QUADSPIUsed_ForRCC: bool = false,
            FMCUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            LPTIM4Used_ForRCC: bool = false,
            LPTIM5Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC3: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            USART6Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            SPI6Used_ForRCC: bool = false,
            SPI4Used_ForRCC: bool = false,
            SPI5Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            RBGEnable: bool = false,
            RTCUsed_ForRCC: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            HRTIMUsed_ForRCC: bool = false,
            DEBUG_Used: bool = false,
            EnableCSS: bool = false,
            IWDG1_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            RCC_PLLSOURCE_HSE: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_MCO2SOURCE_PLLCLK: bool = false,
            STM32H747_757: bool = false,
            STM32H755BIT3: bool = false,
            STM32H755IIK3: bool = false,
            STM32H755IIT3: bool = false,
            STM32H755XIH3: bool = false,
            STM32H755ZIT3: bool = false,
            revV: bool = false,
            revY: bool = false,
            STM32H745_755: bool = false,
            RCC_TIMPRES_DESACTIVATED: bool = false,
            RCC_TIMPRES_ACTIVATED: bool = false,
            SEM2RCC_SAI1_CK_REQUIRED_DFSDM1: bool = false,
            RCC_MCO1SOURCE_PLL1QCLK: bool = false,
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
            DSIUsed_ForRCC: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            USB_OTG_HSUsed_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            SAI3_SAIAUsed_ForRCC: bool = false,
            SAI3_SAIBUsed_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            SAI4_SAIBUsed_ForRCC: bool = false,
            SAI4_SAIAUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SPDIFRX1Used_ForRCC: bool = false,
            QUADSPIUsed_ForRCC: bool = false,
            FMCUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            LPTIM4Used_ForRCC: bool = false,
            LPTIM5Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC3: bool = false,
            ADC3UsedAsynchronousCLK_ForRCC: bool = false,
            USART6Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            SPI6Used_ForRCC: bool = false,
            SPI4Used_ForRCC: bool = false,
            SPI5Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            RBGEnable: bool = false,
            RTCUsed_ForRCC: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            HRTIMUsed_ForRCC: bool = false,
            DEBUG_Used: bool = false,
            EnableCSS: bool = false,
            IWDG1_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            RCC_PLLSOURCE_HSE: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_MCO2SOURCE_PLLCLK: bool = false,
            STM32H747_757: bool = false,
            STM32H755BIT3: bool = false,
            STM32H755IIK3: bool = false,
            STM32H755IIT3: bool = false,
            STM32H755XIH3: bool = false,
            STM32H755ZIT3: bool = false,
            revV: bool = false,
            revY: bool = false,
            STM32H745_755: bool = false,
            RCC_TIMPRES_DESACTIVATED: bool = false,
            RCC_TIMPRES_ACTIVATED: bool = false,
            SEM2RCC_SAI1_CK_REQUIRED_DFSDM1: bool = false,
            RCC_MCO1SOURCE_PLL1QCLK: bool = false,
            LSIEnable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            TraceEnable: bool = false, //Reference flag
            MCO1OutPutEnable: bool = false, //Reference flag
            MCO2OutPutEnable: bool = false, //Reference flag
            EnableHSEDSI: bool = false, //Reference flag
            EnableDSI: bool = false, //Reference flag
            cKPerEnable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            SDMMC1Enable: bool = false, //Reference flag
            SAI4AEnable: bool = false, //Reference flag
            SAI4BEnable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            SAI23Enable: bool = false, //Reference flag
            SPI123Enable: bool = false, //Reference flag
            SPDIFEnable: bool = false, //Reference flag
            FDCANEnable: bool = false, //Reference flag
            FMCEnable: bool = false, //Reference flag
            QuadSPIEnable: bool = false, //Reference flag
            TraceEnablePll: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            LPTIM345Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            SPI6Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            USART234578Enable: bool = false, //Reference flag
            USART16Enable: bool = false, //Reference flag
            SPI45Enable: bool = false, //Reference flag
            LTDCEnable: bool = false, //Reference flag
            I2C4Enable: bool = false, //Reference flag
            I2C123Enable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            EnableDFSDMAudio: bool = false, //Reference flag
            SWPEnable: bool = false, //Reference flag
            DFSDMEnable: bool = false, //Reference flag
            CECEnable: bool = false, //Reference flag
            HRTIMEnable: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            PLL2Used: bool = false, //Reference flag
            PLL3Used: bool = false, //Reference flag
            EnablePLLRDSI: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            MCO2I2SEnable: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
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
            ProductRev: ?ProductRevList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            CSICalibrationValue: ?u32 = null,
            HSICalibrationValue: ?u32 = null,
            PLL1_VCO_SEL: ?PLL1_VCO_SELList = null,
            PLL2_VCO_SEL: ?PLL2_VCO_SELList = null,
            PLL3_VCO_SEL: ?PLL3_VCO_SELList = null,
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
            DSICLockSelection: ?DSICLockSelectionList = null,
            DSITX_Div: ?u32 = null,
            PLLDSIIDF: ?PLLDSIIDFList = null,
            PLLDSINDIV: ?u32 = null,
            PLLDSIODF: ?PLLDSIODFList = null,
            D1CPRE: ?D1CPREList = null,
            Cortex_Div: ?Cortex_DivList = null,
            HPRE: ?HPREList = null,
            Cortex2_Div: ?Cortex2_DivList = null,
            D1PPRE: ?D1PPREList = null,
            D2PPRE1: ?D2PPRE1List = null,
            D2PPRE2: ?D2PPRE2List = null,
            D3PPRE: ?D3PPREList = null,
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
            DIVP3: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            DIVQ3: ?u32 = null,
            DIVR3: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            SPI123CLockSelection: ?SPI123CLockSelectionList = null,
            SAI23CLockSelection: ?SAI23CLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
            SAI4BCLockSelection: ?SAI4BCLockSelectionList = null,
            SAI4ACLockSelection: ?SAI4ACLockSelectionList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            I2C123CLockSelection: ?I2C123CLockSelectionList = null,
            I2C4CLockSelection: ?I2C4CLockSelectionList = null,
            SPDIFCLockSelection: ?SPDIFCLockSelectionList = null,
            QSPICLockSelection: ?QSPICLockSelectionList = null,
            FMCCLockSelection: ?FMCCLockSelectionList = null,
            SWPCLockSelection: ?SWPCLockSelectionList = null,
            SDMMC1CLockSelection: ?SDMMC1CLockSelectionList = null,
            DFSDMCLockSelection: ?DFSDMCLockSelectionList = null,
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
            HRTIMCLockSelection: ?HRTIMCLockSelectionList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDiv: HSIDivList,
            traceClkSourceVirtual: traceClkSourceVirtualList,
            SYSCLKSource: SYSCLKSourceList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv1: RCC_MCODiv1List,
            RCC_MCO2Source: RCC_MCO2SourceList,
            RCC_MCODiv2: RCC_MCODiv2List,
            DSIPHY_Div: u32,
            DSICLockSelection: DSICLockSelectionList,
            DSITX_Div: u32,
            PLLDSIIDF: PLLDSIIDFList,
            PLLDSIMult: u32,
            PLLDSINDIV: u32,
            PLLDSIDev: u32,
            PLLDSIODF: PLLDSIODFList,
            D1CPRE: D1CPREList,
            Cortex_Div: Cortex_DivList,
            HPRE: HPREList,
            Cortex2_Div: Cortex2_DivList,
            D1PPRE: D1PPREList,
            D2PPRE1: D2PPRE1List,
            Tim1Mul: u32,
            D2PPRE2: D2PPRE2List,
            Tim2Mul: u32,
            D3PPRE: D3PPREList,
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
            SAI23CLockSelection: SAI23CLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
            SAI4BCLockSelection: SAI4BCLockSelectionList,
            SAI4ACLockSelection: SAI4ACLockSelectionList,
            RNGCLockSelection: RNGCLockSelectionList,
            I2C123CLockSelection: I2C123CLockSelectionList,
            I2C4CLockSelection: I2C4CLockSelectionList,
            SPDIFCLockSelection: SPDIFCLockSelectionList,
            QSPICLockSelection: QSPICLockSelectionList,
            FMCCLockSelection: FMCCLockSelectionList,
            SWPCLockSelection: SWPCLockSelectionList,
            SDMMC1CLockSelection: SDMMC1CLockSelectionList,
            DFSDMCLockSelection: DFSDMCLockSelectionList,
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
            HRTIMCLockSelection: HRTIMCLockSelectionList,
            RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionList,
            VDD_VALUE: f32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
            FLatency: FLatencyList,
            ProductRev: ProductRevList,
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
            ProductRev: ?ProductRevList = null,
            Prescaler: ?PrescalerList = null,
            Polarity: ?PolarityList = null,
            ReloadValueType: ?ReloadValueTypeList = null,
            ReloadValue: ?u32 = null,
            Fsync: ?f32 = null,
            ErrorLimitValue: ?u32 = null,
            HSI48CalibrationValue: ?u32 = null,
            CSICalibrationValue: ?u32 = null,
            HSICalibrationValue: ?u32 = null,
            PLL1_VCO_SEL: ?RCC_PLLVCOSEL = null,
            PLL2_VCO_SEL: ?RCC_PLLVCOSEL = null,
            PLL3_VCO_SEL: ?RCC_PLLVCOSEL = null,
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
                    .ProductRev = self.ProductRev,
                    .Prescaler = self.Prescaler,
                    .Polarity = self.Polarity,
                    .ReloadValueType = self.ReloadValueType,
                    .ReloadValue = self.ReloadValue,
                    .Fsync = self.Fsync,
                    .ErrorLimitValue = self.ErrorLimitValue,
                    .HSI48CalibrationValue = self.HSI48CalibrationValue,
                    .CSICalibrationValue = self.CSICalibrationValue,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .PLL1_VCO_SEL = if (self.PLL1_VCO_SEL) |val| try PLL1_VCO_SELList.from_enum(val) else null,
                    .PLL2_VCO_SEL = if (self.PLL2_VCO_SEL) |val| try PLL2_VCO_SELList.from_enum(val) else null,
                    .PLL3_VCO_SEL = if (self.PLL3_VCO_SEL) |val| try PLL3_VCO_SELList.from_enum(val) else null,
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
            DSICLockSelection: ?RCC_DSISEL = null,
            DSITX_Div: ?u32 = null,
            PLLDSIIDF: ?RCC_PLLDIV = null,
            PLLDSINDIV: ?u32 = null,
            PLLDSIODF: ?RCC_PLLDIV = null,
            D1CPRE: ?D1CPREList = null,
            Cortex_Div: ?Cortex_DivList = null,
            HPRE: ?RCC_HPRE = null,
            Cortex2_Div: ?Cortex2_DivList = null,
            D1PPRE: ?RCC_PPRE = null,
            D2PPRE1: ?RCC_PPRE = null,
            D2PPRE2: ?RCC_PPRE = null,
            D3PPRE: ?RCC_PPRE = null,
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
            DIVP3: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            DIVQ3: ?u32 = null,
            DIVR3: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            SPI123CLockSelection: ?RCC_SAISEL = null,
            SAI23CLockSelection: ?RCC_SAISEL = null,
            SAI1CLockSelection: ?RCC_SAISEL = null,
            SAI4BCLockSelection: ?RCC_SAIASEL = null,
            SAI4ACLockSelection: ?RCC_SAIASEL = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            I2C123CLockSelection: ?RCC_I2C1235SEL = null,
            I2C4CLockSelection: ?RCC_I2C4SEL = null,
            SPDIFCLockSelection: ?RCC_SPDIFRXSEL = null,
            QSPICLockSelection: ?RCC_FMCSEL = null,
            FMCCLockSelection: ?RCC_FMCSEL = null,
            SWPCLockSelection: ?RCC_SWPMISEL = null,
            SDMMC1CLockSelection: ?RCC_SDMMCSEL = null,
            DFSDMCLockSelection: ?RCC_DFSDMSEL = null,
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
            HRTIMCLockSelection: ?RCC_HRTIMSEL = null,
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
                    .DSICLockSelection = if (self.DSICLockSelection) |val| try DSICLockSelectionList.from_enum(val) else null,
                    .DSITX_Div = self.DSITX_Div,
                    .PLLDSIIDF = if (self.PLLDSIIDF) |val| try PLLDSIIDFList.from_enum(val) else null,
                    .PLLDSINDIV = self.PLLDSINDIV,
                    .PLLDSIODF = if (self.PLLDSIODF) |val| try PLLDSIODFList.from_enum(val) else null,
                    .D1CPRE = self.D1CPRE,
                    .Cortex_Div = self.Cortex_Div,
                    .HPRE = if (self.HPRE) |val| try HPREList.from_enum(val) else null,
                    .Cortex2_Div = self.Cortex2_Div,
                    .D1PPRE = if (self.D1PPRE) |val| try D1PPREList.from_enum(val) else null,
                    .D2PPRE1 = if (self.D2PPRE1) |val| try D2PPRE1List.from_enum(val) else null,
                    .D2PPRE2 = if (self.D2PPRE2) |val| try D2PPRE2List.from_enum(val) else null,
                    .D3PPRE = if (self.D3PPRE) |val| try D3PPREList.from_enum(val) else null,
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
                    .DIVP3 = self.DIVP3,
                    .PLL3FRACN = self.PLL3FRACN,
                    .DIVQ3 = self.DIVQ3,
                    .DIVR3 = self.DIVR3,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .SPI123CLockSelection = if (self.SPI123CLockSelection) |val| try SPI123CLockSelectionList.from_enum(val) else null,
                    .SAI23CLockSelection = if (self.SAI23CLockSelection) |val| try SAI23CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
                    .SAI4BCLockSelection = if (self.SAI4BCLockSelection) |val| try SAI4BCLockSelectionList.from_enum(val) else null,
                    .SAI4ACLockSelection = if (self.SAI4ACLockSelection) |val| try SAI4ACLockSelectionList.from_enum(val) else null,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .I2C123CLockSelection = if (self.I2C123CLockSelection) |val| try I2C123CLockSelectionList.from_enum(val) else null,
                    .I2C4CLockSelection = if (self.I2C4CLockSelection) |val| try I2C4CLockSelectionList.from_enum(val) else null,
                    .SPDIFCLockSelection = if (self.SPDIFCLockSelection) |val| try SPDIFCLockSelectionList.from_enum(val) else null,
                    .QSPICLockSelection = if (self.QSPICLockSelection) |val| try QSPICLockSelectionList.from_enum(val) else null,
                    .FMCCLockSelection = if (self.FMCCLockSelection) |val| try FMCCLockSelectionList.from_enum(val) else null,
                    .SWPCLockSelection = if (self.SWPCLockSelection) |val| try SWPCLockSelectionList.from_enum(val) else null,
                    .SDMMC1CLockSelection = if (self.SDMMC1CLockSelection) |val| try SDMMC1CLockSelectionList.from_enum(val) else null,
                    .DFSDMCLockSelection = if (self.DFSDMCLockSelection) |val| try DFSDMCLockSelectionList.from_enum(val) else null,
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
                    .HRTIMCLockSelection = if (self.HRTIMCLockSelection) |val| try HRTIMCLockSelectionList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDiv: RCC_HSIDIV,
            traceClkSourceVirtual: traceClkSourceVirtualList,
            SYSCLKSource: RCC_SW,
            RCC_MCO1Source: RCC_MCO1SEL,
            RCC_MCODiv1: RCC_MCOPRE,
            RCC_MCO2Source: RCC_MCO2SEL,
            RCC_MCODiv2: RCC_MCOPRE,
            DSIPHY_Div: u32,
            DSICLockSelection: RCC_DSISEL,
            DSITX_Div: u32,
            PLLDSIIDF: RCC_PLLDIV,
            PLLDSIMult: u32,
            PLLDSINDIV: u32,
            PLLDSIDev: u32,
            PLLDSIODF: RCC_PLLDIV,
            D1CPRE: D1CPREList,
            Cortex_Div: Cortex_DivList,
            HPRE: RCC_HPRE,
            Cortex2_Div: Cortex2_DivList,
            D1PPRE: RCC_PPRE,
            D2PPRE1: RCC_PPRE,
            Tim1Mul: u32,
            D2PPRE2: RCC_PPRE,
            Tim2Mul: u32,
            D3PPRE: RCC_PPRE,
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
            SAI23CLockSelection: RCC_SAISEL,
            SAI1CLockSelection: RCC_SAISEL,
            SAI4BCLockSelection: RCC_SAIASEL,
            SAI4ACLockSelection: RCC_SAIASEL,
            RNGCLockSelection: RCC_RNGSEL,
            I2C123CLockSelection: RCC_I2C1235SEL,
            I2C4CLockSelection: RCC_I2C4SEL,
            SPDIFCLockSelection: RCC_SPDIFRXSEL,
            QSPICLockSelection: RCC_FMCSEL,
            FMCCLockSelection: RCC_FMCSEL,
            SWPCLockSelection: RCC_SWPMISEL,
            SDMMC1CLockSelection: RCC_SDMMCSEL,
            DFSDMCLockSelection: RCC_DFSDMSEL,
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
            HRTIMCLockSelection: RCC_HRTIMSEL,
            RCC_TIM_PRescaler_Selection: RCC_TIMPRE,
            VDD_VALUE: f32,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,
            FLatency: FLatencyList,
            ProductRev: ProductRevList,
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
                    .traceClkSourceVirtual = cubemx_config.traceClkSourceVirtual,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv1 = try cubemx_config.RCC_MCODiv1.to_enum(),
                    .RCC_MCO2Source = try cubemx_config.RCC_MCO2Source.to_enum(),
                    .RCC_MCODiv2 = try cubemx_config.RCC_MCODiv2.to_enum(),
                    .DSIPHY_Div = cubemx_config.DSIPHY_Div,
                    .DSICLockSelection = try cubemx_config.DSICLockSelection.to_enum(),
                    .DSITX_Div = cubemx_config.DSITX_Div,
                    .PLLDSIIDF = try cubemx_config.PLLDSIIDF.to_enum(),
                    .PLLDSIMult = cubemx_config.PLLDSIMult,
                    .PLLDSINDIV = cubemx_config.PLLDSINDIV,
                    .PLLDSIDev = cubemx_config.PLLDSIDev,
                    .PLLDSIODF = try cubemx_config.PLLDSIODF.to_enum(),
                    .D1CPRE = cubemx_config.D1CPRE,
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .HPRE = try cubemx_config.HPRE.to_enum(),
                    .Cortex2_Div = cubemx_config.Cortex2_Div,
                    .D1PPRE = try cubemx_config.D1PPRE.to_enum(),
                    .D2PPRE1 = try cubemx_config.D2PPRE1.to_enum(),
                    .Tim1Mul = cubemx_config.Tim1Mul,
                    .D2PPRE2 = try cubemx_config.D2PPRE2.to_enum(),
                    .Tim2Mul = cubemx_config.Tim2Mul,
                    .D3PPRE = try cubemx_config.D3PPRE.to_enum(),
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
                    .SAI23CLockSelection = try cubemx_config.SAI23CLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
                    .SAI4BCLockSelection = try cubemx_config.SAI4BCLockSelection.to_enum(),
                    .SAI4ACLockSelection = try cubemx_config.SAI4ACLockSelection.to_enum(),
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .I2C123CLockSelection = try cubemx_config.I2C123CLockSelection.to_enum(),
                    .I2C4CLockSelection = try cubemx_config.I2C4CLockSelection.to_enum(),
                    .SPDIFCLockSelection = try cubemx_config.SPDIFCLockSelection.to_enum(),
                    .QSPICLockSelection = try cubemx_config.QSPICLockSelection.to_enum(),
                    .FMCCLockSelection = try cubemx_config.FMCCLockSelection.to_enum(),
                    .SWPCLockSelection = try cubemx_config.SWPCLockSelection.to_enum(),
                    .SDMMC1CLockSelection = try cubemx_config.SDMMC1CLockSelection.to_enum(),
                    .DFSDMCLockSelection = try cubemx_config.DFSDMCLockSelection.to_enum(),
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
                    .HRTIMCLockSelection = try cubemx_config.HRTIMCLockSelection.to_enum(),
                    .RCC_TIM_PRescaler_Selection = try cubemx_config.RCC_TIM_PRescaler_Selection.to_enum(),
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
                    .LSE_Drive_Capability = if (cubemx_config.LSE_Drive_Capability) |val| try val.to_enum() else null,
                    .FLatency = cubemx_config.FLatency,
                    .ProductRev = cubemx_config.ProductRev,
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
            traceClkSource: u32 = 0,
            TraceCLKOutput: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            MCO1Mult: u32 = 0,
            MCO1Div: u32 = 0,
            MCO1Pin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            DSIPHYPrescaler: u32 = 0,
            DSIMult: u32 = 0,
            DSIoutput: u32 = 0,
            DSITXPrescaler: u32 = 0,
            DSITXCLKEsc: u32 = 0,
            PLLDSIIDF: u32 = 0,
            PLLDSIMultiplicator: u32 = 0,
            PLLDSINDIV: u32 = 0,
            VCOoutput: u32 = 0,
            PLLDSIDevisor: u32 = 0,
            PLLDSIODF: u32 = 0,
            PLLDSIoutput: u32 = 0,
            D1CPRE: u32 = 0,
            D1CPREOutput: u32 = 0,
            CpuClockOutput: u32 = 0,
            CortexPrescaler: u32 = 0,
            CortexSysOutput: u32 = 0,
            HPRE: u32 = 0,
            AHBOutput: u32 = 0,
            Cortex2Prescaler: u32 = 0,
            CPU2ClockOutput: u32 = 0,
            CPU2SystikOutput: u32 = 0,
            AXIClockOutput: u32 = 0,
            HCLK3Output: u32 = 0,
            D1PPRE: u32 = 0,
            APB3Output: u32 = 0,
            D2PPRE1: u32 = 0,
            Tim1Mul: u32 = 0,
            Tim1Output: u32 = 0,
            AHB12Output: u32 = 0,
            APB1Output: u32 = 0,
            D2PPRE2: u32 = 0,
            APB2Output: u32 = 0,
            Tim2Mul: u32 = 0,
            Tim2Output: u32 = 0,
            AHB4Output: u32 = 0,
            D3PPRE: u32 = 0,
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
            DIVP3: u32 = 0,
            PLL3FRACN: u32 = 0,
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
            SPI123Mult: u32 = 0,
            SPI123output: u32 = 0,
            SAI23Mult: u32 = 0,
            SAI23output: u32 = 0,
            SAI1Mult: u32 = 0,
            DFSDMACLKoutput: u32 = 0,
            SAI1output: u32 = 0,
            SAI4BMult: u32 = 0,
            SAI4Boutput: u32 = 0,
            SAI4AMult: u32 = 0,
            SAI4Aoutput: u32 = 0,
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
            HrtimMult: u32 = 0,
            HRTIMoutput: u32 = 0,
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

            if (@inComptime()) @setEvalBranchQuota(1000000);
            var out = ClockOutput{};
            var ref_out: CubeMXOutputConfig = undefined;

            var TRACECLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var TRACECLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var TRACECLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var TRACECLKSOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var DSISourceisPLLR: bool = false; //semaphore for processing, not an actual flag in the output;
            var DSISourceisDSIPHY: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var D2PPRE1_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var D2PPRE1_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var D2PPRE1_4: bool = false; //semaphore for processing, not an actual flag in the output;
            var D2PPRE2_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var D2PPRE2_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var D2PPRE2_4: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var SAI23CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI23CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI23CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI23CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI23CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4BCLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4BCLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4BCLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4BCLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4BCLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4ACLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4ACLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4ACLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4ACLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI4ACLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var USART16CLKSOURCE_PCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART16CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var HRTIMCLKSOURCE_PCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var HRTIMCLKSOURCE_CPU1: bool = false; //semaphore for processing, not an actual flag in the output;
            var TimPrescalerEnabled: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var DSIPHYPrescaler = ClockNode{
                .name = "DSIPHYPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DSIMult = ClockNode{
                .name = "DSIMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DSIoutput = ClockNode{
                .name = "DSIoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DSITXPrescaler = ClockNode{
                .name = "DSITXPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DSITXCLKEsc = ClockNode{
                .name = "DSITXCLKEsc",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDSIIDF = ClockNode{
                .name = "PLLDSIIDF",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDSIMultiplicator = ClockNode{
                .name = "PLLDSIMultiplicator",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDSINDIV = ClockNode{
                .name = "PLLDSINDIV",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOoutput = ClockNode{
                .name = "VCOoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDSIDevisor = ClockNode{
                .name = "PLLDSIDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDSIODF = ClockNode{
                .name = "PLLDSIODF",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLDSIoutput = ClockNode{
                .name = "PLLDSIoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var D1CPRE = ClockNode{
                .name = "D1CPRE",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var D1CPREOutput = ClockNode{
                .name = "D1CPREOutput",
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

            var Cortex2Prescaler = ClockNode{
                .name = "Cortex2Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CPU2ClockOutput = ClockNode{
                .name = "CPU2ClockOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CPU2SystikOutput = ClockNode{
                .name = "CPU2SystikOutput",
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

            var D1PPRE = ClockNode{
                .name = "D1PPRE",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB3Output = ClockNode{
                .name = "APB3Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var D2PPRE1 = ClockNode{
                .name = "D2PPRE1",
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

            var D2PPRE2 = ClockNode{
                .name = "D2PPRE2",
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

            var D3PPRE = ClockNode{
                .name = "D3PPRE",
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

            var DIVP3 = ClockNode{
                .name = "DIVP3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3FRACN = ClockNode{
                .name = "PLL3FRACN",
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

            var SAI23Mult = ClockNode{
                .name = "SAI23Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI23output = ClockNode{
                .name = "SAI23output",
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

            var SAI4BMult = ClockNode{
                .name = "SAI4BMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI4Boutput = ClockNode{
                .name = "SAI4Boutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI4AMult = ClockNode{
                .name = "SAI4AMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI4Aoutput = ClockNode{
                .name = "SAI4Aoutput",
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

            var HrtimMult = ClockNode{
                .name = "HrtimMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HRTIMoutput = ClockNode{
                .name = "HRTIMoutput",
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
                        .min = 4e6,
                        .max = 5e7,
                        .main_expr = "HSEByPass",
                        .main_dialog = "HSEByPass",
                    };
                    break :blk user_val orelse 2.5e7;
                } else if (config.flags.HSEOscillator) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 4e6,
                        .max = 4.8e7,
                        .main_expr = "HSEOscillator",
                        .main_dialog = "HSEOscillator",
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
                    .min = 0e0,
                    .max = 1e6,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 3.2768e4;
            };

            const CSI_VALUEValue: f32 = blk: {
                break :blk 4e6;
            };

            const RC48_VALUEValue: f32 = blk: {
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

            const traceClkSourceVirtualValue: traceClkSourceVirtualList = blk: {
                if (!(config.flags.DEBUG_Used) or SYSCLKSOURCE_HSI) {
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

            const DSIPHY_DivValue: u32 = blk: {
                break :blk 8;
            };

            const DSICLockSelectionValue: DSICLockSelectionList = blk: {
                const user_val = config.DSICLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DSICLKSOURCE_PLL2 => DSISourceisPLLR = true,
                        .RCC_DSICLKSOURCE_PHY => DSISourceisDSIPHY = true,
                    }
                }
                break :blk user_val orelse {
                    DSISourceisDSIPHY = true;
                    break :blk .RCC_DSICLKSOURCE_PHY;
                };
            };

            const DSITX_DivValue: u32 = blk: {
                const user_val = config.DSITX_Div;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DSITX_Div",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 32) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DSITX_Div",
                            "Else",
                            "No additional information",
                            32,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 4;
            };

            const PLLDSIIDFValue: PLLDSIIDFList = blk: {
                const user_val = config.PLLDSIIDF;

                if (user_val) |val| {
                    switch (val) {
                        .DSI_PLL_IN_DIV1 => {},
                        .DSI_PLL_IN_DIV2 => {},
                        .DSI_PLL_IN_DIV3 => {},
                        .DSI_PLL_IN_DIV4 => {},
                        .DSI_PLL_IN_DIV5 => {},
                        .DSI_PLL_IN_DIV6 => {},
                        .DSI_PLL_IN_DIV7 => {},
                    }
                }
                break :blk user_val orelse .DSI_PLL_IN_DIV1;
            };

            const PLLDSIMultValue: u32 = blk: {
                break :blk 2;
            };

            const PLLDSINDIVValue: u32 = blk: {
                const user_val = config.PLLDSINDIV;
                if (user_val) |val| {
                    if (val < 10) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLDSINDIV",
                            "Else",
                            "No additional information",
                            10,
                            val,
                        });
                    }
                    if (val > 125) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLDSINDIV",
                            "Else",
                            "No additional information",
                            125,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 20;
            };

            const PLLDSIDevValue: u32 = blk: {
                break :blk 2;
            };

            const PLLDSIODFValue: PLLDSIODFList = blk: {
                const user_val = config.PLLDSIODF;

                if (user_val) |val| {
                    switch (val) {
                        .DSI_PLL_OUT_DIV1 => {},
                        .DSI_PLL_OUT_DIV2 => {},
                        .DSI_PLL_OUT_DIV4 => {},
                        .DSI_PLL_OUT_DIV8 => {},
                    }
                }
                break :blk user_val orelse .DSI_PLL_OUT_DIV1;
            };

            const D1CPREValue: D1CPREList = blk: {
                const user_val = config.D1CPRE;

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

            const Cortex2_DivValue: Cortex2_DivList = blk: {
                const user_val = config.Cortex2_Div;

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

            const D1PPREValue: D1PPREList = blk: {
                const user_val = config.D1PPRE;

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

            const D2PPRE1Value: D2PPRE1List = blk: {
                const user_val = config.D2PPRE1;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB1_DIV1 => D2PPRE1_1 = true,
                        .RCC_APB1_DIV2 => D2PPRE1_2 = true,
                        .RCC_APB1_DIV4 => D2PPRE1_4 = true,
                        .RCC_APB1_DIV8 => {},
                        .RCC_APB1_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    D2PPRE1_1 = true;
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
                if (((D2PPRE1_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((D2PPRE1_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((D2PPRE1_2) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((D2PPRE1_4) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                }
                break :blk 2;
            };

            const D2PPRE2Value: D2PPRE2List = blk: {
                const user_val = config.D2PPRE2;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB2_DIV1 => D2PPRE2_1 = true,
                        .RCC_APB2_DIV2 => D2PPRE2_2 = true,
                        .RCC_APB2_DIV4 => D2PPRE2_4 = true,
                        .RCC_APB2_DIV8 => {},
                        .RCC_APB2_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    D2PPRE2_1 = true;
                    break :blk .RCC_APB2_DIV1;
                };
            };

            const Tim2MulValue: u32 = blk: {
                if (((D2PPRE2_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DESACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((D2PPRE2_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((D2PPRE2_2) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((D2PPRE2_4) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                }
                break :blk 2;
            };

            const D3PPREValue: D3PPREList = blk: {
                const user_val = config.D3PPRE;

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
                if (((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) and (USBCLKSOURCE_PLL3Q or USBCLKSOURCE_PLL1Q))) {
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
                                "((USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC)& (USBCLKSOURCE_PLL3Q|USBCLKSOURCE_PLL1Q)) ",
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
                    if (val < 4) {
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
                            "DIVN1",
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
                    if (val < 4) {
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
                            "DIVN2",
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
                    if (val < 4) {
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
                            "DIVN3",
                            "Else",
                            "No additional information",
                            512,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 129;
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

            const PLL3FRACNValue: u32 = blk: {
                const user_val = config.PLL3FRACN;
                PLL3FRACN.limit = .{
                    .min = 0,
                    .max = 8191,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 0;
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

            const SAI23CLockSelectionValue: SAI23CLockSelectionList = blk: {
                const user_val = config.SAI23CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI23CLKSOURCE_PLL => SAI23CLKSOURCE_PLLQ1 = true,
                        .RCC_SAI23CLKSOURCE_PLL2 => SAI23CLKSOURCE_PLLP2 = true,
                        .RCC_SAI23CLKSOURCE_PLL3 => SAI23CLKSOURCE_PLLP3 = true,
                        .RCC_SAI23CLKSOURCE_PIN => SAI23CLKSOURCE_CKIN = true,
                        .RCC_SAI23CLKSOURCE_CLKP => SAI23CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SAI23CLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI23CLKSOURCE_PLL;
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

            const SAI4BCLockSelectionValue: SAI4BCLockSelectionList = blk: {
                const user_val = config.SAI4BCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI4BCLKSOURCE_PLL => SAI4BCLKSOURCE_PLLQ1 = true,
                        .RCC_SAI4BCLKSOURCE_PLL2 => SAI4BCLKSOURCE_PLLP2 = true,
                        .RCC_SAI4BCLKSOURCE_PLL3 => SAI4BCLKSOURCE_PLLP3 = true,
                        .RCC_SAI4BCLKSOURCE_PIN => SAI4BCLKSOURCE_CKIN = true,
                        .RCC_SAI4BCLKSOURCE_CLKP => SAI4BCLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SAI4BCLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI4BCLKSOURCE_PLL;
                };
            };

            const SAI4ACLockSelectionValue: SAI4ACLockSelectionList = blk: {
                const user_val = config.SAI4ACLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI4ACLKSOURCE_PLL => SAI4ACLKSOURCE_PLLQ1 = true,
                        .RCC_SAI4ACLKSOURCE_PLL2 => SAI4ACLKSOURCE_PLLP2 = true,
                        .RCC_SAI4ACLKSOURCE_PLL3 => SAI4ACLKSOURCE_PLLP3 = true,
                        .RCC_SAI4ACLKSOURCE_PIN => SAI4ACLKSOURCE_CKIN = true,
                        .RCC_SAI4ACLKSOURCE_CLKP => SAI4ACLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SAI4ACLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI4ACLKSOURCE_PLL;
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
                        .RCC_QSPICLKSOURCE_D1HCLK => QSPICLKSOURCE_HCLK3 = true,
                        .RCC_QSPICLKSOURCE_PLL => QSPICLKSOURCE_PLL1Q = true,
                        .RCC_QSPICLKSOURCE_PLL2 => QSPICLKSOURCE_PLL2R = true,
                        .RCC_QSPICLKSOURCE_CLKP => QSPICLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    QSPICLKSOURCE_HCLK3 = true;
                    break :blk .RCC_QSPICLKSOURCE_D1HCLK;
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

            const USART16CLockSelectionValue: USART16CLockSelectionList = blk: {
                const user_val = config.USART16CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART16CLKSOURCE_D2PCLK2 => USART16CLKSOURCE_PCLK2 = true,
                        .RCC_USART16CLKSOURCE_PLL2 => USART16CLKSOURCE_PLLQ2 = true,
                        .RCC_USART16CLKSOURCE_PLL3 => USART16CLKSOURCE_PLLQ3 = true,
                        .RCC_USART16CLKSOURCE_HSI => USART16CLKSOURCE_HSI = true,
                        .RCC_USART16CLKSOURCE_CSI => USART16CLKSOURCE_CSI = true,
                        .RCC_USART16CLKSOURCE_LSE => USART16CLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART16CLKSOURCE_PCLK2 = true;
                    break :blk .RCC_USART16CLKSOURCE_D2PCLK2;
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
                        .RCC_LPTIM345CLKSOURCE_D3PCLK1 => LPTIM345CLKSOURCE_PCLK4 = true,
                        .RCC_LPTIM345CLKSOURCE_PLL2 => LPTIM345CLKSOURCE_PLLP2 = true,
                        .RCC_LPTIM345CLKSOURCE_PLL3 => LPTIM345CLKSOURCE_PLLR3 = true,
                        .RCC_LPTIM345CLKSOURCE_LSE => LPTIM345CLKSOURCE_LSE = true,
                        .RCC_LPTIM345CLKSOURCE_LSI => LPTIM345CLKSOURCE_LSI = true,
                        .RCC_LPTIM345CLKSOURCE_CLKP => LPTIM345CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM345CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_LPTIM345CLKSOURCE_D3PCLK1;
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

            const HRTIMCLockSelectionValue: HRTIMCLockSelectionList = blk: {
                const user_val = config.HRTIMCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HRTIM1CLK_TIMCLK => HRTIMCLKSOURCE_PCLK2 = true,
                        .RCC_HRTIM1CLK_CPUCLK => HRTIMCLKSOURCE_CPU1 = true,
                    }
                }
                break :blk user_val orelse {
                    HRTIMCLKSOURCE_PCLK2 = true;
                    break :blk .RCC_HRTIM1CLK_TIMCLK;
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
                if (config.flags.CRSActivatedSourceLSE or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC)) or (config.flags.MCO1Config and MCO1SOURCE_LSE) or (LPTIM1CLKSOURCE_LSE and config.flags.LPTIM1Used_ForRCC) or (CECCLKSOURCE_LSE and config.flags.CECUsed_ForRCC) or (RNGCLKSOURCE_LSE and config.flags.RNGUsed_ForRCC) or (LPTIM2CLKSOURCE_LSE and config.flags.LPTIM2Used_ForRCC) or (LPUART1CLKSOURCE_LSE and config.flags.LPUARTUsed_ForRCC) or (USART16CLKSOURCE_LSE and (config.flags.USART1Used_ForRCC or config.flags.USART6Used_ForRCC)) or (USART2CLKSOURCE_LSE and (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC)) or (LPTIM345CLKSOURCE_LSE and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC))) {
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

            const ProductRevValue: ProductRevList = blk: {
                if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H742")) {
                    if (config.extra_config.ProductRev) |val| {
                        if (val != .revV) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "ProductRev",
                                "STM32H745_755|STM32H747_757|STM32H742",
                                "revY is not available for STM32H745_755,STM32H747_757,STM32H742",
                                "revV",
                                val,
                            });
                        }
                    }
                    break :blk .revV;
                }
                const user_val = config.extra_config.ProductRev;

                if (user_val) |val| {
                    switch (val) {
                        .revV => {},
                        .revY => {},
                    }
                }
                break :blk user_val orelse .revV;
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
                } else if (config.flags.CRSActivatedSourceUSB and config.flags.USB_OTG_FSUsed_ForRCC) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB2;
                } else if (config.flags.CRSActivatedSourceUSB and (config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB1;
                }
                break :blk null;
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

            const CSICalibrationValueValue: u32 = blk: {
                if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
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
                                "ProductRev=revY",
                                "CSI Calibration Value depending on Product revision",
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
                                "ProductRev=revY",
                                "CSI Calibration Value depending on Product revision",
                                31,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 16;
                } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revV, .@"=")) {
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
                                "ProductRev=revV",
                                "CSI Calibration Value depending on Product revision",
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
                                "CSICalibrationValue",
                                "ProductRev=revV",
                                "CSI Calibration Value depending on Product revision",
                                63,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 32;
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

            const HSICalibrationValueValue: u32 = blk: {
                if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
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
                                "ProductRev=revY",
                                "HSI Calibration Value depending on Product revision",
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
                                "HSICalibrationValue",
                                "ProductRev=revY",
                                "HSI Calibration Value depending on Product revision",
                                63,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 32;
                } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revV, .@"=")) {
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
                                "ProductRev=revV",
                                "HSI Calibration Value depending on Product revision",
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
                                "ProductRev=revV",
                                "HSI Calibration Value depending on Product revision",
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
                    if (val > 63) {
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
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 32;
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

            const TraceEnableValue: TraceEnableList = blk: {
                break :blk .auto;
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

            const EnableHSEDSIValue: EnableHSEDSIList = blk: {
                if ((config.flags.DSIUsed_ForRCC) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableDSIValue: EnableDSIList = blk: {
                if (config.flags.DSIUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const cKPerEnableValue: cKPerEnableList = blk: {
                if ((config.flags.QUADSPIUsed_ForRCC) or (config.flags.FMCUsed_ForRCC) or (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)) or (config.flags.LPTIM1Used_ForRCC) or (config.flags.SAI4_SAIBUsed_ForRCC) or (config.flags.SAI4_SAIAUsed_ForRCC) or (((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))) or (config.flags.LPTIM2Used_ForRCC) or (config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC or config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) or (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC) or (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1) or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)) {
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

            const SAI4AEnableValue: SAI4AEnableList = blk: {
                if (config.flags.SAI4_SAIAUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI4BEnableValue: SAI4BEnableList = blk: {
                if (config.flags.SAI4_SAIBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI23EnableValue: SAI23EnableList = blk: {
                if (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC) {
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
                if (config.flags.SPDIFRX1Used_ForRCC) {
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

            const QuadSPIEnableValue: QuadSPIEnableList = blk: {
                if (config.flags.QUADSPIUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const TraceEnablePllValue: TraceEnablePllList = blk: {
                if (config.flags.DEBUG_Used) {
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
                if (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC) {
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

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIM1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI6EnableValue: SPI6EnableList = blk: {
                if (config.flags.SPI6Used_ForRCC) {
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

            const USART16EnableValue: USART16EnableList = blk: {
                if (config.flags.USART1Used_ForRCC or config.flags.USART6Used_ForRCC) {
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
                if (config.flags.IWDG1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableDFSDMAudioValue: EnableDFSDMAudioList = blk: {
                if (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1) {
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

            const CECEnableValue: CECEnableList = blk: {
                if (config.flags.CECUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HRTIMEnableValue: HRTIMEnableList = blk: {
                if (config.flags.HRTIMUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const PLLUsedValue: u1 = blk: {
                if (TRACECLKSOURCE_PLLCLK and (config.flags.DEBUG_Used) or (SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config) or (SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLQ1 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLQ1 and config.flags.SAI4_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL1Q and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2UsedValue: u1 = blk: {
                if (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP2 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP2 and config.flags.SAI4_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))) or (USART16CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)) or (SPDIFCLKSOURCE_PLL2R and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL2R and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3UsedValue: u1 = blk: {
                if (config.flags.LTDCUsed_ForRCC or (SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP3 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP3 and config.flags.SAI4_SAIAUsed_ForRCC) or (USART16CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) or (I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and config.flags.SPDIFRX1Used_ForRCC) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnablePLLRDSIValue: EnablePLLRDSIList = blk: {
                break :blk .false;
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

            const cKPerUsedValue: u1 = blk: {
                if ((QSPICLKSOURCE_PER and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PER and config.flags.FMCUsed_ForRCC) or (SAI1CLKSOURCE_PER and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (LPTIM1CLKSOURCE_PER and config.flags.LPTIM1Used_ForRCC) or (SAI4BCLKSOURCE_PER and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PER and config.flags.SAI4_SAIAUsed_ForRCC) or (ADCCLKSOURCE_PER and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))) or (LPTIM2CLKSOURCE_PER and config.flags.LPTIM2Used_ForRCC) or (SPI123CLKSOURCE_PER and (config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PER and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (LPTIM345CLKSOURCE_PER and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if (TRACECLKSOURCE_HSI and (config.flags.DEBUG_Used) or (config.flags.MCO1Config and MCO1SOURCE_HSI) or (PLLSOURCE_HSI and ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=") or check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) or (config.flags.MCO2Config and MCO2SOURCE_PLL2PCLK))) or (PERSOURCE_HSI and (check_ref(@TypeOf(cKPerUsedValue), cKPerUsedValue, 1, .@"="))) or (SYSCLKSOURCE_HSI) or (I2C4CLKSOURCE_HSI and config.flags.I2C4Used_ForRCC) or (I2C123CLKSOURCE_HSI and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (SPDIFCLKSOURCE_HSI and config.flags.SPDIFRX1Used_ForRCC) or (SWPCLKSOURCE_HSI and config.flags.SWPMI1Used_ForRCC) or (USART16CLKSOURCE_HSI and (config.flags.USART1Used_ForRCC or config.flags.USART6Used_ForRCC)) or (USART2CLKSOURCE_HSI and (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC)) or (LPUART1CLKSOURCE_HSI and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_HSI and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_HSI and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
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
                if ((USBCLKSOURCE_RC48 and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) or (MCO1SOURCE_RC48 and config.flags.MCO1Config) or (RNGCLKSOURCE_RC48 and config.flags.RNGUsed_ForRCC) or config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB) {
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
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE CSIRC ======
            CSIRC.nodetype = .source;
            CSIRC.value = CSI_VALUEValue;

            // ======= NODE RC48 ======
            RC48.nodetype = .source;
            RC48.value = RC48_VALUEValue;

            // ======= NODE I2S_CKIN ======
            I2S_CKIN.nodetype = .source;
            I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;

            // ======= NODE traceClkSource ======

            traceClkSource.is_auto = true;
            traceClkSource.nodetype = .multi;
            traceClkSource.parents = switch (traceClkSourceVirtualValue) {
                .RCC_TRACECLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_TRACECLKSOURCE_CSI => &.{&CSIRC},
                .RCC_TRACECLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_TRACECLKSOURCE_PLLCLK => &.{&DIVR1},
            };

            // ======= NODE TraceCLKOutput ======

            TraceCLKOutput.is_auto = true;
            TraceCLKOutput.nodetype = .output;
            TraceCLKOutput.parents = &.{&traceClkSource};

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
            MCO1Mult.nodetype = .multi;
            MCO1Mult.parents = switch (RCC_MCO1SourceValue) {
                .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_HSI => &.{&HSIDiv},
                .RCC_MCO1SOURCE_HSI48 => &.{&RC48},
                .RCC_MCO1SOURCE_PLL1QCLK => &.{&DIVQ1},
            };

            // ======= NODE MCO1Div ======
            MCO1Div.nodetype = .div;
            MCO1Div.value = try RCC_MCODiv1Value.get();
            MCO1Div.parents = &.{&MCO1Mult};

            // ======= NODE MCO1Pin ======
            MCO1Pin.nodetype = .output;
            MCO1Pin.parents = &.{&MCO1Div};

            // ======= NODE MCO2Mult ======
            MCO2Mult.nodetype = .multi;
            MCO2Mult.parents = switch (RCC_MCO2SourceValue) {
                .RCC_MCO2SOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_MCO2SOURCE_PLL2PCLK => &.{&DIVP2},
                .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO2SOURCE_PLLCLK => &.{&DIVP1},
                .RCC_MCO2SOURCE_CSICLK => &.{&CSIRC},
                .RCC_MCO2SOURCE_LSICLK => &.{&LSIRC},
            };

            // ======= NODE MCO2Div ======
            MCO2Div.nodetype = .div;
            MCO2Div.value = try RCC_MCODiv2Value.get();
            MCO2Div.parents = &.{&MCO2Mult};

            // ======= NODE MCO2Pin ======
            MCO2Pin.nodetype = .output;
            MCO2Pin.parents = &.{&MCO2Div};

            // ======= NODE DSIPHYPrescaler ======
            if ((check_MCU("DSIHOST_Exist"))) {
                DSIPHYPrescaler.nodetype = .div;
                DSIPHYPrescaler.value = @floatFromInt(DSIPHY_DivValue);
                DSIPHYPrescaler.parents = &.{&PLLDSIODF};
            }
            // ======= NODE DSIMult ======
            if ((check_MCU("DSIHOST_Exist"))) {
                DSIMult.nodetype = .multi;
                DSIMult.parents = switch (DSICLockSelectionValue) {
                    .RCC_DSICLKSOURCE_PLL2 => &.{&DIVQ2},
                    .RCC_DSICLKSOURCE_PHY => &.{&DSIPHYPrescaler},
                };
            }
            // ======= NODE DSIoutput ======
            if ((check_MCU("DSIHOST_Exist"))) {
                DSIoutput.nodetype = .output;
                DSIoutput.parents = &.{&DSIMult};
            }
            // ======= NODE DSITXPrescaler ======
            if ((check_MCU("DSIHOST_Exist"))) {
                DSITXPrescaler.nodetype = .div;
                DSITXPrescaler.value = @floatFromInt(DSITX_DivValue);
                DSITXPrescaler.parents = &.{&DSIMult};
            }
            // ======= NODE DSITXCLKEsc ======
            if ((check_MCU("DSIHOST_Exist"))) {
                DSITXCLKEsc.nodetype = .output;
                DSITXCLKEsc.parents = &.{&DSITXPrescaler};
            }
            // ======= NODE PLLDSIIDF ======
            if ((check_MCU("DSIHOST_Exist"))) {
                PLLDSIIDF.nodetype = .div;
                PLLDSIIDF.value = try PLLDSIIDFValue.get();
                PLLDSIIDF.parents = &.{&HSEOSC};
            }
            // ======= NODE PLLDSIMultiplicator ======
            if ((check_MCU("DSIHOST_Exist"))) {
                PLLDSIMultiplicator.nodetype = .mul;
                PLLDSIMultiplicator.value = @floatFromInt(PLLDSIMultValue);
                PLLDSIMultiplicator.parents = &.{&PLLDSIIDF};
            }
            // ======= NODE PLLDSINDIV ======
            if ((check_MCU("DSIHOST_Exist"))) {
                PLLDSINDIV.nodetype = .mul;
                PLLDSINDIV.value = @floatFromInt(PLLDSINDIVValue);
                PLLDSINDIV.parents = &.{&PLLDSIMultiplicator};
            }
            // ======= NODE VCOoutput ======
            if ((check_MCU("DSIHOST_Exist"))) {
                VCOoutput.nodetype = .output;
                VCOoutput.parents = &.{&PLLDSINDIV};
            }
            // ======= NODE PLLDSIDevisor ======
            if ((check_MCU("DSIHOST_Exist"))) {
                PLLDSIDevisor.nodetype = .div;
                PLLDSIDevisor.value = @floatFromInt(PLLDSIDevValue);
                PLLDSIDevisor.parents = &.{&VCOoutput};
            }
            // ======= NODE PLLDSIODF ======
            if ((check_MCU("DSIHOST_Exist"))) {
                PLLDSIODF.nodetype = .div;
                PLLDSIODF.value = try PLLDSIODFValue.get();
                PLLDSIODF.parents = &.{&PLLDSIDevisor};
            }
            // ======= NODE PLLDSIoutput ======
            if ((check_MCU("DSIHOST_Exist"))) {
                PLLDSIoutput.nodetype = .output;
                PLLDSIoutput.parents = &.{&PLLDSIODF};
            }
            // ======= NODE D1CPRE ======
            D1CPRE.nodetype = .div;
            D1CPRE.value = try D1CPREValue.get();
            D1CPRE.parents = &.{&SysCLKOutput};

            // ======= NODE D1CPREOutput ======
            D1CPREOutput.nodetype = .output;
            D1CPREOutput.parents = &.{&D1CPRE};

            // ======= NODE CpuClockOutput ======
            if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H7x5")) {
                CpuClockOutput.nodetype = .output;
                CpuClockOutput.parents = &.{&D1CPRE};
            }
            CpuClockOutput.nodetype = .output;
            CpuClockOutput.parents = &.{&D1CPRE};

            // ======= NODE CortexPrescaler ======
            if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H7x5")) {
                CortexPrescaler.nodetype = .div;
                CortexPrescaler.value = try Cortex_DivValue.get();
                CortexPrescaler.parents = &.{&D1CPRE};
            }
            CortexPrescaler.nodetype = .div;
            CortexPrescaler.value = try Cortex_DivValue.get();
            CortexPrescaler.parents = &.{&D1CPRE};

            // ======= NODE CortexSysOutput ======
            if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H7x5")) {
                CortexSysOutput.nodetype = .output;
                CortexSysOutput.parents = &.{&CortexPrescaler};
            }
            CortexSysOutput.nodetype = .output;
            CortexSysOutput.parents = &.{&CortexPrescaler};

            // ======= NODE HPRE ======
            HPRE.nodetype = .div;
            HPRE.value = try HPREValue.get();
            HPRE.parents = &.{&D1CPRE};

            // ======= NODE AHBOutput ======
            if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H7x5")) {
                AHBOutput.nodetype = .output;
                AHBOutput.parents = &.{&HPRE};
            } else if (!config.flags.STM32H745_755 and !config.flags.STM32H747_757 and !check_MCU("STM32H7x5")) {
                AHBOutput.nodetype = .output;
                AHBOutput.parents = &.{&HPRE};
            }
            // ======= NODE Cortex2Prescaler ======
            if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H7x5")) {
                Cortex2Prescaler.nodetype = .div;
                Cortex2Prescaler.value = try Cortex2_DivValue.get();
                Cortex2Prescaler.parents = &.{&AHBOutput};
            }
            // ======= NODE CPU2ClockOutput ======
            if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H7x5")) {
                CPU2ClockOutput.nodetype = .output;
                CPU2ClockOutput.parents = &.{&AHBOutput};
            }
            // ======= NODE CPU2SystikOutput ======
            if (config.flags.STM32H745_755 or config.flags.STM32H747_757 or check_MCU("STM32H7x5")) {
                CPU2SystikOutput.nodetype = .output;
                CPU2SystikOutput.parents = &.{&Cortex2Prescaler};
            }
            // ======= NODE AXIClockOutput ======
            AXIClockOutput.nodetype = .output;
            AXIClockOutput.parents = &.{&AHBOutput};

            // ======= NODE HCLK3Output ======
            HCLK3Output.nodetype = .output;
            HCLK3Output.parents = &.{&AHBOutput};

            // ======= NODE D1PPRE ======
            D1PPRE.nodetype = .div;
            D1PPRE.value = try D1PPREValue.get();
            D1PPRE.parents = &.{&AHBOutput};

            // ======= NODE APB3Output ======
            APB3Output.nodetype = .output;
            APB3Output.parents = &.{&D1PPRE};

            // ======= NODE D2PPRE1 ======
            D2PPRE1.nodetype = .div;
            D2PPRE1.value = try D2PPRE1Value.get();
            D2PPRE1.parents = &.{&AHBOutput};

            // ======= NODE Tim1Mul ======
            Tim1Mul.nodetype = .mul;
            Tim1Mul.value = @floatFromInt(Tim1MulValue);
            Tim1Mul.parents = &.{&D2PPRE1};

            // ======= NODE Tim1Output ======
            Tim1Output.nodetype = .output;
            Tim1Output.parents = &.{&Tim1Mul};

            // ======= NODE AHB12Output ======
            AHB12Output.nodetype = .output;
            AHB12Output.parents = &.{&AHBOutput};

            // ======= NODE APB1Output ======
            APB1Output.nodetype = .output;
            APB1Output.parents = &.{&D2PPRE1};

            // ======= NODE D2PPRE2 ======
            D2PPRE2.nodetype = .div;
            D2PPRE2.value = try D2PPRE2Value.get();
            D2PPRE2.parents = &.{&AHBOutput};

            // ======= NODE APB2Output ======
            APB2Output.nodetype = .output;
            APB2Output.parents = &.{&D2PPRE2};

            // ======= NODE Tim2Mul ======
            Tim2Mul.nodetype = .mul;
            Tim2Mul.value = @floatFromInt(Tim2MulValue);
            Tim2Mul.parents = &.{&D2PPRE2};

            // ======= NODE Tim2Output ======
            Tim2Output.nodetype = .output;
            Tim2Output.parents = &.{&Tim2Mul};

            // ======= NODE AHB4Output ======
            AHB4Output.nodetype = .output;
            AHB4Output.parents = &.{&AHBOutput};

            // ======= NODE D3PPRE ======
            D3PPRE.nodetype = .div;
            D3PPRE.value = try D3PPREValue.get();
            D3PPRE.parents = &.{&AHBOutput};

            // ======= NODE APB4Output ======
            APB4Output.nodetype = .output;
            APB4Output.parents = &.{&D3PPRE};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI => &.{&HSIDiv},
                .RCC_PLLSOURCE_CSI => &.{&CSIRC},
                .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE CKPERSource ======
            CKPERSource.nodetype = .multi;
            CKPERSource.parents = switch (CKPERSourceSelectionValue) {
                .RCC_CLKPSOURCE_HSI => &.{&HSIDiv},
                .RCC_CLKPSOURCE_CSI => &.{&CSIRC},
                .RCC_CLKPSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE CKPERoutput ======
            CKPERoutput.nodetype = .output;
            CKPERoutput.parents = &.{&CKPERSource};

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
            DIVQ1.nodetype = .div;
            DIVQ1.value = @floatFromInt(DIVQ1Value);
            DIVQ1.parents = &.{&DIVN1};

            // ======= NODE DIVQ1output ======
            DIVQ1output.nodetype = .output;
            DIVQ1output.parents = &.{&DIVQ1};

            // ======= NODE DIVR1 ======
            DIVR1.nodetype = .div;
            DIVR1.value = @floatFromInt(DIVR1Value);
            DIVR1.parents = &.{&DIVN1};

            // ======= NODE DIVR1output ======
            DIVR1output.nodetype = .output;
            DIVR1output.parents = &.{&DIVR1};

            // ======= NODE DIVN2 ======
            DIVN2.nodetype = .mulfrac;
            DIVN2.value = @floatFromInt(DIVN2Value);
            DIVN2.parents = &.{ &DIVM2, &PLL2FRACN };

            // ======= NODE PLL2FRACN ======
            PLL2FRACN.nodetype = .source;
            PLL2FRACN.value = @floatFromInt(PLL2FRACNValue);

            // ======= NODE DIVP2 ======
            DIVP2.nodetype = .div;
            DIVP2.value = @floatFromInt(DIVP2Value);
            DIVP2.parents = &.{&DIVN2};

            // ======= NODE DIVP2output ======
            DIVP2output.nodetype = .output;
            DIVP2output.parents = &.{&DIVP2};

            // ======= NODE DIVQ2 ======
            DIVQ2.nodetype = .div;
            DIVQ2.value = @floatFromInt(DIVQ2Value);
            DIVQ2.parents = &.{&DIVN2};

            // ======= NODE DIVQ2output ======
            DIVQ2output.nodetype = .output;
            DIVQ2output.parents = &.{&DIVQ2};

            // ======= NODE DIVR2 ======
            DIVR2.nodetype = .div;
            DIVR2.value = @floatFromInt(DIVR2Value);
            DIVR2.parents = &.{&DIVN2};

            // ======= NODE DIVR2output ======
            DIVR2output.nodetype = .output;
            DIVR2output.parents = &.{&DIVR2};

            // ======= NODE DIVN3 ======
            DIVN3.nodetype = .mulfrac;
            DIVN3.value = @floatFromInt(DIVN3Value);
            DIVN3.parents = &.{ &DIVM3, &PLL3FRACN };

            // ======= NODE DIVP3 ======
            DIVP3.nodetype = .div;
            DIVP3.value = @floatFromInt(DIVP3Value);
            DIVP3.parents = &.{&DIVN3};

            // ======= NODE PLL3FRACN ======
            PLL3FRACN.nodetype = .source;
            PLL3FRACN.value = @floatFromInt(PLL3FRACNValue);

            // ======= NODE DIVP3output ======
            DIVP3output.nodetype = .output;
            DIVP3output.parents = &.{&DIVP3};

            // ======= NODE DIVQ3 ======
            DIVQ3.nodetype = .div;
            DIVQ3.value = @floatFromInt(DIVQ3Value);
            DIVQ3.parents = &.{&DIVN3};

            // ======= NODE DIVQ3output ======
            DIVQ3output.nodetype = .output;
            DIVQ3output.parents = &.{&DIVQ3};

            // ======= NODE DIVR3 ======
            DIVR3.nodetype = .div;
            DIVR3.value = @floatFromInt(DIVR3Value);
            DIVR3.parents = &.{&DIVN3};

            // ======= NODE LTDCOutput ======
            LTDCOutput.nodetype = .output;
            LTDCOutput.parents = &.{&DIVR3};

            // ======= NODE DIVR3output ======
            DIVR3output.nodetype = .output;
            DIVR3output.parents = &.{&DIVR3};

            // ======= NODE HSERTCDevisor ======
            HSERTCDevisor.nodetype = .div;
            HSERTCDevisor.value = try RCC_RTC_Clock_Source_FROM_HSEValue.get();
            HSERTCDevisor.parents = &.{&HSEOSC};

            // ======= NODE RTCClkSource ======
            RTCClkSource.nodetype = .multi;
            RTCClkSource.parents = switch (RTCClockSelectionValue) {
                .HSERTCDevisor => &.{&HSERTCDevisor},
                .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_RTCCLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE RTCOutput ======
            RTCOutput.nodetype = .output;
            RTCOutput.parents = &.{&RTCClkSource};

            // ======= NODE IWDGOutput ======
            IWDGOutput.nodetype = .output;
            IWDGOutput.parents = &.{&LSIRC};

            // ======= NODE SPI123Mult ======
            SPI123Mult.nodetype = .multi;
            SPI123Mult.parents = switch (SPI123CLockSelectionValue) {
                .RCC_SPI123CLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_SPI123CLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_SPI123CLKSOURCE_PLL3 => &.{&DIVP3},
                .RCC_SPI123CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SPI123CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE SPI123output ======
            SPI123output.nodetype = .output;
            SPI123output.parents = &.{&SPI123Mult};

            // ======= NODE SAI23Mult ======
            SAI23Mult.nodetype = .multi;
            SAI23Mult.parents = switch (SAI23CLockSelectionValue) {
                .RCC_SAI23CLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_SAI23CLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_SAI23CLKSOURCE_PLL3 => &.{&DIVP3},
                .RCC_SAI23CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SAI23CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE SAI23output ======
            SAI23output.nodetype = .output;
            SAI23output.parents = &.{&SAI23Mult};

            // ======= NODE SAI1Mult ======
            SAI1Mult.nodetype = .multi;
            SAI1Mult.parents = switch (SAI1CLockSelectionValue) {
                .RCC_SAI1CLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_SAI1CLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_SAI1CLKSOURCE_PLL3 => &.{&DIVP3},
                .RCC_SAI1CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SAI1CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE DFSDMACLKoutput ======
            DFSDMACLKoutput.nodetype = .output;
            DFSDMACLKoutput.parents = &.{&SAI1Mult};

            // ======= NODE SAI1output ======
            SAI1output.nodetype = .output;
            SAI1output.parents = &.{&SAI1Mult};

            // ======= NODE SAI4BMult ======
            SAI4BMult.nodetype = .multi;
            SAI4BMult.parents = switch (SAI4BCLockSelectionValue) {
                .RCC_SAI4BCLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_SAI4BCLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_SAI4BCLKSOURCE_PLL3 => &.{&DIVP3},
                .RCC_SAI4BCLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SAI4BCLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE SAI4Boutput ======
            SAI4Boutput.nodetype = .output;
            SAI4Boutput.parents = &.{&SAI4BMult};

            // ======= NODE SAI4AMult ======
            SAI4AMult.nodetype = .multi;
            SAI4AMult.parents = switch (SAI4ACLockSelectionValue) {
                .RCC_SAI4ACLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_SAI4ACLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_SAI4ACLKSOURCE_PLL3 => &.{&DIVP3},
                .RCC_SAI4ACLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SAI4ACLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE SAI4Aoutput ======
            SAI4Aoutput.nodetype = .output;
            SAI4Aoutput.parents = &.{&SAI4AMult};

            // ======= NODE RNGMult ======
            RNGMult.nodetype = .multi;
            RNGMult.parents = switch (RNGCLockSelectionValue) {
                .RCC_RNGCLKSOURCE_HSI48 => &.{&RC48},
                .RCC_RNGCLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_RNGCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_RNGCLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE RNGoutput ======
            RNGoutput.nodetype = .output;
            RNGoutput.parents = &.{&RNGMult};

            // ======= NODE I2C123Mult ======
            I2C123Mult.nodetype = .multi;
            I2C123Mult.parents = switch (I2C123CLockSelectionValue) {
                .RCC_I2C123CLKSOURCE_D2PCLK1 => &.{&D2PPRE1},
                .RCC_I2C123CLKSOURCE_PLL3 => &.{&DIVR3},
                .RCC_I2C123CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_I2C123CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE I2C123output ======
            I2C123output.nodetype = .output;
            I2C123output.parents = &.{&I2C123Mult};

            // ======= NODE I2C4Mult ======
            I2C4Mult.nodetype = .multi;
            I2C4Mult.parents = switch (I2C4CLockSelectionValue) {
                .RCC_I2C4CLKSOURCE_D3PCLK1 => &.{&D3PPRE},
                .RCC_I2C4CLKSOURCE_PLL3 => &.{&DIVR3},
                .RCC_I2C4CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_I2C4CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE I2C4output ======
            I2C4output.nodetype = .output;
            I2C4output.parents = &.{&I2C4Mult};

            // ======= NODE SPDIFMult ======
            SPDIFMult.nodetype = .multi;
            SPDIFMult.parents = switch (SPDIFCLockSelectionValue) {
                .RCC_SPDIFRXCLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_SPDIFRXCLKSOURCE_PLL2 => &.{&DIVR2},
                .RCC_SPDIFRXCLKSOURCE_PLL3 => &.{&DIVR3},
                .RCC_SPDIFRXCLKSOURCE_HSI => &.{&HSIDiv},
            };

            // ======= NODE SPDIFoutput ======
            SPDIFoutput.nodetype = .output;
            SPDIFoutput.parents = &.{&SPDIFMult};

            // ======= NODE QSPIMult ======
            QSPIMult.nodetype = .multi;
            QSPIMult.parents = switch (QSPICLockSelectionValue) {
                .RCC_QSPICLKSOURCE_D1HCLK => &.{&HCLK3Output},
                .RCC_QSPICLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_QSPICLKSOURCE_PLL2 => &.{&DIVR2},
                .RCC_QSPICLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE QSPIoutput ======
            QSPIoutput.nodetype = .output;
            QSPIoutput.parents = &.{&QSPIMult};

            // ======= NODE FMCMult ======
            FMCMult.nodetype = .multi;
            FMCMult.parents = switch (FMCCLockSelectionValue) {
                .RCC_FMCCLKSOURCE_D1HCLK => &.{&HCLK3Output},
                .RCC_FMCCLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_FMCCLKSOURCE_PLL2 => &.{&DIVR2},
                .RCC_FMCCLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE FMCoutput ======
            FMCoutput.nodetype = .output;
            FMCoutput.parents = &.{&FMCMult};

            // ======= NODE SWPMult ======
            SWPMult.nodetype = .multi;
            SWPMult.parents = switch (SWPCLockSelectionValue) {
                .RCC_SWPMI1CLKSOURCE_D2PCLK1 => &.{&D2PPRE1},
                .RCC_SWPMI1CLKSOURCE_HSI => &.{&HSIDiv},
            };

            // ======= NODE SWPoutput ======
            SWPoutput.nodetype = .output;
            SWPoutput.parents = &.{&SWPMult};

            // ======= NODE SDMMCMult ======
            SDMMCMult.nodetype = .multi;
            SDMMCMult.parents = switch (SDMMC1CLockSelectionValue) {
                .RCC_SDMMCCLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_SDMMCCLKSOURCE_PLL2 => &.{&DIVR2},
            };

            // ======= NODE SDMMCoutput ======
            SDMMCoutput.nodetype = .output;
            SDMMCoutput.parents = &.{&SDMMCMult};

            // ======= NODE DFSDMMult ======
            DFSDMMult.nodetype = .multi;
            DFSDMMult.parents = switch (DFSDMCLockSelectionValue) {
                .RCC_DFSDM1CLKSOURCE_D2PCLK1 => &.{&D2PPRE2},
                .RCC_DFSDM1CLKSOURCE_SYS => &.{&SysCLKOutput},
            };

            // ======= NODE DFSDMoutput ======
            DFSDMoutput.nodetype = .output;
            DFSDMoutput.parents = &.{&DFSDMMult};

            // ======= NODE USART16Mult ======
            USART16Mult.nodetype = .multi;
            USART16Mult.parents = switch (USART16CLockSelectionValue) {
                .RCC_USART16CLKSOURCE_D2PCLK2 => &.{&D2PPRE2},
                .RCC_USART16CLKSOURCE_PLL2 => &.{&DIVQ2},
                .RCC_USART16CLKSOURCE_PLL3 => &.{&DIVQ3},
                .RCC_USART16CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_USART16CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_USART16CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART16output ======
            USART16output.nodetype = .output;
            USART16output.parents = &.{&USART16Mult};

            // ======= NODE USART234578Mult ======
            USART234578Mult.nodetype = .multi;
            USART234578Mult.parents = switch (USART234578CLockSelectionValue) {
                .RCC_USART234578CLKSOURCE_D2PCLK1 => &.{&D2PPRE1},
                .RCC_USART234578CLKSOURCE_PLL2 => &.{&DIVQ2},
                .RCC_USART234578CLKSOURCE_PLL3 => &.{&DIVQ3},
                .RCC_USART234578CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_USART234578CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_USART234578CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART234578output ======
            USART234578output.nodetype = .output;
            USART234578output.parents = &.{&USART234578Mult};

            // ======= NODE LPUART1Mult ======
            LPUART1Mult.nodetype = .multi;
            LPUART1Mult.parents = switch (LPUART1CLockSelectionValue) {
                .RCC_LPUART1CLKSOURCE_D3PCLK1 => &.{&D1PPRE},
                .RCC_LPUART1CLKSOURCE_PLL2 => &.{&DIVQ2},
                .RCC_LPUART1CLKSOURCE_PLL3 => &.{&DIVQ3},
                .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_LPUART1CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LPUART1output ======
            LPUART1output.nodetype = .output;
            LPUART1output.parents = &.{&LPUART1Mult};

            // ======= NODE LPTIM1Mult ======
            LPTIM1Mult.nodetype = .multi;
            LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                .RCC_LPTIM1CLKSOURCE_D2PCLK1 => &.{&D2PPRE1},
                .RCC_LPTIM1CLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_LPTIM1CLKSOURCE_PLL3 => &.{&DIVR3},
                .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM1CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE LPTIM1output ======
            LPTIM1output.nodetype = .output;
            LPTIM1output.parents = &.{&LPTIM1Mult};

            // ======= NODE LPTIM345Mult ======
            LPTIM345Mult.nodetype = .multi;
            LPTIM345Mult.parents = switch (LPTIM345CLockSelectionValue) {
                .RCC_LPTIM345CLKSOURCE_D3PCLK1 => &.{&D3PPRE},
                .RCC_LPTIM345CLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_LPTIM345CLKSOURCE_PLL3 => &.{&DIVR3},
                .RCC_LPTIM345CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM345CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM345CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE LPTIM345output ======
            LPTIM345output.nodetype = .output;
            LPTIM345output.parents = &.{&LPTIM345Mult};

            // ======= NODE LPTIM2Mult ======
            LPTIM2Mult.nodetype = .multi;
            LPTIM2Mult.parents = switch (LPTIM2CLockSelectionValue) {
                .RCC_LPTIM2CLKSOURCE_D3PCLK1 => &.{&D3PPRE},
                .RCC_LPTIM2CLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_LPTIM2CLKSOURCE_PLL3 => &.{&DIVR3},
                .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM2CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE LPTIM2output ======
            LPTIM2output.nodetype = .output;
            LPTIM2output.parents = &.{&LPTIM2Mult};

            // ======= NODE SPI6Mult ======
            SPI6Mult.nodetype = .multi;
            SPI6Mult.parents = switch (SPI6CLockSelectionValue) {
                .RCC_SPI6CLKSOURCE_D3PCLK1 => &.{&D3PPRE},
                .RCC_SPI6CLKSOURCE_PLL2 => &.{&DIVQ2},
                .RCC_SPI6CLKSOURCE_PLL3 => &.{&DIVQ3},
                .RCC_SPI6CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_SPI6CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_SPI6CLKSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE SPI6output ======
            SPI6output.nodetype = .output;
            SPI6output.parents = &.{&SPI6Mult};

            // ======= NODE SPI45Mult ======
            SPI45Mult.nodetype = .multi;
            SPI45Mult.parents = switch (Spi45ClockSelectionValue) {
                .RCC_SPI45CLKSOURCE_D2PCLK1 => &.{&D2PPRE2},
                .RCC_SPI45CLKSOURCE_PLL2 => &.{&DIVQ2},
                .RCC_SPI45CLKSOURCE_PLL3 => &.{&DIVQ3},
                .RCC_SPI45CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_SPI45CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_SPI45CLKSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE SPI45output ======
            SPI45output.nodetype = .output;
            SPI45output.parents = &.{&SPI45Mult};

            // ======= NODE USBMult ======
            USBMult.nodetype = .multi;
            USBMult.parents = switch (USBCLockSelectionValue) {
                .RCC_USBCLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_USBCLKSOURCE_PLL3 => &.{&DIVQ3},
                .RCC_USBCLKSOURCE_HSI48 => &.{&RC48},
            };

            // ======= NODE USBoutput ======
            USBoutput.nodetype = .output;
            USBoutput.parents = &.{&USBMult};

            // ======= NODE FDCANMult ======
            FDCANMult.nodetype = .multi;
            FDCANMult.parents = switch (FDCANCLockSelectionValue) {
                .RCC_FDCANCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_FDCANCLKSOURCE_PLL => &.{&DIVQ1},
                .RCC_FDCANCLKSOURCE_PLL2 => &.{&DIVQ2},
            };

            // ======= NODE FDCANoutput ======
            FDCANoutput.nodetype = .output;
            FDCANoutput.parents = &.{&FDCANMult};

            // ======= NODE ADCMult ======
            ADCMult.nodetype = .multi;
            ADCMult.parents = switch (ADCCLockSelectionValue) {
                .RCC_ADCCLKSOURCE_PLL2 => &.{&DIVP2},
                .RCC_ADCCLKSOURCE_PLL3 => &.{&DIVR3},
                .RCC_ADCCLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&ADCMult};

            // ======= NODE CECMult ======
            CECMult.nodetype = .multi;
            CECMult.parents = switch (CECCLockSelectionValue) {
                .RCC_CECCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_CECCLKSOURCE_LSI => &.{&LSIRC},
                .RCC_CECCLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE CECoutput ======
            CECoutput.nodetype = .output;
            CECoutput.parents = &.{&CECMult};

            // ======= NODE HrtimMult ======
            HrtimMult.nodetype = .multi;
            HrtimMult.parents = switch (HRTIMCLockSelectionValue) {
                .RCC_HRTIM1CLK_TIMCLK => &.{&Tim2Output},
                .RCC_HRTIM1CLK_CPUCLK => &.{&D1CPRE},
            };

            // ======= NODE HRTIMoutput ======
            HRTIMoutput.nodetype = .output;
            HRTIMoutput.parents = &.{&HrtimMult};

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

            //======= TraceFreq_Value ========
            const TraceFreq_ValueValue = TraceCLKOutput.get_as_ref();
            ignore_value(TraceFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCO1Pin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= MCO2PinFreq_Value ========
            const MCO2PinFreq_ValueValue = MCO2Pin.get_as_ref();
            ignore_value(MCO2PinFreq_ValueValue);

            //======= DSIFreq_Value ========
            const DSIFreq_ValueValue = DSIoutput.get_as_ref();
            ignore_value(DSIFreq_ValueValue);
            if (config.flags.DSIUsed_ForRCC and DSISourceisPLLR) {
                DSIoutput.limit = .{
                    .min = null,
                    .max = 6.2e7,
                    .main_expr = "DSIUsed_ForRCC & DSISourceisPLLR",
                    .main_dialog = "PLLM used",
                };
            } else {
                DSIoutput.limit = .{
                    .min = null,
                    .max = 6.2e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= DSITXEscFreq_Value ========
            const DSITXEscFreq_ValueValue = DSITXCLKEsc.get_as_ref();
            ignore_value(DSITXEscFreq_ValueValue);

            DSITXCLKEsc.limit = .{
                .min = null,
                .max = 2e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= PLLDSIVCOFreq_Value ========
            const PLLDSIVCOFreq_ValueValue = VCOoutput.get_as_ref();
            ignore_value(PLLDSIVCOFreq_ValueValue);

            VCOoutput.limit = .{
                .min = 1e9,
                .max = 2e9,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= PLLDSIFreq_Value ========
            const PLLDSIFreq_ValueValue = PLLDSIoutput.get_as_ref();
            ignore_value(PLLDSIFreq_ValueValue);

            PLLDSIoutput.limit = .{
                .min = 6.25e7,
                .max = 1e9,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= D1CPREFreq_Value ========
            const D1CPREFreq_ValueValue = D1CPREOutput.get_as_ref();
            ignore_value(D1CPREFreq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                D1CPREOutput.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                D1CPREOutput.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                D1CPREOutput.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= CpuClockFreq_Value ========
            const CpuClockFreq_ValueValue = CpuClockOutput.get_as_ref();
            ignore_value(CpuClockFreq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                CpuClockOutput.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                CpuClockOutput.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                CpuClockOutput.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 200000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 200000000, .@"="))) and check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revV, .@"=")) {
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
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 300000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 300000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 200000000, .@">")) and check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revV, .@"=")) {
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
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 300000000, .@">")) and check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revV, .@"=")) {
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
                } else if ((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@">")) and check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revV, .@"=")) {
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
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 200000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 200000000, .@"="))) and check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => scale3 = true,
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
                                    \\ - {s}
                                , .{
                                    "PWR_Regulator_Voltage_Scale",
                                    "((CpuClockFreq_Value < 200000000)|(CpuClockFreq_Value=200000000)) & ProductRev=revY",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Scale3" else "PWR_REGULATOR_VOLTAGE_SCALE3",
                                    if (patch_logs) "Scale2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Scale1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale3 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                    };
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 300000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 300000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 200000000, .@">")) and check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
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
                                    \\ - {s}
                                , .{
                                    "PWR_Regulator_Voltage_Scale",
                                    "((CpuClockFreq_Value < 300000000)|(CpuClockFreq_Value=300000000)) & (CpuClockFreq_Value > 200000000) & ProductRev=revY",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Scale3" else "PWR_REGULATOR_VOLTAGE_SCALE3",
                                    if (patch_logs) "Scale2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Scale1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale2 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE2;
                    };
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 300000000, .@">")) and check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
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
                                    "PWR_Regulator_Voltage_Scale",
                                    "((CpuClockFreq_Value < 400000000)|(CpuClockFreq_Value=400000000)) & (CpuClockFreq_Value > 300000000) & ProductRev=revY",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Scale3" else "PWR_REGULATOR_VOLTAGE_SCALE3",
                                    if (patch_logs) "Scale2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Scale1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
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
                        .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                    }
                }
                break :blk user_val orelse {
                    scale3 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                };
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else if (scale3 or scale2 or scale1) {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 2.25e8,
                    .main_expr = "scale3|scale2|scale1",
                    .main_dialog = "",
                };
            } else {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 2.4e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= CPU2Freq_Value ========
            const CPU2Freq_ValueValue = CPU2ClockOutput.get_as_ref();
            ignore_value(CPU2Freq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                CPU2ClockOutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                CPU2ClockOutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                CPU2ClockOutput.limit = .{
                    .min = null,
                    .max = 2.4e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= CPU2SystikFreq_Value ========
            const CPU2SystikFreq_ValueValue = CPU2SystikOutput.get_as_ref();
            ignore_value(CPU2SystikFreq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                CPU2SystikOutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                CPU2SystikOutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                CPU2SystikOutput.limit = .{
                    .min = null,
                    .max = 2.4e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= AXIClockFreq_Value ========
            const AXIClockFreq_ValueValue = AXIClockOutput.get_as_ref();
            ignore_value(AXIClockFreq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                AXIClockOutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                AXIClockOutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                AXIClockOutput.limit = .{
                    .min = null,
                    .max = 2.4e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= HCLK3ClockFreq_Value ========
            const HCLK3ClockFreq_ValueValue = HCLK3Output.get_as_ref();
            ignore_value(HCLK3ClockFreq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                HCLK3Output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                HCLK3Output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                HCLK3Output.limit = .{
                    .min = null,
                    .max = 2.4e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= APB3Freq_Value ========
            const APB3Freq_ValueValue = APB3Output.get_as_ref();
            ignore_value(APB3Freq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                APB3Output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                APB3Output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                APB3Output.limit = .{
                    .min = null,
                    .max = 1.2e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= Tim1OutputFreq_Value ========
            const Tim1OutputFreq_ValueValue = Tim1Output.get_as_ref();
            ignore_value(Tim1OutputFreq_ValueValue);

            //======= AHB12Freq_Value ========
            const AHB12Freq_ValueValue = AHB12Output.get_as_ref();
            ignore_value(AHB12Freq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                AHB12Output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                AHB12Output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                AHB12Output.limit = .{
                    .min = null,
                    .max = 2.4e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                APB1Output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                APB1Output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                APB1Output.limit = .{
                    .min = null,
                    .max = 1.2e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                APB2Output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                APB2Output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                APB2Output.limit = .{
                    .min = null,
                    .max = 1.2e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= Tim2OutputFreq_Value ========
            const Tim2OutputFreq_ValueValue = Tim2Output.get_as_ref();
            ignore_value(Tim2OutputFreq_ValueValue);

            //======= AHB4Freq_Value ========
            const AHB4Freq_ValueValue = AHB4Output.get_as_ref();
            ignore_value(AHB4Freq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                AHB4Output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                AHB4Output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                AHB4Output.limit = .{
                    .min = null,
                    .max = 2.4e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= APB4Freq_Value ========
            const APB4Freq_ValueValue = APB4Output.get_as_ref();
            ignore_value(APB4Freq_ValueValue);
            if (config.flags.STM32H755BIT3 or config.flags.STM32H755IIK3 or config.flags.STM32H755IIT3 or config.flags.STM32H755XIH3 or config.flags.STM32H755ZIT3) {
                APB4Output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "STM32H755BIT3|STM32H755IIK3|STM32H755IIT3|STM32H755XIH3|STM32H755ZIT3",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(ProductRevValue), ProductRevValue, .revY, .@"=")) {
                APB4Output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "ProductRev=revY",
                    .main_dialog = "",
                };
            } else {
                APB4Output.limit = .{
                    .min = null,
                    .max = 1.2e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= CKPERFreq_Value ========
            const CKPERFreq_ValueValue = CKPERoutput.get_as_ref();
            ignore_value(CKPERFreq_ValueValue);

            //======= DIVQ1Freq_Value ========
            const DIVQ1Freq_ValueValue = DIVQ1output.get_as_ref();
            ignore_value(DIVQ1Freq_ValueValue);
            if (scale0 and ((SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLQ1 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLQ1 and config.flags.SAI4_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL1Q and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & ((SPI123CLKSOURCE_PLLQ1&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLQ1& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLQ1& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLQ1&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLQ1&SAI4_SAIAUsed_ForRCC )|(RNGCLKSOURCE_PLLQ1&RNGUsed_ForRCC)|(SPDIFCLKSOURCE_PLL1Q& SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL1Q & QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL1Q& FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL1Q&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC ))|(USBCLKSOURCE_PLL1Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC)|(FDCANCLKSOURCE_PLL1Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))",
                    .main_dialog = "",
                };
            } else if (scale1 and ((SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLQ1 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLQ1 and config.flags.SAI4_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL1Q and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & ((SPI123CLKSOURCE_PLLQ1&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLQ1& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLQ1& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLQ1&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLQ1&SAI4_SAIAUsed_ForRCC )|(RNGCLKSOURCE_PLLQ1&RNGUsed_ForRCC)|(SPDIFCLKSOURCE_PLL1Q& SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL1Q & QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL1Q& FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL1Q&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC ))|(USBCLKSOURCE_PLL1Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC)|(FDCANCLKSOURCE_PLL1Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))",
                    .main_dialog = "",
                };
            } else if (scale2 and ((SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLQ1 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLQ1 and config.flags.SAI4_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL1Q and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & ((SPI123CLKSOURCE_PLLQ1&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLQ1& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLQ1& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLQ1&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLQ1&SAI4_SAIAUsed_ForRCC )|(RNGCLKSOURCE_PLLQ1&RNGUsed_ForRCC)|(SPDIFCLKSOURCE_PLL1Q& SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL1Q & QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL1Q& FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL1Q&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC ))|(USBCLKSOURCE_PLL1Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC)|(FDCANCLKSOURCE_PLL1Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))",
                    .main_dialog = "",
                };
            } else if (scale3 and ((SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLQ1 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLQ1 and config.flags.SAI4_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL1Q and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & ((SPI123CLKSOURCE_PLLQ1&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLQ1& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLQ1& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLQ1&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLQ1&SAI4_SAIAUsed_ForRCC )|(RNGCLKSOURCE_PLLQ1&RNGUsed_ForRCC)|(SPDIFCLKSOURCE_PLL1Q& SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL1Q & QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL1Q& FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL1Q&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC ))|(USBCLKSOURCE_PLL1Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC)|(FDCANCLKSOURCE_PLL1Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))",
                    .main_dialog = "",
                };
            }

            //======= DIVR1Freq_Value ========
            const DIVR1Freq_ValueValue = DIVR1output.get_as_ref();
            ignore_value(DIVR1Freq_ValueValue);
            if (scale0 and (config.flags.DEBUG_Used)) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & (DEBUG_Used)",
                    .main_dialog = "",
                };
            } else if (scale1 and (config.flags.DEBUG_Used)) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & (DEBUG_Used)",
                    .main_dialog = "",
                };
            } else if (scale2 and (config.flags.DEBUG_Used)) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & (DEBUG_Used)",
                    .main_dialog = "",
                };
            } else if (scale3 and config.flags.DEBUG_Used) {
                DIVR1output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & DEBUG_Used",
                    .main_dialog = "",
                };
            }

            //======= DIVP2Freq_Value ========
            const DIVP2Freq_ValueValue = DIVP2output.get_as_ref();
            ignore_value(DIVP2Freq_ValueValue);
            if (scale0 and (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP2 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP2 and config.flags.SAI4_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & (((MCO2SOURCE_PLL2PCLK)& (MCO2Config))|(SPI123CLKSOURCE_PLLP2&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP2& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP2& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP2&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP2&SAI4_SAIAUsed_ForRCC ) |(LPTIM1CLKSOURCE_PLLP2 & LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLP2&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLP2&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL2P&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            } else if (scale1 and (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP2 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP2 and config.flags.SAI4_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & (((MCO2SOURCE_PLL2PCLK)& (MCO2Config))|(SPI123CLKSOURCE_PLLP2&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP2& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP2& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP2&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP2&SAI4_SAIAUsed_ForRCC ) |(LPTIM1CLKSOURCE_PLLP2 & LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLP2&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLP2&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL2P&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            } else if (scale2 and (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP2 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP2 and config.flags.SAI4_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & (((MCO2SOURCE_PLL2PCLK)& (MCO2Config))|(SPI123CLKSOURCE_PLLP2&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP2& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP2& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP2&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP2&SAI4_SAIAUsed_ForRCC ) |(LPTIM1CLKSOURCE_PLLP2 & LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLP2&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLP2&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL2P&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            } else if (scale3 and (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP2 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP2 and config.flags.SAI4_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & (((MCO2SOURCE_PLL2PCLK)& (MCO2Config))|(SPI123CLKSOURCE_PLLP2&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP2& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP2& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP2&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP2&SAI4_SAIAUsed_ForRCC ) |(LPTIM1CLKSOURCE_PLLP2 & LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLP2&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLP2&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL2P&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            }

            //======= DIVQ2Freq_Value ========
            const DIVQ2Freq_ValueValue = DIVQ2output.get_as_ref();
            ignore_value(DIVQ2Freq_ValueValue);
            if (scale0 and ((USART16CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & ((USART16CLKSOURCE_PLLQ2&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ2&( USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL2Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ2&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ2&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(FDCANCLKSOURCE_PLL2Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))  ",
                    .main_dialog = "",
                };
            } else if (scale1 and ((USART16CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & ((USART16CLKSOURCE_PLLQ2&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ2&( USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL2Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ2&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ2&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(FDCANCLKSOURCE_PLL2Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))  ",
                    .main_dialog = "",
                };
            } else if (scale2 and ((USART16CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & ((USART16CLKSOURCE_PLLQ2&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ2&( USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL2Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ2&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ2&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(FDCANCLKSOURCE_PLL2Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))  ",
                    .main_dialog = "",
                };
            } else if (scale3 and ((USART16CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)))) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & ((USART16CLKSOURCE_PLLQ2&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ2&( USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL2Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ2&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ2&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(FDCANCLKSOURCE_PLL2Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC)))  ",
                    .main_dialog = "",
                };
            }

            //======= DIVR2Freq_Value ========
            const DIVR2Freq_ValueValue = DIVR2output.get_as_ref();
            ignore_value(DIVR2Freq_ValueValue);
            if (scale0 and ((SPDIFCLKSOURCE_PLL2R and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL2R and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)))) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & ((SPDIFCLKSOURCE_PLL2R&SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL2R&QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL2R&FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL2R&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC)))",
                    .main_dialog = "",
                };
            } else if (scale1 and ((SPDIFCLKSOURCE_PLL2R and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL2R and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)))) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & ((SPDIFCLKSOURCE_PLL2R&SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL2R&QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL2R&FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL2R&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC)))",
                    .main_dialog = "",
                };
            } else if (scale2 and ((SPDIFCLKSOURCE_PLL2R and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL2R and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)))) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & ((SPDIFCLKSOURCE_PLL2R&SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL2R&QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL2R&FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL2R&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC)))",
                    .main_dialog = "",
                };
            } else if (scale3 and ((SPDIFCLKSOURCE_PLL2R and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL2R and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)))) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & ((SPDIFCLKSOURCE_PLL2R&SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL2R&QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL2R&FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL2R&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC)))",
                    .main_dialog = "",
                };
            }

            //======= DIVP3Freq_Value ========
            const DIVP3Freq_ValueValue = DIVP3output.get_as_ref();
            ignore_value(DIVP3Freq_ValueValue);
            if (scale0 and ((SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP3 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP3 and config.flags.SAI4_SAIAUsed_ForRCC))) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & ((SPI123CLKSOURCE_PLLP3&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP3& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP3& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP3&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP3&SAI4_SAIAUsed_ForRCC ))",
                    .main_dialog = "",
                };
            } else if (scale1 and ((SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP3 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP3 and config.flags.SAI4_SAIAUsed_ForRCC))) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & ((SPI123CLKSOURCE_PLLP3&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP3& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP3& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP3&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP3&SAI4_SAIAUsed_ForRCC ))",
                    .main_dialog = "",
                };
            } else if (scale2 and ((SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP3 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP3 and config.flags.SAI4_SAIAUsed_ForRCC))) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & ((SPI123CLKSOURCE_PLLP3&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP3& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP3& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP3&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP3&SAI4_SAIAUsed_ForRCC ))",
                    .main_dialog = "",
                };
            } else if (scale3 and ((SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP3 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP3 and config.flags.SAI4_SAIAUsed_ForRCC))) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & ((SPI123CLKSOURCE_PLLP3&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP3& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP3& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP3&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP3&SAI4_SAIAUsed_ForRCC ))",
                    .main_dialog = "",
                };
            }

            //======= DIVQ3Freq_Value ========
            const DIVQ3Freq_ValueValue = DIVQ3output.get_as_ref();
            ignore_value(DIVQ3Freq_ValueValue);
            if (scale0 and ((USART16CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC))) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & ((USART16CLKSOURCE_PLLQ3&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ3& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL3Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ3&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ3&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(USBCLKSOURCE_PLL3Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC))",
                    .main_dialog = "",
                };
            } else if (scale1 and ((USART16CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC))) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & ((USART16CLKSOURCE_PLLQ3&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ3& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL3Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ3&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ3&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(USBCLKSOURCE_PLL3Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC))",
                    .main_dialog = "",
                };
            } else if (scale2 and ((USART16CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC))) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & ((USART16CLKSOURCE_PLLQ3&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ3& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL3Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ3&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ3&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(USBCLKSOURCE_PLL3Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC))",
                    .main_dialog = "",
                };
            } else if (scale3 and ((USART16CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC))) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & ((USART16CLKSOURCE_PLLQ3&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ3& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL3Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ3&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ3&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(USBCLKSOURCE_PLL3Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC))",
                    .main_dialog = "",
                };
            }

            //======= LTDCFreq_Value ========
            const LTDCFreq_ValueValue = LTDCOutput.get_as_ref();
            ignore_value(LTDCFreq_ValueValue);
            if (scale2) {
                LTDCOutput.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale3) {
                LTDCOutput.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else {
                LTDCOutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= DIVR3Freq_Value ========
            const DIVR3Freq_ValueValue = DIVR3output.get_as_ref();
            ignore_value(DIVR3Freq_ValueValue);
            if (scale0 and ((I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and config.flags.SPDIFRX1Used_ForRCC) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "scale0 & ((I2C123CLKSOURCE_PLLR3&(I2C2Used_ForRCC|I2C3Used_ForRCC|I2C1Used_ForRCC))|(I2C4CLKSOURCE_PLLR3&I2C4Used_ForRCC)|(SPDIFCLKSOURCE_PLL3R&SPDIFRX1Used_ForRCC)|(LPTIM1CLKSOURCE_PLLR3&LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLR3&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLR3&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL3R&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            } else if (scale1 and ((I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and config.flags.SPDIFRX1Used_ForRCC) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1 & ((I2C123CLKSOURCE_PLLR3&(I2C2Used_ForRCC|I2C3Used_ForRCC|I2C1Used_ForRCC))|(I2C4CLKSOURCE_PLLR3&I2C4Used_ForRCC)|(SPDIFCLKSOURCE_PLL3R&SPDIFRX1Used_ForRCC)|(LPTIM1CLKSOURCE_PLLR3&LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLR3&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLR3&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL3R&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            } else if (scale2 and ((I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and config.flags.SPDIFRX1Used_ForRCC) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2 & ((I2C123CLKSOURCE_PLLR3&(I2C2Used_ForRCC|I2C3Used_ForRCC|I2C1Used_ForRCC))|(I2C4CLKSOURCE_PLLR3&I2C4Used_ForRCC)|(SPDIFCLKSOURCE_PLL3R&SPDIFRX1Used_ForRCC)|(LPTIM1CLKSOURCE_PLLR3&LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLR3&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLR3&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL3R&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            } else if (scale3 and ((I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and config.flags.SPDIFRX1Used_ForRCC) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))))) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3 & ((I2C123CLKSOURCE_PLLR3&(I2C2Used_ForRCC|I2C3Used_ForRCC|I2C1Used_ForRCC))|(I2C4CLKSOURCE_PLLR3&I2C4Used_ForRCC)|(SPDIFCLKSOURCE_PLL3R&SPDIFRX1Used_ForRCC)|(LPTIM1CLKSOURCE_PLLR3&LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLR3&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLR3&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL3R&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC))))",
                    .main_dialog = "",
                };
            }

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);

            RTCOutput.limit = .{
                .min = null,
                .max = 1e6,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= SPI123Freq_Value ========
            const SPI123Freq_ValueValue = SPI123output.get_as_ref();
            ignore_value(SPI123Freq_ValueValue);
            if (scale3) {
                SPI123output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SPI123output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else {
                SPI123output.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SAI23Freq_Value ========
            const SAI23Freq_ValueValue = SAI23output.get_as_ref();
            ignore_value(SAI23Freq_ValueValue);
            if (scale3) {
                SAI23output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SAI23output.limit = .{
                    .min = null,
                    .max = 1.13e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else {
                SAI23output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= DFSDMACLkFreq_Value ========
            const DFSDMACLkFreq_ValueValue = DFSDMACLKoutput.get_as_ref();
            ignore_value(DFSDMACLkFreq_ValueValue);
            if (scale3) {
                DFSDMACLKoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                DFSDMACLKoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                DFSDMACLKoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                DFSDMACLKoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);
            if (scale3) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1.13e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SAI4BFreq_Value ========
            const SAI4BFreq_ValueValue = SAI4Boutput.get_as_ref();
            ignore_value(SAI4BFreq_ValueValue);
            if (scale3 or scale2) {
                SAI4Boutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale3|scale2",
                    .main_dialog = "",
                };
            } else {
                SAI4Boutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SAI4AFreq_Value ========
            const SAI4AFreq_ValueValue = SAI4Aoutput.get_as_ref();
            ignore_value(SAI4AFreq_ValueValue);
            if (scale3 or scale2) {
                SAI4Aoutput.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale3|scale2",
                    .main_dialog = "",
                };
            } else {
                SAI4Aoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);
            if (scale3) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= I2C123Freq_Value ========
            const I2C123Freq_ValueValue = I2C123output.get_as_ref();
            ignore_value(I2C123Freq_ValueValue);
            if (scale3) {
                I2C123output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I2C123output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                I2C123output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                I2C123output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= I2C4Freq_Value ========
            const I2C4Freq_ValueValue = I2C4output.get_as_ref();
            ignore_value(I2C4Freq_ValueValue);
            if (scale3) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                I2C4output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SPDIFRXFreq_Value ========
            const SPDIFRXFreq_ValueValue = SPDIFoutput.get_as_ref();
            ignore_value(SPDIFRXFreq_ValueValue);
            if (scale3) {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                SPDIFoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= QSPIFreq_Value ========
            const QSPIFreq_ValueValue = QSPIoutput.get_as_ref();
            ignore_value(QSPIFreq_ValueValue);
            if (scale3) {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                QSPIoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= FMCFreq_Value ========
            const FMCFreq_ValueValue = FMCoutput.get_as_ref();
            ignore_value(FMCFreq_ValueValue);
            if (scale3) {
                FMCoutput.limit = .{
                    .min = null,
                    .max = 1.33e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                FMCoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                FMCoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                FMCoutput.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SWPMI1Freq_Value ========
            const SWPMI1Freq_ValueValue = SWPoutput.get_as_ref();
            ignore_value(SWPMI1Freq_ValueValue);
            if (scale3) {
                SWPoutput.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SWPoutput.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                SWPoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                SWPoutput.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SDMMCFreq_Value ========
            const SDMMCFreq_ValueValue = SDMMCoutput.get_as_ref();
            ignore_value(SDMMCFreq_ValueValue);
            if (scale3) {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                SDMMCoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= DFSDMFreq_Value ========
            const DFSDMFreq_ValueValue = DFSDMoutput.get_as_ref();
            ignore_value(DFSDMFreq_ValueValue);
            if (scale3) {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 1.5e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                DFSDMoutput.limit = .{
                    .min = null,
                    .max = 2.5e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= USART16Freq_Value ========
            const USART16Freq_ValueValue = USART16output.get_as_ref();
            ignore_value(USART16Freq_ValueValue);
            if (scale3) {
                USART16output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                USART16output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                USART16output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                USART16output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= USART234578Freq_Value ========
            const USART234578Freq_ValueValue = USART234578output.get_as_ref();
            ignore_value(USART234578Freq_ValueValue);
            if (scale3) {
                USART234578output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                USART234578output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                USART234578output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                USART234578output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);
            if (scale3) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);
            if (scale3) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= LPTIM345Freq_Value ========
            const LPTIM345Freq_ValueValue = LPTIM345output.get_as_ref();
            ignore_value(LPTIM345Freq_ValueValue);
            if (scale3) {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                LPTIM345output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);
            if (scale3) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SPI6Freq_Value ========
            const SPI6Freq_ValueValue = SPI6output.get_as_ref();
            ignore_value(SPI6Freq_ValueValue);
            if (scale3) {
                SPI6output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SPI6output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                SPI6output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                SPI6output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= SPI45Freq_Value ========
            const SPI45Freq_ValueValue = SPI45output.get_as_ref();
            ignore_value(SPI45Freq_ValueValue);
            if (scale3) {
                SPI45output.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SPI45output.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                SPI45output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                SPI45output.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);
            if (scale3) {
                USBoutput.limit = .{
                    .min = null,
                    .max = 6.3e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else {
                USBoutput.limit = .{
                    .min = null,
                    .max = 6.6e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= FDCANFreq_Value ========
            const FDCANFreq_ValueValue = FDCANoutput.get_as_ref();
            ignore_value(FDCANFreq_ValueValue);
            if (scale3) {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 5e7,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 7.5e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                FDCANoutput.limit = .{
                    .min = null,
                    .max = 1.25e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);
            if (scale3 or scale2) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 8e7,
                    .main_expr = "scale3|scale2",
                    .main_dialog = "",
                };
            } else {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECoutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);

            //======= HRTIMFreq_Value ========
            const HRTIMFreq_ValueValue = HRTIMoutput.get_as_ref();
            ignore_value(HRTIMFreq_ValueValue);
            if (scale3) {
                HRTIMoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                    .main_expr = "scale3",
                    .main_dialog = "",
                };
            } else if (scale2) {
                HRTIMoutput.limit = .{
                    .min = null,
                    .max = 3e8,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            } else if (scale1) {
                HRTIMoutput.limit = .{
                    .min = null,
                    .max = 4e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else {
                HRTIMoutput.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= VCOInput1Freq_Value ========
            const VCOInput1Freq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInput1Freq_ValueValue);
            if ((SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config) or (SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLQ1 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLQ1 and config.flags.SAI4_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL1Q and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                VCOInput.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = "(SYSCLKSOURCE_PLLCLK)|((RCC_MCO1Source=RCC_MCO1SOURCE_PLL1QCLK)& (MCO1Config))|((RCC_MCO2Source=RCC_MCO2SOURCE_PLLCLK)& MCO2Config)|(SPI123CLKSOURCE_PLLQ1&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLQ1& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLQ1& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLQ1&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLQ1&SAI4_SAIAUsed_ForRCC )|(RNGCLKSOURCE_PLLQ1&RNGUsed_ForRCC)|(SPDIFCLKSOURCE_PLL1Q& SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL1Q & QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL1Q& FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL1Q&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC ))|(USBCLKSOURCE_PLL1Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC)|(FDCANCLKSOURCE_PLL1Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC))",
                    .main_dialog = "",
                };
            }

            //======= VCOInput2Freq_Value ========
            const VCOInput2Freq_ValueValue = VCO2Input.get_as_ref();
            ignore_value(VCOInput2Freq_ValueValue);
            if (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP2 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP2 and config.flags.SAI4_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))) or (USART16CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)) or (SPDIFCLKSOURCE_PLL2R and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL2R and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                VCO2Input.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = " ((MCO2SOURCE_PLL2PCLK)& (MCO2Config))|(SPI123CLKSOURCE_PLLP2&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP2& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP2& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP2&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP2&SAI4_SAIAUsed_ForRCC ) |(LPTIM1CLKSOURCE_PLLP2 & LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLP2&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLP2&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL2P&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC)))|(USART16CLKSOURCE_PLLQ2&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ2& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL2Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ2&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ2&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(FDCANCLKSOURCE_PLL2Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC))|(SPDIFCLKSOURCE_PLL2R&SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL2R&QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL2R&FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL2R&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC))",
                    .main_dialog = "",
                };
            }

            //======= VCOInput3Freq_Value ========
            const VCOInput3Freq_ValueValue = VCO3Input.get_as_ref();
            ignore_value(VCOInput3Freq_ValueValue);
            if ((SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP3 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP3 and config.flags.SAI4_SAIAUsed_ForRCC) or (USART16CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) or (I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and config.flags.SPDIFRX1Used_ForRCC) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC)))) {
                VCO3Input.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = "(SPI123CLKSOURCE_PLLP3&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP3& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP3& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP3&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP3&SAI4_SAIAUsed_ForRCC ) |(USART16CLKSOURCE_PLLQ3&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ3& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL3Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ3&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ3&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(USBCLKSOURCE_PLL3Q &( USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC))|(I2C123CLKSOURCE_PLLR3&(I2C2Used_ForRCC|I2C3Used_ForRCC|I2C1Used_ForRCC))|(I2C4CLKSOURCE_PLLR3&I2C4Used_ForRCC)|(SPDIFCLKSOURCE_PLL3R&SPDIFRX1Used_ForRCC)|(LPTIM1CLKSOURCE_PLLR3&LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLR3&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLR3&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL3R&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC)))",
                    .main_dialog = "",
                };
            }

            //======= VCO1OutputFreq_Value ========
            const VCO1OutputFreq_ValueValue = VCO1Output.get_as_ref();
            ignore_value(VCO1OutputFreq_ValueValue);
            if ((SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config) or (SPI123CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLQ1 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLQ1 and config.flags.SAI4_SAIAUsed_ForRCC) or (RNGCLKSOURCE_PLLQ1 and config.flags.RNGUsed_ForRCC) or (SPDIFCLKSOURCE_PLL1Q and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL1Q and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL1Q and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (USBCLKSOURCE_PLL1Q and config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                VCO1Output.limit = .{
                    .min = 1.5e8,
                    .max = 9.6e8,
                    .main_expr = "(SYSCLKSOURCE_PLLCLK)|((RCC_MCO1Source=RCC_MCO1SOURCE_PLL1QCLK)& (MCO1Config))|((RCC_MCO2Source=RCC_MCO2SOURCE_PLLCLK)& MCO2Config)|(SPI123CLKSOURCE_PLLQ1&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLQ1& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLQ1& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLQ1&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLQ1&SAI4_SAIAUsed_ForRCC )|(RNGCLKSOURCE_PLLQ1&RNGUsed_ForRCC)|(SPDIFCLKSOURCE_PLL1Q& SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL1Q & QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL1Q& FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL1Q&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC) )|(USBCLKSOURCE_PLL1Q & USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC)|(FDCANCLKSOURCE_PLL1Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC))",
                    .main_dialog = "",
                };
            }

            //======= DIVP1Freq_Value ========
            const DIVP1Freq_ValueValue = PLL1CLK.get_as_ref();
            ignore_value(DIVP1Freq_ValueValue);
            if (((SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1QCLK, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config))) {
                PLL1CLK.limit = .{
                    .min = null,
                    .max = 4.8e8,
                    .main_expr = "((SYSCLKSOURCE_PLLCLK)|((RCC_MCO1Source=RCC_MCO1SOURCE_PLL1QCLK)& (MCO1Config))|((RCC_MCO2Source=RCC_MCO2SOURCE_PLLCLK)& MCO2Config))",
                    .main_dialog = "",
                };
            }

            //======= VCO2OutputFreq_Value ========
            const VCO2OutputFreq_ValueValue = VCO2Output.get_as_ref();
            ignore_value(VCO2OutputFreq_ValueValue);
            if (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI123CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP2 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP2 and config.flags.SAI4_SAIAUsed_ForRCC) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLP2 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLP2 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC))) or (USART16CLKSOURCE_PLLQ2 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (FDCANCLKSOURCE_PLL2Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)) or (SPDIFCLKSOURCE_PLL2R and config.flags.SPDIFRX1Used_ForRCC) or (QSPICLKSOURCE_PLL2R and config.flags.QUADSPIUsed_ForRCC) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC) or (SDMMC1CLKSOURCE_PLL2R and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                VCO2Output.limit = .{
                    .min = 1.5e8,
                    .max = 9.6e8,
                    .main_expr = " ((MCO2SOURCE_PLL2PCLK)& (MCO2Config))|(SPI123CLKSOURCE_PLLP2&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP2& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP2& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP2&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP2&SAI4_SAIAUsed_ForRCC ) |(LPTIM1CLKSOURCE_PLLP2 & LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLP2&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLP2&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL2P&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC)))|(USART16CLKSOURCE_PLLQ2&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ2& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL2Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ2&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ2&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(FDCANCLKSOURCE_PLL2Q&(FDCAN1Used_ForRCC|FDCAN2Used_ForRCC))|(SPDIFCLKSOURCE_PLL2R&SPDIFRX1Used_ForRCC)|(QSPICLKSOURCE_PLL2R&QUADSPIUsed_ForRCC)|(FMCCLKSOURCE_PLL2R&FMCUsed_ForRCC)|(SDMMC1CLKSOURCE_PLL2R&(SDMMC1Used_ForRCC|SDMMC2Used_ForRCC))",
                    .main_dialog = "",
                };
            }

            //======= VCO3OutputFreq_Value ========
            const VCO3OutputFreq_ValueValue = VCO3Output.get_as_ref();
            ignore_value(VCO3OutputFreq_ValueValue);
            if (config.flags.LTDCUsed_ForRCC or (SPI123CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI23CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI3_SAIAUsed_ForRCC or config.flags.SAI3_SAIBUsed_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC or (config.flags.DFSDM1Used_ForRCC and config.flags.SEM2RCC_SAI1_CK_REQUIRED_DFSDM1))) or (SAI4BCLKSOURCE_PLLP3 and config.flags.SAI4_SAIBUsed_ForRCC) or (SAI4ACLKSOURCE_PLLP3 and config.flags.SAI4_SAIAUsed_ForRCC) or (USART16CLKSOURCE_PLLQ3 and (config.flags.USART6Used_ForRCC or config.flags.USART1Used_ForRCC)) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBCLKSOURCE_PLL3Q and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) or (I2C123CLKSOURCE_PLLR3 and (config.flags.I2C2Used_ForRCC or config.flags.I2C3Used_ForRCC or config.flags.I2C1Used_ForRCC)) or (I2C4CLKSOURCE_PLLR3 and config.flags.I2C4Used_ForRCC) or (SPDIFCLKSOURCE_PLL3R and config.flags.SPDIFRX1Used_ForRCC) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM345CLKSOURCE_PLLR3 and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPTIM2CLKSOURCE_PLLR3 and config.flags.LPTIM2Used_ForRCC) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC3 and config.flags.ADC3UsedAsynchronousCLK_ForRCC)))) {
                VCO3Output.limit = .{
                    .min = 1.5e8,
                    .max = 9.6e8,
                    .main_expr = "LTDCUsed_ForRCC|(SPI123CLKSOURCE_PLLP3&(I2S1Used_ForRCC|I2S2Used_ForRCC|I2S3Used_ForRCC|SPI1Used_ForRCC|SPI2Used_ForRCC|SPI3Used_ForRCC))|(SAI23CLKSOURCE_PLLP3& (SAI2_SAIAUsed_ForRCC|SAI2_SAIBUsed_ForRCC|SAI3_SAIAUsed_ForRCC|SAI3_SAIBUsed_ForRCC))|(SAI1CLKSOURCE_PLLP3& (SAI1_SAIAUsed_ForRCC|SAI1_SAIBUsed_ForRCC|(DFSDM1Used_ForRCC & SEM2RCC_SAI1_CK_REQUIRED_DFSDM1)))|(SAI4BCLKSOURCE_PLLP3&SAI4_SAIBUsed_ForRCC )|(SAI4ACLKSOURCE_PLLP3&SAI4_SAIAUsed_ForRCC ) |(USART16CLKSOURCE_PLLQ3&(USART6Used_ForRCC|USART1Used_ForRCC))|(USART2CLKSOURCE_PLLQ3& (USART3Used_ForRCC|USART2Used_ForRCC|UART4Used_ForRCC|UART7Used_ForRCC|UART8Used_ForRCC|UART5Used_ForRCC))|(LPUART1CLKSOURCE_PLL3Q&LPUARTUsed_ForRCC)|(SPI6CLKSOURCE_PLLQ3&SPI6Used_ForRCC)|(SPI45CLKSOURCE_PLLQ3&(SPI4Used_ForRCC|SPI5Used_ForRCC))|(USBCLKSOURCE_PLL3Q &( USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC|USB_OTG_HSUsed_ForRCC))|(I2C123CLKSOURCE_PLLR3&(I2C2Used_ForRCC|I2C3Used_ForRCC|I2C1Used_ForRCC))|(I2C4CLKSOURCE_PLLR3&I2C4Used_ForRCC)|(SPDIFCLKSOURCE_PLL3R&SPDIFRX1Used_ForRCC)|(LPTIM1CLKSOURCE_PLLR3&LPTIM1Used_ForRCC)|(LPTIM345CLKSOURCE_PLLR3&(LPTIM3Used_ForRCC|LPTIM4Used_ForRCC|LPTIM5Used_ForRCC))|(LPTIM2CLKSOURCE_PLLR3&LPTIM2Used_ForRCC)|(ADCCLKSOURCE_PLL3R&((USE_ADC1&ADC1UsedAsynchronousCLK_ForRCC)|(USE_ADC2&ADC2UsedAsynchronousCLK_ForRCC)|(USE_ADC3&ADC3UsedAsynchronousCLK_ForRCC)))",
                    .main_dialog = "",
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if ((scale1 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 70000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 70000000, .@"=")))))) {
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
                                "(scale1 &  (((HCLKFreq_Value < 70000000)|(HCLKFreq_Value =70000000))))",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale1 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"=")))))) {
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
                                "(scale1 &  (((HCLKFreq_Value < 140000000)|(HCLKFreq_Value =140000000))))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale1 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@"=")))))) {
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
                                "(scale1 &  (((HCLKFreq_Value < 210000000)|(HCLKFreq_Value =210000000))))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale1 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"=")))))) {
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
                                "(scale1 &  (((HCLKFreq_Value < 225000000)|(HCLKFreq_Value =225000000))))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale2 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 55000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 55000000, .@"=")))))) {
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
                                "\r\n\t\t(scale2 &  (((HCLKFreq_Value < 55000000)|(HCLKFreq_Value =55000000))))",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale2 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@"=")))))) {
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
                                "\r\n\t\t(scale2 &  (((HCLKFreq_Value < 110000000)|(HCLKFreq_Value =110000000))))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale2 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 165000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 165000000, .@"=")))))) {
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
                                "\r\n\t\t(scale2 &  (((HCLKFreq_Value < 165000000)|(HCLKFreq_Value =165000000))))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale2 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"<")))) {
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
                                "\r\n\t\t(scale2 &  (HCLKFreq_Value < 225000000))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale2 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"=")))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_4 => {},
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
                                    "\r\n\t\t(scale2 &  (HCLKFreq_Value =225000000))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_4",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_4;
                } else if ((scale3 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 45000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 45000000, .@"=")))))) {
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
                                "\r\n\t\t(scale3 &  (((HCLKFreq_Value < 45000000)|(HCLKFreq_Value =45000000))))",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale3 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"=")))))) {
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
                                "\r\n\t\t(scale3 &  (((HCLKFreq_Value < 90000000)|(HCLKFreq_Value =90000000))))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale3 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 135000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 135000000, .@"=")))))) {
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
                                "\r\n\t\t(scale3 &  (((HCLKFreq_Value < 135000000)|(HCLKFreq_Value =135000000))))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale3 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@"=")))))) {
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
                                "\r\n\t\t(scale3 &  (((HCLKFreq_Value < 180000000)|(HCLKFreq_Value =180000000))))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale3 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"=")))))) {
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
                                "\r\n\t\t(scale3 &  (((HCLKFreq_Value < 225000000)|(HCLKFreq_Value =225000000))))",
                                "",
                                "FLASH_LATENCY_4",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_4;
                } else if ((scale0 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 70000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 70000000, .@"=")))))) {
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
                                "(scale0 &  (((HCLKFreq_Value < 70000000)|(HCLKFreq_Value =70000000))))",
                                "",
                                "FLASH_LATENCY_0",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if ((scale0 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"=")))))) {
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
                                "(scale0 &  (((HCLKFreq_Value < 140000000)|(HCLKFreq_Value =140000000))))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale0 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@"=")))))) {
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
                                "(scale0 &  (((HCLKFreq_Value < 210000000)|(HCLKFreq_Value =210000000))))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale0 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 225000000, .@"=")))))) {
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
                                "(scale0 &  (((HCLKFreq_Value < 225000000)|(HCLKFreq_Value =225000000))))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale0 and (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 240000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 240000000, .@"=")))))) {
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
                                "(scale0 &  (((HCLKFreq_Value < 240000000)|(HCLKFreq_Value =240000000))))",
                                "",
                                "FLASH_LATENCY_4",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_4;
                }
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
                            "Else",
                            "No additional information",
                            "FLASH_LATENCY_0",
                            val,
                        });
                    }
                }
                break :blk .FLASH_LATENCY_0;
            };

            const PLL1_VCI_RangeValue: PLL1_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_1;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL1VCIRANGE_2;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@"=")))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
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
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"=")))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
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
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@"=")))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCIRANGE_3;
                } else if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL3VCIRANGE_3;
                }
                break :blk .RCC_PLL3VCIRANGE_3;
            };

            const PLL1_VCO_SELValue: PLL1_VCO_SELList = blk: {
                if (((check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 150000000, .@">") or (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 150000000, .@"="))) and (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 192000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL1_VCO_SEL) |val| {
                        if (val != .RCC_PLL1VCOMEDIUM) {
                            const patch_str = if (patch_logs) "MediumVCO" else "RCC_PLL1VCOMEDIUM";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL1_VCO_SEL",
                                "((VCO1OutputFreq_Value >150000000|(VCO1OutputFreq_Value=150000000)) & (VCO1OutputFreq_Value < 192000000)) & PLLUsed=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL1VCOMEDIUM;
                } else if (((check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 192000000, .@">") or (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 192000000, .@"="))) and (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 420000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    const user_val = config.extra_config.PLL1_VCO_SEL;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_PLL1VCOWIDE => {},
                            .RCC_PLL1VCOMEDIUM => {},
                        }
                    }
                    break :blk user_val orelse .RCC_PLL1VCOWIDE;
                } else if (((check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 420000000, .@">") or (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 420000000, .@"="))) and (check_ref(@TypeOf(VCO1OutputFreq_ValueValue), VCO1OutputFreq_ValueValue, 960000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL1_VCO_SEL) |val| {
                        if (val != .RCC_PLL1VCOWIDE) {
                            const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL1VCOWIDE";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL1_VCO_SEL",
                                "((VCO1OutputFreq_Value >420000000|(VCO1OutputFreq_Value=420000000)) & (VCO1OutputFreq_Value < 960000000)) & PLLUsed=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL1VCOWIDE;
                } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL1_VCO_SEL) |val| {
                        if (val != .RCC_PLL1VCOWIDE) {
                            const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL1VCOWIDE";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL1_VCO_SEL",
                                "PLLUsed=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL1VCOWIDE;
                }
                if (config.extra_config.PLL1_VCO_SEL) |val| {
                    if (val != .RCC_PLL1VCOWIDE) {
                        const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL1VCOWIDE";
                        const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: .{s}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "PLL1_VCO_SEL",
                            "Else",
                            "No additional information",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                break :blk .RCC_PLL1VCOWIDE;
            };

            const PLL2_VCO_SELValue: PLL2_VCO_SELList = blk: {
                if (((check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 150000000, .@">") or (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 150000000, .@"="))) and (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 192000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL2_VCO_SEL) |val| {
                        if (val != .RCC_PLL2VCOMEDIUM) {
                            const patch_str = if (patch_logs) "MediumVCO" else "RCC_PLL2VCOMEDIUM";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL2_VCO_SEL",
                                "((VCO2OutputFreq_Value >150000000|(VCO2OutputFreq_Value=150000000)) & (VCO2OutputFreq_Value < 192000000)) & PLL2Used=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL2VCOMEDIUM;
                } else if (((check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 192000000, .@">") or (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 192000000, .@"="))) and (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 420000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    const user_val = config.extra_config.PLL2_VCO_SEL;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_PLL2VCOWIDE => {},
                            .RCC_PLL2VCOMEDIUM => {},
                        }
                    }
                    break :blk user_val orelse .RCC_PLL2VCOWIDE;
                } else if (((check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 420000000, .@">") or (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 420000000, .@"="))) and (check_ref(@TypeOf(VCO2OutputFreq_ValueValue), VCO2OutputFreq_ValueValue, 960000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL2_VCO_SEL) |val| {
                        if (val != .RCC_PLL2VCOWIDE) {
                            const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL2VCOWIDE";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL2_VCO_SEL",
                                "((VCO2OutputFreq_Value >420000000|(VCO2OutputFreq_Value=420000000)) & (VCO2OutputFreq_Value < 960000000)) & PLL2Used=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL2VCOWIDE;
                } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL2_VCO_SEL) |val| {
                        if (val != .RCC_PLL2VCOWIDE) {
                            const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL2VCOWIDE";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL2_VCO_SEL",
                                " PLL2Used=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL2VCOWIDE;
                }
                if (config.extra_config.PLL2_VCO_SEL) |val| {
                    if (val != .RCC_PLL2VCOWIDE) {
                        const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL2VCOWIDE";
                        const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: .{s}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "PLL2_VCO_SEL",
                            "Else",
                            "No additional information",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                break :blk .RCC_PLL2VCOWIDE;
            };

            const PLL3_VCO_SELValue: PLL3_VCO_SELList = blk: {
                if (((check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 150000000, .@">") or (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 150000000, .@"="))) and (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 192000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL3_VCO_SEL) |val| {
                        if (val != .RCC_PLL3VCOMEDIUM) {
                            const patch_str = if (patch_logs) "MediumVCO" else "RCC_PLL3VCOMEDIUM";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL3_VCO_SEL",
                                "((VCO3OutputFreq_Value >150000000|(VCO3OutputFreq_Value=150000000)) & (VCO3OutputFreq_Value < 192000000)) & PLL3Used=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL3VCOMEDIUM;
                } else if (((check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 192000000, .@">") or (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 192000000, .@"="))) and (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 420000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    const user_val = config.extra_config.PLL3_VCO_SEL;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_PLL3VCOWIDE => {},
                            .RCC_PLL3VCOMEDIUM => {},
                        }
                    }
                    break :blk user_val orelse .RCC_PLL3VCOWIDE;
                } else if (((check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 420000000, .@">") or (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 420000000, .@"="))) and (check_ref(@TypeOf(VCO3OutputFreq_ValueValue), VCO3OutputFreq_ValueValue, 960000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL3_VCO_SEL) |val| {
                        if (val != .RCC_PLL3VCOWIDE) {
                            const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL3VCOWIDE";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL3_VCO_SEL",
                                "((VCO3OutputFreq_Value >420000000|(VCO3OutputFreq_Value=420000000)) & (VCO3OutputFreq_Value < 960000000)) & PLL3Used=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL3VCOWIDE;
                } else if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    if (config.extra_config.PLL3_VCO_SEL) |val| {
                        if (val != .RCC_PLL3VCOWIDE) {
                            const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL3VCOWIDE";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PLL3_VCO_SEL",
                                " PLL3Used=1  ",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLL3VCOWIDE;
                }
                if (config.extra_config.PLL3_VCO_SEL) |val| {
                    if (val != .RCC_PLL3VCOWIDE) {
                        const patch_str = if (patch_logs) "WideVCO" else "RCC_PLL3VCOWIDE";
                        const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: .{s}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "PLL3_VCO_SEL",
                            "Else",
                            "No additional information",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                break :blk .RCC_PLL3VCOWIDE;
            };
            if (!(check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"="))) {
                LSIRC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"="))) {
                I2S_CKIN.nodetype = .off;
            }
            if (!(true)) {
                traceClkSource.nodetype = .off;
            }
            if (!(true)) {
                TraceCLKOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"="))) {
                MCO1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"="))) {
                MCO1Div.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"="))) {
                MCO1Pin.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"="))) {
                MCO2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"="))) {
                MCO2Div.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"="))) {
                MCO2Pin.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                DSIPHYPrescaler.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                DSIMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                DSIoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                DSITXPrescaler.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                DSITXCLKEsc.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                PLLDSIIDF.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                PLLDSIMultiplicator.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                PLLDSINDIV.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                VCOoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableDSIValue), EnableDSIValue, .true, .@"="))) {
                PLLDSIDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                PLLDSIODF.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"="))) {
                PLLDSIoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(cKPerEnableValue), cKPerEnableValue, .true, .@"="))) {
                CKPERSource.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(cKPerEnableValue), cKPerEnableValue, .true, .@"="))) {
                CKPERoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"=") or config.flags.RBGEnable or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(QuadSPIEnableValue), QuadSPIEnableValue, .true, .@"=") or false)) {
                DIVQ1.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"=") or config.flags.RBGEnable or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(QuadSPIEnableValue), QuadSPIEnableValue, .true, .@"=") or false)) {
                DIVQ1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(TraceEnablePllValue), TraceEnablePllValue, .true, .@"="))) {
                DIVR1.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(TraceEnablePllValue), TraceEnablePllValue, .true, .@"="))) {
                DIVR1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"="))) {
                DIVP2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"="))) {
                DIVP2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16EnableValue), USART16EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                DIVQ2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16EnableValue), USART16EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                DIVQ2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(QuadSPIEnableValue), QuadSPIEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                DIVR2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(QuadSPIEnableValue), QuadSPIEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                DIVR2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"="))) {
                DIVP3.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"="))) {
                DIVP3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16EnableValue), USART16EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                DIVQ3.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART16EnableValue), USART16EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                DIVQ3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                DIVR3.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"="))) {
                LTDCOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                DIVR3output.nodetype = .off;
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
            if (!(check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"="))) {
                SPI123Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI123EnableValue), SPI123EnableValue, .true, .@"="))) {
                SPI123output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"="))) {
                SAI23Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI23EnableValue), SAI23EnableValue, .true, .@"="))) {
                SAI23output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"="))) {
                DFSDMACLKoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"="))) {
                SAI4BMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI4BEnableValue), SAI4BEnableValue, .true, .@"="))) {
                SAI4Boutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"="))) {
                SAI4AMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI4AEnableValue), SAI4AEnableValue, .true, .@"="))) {
                SAI4Aoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"="))) {
                I2C123Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C123EnableValue), I2C123EnableValue, .true, .@"="))) {
                I2C123output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"="))) {
                I2C4Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"="))) {
                I2C4output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                SPDIFMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                SPDIFoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(QuadSPIEnableValue), QuadSPIEnableValue, .true, .@"="))) {
                QSPIMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(QuadSPIEnableValue), QuadSPIEnableValue, .true, .@"="))) {
                QSPIoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"="))) {
                FMCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"="))) {
                FMCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SWPEnableValue), SWPEnableValue, .true, .@"="))) {
                SWPMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SWPEnableValue), SWPEnableValue, .true, .@"="))) {
                SWPoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"="))) {
                SDMMCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"="))) {
                SDMMCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(DFSDMEnableValue), DFSDMEnableValue, .true, .@"="))) {
                DFSDMMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(DFSDMEnableValue), DFSDMEnableValue, .true, .@"="))) {
                DFSDMoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART16EnableValue), USART16EnableValue, .true, .@"="))) {
                USART16Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART16EnableValue), USART16EnableValue, .true, .@"="))) {
                USART16output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"="))) {
                USART234578Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"="))) {
                USART234578output.nodetype = .off;
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
            if (!(check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"="))) {
                LPTIM345Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM345EnableValue), LPTIM345EnableValue, .true, .@"="))) {
                LPTIM345output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"="))) {
                LPTIM2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"="))) {
                LPTIM2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"="))) {
                SPI6Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"="))) {
                SPI6output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                SPI45Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                SPI45output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                USBMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                USBoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"="))) {
                CECMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"="))) {
                CECoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(HRTIMEnableValue), HRTIMEnableValue, .true, .@"="))) {
                HrtimMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(HRTIMEnableValue), HRTIMEnableValue, .true, .@"="))) {
                HRTIMoutput.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.HSIDiv = try HSIDiv.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.CSIRC = try CSIRC.get_output();
            out.RC48 = try RC48.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.traceClkSource = try traceClkSource.get_output();
            out.TraceCLKOutput = try TraceCLKOutput.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.MCO1Mult = try MCO1Mult.get_output();
            out.MCO1Div = try MCO1Div.get_output();
            out.MCO1Pin = try MCO1Pin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.DSIPHYPrescaler = try DSIPHYPrescaler.get_output();
            out.DSIMult = try DSIMult.get_output();
            out.DSIoutput = try DSIoutput.get_output();
            out.DSITXPrescaler = try DSITXPrescaler.get_output();
            out.DSITXCLKEsc = try DSITXCLKEsc.get_output();
            out.PLLDSIIDF = try PLLDSIIDF.get_output();
            out.PLLDSIMultiplicator = try PLLDSIMultiplicator.get_output();
            out.PLLDSINDIV = try PLLDSINDIV.get_output();
            out.VCOoutput = try VCOoutput.get_output();
            out.PLLDSIDevisor = try PLLDSIDevisor.get_output();
            out.PLLDSIODF = try PLLDSIODF.get_output();
            out.PLLDSIoutput = try PLLDSIoutput.get_output();
            out.D1CPRE = try D1CPRE.get_output();
            out.D1CPREOutput = try D1CPREOutput.get_output();
            out.CpuClockOutput = try CpuClockOutput.get_output();
            out.CortexPrescaler = try CortexPrescaler.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.HPRE = try HPRE.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.Cortex2Prescaler = try Cortex2Prescaler.get_output();
            out.CPU2ClockOutput = try CPU2ClockOutput.get_output();
            out.CPU2SystikOutput = try CPU2SystikOutput.get_output();
            out.AXIClockOutput = try AXIClockOutput.get_output();
            out.HCLK3Output = try HCLK3Output.get_output();
            out.D1PPRE = try D1PPRE.get_output();
            out.APB3Output = try APB3Output.get_output();
            out.D2PPRE1 = try D2PPRE1.get_output();
            out.Tim1Mul = try Tim1Mul.get_output();
            out.Tim1Output = try Tim1Output.get_output();
            out.AHB12Output = try AHB12Output.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.D2PPRE2 = try D2PPRE2.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.Tim2Mul = try Tim2Mul.get_output();
            out.Tim2Output = try Tim2Output.get_output();
            out.AHB4Output = try AHB4Output.get_output();
            out.D3PPRE = try D3PPRE.get_output();
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
            out.DIVP3 = try DIVP3.get_output();
            out.PLL3FRACN = try PLL3FRACN.get_output();
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
            out.SPI123Mult = try SPI123Mult.get_output();
            out.SPI123output = try SPI123output.get_output();
            out.SAI23Mult = try SAI23Mult.get_output();
            out.SAI23output = try SAI23output.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.DFSDMACLKoutput = try DFSDMACLKoutput.get_output();
            out.SAI1output = try SAI1output.get_output();
            out.SAI4BMult = try SAI4BMult.get_output();
            out.SAI4Boutput = try SAI4Boutput.get_output();
            out.SAI4AMult = try SAI4AMult.get_output();
            out.SAI4Aoutput = try SAI4Aoutput.get_output();
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
            out.HrtimMult = try HrtimMult.get_output();
            out.HRTIMoutput = try HRTIMoutput.get_output();
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
            ignore_value(RC48_VALUEValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.traceClkSourceVirtual = traceClkSourceVirtualValue;
            ignore_value(TraceFreq_ValueValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv1 = RCC_MCODiv1Value;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCODiv2 = RCC_MCODiv2Value;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.DSIPHY_Div = DSIPHY_DivValue;
            ref_out.DSICLockSelection = DSICLockSelectionValue;
            ignore_value(DSIFreq_ValueValue);
            ref_out.DSITX_Div = DSITX_DivValue;
            ignore_value(DSITXEscFreq_ValueValue);
            ref_out.PLLDSIIDF = PLLDSIIDFValue;
            ref_out.PLLDSIMult = PLLDSIMultValue;
            ref_out.PLLDSINDIV = PLLDSINDIVValue;
            ignore_value(PLLDSIVCOFreq_ValueValue);
            ref_out.PLLDSIDev = PLLDSIDevValue;
            ref_out.PLLDSIODF = PLLDSIODFValue;
            ignore_value(PLLDSIFreq_ValueValue);
            ref_out.D1CPRE = D1CPREValue;
            ignore_value(D1CPREFreq_ValueValue);
            ignore_value(CpuClockFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ref_out.HPRE = HPREValue;
            ignore_value(HCLKFreq_ValueValue);
            ref_out.Cortex2_Div = Cortex2_DivValue;
            ignore_value(CPU2Freq_ValueValue);
            ignore_value(CPU2SystikFreq_ValueValue);
            ignore_value(AXIClockFreq_ValueValue);
            ignore_value(HCLK3ClockFreq_ValueValue);
            ref_out.D1PPRE = D1PPREValue;
            ignore_value(APB3Freq_ValueValue);
            ref_out.D2PPRE1 = D2PPRE1Value;
            ref_out.Tim1Mul = Tim1MulValue;
            ignore_value(Tim1OutputFreq_ValueValue);
            ignore_value(AHB12Freq_ValueValue);
            ignore_value(APB1Freq_ValueValue);
            ref_out.D2PPRE2 = D2PPRE2Value;
            ignore_value(APB2Freq_ValueValue);
            ref_out.Tim2Mul = Tim2MulValue;
            ignore_value(Tim2OutputFreq_ValueValue);
            ignore_value(AHB4Freq_ValueValue);
            ref_out.D3PPRE = D3PPREValue;
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
            ref_out.DIVP3 = DIVP3Value;
            ignore_value(PLL3FRACNValue);
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
            ref_out.SPI123CLockSelection = SPI123CLockSelectionValue;
            ignore_value(SPI123Freq_ValueValue);
            ref_out.SAI23CLockSelection = SAI23CLockSelectionValue;
            ignore_value(SAI23Freq_ValueValue);
            ref_out.SAI1CLockSelection = SAI1CLockSelectionValue;
            ignore_value(DFSDMACLkFreq_ValueValue);
            ignore_value(SAI1Freq_ValueValue);
            ref_out.SAI4BCLockSelection = SAI4BCLockSelectionValue;
            ignore_value(SAI4BFreq_ValueValue);
            ref_out.SAI4ACLockSelection = SAI4ACLockSelectionValue;
            ignore_value(SAI4AFreq_ValueValue);
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
            ref_out.HRTIMCLockSelection = HRTIMCLockSelectionValue;
            ignore_value(HRTIMFreq_ValueValue);
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
            ref_out.ProductRev = ProductRevValue;
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
            ref_out.flags.TraceEnable = TraceEnableValue == .auto;
            ref_out.flags.MCO1OutPutEnable = MCO1OutPutEnableValue == .true;
            ref_out.flags.MCO2OutPutEnable = MCO2OutPutEnableValue == .true;
            ref_out.flags.EnableHSEDSI = EnableHSEDSIValue == .true;
            ref_out.flags.EnableDSI = EnableDSIValue == .true;
            ref_out.flags.cKPerEnable = cKPerEnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.SDMMC1Enable = SDMMC1EnableValue == .true;
            ref_out.flags.SAI4AEnable = SAI4AEnableValue == .true;
            ref_out.flags.SAI4BEnable = SAI4BEnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.SAI23Enable = SAI23EnableValue == .true;
            ref_out.flags.SPI123Enable = SPI123EnableValue == .true;
            ref_out.flags.SPDIFEnable = SPDIFEnableValue == .true;
            ref_out.flags.FDCANEnable = FDCANEnableValue == .true;
            ref_out.flags.FMCEnable = FMCEnableValue == .true;
            ref_out.flags.QuadSPIEnable = QuadSPIEnableValue == .true;
            ref_out.flags.TraceEnablePll = TraceEnablePllValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.LPTIM345Enable = LPTIM345EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.SPI6Enable = SPI6EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.USART234578Enable = USART234578EnableValue == .true;
            ref_out.flags.USART16Enable = USART16EnableValue == .true;
            ref_out.flags.SPI45Enable = SPI45EnableValue == .true;
            ref_out.flags.LTDCEnable = LTDCEnableValue == .true;
            ref_out.flags.I2C4Enable = I2C4EnableValue == .true;
            ref_out.flags.I2C123Enable = I2C123EnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.EnableDFSDMAudio = EnableDFSDMAudioValue == .true;
            ref_out.flags.SWPEnable = SWPEnableValue == .true;
            ref_out.flags.DFSDMEnable = DFSDMEnableValue == .true;
            ref_out.flags.CECEnable = CECEnableValue == .true;
            ref_out.flags.HRTIMEnable = HRTIMEnableValue == .true;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.PLL2Used = PLL2UsedValue != 0;
            ref_out.flags.PLL3Used = PLL3UsedValue != 0;
            ref_out.flags.EnablePLLRDSI = false;
            ignore_value(EnablePLLRDSIValue);
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.MCO2I2SEnable = MCO2I2SEnableValue == .true;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
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
