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
        pub const RCC_PSSISEL = enum(u1) {
            PLL3_R = 0,
            PER = 1,
        };
        pub const RCC_SAI2SEL = enum(u3) {
            PLL1_Q = 0,
            PLL2_P = 1,
            PLL3_P = 2,
            I2S_CKIN = 3,
            PER = 4,
            SPDIFRX_SYMB = 5,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_ETH_REF_CLK_SEL = enum(u2) {
            ETH_RMII_REF = 0,
            HSE = 1,
            ETH = 2,
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
            HCLK5 = 0,
            PLL1_Q = 1,
            PLL2_R = 2,
            HSI = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_USB_OTG_FSSEL = enum(u2) {
            HSI48 = 0,
            PLL3_Q = 1,
            HSE = 2,
            CLK48MOHCI = 3,
        };
        pub const RCC_LPTIMSEL = enum(u3) {
            PCLK4 = 0,
            PLL2_P = 1,
            PLL3_R = 2,
            LSE = 3,
            LSI = 4,
            PER = 5,
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
        pub const RCC_SPDIFRXSEL = enum(u2) {
            PLL1_Q = 0,
            PLL2_R = 1,
            PLL3_R = 2,
            HSI = 3,
        };
        pub const RCC_SPI123SEL = enum(u3) {
            PLL1_Q = 0,
            PLL2_P = 1,
            PLL3_P = 2,
            I2S_CKIN = 3,
            PER = 4,
        };
        pub const RCC_HSIDIV = enum(u2) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const PWR_VOS = enum(u1) {
            Low = 0,
            High = 1,
        };
        pub const RCC_USART1SEL = enum(u3) {
            PCLK2 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            LSE = 5,
        };
        pub const RCC_SDMMCSEL = enum(u1) {
            PLL2_S = 0,
            PLL2_T = 1,
        };
        pub const RCC_SPI6SEL = enum(u3) {
            PCLK4 = 0,
            PLL2_Q = 1,
            PLL3_Q = 2,
            HSI = 3,
            CSI = 4,
            HSE = 5,
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
        pub const RCC_SAI1SEL = enum(u3) {
            PLL1_Q = 0,
            PLL2_P = 1,
            PLL3_P = 2,
            I2S_CKIN = 3,
            PER = 4,
        };
        pub const RCC_ETHPHY_CLK_SEL = enum(u1) {
            HSE = 0,
            PLL3_S = 1,
        };
        pub const RCC_PLLRGE = enum(u2) {
            Range1 = 0,
            Range2 = 1,
            Range4 = 2,
            Range8 = 3,
        };
        pub const RCC_PLLSRC = enum(u2) {
            HSI = 0,
            CSI = 1,
            HSE = 2,
        };
        pub const RCC_FDCANSEL = enum(u2) {
            HSE = 0,
            PLL1_Q = 1,
            PLL2_P = 2,
        };
        pub const RCC_XSPISEL = enum(u2) {
            HCLK5 = 0,
            PLL2_S = 1,
        };
        pub const RCC_CECSEL = enum(u2) {
            LSE = 0,
            LSI = 1,
            CSI = 2,
        };
        pub const RCC_USBPHYCSEL = enum(u2) {
            HSE = 0,
            HSE_DIV_2 = 1,
            PLL3_Q = 2,
        };
        pub const RCC_I2C1_I3C1SEL = enum(u2) {
            PCLK1 = 0,
            PLL3_R = 1,
            HSI = 2,
            CSI = 3,
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
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_HSI48,
            RCC_MCO1SOURCE_PLL1Q,

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
            RCC_MCO2SOURCE_PLL2P,
            RCC_MCO2SOURCE_HSE,
            RCC_MCO2SOURCE_PLL1P,
            RCC_MCO2SOURCE_CSI,
            RCC_MCO2SOURCE_LSI,

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

        pub const CPREList = enum {
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

        pub const TPIUList = enum {
            RCC_TPIU_DIV,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_TPIU_DIV => 3,
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

        pub const BMPREList = enum {
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

        pub const PPRE5List = enum {
            RCC_APB5_DIV1,
            RCC_APB5_DIV2,
            RCC_APB5_DIV4,
            RCC_APB5_DIV8,
            RCC_APB5_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_APB5_DIV16 => .Div16,
                    .RCC_APB5_DIV1 => .Div1,
                    .RCC_APB5_DIV2 => .Div2,
                    .RCC_APB5_DIV8 => .Div8,
                    .RCC_APB5_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div16 => .RCC_APB5_DIV16,
                    .Div1 => .RCC_APB5_DIV1,
                    .Div2 => .RCC_APB5_DIV2,
                    .Div8 => .RCC_APB5_DIV8,
                    .Div4 => .RCC_APB5_DIV4,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_APB5_DIV1 => 1,
                    .RCC_APB5_DIV2 => 2,
                    .RCC_APB5_DIV4 => 4,
                    .RCC_APB5_DIV8 => 8,
                    .RCC_APB5_DIV16 => 16,
                };
            }
        };

        pub const PPRE1List = enum {
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

        pub const PPRE2List = enum {
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

        pub const PPRE4List = enum {
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

        pub const PLLSourceList = enum {
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_CSI,
            RCC_PLLSOURCE_HSE,

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

        pub const DIVP1List = enum {
            @"1",
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
                    .@"1" => .Div1,
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
                    .Div1 => .@"1",
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
                    .@"1" => 1,
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

        pub const HSIDivToUCPDList = enum {
            RCC_UCPDCLKSOURCE_HSI4,

            pub fn to_enum(self: @This()) anyerror!RCC_HSIDIV {
                return switch (self) {
                    .RCC_UCPDCLKSOURCE_HSI4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_HSIDIV) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_UCPDCLKSOURCE_HSI4,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HSIDIV", @tagName(item), "HSIDivToUCPD" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_UCPDCLKSOURCE_HSI4 => 4,
                };
            }
        };

        pub const SPI1CLockSelectionList = enum {
            RCC_SPI1CLKSOURCE_PLL1Q,
            RCC_SPI1CLKSOURCE_PLL2P,
            RCC_SPI1CLKSOURCE_PLL3P,
            RCC_SPI1CLKSOURCE_PIN,
            RCC_SPI1CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI123SEL {
                return switch (self) {
                    .RCC_SPI1CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SPI1CLKSOURCE_CLKP => .PER,
                    .RCC_SPI1CLKSOURCE_PLL3P => .PLL3_P,
                    .RCC_SPI1CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_SPI1CLKSOURCE_PLL1Q => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_SPI123SEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_SPI1CLKSOURCE_PIN,
                    .PER => .RCC_SPI1CLKSOURCE_CLKP,
                    .PLL3_P => .RCC_SPI1CLKSOURCE_PLL3P,
                    .PLL2_P => .RCC_SPI1CLKSOURCE_PLL2P,
                    .PLL1_Q => .RCC_SPI1CLKSOURCE_PLL1Q,
                };
            }
        };

        pub const SPI23CLockSelectionList = enum {
            RCC_SPI23CLKSOURCE_PLL1Q,
            RCC_SPI23CLKSOURCE_PLL2P,
            RCC_SPI23CLKSOURCE_PLL3P,
            RCC_SPI23CLKSOURCE_PIN,
            RCC_SPI23CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI123SEL {
                return switch (self) {
                    .RCC_SPI23CLKSOURCE_PLL1Q => .PLL1_Q,
                    .RCC_SPI23CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SPI23CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_SPI23CLKSOURCE_CLKP => .PER,
                    .RCC_SPI23CLKSOURCE_PLL3P => .PLL3_P,
                };
            }
            pub fn from_enum(item: RCC_SPI123SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_SPI23CLKSOURCE_PLL1Q,
                    .I2S_CKIN => .RCC_SPI23CLKSOURCE_PIN,
                    .PLL2_P => .RCC_SPI23CLKSOURCE_PLL2P,
                    .PER => .RCC_SPI23CLKSOURCE_CLKP,
                    .PLL3_P => .RCC_SPI23CLKSOURCE_PLL3P,
                };
            }
        };

        pub const SAI1CLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_PLL1Q,
            RCC_SAI1CLKSOURCE_PLL2P,
            RCC_SAI1CLKSOURCE_PLL3P,
            RCC_SAI1CLKSOURCE_PIN,
            RCC_SAI1CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_SAI1SEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_SAI1CLKSOURCE_PLL3P => .PLL3_P,
                    .RCC_SAI1CLKSOURCE_PLL1Q => .PLL1_Q,
                    .RCC_SAI1CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI1CLKSOURCE_CLKP => .PER,
                };
            }
            pub fn from_enum(item: RCC_SAI1SEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_SAI1CLKSOURCE_PLL2P,
                    .PLL3_P => .RCC_SAI1CLKSOURCE_PLL3P,
                    .PLL1_Q => .RCC_SAI1CLKSOURCE_PLL1Q,
                    .I2S_CKIN => .RCC_SAI1CLKSOURCE_PIN,
                    .PER => .RCC_SAI1CLKSOURCE_CLKP,
                };
            }
        };

        pub const SAI2CLockSelectionList = enum {
            RCC_SAI2CLKSOURCE_PLL1Q,
            RCC_SAI2CLKSOURCE_PLL2P,
            RCC_SAI2CLKSOURCE_PLL3P,
            RCC_SAI2CLKSOURCE_PIN,
            RCC_SAI2CLKSOURCE_CLKP,
            RCC_SAI2CLKSOURCE_SPDIF,

            pub fn to_enum(self: @This()) anyerror!RCC_SAI2SEL {
                return switch (self) {
                    .RCC_SAI2CLKSOURCE_PLL1Q => .PLL1_Q,
                    .RCC_SAI2CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_SAI2CLKSOURCE_PIN => .I2S_CKIN,
                    .RCC_SAI2CLKSOURCE_SPDIF => .SPDIFRX_SYMB,
                    .RCC_SAI2CLKSOURCE_CLKP => .PER,
                    .RCC_SAI2CLKSOURCE_PLL3P => .PLL3_P,
                };
            }
            pub fn from_enum(item: RCC_SAI2SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_SAI2CLKSOURCE_PLL1Q,
                    .PLL2_P => .RCC_SAI2CLKSOURCE_PLL2P,
                    .I2S_CKIN => .RCC_SAI2CLKSOURCE_PIN,
                    .SPDIFRX_SYMB => .RCC_SAI2CLKSOURCE_SPDIF,
                    .PER => .RCC_SAI2CLKSOURCE_CLKP,
                    .PLL3_P => .RCC_SAI2CLKSOURCE_PLL3P,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
            RCC_I2C1_I3C1CLKSOURCE_PCLK1,
            RCC_I2C1_I3C1CLKSOURCE_PLL3R,
            RCC_I2C1_I3C1CLKSOURCE_HSI,
            RCC_I2C1_I3C1CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C1_I3C1SEL {
                return switch (self) {
                    .RCC_I2C1_I3C1CLKSOURCE_HSI => .HSI,
                    .RCC_I2C1_I3C1CLKSOURCE_PLL3R => .PLL3_R,
                    .RCC_I2C1_I3C1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C1_I3C1CLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_I2C1_I3C1SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C1_I3C1CLKSOURCE_HSI,
                    .PLL3_R => .RCC_I2C1_I3C1CLKSOURCE_PLL3R,
                    .PCLK1 => .RCC_I2C1_I3C1CLKSOURCE_PCLK1,
                    .CSI => .RCC_I2C1_I3C1CLKSOURCE_CSI,
                };
            }
        };

        pub const I2C23CLockSelectionList = enum {
            RCC_I2C23CLKSOURCE_PCLK1,
            RCC_I2C23CLKSOURCE_PLL3R,
            RCC_I2C23CLKSOURCE_HSI,
            RCC_I2C23CLKSOURCE_CSI,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C23CLKSOURCE_PLL3R => .PLL3_R,
                    .RCC_I2C23CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C23CLKSOURCE_HSI => .HSI,
                    .RCC_I2C23CLKSOURCE_CSI => .CSI,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_R => .RCC_I2C23CLKSOURCE_PLL3R,
                    .PCLK1 => .RCC_I2C23CLKSOURCE_PCLK1,
                    .HSI => .RCC_I2C23CLKSOURCE_HSI,
                    .CSI => .RCC_I2C23CLKSOURCE_CSI,
                };
            }
        };

        pub const SPDIFCLockSelectionList = enum {
            RCC_SPDIFRXCLKSOURCE_PLL1Q,
            RCC_SPDIFRXCLKSOURCE_PLL2R,
            RCC_SPDIFRXCLKSOURCE_PLL3R,
            RCC_SPDIFRXCLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SPDIFRXSEL {
                return switch (self) {
                    .RCC_SPDIFRXCLKSOURCE_HSI => .HSI,
                    .RCC_SPDIFRXCLKSOURCE_PLL2R => .PLL2_R,
                    .RCC_SPDIFRXCLKSOURCE_PLL3R => .PLL3_R,
                    .RCC_SPDIFRXCLKSOURCE_PLL1Q => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_SPDIFRXSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SPDIFRXCLKSOURCE_HSI,
                    .PLL2_R => .RCC_SPDIFRXCLKSOURCE_PLL2R,
                    .PLL3_R => .RCC_SPDIFRXCLKSOURCE_PLL3R,
                    .PLL1_Q => .RCC_SPDIFRXCLKSOURCE_PLL1Q,
                };
            }
        };

        pub const FmcClockSelectionList = enum {
            RCC_FMCCLKSOURCE_HCLK,
            RCC_FMCCLKSOURCE_PLL1Q,
            RCC_FMCCLKSOURCE_PLL2R,
            RCC_FMCCLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_FMCSEL {
                return switch (self) {
                    .RCC_FMCCLKSOURCE_HSI => .HSI,
                    .RCC_FMCCLKSOURCE_PLL2R => .PLL2_R,
                    .RCC_FMCCLKSOURCE_HCLK => .HCLK5,
                    .RCC_FMCCLKSOURCE_PLL1Q => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_FMCSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_FMCCLKSOURCE_HSI,
                    .PLL2_R => .RCC_FMCCLKSOURCE_PLL2R,
                    .HCLK5 => .RCC_FMCCLKSOURCE_HCLK,
                    .PLL1_Q => .RCC_FMCCLKSOURCE_PLL1Q,
                };
            }
        };

        pub const SDMMC1CLockSelectionList = enum {
            RCC_SDMMC12CLKSOURCE_PLL2S,
            RCC_SDMMC12CLKSOURCE_PLL2T,

            pub fn to_enum(self: @This()) anyerror!RCC_SDMMCSEL {
                return switch (self) {
                    .RCC_SDMMC12CLKSOURCE_PLL2T => .PLL2_T,
                    .RCC_SDMMC12CLKSOURCE_PLL2S => .PLL2_S,
                };
            }
            pub fn from_enum(item: RCC_SDMMCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_T => .RCC_SDMMC12CLKSOURCE_PLL2T,
                    .PLL2_S => .RCC_SDMMC12CLKSOURCE_PLL2S,
                };
            }
        };

        pub const USART1CLockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK2,
            RCC_USART1CLKSOURCE_PLL2Q,
            RCC_USART1CLKSOURCE_PLL3Q,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_CSI,
            RCC_USART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART1SEL {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_PCLK2 => .PCLK2,
                    .RCC_USART1CLKSOURCE_CSI => .CSI,
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                    .RCC_USART1CLKSOURCE_PLL2Q => .PLL2_Q,
                    .RCC_USART1CLKSOURCE_PLL3Q => .PLL3_Q,
                };
            }
            pub fn from_enum(item: RCC_USART1SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK2 => .RCC_USART1CLKSOURCE_PCLK2,
                    .CSI => .RCC_USART1CLKSOURCE_CSI,
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
                    .PLL2_Q => .RCC_USART1CLKSOURCE_PLL2Q,
                    .PLL3_Q => .RCC_USART1CLKSOURCE_PLL3Q,
                };
            }
        };

        pub const Adf1ClockSelectionList = enum {
            RCC_ADF1CLKSOURCE_HCLK,
            RCC_ADF1CLKSOURCE_PLL2P,
            RCC_ADF1CLKSOURCE_PLL3P,
            RCC_ADF1CLKSOURCE_PIN,
            RCC_ADF1CLKSOURCE_CSI,
            RCC_ADF1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM1SEL {
                return switch (self) {
                    .RCC_ADF1CLKSOURCE_PIN => .LSE,
                    .RCC_ADF1CLKSOURCE_HSI => .LSI,
                    .RCC_ADF1CLKSOURCE_CSI => .PER,
                    .RCC_ADF1CLKSOURCE_PLL3P => .PLL3_R,
                    .RCC_ADF1CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_ADF1CLKSOURCE_HCLK => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_ADF1CLKSOURCE_PIN,
                    .LSI => .RCC_ADF1CLKSOURCE_HSI,
                    .PER => .RCC_ADF1CLKSOURCE_CSI,
                    .PLL3_R => .RCC_ADF1CLKSOURCE_PLL3P,
                    .PLL2_P => .RCC_ADF1CLKSOURCE_PLL2P,
                    .PCLK1 => .RCC_ADF1CLKSOURCE_HCLK,
                };
            }
        };

        pub const USART234578CLockSelectionList = enum {
            RCC_USART234578CLKSOURCE_PCLK1,
            RCC_USART234578CLKSOURCE_PLL2Q,
            RCC_USART234578CLKSOURCE_PLL3Q,
            RCC_USART234578CLKSOURCE_HSI,
            RCC_USART234578CLKSOURCE_CSI,
            RCC_USART234578CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART234578SEL {
                return switch (self) {
                    .RCC_USART234578CLKSOURCE_PLL2Q => .PLL2_Q,
                    .RCC_USART234578CLKSOURCE_LSE => .LSE,
                    .RCC_USART234578CLKSOURCE_PLL3Q => .PLL3_Q,
                    .RCC_USART234578CLKSOURCE_CSI => .CSI,
                    .RCC_USART234578CLKSOURCE_HSI => .HSI,
                    .RCC_USART234578CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USART234578SEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_USART234578CLKSOURCE_PLL2Q,
                    .LSE => .RCC_USART234578CLKSOURCE_LSE,
                    .PLL3_Q => .RCC_USART234578CLKSOURCE_PLL3Q,
                    .CSI => .RCC_USART234578CLKSOURCE_CSI,
                    .HSI => .RCC_USART234578CLKSOURCE_HSI,
                    .PCLK1 => .RCC_USART234578CLKSOURCE_PCLK1,
                };
            }
        };

        pub const LPUART1CLockSelectionList = enum {
            RCC_LPUART1CLKSOURCE_PCLK4,
            RCC_LPUART1CLKSOURCE_PLL2Q,
            RCC_LPUART1CLKSOURCE_PLL3Q,
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_CSI,
            RCC_LPUART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPUARTSEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_PLL3Q => .PLL3_Q,
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_CSI => .CSI,
                    .RCC_LPUART1CLKSOURCE_PCLK4 => .PCLK4,
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_PLL2Q => .PLL2_Q,
                };
            }
            pub fn from_enum(item: RCC_LPUARTSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_Q => .RCC_LPUART1CLKSOURCE_PLL3Q,
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .CSI => .RCC_LPUART1CLKSOURCE_CSI,
                    .PCLK4 => .RCC_LPUART1CLKSOURCE_PCLK4,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PLL2_Q => .RCC_LPUART1CLKSOURCE_PLL2Q,
                };
            }
        };

        pub const LPTIM1CLockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_PCLK1,
            RCC_LPTIM1CLKSOURCE_PLL2P,
            RCC_LPTIM1CLKSOURCE_PLL3R,
            RCC_LPTIM1CLKSOURCE_LSE,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM1SEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPTIM1CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_LPTIM1CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM1CLKSOURCE_PLL3R => .PLL3_R,
                };
            }
            pub fn from_enum(item: RCC_LPTIM1SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_PCLK1,
                    .PLL2_P => .RCC_LPTIM1CLKSOURCE_PLL2P,
                    .PER => .RCC_LPTIM1CLKSOURCE_CLKP,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                    .PLL3_R => .RCC_LPTIM1CLKSOURCE_PLL3R,
                };
            }
        };

        pub const LPTIM23CLockSelectionList = enum {
            RCC_LPTIM23CLKSOURCE_PCLK4,
            RCC_LPTIM23CLKSOURCE_PLL2P,
            RCC_LPTIM23CLKSOURCE_PLL3R,
            RCC_LPTIM23CLKSOURCE_LSE,
            RCC_LPTIM23CLKSOURCE_LSI,
            RCC_LPTIM23CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPTIM23CLKSOURCE_PLL3R => .PLL3_R,
                    .RCC_LPTIM23CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM23CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_LPTIM23CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM23CLKSOURCE_PCLK4 => .PCLK4,
                    .RCC_LPTIM23CLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_R => .RCC_LPTIM23CLKSOURCE_PLL3R,
                    .LSE => .RCC_LPTIM23CLKSOURCE_LSE,
                    .PLL2_P => .RCC_LPTIM23CLKSOURCE_PLL2P,
                    .PER => .RCC_LPTIM23CLKSOURCE_CLKP,
                    .PCLK4 => .RCC_LPTIM23CLKSOURCE_PCLK4,
                    .LSI => .RCC_LPTIM23CLKSOURCE_LSI,
                };
            }
        };

        pub const LPTIM45CLockSelectionList = enum {
            RCC_LPTIM45CLKSOURCE_PCLK4,
            RCC_LPTIM45CLKSOURCE_PLL2P,
            RCC_LPTIM45CLKSOURCE_PLL3R,
            RCC_LPTIM45CLKSOURCE_LSE,
            RCC_LPTIM45CLKSOURCE_LSI,
            RCC_LPTIM45CLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPTIM45CLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_LPTIM45CLKSOURCE_PLL3R => .PLL3_R,
                    .RCC_LPTIM45CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM45CLKSOURCE_CLKP => .PER,
                    .RCC_LPTIM45CLKSOURCE_PCLK4 => .PCLK4,
                    .RCC_LPTIM45CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_LPTIM45CLKSOURCE_PLL2P,
                    .PLL3_R => .RCC_LPTIM45CLKSOURCE_PLL3R,
                    .LSI => .RCC_LPTIM45CLKSOURCE_LSI,
                    .PER => .RCC_LPTIM45CLKSOURCE_CLKP,
                    .PCLK4 => .RCC_LPTIM45CLKSOURCE_PCLK4,
                    .LSE => .RCC_LPTIM45CLKSOURCE_LSE,
                };
            }
        };

        pub const SPI6CLockSelectionList = enum {
            RCC_SPI6CLKSOURCE_PCLK4,
            RCC_SPI6CLKSOURCE_PLL2Q,
            RCC_SPI6CLKSOURCE_PLL3Q,
            RCC_SPI6CLKSOURCE_HSI,
            RCC_SPI6CLKSOURCE_CSI,
            RCC_SPI6CLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI6SEL {
                return switch (self) {
                    .RCC_SPI6CLKSOURCE_PLL3Q => .PLL3_Q,
                    .RCC_SPI6CLKSOURCE_CSI => .CSI,
                    .RCC_SPI6CLKSOURCE_HSI => .HSI,
                    .RCC_SPI6CLKSOURCE_HSE => .HSE,
                    .RCC_SPI6CLKSOURCE_PLL2Q => .PLL2_Q,
                    .RCC_SPI6CLKSOURCE_PCLK4 => .PCLK4,
                };
            }
            pub fn from_enum(item: RCC_SPI6SEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_Q => .RCC_SPI6CLKSOURCE_PLL3Q,
                    .CSI => .RCC_SPI6CLKSOURCE_CSI,
                    .HSI => .RCC_SPI6CLKSOURCE_HSI,
                    .HSE => .RCC_SPI6CLKSOURCE_HSE,
                    .PLL2_Q => .RCC_SPI6CLKSOURCE_PLL2Q,
                    .PCLK4 => .RCC_SPI6CLKSOURCE_PCLK4,
                };
            }
        };

        pub const Spi45ClockSelectionList = enum {
            RCC_SPI45CLKSOURCE_PCLK2,
            RCC_SPI45CLKSOURCE_PLL2Q,
            RCC_SPI45CLKSOURCE_PLL3Q,
            RCC_SPI45CLKSOURCE_HSI,
            RCC_SPI45CLKSOURCE_CSI,
            RCC_SPI45CLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI45SEL {
                return switch (self) {
                    .RCC_SPI45CLKSOURCE_CSI => .CSI,
                    .RCC_SPI45CLKSOURCE_HSE => .HSE,
                    .RCC_SPI45CLKSOURCE_PCLK2 => .PCLK2,
                    .RCC_SPI45CLKSOURCE_PLL2Q => .PLL2_Q,
                    .RCC_SPI45CLKSOURCE_HSI => .HSI,
                    .RCC_SPI45CLKSOURCE_PLL3Q => .PLL3_Q,
                };
            }
            pub fn from_enum(item: RCC_SPI45SEL) anyerror!@This() {
                return switch (item) {
                    .CSI => .RCC_SPI45CLKSOURCE_CSI,
                    .HSE => .RCC_SPI45CLKSOURCE_HSE,
                    .PCLK2 => .RCC_SPI45CLKSOURCE_PCLK2,
                    .PLL2_Q => .RCC_SPI45CLKSOURCE_PLL2Q,
                    .HSI => .RCC_SPI45CLKSOURCE_HSI,
                    .PLL3_Q => .RCC_SPI45CLKSOURCE_PLL3Q,
                };
            }
        };

        pub const RCC_USBPHY_Clock_Source_FROM_HSEList = enum {
            RCC_USBPHYCCLKSOURCE_HSE_DIV2,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_USBPHYCCLKSOURCE_HSE_DIV2 => 2,
                };
            }
        };

        pub const USBPHYCLKSourceList = enum {
            RCC_USBPHYCCLKSOURCE_HSE,
            RCC_USBPHYCCLKSOURCE_HSE_DIV2,
            RCC_USBPHYCCLKSOURCE_PLL3Q,

            pub fn to_enum(self: @This()) anyerror!RCC_USBPHYCSEL {
                return switch (self) {
                    .RCC_USBPHYCCLKSOURCE_PLL3Q => .PLL3_Q,
                    .RCC_USBPHYCCLKSOURCE_HSE_DIV2 => .HSE_DIV_2,
                    .RCC_USBPHYCCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_USBPHYCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_Q => .RCC_USBPHYCCLKSOURCE_PLL3Q,
                    .HSE_DIV_2 => .RCC_USBPHYCCLKSOURCE_HSE_DIV2,
                    .HSE => .RCC_USBPHYCCLKSOURCE_HSE,
                };
            }
        };

        pub const USBPHYFreq_ValueList = enum {
            @"16000000",
            @"19200000",
            @"20000000",
            @"24000000",
            @"26000000",
            @"32000000",
        };

        pub const USBCLockSelectionList = enum {
            RCC_USBOTGFSCLKSOURCE_HSI48,
            RCC_USBOTGFSCLKSOURCE_PLL3Q,
            RCC_USBOTGFSCLKSOURCE_HSE,
            RCC_USBOTGFSCLKSOURCE_CLK48,

            pub fn to_enum(self: @This()) anyerror!RCC_USB_OTG_FSSEL {
                return switch (self) {
                    .RCC_USBOTGFSCLKSOURCE_PLL3Q => .PLL3_Q,
                    .RCC_USBOTGFSCLKSOURCE_HSE => .HSE,
                    .RCC_USBOTGFSCLKSOURCE_HSI48 => .HSI48,
                    .RCC_USBOTGFSCLKSOURCE_CLK48 => .CLK48MOHCI,
                };
            }
            pub fn from_enum(item: RCC_USB_OTG_FSSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_Q => .RCC_USBOTGFSCLKSOURCE_PLL3Q,
                    .HSE => .RCC_USBOTGFSCLKSOURCE_HSE,
                    .HSI48 => .RCC_USBOTGFSCLKSOURCE_HSI48,
                    .CLK48MOHCI => .RCC_USBOTGFSCLKSOURCE_CLK48,
                };
            }
        };

        pub const FDCANCLockSelectionList = enum {
            RCC_FDCANCLKSOURCE_HSE,
            RCC_FDCANCLKSOURCE_PLL1Q,
            RCC_FDCANCLKSOURCE_PLL2P,

            pub fn to_enum(self: @This()) anyerror!RCC_FDCANSEL {
                return switch (self) {
                    .RCC_FDCANCLKSOURCE_PLL2P => .PLL2_P,
                    .RCC_FDCANCLKSOURCE_HSE => .HSE,
                    .RCC_FDCANCLKSOURCE_PLL1Q => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_FDCANSEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_FDCANCLKSOURCE_PLL2P,
                    .HSE => .RCC_FDCANCLKSOURCE_HSE,
                    .PLL1_Q => .RCC_FDCANCLKSOURCE_PLL1Q,
                };
            }
        };

        pub const Xspi1ClockSelectionList = enum {
            RCC_XSPI1CLKSOURCE_HCLK,
            RCC_XSPI1CLKSOURCE_PLL2S,
            RCC_XSPI1CLKSOURCE_PLL2T,

            pub fn to_enum(self: @This()) anyerror!RCC_XSPISEL {
                return switch (self) {
                    .RCC_XSPI1CLKSOURCE_PLL2T => .PLL2_S,
                    .RCC_XSPI1CLKSOURCE_HCLK => .HCLK5,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "Xspi1ClockSelection", @tagName(self), "RCC_XSPISEL" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_XSPISEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_S => .RCC_XSPI1CLKSOURCE_PLL2T,
                    .HCLK5 => .RCC_XSPI1CLKSOURCE_HCLK,
                };
            }
        };

        pub const PSSICLockSelectionList = enum {
            RCC_PSSICLKSOURCE_PLL3R,
            RCC_PSSICLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_PSSISEL {
                return switch (self) {
                    .RCC_PSSICLKSOURCE_CLKP => .PER,
                    .RCC_PSSICLKSOURCE_PLL3R => .PLL3_R,
                };
            }
            pub fn from_enum(item: RCC_PSSISEL) anyerror!@This() {
                return switch (item) {
                    .PER => .RCC_PSSICLKSOURCE_CLKP,
                    .PLL3_R => .RCC_PSSICLKSOURCE_PLL3R,
                };
            }
        };

        pub const Xspi2ClockSelectionList = enum {
            RCC_XSPI2CLKSOURCE_HCLK,
            RCC_XSPI2CLKSOURCE_PLL2S,
            RCC_XSPI2CLKSOURCE_PLL2T,

            pub fn to_enum(self: @This()) anyerror!RCC_XSPISEL {
                return switch (self) {
                    .RCC_XSPI2CLKSOURCE_PLL2T => .PLL2_S,
                    .RCC_XSPI2CLKSOURCE_HCLK => .HCLK5,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "Xspi2ClockSelection", @tagName(self), "RCC_XSPISEL" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_XSPISEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_S => .RCC_XSPI2CLKSOURCE_PLL2T,
                    .HCLK5 => .RCC_XSPI2CLKSOURCE_HCLK,
                };
            }
        };

        pub const ETHPHYCLockSelectionList = enum {
            RCC_ETH1PHYCLKSOURCE_HSE,
            RCC_ETH1PHYCLKSOURCE_PLL3S,

            pub fn to_enum(self: @This()) anyerror!RCC_ETHPHY_CLK_SEL {
                return switch (self) {
                    .RCC_ETH1PHYCLKSOURCE_PLL3S => .PLL3_S,
                    .RCC_ETH1PHYCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_ETHPHY_CLK_SEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_S => .RCC_ETH1PHYCLKSOURCE_PLL3S,
                    .HSE => .RCC_ETH1PHYCLKSOURCE_HSE,
                };
            }
        };

        pub const ETH1CLockSelectionList = enum {
            RCC_ETH1REFCLKSOURCE_ETH,
            RCC_ETH1REFCLKSOURCE_HSE,
            RCC_ETH1REFCLKSOURCE_PHY,

            pub fn to_enum(self: @This()) anyerror!RCC_ETH_REF_CLK_SEL {
                return switch (self) {
                    .RCC_ETH1REFCLKSOURCE_ETH => .ETH,
                    .RCC_ETH1REFCLKSOURCE_HSE => .HSE,
                    .RCC_ETH1REFCLKSOURCE_PHY => .ETH_RMII_REF,
                };
            }
            pub fn from_enum(item: RCC_ETH_REF_CLK_SEL) anyerror!@This() {
                return switch (item) {
                    .ETH => .RCC_ETH1REFCLKSOURCE_ETH,
                    .HSE => .RCC_ETH1REFCLKSOURCE_HSE,
                    .ETH_RMII_REF => .RCC_ETH1REFCLKSOURCE_PHY,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCCLKSOURCE_PLL2P,
            RCC_ADCCLKSOURCE_PLL3R,
            RCC_ADCCLKSOURCE_CLKP,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADCCLKSOURCE_PLL3R => .PLL3_R,
                    .RCC_ADCCLKSOURCE_CLKP => .PER,
                    .RCC_ADCCLKSOURCE_PLL2P => .PLL2_P,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3_R => .RCC_ADCCLKSOURCE_PLL3R,
                    .PER => .RCC_ADCCLKSOURCE_CLKP,
                    .PLL2_P => .RCC_ADCCLKSOURCE_PLL2P,
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

        pub const CSI_DIVList = enum {
            RCC_CECCLKSOURCE_CSI,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_CECCLKSOURCE_CSI => 122,
                };
            }
        };

        pub const RCC_TIM_PRescaler_SelectionList = enum {
            RCC_TIMPRES_ACTIVATED,
            RCC_TIMPRES_DISABLE,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMPRE {
                return switch (self) {
                    .RCC_TIMPRES_DISABLE => .DefaultX2,
                    .RCC_TIMPRES_ACTIVATED => .DefaultX4,
                };
            }
            pub fn from_enum(item: RCC_TIMPRE) anyerror!@This() {
                return switch (item) {
                    .DefaultX2 => .RCC_TIMPRES_DISABLE,
                    .DefaultX4 => .RCC_TIMPRES_ACTIVATED,
                };
            }
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE0,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .High,
                    .PWR_REGULATOR_VOLTAGE_SCALE0 => .Low,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .High => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .Low => .PWR_REGULATOR_VOLTAGE_SCALE0,
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
            FLASH_LATENCY_7,
            FLASH_LATENCY_6,
            FLASH_LATENCY_5,
            FLASH_LATENCY_4,
            FLASH_LATENCY_3,
            FLASH_LATENCY_2,
            FLASH_LATENCY_1,
            FLASH_LATENCY_0,
        };

        pub const PLL1_VCI_RangeList = enum {
            RCC_PLL_VCOINPUT_RANGE0,
            RCC_PLL_VCOINPUT_RANGE1,
            RCC_PLL_VCOINPUT_RANGE2,
            RCC_PLL_VCOINPUT_RANGE3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL_VCOINPUT_RANGE3 => .Range8,
                    .RCC_PLL_VCOINPUT_RANGE1 => .Range2,
                    .RCC_PLL_VCOINPUT_RANGE2 => .Range4,
                    .RCC_PLL_VCOINPUT_RANGE0 => .Range1,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range8 => .RCC_PLL_VCOINPUT_RANGE3,
                    .Range2 => .RCC_PLL_VCOINPUT_RANGE1,
                    .Range4 => .RCC_PLL_VCOINPUT_RANGE2,
                    .Range1 => .RCC_PLL_VCOINPUT_RANGE0,
                };
            }
        };

        pub const PLL2_VCI_RangeList = enum {
            RCC_PLL_VCOINPUT_RANGE0,
            RCC_PLL_VCOINPUT_RANGE1,
            RCC_PLL_VCOINPUT_RANGE2,
            RCC_PLL_VCOINPUT_RANGE3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL_VCOINPUT_RANGE3 => .Range8,
                    .RCC_PLL_VCOINPUT_RANGE1 => .Range2,
                    .RCC_PLL_VCOINPUT_RANGE2 => .Range4,
                    .RCC_PLL_VCOINPUT_RANGE0 => .Range1,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range8 => .RCC_PLL_VCOINPUT_RANGE3,
                    .Range2 => .RCC_PLL_VCOINPUT_RANGE1,
                    .Range4 => .RCC_PLL_VCOINPUT_RANGE2,
                    .Range1 => .RCC_PLL_VCOINPUT_RANGE0,
                };
            }
        };

        pub const PLL3_VCI_RangeList = enum {
            RCC_PLL_VCOINPUT_RANGE0,
            RCC_PLL_VCOINPUT_RANGE1,
            RCC_PLL_VCOINPUT_RANGE2,
            RCC_PLL_VCOINPUT_RANGE3,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL_VCOINPUT_RANGE3 => .Range8,
                    .RCC_PLL_VCOINPUT_RANGE1 => .Range2,
                    .RCC_PLL_VCOINPUT_RANGE2 => .Range4,
                    .RCC_PLL_VCOINPUT_RANGE0 => .Range1,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .Range8 => .RCC_PLL_VCOINPUT_RANGE3,
                    .Range2 => .RCC_PLL_VCOINPUT_RANGE1,
                    .Range4 => .RCC_PLL_VCOINPUT_RANGE2,
                    .Range1 => .RCC_PLL_VCOINPUT_RANGE0,
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
            RCC_CRS_SYNC_SOURCE_USB_OTG_FS,
            RCC_CRS_SYNC_SOURCE_USB_OTG_HS,
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
            RCC_PLL_VCO_LOW,
            RCC_PLL_VCO_HIGH,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL_VCO_LOW => .MediumVCO,
                    .RCC_PLL_VCO_HIGH => .WideVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .MediumVCO => .RCC_PLL_VCO_LOW,
                    .WideVCO => .RCC_PLL_VCO_HIGH,
                };
            }
        };

        pub const PLL2_VCO_SELList = enum {
            RCC_PLL_VCO_LOW,
            RCC_PLL_VCO_HIGH,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL_VCO_LOW => .MediumVCO,
                    .RCC_PLL_VCO_HIGH => .WideVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .MediumVCO => .RCC_PLL_VCO_LOW,
                    .WideVCO => .RCC_PLL_VCO_HIGH,
                };
            }
        };

        pub const PLL3_VCO_SELList = enum {
            RCC_PLL_VCO_LOW,
            RCC_PLL_VCO_HIGH,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLVCOSEL {
                return switch (self) {
                    .RCC_PLL_VCO_LOW => .MediumVCO,
                    .RCC_PLL_VCO_HIGH => .WideVCO,
                };
            }
            pub fn from_enum(item: RCC_PLLVCOSEL) anyerror!@This() {
                return switch (item) {
                    .MediumVCO => .RCC_PLL_VCO_LOW,
                    .WideVCO => .RCC_PLL_VCO_HIGH,
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

        pub const DigExtClockEnableList = enum {
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

        pub const cKPerEnableList = enum {
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

        pub const SPI1EnableList = enum {
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

        pub const SPI23EnableList = enum {
            true,
            false,
        };

        pub const ADF1EnableList = enum {
            true,
            false,
        };

        pub const LPTIM45EnableList = enum {
            true,
            false,
        };

        pub const LPTIM23EnableList = enum {
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

        pub const USART1EnableList = enum {
            true,
            false,
        };

        pub const SPI45EnableList = enum {
            true,
            false,
        };

        pub const SDMMC1EnableList = enum {
            true,
            false,
        };

        pub const OCSPI1EnableList = enum {
            true,
            false,
        };

        pub const OCSPI2EnableList = enum {
            true,
            false,
        };

        pub const EnableUSBOFSList = enum {
            true,
            false,
        };

        pub const EnableUSBOHSList = enum {
            true,
            false,
        };

        pub const I2C23EnableList = enum {
            true,
            false,
        };

        pub const I2C1EnableList = enum {
            true,
            false,
        };

        pub const PSSIEnableList = enum {
            true,
            false,
        };

        pub const LTDCEnableList = enum {
            true,
            false,
        };

        pub const ETH1EnableDivList = enum {
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

        pub const UCPDEnableList = enum {
            true,
            false,
        };

        pub const EnableHSEUSBPHYDevisorList = enum {
            true,
            false,
        };

        pub const RNGEnableList = enum {
            true,
            false,
        };

        pub const DTSEnableList = enum {
            true,
            false,
        };

        pub const ETHClockEnableList = enum {
            true,
            false,
        };

        pub const ETH1EnableList = enum {
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
            HSEDIGByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEDIGByPass: bool = false,
            LSEOscillator: bool = false,
            MCO1Config: bool = false,
            MCO2Config: bool = false,
            AudioClockConfig: bool = false,
            DigitalClockConfig: bool = false,
            ETHClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            LPTIM4Used_ForRCC: bool = false,
            LPTIM5Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            FMCUsed_ForRCC: bool = false,
            SPI6Used_ForRCC: bool = false,
            I2S6Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            SPI4Used_ForRCC: bool = false,
            SPI5Used_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            USB_OTG_FS_Used: bool = false,
            USB_OTG_HS_Used: bool = false,
            EnableCSS: bool = false,
            DTS_Used: bool = false,
            ADF1_Used: bool = false,
            XSPI1_Used: bool = false,
            XSPI2_Used: bool = false,
            I2C2_Used: bool = false,
            I2C3_Used: bool = false,
            I2C1_Used: bool = false,
            I3C1_Used: bool = false,
            PSSI_Used: bool = false,
            ETH_Used: bool = false,
            UCPD1_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            RCC_PLLSOURCE_HSE: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_TIMPRES_DISABLE: bool = false,
            RCC_TIMPRES_ACTIVATED: bool = false,
            RCC_PLL_VCO_HIGH: bool = false,
            RCC_MCO2SOURCE_PLL1P: bool = false,
            RCC_PLL_VCOINPUT_RANGE0: bool = false,
            RCC_MCO1SOURCE_PLL1Q: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEDIGByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEDIGByPass: bool = false,
            LSEOscillator: bool = false,
            MCO1Config: bool = false,
            MCO2Config: bool = false,
            AudioClockConfig: bool = false,
            DigitalClockConfig: bool = false,
            ETHClockConfig: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            LPTIM4Used_ForRCC: bool = false,
            LPTIM5Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            FDCAN2Used_ForRCC: bool = false,
            FMCUsed_ForRCC: bool = false,
            SPI6Used_ForRCC: bool = false,
            I2S6Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            SPI4Used_ForRCC: bool = false,
            SPI5Used_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            USB_OTG_FS_Used: bool = false,
            USB_OTG_HS_Used: bool = false,
            EnableCSS: bool = false,
            DTS_Used: bool = false,
            ADF1_Used: bool = false,
            XSPI1_Used: bool = false,
            XSPI2_Used: bool = false,
            I2C2_Used: bool = false,
            I2C3_Used: bool = false,
            I2C1_Used: bool = false,
            I3C1_Used: bool = false,
            PSSI_Used: bool = false,
            ETH_Used: bool = false,
            UCPD1_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            RCC_PLLSOURCE_HSE: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_TIMPRES_DISABLE: bool = false,
            RCC_TIMPRES_ACTIVATED: bool = false,
            RCC_PLL_VCO_HIGH: bool = false,
            RCC_MCO2SOURCE_PLL1P: bool = false,
            RCC_PLL_VCOINPUT_RANGE0: bool = false,
            RCC_MCO1SOURCE_PLL1Q: bool = false,
            LSIEnable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            DigExtClockEnable: bool = false, //Reference flag
            MCO1OutPutEnable: bool = false, //Reference flag
            MCO2OutPutEnable: bool = false, //Reference flag
            cKPerEnable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            SAI2Enable: bool = false, //Reference flag
            SPI1Enable: bool = false, //Reference flag
            SPDIFEnable: bool = false, //Reference flag
            FDCANEnable: bool = false, //Reference flag
            FMCEnable: bool = false, //Reference flag
            SPI23Enable: bool = false, //Reference flag
            ADF1Enable: bool = false, //Reference flag
            LPTIM45Enable: bool = false, //Reference flag
            LPTIM23Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            SPI6Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            USART234578Enable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            SPI45Enable: bool = false, //Reference flag
            SDMMC1Enable: bool = false, //Reference flag
            OCSPI1Enable: bool = false, //Reference flag
            OCSPI2Enable: bool = false, //Reference flag
            EnableUSBOFS: bool = false, //Reference flag
            EnableUSBOHS: bool = false, //Reference flag
            I2C23Enable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            PSSIEnable: bool = false, //Reference flag
            LTDCEnable: bool = false, //Reference flag
            ETH1EnableDiv: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            UCPDEnable: bool = false, //Reference flag
            EnableHSEUSBPHYDevisor: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            DTSEnable: bool = false, //Reference flag
            ETHClockEnable: bool = false, //Reference flag
            ETH1Enable: bool = false, //Reference flag
            CECEnable: bool = false, //Reference flag
            PLL1QUsed: bool = false, //Reference flag
            PLL2PUsed: bool = false, //Reference flag
            PLL2QUsed: bool = false, //Reference flag
            PLL2RUsed: bool = false, //Reference flag
            PLL2SUsed: bool = false, //Reference flag
            PLL2TUsed: bool = false, //Reference flag
            PLL3PUsed: bool = false, //Reference flag
            PLL3QUsed: bool = false, //Reference flag
            PLL3RUsed: bool = false, //Reference flag
            PLL3SUsed: bool = false, //Reference flag
            PLL1Used: bool = false, //Reference flag
            PLL2Used: bool = false, //Reference flag
            PLL3Used: bool = false, //Reference flag
            PLL1PUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag
            HSI48Used: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            cKPerUsed: bool = false, //Reference flag
            false: bool = false, //Node enable flag

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
            CPRE: ?CPREList = null,
            Cortex_Div: ?Cortex_DivList = null,
            BMPRE: ?BMPREList = null,
            PPRE5: ?PPRE5List = null,
            PPRE1: ?PPRE1List = null,
            PPRE2: ?PPRE2List = null,
            PPRE4: ?PPRE4List = null,
            PLLSource: ?PLLSourceList = null,
            CKPERSourceSelection: ?CKPERSourceSelectionList = null,
            DIVM1: ?u32 = null,
            DIVM2: ?u32 = null,
            DIVM3: ?u32 = null,
            DIVN1: ?u32 = null,
            PLLFRACN: ?u32 = null,
            DIVP1: ?DIVP1List = null,
            DIVQ1: ?u32 = null,
            DIVR1: ?u32 = null,
            DIVS1: ?u32 = null,
            DIVT1: ?u32 = null,
            DIVN2: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            DIVP2: ?u32 = null,
            DIVQ2: ?u32 = null,
            DIVR2: ?u32 = null,
            DIVS2: ?u32 = null,
            DIVT2: ?u32 = null,
            DIVN3: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            DIVP3: ?u32 = null,
            DIVQ3: ?u32 = null,
            DIVR3: ?u32 = null,
            DIVS3: ?u32 = null,
            DIVT3: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            SPI1CLockSelection: ?SPI1CLockSelectionList = null,
            SPI23CLockSelection: ?SPI23CLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
            SAI2CLockSelection: ?SAI2CLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C23CLockSelection: ?I2C23CLockSelectionList = null,
            SPDIFCLockSelection: ?SPDIFCLockSelectionList = null,
            FmcClockSelection: ?FmcClockSelectionList = null,
            SDMMC1CLockSelection: ?SDMMC1CLockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            Adf1ClockSelection: ?Adf1ClockSelectionList = null,
            USART234578CLockSelection: ?USART234578CLockSelectionList = null,
            LPUART1CLockSelection: ?LPUART1CLockSelectionList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            LPTIM23CLockSelection: ?LPTIM23CLockSelectionList = null,
            LPTIM45CLockSelection: ?LPTIM45CLockSelectionList = null,
            SPI6CLockSelection: ?SPI6CLockSelectionList = null,
            Spi45ClockSelection: ?Spi45ClockSelectionList = null,
            USBPHYCLKSource: ?USBPHYCLKSourceList = null,
            USBCLockSelection: ?USBCLockSelectionList = null,
            FDCANCLockSelection: ?FDCANCLockSelectionList = null,
            Xspi1ClockSelection: ?Xspi1ClockSelectionList = null,
            PSSICLockSelection: ?PSSICLockSelectionList = null,
            Xspi2ClockSelection: ?Xspi2ClockSelectionList = null,
            ETHPHYCLockSelection: ?ETHPHYCLockSelectionList = null,
            ETH1CLockSelection: ?ETH1CLockSelectionList = null,
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
            CPRE: CPREList,
            TPIU: TPIUList,
            Cortex_Div: Cortex_DivList,
            BMPRE: BMPREList,
            PPRE5: PPRE5List,
            PPRE1: PPRE1List,
            Tim1Mul: u32,
            PPRE2: PPRE2List,
            Tim2Mul: u32,
            PPRE4: PPRE4List,
            PLLSource: PLLSourceList,
            CKPERSourceSelection: CKPERSourceSelectionList,
            DIVM1: u32,
            DIVM2: u32,
            DIVM3: u32,
            DIVN1: u32,
            DIVP1: DIVP1List,
            DIVQ1: u32,
            DIVR1: u32,
            DIVS1: u32,
            DIVT1: u32,
            DIVN2: u32,
            DIVP2: u32,
            DIVQ2: u32,
            DIVR2: u32,
            DIVS2: u32,
            DIVT2: u32,
            DIVN3: u32,
            DIVP3: u32,
            DIVQ3: u32,
            DIVR3: u32,
            DIVS3: u32,
            DIVT3: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RTCClockSelectionList,
            HSIDivToUCPD: HSIDivToUCPDList,
            SPI1CLockSelection: SPI1CLockSelectionList,
            SPI23CLockSelection: SPI23CLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
            SAI2CLockSelection: SAI2CLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C23CLockSelection: I2C23CLockSelectionList,
            SPDIFCLockSelection: SPDIFCLockSelectionList,
            FmcClockSelection: FmcClockSelectionList,
            SDMMC1CLockSelection: SDMMC1CLockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            Adf1ClockSelection: Adf1ClockSelectionList,
            USART234578CLockSelection: USART234578CLockSelectionList,
            LPUART1CLockSelection: LPUART1CLockSelectionList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            LPTIM23CLockSelection: LPTIM23CLockSelectionList,
            LPTIM45CLockSelection: LPTIM45CLockSelectionList,
            SPI6CLockSelection: SPI6CLockSelectionList,
            Spi45ClockSelection: Spi45ClockSelectionList,
            RCC_USBPHY_Clock_Source_FROM_HSE: RCC_USBPHY_Clock_Source_FROM_HSEList,
            USBPHYCLKSource: USBPHYCLKSourceList,
            USBCLockSelection: USBCLockSelectionList,
            FDCANCLockSelection: FDCANCLockSelectionList,
            Xspi1ClockSelection: Xspi1ClockSelectionList,
            PSSICLockSelection: PSSICLockSelectionList,
            Xspi2ClockSelection: Xspi2ClockSelectionList,
            ETHPHYCLockSelection: ETHPHYCLockSelectionList,
            ETH1CLockSelection: ETH1CLockSelectionList,
            ADCCLockSelection: ADCCLockSelectionList,
            CECCLockSelection: CECCLockSelectionList,
            CSI_DIV: CSI_DIVList,
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
            CPRE: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            BMPRE: ?RCC_HPRE = null,
            PPRE5: ?RCC_PPRE = null,
            PPRE1: ?RCC_PPRE = null,
            PPRE2: ?RCC_PPRE = null,
            PPRE4: ?RCC_PPRE = null,
            PLLSource: ?RCC_PLLSRC = null,
            CKPERSourceSelection: ?RCC_PERSEL = null,
            DIVM1: ?u32 = null,
            DIVM2: ?u32 = null,
            DIVM3: ?u32 = null,
            DIVN1: ?u32 = null,
            PLLFRACN: ?u32 = null,
            DIVP1: ?RCC_PLLDIV = null,
            DIVQ1: ?u32 = null,
            DIVR1: ?u32 = null,
            DIVS1: ?u32 = null,
            DIVT1: ?u32 = null,
            DIVN2: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            DIVP2: ?u32 = null,
            DIVQ2: ?u32 = null,
            DIVR2: ?u32 = null,
            DIVS2: ?u32 = null,
            DIVT2: ?u32 = null,
            DIVN3: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            DIVP3: ?u32 = null,
            DIVQ3: ?u32 = null,
            DIVR3: ?u32 = null,
            DIVS3: ?u32 = null,
            DIVT3: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            SPI1CLockSelection: ?RCC_SPI123SEL = null,
            SPI23CLockSelection: ?RCC_SPI123SEL = null,
            SAI1CLockSelection: ?RCC_SAI1SEL = null,
            SAI2CLockSelection: ?RCC_SAI2SEL = null,
            I2C1CLockSelection: ?RCC_I2C1_I3C1SEL = null,
            I2C23CLockSelection: ?RCC_I2CSEL = null,
            SPDIFCLockSelection: ?RCC_SPDIFRXSEL = null,
            FmcClockSelection: ?RCC_FMCSEL = null,
            SDMMC1CLockSelection: ?RCC_SDMMCSEL = null,
            USART1CLockSelection: ?RCC_USART1SEL = null,
            Adf1ClockSelection: ?RCC_LPTIM1SEL = null,
            USART234578CLockSelection: ?RCC_USART234578SEL = null,
            LPUART1CLockSelection: ?RCC_LPUARTSEL = null,
            LPTIM1CLockSelection: ?RCC_LPTIM1SEL = null,
            LPTIM23CLockSelection: ?RCC_LPTIMSEL = null,
            LPTIM45CLockSelection: ?RCC_LPTIMSEL = null,
            SPI6CLockSelection: ?RCC_SPI6SEL = null,
            Spi45ClockSelection: ?RCC_SPI45SEL = null,
            USBPHYCLKSource: ?RCC_USBPHYCSEL = null,
            USBCLockSelection: ?RCC_USB_OTG_FSSEL = null,
            FDCANCLockSelection: ?RCC_FDCANSEL = null,
            Xspi1ClockSelection: ?RCC_XSPISEL = null,
            PSSICLockSelection: ?RCC_PSSISEL = null,
            Xspi2ClockSelection: ?RCC_XSPISEL = null,
            ETHPHYCLockSelection: ?RCC_ETHPHY_CLK_SEL = null,
            ETH1CLockSelection: ?RCC_ETH_REF_CLK_SEL = null,
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
                    .CPRE = if (self.CPRE) |val| try CPREList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .BMPRE = if (self.BMPRE) |val| try BMPREList.from_enum(val) else null,
                    .PPRE5 = if (self.PPRE5) |val| try PPRE5List.from_enum(val) else null,
                    .PPRE1 = if (self.PPRE1) |val| try PPRE1List.from_enum(val) else null,
                    .PPRE2 = if (self.PPRE2) |val| try PPRE2List.from_enum(val) else null,
                    .PPRE4 = if (self.PPRE4) |val| try PPRE4List.from_enum(val) else null,
                    .PLLSource = if (self.PLLSource) |val| try PLLSourceList.from_enum(val) else null,
                    .CKPERSourceSelection = if (self.CKPERSourceSelection) |val| try CKPERSourceSelectionList.from_enum(val) else null,
                    .DIVM1 = self.DIVM1,
                    .DIVM2 = self.DIVM2,
                    .DIVM3 = self.DIVM3,
                    .DIVN1 = self.DIVN1,
                    .PLLFRACN = self.PLLFRACN,
                    .DIVP1 = if (self.DIVP1) |val| try DIVP1List.from_enum(val) else null,
                    .DIVQ1 = self.DIVQ1,
                    .DIVR1 = self.DIVR1,
                    .DIVS1 = self.DIVS1,
                    .DIVT1 = self.DIVT1,
                    .DIVN2 = self.DIVN2,
                    .PLL2FRACN = self.PLL2FRACN,
                    .DIVP2 = self.DIVP2,
                    .DIVQ2 = self.DIVQ2,
                    .DIVR2 = self.DIVR2,
                    .DIVS2 = self.DIVS2,
                    .DIVT2 = self.DIVT2,
                    .DIVN3 = self.DIVN3,
                    .PLL3FRACN = self.PLL3FRACN,
                    .DIVP3 = self.DIVP3,
                    .DIVQ3 = self.DIVQ3,
                    .DIVR3 = self.DIVR3,
                    .DIVS3 = self.DIVS3,
                    .DIVT3 = self.DIVT3,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .SPI1CLockSelection = if (self.SPI1CLockSelection) |val| try SPI1CLockSelectionList.from_enum(val) else null,
                    .SPI23CLockSelection = if (self.SPI23CLockSelection) |val| try SPI23CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
                    .SAI2CLockSelection = if (self.SAI2CLockSelection) |val| try SAI2CLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C23CLockSelection = if (self.I2C23CLockSelection) |val| try I2C23CLockSelectionList.from_enum(val) else null,
                    .SPDIFCLockSelection = if (self.SPDIFCLockSelection) |val| try SPDIFCLockSelectionList.from_enum(val) else null,
                    .FmcClockSelection = if (self.FmcClockSelection) |val| try FmcClockSelectionList.from_enum(val) else null,
                    .SDMMC1CLockSelection = if (self.SDMMC1CLockSelection) |val| try SDMMC1CLockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .Adf1ClockSelection = if (self.Adf1ClockSelection) |val| try Adf1ClockSelectionList.from_enum(val) else null,
                    .USART234578CLockSelection = if (self.USART234578CLockSelection) |val| try USART234578CLockSelectionList.from_enum(val) else null,
                    .LPUART1CLockSelection = if (self.LPUART1CLockSelection) |val| try LPUART1CLockSelectionList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .LPTIM23CLockSelection = if (self.LPTIM23CLockSelection) |val| try LPTIM23CLockSelectionList.from_enum(val) else null,
                    .LPTIM45CLockSelection = if (self.LPTIM45CLockSelection) |val| try LPTIM45CLockSelectionList.from_enum(val) else null,
                    .SPI6CLockSelection = if (self.SPI6CLockSelection) |val| try SPI6CLockSelectionList.from_enum(val) else null,
                    .Spi45ClockSelection = if (self.Spi45ClockSelection) |val| try Spi45ClockSelectionList.from_enum(val) else null,
                    .USBPHYCLKSource = if (self.USBPHYCLKSource) |val| try USBPHYCLKSourceList.from_enum(val) else null,
                    .USBCLockSelection = if (self.USBCLockSelection) |val| try USBCLockSelectionList.from_enum(val) else null,
                    .FDCANCLockSelection = if (self.FDCANCLockSelection) |val| try FDCANCLockSelectionList.from_enum(val) else null,
                    .Xspi1ClockSelection = if (self.Xspi1ClockSelection) |val| try Xspi1ClockSelectionList.from_enum(val) else null,
                    .PSSICLockSelection = if (self.PSSICLockSelection) |val| try PSSICLockSelectionList.from_enum(val) else null,
                    .Xspi2ClockSelection = if (self.Xspi2ClockSelection) |val| try Xspi2ClockSelectionList.from_enum(val) else null,
                    .ETHPHYCLockSelection = if (self.ETHPHYCLockSelection) |val| try ETHPHYCLockSelectionList.from_enum(val) else null,
                    .ETH1CLockSelection = if (self.ETH1CLockSelection) |val| try ETH1CLockSelectionList.from_enum(val) else null,
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
            CPRE: RCC_HPRE,
            TPIU: TPIUList,
            Cortex_Div: Cortex_DivList,
            BMPRE: RCC_HPRE,
            PPRE5: RCC_PPRE,
            PPRE1: RCC_PPRE,
            Tim1Mul: u32,
            PPRE2: RCC_PPRE,
            Tim2Mul: u32,
            PPRE4: RCC_PPRE,
            PLLSource: RCC_PLLSRC,
            CKPERSourceSelection: RCC_PERSEL,
            DIVM1: u32,
            DIVM2: u32,
            DIVM3: u32,
            DIVN1: u32,
            DIVP1: RCC_PLLDIV,
            DIVQ1: u32,
            DIVR1: u32,
            DIVS1: u32,
            DIVT1: u32,
            DIVN2: u32,
            DIVP2: u32,
            DIVQ2: u32,
            DIVR2: u32,
            DIVS2: u32,
            DIVT2: u32,
            DIVN3: u32,
            DIVP3: u32,
            DIVQ3: u32,
            DIVR3: u32,
            DIVS3: u32,
            DIVT3: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RCC_RTCSEL,
            HSIDivToUCPD: RCC_HSIDIV,
            SPI1CLockSelection: RCC_SPI123SEL,
            SPI23CLockSelection: RCC_SPI123SEL,
            SAI1CLockSelection: RCC_SAI1SEL,
            SAI2CLockSelection: RCC_SAI2SEL,
            I2C1CLockSelection: RCC_I2C1_I3C1SEL,
            I2C23CLockSelection: RCC_I2CSEL,
            SPDIFCLockSelection: RCC_SPDIFRXSEL,
            FmcClockSelection: RCC_FMCSEL,
            SDMMC1CLockSelection: RCC_SDMMCSEL,
            USART1CLockSelection: RCC_USART1SEL,
            Adf1ClockSelection: RCC_LPTIM1SEL,
            USART234578CLockSelection: RCC_USART234578SEL,
            LPUART1CLockSelection: RCC_LPUARTSEL,
            LPTIM1CLockSelection: RCC_LPTIM1SEL,
            LPTIM23CLockSelection: RCC_LPTIMSEL,
            LPTIM45CLockSelection: RCC_LPTIMSEL,
            SPI6CLockSelection: RCC_SPI6SEL,
            Spi45ClockSelection: RCC_SPI45SEL,
            RCC_USBPHY_Clock_Source_FROM_HSE: RCC_USBPHY_Clock_Source_FROM_HSEList,
            USBPHYCLKSource: RCC_USBPHYCSEL,
            USBCLockSelection: RCC_USB_OTG_FSSEL,
            FDCANCLockSelection: RCC_FDCANSEL,
            Xspi1ClockSelection: RCC_XSPISEL,
            PSSICLockSelection: RCC_PSSISEL,
            Xspi2ClockSelection: RCC_XSPISEL,
            ETHPHYCLockSelection: RCC_ETHPHY_CLK_SEL,
            ETH1CLockSelection: RCC_ETH_REF_CLK_SEL,
            ADCCLockSelection: RCC_ADCSEL,
            CECCLockSelection: RCC_CECSEL,
            CSI_DIV: CSI_DIVList,
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
                    .CPRE = try cubemx_config.CPRE.to_enum(),
                    .TPIU = cubemx_config.TPIU,
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .BMPRE = try cubemx_config.BMPRE.to_enum(),
                    .PPRE5 = try cubemx_config.PPRE5.to_enum(),
                    .PPRE1 = try cubemx_config.PPRE1.to_enum(),
                    .Tim1Mul = cubemx_config.Tim1Mul,
                    .PPRE2 = try cubemx_config.PPRE2.to_enum(),
                    .Tim2Mul = cubemx_config.Tim2Mul,
                    .PPRE4 = try cubemx_config.PPRE4.to_enum(),
                    .PLLSource = try cubemx_config.PLLSource.to_enum(),
                    .CKPERSourceSelection = try cubemx_config.CKPERSourceSelection.to_enum(),
                    .DIVM1 = cubemx_config.DIVM1,
                    .DIVM2 = cubemx_config.DIVM2,
                    .DIVM3 = cubemx_config.DIVM3,
                    .DIVN1 = cubemx_config.DIVN1,
                    .DIVP1 = try cubemx_config.DIVP1.to_enum(),
                    .DIVQ1 = cubemx_config.DIVQ1,
                    .DIVR1 = cubemx_config.DIVR1,
                    .DIVS1 = cubemx_config.DIVS1,
                    .DIVT1 = cubemx_config.DIVT1,
                    .DIVN2 = cubemx_config.DIVN2,
                    .DIVP2 = cubemx_config.DIVP2,
                    .DIVQ2 = cubemx_config.DIVQ2,
                    .DIVR2 = cubemx_config.DIVR2,
                    .DIVS2 = cubemx_config.DIVS2,
                    .DIVT2 = cubemx_config.DIVT2,
                    .DIVN3 = cubemx_config.DIVN3,
                    .DIVP3 = cubemx_config.DIVP3,
                    .DIVQ3 = cubemx_config.DIVQ3,
                    .DIVR3 = cubemx_config.DIVR3,
                    .DIVS3 = cubemx_config.DIVS3,
                    .DIVT3 = cubemx_config.DIVT3,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .HSIDivToUCPD = try cubemx_config.HSIDivToUCPD.to_enum(),
                    .SPI1CLockSelection = try cubemx_config.SPI1CLockSelection.to_enum(),
                    .SPI23CLockSelection = try cubemx_config.SPI23CLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
                    .SAI2CLockSelection = try cubemx_config.SAI2CLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C23CLockSelection = try cubemx_config.I2C23CLockSelection.to_enum(),
                    .SPDIFCLockSelection = try cubemx_config.SPDIFCLockSelection.to_enum(),
                    .FmcClockSelection = try cubemx_config.FmcClockSelection.to_enum(),
                    .SDMMC1CLockSelection = try cubemx_config.SDMMC1CLockSelection.to_enum(),
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .Adf1ClockSelection = try cubemx_config.Adf1ClockSelection.to_enum(),
                    .USART234578CLockSelection = try cubemx_config.USART234578CLockSelection.to_enum(),
                    .LPUART1CLockSelection = try cubemx_config.LPUART1CLockSelection.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .LPTIM23CLockSelection = try cubemx_config.LPTIM23CLockSelection.to_enum(),
                    .LPTIM45CLockSelection = try cubemx_config.LPTIM45CLockSelection.to_enum(),
                    .SPI6CLockSelection = try cubemx_config.SPI6CLockSelection.to_enum(),
                    .Spi45ClockSelection = try cubemx_config.Spi45ClockSelection.to_enum(),
                    .RCC_USBPHY_Clock_Source_FROM_HSE = cubemx_config.RCC_USBPHY_Clock_Source_FROM_HSE,
                    .USBPHYCLKSource = try cubemx_config.USBPHYCLKSource.to_enum(),
                    .USBCLockSelection = try cubemx_config.USBCLockSelection.to_enum(),
                    .FDCANCLockSelection = try cubemx_config.FDCANCLockSelection.to_enum(),
                    .Xspi1ClockSelection = try cubemx_config.Xspi1ClockSelection.to_enum(),
                    .PSSICLockSelection = try cubemx_config.PSSICLockSelection.to_enum(),
                    .Xspi2ClockSelection = try cubemx_config.Xspi2ClockSelection.to_enum(),
                    .ETHPHYCLockSelection = try cubemx_config.ETHPHYCLockSelection.to_enum(),
                    .ETH1CLockSelection = try cubemx_config.ETH1CLockSelection.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .CECCLockSelection = try cubemx_config.CECCLockSelection.to_enum(),
                    .CSI_DIV = cubemx_config.CSI_DIV,
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
            Dig_CKIN: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            MCO1Mult: u32 = 0,
            MCO1Div: u32 = 0,
            MCO1Pin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            CPRE: u32 = 0,
            CPREOutput: u32 = 0,
            TPIUPrescaler: u32 = 0,
            TPIUOutput: u32 = 0,
            CpuClockOutput: u32 = 0,
            CortexPrescaler: u32 = 0,
            CortexSysOutput: u32 = 0,
            BMPRE: u32 = 0,
            AHBOutput: u32 = 0,
            AXIClockOutput: u32 = 0,
            AHB5Output: u32 = 0,
            PPRE5: u32 = 0,
            APB5Output: u32 = 0,
            AHB1234Output: u32 = 0,
            PPRE1: u32 = 0,
            APB1Output: u32 = 0,
            Tim1Mul: u32 = 0,
            Tim1Output: u32 = 0,
            PPRE2: u32 = 0,
            APB2Output: u32 = 0,
            Tim2Mul: u32 = 0,
            Tim2Output: u32 = 0,
            PPRE4: u32 = 0,
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
            DIVS1: u32 = 0,
            DIVS1output: u32 = 0,
            DIVT1: u32 = 0,
            DIVT1output: u32 = 0,
            DIVN2: u32 = 0,
            PLL2FRACN: u32 = 0,
            DIVP2: u32 = 0,
            DIVP2output: u32 = 0,
            DIVQ2: u32 = 0,
            DIVQ2output: u32 = 0,
            DIVR2: u32 = 0,
            DIVR2output: u32 = 0,
            DIVS2: u32 = 0,
            DIVS2output: u32 = 0,
            DIVT2: u32 = 0,
            DIVT2output: u32 = 0,
            DIVN3: u32 = 0,
            PLL3FRACN: u32 = 0,
            DIVP3: u32 = 0,
            DIVP3output: u32 = 0,
            DIVQ3: u32 = 0,
            DIVQ3output: u32 = 0,
            DIVR3: u32 = 0,
            DIVR3output: u32 = 0,
            DIVS3: u32 = 0,
            DIVS3output: u32 = 0,
            DIVT3: u32 = 0,
            DIVT3output: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            UCPDoutput: u32 = 0,
            HSI_DIV: u32 = 0,
            SPI1Mult: u32 = 0,
            SPI1output: u32 = 0,
            SPI23Mult: u32 = 0,
            SPI23output: u32 = 0,
            SAI1Mult: u32 = 0,
            SAI1output: u32 = 0,
            SAI2Mult: u32 = 0,
            SAI2output: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C23Mult: u32 = 0,
            I2C23output: u32 = 0,
            SPDIFMult: u32 = 0,
            SPDIFoutput: u32 = 0,
            LTDCOutput: u32 = 0,
            FMCMult: u32 = 0,
            FMCoutput: u32 = 0,
            SDMMCMult: u32 = 0,
            SDMMCoutput: u32 = 0,
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            ADFMult: u32 = 0,
            ADFoutput: u32 = 0,
            USART234578Mult: u32 = 0,
            USART234578output: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            LPTIM23Mult: u32 = 0,
            LPTIM23output: u32 = 0,
            LPTIM45Mult: u32 = 0,
            LPTIM45output: u32 = 0,
            SPI6Mult: u32 = 0,
            SPI6output: u32 = 0,
            SPI45Mult: u32 = 0,
            SPI45output: u32 = 0,
            HSEUSBPHYDevisor: u32 = 0,
            USBPHYCLKMux: u32 = 0,
            USBPHYCLKOutput: u32 = 0,
            USBPHYRC: u32 = 0,
            USBPHYRC60: u32 = 0,
            USBOCLKMux: u32 = 0,
            USBOFSCLKOutput: u32 = 0,
            RNGOutput: u32 = 0,
            DTSOutput: u32 = 0,
            FDCANMult: u32 = 0,
            FDCANoutput: u32 = 0,
            XSPI1Mult: u32 = 0,
            XSPI1output: u32 = 0,
            PSSIMult: u32 = 0,
            PSSIoutput: u32 = 0,
            XSPI2Mult: u32 = 0,
            XSPI2output: u32 = 0,
            ETHPHYMult: u32 = 0,
            ETHPHYoutput: u32 = 0,
            ETH1Mult: u32 = 0,
            ETH1output: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            CECMult: u32 = 0,
            CECoutput: u32 = 0,
            CSICECDevisor: u32 = 0,
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

            var SYSCLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SYSCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SYSCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SYSCLKSOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_RC48: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_SYSCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_PLL2PCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_PLLCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var PPRE1_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var PPRE1_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var PPRE1_4: bool = false; //semaphore for processing, not an actual flag in the output;
            var PPRE2_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var PPRE2_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var PPRE2_4: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PERSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PERSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PERSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI23CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI23CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI23CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI23CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI23CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2CLKSOURCE_PLLQ1: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2CLKSOURCE_PLLP3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2CLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2CLKSOURCE_SPDIF: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1CLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C23CLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C23CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C23CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C23CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_PLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_PLL3R: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_HCLK5: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_PLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var FMCCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1CLKSOURCE_PLL2S: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1CLKSOURCE_PLL2T: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1CLKSOURCE_PCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADFCLKSOURCE_HCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADFCLKSOURCE_PLL2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADFCLKSOURCE_PLL3P: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADFCLKSOURCE_CKIN: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADFCLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADFCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_PCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var LPTIM23CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM23CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM23CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM23CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM23CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM23CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM45CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM45CLKSOURCE_PLLP2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM45CLKSOURCE_PLLR3: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM45CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM45CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM45CLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_PCLK4: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI6CLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_PCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_PLLQ2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_PLLQ3: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_CSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI45CLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBPHYCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBPHYCLKSOURCE_HSE2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBPHYCLKSOURCE_PLL3Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBOCLKSOURCE_RC48: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBOCLKSOURCE_PLL3Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBOCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBOCLKSOURCE_PHY: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_PLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANCLKSOURCE_PLL2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var OSPI1CLKSOURCE_HCLK5: bool = false; //semaphore for processing, not an actual flag in the output;
            var OSPI1CLKSOURCE_PLL2S: bool = false; //semaphore for processing, not an actual flag in the output;
            var OSPI1CLKSOURCE_PLL2T: bool = false; //semaphore for processing, not an actual flag in the output;
            var PSSICLKSOURCE_PLL3R: bool = false; //semaphore for processing, not an actual flag in the output;
            var PSSICLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var OSPI2CLKSOURCE_HCLK5: bool = false; //semaphore for processing, not an actual flag in the output;
            var OSPI2CLKSOURCE_PLL2S: bool = false; //semaphore for processing, not an actual flag in the output;
            var OSPI2CLKSOURCE_PLL2T: bool = false; //semaphore for processing, not an actual flag in the output;
            var ETHPHYCLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ETHPHYCLKSOURCE_PLL3S: bool = false; //semaphore for processing, not an actual flag in the output;
            var ETH1CLKSOURCE_EXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var ETH1CLKSOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ETH1CLKSOURCE_ETHPHY: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCCLKSOURCE_PLL2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCCLKSOURCE_PLL3R: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCCLKSOURCE_PER: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECCLKSOURCE_CSI122: bool = false; //semaphore for processing, not an actual flag in the output;
            var TimPrescalerEnabled: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var Dig_CKIN = ClockNode{
                .name = "Dig_CKIN",
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

            var CPRE = ClockNode{
                .name = "CPRE",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var CPREOutput = ClockNode{
                .name = "CPREOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TPIUPrescaler = ClockNode{
                .name = "TPIUPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TPIUOutput = ClockNode{
                .name = "TPIUOutput",
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

            var BMPRE = ClockNode{
                .name = "BMPRE",
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

            var AHB5Output = ClockNode{
                .name = "AHB5Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PPRE5 = ClockNode{
                .name = "PPRE5",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB5Output = ClockNode{
                .name = "APB5Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHB1234Output = ClockNode{
                .name = "AHB1234Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PPRE1 = ClockNode{
                .name = "PPRE1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB1Output = ClockNode{
                .name = "APB1Output",
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

            var PPRE2 = ClockNode{
                .name = "PPRE2",
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

            var PPRE4 = ClockNode{
                .name = "PPRE4",
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

            var DIVS1 = ClockNode{
                .name = "DIVS1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVS1output = ClockNode{
                .name = "DIVS1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVT1 = ClockNode{
                .name = "DIVT1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVT1output = ClockNode{
                .name = "DIVT1output",
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

            var DIVS2 = ClockNode{
                .name = "DIVS2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVS2output = ClockNode{
                .name = "DIVS2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVT2 = ClockNode{
                .name = "DIVT2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVT2output = ClockNode{
                .name = "DIVT2output",
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

            var DIVR3output = ClockNode{
                .name = "DIVR3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVS3 = ClockNode{
                .name = "DIVS3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVS3output = ClockNode{
                .name = "DIVS3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVT3 = ClockNode{
                .name = "DIVT3",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DIVT3output = ClockNode{
                .name = "DIVT3output",
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

            var UCPDoutput = ClockNode{
                .name = "UCPDoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSI_DIV = ClockNode{
                .name = "HSI_DIV",
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

            var SPI23Mult = ClockNode{
                .name = "SPI23Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPI23output = ClockNode{
                .name = "SPI23output",
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

            var I2C23Mult = ClockNode{
                .name = "I2C23Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C23output = ClockNode{
                .name = "I2C23output",
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

            var LTDCOutput = ClockNode{
                .name = "LTDCOutput",
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

            var ADFMult = ClockNode{
                .name = "ADFMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADFoutput = ClockNode{
                .name = "ADFoutput",
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

            var LPTIM23Mult = ClockNode{
                .name = "LPTIM23Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM23output = ClockNode{
                .name = "LPTIM23output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM45Mult = ClockNode{
                .name = "LPTIM45Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM45output = ClockNode{
                .name = "LPTIM45output",
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

            var HSEUSBPHYDevisor = ClockNode{
                .name = "HSEUSBPHYDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBPHYCLKMux = ClockNode{
                .name = "USBPHYCLKMux",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBPHYCLKOutput = ClockNode{
                .name = "USBPHYCLKOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBPHYRC = ClockNode{
                .name = "USBPHYRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBPHYRC60 = ClockNode{
                .name = "USBPHYRC60",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBOCLKMux = ClockNode{
                .name = "USBOCLKMux",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBOFSCLKOutput = ClockNode{
                .name = "USBOFSCLKOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RNGOutput = ClockNode{
                .name = "RNGOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DTSOutput = ClockNode{
                .name = "DTSOutput",
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

            var XSPI1Mult = ClockNode{
                .name = "XSPI1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var XSPI1output = ClockNode{
                .name = "XSPI1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PSSIMult = ClockNode{
                .name = "PSSIMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PSSIoutput = ClockNode{
                .name = "PSSIoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var XSPI2Mult = ClockNode{
                .name = "XSPI2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var XSPI2output = ClockNode{
                .name = "XSPI2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ETHPHYMult = ClockNode{
                .name = "ETHPHYMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ETHPHYoutput = ClockNode{
                .name = "ETHPHYoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ETH1Mult = ClockNode{
                .name = "ETH1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ETH1output = ClockNode{
                .name = "ETH1output",
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

            var CSICECDevisor = ClockNode{
                .name = "CSICECDevisor",
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
                if (config.flags.HSEByPass or config.flags.HSEDIGByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 5e7,
                        .main_expr = "HSEByPass|HSEDIGByPass",
                        .main_dialog = "HSEByPass",
                    };
                    break :blk user_val orelse 2.4e7;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 5e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 2.4e7;
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

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 1.2288e7;
            };

            const DIGITAL_CLOCK_VALUEValue: f32 = blk: {
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
                        .RCC_MCO1SOURCE_HSI => MCO1SOURCE_HSI = true,
                        .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                        .RCC_MCO1SOURCE_LSE => MCO1SOURCE_LSE = true,
                        .RCC_MCO1SOURCE_HSI48 => MCO1SOURCE_RC48 = true,
                        .RCC_MCO1SOURCE_PLL1Q => MCO1SOURCE_PLLCLK = true,
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
                        .RCC_MCO2SOURCE_PLL2P => MCO2SOURCE_PLL2PCLK = true,
                        .RCC_MCO2SOURCE_HSE => MCO2SOURCE_HSE = true,
                        .RCC_MCO2SOURCE_PLL1P => MCO2SOURCE_PLLCLK = true,
                        .RCC_MCO2SOURCE_CSI => MCO2SOURCE_CSI = true,
                        .RCC_MCO2SOURCE_LSI => MCO2SOURCE_LSI = true,
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

            const CPREValue: CPREList = blk: {
                const user_val = config.CPRE;

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

            const TPIUValue: TPIUList = blk: {
                break :blk .RCC_TPIU_DIV;
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

            const BMPREValue: BMPREList = blk: {
                const user_val = config.BMPRE;

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

            const PPRE5Value: PPRE5List = blk: {
                const user_val = config.PPRE5;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB5_DIV1 => {},
                        .RCC_APB5_DIV2 => {},
                        .RCC_APB5_DIV4 => {},
                        .RCC_APB5_DIV8 => {},
                        .RCC_APB5_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_APB5_DIV1;
            };

            const PPRE1Value: PPRE1List = blk: {
                const user_val = config.PPRE1;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB1_DIV1 => PPRE1_1 = true,
                        .RCC_APB1_DIV2 => PPRE1_2 = true,
                        .RCC_APB1_DIV4 => PPRE1_4 = true,
                        .RCC_APB1_DIV8 => {},
                        .RCC_APB1_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    PPRE1_1 = true;
                    break :blk .RCC_APB1_DIV1;
                };
            };

            const RCC_TIM_PRescaler_SelectionValue: RCC_TIM_PRescaler_SelectionList = blk: {
                const user_val = config.extra_config.RCC_TIM_PRescaler_Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_TIMPRES_ACTIVATED => TimPrescalerEnabled = true,
                        .RCC_TIMPRES_DISABLE => {},
                    }
                }
                break :blk user_val orelse .RCC_TIMPRES_DISABLE;
            };

            const Tim1MulValue: u32 = blk: {
                if (((PPRE1_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DISABLE, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DISABLE, .@"="))) {
                    break :blk 2;
                } else if ((PPRE1_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((PPRE1_2) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((PPRE1_4) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                }
                break :blk 2;
            };

            const PPRE2Value: PPRE2List = blk: {
                const user_val = config.PPRE2;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB2_DIV1 => PPRE2_1 = true,
                        .RCC_APB2_DIV2 => PPRE2_2 = true,
                        .RCC_APB2_DIV4 => PPRE2_4 = true,
                        .RCC_APB2_DIV8 => {},
                        .RCC_APB2_DIV16 => {},
                    }
                }
                break :blk user_val orelse {
                    PPRE2_1 = true;
                    break :blk .RCC_APB2_DIV1;
                };
            };

            const Tim2MulValue: u32 = blk: {
                if (((PPRE2_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DISABLE, .@"=")))) {
                    break :blk 1;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_DISABLE, .@"="))) {
                    break :blk 2;
                } else if ((PPRE2_1) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 1;
                } else if ((PPRE2_2) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 2;
                } else if ((PPRE2_4) and (check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                } else if ((check_ref(@TypeOf(RCC_TIM_PRescaler_SelectionValue), RCC_TIM_PRescaler_SelectionValue, .RCC_TIMPRES_ACTIVATED, .@"="))) {
                    break :blk 4;
                }
                break :blk 2;
            };

            const PPRE4Value: PPRE4List = blk: {
                const user_val = config.PPRE4;

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

            const PLLSourceValue: PLLSourceList = blk: {
                const user_val = config.PLLSource;

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
                break :blk user_val orelse 128;
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
                        .@"1" => {},
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

            const DIVS1Value: u32 = blk: {
                const user_val = config.DIVS1;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVS1",
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
                            "DIVS1",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVT1Value: u32 = blk: {
                const user_val = config.DIVT1;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVT1",
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
                            "DIVT1",
                            "Else",
                            "No additional information",
                            8,
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
                break :blk user_val orelse 128;
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

            const DIVS2Value: u32 = blk: {
                const user_val = config.DIVS2;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVS2",
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
                            "DIVS2",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVT2Value: u32 = blk: {
                const user_val = config.DIVT2;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVT2",
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
                            "DIVT2",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVN3Value: u32 = blk: {
                const user_val = config.DIVN3;
                if (user_val) |val| {
                    if (val < 12) {
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
                            12,
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
                break :blk user_val orelse 128;
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

            const DIVS3Value: u32 = blk: {
                const user_val = config.DIVS3;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVS3",
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
                            "DIVS3",
                            "Else",
                            "No additional information",
                            8,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const DIVT3Value: u32 = blk: {
                const user_val = config.DIVT3;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "DIVT3",
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
                            "DIVT3",
                            "Else",
                            "No additional information",
                            8,
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

            const HSIDivToUCPDValue: HSIDivToUCPDList = blk: {
                break :blk .RCC_UCPDCLKSOURCE_HSI4;
            };

            const SPI1CLockSelectionValue: SPI1CLockSelectionList = blk: {
                const user_val = config.SPI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI1CLKSOURCE_PLL1Q => SPI1CLKSOURCE_PLLQ1 = true,
                        .RCC_SPI1CLKSOURCE_PLL2P => SPI1CLKSOURCE_PLLP2 = true,
                        .RCC_SPI1CLKSOURCE_PLL3P => SPI1CLKSOURCE_PLLP3 = true,
                        .RCC_SPI1CLKSOURCE_PIN => SPI1CLKSOURCE_CKIN = true,
                        .RCC_SPI1CLKSOURCE_CLKP => SPI1CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SPI1CLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SPI1CLKSOURCE_PLL1Q;
                };
            };

            const SPI23CLockSelectionValue: SPI23CLockSelectionList = blk: {
                const user_val = config.SPI23CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI23CLKSOURCE_PLL1Q => SPI23CLKSOURCE_PLLQ1 = true,
                        .RCC_SPI23CLKSOURCE_PLL2P => SPI23CLKSOURCE_PLLP2 = true,
                        .RCC_SPI23CLKSOURCE_PLL3P => SPI23CLKSOURCE_PLLP3 = true,
                        .RCC_SPI23CLKSOURCE_PIN => SPI23CLKSOURCE_CKIN = true,
                        .RCC_SPI23CLKSOURCE_CLKP => SPI23CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SPI23CLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SPI23CLKSOURCE_PLL1Q;
                };
            };

            const SAI1CLockSelectionValue: SAI1CLockSelectionList = blk: {
                const user_val = config.SAI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_PLL1Q => SAI1CLKSOURCE_PLLQ1 = true,
                        .RCC_SAI1CLKSOURCE_PLL2P => SAI1CLKSOURCE_PLLP2 = true,
                        .RCC_SAI1CLKSOURCE_PLL3P => SAI1CLKSOURCE_PLLP3 = true,
                        .RCC_SAI1CLKSOURCE_PIN => SAI1CLKSOURCE_CKIN = true,
                        .RCC_SAI1CLKSOURCE_CLKP => SAI1CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    SAI1CLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI1CLKSOURCE_PLL1Q;
                };
            };

            const SAI2CLockSelectionValue: SAI2CLockSelectionList = blk: {
                const user_val = config.SAI2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI2CLKSOURCE_PLL1Q => SAI2CLKSOURCE_PLLQ1 = true,
                        .RCC_SAI2CLKSOURCE_PLL2P => SAI2CLKSOURCE_PLLP2 = true,
                        .RCC_SAI2CLKSOURCE_PLL3P => SAI2CLKSOURCE_PLLP3 = true,
                        .RCC_SAI2CLKSOURCE_PIN => SAI2CLKSOURCE_CKIN = true,
                        .RCC_SAI2CLKSOURCE_CLKP => SAI2CLKSOURCE_PER = true,
                        .RCC_SAI2CLKSOURCE_SPDIF => SAI2CLKSOURCE_SPDIF = true,
                    }
                }
                break :blk user_val orelse {
                    SAI2CLKSOURCE_PLLQ1 = true;
                    break :blk .RCC_SAI2CLKSOURCE_PLL1Q;
                };
            };

            const I2C1CLockSelectionValue: I2C1CLockSelectionList = blk: {
                const user_val = config.I2C1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1_I3C1CLKSOURCE_PCLK1 => I2C1CLKSOURCE_PCLK1 = true,
                        .RCC_I2C1_I3C1CLKSOURCE_PLL3R => I2C1CLKSOURCE_PLLR3 = true,
                        .RCC_I2C1_I3C1CLKSOURCE_HSI => I2C1CLKSOURCE_HSI = true,
                        .RCC_I2C1_I3C1CLKSOURCE_CSI => I2C1CLKSOURCE_CSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C1CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_I2C1_I3C1CLKSOURCE_PCLK1;
                };
            };

            const I2C23CLockSelectionValue: I2C23CLockSelectionList = blk: {
                const user_val = config.I2C23CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C23CLKSOURCE_PCLK1 => I2C23CLKSOURCE_PCLK1 = true,
                        .RCC_I2C23CLKSOURCE_PLL3R => I2C23CLKSOURCE_PLLR3 = true,
                        .RCC_I2C23CLKSOURCE_HSI => I2C23CLKSOURCE_HSI = true,
                        .RCC_I2C23CLKSOURCE_CSI => I2C23CLKSOURCE_CSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C23CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_I2C23CLKSOURCE_PCLK1;
                };
            };

            const SPDIFCLockSelectionValue: SPDIFCLockSelectionList = blk: {
                const user_val = config.SPDIFCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPDIFRXCLKSOURCE_PLL1Q => SPDIFCLKSOURCE_PLL1Q = true,
                        .RCC_SPDIFRXCLKSOURCE_PLL2R => SPDIFCLKSOURCE_PLL2R = true,
                        .RCC_SPDIFRXCLKSOURCE_PLL3R => SPDIFCLKSOURCE_PLL3R = true,
                        .RCC_SPDIFRXCLKSOURCE_HSI => SPDIFCLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse {
                    SPDIFCLKSOURCE_PLL1Q = true;
                    break :blk .RCC_SPDIFRXCLKSOURCE_PLL1Q;
                };
            };

            const FmcClockSelectionValue: FmcClockSelectionList = blk: {
                const user_val = config.FmcClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FMCCLKSOURCE_HCLK => FMCCLKSOURCE_HCLK5 = true,
                        .RCC_FMCCLKSOURCE_PLL1Q => FMCCLKSOURCE_PLL1Q = true,
                        .RCC_FMCCLKSOURCE_PLL2R => FMCCLKSOURCE_PLL2R = true,
                        .RCC_FMCCLKSOURCE_HSI => FMCCLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse {
                    FMCCLKSOURCE_HCLK5 = true;
                    break :blk .RCC_FMCCLKSOURCE_HCLK;
                };
            };

            const SDMMC1CLockSelectionValue: SDMMC1CLockSelectionList = blk: {
                const user_val = config.SDMMC1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SDMMC12CLKSOURCE_PLL2S => SDMMC1CLKSOURCE_PLL2S = true,
                        .RCC_SDMMC12CLKSOURCE_PLL2T => SDMMC1CLKSOURCE_PLL2T = true,
                    }
                }
                break :blk user_val orelse {
                    SDMMC1CLKSOURCE_PLL2S = true;
                    break :blk .RCC_SDMMC12CLKSOURCE_PLL2S;
                };
            };

            const USART1CLockSelectionValue: USART1CLockSelectionList = blk: {
                const user_val = config.USART1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK2 => USART1CLKSOURCE_PCLK2 = true,
                        .RCC_USART1CLKSOURCE_PLL2Q => USART1CLKSOURCE_PLLQ2 = true,
                        .RCC_USART1CLKSOURCE_PLL3Q => USART1CLKSOURCE_PLLQ3 = true,
                        .RCC_USART1CLKSOURCE_HSI => USART1CLKSOURCE_HSI = true,
                        .RCC_USART1CLKSOURCE_CSI => USART1CLKSOURCE_CSI = true,
                        .RCC_USART1CLKSOURCE_LSE => USART1CLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART1CLKSOURCE_PCLK2 = true;
                    break :blk .RCC_USART1CLKSOURCE_PCLK2;
                };
            };

            const Adf1ClockSelectionValue: Adf1ClockSelectionList = blk: {
                const user_val = config.Adf1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADF1CLKSOURCE_HCLK => ADFCLKSOURCE_HCLK1 = true,
                        .RCC_ADF1CLKSOURCE_PLL2P => ADFCLKSOURCE_PLL2P = true,
                        .RCC_ADF1CLKSOURCE_PLL3P => ADFCLKSOURCE_PLL3P = true,
                        .RCC_ADF1CLKSOURCE_PIN => ADFCLKSOURCE_CKIN = true,
                        .RCC_ADF1CLKSOURCE_CSI => ADFCLKSOURCE_CSI = true,
                        .RCC_ADF1CLKSOURCE_HSI => ADFCLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse {
                    ADFCLKSOURCE_HCLK1 = true;
                    break :blk .RCC_ADF1CLKSOURCE_HCLK;
                };
            };

            const USART234578CLockSelectionValue: USART234578CLockSelectionList = blk: {
                const user_val = config.USART234578CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART234578CLKSOURCE_PCLK1 => USART2CLKSOURCE_PCLK1 = true,
                        .RCC_USART234578CLKSOURCE_PLL2Q => USART2CLKSOURCE_PLLQ2 = true,
                        .RCC_USART234578CLKSOURCE_PLL3Q => USART2CLKSOURCE_PLLQ3 = true,
                        .RCC_USART234578CLKSOURCE_HSI => USART2CLKSOURCE_HSI = true,
                        .RCC_USART234578CLKSOURCE_CSI => USART2CLKSOURCE_CSI = true,
                        .RCC_USART234578CLKSOURCE_LSE => USART2CLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART2CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_USART234578CLKSOURCE_PCLK1;
                };
            };

            const LPUART1CLockSelectionValue: LPUART1CLockSelectionList = blk: {
                const user_val = config.LPUART1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_PCLK4 => LPUART1CLKSOURCE_PCLK4 = true,
                        .RCC_LPUART1CLKSOURCE_PLL2Q => LPUART1CLKSOURCE_PLL2Q = true,
                        .RCC_LPUART1CLKSOURCE_PLL3Q => LPUART1CLKSOURCE_PLL3Q = true,
                        .RCC_LPUART1CLKSOURCE_HSI => LPUART1CLKSOURCE_HSI = true,
                        .RCC_LPUART1CLKSOURCE_CSI => LPUART1CLKSOURCE_CSI = true,
                        .RCC_LPUART1CLKSOURCE_LSE => LPUART1CLKSOURCE_LSE = true,
                    }
                }
                break :blk user_val orelse {
                    LPUART1CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_LPUART1CLKSOURCE_PCLK4;
                };
            };

            const LPTIM1CLockSelectionValue: LPTIM1CLockSelectionList = blk: {
                const user_val = config.LPTIM1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_PCLK1 => LPTIM1CLKSOURCE_PCLK1 = true,
                        .RCC_LPTIM1CLKSOURCE_PLL2P => LPTIM1CLKSOURCE_PLLP2 = true,
                        .RCC_LPTIM1CLKSOURCE_PLL3R => LPTIM1CLKSOURCE_PLLR3 = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1CLKSOURCE_LSE = true,
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1CLKSOURCE_LSI = true,
                        .RCC_LPTIM1CLKSOURCE_CLKP => LPTIM1CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM1CLKSOURCE_PCLK1 = true;
                    break :blk .RCC_LPTIM1CLKSOURCE_PCLK1;
                };
            };

            const LPTIM23CLockSelectionValue: LPTIM23CLockSelectionList = blk: {
                const user_val = config.LPTIM23CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM23CLKSOURCE_PCLK4 => LPTIM23CLKSOURCE_PCLK4 = true,
                        .RCC_LPTIM23CLKSOURCE_PLL2P => LPTIM23CLKSOURCE_PLLP2 = true,
                        .RCC_LPTIM23CLKSOURCE_PLL3R => LPTIM23CLKSOURCE_PLLR3 = true,
                        .RCC_LPTIM23CLKSOURCE_LSE => LPTIM23CLKSOURCE_LSE = true,
                        .RCC_LPTIM23CLKSOURCE_LSI => LPTIM23CLKSOURCE_LSI = true,
                        .RCC_LPTIM23CLKSOURCE_CLKP => LPTIM23CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM23CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_LPTIM23CLKSOURCE_PCLK4;
                };
            };

            const LPTIM45CLockSelectionValue: LPTIM45CLockSelectionList = blk: {
                const user_val = config.LPTIM45CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM45CLKSOURCE_PCLK4 => LPTIM45CLKSOURCE_PCLK4 = true,
                        .RCC_LPTIM45CLKSOURCE_PLL2P => LPTIM45CLKSOURCE_PLLP2 = true,
                        .RCC_LPTIM45CLKSOURCE_PLL3R => LPTIM45CLKSOURCE_PLLR3 = true,
                        .RCC_LPTIM45CLKSOURCE_LSE => LPTIM45CLKSOURCE_LSE = true,
                        .RCC_LPTIM45CLKSOURCE_LSI => LPTIM45CLKSOURCE_LSI = true,
                        .RCC_LPTIM45CLKSOURCE_CLKP => LPTIM45CLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM45CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_LPTIM45CLKSOURCE_PCLK4;
                };
            };

            const SPI6CLockSelectionValue: SPI6CLockSelectionList = blk: {
                const user_val = config.SPI6CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI6CLKSOURCE_PCLK4 => SPI6CLKSOURCE_PCLK4 = true,
                        .RCC_SPI6CLKSOURCE_PLL2Q => SPI6CLKSOURCE_PLLQ2 = true,
                        .RCC_SPI6CLKSOURCE_PLL3Q => SPI6CLKSOURCE_PLLQ3 = true,
                        .RCC_SPI6CLKSOURCE_HSI => SPI6CLKSOURCE_HSI = true,
                        .RCC_SPI6CLKSOURCE_CSI => SPI6CLKSOURCE_CSI = true,
                        .RCC_SPI6CLKSOURCE_HSE => SPI6CLKSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    SPI6CLKSOURCE_PCLK4 = true;
                    break :blk .RCC_SPI6CLKSOURCE_PCLK4;
                };
            };

            const Spi45ClockSelectionValue: Spi45ClockSelectionList = blk: {
                const user_val = config.Spi45ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI45CLKSOURCE_PCLK2 => SPI45CLKSOURCE_PCLK2 = true,
                        .RCC_SPI45CLKSOURCE_PLL2Q => SPI45CLKSOURCE_PLLQ2 = true,
                        .RCC_SPI45CLKSOURCE_PLL3Q => SPI45CLKSOURCE_PLLQ3 = true,
                        .RCC_SPI45CLKSOURCE_HSI => SPI45CLKSOURCE_HSI = true,
                        .RCC_SPI45CLKSOURCE_CSI => SPI45CLKSOURCE_CSI = true,
                        .RCC_SPI45CLKSOURCE_HSE => SPI45CLKSOURCE_HSE = true,
                    }
                }
                break :blk user_val orelse {
                    SPI45CLKSOURCE_PCLK2 = true;
                    break :blk .RCC_SPI45CLKSOURCE_PCLK2;
                };
            };

            const RCC_USBPHY_Clock_Source_FROM_HSEValue: RCC_USBPHY_Clock_Source_FROM_HSEList = blk: {
                break :blk .RCC_USBPHYCCLKSOURCE_HSE_DIV2;
            };

            const USBPHYCLKSourceValue: USBPHYCLKSourceList = blk: {
                const user_val = config.USBPHYCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBPHYCCLKSOURCE_HSE => USBPHYCLKSOURCE_HSE = true,
                        .RCC_USBPHYCCLKSOURCE_HSE_DIV2 => USBPHYCLKSOURCE_HSE2 = true,
                        .RCC_USBPHYCCLKSOURCE_PLL3Q => USBPHYCLKSOURCE_PLL3Q = true,
                    }
                }
                break :blk user_val orelse {
                    USBPHYCLKSOURCE_HSE = true;
                    break :blk .RCC_USBPHYCCLKSOURCE_HSE;
                };
            };

            const USB_PHY_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const USB_PHY_VALUE60Value: f32 = blk: {
                break :blk 6e7;
            };

            const USBCLockSelectionValue: USBCLockSelectionList = blk: {
                const user_val = config.USBCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBOTGFSCLKSOURCE_HSI48 => USBOCLKSOURCE_RC48 = true,
                        .RCC_USBOTGFSCLKSOURCE_PLL3Q => USBOCLKSOURCE_PLL3Q = true,
                        .RCC_USBOTGFSCLKSOURCE_HSE => USBOCLKSOURCE_HSE = true,
                        .RCC_USBOTGFSCLKSOURCE_CLK48 => USBOCLKSOURCE_PHY = true,
                    }
                }
                break :blk user_val orelse {
                    USBOCLKSOURCE_RC48 = true;
                    break :blk .RCC_USBOTGFSCLKSOURCE_HSI48;
                };
            };

            const FDCANCLockSelectionValue: FDCANCLockSelectionList = blk: {
                const user_val = config.FDCANCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FDCANCLKSOURCE_HSE => FDCANCLKSOURCE_HSE = true,
                        .RCC_FDCANCLKSOURCE_PLL1Q => FDCANCLKSOURCE_PLL1Q = true,
                        .RCC_FDCANCLKSOURCE_PLL2P => FDCANCLKSOURCE_PLL2P = true,
                    }
                }
                break :blk user_val orelse {
                    FDCANCLKSOURCE_HSE = true;
                    break :blk .RCC_FDCANCLKSOURCE_HSE;
                };
            };

            const Xspi1ClockSelectionValue: Xspi1ClockSelectionList = blk: {
                const user_val = config.Xspi1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_XSPI1CLKSOURCE_HCLK => OSPI1CLKSOURCE_HCLK5 = true,
                        .RCC_XSPI1CLKSOURCE_PLL2S => OSPI1CLKSOURCE_PLL2S = true,
                        .RCC_XSPI1CLKSOURCE_PLL2T => OSPI1CLKSOURCE_PLL2T = true,
                    }
                }
                break :blk user_val orelse {
                    OSPI1CLKSOURCE_HCLK5 = true;
                    break :blk .RCC_XSPI1CLKSOURCE_HCLK;
                };
            };

            const PSSICLockSelectionValue: PSSICLockSelectionList = blk: {
                const user_val = config.PSSICLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PSSICLKSOURCE_PLL3R => PSSICLKSOURCE_PLL3R = true,
                        .RCC_PSSICLKSOURCE_CLKP => PSSICLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    PSSICLKSOURCE_PLL3R = true;
                    break :blk .RCC_PSSICLKSOURCE_PLL3R;
                };
            };

            const Xspi2ClockSelectionValue: Xspi2ClockSelectionList = blk: {
                const user_val = config.Xspi2ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_XSPI2CLKSOURCE_HCLK => OSPI2CLKSOURCE_HCLK5 = true,
                        .RCC_XSPI2CLKSOURCE_PLL2S => OSPI2CLKSOURCE_PLL2S = true,
                        .RCC_XSPI2CLKSOURCE_PLL2T => OSPI2CLKSOURCE_PLL2T = true,
                    }
                }
                break :blk user_val orelse {
                    OSPI2CLKSOURCE_HCLK5 = true;
                    break :blk .RCC_XSPI2CLKSOURCE_HCLK;
                };
            };

            const ETHPHYCLockSelectionValue: ETHPHYCLockSelectionList = blk: {
                const user_val = config.ETHPHYCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ETH1PHYCLKSOURCE_HSE => ETHPHYCLKSOURCE_HSE = true,
                        .RCC_ETH1PHYCLKSOURCE_PLL3S => ETHPHYCLKSOURCE_PLL3S = true,
                    }
                }
                break :blk user_val orelse {
                    ETHPHYCLKSOURCE_HSE = true;
                    break :blk .RCC_ETH1PHYCLKSOURCE_HSE;
                };
            };

            const ETH1CLockSelectionValue: ETH1CLockSelectionList = blk: {
                const user_val = config.ETH1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ETH1REFCLKSOURCE_ETH => ETH1CLKSOURCE_EXT = true,
                        .RCC_ETH1REFCLKSOURCE_HSE => ETH1CLKSOURCE_HSE = true,
                        .RCC_ETH1REFCLKSOURCE_PHY => ETH1CLKSOURCE_ETHPHY = true,
                    }
                }
                break :blk user_val orelse {
                    ETH1CLKSOURCE_ETHPHY = true;
                    break :blk .RCC_ETH1REFCLKSOURCE_PHY;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_PLL2P => ADCCLKSOURCE_PLL2P = true,
                        .RCC_ADCCLKSOURCE_PLL3R => ADCCLKSOURCE_PLL3R = true,
                        .RCC_ADCCLKSOURCE_CLKP => ADCCLKSOURCE_PER = true,
                    }
                }
                break :blk user_val orelse {
                    ADCCLKSOURCE_PLL2P = true;
                    break :blk .RCC_ADCCLKSOURCE_PLL2P;
                };
            };

            const CECCLockSelectionValue: CECCLockSelectionList = blk: {
                const user_val = config.CECCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CECCLKSOURCE_LSE => CECCLKSOURCE_LSE = true,
                        .RCC_CECCLKSOURCE_LSI => CECCLKSOURCE_LSI = true,
                        .RCC_CECCLKSOURCE_CSI => CECCLKSOURCE_CSI122 = true,
                    }
                }
                break :blk user_val orelse {
                    CECCLKSOURCE_LSE = true;
                    break :blk .RCC_CECCLKSOURCE_LSE;
                };
            };

            const CSI_DIVValue: CSI_DIVList = blk: {
                break :blk .RCC_CECCLKSOURCE_CSI;
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
                if (config.flags.CRSActivatedSourceLSE or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC)) or (config.flags.MCO1Config and MCO1SOURCE_LSE) or (LPTIM1CLKSOURCE_LSE and config.flags.LPTIM1Used_ForRCC) or (CECCLKSOURCE_LSE and config.flags.CECUsed_ForRCC) or (LPTIM45CLKSOURCE_LSE and (config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (LPUART1CLKSOURCE_LSE and config.flags.LPUARTUsed_ForRCC) or (USART1CLKSOURCE_LSE and config.flags.USART1Used_ForRCC) or (USART2CLKSOURCE_LSE and (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC)) or (LPTIM23CLKSOURCE_LSE and (config.flags.LPTIM2Used_ForRCC or config.flags.LPTIM3Used_ForRCC))) {
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
                } else if (config.flags.CRSActivatedSourceUSB and (config.flags.USB_OTG_FS_Used)) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB_OTG_FS;
                } else if (config.flags.CRSActivatedSourceUSB and (config.flags.USB_OTG_HS_Used)) {
                    break :blk .RCC_CRS_SYNC_SOURCE_USB_OTG_HS;
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

            const PLL1PUsedValue: u1 = blk: {
                if ((SYSCLKSOURCE_PLLCLK) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLL1P, .@"=")) and config.flags.MCO2Config)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1QUsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLL1Q, .@"=")) and (config.flags.MCO1Config)) or (SPI1CLKSOURCE_PLLQ1 and (config.flags.I2S1Used_ForRCC or config.flags.SPI1Used_ForRCC)) or (SPI23CLKSOURCE_PLLQ1 and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLQ1 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC)) or (SAI2CLKSOURCE_PLLQ1 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC)) or (SPDIFCLKSOURCE_PLL1Q and (config.flags.SPDIFRXUsed_ForRCC or ((config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC) and SAI2CLKSOURCE_SPDIF))) or (FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (FDCANCLKSOURCE_PLL1Q and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1UsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2PUsedValue: u1 = blk: {
                if (((MCO2SOURCE_PLL2PCLK) and (config.flags.MCO2Config)) or (SPI1CLKSOURCE_PLLP2 and (config.flags.I2S1Used_ForRCC or config.flags.SPI1Used_ForRCC)) or (SPI23CLKSOURCE_PLLP2 and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP2 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC)) or (SAI2CLKSOURCE_PLLP2 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC)) or (LPTIM1CLKSOURCE_PLLP2 and config.flags.LPTIM1Used_ForRCC) or (LPTIM23CLKSOURCE_PLLP2 and (config.flags.LPTIM2Used_ForRCC or config.flags.LPTIM3Used_ForRCC)) or (LPTIM45CLKSOURCE_PLLP2 and (config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (ADCCLKSOURCE_PLL2P and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC))) or (FDCANCLKSOURCE_PLL2P and (config.flags.FDCAN1Used_ForRCC or config.flags.FDCAN2Used_ForRCC)) or (ADFCLKSOURCE_PLL2P and config.flags.ADF1_Used)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2QUsedValue: u1 = blk: {
                if ((USART1CLKSOURCE_PLLQ2 and config.flags.USART1Used_ForRCC) or (USART2CLKSOURCE_PLLQ2 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL2Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ2 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ2 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2RUsedValue: u1 = blk: {
                if ((SPDIFCLKSOURCE_PLL2R and (config.flags.SPDIFRXUsed_ForRCC or ((config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC) and SAI2CLKSOURCE_SPDIF))) or (FMCCLKSOURCE_PLL2R and config.flags.FMCUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2SUsedValue: u1 = blk: {
                if ((OSPI1CLKSOURCE_PLL2S and config.flags.XSPI1_Used) or (OSPI2CLKSOURCE_PLL2S and config.flags.XSPI2_Used) or (SDMMC1CLKSOURCE_PLL2S and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2TUsedValue: u1 = blk: {
                if ((OSPI1CLKSOURCE_PLL2T and config.flags.XSPI1_Used) or (OSPI2CLKSOURCE_PLL2T and config.flags.XSPI2_Used) or (SDMMC1CLKSOURCE_PLL2T and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2UsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL2SUsedValue), PLL2SUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL2TUsedValue), PLL2TUsedValue, 1, .@"=")))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3PUsedValue: u1 = blk: {
                if ((SPI1CLKSOURCE_PLLP3 and (config.flags.I2S1Used_ForRCC or config.flags.SPI1Used_ForRCC)) or (SPI23CLKSOURCE_PLLP3 and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (SAI1CLKSOURCE_PLLP3 and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC)) or (SAI2CLKSOURCE_PLLP3 and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC)) or (ADFCLKSOURCE_PLL2P and config.flags.ADF1_Used)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3QUsedValue: u1 = blk: {
                if ((FMCCLKSOURCE_PLL1Q and config.flags.FMCUsed_ForRCC) or (USART1CLKSOURCE_PLLQ3 and config.flags.USART1Used_ForRCC) or (USART2CLKSOURCE_PLLQ3 and (config.flags.USART3Used_ForRCC or config.flags.USART2Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC or config.flags.UART5Used_ForRCC)) or (LPUART1CLKSOURCE_PLL3Q and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_PLLQ3 and config.flags.SPI6Used_ForRCC) or (SPI45CLKSOURCE_PLLQ3 and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (USBPHYCLKSOURCE_PLL3Q and config.flags.USB_OTG_HS_Used) or (config.flags.USB_OTG_FS_Used and (USBOCLKSOURCE_PLL3Q or (USBOCLKSOURCE_PHY and USBPHYCLKSOURCE_PLL3Q)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3RUsedValue: u1 = blk: {
                if ((config.flags.PSSI_Used and PSSICLKSOURCE_PLL3R) or config.flags.LTDCUsed_ForRCC or (I2C1CLKSOURCE_PLLR3 and (config.flags.I2C1_Used or config.flags.I3C1_Used)) or (I2C23CLKSOURCE_PLLR3 and (config.flags.I2C2_Used or config.flags.I2C3_Used)) or (SPDIFCLKSOURCE_PLL3R and (config.flags.SPDIFRXUsed_ForRCC or ((config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC) and SAI2CLKSOURCE_SPDIF))) or (LPTIM1CLKSOURCE_PLLR3 and config.flags.LPTIM1Used_ForRCC) or (LPTIM23CLKSOURCE_PLLR3 and (config.flags.LPTIM2Used_ForRCC or config.flags.LPTIM3Used_ForRCC)) or (LPTIM45CLKSOURCE_PLLR3 and (config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (ADCCLKSOURCE_PLL3R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3SUsedValue: u1 = blk: {
                if (ETHPHYCLKSOURCE_PLL3S and config.flags.ETH_Used and ETH1CLKSOURCE_ETHPHY and config.flags.ETHClockConfig) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3UsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL3RUsedValue), PLL3RUsedValue, 1, .@"=")) or (check_ref(@TypeOf(PLL3SUsedValue), PLL3SUsedValue, 1, .@"=")))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const cKPerUsedValue: u1 = blk: {
                if (((SAI1CLKSOURCE_PER and (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC)) or (LPTIM1CLKSOURCE_PER and config.flags.LPTIM1Used_ForRCC) or (SAI2CLKSOURCE_PER and (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC)) or (ADCCLKSOURCE_PER and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC))) or (LPTIM45CLKSOURCE_PER and (config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) or (SPI1CLKSOURCE_PER and (config.flags.I2S1Used_ForRCC or config.flags.SPI1Used_ForRCC)) or (SPI23CLKSOURCE_PER and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC)) or (LPTIM23CLKSOURCE_PER and (config.flags.LPTIM2Used_ForRCC or config.flags.LPTIM3Used_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((FMCCLKSOURCE_HSI and config.flags.FMCUsed_ForRCC) or (config.flags.MCO1Config and MCO1SOURCE_HSI) or (PLLSOURCE_HSI and ((check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=") or check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=") or check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) or (config.flags.MCO2Config and MCO2SOURCE_PLL2PCLK))) or (PERSOURCE_HSI and (check_ref(@TypeOf(cKPerUsedValue), cKPerUsedValue, 1, .@"="))) or (SYSCLKSOURCE_HSI) or (I2C23CLKSOURCE_HSI and (config.flags.I2C2_Used or config.flags.I2C3_Used)) or (I2C1CLKSOURCE_HSI and (config.flags.I2C1_Used or config.flags.I3C1_Used)) or (SPDIFCLKSOURCE_HSI and (config.flags.SPDIFRXUsed_ForRCC or ((config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC) and SAI2CLKSOURCE_SPDIF))) or (USART1CLKSOURCE_HSI and config.flags.USART1Used_ForRCC) or (USART2CLKSOURCE_HSI and (config.flags.USART2Used_ForRCC or config.flags.USART3Used_ForRCC or config.flags.UART4Used_ForRCC or config.flags.UART5Used_ForRCC or config.flags.UART7Used_ForRCC or config.flags.UART8Used_ForRCC)) or (LPUART1CLKSOURCE_HSI and config.flags.LPUARTUsed_ForRCC) or (SPI6CLKSOURCE_HSI and (config.flags.SPI6Used_ForRCC or config.flags.I2S6Used_ForRCC)) or (SPI45CLKSOURCE_HSI and (config.flags.SPI4Used_ForRCC or config.flags.SPI5Used_ForRCC)) or (ADFCLKSOURCE_HSI and config.flags.ADF1_Used)) {
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

            const DigExtClockEnableValue: DigExtClockEnableList = blk: {
                if (config.flags.DigitalClockConfig) {
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

            const cKPerEnableValue: cKPerEnableList = blk: {
                if (((config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC)) or (config.flags.LPTIM1Used_ForRCC) or ((config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC)) or (config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC) or (config.flags.SPI1Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC or config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) or (config.flags.LPTIM2Used_ForRCC or config.flags.LPTIM3Used_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if (config.flags.SAI1_SAIAUsed_ForRCC or config.flags.SAI1_SAIBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI2EnableValue: SAI2EnableList = blk: {
                if (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI1EnableValue: SPI1EnableList = blk: {
                if (config.flags.I2S1Used_ForRCC or config.flags.SPI1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPDIFEnableValue: SPDIFEnableList = blk: {
                if (config.flags.SPDIFRXUsed_ForRCC or (config.flags.SAI2_SAIAUsed_ForRCC or config.flags.SAI2_SAIBUsed_ForRCC)) {
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

            const SPI23EnableValue: SPI23EnableList = blk: {
                if (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC or config.flags.SPI2Used_ForRCC or config.flags.SPI3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADF1EnableValue: ADF1EnableList = blk: {
                if (config.flags.ADF1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM45EnableValue: LPTIM45EnableList = blk: {
                if ((config.flags.LPTIM4Used_ForRCC or config.flags.LPTIM5Used_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM23EnableValue: LPTIM23EnableList = blk: {
                if (config.flags.LPTIM2Used_ForRCC or config.flags.LPTIM3Used_ForRCC) {
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
                if ((config.flags.SPI6Used_ForRCC or config.flags.I2S6Used_ForRCC)) {
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

            const USART1EnableValue: USART1EnableList = blk: {
                if (config.flags.USART1Used_ForRCC) {
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

            const SDMMC1EnableValue: SDMMC1EnableList = blk: {
                if (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const OCSPI1EnableValue: OCSPI1EnableList = blk: {
                if (config.flags.XSPI1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const OCSPI2EnableValue: OCSPI2EnableList = blk: {
                if (config.flags.XSPI2_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableUSBOFSValue: EnableUSBOFSList = blk: {
                if ((config.flags.USB_OTG_FS_Used)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableUSBOHSValue: EnableUSBOHSList = blk: {
                if ((config.flags.USB_OTG_HS_Used)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C23EnableValue: I2C23EnableList = blk: {
                if ((config.flags.I2C2_Used or config.flags.I2C3_Used)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C1EnableValue: I2C1EnableList = blk: {
                if (config.flags.I2C1_Used or config.flags.I3C1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const PSSIEnableValue: PSSIEnableList = blk: {
                if (config.flags.PSSI_Used) {
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

            const ETH1EnableDivValue: ETH1EnableDivList = blk: {
                if (config.flags.ETH_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC) and (config.flags.HSEOscillator or config.flags.HSEByPass or config.flags.HSEDIGByPass)) {
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

            const UCPDEnableValue: UCPDEnableList = blk: {
                if (config.flags.UCPD1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSEUSBPHYDevisorValue: EnableHSEUSBPHYDevisorList = blk: {
                if ((config.flags.USB_OTG_FS_Used or config.flags.USB_OTG_HS_Used) and (config.flags.HSEOscillator or config.flags.HSEByPass or config.flags.HSEDIGByPass)) {
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

            const DTSEnableValue: DTSEnableList = blk: {
                if (config.flags.DTS_Used and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ETHClockEnableValue: ETHClockEnableList = blk: {
                if (config.flags.ETHClockConfig and config.flags.ETH_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ETH1EnableValue: ETH1EnableList = blk: {
                if (config.flags.ETH_Used) {
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

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEOscillator or config.flags.HSEByPass or config.flags.HSEDIGByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if ((config.flags.RTCUsed_ForRCC) and (config.flags.LSEOscillator or config.flags.LSEByPass or config.flags.LSEDIGByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSEValue: EnableLSEList = blk: {
                if ((config.flags.LSEOscillator or config.flags.LSEByPass or config.flags.LSEDIGByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if ((((check_ref(@TypeOf(PLLSourceValue), PLLSourceValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass or config.flags.HSEDIGByPass)) {
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
                if ((USBOCLKSOURCE_RC48 and config.flags.USB_OTG_FS_Used) or (MCO1SOURCE_RC48 and config.flags.MCO1Config) or (config.flags.RNGUsed_ForRCC) or config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB) {
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
            RC48.value = HSI48_VALUEValue;

            // ======= NODE I2S_CKIN ======
            I2S_CKIN.nodetype = .source;
            I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;

            // ======= NODE Dig_CKIN ======
            Dig_CKIN.nodetype = .source;
            Dig_CKIN.value = DIGITAL_CLOCK_VALUEValue;

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
                .RCC_MCO1SOURCE_HSI => &.{&HSIDiv},
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO1SOURCE_HSI48 => &.{&RC48},
                .RCC_MCO1SOURCE_PLL1Q => &.{&DIVQ1},
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
                .RCC_MCO2SOURCE_PLL2P => &.{&DIVP2},
                .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO2SOURCE_PLL1P => &.{&DIVP1},
                .RCC_MCO2SOURCE_CSI => &.{&CSIRC},
                .RCC_MCO2SOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE MCO2Div ======
            MCO2Div.nodetype = .div;
            MCO2Div.value = try RCC_MCODiv2Value.get();
            MCO2Div.parents = &.{&MCO2Mult};

            // ======= NODE MCO2Pin ======
            MCO2Pin.nodetype = .output;
            MCO2Pin.parents = &.{&MCO2Div};

            // ======= NODE CPRE ======
            CPRE.nodetype = .div;
            CPRE.value = try CPREValue.get();
            CPRE.parents = &.{&SysCLKOutput};

            // ======= NODE CPREOutput ======
            CPREOutput.nodetype = .output;
            CPREOutput.parents = &.{&CPRE};

            // ======= NODE TPIUPrescaler ======
            TPIUPrescaler.nodetype = .div;
            TPIUPrescaler.value = try TPIUValue.get();
            TPIUPrescaler.parents = &.{&CPREOutput};

            // ======= NODE TPIUOutput ======
            TPIUOutput.nodetype = .output;
            TPIUOutput.parents = &.{&TPIUPrescaler};

            // ======= NODE CpuClockOutput ======
            CpuClockOutput.nodetype = .output;
            CpuClockOutput.parents = &.{&CPREOutput};

            // ======= NODE CortexPrescaler ======
            CortexPrescaler.nodetype = .div;
            CortexPrescaler.value = try Cortex_DivValue.get();
            CortexPrescaler.parents = &.{&CPREOutput};

            // ======= NODE CortexSysOutput ======
            CortexSysOutput.nodetype = .output;
            CortexSysOutput.parents = &.{&CortexPrescaler};

            // ======= NODE BMPRE ======
            BMPRE.nodetype = .div;
            BMPRE.value = try BMPREValue.get();
            BMPRE.parents = &.{&CPREOutput};

            // ======= NODE AHBOutput ======
            AHBOutput.nodetype = .output;
            AHBOutput.parents = &.{&BMPRE};

            // ======= NODE AXIClockOutput ======
            AXIClockOutput.nodetype = .output;
            AXIClockOutput.parents = &.{&AHBOutput};

            // ======= NODE AHB5Output ======
            AHB5Output.nodetype = .output;
            AHB5Output.parents = &.{&AHBOutput};

            // ======= NODE PPRE5 ======
            PPRE5.nodetype = .div;
            PPRE5.value = try PPRE5Value.get();
            PPRE5.parents = &.{&AHBOutput};

            // ======= NODE APB5Output ======
            APB5Output.nodetype = .output;
            APB5Output.parents = &.{&PPRE5};

            // ======= NODE AHB1234Output ======
            AHB1234Output.nodetype = .output;
            AHB1234Output.parents = &.{&AHBOutput};

            // ======= NODE PPRE1 ======
            PPRE1.nodetype = .div;
            PPRE1.value = try PPRE1Value.get();
            PPRE1.parents = &.{&AHBOutput};

            // ======= NODE APB1Output ======
            APB1Output.nodetype = .output;
            APB1Output.parents = &.{&PPRE1};

            // ======= NODE Tim1Mul ======
            Tim1Mul.nodetype = .mul;
            Tim1Mul.value = @floatFromInt(Tim1MulValue);
            Tim1Mul.parents = &.{&PPRE1};

            // ======= NODE Tim1Output ======
            Tim1Output.nodetype = .output;
            Tim1Output.parents = &.{&Tim1Mul};

            // ======= NODE PPRE2 ======
            PPRE2.nodetype = .div;
            PPRE2.value = try PPRE2Value.get();
            PPRE2.parents = &.{&AHBOutput};

            // ======= NODE APB2Output ======
            APB2Output.nodetype = .output;
            APB2Output.parents = &.{&PPRE2};

            // ======= NODE Tim2Mul ======
            Tim2Mul.nodetype = .mul;
            Tim2Mul.value = @floatFromInt(Tim2MulValue);
            Tim2Mul.parents = &.{&PPRE2};

            // ======= NODE Tim2Output ======
            Tim2Output.nodetype = .output;
            Tim2Output.parents = &.{&Tim2Mul};

            // ======= NODE PPRE4 ======
            PPRE4.nodetype = .div;
            PPRE4.value = try PPRE4Value.get();
            PPRE4.parents = &.{&AHBOutput};

            // ======= NODE APB4Output ======
            APB4Output.nodetype = .output;
            APB4Output.parents = &.{&PPRE4};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceValue) {
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

            // ======= NODE DIVS1 ======
            DIVS1.nodetype = .div;
            DIVS1.value = @floatFromInt(DIVS1Value);
            DIVS1.parents = &.{&DIVN1};

            // ======= NODE DIVS1output ======
            DIVS1output.nodetype = .output;
            DIVS1output.parents = &.{&DIVS1};

            // ======= NODE DIVT1 ======
            DIVT1.nodetype = .div;
            DIVT1.value = @floatFromInt(DIVT1Value);
            DIVT1.parents = &.{&DIVN1};

            // ======= NODE DIVT1output ======
            DIVT1output.nodetype = .output;
            DIVT1output.parents = &.{&DIVT1};

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

            // ======= NODE DIVS2 ======
            DIVS2.nodetype = .div;
            DIVS2.value = @floatFromInt(DIVS2Value);
            DIVS2.parents = &.{&DIVN2};

            // ======= NODE DIVS2output ======
            DIVS2output.nodetype = .output;
            DIVS2output.parents = &.{&DIVS2};

            // ======= NODE DIVT2 ======
            DIVT2.nodetype = .div;
            DIVT2.value = @floatFromInt(DIVT2Value);
            DIVT2.parents = &.{&DIVN2};

            // ======= NODE DIVT2output ======
            DIVT2output.nodetype = .output;
            DIVT2output.parents = &.{&DIVT2};

            // ======= NODE DIVN3 ======
            DIVN3.nodetype = .mulfrac;
            DIVN3.value = @floatFromInt(DIVN3Value);
            DIVN3.parents = &.{ &DIVM3, &PLL3FRACN };

            // ======= NODE PLL3FRACN ======
            PLL3FRACN.nodetype = .source;
            PLL3FRACN.value = @floatFromInt(PLL3FRACNValue);

            // ======= NODE DIVP3 ======
            DIVP3.nodetype = .div;
            DIVP3.value = @floatFromInt(DIVP3Value);
            DIVP3.parents = &.{&DIVN3};

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

            // ======= NODE DIVR3output ======
            DIVR3output.nodetype = .output;
            DIVR3output.parents = &.{&DIVR3};

            // ======= NODE DIVS3 ======
            DIVS3.nodetype = .div;
            DIVS3.value = @floatFromInt(DIVS3Value);
            DIVS3.parents = &.{&DIVN3};

            // ======= NODE DIVS3output ======
            DIVS3output.nodetype = .output;
            DIVS3output.parents = &.{&DIVS3};

            // ======= NODE DIVT3 ======
            DIVT3.nodetype = .div;
            DIVT3.value = @floatFromInt(DIVT3Value);
            DIVT3.parents = &.{&DIVN3};

            // ======= NODE DIVT3output ======
            DIVT3output.nodetype = .output;
            DIVT3output.parents = &.{&DIVT3};

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

            // ======= NODE UCPDoutput ======
            UCPDoutput.nodetype = .output;
            UCPDoutput.parents = &.{&HSI_DIV};

            // ======= NODE HSI_DIV ======
            HSI_DIV.nodetype = .div;
            HSI_DIV.value = try HSIDivToUCPDValue.get();
            HSI_DIV.parents = &.{&HSIRC};

            // ======= NODE SPI1Mult ======
            SPI1Mult.nodetype = .multi;
            SPI1Mult.parents = switch (SPI1CLockSelectionValue) {
                .RCC_SPI1CLKSOURCE_PLL1Q => &.{&DIVQ1},
                .RCC_SPI1CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_SPI1CLKSOURCE_PLL3P => &.{&DIVP3},
                .RCC_SPI1CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SPI1CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE SPI1output ======
            SPI1output.nodetype = .output;
            SPI1output.parents = &.{&SPI1Mult};

            // ======= NODE SPI23Mult ======
            SPI23Mult.nodetype = .multi;
            SPI23Mult.parents = switch (SPI23CLockSelectionValue) {
                .RCC_SPI23CLKSOURCE_PLL1Q => &.{&DIVQ1},
                .RCC_SPI23CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_SPI23CLKSOURCE_PLL3P => &.{&DIVP3},
                .RCC_SPI23CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SPI23CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE SPI23output ======
            SPI23output.nodetype = .output;
            SPI23output.parents = &.{&SPI23Mult};

            // ======= NODE SAI1Mult ======
            SAI1Mult.nodetype = .multi;
            SAI1Mult.parents = switch (SAI1CLockSelectionValue) {
                .RCC_SAI1CLKSOURCE_PLL1Q => &.{&DIVQ1},
                .RCC_SAI1CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_SAI1CLKSOURCE_PLL3P => &.{&DIVP3},
                .RCC_SAI1CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SAI1CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE SAI1output ======
            SAI1output.nodetype = .output;
            SAI1output.parents = &.{&SAI1Mult};

            // ======= NODE SAI2Mult ======
            SAI2Mult.nodetype = .multi;
            SAI2Mult.parents = switch (SAI2CLockSelectionValue) {
                .RCC_SAI2CLKSOURCE_PLL1Q => &.{&DIVQ1},
                .RCC_SAI2CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_SAI2CLKSOURCE_PLL3P => &.{&DIVP3},
                .RCC_SAI2CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_SAI2CLKSOURCE_CLKP => &.{&CKPERSource},
                .RCC_SAI2CLKSOURCE_SPDIF => &.{&SPDIFMult},
            };

            // ======= NODE SAI2output ======
            SAI2output.nodetype = .output;
            SAI2output.parents = &.{&SAI2Mult};

            // ======= NODE I2C1Mult ======
            I2C1Mult.nodetype = .multi;
            I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                .RCC_I2C1_I3C1CLKSOURCE_PCLK1 => &.{&PPRE1},
                .RCC_I2C1_I3C1CLKSOURCE_PLL3R => &.{&DIVR3},
                .RCC_I2C1_I3C1CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_I2C1_I3C1CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE I2C1output ======
            I2C1output.nodetype = .output;
            I2C1output.parents = &.{&I2C1Mult};

            // ======= NODE I2C23Mult ======
            I2C23Mult.nodetype = .multi;
            I2C23Mult.parents = switch (I2C23CLockSelectionValue) {
                .RCC_I2C23CLKSOURCE_PCLK1 => &.{&PPRE1},
                .RCC_I2C23CLKSOURCE_PLL3R => &.{&DIVR3},
                .RCC_I2C23CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_I2C23CLKSOURCE_CSI => &.{&CSIRC},
            };

            // ======= NODE I2C23output ======
            I2C23output.nodetype = .output;
            I2C23output.parents = &.{&I2C23Mult};

            // ======= NODE SPDIFMult ======
            SPDIFMult.nodetype = .multi;
            SPDIFMult.parents = switch (SPDIFCLockSelectionValue) {
                .RCC_SPDIFRXCLKSOURCE_PLL1Q => &.{&DIVQ1},
                .RCC_SPDIFRXCLKSOURCE_PLL2R => &.{&DIVR2},
                .RCC_SPDIFRXCLKSOURCE_PLL3R => &.{&DIVR3},
                .RCC_SPDIFRXCLKSOURCE_HSI => &.{&HSIDiv},
            };

            // ======= NODE SPDIFoutput ======
            SPDIFoutput.nodetype = .output;
            SPDIFoutput.parents = &.{&SPDIFMult};

            // ======= NODE LTDCOutput ======
            LTDCOutput.nodetype = .output;
            LTDCOutput.parents = &.{&DIVR3};

            // ======= NODE FMCMult ======
            FMCMult.nodetype = .multi;
            FMCMult.parents = switch (FmcClockSelectionValue) {
                .RCC_FMCCLKSOURCE_HCLK => &.{&AHB5Output},
                .RCC_FMCCLKSOURCE_PLL1Q => &.{&DIVQ1},
                .RCC_FMCCLKSOURCE_PLL2R => &.{&DIVR2},
                .RCC_FMCCLKSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE FMCoutput ======
            FMCoutput.nodetype = .output;
            FMCoutput.parents = &.{&FMCMult};

            // ======= NODE SDMMCMult ======
            SDMMCMult.nodetype = .multi;
            SDMMCMult.parents = switch (SDMMC1CLockSelectionValue) {
                .RCC_SDMMC12CLKSOURCE_PLL2S => &.{&DIVS2},
                .RCC_SDMMC12CLKSOURCE_PLL2T => &.{&DIVT2},
            };

            // ======= NODE SDMMCoutput ======
            SDMMCoutput.nodetype = .output;
            SDMMCoutput.parents = &.{&SDMMCMult};

            // ======= NODE USART1Mult ======
            USART1Mult.nodetype = .multi;
            USART1Mult.parents = switch (USART1CLockSelectionValue) {
                .RCC_USART1CLKSOURCE_PCLK2 => &.{&PPRE2},
                .RCC_USART1CLKSOURCE_PLL2Q => &.{&DIVQ2},
                .RCC_USART1CLKSOURCE_PLL3Q => &.{&DIVQ3},
                .RCC_USART1CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_USART1CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART1output ======
            USART1output.nodetype = .output;
            USART1output.parents = &.{&USART1Mult};

            // ======= NODE ADFMult ======
            ADFMult.nodetype = .multi;
            ADFMult.parents = switch (Adf1ClockSelectionValue) {
                .RCC_ADF1CLKSOURCE_HCLK => &.{&AHBOutput},
                .RCC_ADF1CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_ADF1CLKSOURCE_PLL3P => &.{&DIVP3},
                .RCC_ADF1CLKSOURCE_PIN => &.{&I2S_CKIN},
                .RCC_ADF1CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_ADF1CLKSOURCE_HSI => &.{&HSIDiv},
            };

            // ======= NODE ADFoutput ======
            ADFoutput.nodetype = .output;
            ADFoutput.parents = &.{&ADFMult};

            // ======= NODE USART234578Mult ======
            USART234578Mult.nodetype = .multi;
            USART234578Mult.parents = switch (USART234578CLockSelectionValue) {
                .RCC_USART234578CLKSOURCE_PCLK1 => &.{&PPRE1},
                .RCC_USART234578CLKSOURCE_PLL2Q => &.{&DIVQ2},
                .RCC_USART234578CLKSOURCE_PLL3Q => &.{&DIVQ3},
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
                .RCC_LPUART1CLKSOURCE_PCLK4 => &.{&PPRE4},
                .RCC_LPUART1CLKSOURCE_PLL2Q => &.{&DIVQ2},
                .RCC_LPUART1CLKSOURCE_PLL3Q => &.{&DIVQ3},
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
                .RCC_LPTIM1CLKSOURCE_PCLK1 => &.{&PPRE1},
                .RCC_LPTIM1CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_LPTIM1CLKSOURCE_PLL3R => &.{&DIVR3},
                .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM1CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE LPTIM1output ======
            LPTIM1output.nodetype = .output;
            LPTIM1output.parents = &.{&LPTIM1Mult};

            // ======= NODE LPTIM23Mult ======
            LPTIM23Mult.nodetype = .multi;
            LPTIM23Mult.parents = switch (LPTIM23CLockSelectionValue) {
                .RCC_LPTIM23CLKSOURCE_PCLK4 => &.{&PPRE4},
                .RCC_LPTIM23CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_LPTIM23CLKSOURCE_PLL3R => &.{&DIVR3},
                .RCC_LPTIM23CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM23CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM23CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE LPTIM23output ======
            LPTIM23output.nodetype = .output;
            LPTIM23output.parents = &.{&LPTIM23Mult};

            // ======= NODE LPTIM45Mult ======
            LPTIM45Mult.nodetype = .multi;
            LPTIM45Mult.parents = switch (LPTIM45CLockSelectionValue) {
                .RCC_LPTIM45CLKSOURCE_PCLK4 => &.{&PPRE4},
                .RCC_LPTIM45CLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_LPTIM45CLKSOURCE_PLL3R => &.{&DIVR3},
                .RCC_LPTIM45CLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_LPTIM45CLKSOURCE_LSI => &.{&LSIRC},
                .RCC_LPTIM45CLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE LPTIM45output ======
            LPTIM45output.nodetype = .output;
            LPTIM45output.parents = &.{&LPTIM45Mult};

            // ======= NODE SPI6Mult ======
            SPI6Mult.nodetype = .multi;
            SPI6Mult.parents = switch (SPI6CLockSelectionValue) {
                .RCC_SPI6CLKSOURCE_PCLK4 => &.{&PPRE4},
                .RCC_SPI6CLKSOURCE_PLL2Q => &.{&DIVQ2},
                .RCC_SPI6CLKSOURCE_PLL3Q => &.{&DIVQ3},
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
                .RCC_SPI45CLKSOURCE_PCLK2 => &.{&PPRE2},
                .RCC_SPI45CLKSOURCE_PLL2Q => &.{&DIVQ2},
                .RCC_SPI45CLKSOURCE_PLL3Q => &.{&DIVQ3},
                .RCC_SPI45CLKSOURCE_HSI => &.{&HSIDiv},
                .RCC_SPI45CLKSOURCE_CSI => &.{&CSIRC},
                .RCC_SPI45CLKSOURCE_HSE => &.{&HSEOSC},
            };

            // ======= NODE SPI45output ======
            SPI45output.nodetype = .output;
            SPI45output.parents = &.{&SPI45Mult};

            // ======= NODE HSEUSBPHYDevisor ======
            HSEUSBPHYDevisor.nodetype = .div;
            HSEUSBPHYDevisor.value = try RCC_USBPHY_Clock_Source_FROM_HSEValue.get();
            HSEUSBPHYDevisor.parents = &.{&HSEOSC};

            // ======= NODE USBPHYCLKMux ======
            USBPHYCLKMux.nodetype = .multi;
            USBPHYCLKMux.parents = switch (USBPHYCLKSourceValue) {
                .RCC_USBPHYCCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_USBPHYCCLKSOURCE_HSE_DIV2 => &.{&HSEUSBPHYDevisor},
                .RCC_USBPHYCCLKSOURCE_PLL3Q => &.{&DIVQ3},
            };

            // ======= NODE USBPHYCLKOutput ======
            USBPHYCLKOutput.nodetype = .output;
            USBPHYCLKOutput.parents = &.{&USBPHYCLKMux};

            // ======= NODE USBPHYRC ======
            USBPHYRC.nodetype = .source;
            USBPHYRC.value = USB_PHY_VALUEValue;

            // ======= NODE USBPHYRC60 ======
            USBPHYRC60.nodetype = .source;
            USBPHYRC60.value = USB_PHY_VALUE60Value;

            // ======= NODE USBOCLKMux ======
            USBOCLKMux.nodetype = .multi;
            USBOCLKMux.parents = switch (USBCLockSelectionValue) {
                .RCC_USBOTGFSCLKSOURCE_HSI48 => &.{&RC48},
                .RCC_USBOTGFSCLKSOURCE_PLL3Q => &.{&DIVQ3},
                .RCC_USBOTGFSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_USBOTGFSCLKSOURCE_CLK48 => &.{&USBPHYRC},
            };

            // ======= NODE USBOFSCLKOutput ======
            USBOFSCLKOutput.nodetype = .output;
            USBOFSCLKOutput.parents = &.{&USBOCLKMux};

            // ======= NODE RNGOutput ======
            RNGOutput.nodetype = .output;
            RNGOutput.parents = &.{&RC48};

            // ======= NODE DTSOutput ======
            DTSOutput.nodetype = .output;
            DTSOutput.parents = &.{&LSEOSC};

            // ======= NODE FDCANMult ======
            FDCANMult.nodetype = .multi;
            FDCANMult.parents = switch (FDCANCLockSelectionValue) {
                .RCC_FDCANCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_FDCANCLKSOURCE_PLL1Q => &.{&DIVQ1},
                .RCC_FDCANCLKSOURCE_PLL2P => &.{&DIVP2},
            };

            // ======= NODE FDCANoutput ======
            FDCANoutput.nodetype = .output;
            FDCANoutput.parents = &.{&FDCANMult};

            // ======= NODE XSPI1Mult ======
            XSPI1Mult.nodetype = .multi;
            XSPI1Mult.parents = switch (Xspi1ClockSelectionValue) {
                .RCC_XSPI1CLKSOURCE_HCLK => &.{&AHB5Output},
                .RCC_XSPI1CLKSOURCE_PLL2S => &.{&DIVS2},
                .RCC_XSPI1CLKSOURCE_PLL2T => &.{&DIVT2},
            };

            // ======= NODE XSPI1output ======
            XSPI1output.nodetype = .output;
            XSPI1output.parents = &.{&XSPI1Mult};

            // ======= NODE PSSIMult ======
            PSSIMult.nodetype = .multi;
            PSSIMult.parents = switch (PSSICLockSelectionValue) {
                .RCC_PSSICLKSOURCE_PLL3R => &.{&DIVR3},
                .RCC_PSSICLKSOURCE_CLKP => &.{&CKPERSource},
            };

            // ======= NODE PSSIoutput ======
            PSSIoutput.nodetype = .output;
            PSSIoutput.parents = &.{&PSSIMult};

            // ======= NODE XSPI2Mult ======
            XSPI2Mult.nodetype = .multi;
            XSPI2Mult.parents = switch (Xspi2ClockSelectionValue) {
                .RCC_XSPI2CLKSOURCE_HCLK => &.{&AHB5Output},
                .RCC_XSPI2CLKSOURCE_PLL2S => &.{&DIVS2},
                .RCC_XSPI2CLKSOURCE_PLL2T => &.{&DIVT2},
            };

            // ======= NODE XSPI2output ======
            XSPI2output.nodetype = .output;
            XSPI2output.parents = &.{&XSPI2Mult};

            // ======= NODE ETHPHYMult ======
            ETHPHYMult.nodetype = .multi;
            ETHPHYMult.parents = switch (ETHPHYCLockSelectionValue) {
                .RCC_ETH1PHYCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_ETH1PHYCLKSOURCE_PLL3S => &.{&DIVS3},
            };

            // ======= NODE ETHPHYoutput ======
            ETHPHYoutput.nodetype = .output;
            ETHPHYoutput.parents = &.{&ETHPHYMult};

            // ======= NODE ETH1Mult ======
            ETH1Mult.nodetype = .multi;
            ETH1Mult.parents = switch (ETH1CLockSelectionValue) {
                .RCC_ETH1REFCLKSOURCE_PHY => &.{&Dig_CKIN},
                .RCC_ETH1REFCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_ETH1REFCLKSOURCE_ETH => &.{&ETHPHYMult},
            };

            // ======= NODE ETH1output ======
            ETH1output.nodetype = .output;
            ETH1output.parents = &.{&ETH1Mult};

            // ======= NODE ADCMult ======
            ADCMult.nodetype = .multi;
            ADCMult.parents = switch (ADCCLockSelectionValue) {
                .RCC_ADCCLKSOURCE_PLL2P => &.{&DIVP2},
                .RCC_ADCCLKSOURCE_PLL3R => &.{&DIVR3},
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
                .RCC_CECCLKSOURCE_CSI => &.{&CSICECDevisor},
            };

            // ======= NODE CECoutput ======
            CECoutput.nodetype = .output;
            CECoutput.parents = &.{&CECMult};

            // ======= NODE CSICECDevisor ======
            CSICECDevisor.nodetype = .div;
            CSICECDevisor.value = try CSI_DIVValue.get();
            CSICECDevisor.parents = &.{&CSIRC};

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
                .max = 6e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCO1Pin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= MCO2PinFreq_Value ========
            const MCO2PinFreq_ValueValue = MCO2Pin.get_as_ref();
            ignore_value(MCO2PinFreq_ValueValue);

            //======= CPREFreq_Value ========
            const CPREFreq_ValueValue = CPREOutput.get_as_ref();
            ignore_value(CPREFreq_ValueValue);

            CPREOutput.limit = .{
                .min = null,
                .max = 6e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= TPIUFreq_Value ========
            const TPIUFreq_ValueValue = TPIUOutput.get_as_ref();
            ignore_value(TPIUFreq_ValueValue);

            //======= CpuClockFreq_Value ========
            const CpuClockFreq_ValueValue = CpuClockOutput.get_as_ref();
            ignore_value(CpuClockFreq_ValueValue);

            CpuClockOutput.limit = .{
                .min = null,
                .max = 6e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            CortexSysOutput.limit = .{
                .min = null,
                .max = 6e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 3e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AXIClockFreq_Value ========
            const AXIClockFreq_ValueValue = AXIClockOutput.get_as_ref();
            ignore_value(AXIClockFreq_ValueValue);

            AXIClockOutput.limit = .{
                .min = null,
                .max = 3e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AHB5ClockFreq_Value ========
            const AHB5ClockFreq_ValueValue = AHB5Output.get_as_ref();
            ignore_value(AHB5ClockFreq_ValueValue);

            AHB5Output.limit = .{
                .min = null,
                .max = 3e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB5Freq_Value ========
            const APB5Freq_ValueValue = APB5Output.get_as_ref();
            ignore_value(APB5Freq_ValueValue);

            APB5Output.limit = .{
                .min = null,
                .max = 1.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AHB1234Freq_Value ========
            const AHB1234Freq_ValueValue = AHB1234Output.get_as_ref();
            ignore_value(AHB1234Freq_ValueValue);

            AHB1234Output.limit = .{
                .min = null,
                .max = 3e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);

            APB1Output.limit = .{
                .min = null,
                .max = 1.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= Tim1OutputFreq_Value ========
            const Tim1OutputFreq_ValueValue = Tim1Output.get_as_ref();
            ignore_value(Tim1OutputFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 1.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= Tim2OutputFreq_Value ========
            const Tim2OutputFreq_ValueValue = Tim2Output.get_as_ref();
            ignore_value(Tim2OutputFreq_ValueValue);

            //======= APB4Freq_Value ========
            const APB4Freq_ValueValue = APB4Output.get_as_ref();
            ignore_value(APB4Freq_ValueValue);

            APB4Output.limit = .{
                .min = null,
                .max = 1.5e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= CKPERFreq_Value ========
            const CKPERFreq_ValueValue = CKPERoutput.get_as_ref();
            ignore_value(CKPERFreq_ValueValue);

            //======= DIVQ1Freq_Value ========
            const DIVQ1Freq_ValueValue = DIVQ1output.get_as_ref();
            ignore_value(DIVQ1Freq_ValueValue);
            if (check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                DIVQ1output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL1QUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVR1Freq_Value ========
            const DIVR1Freq_ValueValue = DIVR1output.get_as_ref();
            ignore_value(DIVR1Freq_ValueValue);

            //======= DIVS1Freq_Value ========
            const DIVS1Freq_ValueValue = DIVS1output.get_as_ref();
            ignore_value(DIVS1Freq_ValueValue);

            //======= DIVT1Freq_Value ========
            const DIVT1Freq_ValueValue = DIVT1output.get_as_ref();
            ignore_value(DIVT1Freq_ValueValue);

            //======= DIVP2Freq_Value ========
            const DIVP2Freq_ValueValue = DIVP2output.get_as_ref();
            ignore_value(DIVP2Freq_ValueValue);
            if (check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                DIVP2output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL2PUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVQ2Freq_Value ========
            const DIVQ2Freq_ValueValue = DIVQ2output.get_as_ref();
            ignore_value(DIVQ2Freq_ValueValue);
            if (check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                DIVQ2output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL2QUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVR2Freq_Value ========
            const DIVR2Freq_ValueValue = DIVR2output.get_as_ref();
            ignore_value(DIVR2Freq_ValueValue);
            if (check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                DIVR2output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL2RUsed",
                    .main_dialog = "",
                };
            }

            //======= DIVS2Freq_Value ========
            const DIVS2Freq_ValueValue = DIVS2output.get_as_ref();
            ignore_value(DIVS2Freq_ValueValue);
            if (check_ref(@TypeOf(PLL2SUsedValue), PLL2SUsedValue, 1, .@"=")) {
                DIVS2output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL2SUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVT2Freq_Value ========
            const DIVT2Freq_ValueValue = DIVT2output.get_as_ref();
            ignore_value(DIVT2Freq_ValueValue);
            if (check_ref(@TypeOf(PLL2TUsedValue), PLL2TUsedValue, 1, .@"=")) {
                DIVT2output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL2TUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVP3Freq_Value ========
            const DIVP3Freq_ValueValue = DIVP3output.get_as_ref();
            ignore_value(DIVP3Freq_ValueValue);
            if (check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                DIVP3output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL3PUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVQ3Freq_Value ========
            const DIVQ3Freq_ValueValue = DIVQ3output.get_as_ref();
            ignore_value(DIVQ3Freq_ValueValue);
            if (check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                DIVQ3output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL3QUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVR3Freq_Value ========
            const DIVR3Freq_ValueValue = DIVR3output.get_as_ref();
            ignore_value(DIVR3Freq_ValueValue);
            if (check_ref(@TypeOf(PLL3RUsedValue), PLL3RUsedValue, 1, .@"=")) {
                DIVR3output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL3RUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVS3Freq_Value ========
            const DIVS3Freq_ValueValue = DIVS3output.get_as_ref();
            ignore_value(DIVS3Freq_ValueValue);
            if (check_ref(@TypeOf(PLL3SUsedValue), PLL3SUsedValue, 1, .@"=")) {
                DIVS3output.limit = .{
                    .min = null,
                    .max = 1.6e9,
                    .main_expr = "PLL3SUsed=1",
                    .main_dialog = "",
                };
            }

            //======= DIVT3Freq_Value ========
            const DIVT3Freq_ValueValue = DIVT3output.get_as_ref();
            ignore_value(DIVT3Freq_ValueValue);

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= UCPDFreq_Value ========
            const UCPDFreq_ValueValue = UCPDoutput.get_as_ref();
            ignore_value(UCPDFreq_ValueValue);

            //======= SPI1Freq_Value ========
            const SPI1Freq_ValueValue = SPI1output.get_as_ref();
            ignore_value(SPI1Freq_ValueValue);

            //======= SPI23Freq_Value ========
            const SPI23Freq_ValueValue = SPI23output.get_as_ref();
            ignore_value(SPI23Freq_ValueValue);

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);

            //======= SAI2Freq_Value ========
            const SAI2Freq_ValueValue = SAI2output.get_as_ref();
            ignore_value(SAI2Freq_ValueValue);

            //======= I2CI3C1Freq_Value ========
            const I2CI3C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2CI3C1Freq_ValueValue);

            //======= I2C23Freq_Value ========
            const I2C23Freq_ValueValue = I2C23output.get_as_ref();
            ignore_value(I2C23Freq_ValueValue);

            //======= SPDIFRXFreq_Value ========
            const SPDIFRXFreq_ValueValue = SPDIFoutput.get_as_ref();
            ignore_value(SPDIFRXFreq_ValueValue);

            //======= LTDCFreq_Value ========
            const LTDCFreq_ValueValue = LTDCOutput.get_as_ref();
            ignore_value(LTDCFreq_ValueValue);

            //======= FMCFreq_Value ========
            const FMCFreq_ValueValue = FMCoutput.get_as_ref();
            ignore_value(FMCFreq_ValueValue);

            //======= SDMMCFreq_Value ========
            const SDMMCFreq_ValueValue = SDMMCoutput.get_as_ref();
            ignore_value(SDMMCFreq_ValueValue);

            SDMMCoutput.limit = .{
                .min = null,
                .max = 2e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= ADFFreq_Value ========
            const ADFFreq_ValueValue = ADFoutput.get_as_ref();
            ignore_value(ADFFreq_ValueValue);

            //======= USART234578Freq_Value ========
            const USART234578Freq_ValueValue = USART234578output.get_as_ref();
            ignore_value(USART234578Freq_ValueValue);

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);

            //======= LPTIM23Freq_Value ========
            const LPTIM23Freq_ValueValue = LPTIM23output.get_as_ref();
            ignore_value(LPTIM23Freq_ValueValue);

            //======= LPTIM45Freq_Value ========
            const LPTIM45Freq_ValueValue = LPTIM45output.get_as_ref();
            ignore_value(LPTIM45Freq_ValueValue);

            //======= SPI6Freq_Value ========
            const SPI6Freq_ValueValue = SPI6output.get_as_ref();
            ignore_value(SPI6Freq_ValueValue);

            //======= SPI45Freq_Value ========
            const SPI45Freq_ValueValue = SPI45output.get_as_ref();
            ignore_value(SPI45Freq_ValueValue);

            //======= USBPHYFreq_Value ========
            const USBPHYFreq_ValueValue = USBPHYCLKOutput.get_as_ref();
            ignore_value(USBPHYFreq_ValueValue);

            //======= USBOFSFreq_Value ========
            const USBOFSFreq_ValueValue = USBOFSCLKOutput.get_as_ref();
            ignore_value(USBOFSFreq_ValueValue);

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGOutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);

            RNGOutput.limit = .{
                .min = null,
                .max = 4.8e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= DTSFreq_Value ========
            const DTSFreq_ValueValue = DTSOutput.get_as_ref();
            ignore_value(DTSFreq_ValueValue);

            DTSOutput.limit = .{
                .min = null,
                .max = 9e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= FDCANFreq_Value ========
            const FDCANFreq_ValueValue = FDCANoutput.get_as_ref();
            ignore_value(FDCANFreq_ValueValue);

            //======= OSPI1Freq_Value ========
            const OSPI1Freq_ValueValue = XSPI1output.get_as_ref();
            ignore_value(OSPI1Freq_ValueValue);

            //======= PSSIFreq_Value ========
            const PSSIFreq_ValueValue = PSSIoutput.get_as_ref();
            ignore_value(PSSIFreq_ValueValue);

            //======= OSPI2Freq_Value ========
            const OSPI2Freq_ValueValue = XSPI2output.get_as_ref();
            ignore_value(OSPI2Freq_ValueValue);

            //======= ETHPHYFreq_Value ========
            const ETHPHYFreq_ValueValue = ETHPHYoutput.get_as_ref();
            ignore_value(ETHPHYFreq_ValueValue);

            ETHPHYoutput.limit = .{
                .min = 2.5e7,
                .max = 5e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= ETH1Freq_Value ========
            const ETH1Freq_ValueValue = ETH1output.get_as_ref();
            ignore_value(ETH1Freq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECoutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);

            //======= VCOInput1Freq_Value ========
            const VCOInput1Freq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInput1Freq_ValueValue);
            if (check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                VCOInput.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = "PLL1Used=1",
                    .main_dialog = "",
                };
            }

            //======= VCOInput2Freq_Value ========
            const VCOInput2Freq_ValueValue = VCO2Input.get_as_ref();
            ignore_value(VCOInput2Freq_ValueValue);
            if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                VCO2Input.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = "PLL2Used=1",
                    .main_dialog = "",
                };
            }

            //======= VCOInput3Freq_Value ========
            const VCOInput3Freq_ValueValue = VCO3Input.get_as_ref();
            ignore_value(VCOInput3Freq_ValueValue);
            if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                VCO3Input.limit = .{
                    .min = 1e6,
                    .max = 1.6e7,
                    .main_expr = "PLL3Used=1",
                    .main_dialog = "",
                };
            }

            const PLL1_VCI_RangeValue: PLL1_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE0;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE1;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE2;
                } else if (((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput1Freq_ValueValue), VCOInput1Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE3;
                } else if (check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE3;
                }
                break :blk .RCC_PLL_VCOINPUT_RANGE3;
            };

            const PLL1_VCO_SELValue: PLL1_VCO_SELList = blk: {
                if ((check_ref(@TypeOf(PLL1_VCI_RangeValue), PLL1_VCI_RangeValue, .RCC_PLL_VCOINPUT_RANGE0, .@"=")) and check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCO_LOW;
                } else if (check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCO_HIGH;
                }
                break :blk .RCC_PLL_VCO_HIGH;
            };

            //======= VCO1OutputFreq_Value ========
            const VCO1OutputFreq_ValueValue = VCO1Output.get_as_ref();
            ignore_value(VCO1OutputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) and (check_ref(@TypeOf(PLL1_VCO_SELValue), PLL1_VCO_SELValue, .RCC_PLL_VCO_HIGH, .@"="))) {
                VCO1Output.limit = .{
                    .min = 4e8,
                    .max = 1.6e9,
                    .main_expr = "(PLL1Used=1) & (PLL1_VCO_SEL=RCC_PLL_VCO_HIGH)",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(PLL1UsedValue), PLL1UsedValue, 1, .@"=")) {
                VCO1Output.limit = .{
                    .min = 1.5e8,
                    .max = 4.2e8,
                    .main_expr = "PLL1Used=1",
                    .main_dialog = "",
                };
            }

            //======= DIVP1Freq_Value ========
            const DIVP1Freq_ValueValue = PLL1CLK.get_as_ref();
            ignore_value(DIVP1Freq_ValueValue);
            if (check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) {
                PLL1CLK.limit = .{
                    .min = null,
                    .max = 8e8,
                    .main_expr = "PLL1PUsed=1",
                    .main_dialog = "",
                };
            }

            const PLL2_VCI_RangeValue: PLL2_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE0;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE1;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE2;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 1600000, .@"<")) and ((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE3;
                } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE3;
                }
                break :blk .RCC_PLL_VCOINPUT_RANGE3;
            };

            const PLL2_VCO_SELValue: PLL2_VCO_SELList = blk: {
                if ((check_ref(@TypeOf(PLL2_VCI_RangeValue), PLL2_VCI_RangeValue, .RCC_PLL_VCOINPUT_RANGE0, .@"=")) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCO_LOW;
                } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCO_HIGH;
                }
                break :blk .RCC_PLL_VCO_HIGH;
            };

            //======= VCO2OutputFreq_Value ========
            const VCO2OutputFreq_ValueValue = VCO2Output.get_as_ref();
            ignore_value(VCO2OutputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) and (check_ref(@TypeOf(PLL2_VCO_SELValue), PLL2_VCO_SELValue, .RCC_PLL_VCO_HIGH, .@"="))) {
                VCO2Output.limit = .{
                    .min = 4e8,
                    .max = 1.6e9,
                    .main_expr = "(PLL2Used=1) & (PLL2_VCO_SEL=RCC_PLL_VCO_HIGH)",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                VCO2Output.limit = .{
                    .min = 1.5e8,
                    .max = 4.2e8,
                    .main_expr = "PLL2Used=1",
                    .main_dialog = "",
                };
            }

            const PLL3_VCI_RangeValue: PLL3_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 1000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 1000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 2000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE0;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 2000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 2000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE1;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE2;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE3;
                } else if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE3;
                }
                break :blk .RCC_PLL_VCOINPUT_RANGE3;
            };

            const PLL3_VCO_SELValue: PLL3_VCO_SELList = blk: {
                if ((check_ref(@TypeOf(PLL3_VCI_RangeValue), PLL3_VCI_RangeValue, .RCC_PLL_VCOINPUT_RANGE0, .@"=")) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCO_LOW;
                } else if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCO_HIGH;
                }
                break :blk .RCC_PLL_VCO_HIGH;
            };

            //======= VCO3OutputFreq_Value ========
            const VCO3OutputFreq_ValueValue = VCO3Output.get_as_ref();
            ignore_value(VCO3OutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=") and (check_ref(@TypeOf(PLL3_VCO_SELValue), PLL3_VCO_SELValue, .RCC_PLL_VCO_HIGH, .@"="))) {
                VCO3Output.limit = .{
                    .min = 4e8,
                    .max = 1.6e9,
                    .main_expr = "PLL3Used=1 & (PLL3_VCO_SEL=RCC_PLL_VCO_HIGH)",
                    .main_dialog = "",
                };
            } else if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                VCO3Output.limit = .{
                    .min = 1.5e8,
                    .max = 4.2e8,
                    .main_expr = "PLL3Used=1",
                    .main_dialog = "",
                };
            }

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@"=")))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale1 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                    };
                } else if (((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 600000000, .@"<")) or (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 600000000, .@"="))) and (check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 400000000, .@">"))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE0) {
                            const patch_str = if (patch_logs) "Low" else "PWR_REGULATOR_VOLTAGE_SCALE0";
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
                                "((CpuClockFreq_Value < 600000000)|(CpuClockFreq_Value = 600000000)) & (CpuClockFreq_Value > 400000000)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    scale0 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE0;
                } else if ((check_ref(@TypeOf(CpuClockFreq_ValueValue), CpuClockFreq_ValueValue, 600000000, .@">"))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE0) {
                            const patch_str = if (patch_logs) "Low" else "PWR_REGULATOR_VOLTAGE_SCALE0";
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
                                "(CpuClockFreq_Value > 600000000)",
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
                        .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        .PWR_REGULATOR_VOLTAGE_SCALE0 => scale0 = true,
                    }
                }
                break :blk user_val orelse {
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                };
            };

            const FLatencyValue: FLatencyList = blk: {
                if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 280000000, .@">")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_7) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "(scale0 &  (HCLKFreq_Value > 280000000))",
                                "",
                                "FLASH_LATENCY_7",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_7;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 240000000, .@">")))) {
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
                                "(scale0 &  (HCLKFreq_Value > 240000000))",
                                "",
                                "FLASH_LATENCY_6",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_6;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 200000000, .@">")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_5) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "(scale0 &  (HCLKFreq_Value > 200000000))",
                                "",
                                "FLASH_LATENCY_5",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_5;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@">")))) {
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
                                "(scale0 &  (HCLKFreq_Value > 160000000))",
                                "",
                                "FLASH_LATENCY_4",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_4;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@">")))) {
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
                                "(scale0 &  (HCLKFreq_Value > 120000000))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 80000000, .@">")))) {
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
                                "(scale0 &  (HCLKFreq_Value > 80000000))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale0 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 40000000, .@">")))) {
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
                                "(scale0 &  (HCLKFreq_Value > 40000000))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 216000000, .@">")))) {
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
                                "(scale1 &  (HCLKFreq_Value > 216000000))",
                                "",
                                "FLASH_LATENCY_6",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_6;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@">")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_5) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "FLatency",
                                "(scale1 &  (HCLKFreq_Value > 180000000))",
                                "",
                                "FLASH_LATENCY_5",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_5;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@">")))) {
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
                                "(scale1 &  (HCLKFreq_Value > 144000000))",
                                "",
                                "FLASH_LATENCY_4",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_4;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 108000000, .@">")))) {
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
                                "(scale1 &  (HCLKFreq_Value > 108000000))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 72000000, .@">")))) {
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
                                "(scale1 &  (HCLKFreq_Value > 72000000))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale1 and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 36000000, .@">")))) {
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
                                "(scale1 &  (HCLKFreq_Value > 36000000))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
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
                        .FLASH_LATENCY_7 => {},
                    }
                }
                break :blk user_val orelse .FLASH_LATENCY_0;
            };
            if (!(check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"="))) {
                LSIRC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"="))) {
                I2S_CKIN.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(DigExtClockEnableValue), DigExtClockEnableValue, .true, .@"="))) {
                Dig_CKIN.nodetype = .off;
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
            if (!(check_ref(@TypeOf(cKPerEnableValue), cKPerEnableValue, .true, .@"="))) {
                CKPERSource.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(cKPerEnableValue), cKPerEnableValue, .true, .@"="))) {
                CKPERoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"="))) {
                DIVQ1.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"="))) {
                DIVQ1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM45EnableValue), LPTIM45EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM23EnableValue), LPTIM23EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"="))) {
                DIVP2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"=") or check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM45EnableValue), LPTIM45EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM23EnableValue), LPTIM23EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=") or check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"="))) {
                DIVP2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                DIVQ2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"="))) {
                DIVQ2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                DIVR2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                DIVR2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI1EnableValue), OCSPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI2EnableValue), OCSPI2EnableValue, .true, .@"="))) {
                DIVS2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI1EnableValue), OCSPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI2EnableValue), OCSPI2EnableValue, .true, .@"="))) {
                DIVS2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI1EnableValue), OCSPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI2EnableValue), OCSPI2EnableValue, .true, .@"="))) {
                DIVT2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI1EnableValue), OCSPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(OCSPI2EnableValue), OCSPI2EnableValue, .true, .@"="))) {
                DIVT2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"="))) {
                DIVP3.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"="))) {
                DIVP3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOFSValue), EnableUSBOFSValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"=") or check_ref(@TypeOf(EnableUSBOHSValue), EnableUSBOHSValue, .true, .@"="))) {
                DIVQ3.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOFSValue), EnableUSBOFSValue, .true, .@"=") or check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"=") or check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=") or check_ref(@TypeOf(USART234578EnableValue), USART234578EnableValue, .true, .@"=") or check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI45EnableValue), SPI45EnableValue, .true, .@"=") or check_ref(@TypeOf(SPI6EnableValue), SPI6EnableValue, .true, .@"="))) {
                DIVQ3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C23EnableValue), I2C23EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM45EnableValue), LPTIM45EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM23EnableValue), LPTIM23EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(PSSIEnableValue), PSSIEnableValue, .true, .@"=") or check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"="))) {
                DIVR3.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C23EnableValue), I2C23EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM45EnableValue), LPTIM45EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM23EnableValue), LPTIM23EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=") or check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=") or check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=") or check_ref(@TypeOf(PSSIEnableValue), PSSIEnableValue, .true, .@"=") or check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"="))) {
                DIVR3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ETH1EnableDivValue), ETH1EnableDivValue, .true, .@"="))) {
                DIVS3.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ETH1EnableDivValue), ETH1EnableDivValue, .true, .@"="))) {
                DIVS3output.nodetype = .off;
            }
            if (!(false)) {
                DIVT3.nodetype = .off;
            }
            if (!(false)) {
                DIVT3output.nodetype = .off;
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
            if (!(check_ref(@TypeOf(UCPDEnableValue), UCPDEnableValue, .true, .@"="))) {
                UCPDoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(UCPDEnableValue), UCPDEnableValue, .true, .@"="))) {
                HSI_DIV.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"="))) {
                SPI1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"="))) {
                SPI1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"="))) {
                SPI23Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPI23EnableValue), SPI23EnableValue, .true, .@"="))) {
                SPI23output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"="))) {
                SAI2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"="))) {
                SAI2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C23EnableValue), I2C23EnableValue, .true, .@"="))) {
                I2C23Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C23EnableValue), I2C23EnableValue, .true, .@"="))) {
                I2C23output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                SPDIFMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"="))) {
                SPDIFoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LTDCEnableValue), LTDCEnableValue, .true, .@"="))) {
                LTDCOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"="))) {
                FMCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FMCEnableValue), FMCEnableValue, .true, .@"="))) {
                FMCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"="))) {
                SDMMCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"="))) {
                SDMMCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"="))) {
                ADFMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"="))) {
                ADFoutput.nodetype = .off;
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
            if (!(check_ref(@TypeOf(LPTIM23EnableValue), LPTIM23EnableValue, .true, .@"="))) {
                LPTIM23Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM23EnableValue), LPTIM23EnableValue, .true, .@"="))) {
                LPTIM23output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM45EnableValue), LPTIM45EnableValue, .true, .@"="))) {
                LPTIM45Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LPTIM45EnableValue), LPTIM45EnableValue, .true, .@"="))) {
                LPTIM45output.nodetype = .off;
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
            if (!(check_ref(@TypeOf(EnableHSEUSBPHYDevisorValue), EnableHSEUSBPHYDevisorValue, .true, .@"="))) {
                HSEUSBPHYDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOFSValue), EnableUSBOFSValue, .true, .@"=") or check_ref(@TypeOf(EnableUSBOHSValue), EnableUSBOHSValue, .true, .@"="))) {
                USBPHYCLKMux.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOFSValue), EnableUSBOFSValue, .true, .@"=") or check_ref(@TypeOf(EnableUSBOHSValue), EnableUSBOHSValue, .true, .@"="))) {
                USBPHYCLKOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOFSValue), EnableUSBOFSValue, .true, .@"=") or check_ref(@TypeOf(EnableUSBOHSValue), EnableUSBOHSValue, .true, .@"="))) {
                USBPHYRC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOHSValue), EnableUSBOHSValue, .true, .@"="))) {
                USBPHYRC60.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOFSValue), EnableUSBOFSValue, .true, .@"="))) {
                USBOCLKMux.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableUSBOFSValue), EnableUSBOFSValue, .true, .@"="))) {
                USBOFSCLKOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                RNGOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(DTSEnableValue), DTSEnableValue, .true, .@"="))) {
                DTSOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"="))) {
                FDCANoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(OCSPI1EnableValue), OCSPI1EnableValue, .true, .@"="))) {
                XSPI1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(OCSPI1EnableValue), OCSPI1EnableValue, .true, .@"="))) {
                XSPI1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(PSSIEnableValue), PSSIEnableValue, .true, .@"="))) {
                PSSIMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(PSSIEnableValue), PSSIEnableValue, .true, .@"="))) {
                PSSIoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(OCSPI2EnableValue), OCSPI2EnableValue, .true, .@"="))) {
                XSPI2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(OCSPI2EnableValue), OCSPI2EnableValue, .true, .@"="))) {
                XSPI2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ETHClockEnableValue), ETHClockEnableValue, .true, .@"="))) {
                ETHPHYMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ETHClockEnableValue), ETHClockEnableValue, .true, .@"="))) {
                ETHPHYoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ETH1EnableValue), ETH1EnableValue, .true, .@"="))) {
                ETH1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ETH1EnableValue), ETH1EnableValue, .true, .@"="))) {
                ETH1output.nodetype = .off;
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
            if (!(check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"="))) {
                CSICECDevisor.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.HSIDiv = try HSIDiv.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.CSIRC = try CSIRC.get_output();
            out.RC48 = try RC48.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.Dig_CKIN = try Dig_CKIN.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.MCO1Mult = try MCO1Mult.get_output();
            out.MCO1Div = try MCO1Div.get_output();
            out.MCO1Pin = try MCO1Pin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.CPRE = try CPRE.get_output();
            out.CPREOutput = try CPREOutput.get_output();
            out.TPIUPrescaler = try TPIUPrescaler.get_output();
            out.TPIUOutput = try TPIUOutput.get_output();
            out.CpuClockOutput = try CpuClockOutput.get_output();
            out.CortexPrescaler = try CortexPrescaler.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.BMPRE = try BMPRE.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.AXIClockOutput = try AXIClockOutput.get_output();
            out.AHB5Output = try AHB5Output.get_output();
            out.PPRE5 = try PPRE5.get_output();
            out.APB5Output = try APB5Output.get_output();
            out.AHB1234Output = try AHB1234Output.get_output();
            out.PPRE1 = try PPRE1.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.Tim1Mul = try Tim1Mul.get_output();
            out.Tim1Output = try Tim1Output.get_output();
            out.PPRE2 = try PPRE2.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.Tim2Mul = try Tim2Mul.get_output();
            out.Tim2Output = try Tim2Output.get_output();
            out.PPRE4 = try PPRE4.get_output();
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
            out.DIVS1 = try DIVS1.get_output();
            out.DIVS1output = try DIVS1output.get_output();
            out.DIVT1 = try DIVT1.get_output();
            out.DIVT1output = try DIVT1output.get_output();
            out.DIVN2 = try DIVN2.get_output();
            out.PLL2FRACN = try PLL2FRACN.get_output();
            out.DIVP2 = try DIVP2.get_output();
            out.DIVP2output = try DIVP2output.get_output();
            out.DIVQ2 = try DIVQ2.get_output();
            out.DIVQ2output = try DIVQ2output.get_output();
            out.DIVR2 = try DIVR2.get_output();
            out.DIVR2output = try DIVR2output.get_output();
            out.DIVS2 = try DIVS2.get_output();
            out.DIVS2output = try DIVS2output.get_output();
            out.DIVT2 = try DIVT2.get_output();
            out.DIVT2output = try DIVT2output.get_output();
            out.DIVN3 = try DIVN3.get_output();
            out.PLL3FRACN = try PLL3FRACN.get_output();
            out.DIVP3 = try DIVP3.get_output();
            out.DIVP3output = try DIVP3output.get_output();
            out.DIVQ3 = try DIVQ3.get_output();
            out.DIVQ3output = try DIVQ3output.get_output();
            out.DIVR3 = try DIVR3.get_output();
            out.DIVR3output = try DIVR3output.get_output();
            out.DIVS3 = try DIVS3.get_output();
            out.DIVS3output = try DIVS3output.get_output();
            out.DIVT3 = try DIVT3.get_output();
            out.DIVT3output = try DIVT3output.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.UCPDoutput = try UCPDoutput.get_output();
            out.HSI_DIV = try HSI_DIV.get_output();
            out.SPI1Mult = try SPI1Mult.get_output();
            out.SPI1output = try SPI1output.get_output();
            out.SPI23Mult = try SPI23Mult.get_output();
            out.SPI23output = try SPI23output.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.SAI1output = try SAI1output.get_output();
            out.SAI2Mult = try SAI2Mult.get_output();
            out.SAI2output = try SAI2output.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C23Mult = try I2C23Mult.get_output();
            out.I2C23output = try I2C23output.get_output();
            out.SPDIFMult = try SPDIFMult.get_output();
            out.SPDIFoutput = try SPDIFoutput.get_output();
            out.LTDCOutput = try LTDCOutput.get_output();
            out.FMCMult = try FMCMult.get_output();
            out.FMCoutput = try FMCoutput.get_output();
            out.SDMMCMult = try SDMMCMult.get_output();
            out.SDMMCoutput = try SDMMCoutput.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.ADFMult = try ADFMult.get_output();
            out.ADFoutput = try ADFoutput.get_output();
            out.USART234578Mult = try USART234578Mult.get_output();
            out.USART234578output = try USART234578output.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.LPTIM23Mult = try LPTIM23Mult.get_output();
            out.LPTIM23output = try LPTIM23output.get_output();
            out.LPTIM45Mult = try LPTIM45Mult.get_output();
            out.LPTIM45output = try LPTIM45output.get_output();
            out.SPI6Mult = try SPI6Mult.get_output();
            out.SPI6output = try SPI6output.get_output();
            out.SPI45Mult = try SPI45Mult.get_output();
            out.SPI45output = try SPI45output.get_output();
            out.HSEUSBPHYDevisor = try HSEUSBPHYDevisor.get_output();
            out.USBPHYCLKMux = try USBPHYCLKMux.get_output();
            out.USBPHYCLKOutput = try USBPHYCLKOutput.get_output();
            out.USBPHYRC = try USBPHYRC.get_output();
            out.USBPHYRC60 = try USBPHYRC60.get_output();
            out.USBOCLKMux = try USBOCLKMux.get_output();
            out.USBOFSCLKOutput = try USBOFSCLKOutput.get_output();
            out.RNGOutput = try RNGOutput.get_output();
            out.DTSOutput = try DTSOutput.get_output();
            out.FDCANMult = try FDCANMult.get_output();
            out.FDCANoutput = try FDCANoutput.get_output();
            out.XSPI1Mult = try XSPI1Mult.get_output();
            out.XSPI1output = try XSPI1output.get_output();
            out.PSSIMult = try PSSIMult.get_output();
            out.PSSIoutput = try PSSIoutput.get_output();
            out.XSPI2Mult = try XSPI2Mult.get_output();
            out.XSPI2output = try XSPI2output.get_output();
            out.ETHPHYMult = try ETHPHYMult.get_output();
            out.ETHPHYoutput = try ETHPHYoutput.get_output();
            out.ETH1Mult = try ETH1Mult.get_output();
            out.ETH1output = try ETH1output.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.CECMult = try CECMult.get_output();
            out.CECoutput = try CECoutput.get_output();
            out.CSICECDevisor = try CSICECDevisor.get_output();
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
            ignore_value(DIGITAL_CLOCK_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv1 = RCC_MCODiv1Value;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCODiv2 = RCC_MCODiv2Value;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.CPRE = CPREValue;
            ignore_value(CPREFreq_ValueValue);
            ref_out.TPIU = TPIUValue;
            ignore_value(TPIUFreq_ValueValue);
            ignore_value(CpuClockFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ref_out.BMPRE = BMPREValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AXIClockFreq_ValueValue);
            ignore_value(AHB5ClockFreq_ValueValue);
            ref_out.PPRE5 = PPRE5Value;
            ignore_value(APB5Freq_ValueValue);
            ignore_value(AHB1234Freq_ValueValue);
            ref_out.PPRE1 = PPRE1Value;
            ignore_value(APB1Freq_ValueValue);
            ref_out.Tim1Mul = Tim1MulValue;
            ignore_value(Tim1OutputFreq_ValueValue);
            ref_out.PPRE2 = PPRE2Value;
            ignore_value(APB2Freq_ValueValue);
            ref_out.Tim2Mul = Tim2MulValue;
            ignore_value(Tim2OutputFreq_ValueValue);
            ref_out.PPRE4 = PPRE4Value;
            ignore_value(APB4Freq_ValueValue);
            ref_out.PLLSource = PLLSourceValue;
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
            ref_out.DIVS1 = DIVS1Value;
            ignore_value(DIVS1Freq_ValueValue);
            ref_out.DIVT1 = DIVT1Value;
            ignore_value(DIVT1Freq_ValueValue);
            ref_out.DIVN2 = DIVN2Value;
            ignore_value(PLL2FRACNValue);
            ref_out.DIVP2 = DIVP2Value;
            ignore_value(DIVP2Freq_ValueValue);
            ref_out.DIVQ2 = DIVQ2Value;
            ignore_value(DIVQ2Freq_ValueValue);
            ref_out.DIVR2 = DIVR2Value;
            ignore_value(DIVR2Freq_ValueValue);
            ref_out.DIVS2 = DIVS2Value;
            ignore_value(DIVS2Freq_ValueValue);
            ref_out.DIVT2 = DIVT2Value;
            ignore_value(DIVT2Freq_ValueValue);
            ref_out.DIVN3 = DIVN3Value;
            ignore_value(PLL3FRACNValue);
            ref_out.DIVP3 = DIVP3Value;
            ignore_value(DIVP3Freq_ValueValue);
            ref_out.DIVQ3 = DIVQ3Value;
            ignore_value(DIVQ3Freq_ValueValue);
            ref_out.DIVR3 = DIVR3Value;
            ignore_value(DIVR3Freq_ValueValue);
            ref_out.DIVS3 = DIVS3Value;
            ignore_value(DIVS3Freq_ValueValue);
            ref_out.DIVT3 = DIVT3Value;
            ignore_value(DIVT3Freq_ValueValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ignore_value(UCPDFreq_ValueValue);
            ref_out.HSIDivToUCPD = HSIDivToUCPDValue;
            ref_out.SPI1CLockSelection = SPI1CLockSelectionValue;
            ignore_value(SPI1Freq_ValueValue);
            ref_out.SPI23CLockSelection = SPI23CLockSelectionValue;
            ignore_value(SPI23Freq_ValueValue);
            ref_out.SAI1CLockSelection = SAI1CLockSelectionValue;
            ignore_value(SAI1Freq_ValueValue);
            ref_out.SAI2CLockSelection = SAI2CLockSelectionValue;
            ignore_value(SAI2Freq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2CI3C1Freq_ValueValue);
            ref_out.I2C23CLockSelection = I2C23CLockSelectionValue;
            ignore_value(I2C23Freq_ValueValue);
            ref_out.SPDIFCLockSelection = SPDIFCLockSelectionValue;
            ignore_value(SPDIFRXFreq_ValueValue);
            ignore_value(LTDCFreq_ValueValue);
            ref_out.FmcClockSelection = FmcClockSelectionValue;
            ignore_value(FMCFreq_ValueValue);
            ref_out.SDMMC1CLockSelection = SDMMC1CLockSelectionValue;
            ignore_value(SDMMCFreq_ValueValue);
            ref_out.USART1CLockSelection = USART1CLockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.Adf1ClockSelection = Adf1ClockSelectionValue;
            ignore_value(ADFFreq_ValueValue);
            ref_out.USART234578CLockSelection = USART234578CLockSelectionValue;
            ignore_value(USART234578Freq_ValueValue);
            ref_out.LPUART1CLockSelection = LPUART1CLockSelectionValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.LPTIM23CLockSelection = LPTIM23CLockSelectionValue;
            ignore_value(LPTIM23Freq_ValueValue);
            ref_out.LPTIM45CLockSelection = LPTIM45CLockSelectionValue;
            ignore_value(LPTIM45Freq_ValueValue);
            ref_out.SPI6CLockSelection = SPI6CLockSelectionValue;
            ignore_value(SPI6Freq_ValueValue);
            ref_out.Spi45ClockSelection = Spi45ClockSelectionValue;
            ignore_value(SPI45Freq_ValueValue);
            ref_out.RCC_USBPHY_Clock_Source_FROM_HSE = RCC_USBPHY_Clock_Source_FROM_HSEValue;
            ref_out.USBPHYCLKSource = USBPHYCLKSourceValue;
            ignore_value(USBPHYFreq_ValueValue);
            ignore_value(USB_PHY_VALUEValue);
            ignore_value(USB_PHY_VALUE60Value);
            ref_out.USBCLockSelection = USBCLockSelectionValue;
            ignore_value(USBOFSFreq_ValueValue);
            ignore_value(RNGFreq_ValueValue);
            ignore_value(DTSFreq_ValueValue);
            ref_out.FDCANCLockSelection = FDCANCLockSelectionValue;
            ignore_value(FDCANFreq_ValueValue);
            ref_out.Xspi1ClockSelection = Xspi1ClockSelectionValue;
            ignore_value(OSPI1Freq_ValueValue);
            ref_out.PSSICLockSelection = PSSICLockSelectionValue;
            ignore_value(PSSIFreq_ValueValue);
            ref_out.Xspi2ClockSelection = Xspi2ClockSelectionValue;
            ignore_value(OSPI2Freq_ValueValue);
            ref_out.ETHPHYCLockSelection = ETHPHYCLockSelectionValue;
            ignore_value(ETHPHYFreq_ValueValue);
            ref_out.ETH1CLockSelection = ETH1CLockSelectionValue;
            ignore_value(ETH1Freq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.CECCLockSelection = CECCLockSelectionValue;
            ignore_value(CECFreq_ValueValue);
            ref_out.CSI_DIV = CSI_DIVValue;
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
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.PLL1_VCO_SEL = PLL1_VCO_SELValue;
            ref_out.PLL2_VCO_SEL = PLL2_VCO_SELValue;
            ref_out.PLL3_VCO_SEL = PLL3_VCO_SELValue;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.DigExtClockEnable = DigExtClockEnableValue == .true;
            ref_out.flags.MCO1OutPutEnable = MCO1OutPutEnableValue == .true;
            ref_out.flags.MCO2OutPutEnable = MCO2OutPutEnableValue == .true;
            ref_out.flags.cKPerEnable = cKPerEnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.SAI2Enable = SAI2EnableValue == .true;
            ref_out.flags.SPI1Enable = SPI1EnableValue == .true;
            ref_out.flags.SPDIFEnable = SPDIFEnableValue == .true;
            ref_out.flags.FDCANEnable = FDCANEnableValue == .true;
            ref_out.flags.FMCEnable = FMCEnableValue == .true;
            ref_out.flags.SPI23Enable = SPI23EnableValue == .true;
            ref_out.flags.ADF1Enable = ADF1EnableValue == .true;
            ref_out.flags.LPTIM45Enable = LPTIM45EnableValue == .true;
            ref_out.flags.LPTIM23Enable = LPTIM23EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.SPI6Enable = SPI6EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.USART234578Enable = USART234578EnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.SPI45Enable = SPI45EnableValue == .true;
            ref_out.flags.SDMMC1Enable = SDMMC1EnableValue == .true;
            ref_out.flags.OCSPI1Enable = OCSPI1EnableValue == .true;
            ref_out.flags.OCSPI2Enable = OCSPI2EnableValue == .true;
            ref_out.flags.EnableUSBOFS = EnableUSBOFSValue == .true;
            ref_out.flags.EnableUSBOHS = EnableUSBOHSValue == .true;
            ref_out.flags.I2C23Enable = I2C23EnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.PSSIEnable = PSSIEnableValue == .true;
            ref_out.flags.LTDCEnable = LTDCEnableValue == .true;
            ref_out.flags.ETH1EnableDiv = ETH1EnableDivValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.UCPDEnable = UCPDEnableValue == .true;
            ref_out.flags.EnableHSEUSBPHYDevisor = EnableHSEUSBPHYDevisorValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.DTSEnable = DTSEnableValue == .true;
            ref_out.flags.ETHClockEnable = ETHClockEnableValue == .true;
            ref_out.flags.ETH1Enable = ETH1EnableValue == .true;
            ref_out.flags.CECEnable = CECEnableValue == .true;
            ref_out.flags.PLL1QUsed = PLL1QUsedValue != 0;
            ref_out.flags.PLL2PUsed = PLL2PUsedValue != 0;
            ref_out.flags.PLL2QUsed = PLL2QUsedValue != 0;
            ref_out.flags.PLL2RUsed = PLL2RUsedValue != 0;
            ref_out.flags.PLL2SUsed = PLL2SUsedValue != 0;
            ref_out.flags.PLL2TUsed = PLL2TUsedValue != 0;
            ref_out.flags.PLL3PUsed = PLL3PUsedValue != 0;
            ref_out.flags.PLL3QUsed = PLL3QUsedValue != 0;
            ref_out.flags.PLL3RUsed = PLL3RUsedValue != 0;
            ref_out.flags.PLL3SUsed = PLL3SUsedValue != 0;
            ref_out.flags.PLL1Used = PLL1UsedValue != 0;
            ref_out.flags.PLL2Used = PLL2UsedValue != 0;
            ref_out.flags.PLL3Used = PLL3UsedValue != 0;
            ref_out.flags.PLL1PUsed = PLL1PUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
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
