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
            ICLK = 0,
            PLL1_P = 1,
        };
        pub const RCC_SAISEL = enum(u3) {
            PLL2_P = 0,
            PLL3_P = 1,
            PLL1_P = 2,
            AUDIOCLK = 3,
            HSI = 4,
        };
        pub const RCC_I2CSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            MSIK = 3,
        };
        pub const RCC_LSIPREDIV = enum(u1) {
            Div1 = 0,
            Div128 = 1,
        };
        pub const RCC_SPI2SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            MSIK = 3,
        };
        pub const RCC_SAESSEL = enum(u1) {
            SHSI = 0,
            SHSI_DIV_2 = 1,
        };
        pub const RCC_PLLSRC = enum(u2) {
            MSIS = 1,
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_PLLMBOOST = enum(u4) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div6 = 3,
            Div8 = 4,
            Div10 = 5,
            Div12 = 6,
            Div14 = 7,
            Div16 = 8,
        };
        pub const RCC_SW = enum(u2) {
            MSIS = 0,
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
        pub const RCC_PLLRGE = enum(u2) {
            FREQ_4TO8MHZ = 0,
            FREQ_8TO16MHZ = 3,
        };
        pub const RCC_I2C3SEL = enum(u2) {
            PCLK3 = 0,
            SYS = 1,
            HSI = 2,
            MSIK = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_OCTOSPISEL = enum(u2) {
            SYS = 0,
            MSIK = 1,
            PLL1_Q = 2,
            PLL2_Q = 3,
        };
        pub const RCC_USARTSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 1,
            MSIS = 2,
            HSI = 3,
            HSE = 4,
            PLL1_R = 5,
            LSI = 6,
            LSE = 7,
            HSI48 = 8,
            MSIK = 9,
        };
        pub const RCC_ADFSEL = enum(u3) {
            HCLK3 = 0,
            PLL1_P = 1,
            PLL3_Q = 2,
            AUDIOCLK = 3,
            MSIK = 4,
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
        pub const RCC_DACSEL = enum(u1) {
            LSE = 0,
            LSI = 1,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_STOPWUCK = enum(u1) {
            MSIS = 0,
            HSI = 1,
        };
        pub const RCC_FDCANSEL = enum(u2) {
            HSE = 0,
            PLL1_Q = 1,
            PLL2_P = 2,
        };
        pub const RCC_SPI3SEL = enum(u2) {
            PCLK3 = 0,
            SYS = 1,
            HSI = 2,
            MSIK = 3,
        };
        pub const RCC_MSIRANGE = enum(u4) {
            RANGE_48MHZ = 0,
            RANGE_24MHZ = 1,
            RANGE_16MHZ = 2,
            RANGE_12MHZ = 3,
            RANGE_4MHZ = 4,
            RANGE_2MHZ = 5,
            RANGE_1_33MHZ = 6,
            RANGE_1MHZ = 7,
            RANGE_3_072MHZ = 8,
            RANGE_1_536MHZ = 9,
            RANGE_1_024MHZ = 10,
            RANGE_768KHZ = 11,
            RANGE_400KHZ = 12,
            RANGE_200KHZ = 13,
            RANGE_133KHZ = 14,
            RANGE_100KHZ = 15,
        };
        pub const PWR_VOS = enum(u2) {
            Range4 = 0,
            Range3 = 1,
            Range2 = 2,
            Range1 = 3,
        };
        pub const RCC_ADCDACSEL = enum(u3) {
            HCLK1 = 0,
            SYS = 1,
            PLL2_R = 2,
            HSE = 3,
            HSI = 4,
            MSIK = 5,
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
        pub const RCC_LPTIMSEL = enum(u2) {
            MSIK = 0,
            LSI = 1,
            HSI = 2,
            LSE = 3,
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
            HSI48_DIV_2 = 1,
            HSI = 2,
        };
        pub const RCC_LPUSARTSEL = enum(u3) {
            PCLK3 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
            MSIK = 4,
        };
        pub const RCC_MDFSEL = enum(u3) {
            HCLK1 = 0,
            PLL1_P = 1,
            PLL3_Q = 2,
            AUDIOCLK = 3,
            MSIK = 4,
        };
        pub const RCC_SPI1SEL = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            HSI = 2,
            MSIK = 3,
        };

        pub const SAESSourceList = enum {
            RCC_SAESCLKSOURCE_SHSI,
            RCC_SAESCLKSOURCE_SHSI_DIV2,

            pub fn to_enum(self: @This()) anyerror!RCC_SAESSEL {
                return switch (self) {
                    .RCC_SAESCLKSOURCE_SHSI_DIV2 => .SHSI_DIV_2,
                    .RCC_SAESCLKSOURCE_SHSI => .SHSI,
                };
            }
            pub fn from_enum(item: RCC_SAESSEL) anyerror!@This() {
                return switch (item) {
                    .SHSI_DIV_2 => .RCC_SAESCLKSOURCE_SHSI_DIV2,
                    .SHSI => .RCC_SAESCLKSOURCE_SHSI,
                };
            }
        };

        pub const LSIDIVList = enum {
            RCC_LSI_DIV1,
            RCC_LSI_DIV128,

            pub fn to_enum(self: @This()) anyerror!RCC_LSIPREDIV {
                return switch (self) {
                    .RCC_LSI_DIV128 => .Div128,
                    .RCC_LSI_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_LSIPREDIV) anyerror!@This() {
                return switch (item) {
                    .Div128 => .RCC_LSI_DIV128,
                    .Div1 => .RCC_LSI_DIV1,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_LSI_DIV1 => 1,
                    .RCC_LSI_DIV128 => 128,
                };
            }
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
            RCC_MSIRANGE_12,
            RCC_MSIRANGE_13,
            RCC_MSIRANGE_14,
            RCC_MSIRANGE_15,

            pub fn to_enum(self: @This()) anyerror!RCC_MSIRANGE {
                return switch (self) {
                    .RCC_MSIRANGE_15 => .RANGE_100KHZ,
                    .RCC_MSIRANGE_11 => .RANGE_768KHZ,
                    .RCC_MSIRANGE_5 => .RANGE_2MHZ,
                    .RCC_MSIRANGE_8 => .RANGE_3_072MHZ,
                    .RCC_MSIRANGE_14 => .RANGE_133KHZ,
                    .RCC_MSIRANGE_0 => .RANGE_48MHZ,
                    .RCC_MSIRANGE_10 => .RANGE_1_024MHZ,
                    .RCC_MSIRANGE_9 => .RANGE_1_536MHZ,
                    .RCC_MSIRANGE_12 => .RANGE_400KHZ,
                    .RCC_MSIRANGE_7 => .RANGE_1MHZ,
                    .RCC_MSIRANGE_2 => .RANGE_16MHZ,
                    .RCC_MSIRANGE_6 => .RANGE_1_33MHZ,
                    .RCC_MSIRANGE_4 => .RANGE_4MHZ,
                    .RCC_MSIRANGE_13 => .RANGE_200KHZ,
                    .RCC_MSIRANGE_1 => .RANGE_24MHZ,
                    .RCC_MSIRANGE_3 => .RANGE_12MHZ,
                };
            }
            pub fn from_enum(item: RCC_MSIRANGE) anyerror!@This() {
                return switch (item) {
                    .RANGE_100KHZ => .RCC_MSIRANGE_15,
                    .RANGE_768KHZ => .RCC_MSIRANGE_11,
                    .RANGE_2MHZ => .RCC_MSIRANGE_5,
                    .RANGE_3_072MHZ => .RCC_MSIRANGE_8,
                    .RANGE_133KHZ => .RCC_MSIRANGE_14,
                    .RANGE_48MHZ => .RCC_MSIRANGE_0,
                    .RANGE_1_024MHZ => .RCC_MSIRANGE_10,
                    .RANGE_1_536MHZ => .RCC_MSIRANGE_9,
                    .RANGE_400KHZ => .RCC_MSIRANGE_12,
                    .RANGE_1MHZ => .RCC_MSIRANGE_7,
                    .RANGE_16MHZ => .RCC_MSIRANGE_2,
                    .RANGE_1_33MHZ => .RCC_MSIRANGE_6,
                    .RANGE_4MHZ => .RCC_MSIRANGE_4,
                    .RANGE_200KHZ => .RCC_MSIRANGE_13,
                    .RANGE_24MHZ => .RCC_MSIRANGE_1,
                    .RANGE_12MHZ => .RCC_MSIRANGE_3,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MSIRANGE_0 => 48000000,
                    .RCC_MSIRANGE_1 => 24000000,
                    .RCC_MSIRANGE_2 => 16000000,
                    .RCC_MSIRANGE_3 => 12000000,
                    .RCC_MSIRANGE_4 => 4000000,
                    .RCC_MSIRANGE_5 => 2000000,
                    .RCC_MSIRANGE_6 => 1330000,
                    .RCC_MSIRANGE_7 => 1000000,
                    .RCC_MSIRANGE_8 => 3072000,
                    .RCC_MSIRANGE_9 => 1536000,
                    .RCC_MSIRANGE_10 => 1024000,
                    .RCC_MSIRANGE_11 => 768000,
                    .RCC_MSIRANGE_12 => 400000,
                    .RCC_MSIRANGE_13 => 200000,
                    .RCC_MSIRANGE_14 => 133000,
                    .RCC_MSIRANGE_15 => 100000,
                };
            }
        };

        pub const MSIKClockRangeList = enum {
            RCC_MSIKRANGE_0,
            RCC_MSIKRANGE_1,
            RCC_MSIKRANGE_2,
            RCC_MSIKRANGE_3,
            RCC_MSIKRANGE_4,
            RCC_MSIKRANGE_5,
            RCC_MSIKRANGE_6,
            RCC_MSIKRANGE_7,
            RCC_MSIKRANGE_8,
            RCC_MSIKRANGE_9,
            RCC_MSIKRANGE_10,
            RCC_MSIKRANGE_11,
            RCC_MSIKRANGE_12,
            RCC_MSIKRANGE_13,
            RCC_MSIKRANGE_14,
            RCC_MSIKRANGE_15,

            pub fn to_enum(self: @This()) anyerror!RCC_MSIRANGE {
                return switch (self) {
                    .RCC_MSIKRANGE_11 => .RANGE_768KHZ,
                    .RCC_MSIKRANGE_10 => .RANGE_1_024MHZ,
                    .RCC_MSIKRANGE_15 => .RANGE_100KHZ,
                    .RCC_MSIKRANGE_9 => .RANGE_1_536MHZ,
                    .RCC_MSIKRANGE_14 => .RANGE_133KHZ,
                    .RCC_MSIKRANGE_2 => .RANGE_16MHZ,
                    .RCC_MSIKRANGE_13 => .RANGE_200KHZ,
                    .RCC_MSIKRANGE_8 => .RANGE_3_072MHZ,
                    .RCC_MSIKRANGE_6 => .RANGE_1_33MHZ,
                    .RCC_MSIKRANGE_4 => .RANGE_4MHZ,
                    .RCC_MSIKRANGE_12 => .RANGE_400KHZ,
                    .RCC_MSIKRANGE_1 => .RANGE_24MHZ,
                    .RCC_MSIKRANGE_7 => .RANGE_1MHZ,
                    .RCC_MSIKRANGE_0 => .RANGE_48MHZ,
                    .RCC_MSIKRANGE_5 => .RANGE_2MHZ,
                    .RCC_MSIKRANGE_3 => .RANGE_12MHZ,
                };
            }
            pub fn from_enum(item: RCC_MSIRANGE) anyerror!@This() {
                return switch (item) {
                    .RANGE_768KHZ => .RCC_MSIKRANGE_11,
                    .RANGE_1_024MHZ => .RCC_MSIKRANGE_10,
                    .RANGE_100KHZ => .RCC_MSIKRANGE_15,
                    .RANGE_1_536MHZ => .RCC_MSIKRANGE_9,
                    .RANGE_133KHZ => .RCC_MSIKRANGE_14,
                    .RANGE_16MHZ => .RCC_MSIKRANGE_2,
                    .RANGE_200KHZ => .RCC_MSIKRANGE_13,
                    .RANGE_3_072MHZ => .RCC_MSIKRANGE_8,
                    .RANGE_1_33MHZ => .RCC_MSIKRANGE_6,
                    .RANGE_4MHZ => .RCC_MSIKRANGE_4,
                    .RANGE_400KHZ => .RCC_MSIKRANGE_12,
                    .RANGE_24MHZ => .RCC_MSIKRANGE_1,
                    .RANGE_1MHZ => .RCC_MSIKRANGE_7,
                    .RANGE_48MHZ => .RCC_MSIKRANGE_0,
                    .RANGE_2MHZ => .RCC_MSIKRANGE_5,
                    .RANGE_12MHZ => .RCC_MSIKRANGE_3,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MSIKRANGE_0 => 48000000,
                    .RCC_MSIKRANGE_1 => 24000000,
                    .RCC_MSIKRANGE_2 => 16000000,
                    .RCC_MSIKRANGE_3 => 12000000,
                    .RCC_MSIKRANGE_4 => 4000000,
                    .RCC_MSIKRANGE_5 => 2000000,
                    .RCC_MSIKRANGE_6 => 1330000,
                    .RCC_MSIKRANGE_7 => 1000000,
                    .RCC_MSIKRANGE_8 => 3072000,
                    .RCC_MSIKRANGE_9 => 1536000,
                    .RCC_MSIKRANGE_10 => 1024000,
                    .RCC_MSIKRANGE_11 => 768000,
                    .RCC_MSIKRANGE_12 => 400000,
                    .RCC_MSIKRANGE_13 => 200000,
                    .RCC_MSIKRANGE_14 => 133000,
                    .RCC_MSIKRANGE_15 => 100000,
                };
            }
        };

        pub const RCC_Stop_WakeUpClockList = enum {
            RCC_STOP_WAKEUPCLOCK_MSI,
            RCC_STOP_WAKEUPCLOCK_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_STOPWUCK {
                return switch (self) {
                    .RCC_STOP_WAKEUPCLOCK_MSI => .MSIS,
                    .RCC_STOP_WAKEUPCLOCK_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_STOPWUCK) anyerror!@This() {
                return switch (item) {
                    .MSIS => .RCC_STOP_WAKEUPCLOCK_MSI,
                    .HSI => .RCC_STOP_WAKEUPCLOCK_HSI,
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
                    .RCC_SYSCLKSOURCE_MSI => .MSIS,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_R,
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .MSIS => .RCC_SYSCLKSOURCE_MSI,
                    .PLL1_R => .RCC_SYSCLKSOURCE_PLLCLK,
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_MSI,
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSE => .HSE,
                    .RCC_PLLSOURCE_MSI => .MSIS,
                    .RCC_PLLSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_PLLSOURCE_HSE,
                    .MSIS => .RCC_PLLSOURCE_MSI,
                    .HSI => .RCC_PLLSOURCE_HSI,
                };
            }
        };

        pub const PLL2SourceList = enum {
            RCC_PLLSOURCE_MSI,
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSE => .HSE,
                    .RCC_PLLSOURCE_MSI => .MSIS,
                    .RCC_PLLSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_PLLSOURCE_HSE,
                    .MSIS => .RCC_PLLSOURCE_MSI,
                    .HSI => .RCC_PLLSOURCE_HSI,
                };
            }
        };

        pub const PLL3SourceList = enum {
            RCC_PLLSOURCE_MSI,
            RCC_PLLSOURCE_HSI,
            RCC_PLLSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSE => .HSE,
                    .RCC_PLLSOURCE_MSI => .MSIS,
                    .RCC_PLLSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_PLLSOURCE_HSE,
                    .MSIS => .RCC_PLLSOURCE_MSI,
                    .HSI => .RCC_PLLSOURCE_HSI,
                };
            }
        };

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_HSE_DIV32,
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,

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

        pub const USART1CLockSelectionVirtualList = enum {
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,
            RCC_USART1CLKSOURCE_PCLK2,
            RCC_USART1CLKSOURCE_SYSCLK,

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

        pub const USART2CLockSelectionVirtualList = enum {
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                    .RCC_USART2CLKSOURCE_HSI => .HSI,
                    .RCC_USART2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                };
            }
        };

        pub const USART3CLockSelectionVirtualList = enum {
            RCC_USART3CLKSOURCE_HSI,
            RCC_USART3CLKSOURCE_LSE,
            RCC_USART3CLKSOURCE_PCLK1,
            RCC_USART3CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSEL {
                return switch (self) {
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_USARTSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
                    .SYS => .RCC_USART3CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                };
            }
        };

        pub const UART4CLockSelectionVirtualList = enum {
            RCC_UART4CLKSOURCE_HSI,
            RCC_UART4CLKSOURCE_LSE,
            RCC_UART4CLKSOURCE_PCLK1,
            RCC_UART4CLKSOURCE_SYSCLK,

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

        pub const UART5CLockSelectionVirtualList = enum {
            RCC_UART5CLKSOURCE_HSI,
            RCC_UART5CLKSOURCE_LSE,
            RCC_UART5CLKSOURCE_PCLK1,
            RCC_UART5CLKSOURCE_SYSCLK,

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

        pub const LPUART1CLockSelectionVirtualList = enum {
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_MSIK,
            RCC_LPUART1CLKSOURCE_LSE,
            RCC_LPUART1CLKSOURCE_PCLK3,
            RCC_LPUART1CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_LPUSARTSEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_MSIK => .MSIK,
                    .RCC_LPUART1CLKSOURCE_HSI => .HSI,
                    .RCC_LPUART1CLKSOURCE_LSE => .LSE,
                    .RCC_LPUART1CLKSOURCE_PCLK3 => .PCLK3,
                    .RCC_LPUART1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_LPUSARTSEL) anyerror!@This() {
                return switch (item) {
                    .MSIK => .RCC_LPUART1CLKSOURCE_MSIK,
                    .HSI => .RCC_LPUART1CLKSOURCE_HSI,
                    .LSE => .RCC_LPUART1CLKSOURCE_LSE,
                    .PCLK3 => .RCC_LPUART1CLKSOURCE_PCLK3,
                    .SYS => .RCC_LPUART1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const LPTIM1CLockSelectionVirtualList = enum {
            RCC_LPTIM1CLKSOURCE_MSIK,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_HSI,
            RCC_LPTIM1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM1CLKSOURCE_MSIK => .PCLK1,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_MSIK,
                    .HSI => .RCC_LPTIM1CLKSOURCE_HSI,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                };
            }
        };

        pub const LPTIM2CLockSelectionVirtualList = enum {
            RCC_LPTIM2CLKSOURCE_LSI,
            RCC_LPTIM2CLKSOURCE_HSI,
            RCC_LPTIM2CLKSOURCE_LSE,
            RCC_LPTIM2CLKSOURCE_PCLK1,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIM2SEL {
                return switch (self) {
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_LPTIM2CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM2CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM2CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIM2SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_LPTIM2CLKSOURCE_PCLK1,
                    .LSE => .RCC_LPTIM2CLKSOURCE_LSE,
                    .LSI => .RCC_LPTIM2CLKSOURCE_LSI,
                    .HSI => .RCC_LPTIM2CLKSOURCE_HSI,
                };
            }
        };

        pub const DACCLockSelectionVirtualList = enum {
            RCC_DAC1CLKSOURCE_LSI,
            RCC_DAC1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_DACSEL {
                return switch (self) {
                    .RCC_DAC1CLKSOURCE_LSI => .LSI,
                    .RCC_DAC1CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_DACSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_DAC1CLKSOURCE_LSI,
                    .LSE => .RCC_DAC1CLKSOURCE_LSE,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCDACCLKSOURCE_HSE,
            RCC_ADCDACCLKSOURCE_HSI,
            RCC_ADCDACCLKSOURCE_MSIK,
            RCC_ADCDACCLKSOURCE_HCLK,
            RCC_ADCDACCLKSOURCE_SYSCLK,
            RCC_ADCDACCLKSOURCE_PLL2,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCDACSEL {
                return switch (self) {
                    .RCC_ADCDACCLKSOURCE_SYSCLK => .SYS,
                    .RCC_ADCDACCLKSOURCE_HCLK => .HCLK1,
                    .RCC_ADCDACCLKSOURCE_HSI => .HSI,
                    .RCC_ADCDACCLKSOURCE_HSE => .HSE,
                    .RCC_ADCDACCLKSOURCE_MSIK => .MSIK,
                    .RCC_ADCDACCLKSOURCE_PLL2 => .PLL2_R,
                };
            }
            pub fn from_enum(item: RCC_ADCDACSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_ADCDACCLKSOURCE_SYSCLK,
                    .HCLK1 => .RCC_ADCDACCLKSOURCE_HCLK,
                    .HSI => .RCC_ADCDACCLKSOURCE_HSI,
                    .HSE => .RCC_ADCDACCLKSOURCE_HSE,
                    .MSIK => .RCC_ADCDACCLKSOURCE_MSIK,
                    .PLL2_R => .RCC_ADCDACCLKSOURCE_PLL2,
                };
            }
        };

        pub const CK48CLockSelectionList = enum {
            RCC_CLK48CLKSOURCE_PLL2,
            RCC_CLK48CLKSOURCE_PLL1,
            RCC_CLK48CLKSOURCE_MSIK,
            RCC_CLK48CLKSOURCE_HSI48,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_CLK48CLKSOURCE_PLL2 => .LSE,
                    .RCC_CLK48CLKSOURCE_HSI48 => .HSI,
                    .RCC_CLK48CLKSOURCE_PLL1 => .LSI,
                    .RCC_CLK48CLKSOURCE_MSIK => .MSIK,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_CLK48CLKSOURCE_PLL2,
                    .HSI => .RCC_CLK48CLKSOURCE_HSI48,
                    .LSI => .RCC_CLK48CLKSOURCE_PLL1,
                    .MSIK => .RCC_CLK48CLKSOURCE_MSIK,
                };
            }
        };

        pub const SDMMCClockSelectionList = enum {
            RCC_SDMMCCLKSOURCE_PLL1,
            RCC_SDMMCCLKSOURCE_CLK48,

            pub fn to_enum(self: @This()) anyerror!RCC_SDMMCSEL {
                return switch (self) {
                    .RCC_SDMMCCLKSOURCE_PLL1 => .PLL1_P,
                    .RCC_SDMMCCLKSOURCE_CLK48 => .ICLK,
                };
            }
            pub fn from_enum(item: RCC_SDMMCSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_SDMMCCLKSOURCE_PLL1,
                    .ICLK => .RCC_SDMMCCLKSOURCE_CLK48,
                };
            }
        };

        pub const FDCANClockSelectionList = enum {
            RCC_FDCAN1CLKSOURCE_PLL1,
            RCC_FDCAN1CLKSOURCE_PLL2,
            RCC_FDCAN1CLKSOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_FDCANSEL {
                return switch (self) {
                    .RCC_FDCAN1CLKSOURCE_HSE => .HSE,
                    .RCC_FDCAN1CLKSOURCE_PLL1 => .PLL1_Q,
                    .RCC_FDCAN1CLKSOURCE_PLL2 => .PLL2_P,
                };
            }
            pub fn from_enum(item: RCC_FDCANSEL) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_FDCAN1CLKSOURCE_HSE,
                    .PLL1_Q => .RCC_FDCAN1CLKSOURCE_PLL1,
                    .PLL2_P => .RCC_FDCAN1CLKSOURCE_PLL2,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
            RCC_I2C1CLKSOURCE_HSI,
            RCC_I2C1CLKSOURCE_MSIK,
            RCC_I2C1CLKSOURCE_PCLK1,
            RCC_I2C1CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C1CLKSOURCE_MSIK => .MSIK,
                    .RCC_I2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_I2C1CLKSOURCE_PCLK1,
                    .MSIK => .RCC_I2C1CLKSOURCE_MSIK,
                    .SYS => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
                };
            }
        };

        pub const I2C2CLockSelectionList = enum {
            RCC_I2C2CLKSOURCE_HSI,
            RCC_I2C2CLKSOURCE_MSIK,
            RCC_I2C2CLKSOURCE_PCLK1,
            RCC_I2C2CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                    .RCC_I2C2CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C2CLKSOURCE_MSIK => .MSIK,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_I2C2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C2CLKSOURCE_HSI,
                    .PCLK1 => .RCC_I2C2CLKSOURCE_PCLK1,
                    .MSIK => .RCC_I2C2CLKSOURCE_MSIK,
                };
            }
        };

        pub const I2C3CLockSelectionList = enum {
            RCC_I2C3CLKSOURCE_HSI,
            RCC_I2C3CLKSOURCE_MSIK,
            RCC_I2C3CLKSOURCE_PCLK3,
            RCC_I2C3CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C3SEL {
                return switch (self) {
                    .RCC_I2C3CLKSOURCE_MSIK => .MSIK,
                    .RCC_I2C3CLKSOURCE_HSI => .HSI,
                    .RCC_I2C3CLKSOURCE_PCLK3 => .PCLK3,
                    .RCC_I2C3CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_I2C3SEL) anyerror!@This() {
                return switch (item) {
                    .MSIK => .RCC_I2C3CLKSOURCE_MSIK,
                    .HSI => .RCC_I2C3CLKSOURCE_HSI,
                    .PCLK3 => .RCC_I2C3CLKSOURCE_PCLK3,
                    .SYS => .RCC_I2C3CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const SAI1CLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_HSI,
            RCC_SAI1CLKSOURCE_PLL2,
            RCC_SAI1CLKSOURCE_PLL3,
            RCC_SAI1CLKSOURCE_PLL1,
            RCC_SAI1CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PIN => .AUDIOCLK,
                    .RCC_SAI1CLKSOURCE_PLL1 => .PLL1_P,
                    .RCC_SAI1CLKSOURCE_PLL3 => .PLL3_P,
                    .RCC_SAI1CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .AUDIOCLK => .RCC_SAI1CLKSOURCE_PIN,
                    .PLL1_P => .RCC_SAI1CLKSOURCE_PLL1,
                    .PLL3_P => .RCC_SAI1CLKSOURCE_PLL3,
                    .PLL2_P => .RCC_SAI1CLKSOURCE_PLL2,
                    .HSI => .RCC_SAI1CLKSOURCE_HSI,
                };
            }
        };

        pub const SAI2CLockSelectionList = enum {
            RCC_SAI2CLKSOURCE_HSI,
            RCC_SAI2CLKSOURCE_PLL2,
            RCC_SAI2CLKSOURCE_PLL3,
            RCC_SAI2CLKSOURCE_PLL1,
            RCC_SAI2CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SAI2CLKSOURCE_PLL2 => .PLL2_P,
                    .RCC_SAI2CLKSOURCE_PLL1 => .PLL1_P,
                    .RCC_SAI2CLKSOURCE_PLL3 => .PLL3_P,
                    .RCC_SAI2CLKSOURCE_HSI => .HSI,
                    .RCC_SAI2CLKSOURCE_PIN => .AUDIOCLK,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_P => .RCC_SAI2CLKSOURCE_PLL2,
                    .PLL1_P => .RCC_SAI2CLKSOURCE_PLL1,
                    .PLL3_P => .RCC_SAI2CLKSOURCE_PLL3,
                    .HSI => .RCC_SAI2CLKSOURCE_HSI,
                    .AUDIOCLK => .RCC_SAI2CLKSOURCE_PIN,
                };
            }
        };

        pub const I2C4CLockSelectionList = enum {
            RCC_I2C4CLKSOURCE_HSI,
            RCC_I2C4CLKSOURCE_MSIK,
            RCC_I2C4CLKSOURCE_PCLK1,
            RCC_I2C4CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_I2CSEL {
                return switch (self) {
                    .RCC_I2C4CLKSOURCE_MSIK => .MSIK,
                    .RCC_I2C4CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C4CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_I2C4CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_I2CSEL) anyerror!@This() {
                return switch (item) {
                    .MSIK => .RCC_I2C4CLKSOURCE_MSIK,
                    .SYS => .RCC_I2C4CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2C4CLKSOURCE_PCLK1,
                    .HSI => .RCC_I2C4CLKSOURCE_HSI,
                };
            }
        };

        pub const MdfClockSelectionList = enum {
            RCC_MDF1CLKSOURCE_MSIK,
            RCC_MDF1CLKSOURCE_HCLK,
            RCC_MDF1CLKSOURCE_PLL1,
            RCC_MDF1CLKSOURCE_PLL3,
            RCC_MDF1CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_MDFSEL {
                return switch (self) {
                    .RCC_MDF1CLKSOURCE_HCLK => .HCLK1,
                    .RCC_MDF1CLKSOURCE_PIN => .AUDIOCLK,
                    .RCC_MDF1CLKSOURCE_PLL1 => .PLL1_P,
                    .RCC_MDF1CLKSOURCE_MSIK => .MSIK,
                    .RCC_MDF1CLKSOURCE_PLL3 => .PLL3_Q,
                };
            }
            pub fn from_enum(item: RCC_MDFSEL) anyerror!@This() {
                return switch (item) {
                    .HCLK1 => .RCC_MDF1CLKSOURCE_HCLK,
                    .AUDIOCLK => .RCC_MDF1CLKSOURCE_PIN,
                    .PLL1_P => .RCC_MDF1CLKSOURCE_PLL1,
                    .MSIK => .RCC_MDF1CLKSOURCE_MSIK,
                    .PLL3_Q => .RCC_MDF1CLKSOURCE_PLL3,
                };
            }
        };

        pub const AdfClockSelectionList = enum {
            RCC_ADF1CLKSOURCE_MSIK,
            RCC_ADF1CLKSOURCE_HCLK,
            RCC_ADF1CLKSOURCE_PLL1,
            RCC_ADF1CLKSOURCE_PLL3,
            RCC_ADF1CLKSOURCE_PIN,

            pub fn to_enum(self: @This()) anyerror!RCC_ADFSEL {
                return switch (self) {
                    .RCC_ADF1CLKSOURCE_HCLK => .HCLK3,
                    .RCC_ADF1CLKSOURCE_PLL1 => .PLL1_P,
                    .RCC_ADF1CLKSOURCE_PIN => .AUDIOCLK,
                    .RCC_ADF1CLKSOURCE_MSIK => .MSIK,
                    .RCC_ADF1CLKSOURCE_PLL3 => .PLL3_Q,
                };
            }
            pub fn from_enum(item: RCC_ADFSEL) anyerror!@This() {
                return switch (item) {
                    .HCLK3 => .RCC_ADF1CLKSOURCE_HCLK,
                    .PLL1_P => .RCC_ADF1CLKSOURCE_PLL1,
                    .AUDIOCLK => .RCC_ADF1CLKSOURCE_PIN,
                    .MSIK => .RCC_ADF1CLKSOURCE_MSIK,
                    .PLL3_Q => .RCC_ADF1CLKSOURCE_PLL3,
                };
            }
        };

        pub const OCTOSPIMCLockSelectionList = enum {
            RCC_OSPICLKSOURCE_MSIK,
            RCC_OSPICLKSOURCE_SYSCLK,
            RCC_OSPICLKSOURCE_PLL1,
            RCC_OSPICLKSOURCE_PLL2,

            pub fn to_enum(self: @This()) anyerror!RCC_OCTOSPISEL {
                return switch (self) {
                    .RCC_OSPICLKSOURCE_PLL2 => .PLL2_Q,
                    .RCC_OSPICLKSOURCE_PLL1 => .PLL1_Q,
                    .RCC_OSPICLKSOURCE_SYSCLK => .SYS,
                    .RCC_OSPICLKSOURCE_MSIK => .MSIK,
                };
            }
            pub fn from_enum(item: RCC_OCTOSPISEL) anyerror!@This() {
                return switch (item) {
                    .PLL2_Q => .RCC_OSPICLKSOURCE_PLL2,
                    .PLL1_Q => .RCC_OSPICLKSOURCE_PLL1,
                    .SYS => .RCC_OSPICLKSOURCE_SYSCLK,
                    .MSIK => .RCC_OSPICLKSOURCE_MSIK,
                };
            }
        };

        pub const LPTIM3CLockSelectionVirtualList = enum {
            RCC_LPTIM34CLKSOURCE_MSIK,
            RCC_LPTIM34CLKSOURCE_LSI,
            RCC_LPTIM34CLKSOURCE_HSI,
            RCC_LPTIM34CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPTIM34CLKSOURCE_LSE => .LSE,
                    .RCC_LPTIM34CLKSOURCE_MSIK => .MSIK,
                    .RCC_LPTIM34CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM34CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_LPTIM34CLKSOURCE_LSE,
                    .MSIK => .RCC_LPTIM34CLKSOURCE_MSIK,
                    .LSI => .RCC_LPTIM34CLKSOURCE_LSI,
                    .HSI => .RCC_LPTIM34CLKSOURCE_HSI,
                };
            }
        };

        pub const RNGCLockSelectionList = enum {
            RCC_RNGCLKSOURCE_HSI,
            RCC_RNGCLKSOURCE_HSI48,
            RCC_RNGCLKSOURCE_HSI48_DIV2,

            pub fn to_enum(self: @This()) anyerror!RCC_RNGSEL {
                return switch (self) {
                    .RCC_RNGCLKSOURCE_HSI => .HSI,
                    .RCC_RNGCLKSOURCE_HSI48_DIV2 => .HSI48_DIV_2,
                    .RCC_RNGCLKSOURCE_HSI48 => .HSI48,
                };
            }
            pub fn from_enum(item: RCC_RNGSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_RNGCLKSOURCE_HSI,
                    .HSI48_DIV_2 => .RCC_RNGCLKSOURCE_HSI48_DIV2,
                    .HSI48 => .RCC_RNGCLKSOURCE_HSI48,
                };
            }
        };

        pub const RCC_MCO1SourceVirtualList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_MSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_PLL1CLK,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_HSI48,
            RCC_MCO1SOURCE_MSIK,
            RCC_MCO1SOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_MSIK => .MSIK,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_MSI => .MSIS,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                    .RCC_MCO1SOURCE_HSI48 => .HSI48,
                    .RCC_MCO1SOURCE_PLL1CLK => .PLL1_R,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .MSIK => .RCC_MCO1SOURCE_MSIK,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .MSIS => .RCC_MCO1SOURCE_MSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                    .HSI48 => .RCC_MCO1SOURCE_HSI48,
                    .PLL1_R => .RCC_MCO1SOURCE_PLL1CLK,
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

        pub const LSCOSource1VirtualList = enum {
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

        pub const CortexCLockSelectionVirtualList = enum {
            SYSTICK_CLKSOURCE_HCLK_1_8,
            SYSTICK_CLKSOURCE_LSI,
            SYSTICK_CLKSOURCE_LSE,
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

        pub const APB3CLKDividerList = enum {
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

        pub const SPI1CLockSelectionList = enum {
            RCC_SPI1CLKSOURCE_HSI,
            RCC_SPI1CLKSOURCE_MSIK,
            RCC_SPI1CLKSOURCE_PCLK2,
            RCC_SPI1CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI1SEL {
                return switch (self) {
                    .RCC_SPI1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_SPI1CLKSOURCE_HSI => .HSI,
                    .RCC_SPI1CLKSOURCE_MSIK => .MSIK,
                    .RCC_SPI1CLKSOURCE_PCLK2 => .PCLK2,
                };
            }
            pub fn from_enum(item: RCC_SPI1SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_SPI1CLKSOURCE_SYSCLK,
                    .HSI => .RCC_SPI1CLKSOURCE_HSI,
                    .MSIK => .RCC_SPI1CLKSOURCE_MSIK,
                    .PCLK2 => .RCC_SPI1CLKSOURCE_PCLK2,
                };
            }
        };

        pub const SPI3CLockSelectionList = enum {
            RCC_SPI3CLKSOURCE_HSI,
            RCC_SPI3CLKSOURCE_MSIK,
            RCC_SPI3CLKSOURCE_PCLK3,
            RCC_SPI3CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI3SEL {
                return switch (self) {
                    .RCC_SPI3CLKSOURCE_HSI => .HSI,
                    .RCC_SPI3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_SPI3CLKSOURCE_MSIK => .MSIK,
                    .RCC_SPI3CLKSOURCE_PCLK3 => .PCLK3,
                };
            }
            pub fn from_enum(item: RCC_SPI3SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SPI3CLKSOURCE_HSI,
                    .SYS => .RCC_SPI3CLKSOURCE_SYSCLK,
                    .MSIK => .RCC_SPI3CLKSOURCE_MSIK,
                    .PCLK3 => .RCC_SPI3CLKSOURCE_PCLK3,
                };
            }
        };

        pub const SPI2CLockSelectionList = enum {
            RCC_SPI2CLKSOURCE_HSI,
            RCC_SPI2CLKSOURCE_MSIK,
            RCC_SPI2CLKSOURCE_PCLK1,
            RCC_SPI2CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SPI2SEL {
                return switch (self) {
                    .RCC_SPI2CLKSOURCE_HSI => .HSI,
                    .RCC_SPI2CLKSOURCE_MSIK => .MSIK,
                    .RCC_SPI2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_SPI2CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_SPI2SEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SPI2CLKSOURCE_HSI,
                    .MSIK => .RCC_SPI2CLKSOURCE_MSIK,
                    .SYS => .RCC_SPI2CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_SPI2CLKSOURCE_PCLK1,
                };
            }
        };

        pub const PLL1RList = enum {
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
                    .@"1" => .Div1,
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
                    .Div1 => .@"1",
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
                        .{ "RCC_PLLDIV", @tagName(item), "PLL1R" },
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

        pub const FLatencyList = enum {
            FLASH_LATENCY_4,
            FLASH_LATENCY_1,
            FLASH_LATENCY_0,
            FLASH_LATENCY_2,
            FLASH_LATENCY_3,
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE4,
            PWR_REGULATOR_VOLTAGE_SCALE3,
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE1,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE4 => .Range4,
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .Range1,
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .Range2,
                    .PWR_REGULATOR_VOLTAGE_SCALE3 => .Range3,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .Range4 => .PWR_REGULATOR_VOLTAGE_SCALE4,
                    .Range1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .Range2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .Range3 => .PWR_REGULATOR_VOLTAGE_SCALE3,
                };
            }
        };

        pub const MSIAutoCalibrationList = enum {
            PLLMODE_MSIS,
            PLLMODE_MSIK,
            DISABLED,
        };

        pub const MSIPLLFASTList = enum {
            true,
            false,
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

        pub const PLL1MBOOSTList = enum {
            RCC_PLLMBOOST_DIV1,
            RCC_PLLMBOOST_DIV2,
            RCC_PLLMBOOST_DIV4,
            RCC_PLLMBOOST_DIV6,
            RCC_PLLMBOOST_DIV8,
            RCC_PLLMBOOST_DIV10,
            RCC_PLLMBOOST_DIV12,
            RCC_PLLMBOOST_DIV14,
            RCC_PLLMBOOST_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLMBOOST {
                return switch (self) {
                    .RCC_PLLMBOOST_DIV2 => .Div2,
                    .RCC_PLLMBOOST_DIV1 => .Div1,
                    .RCC_PLLMBOOST_DIV8 => .Div8,
                    .RCC_PLLMBOOST_DIV10 => .Div10,
                    .RCC_PLLMBOOST_DIV4 => .Div4,
                    .RCC_PLLMBOOST_DIV6 => .Div6,
                    .RCC_PLLMBOOST_DIV14 => .Div14,
                    .RCC_PLLMBOOST_DIV12 => .Div12,
                    .RCC_PLLMBOOST_DIV16 => .Div16,
                };
            }
            pub fn from_enum(item: RCC_PLLMBOOST) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLMBOOST_DIV2,
                    .Div1 => .RCC_PLLMBOOST_DIV1,
                    .Div8 => .RCC_PLLMBOOST_DIV8,
                    .Div10 => .RCC_PLLMBOOST_DIV10,
                    .Div4 => .RCC_PLLMBOOST_DIV4,
                    .Div6 => .RCC_PLLMBOOST_DIV6,
                    .Div14 => .RCC_PLLMBOOST_DIV14,
                    .Div12 => .RCC_PLLMBOOST_DIV12,
                    .Div16 => .RCC_PLLMBOOST_DIV16,
                };
            }
        };

        pub const PLL1_VCI_RangeList = enum {
            RCC_PLLVCIRANGE_0,
            RCC_PLLVCIRANGE_1,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLLVCIRANGE_1 => .FREQ_8TO16MHZ,
                    .RCC_PLLVCIRANGE_0 => .FREQ_4TO8MHZ,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .FREQ_8TO16MHZ => .RCC_PLLVCIRANGE_1,
                    .FREQ_4TO8MHZ => .RCC_PLLVCIRANGE_0,
                };
            }
        };

        pub const PLL2_VCI_RangeList = enum {
            RCC_PLLVCIRANGE_0,
            RCC_PLLVCIRANGE_1,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLLVCIRANGE_1 => .FREQ_8TO16MHZ,
                    .RCC_PLLVCIRANGE_0 => .FREQ_4TO8MHZ,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .FREQ_8TO16MHZ => .RCC_PLLVCIRANGE_1,
                    .FREQ_4TO8MHZ => .RCC_PLLVCIRANGE_0,
                };
            }
        };

        pub const PLL3_VCI_RangeList = enum {
            RCC_PLLVCIRANGE_0,
            RCC_PLLVCIRANGE_1,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLLVCIRANGE_1 => .FREQ_8TO16MHZ,
                    .RCC_PLLVCIRANGE_0 => .FREQ_4TO8MHZ,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .FREQ_8TO16MHZ => .RCC_PLLVCIRANGE_1,
                    .FREQ_4TO8MHZ => .RCC_PLLVCIRANGE_0,
                };
            }
        };

        pub const MSIKERONList = enum {
            true,
            false,
        };

        pub const HSIKERONList = enum {
            true,
            false,
        };

        pub const EnableCRSList = enum {
            true,
            false,
        };

        pub const RNGEnableLPBAMList = enum {
            true,
            false,
        };

        pub const MCOEnableList = enum {
            true,
            false,
        };

        pub const SDMMCEnableLPBAMList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const EnableSAESList = enum {
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

        pub const notInLPBAMList = enum {
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

        pub const DACEnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const SDMMCEnableList = enum {
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

        pub const MDF1EnableList = enum {
            true,
            false,
        };

        pub const ADF1EnableList = enum {
            true,
            false,
        };

        pub const OCTOSPIMEnableList = enum {
            true,
            false,
        };

        pub const LPTIM3EnableList = enum {
            true,
            false,
        };

        pub const RNGEnableList = enum {
            true,
            false,
        };

        pub const LSCOEnableList = enum {
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

        pub const SAI1EnableLPBAMList = enum {
            true,
            false,
        };

        pub const SAI2EnableLPBAMList = enum {
            true,
            false,
        };

        pub const MDF1EnableLPBAMList = enum {
            true,
            false,
        };

        pub const ADF1EnableLPBAMList = enum {
            true,
            false,
        };

        pub const FDCANEnableLPBAMList = enum {
            true,
            false,
        };

        pub const OCTOSPIMEnableLPBAMList = enum {
            true,
            false,
        };

        pub const ADCEnableLPBAMList = enum {
            true,
            false,
        };

        pub const DACEnableLPBAMList = enum {
            true,
            false,
        };

        pub const LSEStateList = enum {
            RCC_LSE_BYPASS_RTC_ONLY,
            RCC_LSE_ON_RTC_ONLY,
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
            HSEDIGByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            LSEByPassRTC: bool = false,
            LSEOscillatorRTC: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
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
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC4: bool = false,
            ADCUsed_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            OCTOSPI1Used_ForRCC: bool = false,
            OCTOSPI2Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            LPTIM4Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            notUsed: bool = false,
            LPTIM1_Used: bool = false,
            LPTIM3_Used: bool = false,
            LPTIM4_Used: bool = false,
            LPTIM2_Used: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            EnableCSS: bool = false,
            UCPD1_Used: bool = false,
            SAES_Used: bool = false,
            MDF1_Used: bool = false,
            ADF1_Used: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEDIGByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            LSEByPassRTC: bool = false,
            LSEOscillatorRTC: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            CRSActivatedSourceGPIO: bool = false,
            CRSActivatedSourceLSE: bool = false,
            CRSActivatedSourceUSB: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
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
            USE_ADC1: bool = false,
            ADC1UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC2: bool = false,
            ADC2UsedAsynchronousCLK_ForRCC: bool = false,
            USE_ADC4: bool = false,
            ADCUsed_ForRCC: bool = false,
            FDCAN1Used_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            SAI2_SAIBUsed_ForRCC: bool = false,
            SAI2_SAIAUsed_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            OCTOSPI1Used_ForRCC: bool = false,
            OCTOSPI2Used_ForRCC: bool = false,
            LPTIM3Used_ForRCC: bool = false,
            LPTIM4Used_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            SPI2Used_ForRCC: bool = false,
            notUsed: bool = false,
            LPTIM1_Used: bool = false,
            LPTIM3_Used: bool = false,
            LPTIM4_Used: bool = false,
            LPTIM2_Used: bool = false,
            SWPMI1Used_ForRCC: bool = false,
            EnableCSS: bool = false,
            UCPD1_Used: bool = false,
            SAES_Used: bool = false,
            MDF1_Used: bool = false,
            ADF1_Used: bool = false,
            MSIPLLFAST: bool = false, //Reference flag
            MSIKERON: bool = false, //Reference flag
            HSIKERON: bool = false, //Reference flag
            EnableCRS: bool = false, //Reference flag
            RNGEnableLPBAM: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            SDMMCEnableLPBAM: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            EnableSAES: bool = false, //Reference flag
            LSIEnable: bool = false, //Reference flag
            EnableExtClockForSAI1: bool = false, //Reference flag
            notInLPBAM: bool = false, //Reference flag
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
            DACEnable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            SDMMCEnable: bool = false, //Reference flag
            FDCANEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            SAI2Enable: bool = false, //Reference flag
            I2C4Enable: bool = false, //Reference flag
            MDF1Enable: bool = false, //Reference flag
            ADF1Enable: bool = false, //Reference flag
            OCTOSPIMEnable: bool = false, //Reference flag
            LPTIM3Enable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            UCPDEnable: bool = false, //Reference flag
            SPI1Enable: bool = false, //Reference flag
            SPI3Enable: bool = false, //Reference flag
            SPI2Enable: bool = false, //Reference flag
            SAI1EnableLPBAM: bool = false, //Reference flag
            SAI2EnableLPBAM: bool = false, //Reference flag
            MDF1EnableLPBAM: bool = false, //Reference flag
            ADF1EnableLPBAM: bool = false, //Reference flag
            FDCANEnableLPBAM: bool = false, //Reference flag
            OCTOSPIMEnableLPBAM: bool = false, //Reference flag
            ADCEnableLPBAM: bool = false, //Reference flag
            DACEnableLPBAM: bool = false, //Reference flag
            PLL1PUsed: bool = false, //Reference flag
            PLL1QUsed: bool = false, //Reference flag
            PLL2PUsed: bool = false, //Reference flag
            PLL2QUsed: bool = false, //Reference flag
            PLL2RUsed: bool = false, //Reference flag
            PLL3PUsed: bool = false, //Reference flag
            PLL3QUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            PLL2Used: bool = false, //Reference flag
            PLL3Used: bool = false, //Reference flag
            FullHSI48Used: bool = false, //Reference flag
            MSIKUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag
            HSI48Used: bool = false, //Reference flag
            PLL1RUsed: bool = false, //Reference flag
            MSIUsed: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            MSIPLLFAST: ?MSIPLLFASTList = null,
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
            PLL1MBOOST: ?PLL1MBOOSTList = null,
            MSIKERON: ?MSIKERONList = null,
            HSIKERON: ?HSIKERONList = null,
            LSEState: ?LSEStateList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            SAESSource: ?SAESSourceList = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSIDIV: ?LSIDIVList = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?MSIClockRangeList = null,
            MSIKClockRange: ?MSIKClockRangeList = null,
            RCC_Stop_WakeUpClock: ?RCC_Stop_WakeUpClockList = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLL2Source: ?PLL2SourceList = null,
            PLL3Source: ?PLL3SourceList = null,
            PLLM: ?u32 = null,
            PLL2M: ?u32 = null,
            PLL3M: ?u32 = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelectionVirtual: ?USART1CLockSelectionVirtualList = null,
            USART2CLockSelectionVirtual: ?USART2CLockSelectionVirtualList = null,
            USART3CLockSelectionVirtual: ?USART3CLockSelectionVirtualList = null,
            UART4CLockSelectionVirtual: ?UART4CLockSelectionVirtualList = null,
            UART5CLockSelectionVirtual: ?UART5CLockSelectionVirtualList = null,
            LPUART1CLockSelectionVirtual: ?LPUART1CLockSelectionVirtualList = null,
            LPTIM1CLockSelectionVirtual: ?LPTIM1CLockSelectionVirtualList = null,
            LPTIM2CLockSelectionVirtual: ?LPTIM2CLockSelectionVirtualList = null,
            DACCLockSelectionVirtual: ?DACCLockSelectionVirtualList = null,
            ADCCLockSelection: ?ADCCLockSelectionList = null,
            CK48CLockSelection: ?CK48CLockSelectionList = null,
            SDMMCClockSelection: ?SDMMCClockSelectionList = null,
            FDCANClockSelection: ?FDCANClockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C2CLockSelection: ?I2C2CLockSelectionList = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
            SAI2CLockSelection: ?SAI2CLockSelectionList = null,
            I2C4CLockSelection: ?I2C4CLockSelectionList = null,
            MdfClockSelection: ?MdfClockSelectionList = null,
            AdfClockSelection: ?AdfClockSelectionList = null,
            OCTOSPIMCLockSelection: ?OCTOSPIMCLockSelectionList = null,
            LPTIM3CLockSelectionVirtual: ?LPTIM3CLockSelectionVirtualList = null,
            RNGCLockSelection: ?RNGCLockSelectionList = null,
            RCC_MCO1SourceVirtual: ?RCC_MCO1SourceVirtualList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            LSCOSource1Virtual: ?LSCOSource1VirtualList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            CortexCLockSelectionVirtual: ?CortexCLockSelectionVirtualList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            APB3CLKDivider: ?APB3CLKDividerList = null,
            SPI1CLockSelection: ?SPI1CLockSelectionList = null,
            SPI3CLockSelection: ?SPI3CLockSelectionList = null,
            SPI2CLockSelection: ?SPI2CLockSelectionList = null,
            PLLN: ?u32 = null,
            PLLFRACN: ?u32 = null,
            PLL1P: ?u32 = null,
            PLL1Q: ?u32 = null,
            PLL1R: ?PLL1RList = null,
            PLL2N: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            PLL2P: ?u32 = null,
            PLL2Q: ?u32 = null,
            PLL2R: ?u32 = null,
            PLL3N: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            PLL3P: ?u32 = null,
            PLL3Q: ?u32 = null,
            PLL3R: ?u32 = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            SHSIDiv: u32,
            SAESSource: SAESSourceList,
            LSIDIV: LSIDIVList,
            MSIClockRange: MSIClockRangeList,
            MSIKClockRange: MSIKClockRangeList,
            RCC_Stop_WakeUpClock: RCC_Stop_WakeUpClockList,
            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLL2Source: PLL2SourceList,
            PLL3Source: PLL3SourceList,
            PLLM: u32,
            PLL2M: u32,
            PLL3M: u32,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelectionVirtual: USART1CLockSelectionVirtualList,
            USART2CLockSelectionVirtual: USART2CLockSelectionVirtualList,
            USART3CLockSelectionVirtual: USART3CLockSelectionVirtualList,
            UART4CLockSelectionVirtual: UART4CLockSelectionVirtualList,
            UART5CLockSelectionVirtual: UART5CLockSelectionVirtualList,
            LPUART1CLockSelectionVirtual: LPUART1CLockSelectionVirtualList,
            LPTIM1CLockSelectionVirtual: LPTIM1CLockSelectionVirtualList,
            LPTIM2CLockSelectionVirtual: LPTIM2CLockSelectionVirtualList,
            DACCLockSelectionVirtual: DACCLockSelectionVirtualList,
            ADCCLockSelection: ADCCLockSelectionList,
            CK48CLockSelection: CK48CLockSelectionList,
            SDMMCClockSelection: SDMMCClockSelectionList,
            FDCANClockSelection: FDCANClockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C2CLockSelection: I2C2CLockSelectionList,
            I2C3CLockSelection: I2C3CLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
            SAI2CLockSelection: SAI2CLockSelectionList,
            I2C4CLockSelection: I2C4CLockSelectionList,
            MdfClockSelection: MdfClockSelectionList,
            AdfClockSelection: AdfClockSelectionList,
            OCTOSPIMCLockSelection: OCTOSPIMCLockSelectionList,
            LPTIM3CLockSelectionVirtual: LPTIM3CLockSelectionVirtualList,
            HSI48DivToRNG: u32,
            RNGCLockSelection: RNGCLockSelectionList,
            RCC_MCO1SourceVirtual: RCC_MCO1SourceVirtualList,
            RCC_MCODiv: RCC_MCODivList,
            LSCOSource1Virtual: LSCOSource1VirtualList,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: Cortex_DivList,
            CortexCLockSelectionVirtual: CortexCLockSelectionVirtualList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB3CLKDivider: APB3CLKDividerList,
            APB2TimCLKDivider: u32,
            SPI1CLockSelection: SPI1CLockSelectionList,
            SPI3CLockSelection: SPI3CLockSelectionList,
            SPI2CLockSelection: SPI2CLockSelectionList,
            PLLN: u32,
            PLL1P: u32,
            PLL1Q: u32,
            PLL1R: PLL1RList,
            PLL2N: u32,
            PLL2P: u32,
            PLL2Q: u32,
            PLL2R: u32,
            PLL3N: u32,
            PLL3P: u32,
            PLL3Q: u32,
            PLL3R: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList,
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
            PLL1MBOOST: ?PLL1MBOOSTList,
            PLL1_VCI_Range: ?PLL1_VCI_RangeList,
            PLL2_VCI_Range: ?PLL2_VCI_RangeList,
            PLL3_VCI_Range: ?PLL3_VCI_RangeList,
            MSISUsed: u32,
            LSEState: LSEStateList,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            MSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
            MSIAutoCalibration: ?MSIAutoCalibrationList = null,
            MSIPLLFAST: ?MSIPLLFASTList = null,
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
            PLL1MBOOST: ?RCC_PLLMBOOST = null,
            MSIKERON: ?MSIKERONList = null,
            HSIKERON: ?HSIKERONList = null,
            LSEState: ?LSEStateList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .FLatency = self.FLatency,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .MSICalibrationValue = self.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .MSIAutoCalibration = self.MSIAutoCalibration,
                    .MSIPLLFAST = self.MSIPLLFAST,
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
                    .PLL1MBOOST = if (self.PLL1MBOOST) |val| try PLL1MBOOSTList.from_enum(val) else null,
                    .MSIKERON = self.MSIKERON,
                    .HSIKERON = self.HSIKERON,
                    .LSEState = self.LSEState,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            SAESSource: ?RCC_SAESSEL = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSIDIV: ?RCC_LSIPREDIV = null,
            LSE_VALUE: ?f32 = null,
            MSIClockRange: ?RCC_MSIRANGE = null,
            MSIKClockRange: ?RCC_MSIRANGE = null,
            RCC_Stop_WakeUpClock: ?RCC_STOPWUCK = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLL2Source: ?RCC_PLLSRC = null,
            PLL3Source: ?RCC_PLLSRC = null,
            PLLM: ?u32 = null,
            PLL2M: ?u32 = null,
            PLL3M: ?u32 = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelectionVirtual: ?RCC_USART1SEL = null,
            USART2CLockSelectionVirtual: ?RCC_USARTSEL = null,
            USART3CLockSelectionVirtual: ?RCC_USARTSEL = null,
            UART4CLockSelectionVirtual: ?RCC_USARTSEL = null,
            UART5CLockSelectionVirtual: ?RCC_USARTSEL = null,
            LPUART1CLockSelectionVirtual: ?RCC_LPUSARTSEL = null,
            LPTIM1CLockSelectionVirtual: ?RCC_LPTIM2SEL = null,
            LPTIM2CLockSelectionVirtual: ?RCC_LPTIM2SEL = null,
            DACCLockSelectionVirtual: ?RCC_DACSEL = null,
            ADCCLockSelection: ?RCC_ADCDACSEL = null,
            CK48CLockSelection: ?RCC_LPTIMSEL = null,
            SDMMCClockSelection: ?RCC_SDMMCSEL = null,
            FDCANClockSelection: ?RCC_FDCANSEL = null,
            I2C1CLockSelection: ?RCC_I2CSEL = null,
            I2C2CLockSelection: ?RCC_I2CSEL = null,
            I2C3CLockSelection: ?RCC_I2C3SEL = null,
            SAI1CLockSelection: ?RCC_SAISEL = null,
            SAI2CLockSelection: ?RCC_SAISEL = null,
            I2C4CLockSelection: ?RCC_I2CSEL = null,
            MdfClockSelection: ?RCC_MDFSEL = null,
            AdfClockSelection: ?RCC_ADFSEL = null,
            OCTOSPIMCLockSelection: ?RCC_OCTOSPISEL = null,
            LPTIM3CLockSelectionVirtual: ?RCC_LPTIMSEL = null,
            RNGCLockSelection: ?RCC_RNGSEL = null,
            RCC_MCO1SourceVirtual: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            LSCOSource1Virtual: ?RCC_LSCOSEL = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            CortexCLockSelectionVirtual: ?CortexCLockSelectionVirtualList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            APB3CLKDivider: ?RCC_PPRE = null,
            SPI1CLockSelection: ?RCC_SPI1SEL = null,
            SPI3CLockSelection: ?RCC_SPI3SEL = null,
            SPI2CLockSelection: ?RCC_SPI2SEL = null,
            PLLN: ?u32 = null,
            PLLFRACN: ?u32 = null,
            PLL1P: ?u32 = null,
            PLL1Q: ?u32 = null,
            PLL1R: ?RCC_PLLDIV = null,
            PLL2N: ?u32 = null,
            PLL2FRACN: ?u32 = null,
            PLL2P: ?u32 = null,
            PLL2Q: ?u32 = null,
            PLL2R: ?u32 = null,
            PLL3N: ?u32 = null,
            PLL3FRACN: ?u32 = null,
            PLL3P: ?u32 = null,
            PLL3Q: ?u32 = null,
            PLL3R: ?u32 = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .SAESSource = if (self.SAESSource) |val| try SAESSourceList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSI_VALUE = self.LSI_VALUE,
                    .LSIDIV = if (self.LSIDIV) |val| try LSIDIVList.from_enum(val) else null,
                    .LSE_VALUE = self.LSE_VALUE,
                    .MSIClockRange = if (self.MSIClockRange) |val| try MSIClockRangeList.from_enum(val) else null,
                    .MSIKClockRange = if (self.MSIKClockRange) |val| try MSIKClockRangeList.from_enum(val) else null,
                    .RCC_Stop_WakeUpClock = if (self.RCC_Stop_WakeUpClock) |val| try RCC_Stop_WakeUpClockList.from_enum(val) else null,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLL2Source = if (self.PLL2Source) |val| try PLL2SourceList.from_enum(val) else null,
                    .PLL3Source = if (self.PLL3Source) |val| try PLL3SourceList.from_enum(val) else null,
                    .PLLM = self.PLLM,
                    .PLL2M = self.PLL2M,
                    .PLL3M = self.PLL3M,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelectionVirtual = if (self.USART1CLockSelectionVirtual) |val| try USART1CLockSelectionVirtualList.from_enum(val) else null,
                    .USART2CLockSelectionVirtual = if (self.USART2CLockSelectionVirtual) |val| try USART2CLockSelectionVirtualList.from_enum(val) else null,
                    .USART3CLockSelectionVirtual = if (self.USART3CLockSelectionVirtual) |val| try USART3CLockSelectionVirtualList.from_enum(val) else null,
                    .UART4CLockSelectionVirtual = if (self.UART4CLockSelectionVirtual) |val| try UART4CLockSelectionVirtualList.from_enum(val) else null,
                    .UART5CLockSelectionVirtual = if (self.UART5CLockSelectionVirtual) |val| try UART5CLockSelectionVirtualList.from_enum(val) else null,
                    .LPUART1CLockSelectionVirtual = if (self.LPUART1CLockSelectionVirtual) |val| try LPUART1CLockSelectionVirtualList.from_enum(val) else null,
                    .LPTIM1CLockSelectionVirtual = if (self.LPTIM1CLockSelectionVirtual) |val| try LPTIM1CLockSelectionVirtualList.from_enum(val) else null,
                    .LPTIM2CLockSelectionVirtual = if (self.LPTIM2CLockSelectionVirtual) |val| try LPTIM2CLockSelectionVirtualList.from_enum(val) else null,
                    .DACCLockSelectionVirtual = if (self.DACCLockSelectionVirtual) |val| try DACCLockSelectionVirtualList.from_enum(val) else null,
                    .ADCCLockSelection = if (self.ADCCLockSelection) |val| try ADCCLockSelectionList.from_enum(val) else null,
                    .CK48CLockSelection = if (self.CK48CLockSelection) |val| try CK48CLockSelectionList.from_enum(val) else null,
                    .SDMMCClockSelection = if (self.SDMMCClockSelection) |val| try SDMMCClockSelectionList.from_enum(val) else null,
                    .FDCANClockSelection = if (self.FDCANClockSelection) |val| try FDCANClockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C2CLockSelection = if (self.I2C2CLockSelection) |val| try I2C2CLockSelectionList.from_enum(val) else null,
                    .I2C3CLockSelection = if (self.I2C3CLockSelection) |val| try I2C3CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
                    .SAI2CLockSelection = if (self.SAI2CLockSelection) |val| try SAI2CLockSelectionList.from_enum(val) else null,
                    .I2C4CLockSelection = if (self.I2C4CLockSelection) |val| try I2C4CLockSelectionList.from_enum(val) else null,
                    .MdfClockSelection = if (self.MdfClockSelection) |val| try MdfClockSelectionList.from_enum(val) else null,
                    .AdfClockSelection = if (self.AdfClockSelection) |val| try AdfClockSelectionList.from_enum(val) else null,
                    .OCTOSPIMCLockSelection = if (self.OCTOSPIMCLockSelection) |val| try OCTOSPIMCLockSelectionList.from_enum(val) else null,
                    .LPTIM3CLockSelectionVirtual = if (self.LPTIM3CLockSelectionVirtual) |val| try LPTIM3CLockSelectionVirtualList.from_enum(val) else null,
                    .RNGCLockSelection = if (self.RNGCLockSelection) |val| try RNGCLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1SourceVirtual = if (self.RCC_MCO1SourceVirtual) |val| try RCC_MCO1SourceVirtualList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .LSCOSource1Virtual = if (self.LSCOSource1Virtual) |val| try LSCOSource1VirtualList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .CortexCLockSelectionVirtual = self.CortexCLockSelectionVirtual,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .APB3CLKDivider = if (self.APB3CLKDivider) |val| try APB3CLKDividerList.from_enum(val) else null,
                    .SPI1CLockSelection = if (self.SPI1CLockSelection) |val| try SPI1CLockSelectionList.from_enum(val) else null,
                    .SPI3CLockSelection = if (self.SPI3CLockSelection) |val| try SPI3CLockSelectionList.from_enum(val) else null,
                    .SPI2CLockSelection = if (self.SPI2CLockSelection) |val| try SPI2CLockSelectionList.from_enum(val) else null,
                    .PLLN = self.PLLN,
                    .PLLFRACN = self.PLLFRACN,
                    .PLL1P = self.PLL1P,
                    .PLL1Q = self.PLL1Q,
                    .PLL1R = if (self.PLL1R) |val| try PLL1RList.from_enum(val) else null,
                    .PLL2N = self.PLL2N,
                    .PLL2FRACN = self.PLL2FRACN,
                    .PLL2P = self.PLL2P,
                    .PLL2Q = self.PLL2Q,
                    .PLL2R = self.PLL2R,
                    .PLL3N = self.PLL3N,
                    .PLL3FRACN = self.PLL3FRACN,
                    .PLL3P = self.PLL3P,
                    .PLL3Q = self.PLL3Q,
                    .PLL3R = self.PLL3R,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            SHSIDiv: u32,
            SAESSource: RCC_SAESSEL,
            LSIDIV: RCC_LSIPREDIV,
            MSIClockRange: RCC_MSIRANGE,
            MSIKClockRange: RCC_MSIRANGE,
            RCC_Stop_WakeUpClock: RCC_STOPWUCK,
            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLL2Source: RCC_PLLSRC,
            PLL3Source: RCC_PLLSRC,
            PLLM: u32,
            PLL2M: u32,
            PLL3M: u32,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelectionVirtual: RCC_USART1SEL,
            USART2CLockSelectionVirtual: RCC_USARTSEL,
            USART3CLockSelectionVirtual: RCC_USARTSEL,
            UART4CLockSelectionVirtual: RCC_USARTSEL,
            UART5CLockSelectionVirtual: RCC_USARTSEL,
            LPUART1CLockSelectionVirtual: RCC_LPUSARTSEL,
            LPTIM1CLockSelectionVirtual: RCC_LPTIM2SEL,
            LPTIM2CLockSelectionVirtual: RCC_LPTIM2SEL,
            DACCLockSelectionVirtual: RCC_DACSEL,
            ADCCLockSelection: RCC_ADCDACSEL,
            CK48CLockSelection: RCC_LPTIMSEL,
            SDMMCClockSelection: RCC_SDMMCSEL,
            FDCANClockSelection: RCC_FDCANSEL,
            I2C1CLockSelection: RCC_I2CSEL,
            I2C2CLockSelection: RCC_I2CSEL,
            I2C3CLockSelection: RCC_I2C3SEL,
            SAI1CLockSelection: RCC_SAISEL,
            SAI2CLockSelection: RCC_SAISEL,
            I2C4CLockSelection: RCC_I2CSEL,
            MdfClockSelection: RCC_MDFSEL,
            AdfClockSelection: RCC_ADFSEL,
            OCTOSPIMCLockSelection: RCC_OCTOSPISEL,
            LPTIM3CLockSelectionVirtual: RCC_LPTIMSEL,
            HSI48DivToRNG: u32,
            RNGCLockSelection: RCC_RNGSEL,
            RCC_MCO1SourceVirtual: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            LSCOSource1Virtual: RCC_LSCOSEL,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            CortexCLockSelectionVirtual: CortexCLockSelectionVirtualList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB3CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            SPI1CLockSelection: RCC_SPI1SEL,
            SPI3CLockSelection: RCC_SPI3SEL,
            SPI2CLockSelection: RCC_SPI2SEL,
            PLLN: u32,
            PLL1P: u32,
            PLL1Q: u32,
            PLL1R: RCC_PLLDIV,
            PLL2N: u32,
            PLL2P: u32,
            PLL2Q: u32,
            PLL2R: u32,
            PLL3N: u32,
            PLL3P: u32,
            PLL3Q: u32,
            PLL3R: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            MSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS,
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
            PLL1MBOOST: ?RCC_PLLMBOOST,
            PLL1_VCI_Range: ?RCC_PLLRGE,
            PLL2_VCI_Range: ?RCC_PLLRGE,
            PLL3_VCI_Range: ?RCC_PLLRGE,
            MSISUsed: u32,
            LSEState: LSEStateList,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .SHSIDiv = cubemx_config.SHSIDiv,
                    .SAESSource = try cubemx_config.SAESSource.to_enum(),
                    .LSIDIV = try cubemx_config.LSIDIV.to_enum(),
                    .MSIClockRange = try cubemx_config.MSIClockRange.to_enum(),
                    .MSIKClockRange = try cubemx_config.MSIKClockRange.to_enum(),
                    .RCC_Stop_WakeUpClock = try cubemx_config.RCC_Stop_WakeUpClock.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLL2Source = try cubemx_config.PLL2Source.to_enum(),
                    .PLL3Source = try cubemx_config.PLL3Source.to_enum(),
                    .PLLM = cubemx_config.PLLM,
                    .PLL2M = cubemx_config.PLL2M,
                    .PLL3M = cubemx_config.PLL3M,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelectionVirtual = try cubemx_config.USART1CLockSelectionVirtual.to_enum(),
                    .USART2CLockSelectionVirtual = try cubemx_config.USART2CLockSelectionVirtual.to_enum(),
                    .USART3CLockSelectionVirtual = try cubemx_config.USART3CLockSelectionVirtual.to_enum(),
                    .UART4CLockSelectionVirtual = try cubemx_config.UART4CLockSelectionVirtual.to_enum(),
                    .UART5CLockSelectionVirtual = try cubemx_config.UART5CLockSelectionVirtual.to_enum(),
                    .LPUART1CLockSelectionVirtual = try cubemx_config.LPUART1CLockSelectionVirtual.to_enum(),
                    .LPTIM1CLockSelectionVirtual = try cubemx_config.LPTIM1CLockSelectionVirtual.to_enum(),
                    .LPTIM2CLockSelectionVirtual = try cubemx_config.LPTIM2CLockSelectionVirtual.to_enum(),
                    .DACCLockSelectionVirtual = try cubemx_config.DACCLockSelectionVirtual.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .CK48CLockSelection = try cubemx_config.CK48CLockSelection.to_enum(),
                    .SDMMCClockSelection = try cubemx_config.SDMMCClockSelection.to_enum(),
                    .FDCANClockSelection = try cubemx_config.FDCANClockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C2CLockSelection = try cubemx_config.I2C2CLockSelection.to_enum(),
                    .I2C3CLockSelection = try cubemx_config.I2C3CLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
                    .SAI2CLockSelection = try cubemx_config.SAI2CLockSelection.to_enum(),
                    .I2C4CLockSelection = try cubemx_config.I2C4CLockSelection.to_enum(),
                    .MdfClockSelection = try cubemx_config.MdfClockSelection.to_enum(),
                    .AdfClockSelection = try cubemx_config.AdfClockSelection.to_enum(),
                    .OCTOSPIMCLockSelection = try cubemx_config.OCTOSPIMCLockSelection.to_enum(),
                    .LPTIM3CLockSelectionVirtual = try cubemx_config.LPTIM3CLockSelectionVirtual.to_enum(),
                    .HSI48DivToRNG = cubemx_config.HSI48DivToRNG,
                    .RNGCLockSelection = try cubemx_config.RNGCLockSelection.to_enum(),
                    .RCC_MCO1SourceVirtual = try cubemx_config.RCC_MCO1SourceVirtual.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .LSCOSource1Virtual = try cubemx_config.LSCOSource1Virtual.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .CortexCLockSelectionVirtual = cubemx_config.CortexCLockSelectionVirtual,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB3CLKDivider = try cubemx_config.APB3CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .SPI1CLockSelection = try cubemx_config.SPI1CLockSelection.to_enum(),
                    .SPI3CLockSelection = try cubemx_config.SPI3CLockSelection.to_enum(),
                    .SPI2CLockSelection = try cubemx_config.SPI2CLockSelection.to_enum(),
                    .PLLN = cubemx_config.PLLN,
                    .PLL1P = cubemx_config.PLL1P,
                    .PLL1Q = cubemx_config.PLL1Q,
                    .PLL1R = try cubemx_config.PLL1R.to_enum(),
                    .PLL2N = cubemx_config.PLL2N,
                    .PLL2P = cubemx_config.PLL2P,
                    .PLL2Q = cubemx_config.PLL2Q,
                    .PLL2R = cubemx_config.PLL2R,
                    .PLL3N = cubemx_config.PLL3N,
                    .PLL3P = cubemx_config.PLL3P,
                    .PLL3Q = cubemx_config.PLL3Q,
                    .PLL3R = cubemx_config.PLL3R,
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .MSICalibrationValue = cubemx_config.MSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (cubemx_config.PWR_Regulator_Voltage_Scale) |val| try val.to_enum() else null,
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
                    .PLL1MBOOST = if (cubemx_config.PLL1MBOOST) |val| try val.to_enum() else null,
                    .PLL1_VCI_Range = if (cubemx_config.PLL1_VCI_Range) |val| try val.to_enum() else null,
                    .PLL2_VCI_Range = if (cubemx_config.PLL2_VCI_Range) |val| try val.to_enum() else null,
                    .PLL3_VCI_Range = if (cubemx_config.PLL3_VCI_Range) |val| try val.to_enum() else null,
                    .MSISUsed = cubemx_config.MSISUsed,
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
            CRSCLKoutput: u32 = 0,
            HSI48RC: u32 = 0,
            SHSIRC: u32 = 0,
            SHSIDiv: u32 = 0,
            SAESMult: u32 = 0,
            SAESoutput: u32 = 0,
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSIDIV: u32 = 0,
            LSEOSC: u32 = 0,
            MSIRC: u32 = 0,
            MSIKRC: u32 = 0,
            SAI1_EXT: u32 = 0,
            RCC_Stop_WakeUpClock: u32 = 0,
            WakeUpClockOutput: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PLLSource: u32 = 0,
            PLL2Source: u32 = 0,
            PLL3Source: u32 = 0,
            PLLM: u32 = 0,
            PLL2M: u32 = 0,
            PLL3M: u32 = 0,
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
            DACMult: u32 = 0,
            DACoutput: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            CK48Mult: u32 = 0,
            CK48output: u32 = 0,
            USBoutput: u32 = 0,
            SDMMC1Mult: u32 = 0,
            SDMMCC1Output: u32 = 0,
            FDCANMult: u32 = 0,
            FDCANOutput: u32 = 0,
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
            MDF1Mult: u32 = 0,
            MDF1output: u32 = 0,
            ADF1Mult: u32 = 0,
            ADF1output: u32 = 0,
            OCTOSPIMMult: u32 = 0,
            OCTOSPIMoutput: u32 = 0,
            LPTIM3Mult: u32 = 0,
            LPTIM3output: u32 = 0,
            HSI48DivToRNG: u32 = 0,
            RNGMult: u32 = 0,
            RNGoutput: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
            AHBPrescaler: u32 = 0,
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
            PLLPoutput: u32 = 0,
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
            PLL3N: u32 = 0,
            PLL3FRACN: u32 = 0,
            PLL3P: u32 = 0,
            PLL3Poutput: u32 = 0,
            PLL3Q: u32 = 0,
            PLL3Qoutput: u32 = 0,
            PLL3R: u32 = 0,
            PLL3Routput: u32 = 0,
            MSIS: u32 = 0,
            PLLSRC: u32 = 0,
            VCOInput: u32 = 0,
            VCOInput2: u32 = 0,
            VCOInput3: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            VCOPLL2Output: u32 = 0,
            VCOPLL3Output: u32 = 0,
            LSIclk: u32 = 0,
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

            var LSI_DIV1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSI_DIV128: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIS48: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIK48: bool = false; //semaphore for processing, not an actual flag in the output;
            var WakeUpClockMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var WakeUpClockHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL2SourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL2SourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL3SourceMSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLL3SourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourcePCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceMSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var DAC1CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var DAC1CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceMSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourcePLL2R: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLL2Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourcePLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLK48CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var CK48SourceHSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1SourceIsPllP: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1SourceIsClock48: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANSourcePLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANSourcePLL2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var FDCANSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLL2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLL3P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLL1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLL2P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLL3P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLL1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C4SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MDF1CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var MDF1CLKSOURCE_PLL1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var MDF1CLKSOURCE_PLL3Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADF1CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADF1CLKSOURCE_PLL1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADF1CLKSOURCE_PLL3Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var OCTOSPIMSourceMSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var OCTOSPIMSourceSYS: bool = false; //semaphore for processing, not an actual flag in the output;
            var OCTOSPIMSourcePLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var OCTOSPIMSourcePLL2Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM34CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM3SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM3SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM3SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_HSI48: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_HSI48DIV2: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_PLLR: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_HCLK: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_HCLK_DIV8: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_HCLK_1_8: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI3CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI3CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI2CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI2CLKSOURCE_MSIK: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale4: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale3: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIAutoCalibrationON: bool = false; //semaphore for processing, not an actual flag in the output;
            var MSIKAutoCalibrationON: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var hsikeron_ENABLED: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var SHSIRC = ClockNode{
                .name = "SHSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SHSIDiv = ClockNode{
                .name = "SHSIDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAESMult = ClockNode{
                .name = "SAESMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAESoutput = ClockNode{
                .name = "SAESoutput",
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

            var LSIDIV = ClockNode{
                .name = "LSIDIV",
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

            var MSIKRC = ClockNode{
                .name = "MSIKRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAI1_EXT = ClockNode{
                .name = "SAI1_EXT",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RCC_Stop_WakeUpClock = ClockNode{
                .name = "RCC_Stop_WakeUpClock",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var WakeUpClockOutput = ClockNode{
                .name = "WakeUpClockOutput",
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

            var PLL3Source = ClockNode{
                .name = "PLL3Source",
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

            var PLL3M = ClockNode{
                .name = "PLL3M",
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

            var CK48output = ClockNode{
                .name = "CK48output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBoutput = ClockNode{
                .name = "USBoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SDMMC1Mult = ClockNode{
                .name = "SDMMC1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SDMMCC1Output = ClockNode{
                .name = "SDMMCC1Output",
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

            var MDF1Mult = ClockNode{
                .name = "MDF1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MDF1output = ClockNode{
                .name = "MDF1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADF1Mult = ClockNode{
                .name = "ADF1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADF1output = ClockNode{
                .name = "ADF1output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var OCTOSPIMMult = ClockNode{
                .name = "OCTOSPIMMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var OCTOSPIMoutput = ClockNode{
                .name = "OCTOSPIMoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM3Mult = ClockNode{
                .name = "LPTIM3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM3output = ClockNode{
                .name = "LPTIM3output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSI48DivToRNG = ClockNode{
                .name = "HSI48DivToRNG",
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

            var PLLPoutput = ClockNode{
                .name = "PLLPoutput",
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

            var PLL3N = ClockNode{
                .name = "PLL3N",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3FRACN = ClockNode{
                .name = "PLL3FRACN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3P = ClockNode{
                .name = "PLL3P",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3Poutput = ClockNode{
                .name = "PLL3Poutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3Q = ClockNode{
                .name = "PLL3Q",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3Qoutput = ClockNode{
                .name = "PLL3Qoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3R = ClockNode{
                .name = "PLL3R",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3Routput = ClockNode{
                .name = "PLL3Routput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var MSIS = ClockNode{
                .name = "MSIS",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSRC = ClockNode{
                .name = "PLLSRC",
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

            var VCOInput3 = ClockNode{
                .name = "VCOInput3",
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

            var VCOPLL2Output = ClockNode{
                .name = "VCOPLL2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOPLL3Output = ClockNode{
                .name = "VCOPLL3Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSIclk = ClockNode{
                .name = "LSIclk",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const HSI48_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const SHSI_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const SHSIDivValue: u32 = blk: {
                break :blk 2;
            };

            const SAESSourceValue: SAESSourceList = blk: {
                const user_val = config.SAESSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAESCLKSOURCE_SHSI => {},
                        .RCC_SAESCLKSOURCE_SHSI_DIV2 => {},
                    }
                }
                break :blk user_val orelse .RCC_SAESCLKSOURCE_SHSI;
            };

            const LSI_VALUEValue: f32 = blk: {
                const user_val = config.LSI_VALUE;
                LSIRC.limit = .{
                    .min = 3.14e4,
                    .max = 3.26e4,
                };

                break :blk user_val orelse 3.2e4;
            };

            const LSIDIVValue: LSIDIVList = blk: {
                const user_val = config.LSIDIV;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LSI_DIV1 => LSI_DIV1 = true,
                        .RCC_LSI_DIV128 => LSI_DIV128 = true,
                    }
                }
                break :blk user_val orelse {
                    LSI_DIV1 = true;
                    break :blk .RCC_LSI_DIV1;
                };
            };

            const LSE_VALUEValue: f32 = blk: {
                if ((config.flags.LSEOscillator or config.flags.LSEOscillatorRTC)) {
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
                                "(LSEOscillator | LSEOscillatorRTC)",
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
                    .min = 5e3,
                    .max = 4e4,
                };

                break :blk user_val orelse 3.2768e4;
            };

            const MSIClockRangeValue: MSIClockRangeList = blk: {
                if (!check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.MSIClockRange;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MSIRANGE_0 => MSIS48 = true,
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
                            .RCC_MSIRANGE_12 => {},
                            .RCC_MSIRANGE_13 => {},
                            .RCC_MSIRANGE_14 => {},
                            .RCC_MSIRANGE_15 => {},
                        }
                    }
                    break :blk user_val orelse .RCC_MSIRANGE_4;
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.MSIClockRange;

                    if (user_val) |val| {
                        switch (val) {
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
                            .RCC_MSIRANGE_12 => {},
                            .RCC_MSIRANGE_13 => {},
                            .RCC_MSIRANGE_14 => {},
                            .RCC_MSIRANGE_15 => {},
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
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "MSIClockRange",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "RANGE_24MHZ" else "RCC_MSIRANGE_1",
                                    if (patch_logs) "RANGE_16MHZ" else "RCC_MSIRANGE_2",
                                    if (patch_logs) "RANGE_12MHZ" else "RCC_MSIRANGE_3",
                                    if (patch_logs) "RANGE_4MHZ" else "RCC_MSIRANGE_4",
                                    if (patch_logs) "RANGE_2MHZ" else "RCC_MSIRANGE_5",
                                    if (patch_logs) "RANGE_1_33MHZ" else "RCC_MSIRANGE_6",
                                    if (patch_logs) "RANGE_1MHZ" else "RCC_MSIRANGE_7",
                                    if (patch_logs) "RANGE_3_072MHZ" else "RCC_MSIRANGE_8",
                                    if (patch_logs) "RANGE_1_536MHZ" else "RCC_MSIRANGE_9",
                                    if (patch_logs) "RANGE_1_024MHZ" else "RCC_MSIRANGE_10",
                                    if (patch_logs) "RANGE_768KHZ" else "RCC_MSIRANGE_11",
                                    if (patch_logs) "RANGE_400KHZ" else "RCC_MSIRANGE_12",
                                    if (patch_logs) "RANGE_200KHZ" else "RCC_MSIRANGE_13",
                                    if (patch_logs) "RANGE_133KHZ" else "RCC_MSIRANGE_14",
                                    if (patch_logs) "RANGE_100KHZ" else "RCC_MSIRANGE_15",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_MSIRANGE_4;
                }
                const user_val = config.MSIClockRange;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MSIRANGE_0 => MSIS48 = true,
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
                        .RCC_MSIRANGE_12 => {},
                        .RCC_MSIRANGE_13 => {},
                        .RCC_MSIRANGE_14 => {},
                        .RCC_MSIRANGE_15 => {},
                    }
                }
                break :blk user_val orelse .RCC_MSIRANGE_4;
            };

            const MSIKClockRangeValue: MSIKClockRangeList = blk: {
                if (!check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.MSIKClockRange;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MSIKRANGE_0 => MSIK48 = true,
                            .RCC_MSIKRANGE_1 => {},
                            .RCC_MSIKRANGE_2 => {},
                            .RCC_MSIKRANGE_3 => {},
                            .RCC_MSIKRANGE_4 => {},
                            .RCC_MSIKRANGE_5 => {},
                            .RCC_MSIKRANGE_6 => {},
                            .RCC_MSIKRANGE_7 => {},
                            .RCC_MSIKRANGE_8 => {},
                            .RCC_MSIKRANGE_9 => {},
                            .RCC_MSIKRANGE_10 => {},
                            .RCC_MSIKRANGE_11 => {},
                            .RCC_MSIKRANGE_12 => {},
                            .RCC_MSIKRANGE_13 => {},
                            .RCC_MSIKRANGE_14 => {},
                            .RCC_MSIKRANGE_15 => {},
                        }
                    }
                    break :blk user_val orelse .RCC_MSIKRANGE_4;
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.MSIKClockRange;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MSIKRANGE_1 => {},
                            .RCC_MSIKRANGE_2 => {},
                            .RCC_MSIKRANGE_3 => {},
                            .RCC_MSIKRANGE_4 => {},
                            .RCC_MSIKRANGE_5 => {},
                            .RCC_MSIKRANGE_6 => {},
                            .RCC_MSIKRANGE_7 => {},
                            .RCC_MSIKRANGE_8 => {},
                            .RCC_MSIKRANGE_9 => {},
                            .RCC_MSIKRANGE_10 => {},
                            .RCC_MSIKRANGE_11 => {},
                            .RCC_MSIKRANGE_12 => {},
                            .RCC_MSIKRANGE_13 => {},
                            .RCC_MSIKRANGE_14 => {},
                            .RCC_MSIKRANGE_15 => {},
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
                                    \\ - {s}
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "MSIKClockRange",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "RANGE_24MHZ" else "RCC_MSIKRANGE_1",
                                    if (patch_logs) "RANGE_16MHZ" else "RCC_MSIKRANGE_2",
                                    if (patch_logs) "RANGE_12MHZ" else "RCC_MSIKRANGE_3",
                                    if (patch_logs) "RANGE_4MHZ" else "RCC_MSIKRANGE_4",
                                    if (patch_logs) "RANGE_2MHZ" else "RCC_MSIKRANGE_5",
                                    if (patch_logs) "RANGE_1_33MHZ" else "RCC_MSIKRANGE_6",
                                    if (patch_logs) "RANGE_1MHZ" else "RCC_MSIKRANGE_7",
                                    if (patch_logs) "RANGE_3_072MHZ" else "RCC_MSIKRANGE_8",
                                    if (patch_logs) "RANGE_1_536MHZ" else "RCC_MSIKRANGE_9",
                                    if (patch_logs) "RANGE_1_024MHZ" else "RCC_MSIKRANGE_10",
                                    if (patch_logs) "RANGE_768KHZ" else "RCC_MSIKRANGE_11",
                                    if (patch_logs) "RANGE_400KHZ" else "RCC_MSIKRANGE_12",
                                    if (patch_logs) "RANGE_200KHZ" else "RCC_MSIKRANGE_13",
                                    if (patch_logs) "RANGE_133KHZ" else "RCC_MSIKRANGE_14",
                                    if (patch_logs) "RANGE_100KHZ" else "RCC_MSIKRANGE_15",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_MSIKRANGE_4;
                }
                const user_val = config.MSIKClockRange;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MSIKRANGE_0 => MSIK48 = true,
                        .RCC_MSIKRANGE_1 => {},
                        .RCC_MSIKRANGE_2 => {},
                        .RCC_MSIKRANGE_3 => {},
                        .RCC_MSIKRANGE_4 => {},
                        .RCC_MSIKRANGE_5 => {},
                        .RCC_MSIKRANGE_6 => {},
                        .RCC_MSIKRANGE_7 => {},
                        .RCC_MSIKRANGE_8 => {},
                        .RCC_MSIKRANGE_9 => {},
                        .RCC_MSIKRANGE_10 => {},
                        .RCC_MSIKRANGE_11 => {},
                        .RCC_MSIKRANGE_12 => {},
                        .RCC_MSIKRANGE_13 => {},
                        .RCC_MSIKRANGE_14 => {},
                        .RCC_MSIKRANGE_15 => {},
                    }
                }
                break :blk user_val orelse .RCC_MSIKRANGE_4;
            };

            const EXTERNALSAI1_CLOCK_VALUEValue: f32 = blk: {
                break :blk 4.8e4;
            };

            const RCC_Stop_WakeUpClockValue: RCC_Stop_WakeUpClockList = blk: {
                const user_val = config.RCC_Stop_WakeUpClock;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_STOP_WAKEUPCLOCK_MSI => WakeUpClockMSI = true,
                        .RCC_STOP_WAKEUPCLOCK_HSI => WakeUpClockHSI = true,
                    }
                }
                break :blk user_val orelse {
                    WakeUpClockMSI = true;
                    break :blk .RCC_STOP_WAKEUPCLOCK_MSI;
                };
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

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
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

            const PLL2SourceValue: PLL2SourceList = blk: {
                const user_val = config.PLL2Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_MSI => PLL2SourceMSI = true,
                        .RCC_PLLSOURCE_HSI => PLL2SourceHSI = true,
                        .RCC_PLLSOURCE_HSE => PLL2SourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLL2SourceMSI = true;
                    break :blk .RCC_PLLSOURCE_MSI;
                };
            };

            const PLL3SourceValue: PLL3SourceList = blk: {
                const user_val = config.PLL3Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_MSI => PLL3SourceMSI = true,
                        .RCC_PLLSOURCE_HSI => PLL3SourceHSI = true,
                        .RCC_PLLSOURCE_HSE => PLL3SourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    PLL3SourceMSI = true;
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
                    if (val > 16) {
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
                            16,
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
                    if (val > 16) {
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
                            16,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
            };

            const PLL3MValue: u32 = blk: {
                const user_val = config.PLL3M;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL3M",
                            "Else",
                            "No additional information",
                            1,
                            val,
                        });
                    }
                    if (val > 16) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL3M",
                            "Else",
                            "No additional information",
                            16,
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

            const USART1CLockSelectionVirtualValue: USART1CLockSelectionVirtualList = blk: {
                if (check_MCU("S_LPBAM_CONF") and (config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    if (config.USART1CLockSelectionVirtual) |val| {
                        if (val != .RCC_USART1CLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_USART1CLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "USART1CLockSelectionVirtual",
                                "S_LPBAM_CONF & (LSEOscillatorRTC|LSEByPassRTC)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    USART1SourceHSI = true;
                    break :blk .RCC_USART1CLKSOURCE_HSI;
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.USART1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART1CLKSOURCE_HSI => USART1SourceHSI = true,
                            .RCC_USART1CLKSOURCE_LSE => USART1SourceLSE = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "USART1CLockSelectionVirtual",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_USART1CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_USART1CLKSOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        USART1SourceHSI = true;
                        break :blk .RCC_USART1CLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.USART1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART1CLKSOURCE_PCLK2 => USART1SourcePCLK2 = true,
                            .RCC_USART1CLKSOURCE_SYSCLK => USART1SourceSys = true,
                            .RCC_USART1CLKSOURCE_HSI => USART1SourceHSI = true,
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
                                    "USART1CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK2" else "RCC_USART1CLKSOURCE_PCLK2",
                                    if (patch_logs) "SYS" else "RCC_USART1CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_USART1CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        USART1SourcePCLK2 = true;
                        break :blk .RCC_USART1CLKSOURCE_PCLK2;
                    };
                }
                const user_val = config.USART1CLockSelectionVirtual;

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

            const USART2CLockSelectionVirtualValue: USART2CLockSelectionVirtualList = blk: {
                if (check_MCU("S_LPBAM_CONF") and (config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    if (config.USART2CLockSelectionVirtual) |val| {
                        if (val != .RCC_USART2CLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_USART2CLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "USART2CLockSelectionVirtual",
                                "S_LPBAM_CONF & (LSEOscillatorRTC|LSEByPassRTC)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    USART2SourceHSI = true;
                    break :blk .RCC_USART2CLKSOURCE_HSI;
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.USART2CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART2CLKSOURCE_HSI => USART2SourceHSI = true,
                            .RCC_USART2CLKSOURCE_LSE => USART2SourceLSE = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "USART2CLockSelectionVirtual",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_USART2CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_USART2CLKSOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        USART2SourceHSI = true;
                        break :blk .RCC_USART2CLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.USART2CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART2CLKSOURCE_PCLK1 => USART2SourcePCLK1 = true,
                            .RCC_USART2CLKSOURCE_SYSCLK => USART2SourceSys = true,
                            .RCC_USART2CLKSOURCE_HSI => USART2SourceHSI = true,
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
                                    "USART2CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK1" else "RCC_USART2CLKSOURCE_PCLK1",
                                    if (patch_logs) "SYS" else "RCC_USART2CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_USART2CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        USART2SourcePCLK1 = true;
                        break :blk .RCC_USART2CLKSOURCE_PCLK1;
                    };
                }
                const user_val = config.USART2CLockSelectionVirtual;

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

            const USART3CLockSelectionVirtualValue: USART3CLockSelectionVirtualList = blk: {
                if (check_MCU("S_LPBAM_CONF") and (config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    if (config.USART3CLockSelectionVirtual) |val| {
                        if (val != .RCC_USART3CLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_USART3CLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "USART3CLockSelectionVirtual",
                                "S_LPBAM_CONF & (LSEOscillatorRTC|LSEByPassRTC)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    USART3SourceHSI = true;
                    break :blk .RCC_USART3CLKSOURCE_HSI;
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.USART3CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART3CLKSOURCE_HSI => USART3SourceHSI = true,
                            .RCC_USART3CLKSOURCE_LSE => USART3SourceLSE = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "USART3CLockSelectionVirtual",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_USART3CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_USART3CLKSOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        USART3SourceHSI = true;
                        break :blk .RCC_USART3CLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.USART3CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART3CLKSOURCE_PCLK1 => USART3SourcePCLK1 = true,
                            .RCC_USART3CLKSOURCE_SYSCLK => USART3SourceSys = true,
                            .RCC_USART3CLKSOURCE_HSI => USART3SourceHSI = true,
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
                                    "USART3CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK1" else "RCC_USART3CLKSOURCE_PCLK1",
                                    if (patch_logs) "SYS" else "RCC_USART3CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_USART3CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        USART3SourcePCLK1 = true;
                        break :blk .RCC_USART3CLKSOURCE_PCLK1;
                    };
                }
                const user_val = config.USART3CLockSelectionVirtual;

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

            const UART4CLockSelectionVirtualValue: UART4CLockSelectionVirtualList = blk: {
                if (check_MCU("S_LPBAM_CONF") and (config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    if (config.UART4CLockSelectionVirtual) |val| {
                        if (val != .RCC_UART4CLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_UART4CLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "UART4CLockSelectionVirtual",
                                "S_LPBAM_CONF & (LSEOscillatorRTC|LSEByPassRTC)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    UART4SourceHSI = true;
                    break :blk .RCC_UART4CLKSOURCE_HSI;
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.UART4CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_UART4CLKSOURCE_HSI => UART4SourceHSI = true,
                            .RCC_UART4CLKSOURCE_LSE => UART4SourceLSE = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "UART4CLockSelectionVirtual",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_UART4CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_UART4CLKSOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        UART4SourceHSI = true;
                        break :blk .RCC_UART4CLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.UART4CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_UART4CLKSOURCE_PCLK1 => UART4SourcePCLK1 = true,
                            .RCC_UART4CLKSOURCE_SYSCLK => UART4Sourcesys = true,
                            .RCC_UART4CLKSOURCE_HSI => UART4SourceHSI = true,
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
                                    "UART4CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK1" else "RCC_UART4CLKSOURCE_PCLK1",
                                    if (patch_logs) "SYS" else "RCC_UART4CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_UART4CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        UART4SourcePCLK1 = true;
                        break :blk .RCC_UART4CLKSOURCE_PCLK1;
                    };
                }
                const user_val = config.UART4CLockSelectionVirtual;

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

            const UART5CLockSelectionVirtualValue: UART5CLockSelectionVirtualList = blk: {
                if (check_MCU("S_LPBAM_CONF") and (config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    if (config.UART5CLockSelectionVirtual) |val| {
                        if (val != .RCC_UART5CLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_UART5CLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "UART5CLockSelectionVirtual",
                                "S_LPBAM_CONF & (LSEOscillatorRTC|LSEByPassRTC)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    UART5SourceHSI = true;
                    break :blk .RCC_UART5CLKSOURCE_HSI;
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.UART5CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_UART5CLKSOURCE_HSI => UART5SourceHSI = true,
                            .RCC_UART5CLKSOURCE_LSE => UART5SourceLSE = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "UART5CLockSelectionVirtual",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_UART5CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_UART5CLKSOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        UART5SourceHSI = true;
                        break :blk .RCC_UART5CLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.UART5CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_UART5CLKSOURCE_PCLK1 => {},
                            .RCC_UART5CLKSOURCE_SYSCLK => UART5Sourcesys = true,
                            .RCC_UART5CLKSOURCE_HSI => UART5SourceHSI = true,
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
                                    "UART5CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK1" else "RCC_UART5CLKSOURCE_PCLK1",
                                    if (patch_logs) "SYS" else "RCC_UART5CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_UART5CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_UART5CLKSOURCE_PCLK1;
                }
                const user_val = config.UART5CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART5CLKSOURCE_PCLK1 => {},
                        .RCC_UART5CLKSOURCE_SYSCLK => UART5Sourcesys = true,
                        .RCC_UART5CLKSOURCE_HSI => UART5SourceHSI = true,
                        .RCC_UART5CLKSOURCE_LSE => UART5SourceLSE = true,
                    }
                }
                break :blk user_val orelse .RCC_UART5CLKSOURCE_PCLK1;
            };

            const LPUART1CLockSelectionVirtualValue: LPUART1CLockSelectionVirtualList = blk: {
                if (check_MCU("S_LPBAM_CONF") and (config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPUART1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
                            .RCC_LPUART1CLKSOURCE_MSIK => LPUART1SourceMSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "LPUART1CLockSelectionVirtual",
                                    "S_LPBAM_CONF & (LSEOscillatorRTC|LSEByPassRTC)",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_LPUART1CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_LPUART1CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        LPUART1SourceHSI = true;
                        break :blk .RCC_LPUART1CLKSOURCE_HSI;
                    };
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.LPUART1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
                            .RCC_LPUART1CLKSOURCE_LSE => LPUART1SourceLSE = true,
                            .RCC_LPUART1CLKSOURCE_MSIK => LPUART1SourceMSIK = true,
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
                                    "LPUART1CLockSelectionVirtual",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_LPUART1CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_LPUART1CLKSOURCE_LSE",
                                    if (patch_logs) "MSIK" else "RCC_LPUART1CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        LPUART1SourceHSI = true;
                        break :blk .RCC_LPUART1CLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPUART1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPUART1CLKSOURCE_PCLK3 => {},
                            .RCC_LPUART1CLKSOURCE_SYSCLK => {},
                            .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
                            .RCC_LPUART1CLKSOURCE_MSIK => LPUART1SourceMSIK = true,
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
                                    "LPUART1CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK3" else "RCC_LPUART1CLKSOURCE_PCLK3",
                                    if (patch_logs) "SYS" else "RCC_LPUART1CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_LPUART1CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_LPUART1CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_LPUART1CLKSOURCE_PCLK3;
                }
                const user_val = config.LPUART1CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_PCLK3 => {},
                        .RCC_LPUART1CLKSOURCE_SYSCLK => {},
                        .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
                        .RCC_LPUART1CLKSOURCE_LSE => LPUART1SourceLSE = true,
                        .RCC_LPUART1CLKSOURCE_MSIK => LPUART1SourceMSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_LPUART1CLKSOURCE_PCLK3;
            };

            const LPTIM1CLockSelectionVirtualValue: LPTIM1CLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPTIM1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPTIM1CLKSOURCE_MSIK => LPTIM1CLKSOURCE_MSIK = true,
                            .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                            .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
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
                                    "LPTIM1CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK1" else "RCC_LPTIM1CLKSOURCE_MSIK",
                                    if (patch_logs) "LSI" else "RCC_LPTIM1CLKSOURCE_LSI",
                                    if (patch_logs) "HSI" else "RCC_LPTIM1CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        LPTIM1CLKSOURCE_MSIK = true;
                        break :blk .RCC_LPTIM1CLKSOURCE_MSIK;
                    };
                }
                const user_val = config.LPTIM1CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_MSIK => LPTIM1CLKSOURCE_MSIK = true,
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1SOURCELSE = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM1CLKSOURCE_MSIK = true;
                    break :blk .RCC_LPTIM1CLKSOURCE_MSIK;
                };
            };

            const LPTIM2CLockSelectionVirtualValue: LPTIM2CLockSelectionVirtualList = blk: {
                if (check_MCU("S_LPBAM_CONF") and (config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPTIM2CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPTIM2CLKSOURCE_LSI => LPTIM2SOURCELSI = true,
                            .RCC_LPTIM2CLKSOURCE_HSI => LPTIM2SOURCEHSI = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "LPTIM2CLockSelectionVirtual",
                                    "S_LPBAM_CONF & (LSEOscillatorRTC|LSEByPassRTC)",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "LSI" else "RCC_LPTIM2CLKSOURCE_LSI",
                                    if (patch_logs) "HSI" else "RCC_LPTIM2CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        LPTIM2SOURCEHSI = true;
                        break :blk .RCC_LPTIM2CLKSOURCE_HSI;
                    };
                } else if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.LPTIM2CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPTIM2CLKSOURCE_LSI => LPTIM2SOURCELSI = true,
                            .RCC_LPTIM2CLKSOURCE_HSI => LPTIM2SOURCEHSI = true,
                            .RCC_LPTIM2CLKSOURCE_LSE => LPTIM2SOURCELSE = true,
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
                                    "LPTIM2CLockSelectionVirtual",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "LSI" else "RCC_LPTIM2CLKSOURCE_LSI",
                                    if (patch_logs) "HSI" else "RCC_LPTIM2CLKSOURCE_HSI",
                                    if (patch_logs) "LSE" else "RCC_LPTIM2CLKSOURCE_LSE",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        LPTIM2SOURCEHSI = true;
                        break :blk .RCC_LPTIM2CLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPTIM2CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPTIM2CLKSOURCE_PCLK1 => {},
                            .RCC_LPTIM2CLKSOURCE_LSI => LPTIM2SOURCELSI = true,
                            .RCC_LPTIM2CLKSOURCE_HSI => LPTIM2SOURCEHSI = true,
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
                                    "LPTIM2CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PCLK1" else "RCC_LPTIM2CLKSOURCE_PCLK1",
                                    if (patch_logs) "LSI" else "RCC_LPTIM2CLKSOURCE_LSI",
                                    if (patch_logs) "HSI" else "RCC_LPTIM2CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_LPTIM2CLKSOURCE_PCLK1;
                }
                const user_val = config.LPTIM2CLockSelectionVirtual;

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

            const DACCLockSelectionVirtualValue: DACCLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    if (config.DACCLockSelectionVirtual) |val| {
                        if (val != .RCC_DAC1CLKSOURCE_LSI) {
                            const patch_str = if (patch_logs) "LSI" else "RCC_DAC1CLKSOURCE_LSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "DACCLockSelectionVirtual",
                                "(LSEOscillatorRTC|LSEByPassRTC)",
                                "LSE is configured only for RTC",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    DAC1CLKSOURCE_LSI = true;
                    break :blk .RCC_DAC1CLKSOURCE_LSI;
                }
                const user_val = config.DACCLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DAC1CLKSOURCE_LSE => DAC1CLKSOURCE_LSE = true,
                        .RCC_DAC1CLKSOURCE_LSI => DAC1CLKSOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    DAC1CLKSOURCE_LSI = true;
                    break :blk .RCC_DAC1CLKSOURCE_LSI;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.ADCCLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_ADCDACCLKSOURCE_HSE => ADCSourceHSE = true,
                            .RCC_ADCDACCLKSOURCE_HSI => ADCSourceHSI = true,
                            .RCC_ADCDACCLKSOURCE_MSIK => ADCSourceMSIK = true,
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
                                    "ADCCLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSE" else "RCC_ADCDACCLKSOURCE_HSE",
                                    if (patch_logs) "HSI" else "RCC_ADCDACCLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_ADCDACCLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        ADCSourceHSI = true;
                        break :blk .RCC_ADCDACCLKSOURCE_HSI;
                    };
                }
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCDACCLKSOURCE_HCLK => {},
                        .RCC_ADCDACCLKSOURCE_SYSCLK => ADCSourceSys = true,
                        .RCC_ADCDACCLKSOURCE_PLL2 => ADCSourcePLL2R = true,
                        .RCC_ADCDACCLKSOURCE_HSE => ADCSourceHSE = true,
                        .RCC_ADCDACCLKSOURCE_HSI => ADCSourceHSI = true,
                        .RCC_ADCDACCLKSOURCE_MSIK => ADCSourceMSIK = true,
                    }
                }
                break :blk user_val orelse {
                    ADCSourceHSI = true;
                    break :blk .RCC_ADCDACCLKSOURCE_HSI;
                };
            };

            const CK48CLockSelectionValue: CK48CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.CK48CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_CLK48CLKSOURCE_PLL2 => CK48SourcePLL2Q = true,
                            .RCC_CLK48CLKSOURCE_PLL1 => CK48SourcePLL1Q = true,
                            .RCC_CLK48CLKSOURCE_MSIK => CLK48CLKSOURCE_MSIK = true,
                            .RCC_CLK48CLKSOURCE_HSI48 => CK48SourceHSI48 = true,
                        }
                    }
                    break :blk user_val orelse {
                        CLK48CLKSOURCE_MSIK = true;
                        break :blk .RCC_CLK48CLKSOURCE_MSIK;
                    };
                }
                const user_val = config.CK48CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CLK48CLKSOURCE_PLL2 => CK48SourcePLL2Q = true,
                        .RCC_CLK48CLKSOURCE_PLL1 => CK48SourcePLL1Q = true,
                        .RCC_CLK48CLKSOURCE_MSIK => CLK48CLKSOURCE_MSIK = true,
                        .RCC_CLK48CLKSOURCE_HSI48 => CK48SourceHSI48 = true,
                    }
                }
                break :blk user_val orelse {
                    CK48SourceHSI48 = true;
                    break :blk .RCC_CLK48CLKSOURCE_HSI48;
                };
            };

            const SDMMCClockSelectionValue: SDMMCClockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.SDMMCClockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SDMMCCLKSOURCE_PLL1 => SDMMC1SourceIsPllP = true,
                            .RCC_SDMMCCLKSOURCE_CLK48 => SDMMC1SourceIsClock48 = true,
                        }
                    }
                    break :blk user_val orelse {
                        SDMMC1SourceIsClock48 = true;
                        break :blk .RCC_SDMMCCLKSOURCE_CLK48;
                    };
                }
                const user_val = config.SDMMCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SDMMCCLKSOURCE_PLL1 => SDMMC1SourceIsPllP = true,
                        .RCC_SDMMCCLKSOURCE_CLK48 => SDMMC1SourceIsClock48 = true,
                    }
                }
                break :blk user_val orelse {
                    SDMMC1SourceIsPllP = true;
                    break :blk .RCC_SDMMCCLKSOURCE_PLL1;
                };
            };

            const FDCANClockSelectionValue: FDCANClockSelectionList = blk: {
                const user_val = config.FDCANClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FDCAN1CLKSOURCE_PLL1 => FDCANSourcePLL1Q = true,
                        .RCC_FDCAN1CLKSOURCE_PLL2 => FDCANSourcePLL2P = true,
                        .RCC_FDCAN1CLKSOURCE_HSE => FDCANSourceHSE = true,
                    }
                }
                break :blk user_val orelse {
                    FDCANSourcePLL1Q = true;
                    break :blk .RCC_FDCAN1CLKSOURCE_PLL1;
                };
            };

            const I2C1CLockSelectionValue: I2C1CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.I2C1CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                            .RCC_I2C1CLKSOURCE_MSIK => I2C1CLKSOURCE_MSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "I2C1CLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_I2C1CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_I2C1CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        I2C1SourceHSI = true;
                        break :blk .RCC_I2C1CLKSOURCE_HSI;
                    };
                }
                const user_val = config.I2C1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_PCLK1 => {},
                        .RCC_I2C1CLKSOURCE_SYSCLK => I2C1SourceSys = true,
                        .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                        .RCC_I2C1CLKSOURCE_MSIK => I2C1CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C1CLKSOURCE_PCLK1;
            };

            const I2C2CLockSelectionValue: I2C2CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.I2C2CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_I2C2CLKSOURCE_HSI => I2C2SourceHSI = true,
                            .RCC_I2C2CLKSOURCE_MSIK => I2C2CLKSOURCE_MSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "I2C2CLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_I2C2CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_I2C2CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        I2C2SourceHSI = true;
                        break :blk .RCC_I2C2CLKSOURCE_HSI;
                    };
                }
                const user_val = config.I2C2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C2CLKSOURCE_PCLK1 => {},
                        .RCC_I2C2CLKSOURCE_SYSCLK => I2C2SourceSys = true,
                        .RCC_I2C2CLKSOURCE_HSI => I2C2SourceHSI = true,
                        .RCC_I2C2CLKSOURCE_MSIK => I2C2CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C2CLKSOURCE_PCLK1;
            };

            const I2C3CLockSelectionValue: I2C3CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.I2C3CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_I2C3CLKSOURCE_HSI => I2C3SourceHSI = true,
                            .RCC_I2C3CLKSOURCE_MSIK => I2C3CLKSOURCE_MSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "I2C3CLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_I2C3CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_I2C3CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        I2C3SourceHSI = true;
                        break :blk .RCC_I2C3CLKSOURCE_HSI;
                    };
                }
                const user_val = config.I2C3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C3CLKSOURCE_PCLK3 => {},
                        .RCC_I2C3CLKSOURCE_SYSCLK => I2C3SourceSys = true,
                        .RCC_I2C3CLKSOURCE_HSI => I2C3SourceHSI = true,
                        .RCC_I2C3CLKSOURCE_MSIK => I2C3CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C3CLKSOURCE_PCLK3;
            };

            const SAI1CLockSelectionValue: SAI1CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.SAI1CLockSelection) |val| {
                        if (val != .RCC_SAI1CLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_SAI1CLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "SAI1CLockSelection",
                                "S_LPBAM_CONF",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    SAI1SourceHSI = true;
                    break :blk .RCC_SAI1CLKSOURCE_HSI;
                }
                const user_val = config.SAI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_PLL2 => SAI1SourcePLL2P = true,
                        .RCC_SAI1CLKSOURCE_PLL3 => SAI1SourcePLL3P = true,
                        .RCC_SAI1CLKSOURCE_PLL1 => SAI1SourcePLL1P = true,
                        .RCC_SAI1CLKSOURCE_PIN => SAI1SourceEXT = true,
                        .RCC_SAI1CLKSOURCE_HSI => SAI1SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    SAI1SourcePLL2P = true;
                    break :blk .RCC_SAI1CLKSOURCE_PLL2;
                };
            };

            const SAI2CLockSelectionValue: SAI2CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.SAI2CLockSelection) |val| {
                        if (val != .RCC_SAI2CLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_SAI2CLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "SAI2CLockSelection",
                                "S_LPBAM_CONF",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    SAI2SourceHSI = true;
                    break :blk .RCC_SAI2CLKSOURCE_HSI;
                }
                const user_val = config.SAI2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI2CLKSOURCE_PLL2 => SAI2SourcePLL2P = true,
                        .RCC_SAI2CLKSOURCE_PLL3 => SAI2SourcePLL3P = true,
                        .RCC_SAI2CLKSOURCE_PLL1 => SAI2SourcePLL1P = true,
                        .RCC_SAI2CLKSOURCE_PIN => SAI2SourceEXT = true,
                        .RCC_SAI2CLKSOURCE_HSI => SAI2SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    SAI2SourcePLL2P = true;
                    break :blk .RCC_SAI2CLKSOURCE_PLL2;
                };
            };

            const I2C4CLockSelectionValue: I2C4CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.I2C4CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_I2C4CLKSOURCE_HSI => I2C4SourceHSI = true,
                            .RCC_I2C4CLKSOURCE_MSIK => I2C4CLKSOURCE_MSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "I2C4CLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_I2C4CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_I2C4CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        I2C4SourceHSI = true;
                        break :blk .RCC_I2C4CLKSOURCE_HSI;
                    };
                }
                const user_val = config.I2C4CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C4CLKSOURCE_PCLK1 => {},
                        .RCC_I2C4CLKSOURCE_SYSCLK => I2C4SourceSys = true,
                        .RCC_I2C4CLKSOURCE_HSI => I2C4SourceHSI = true,
                        .RCC_I2C4CLKSOURCE_MSIK => I2C4CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C4CLKSOURCE_PCLK1;
            };

            const MdfClockSelectionValue: MdfClockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.MdfClockSelection) |val| {
                        if (val != .RCC_MDF1CLKSOURCE_MSIK) {
                            const patch_str = if (patch_logs) "MSIK" else "RCC_MDF1CLKSOURCE_MSIK";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "MdfClockSelection",
                                "S_LPBAM_CONF",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    MDF1CLKSOURCE_MSIK = true;
                    break :blk .RCC_MDF1CLKSOURCE_MSIK;
                }
                const user_val = config.MdfClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MDF1CLKSOURCE_HCLK => {},
                        .RCC_MDF1CLKSOURCE_PLL1 => MDF1CLKSOURCE_PLL1P = true,
                        .RCC_MDF1CLKSOURCE_PLL3 => MDF1CLKSOURCE_PLL3Q = true,
                        .RCC_MDF1CLKSOURCE_PIN => {},
                        .RCC_MDF1CLKSOURCE_MSIK => MDF1CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_MDF1CLKSOURCE_HCLK;
            };

            const AdfClockSelectionValue: AdfClockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.AdfClockSelection) |val| {
                        if (val != .RCC_ADF1CLKSOURCE_MSIK) {
                            const patch_str = if (patch_logs) "MSIK" else "RCC_ADF1CLKSOURCE_MSIK";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "AdfClockSelection",
                                "S_LPBAM_CONF",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    ADF1CLKSOURCE_MSIK = true;
                    break :blk .RCC_ADF1CLKSOURCE_MSIK;
                }
                const user_val = config.AdfClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADF1CLKSOURCE_HCLK => {},
                        .RCC_ADF1CLKSOURCE_PLL1 => ADF1CLKSOURCE_PLL1P = true,
                        .RCC_ADF1CLKSOURCE_PLL3 => ADF1CLKSOURCE_PLL3Q = true,
                        .RCC_ADF1CLKSOURCE_PIN => {},
                        .RCC_ADF1CLKSOURCE_MSIK => ADF1CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_ADF1CLKSOURCE_HCLK;
            };

            const OCTOSPIMCLockSelectionValue: OCTOSPIMCLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.OCTOSPIMCLockSelection) |val| {
                        if (val != .RCC_OSPICLKSOURCE_MSIK) {
                            const patch_str = if (patch_logs) "MSIK" else "RCC_OSPICLKSOURCE_MSIK";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "OCTOSPIMCLockSelection",
                                "S_LPBAM_CONF",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    OCTOSPIMSourceMSIK = true;
                    break :blk .RCC_OSPICLKSOURCE_MSIK;
                }
                const user_val = config.OCTOSPIMCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_OSPICLKSOURCE_MSIK => OCTOSPIMSourceMSIK = true,
                        .RCC_OSPICLKSOURCE_SYSCLK => OCTOSPIMSourceSYS = true,
                        .RCC_OSPICLKSOURCE_PLL1 => OCTOSPIMSourcePLL1Q = true,
                        .RCC_OSPICLKSOURCE_PLL2 => OCTOSPIMSourcePLL2Q = true,
                    }
                }
                break :blk user_val orelse {
                    OCTOSPIMSourceSYS = true;
                    break :blk .RCC_OSPICLKSOURCE_SYSCLK;
                };
            };

            const LPTIM3CLockSelectionVirtualValue: LPTIM3CLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPTIM3CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPTIM34CLKSOURCE_MSIK => LPTIM34CLKSOURCE_MSIK = true,
                            .RCC_LPTIM34CLKSOURCE_LSI => LPTIM3SOURCELSI = true,
                            .RCC_LPTIM34CLKSOURCE_HSI => LPTIM3SOURCEHSI = true,
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
                                    "LPTIM3CLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "MSIK" else "RCC_LPTIM34CLKSOURCE_MSIK",
                                    if (patch_logs) "LSI" else "RCC_LPTIM34CLKSOURCE_LSI",
                                    if (patch_logs) "HSI" else "RCC_LPTIM34CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        LPTIM34CLKSOURCE_MSIK = true;
                        break :blk .RCC_LPTIM34CLKSOURCE_MSIK;
                    };
                }
                const user_val = config.LPTIM3CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM34CLKSOURCE_MSIK => LPTIM34CLKSOURCE_MSIK = true,
                        .RCC_LPTIM34CLKSOURCE_LSI => LPTIM3SOURCELSI = true,
                        .RCC_LPTIM34CLKSOURCE_HSI => LPTIM3SOURCEHSI = true,
                        .RCC_LPTIM34CLKSOURCE_LSE => LPTIM3SOURCELSE = true,
                    }
                }
                break :blk user_val orelse {
                    LPTIM34CLKSOURCE_MSIK = true;
                    break :blk .RCC_LPTIM34CLKSOURCE_MSIK;
                };
            };

            const HSI48DivToRNGValue: u32 = blk: {
                break :blk 2;
            };

            const RNGCLockSelectionValue: RNGCLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.RNGCLockSelection) |val| {
                        if (val != .RCC_RNGCLKSOURCE_HSI) {
                            const patch_str = if (patch_logs) "HSI" else "RCC_RNGCLKSOURCE_HSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "RNGCLockSelection",
                                "S_LPBAM_CONF",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    RNGCLKSOURCE_HSI = true;
                    break :blk .RCC_RNGCLKSOURCE_HSI;
                }
                const user_val = config.RNGCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_HSI48 => RNGCLKSOURCE_HSI48 = true,
                        .RCC_RNGCLKSOURCE_HSI48_DIV2 => RNGCLKSOURCE_HSI48DIV2 = true,
                        .RCC_RNGCLKSOURCE_HSI => RNGCLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse {
                    RNGCLKSOURCE_HSI48 = true;
                    break :blk .RCC_RNGCLKSOURCE_HSI48;
                };
            };

            const RCC_MCO1SourceVirtualValue: RCC_MCO1SourceVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.RCC_MCO1SourceVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MCO1SOURCE_SYSCLK => {},
                            .RCC_MCO1SOURCE_HSI => {},
                            .RCC_MCO1SOURCE_MSI => {},
                            .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                            .RCC_MCO1SOURCE_PLL1CLK => MCO1SOURCE_PLLR = true,
                            .RCC_MCO1SOURCE_LSI => {},
                            .RCC_MCO1SOURCE_HSI48 => {},
                            .RCC_MCO1SOURCE_MSIK => MCO1SOURCE_MSIK = true,
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
                                , .{
                                    "RCC_MCO1SourceVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "SYS" else "RCC_MCO1SOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_MCO1SOURCE_HSI",
                                    if (patch_logs) "MSIS" else "RCC_MCO1SOURCE_MSI",
                                    if (patch_logs) "HSE" else "RCC_MCO1SOURCE_HSE",
                                    if (patch_logs) "PLL1_R" else "RCC_MCO1SOURCE_PLL1CLK",
                                    if (patch_logs) "LSI" else "RCC_MCO1SOURCE_LSI",
                                    if (patch_logs) "HSI48" else "RCC_MCO1SOURCE_HSI48",
                                    if (patch_logs) "MSIK" else "RCC_MCO1SOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
                }
                const user_val = config.RCC_MCO1SourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => {},
                        .RCC_MCO1SOURCE_HSI => {},
                        .RCC_MCO1SOURCE_MSI => {},
                        .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                        .RCC_MCO1SOURCE_PLL1CLK => MCO1SOURCE_PLLR = true,
                        .RCC_MCO1SOURCE_LSE => {},
                        .RCC_MCO1SOURCE_LSI => {},
                        .RCC_MCO1SOURCE_HSI48 => {},
                        .RCC_MCO1SOURCE_MSIK => MCO1SOURCE_MSIK = true,
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

            const LSCOSource1VirtualValue: LSCOSource1VirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    if (config.LSCOSource1Virtual) |val| {
                        if (val != .RCC_LSCOSOURCE_LSI) {
                            const patch_str = if (patch_logs) "LSI" else "RCC_LSCOSOURCE_LSI";
                            const val_enum = if (patch_logs) @tagName(try val.to_enum()) else @tagName(val);
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: .{s}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSCOSource1Virtual",
                                "(LSEOscillatorRTC|LSEByPassRTC)",
                                "LSE is configured only for RTC",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    LSCOSSourceLSI = true;
                    break :blk .RCC_LSCOSOURCE_LSI;
                }
                const user_val = config.LSCOSource1Virtual;

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
                        .SYSTICK_CLKSOURCE_HCLK => CLKSOURCE_HCLK = true,
                        .SYSTICK_CLKSOURCE_HCLK_DIV8 => CLKSOURCE_HCLK_DIV8 = true,
                    }
                }
                break :blk user_val orelse {
                    CLKSOURCE_HCLK = true;
                    break :blk .SYSTICK_CLKSOURCE_HCLK;
                };
            };

            const CortexCLockSelectionVirtualValue: CortexCLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.CortexCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .SYSTICK_CLKSOURCE_HCLK_1_8 => CLKSOURCE_HCLK_1_8 = true,
                            .SYSTICK_CLKSOURCE_LSI => CLKSOURCE_LSI = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "CortexCLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is configured only for RTC",
                                    @tagName(val),
                                    "SYSTICK_CLKSOURCE_HCLK_1_8",
                                    "SYSTICK_CLKSOURCE_LSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        CLKSOURCE_HCLK_1_8 = true;
                        break :blk .SYSTICK_CLKSOURCE_HCLK_1_8;
                    };
                }
                const user_val = config.CortexCLockSelectionVirtual;

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
                if (check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) {
                    break :blk 1;
                }
                break :blk 2;
            };

            const SPI1CLockSelectionValue: SPI1CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.SPI1CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SPI1CLKSOURCE_HSI => SPI1CLKSOURCE_HSI = true,
                            .RCC_SPI1CLKSOURCE_MSIK => SPI1CLKSOURCE_MSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "SPI1CLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_SPI1CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_SPI1CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        SPI1CLKSOURCE_HSI = true;
                        break :blk .RCC_SPI1CLKSOURCE_HSI;
                    };
                }
                const user_val = config.SPI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI1CLKSOURCE_PCLK2 => {},
                        .RCC_SPI1CLKSOURCE_SYSCLK => {},
                        .RCC_SPI1CLKSOURCE_HSI => SPI1CLKSOURCE_HSI = true,
                        .RCC_SPI1CLKSOURCE_MSIK => SPI1CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_SPI1CLKSOURCE_SYSCLK;
            };

            const SPI3CLockSelectionValue: SPI3CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.SPI3CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SPI3CLKSOURCE_HSI => SPI3CLKSOURCE_HSI = true,
                            .RCC_SPI3CLKSOURCE_MSIK => SPI3CLKSOURCE_MSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "SPI3CLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_SPI3CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_SPI3CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        SPI3CLKSOURCE_HSI = true;
                        break :blk .RCC_SPI3CLKSOURCE_HSI;
                    };
                }
                const user_val = config.SPI3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI3CLKSOURCE_PCLK3 => {},
                        .RCC_SPI3CLKSOURCE_SYSCLK => {},
                        .RCC_SPI3CLKSOURCE_HSI => SPI3CLKSOURCE_HSI = true,
                        .RCC_SPI3CLKSOURCE_MSIK => SPI3CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_SPI3CLKSOURCE_SYSCLK;
            };

            const SPI2CLockSelectionValue: SPI2CLockSelectionList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    const user_val = config.SPI2CLockSelection;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SPI2CLKSOURCE_HSI => SPI2CLKSOURCE_HSI = true,
                            .RCC_SPI2CLKSOURCE_MSIK => SPI2CLKSOURCE_MSIK = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "SPI2CLockSelection",
                                    "S_LPBAM_CONF",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSI" else "RCC_SPI2CLKSOURCE_HSI",
                                    if (patch_logs) "MSIK" else "RCC_SPI2CLKSOURCE_MSIK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        SPI2CLKSOURCE_HSI = true;
                        break :blk .RCC_SPI2CLKSOURCE_HSI;
                    };
                }
                const user_val = config.SPI2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI2CLKSOURCE_PCLK1 => {},
                        .RCC_SPI2CLKSOURCE_SYSCLK => {},
                        .RCC_SPI2CLKSOURCE_HSI => SPI2CLKSOURCE_HSI = true,
                        .RCC_SPI2CLKSOURCE_MSIK => SPI2CLKSOURCE_MSIK = true,
                    }
                }
                break :blk user_val orelse .RCC_SPI2CLKSOURCE_SYSCLK;
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
                };

                break :blk user_val orelse 0;
            };

            const PLL1PValue: u32 = blk: {
                const user_val = config.PLL1P;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL1P",
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
                            "PLL1P",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
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

            const PLL1RValue: PLL1RList = blk: {
                const user_val = config.PLL1R;

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

            const PLL3NValue: u32 = blk: {
                const user_val = config.PLL3N;
                if (user_val) |val| {
                    if (val < 4) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL3N",
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
                            "PLL3N",
                            "Else",
                            "No additional information",
                            512,
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

            const PLL3PValue: u32 = blk: {
                const user_val = config.PLL3P;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL3P",
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
                            "PLL3P",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLL3QValue: u32 = blk: {
                const user_val = config.PLL3Q;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL3Q",
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
                            "PLL3Q",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLL3RValue: u32 = blk: {
                const user_val = config.PLL3R;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLL3R",
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
                            "PLL3R",
                            "Else",
                            "No additional information",
                            128,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const MSI_VALUEValue: f32 = blk: {
                break :blk 4e6;
            };

            const EPOD_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const LSIDIV_VALUEValue: f32 = blk: {
                LSIclk.limit = .{
                    .min = 2.45e2,
                    .max = 3.26e4,
                };

                break :blk 3.2e4;
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
                    if (val > 31) {
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
                            31,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 16;
            };

            const LSEStateValue: LSEStateList = blk: {
                if (config.flags.LSEByPassRTC) {
                    if (config.extra_config.LSEState) |val| {
                        if (val != .RCC_LSE_BYPASS_RTC_ONLY) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSEState",
                                "LSEByPassRTC",
                                "LSE BYPass for RTC only",
                                "RCC_LSE_BYPASS_RTC_ONLY",
                                val,
                            });
                        }
                    }
                    break :blk .RCC_LSE_BYPASS_RTC_ONLY;
                } else if (config.flags.LSEOscillatorRTC) {
                    if (config.extra_config.LSEState) |val| {
                        if (val != .RCC_LSE_ON_RTC_ONLY) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSEState",
                                "LSEOscillatorRTC",
                                "Lse on for RTC only",
                                "RCC_LSE_ON_RTC_ONLY",
                                val,
                            });
                        }
                    }
                    break :blk .RCC_LSE_ON_RTC_ONLY;
                } else if (config.flags.LSEByPass) {
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
                        .RCC_LSE_BYPASS_RTC_ONLY => {},
                        .RCC_LSE_ON_RTC_ONLY => {},
                    }
                }
                break :blk user_val orelse .RCC_LSE_OFF;
            };

            const MSIAutoCalibrationValue: MSIAutoCalibrationList = blk: {
                if ((check_ref(@TypeOf(LSEStateValue), LSEStateValue, .RCC_LSE_OFF, .@"=")) and (((config.flags.USB_OTG_FSUsed_ForRCC or (SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) and CK48SourcePLL1Q and PLLSourceMSI) or ((config.flags.USB_OTG_FSUsed_ForRCC or (SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) and CK48SourcePLL2Q and PLL2SourceMSI))) {
                    if (config.extra_config.MSIAutoCalibration) |val| {
                        if (val != .PLLMODE_MSIS) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "MSIAutoCalibration",
                                "(LSEState=RCC_LSE_OFF) & (((USB_OTG_FSUsed_ForRCC |(SDMMC1SourceIsClock48 & (SDMMC1Used_ForRCC | SDMMC2Used_ForRCC)))&CK48SourcePLL1Q&PLLSourceMSI)|((USB_OTG_FSUsed_ForRCC |(SDMMC1SourceIsClock48 & (SDMMC1Used_ForRCC | SDMMC2Used_ForRCC)))&CK48SourcePLL2Q&PLL2SourceMSI))",
                                "",
                                "PLLMODE_MSIS",
                                val,
                            });
                        }
                    }
                    MSIAutoCalibrationON = true;
                    break :blk .PLLMODE_MSIS;
                } else if ((((config.flags.USB_OTG_FSUsed_ForRCC or (SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) and CK48SourcePLL1Q and PLLSourceMSI) or ((config.flags.USB_OTG_FSUsed_ForRCC or (SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) and CK48SourcePLL2Q and PLL2SourceMSI))) {
                    if (config.extra_config.MSIAutoCalibration) |val| {
                        if (val != .PLLMODE_MSIS) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "MSIAutoCalibration",
                                "(((USB_OTG_FSUsed_ForRCC |(SDMMC1SourceIsClock48 & (SDMMC1Used_ForRCC | SDMMC2Used_ForRCC)))&CK48SourcePLL1Q&PLLSourceMSI)|((USB_OTG_FSUsed_ForRCC |(SDMMC1SourceIsClock48 & (SDMMC1Used_ForRCC | SDMMC2Used_ForRCC)))&CK48SourcePLL2Q&PLL2SourceMSI))",
                                "",
                                "PLLMODE_MSIS",
                                val,
                            });
                        }
                    }
                    MSIAutoCalibrationON = true;
                    break :blk .PLLMODE_MSIS;
                } else if ((check_ref(@TypeOf(LSEStateValue), LSEStateValue, .RCC_LSE_OFF, .@"=")) and ((config.flags.USB_OTG_FSUsed_ForRCC or (SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) and CLK48CLKSOURCE_MSIK)) {
                    if (config.extra_config.MSIAutoCalibration) |val| {
                        if (val != .PLLMODE_MSIK) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "MSIAutoCalibration",
                                "(LSEState=RCC_LSE_OFF) & ((USB_OTG_FSUsed_ForRCC |(SDMMC1SourceIsClock48 & (SDMMC1Used_ForRCC | SDMMC2Used_ForRCC))) & CLK48CLKSOURCE_MSIK)",
                                "",
                                "PLLMODE_MSIK",
                                val,
                            });
                        }
                    }
                    MSIKAutoCalibrationON = true;
                    break :blk .PLLMODE_MSIK;
                } else if (((config.flags.USB_OTG_FSUsed_ForRCC or (SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) and CLK48CLKSOURCE_MSIK)) {
                    if (config.extra_config.MSIAutoCalibration) |val| {
                        if (val != .PLLMODE_MSIK) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "MSIAutoCalibration",
                                "((USB_OTG_FSUsed_ForRCC |(SDMMC1SourceIsClock48 & (SDMMC1Used_ForRCC | SDMMC2Used_ForRCC))) & CLK48CLKSOURCE_MSIK)",
                                "",
                                "PLLMODE_MSIK",
                                val,
                            });
                        }
                    }
                    MSIKAutoCalibrationON = true;
                    break :blk .PLLMODE_MSIK;
                }
                const user_val = config.extra_config.MSIAutoCalibration;

                if (user_val) |val| {
                    switch (val) {
                        .DISABLED => {},
                        .PLLMODE_MSIK => MSIKAutoCalibrationON = true,
                        .PLLMODE_MSIS => MSIAutoCalibrationON = true,
                    }
                }
                break :blk user_val orelse .DISABLED;
            };

            const MSIPLLFASTValue: MSIPLLFASTList = blk: {
                if (MSIAutoCalibrationON or MSIKAutoCalibrationON) {
                    const user_val = config.extra_config.MSIPLLFAST;

                    if (user_val) |val| {
                        switch (val) {
                            .true => {},
                            .false => {},
                        }
                    }
                    break :blk user_val orelse .false;
                }
                if (config.extra_config.MSIPLLFAST) |val| {
                    if (val != .false) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {s} found: {any}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "MSIPLLFAST",
                            "Else",
                            "No additional information",
                            "false",
                            val,
                        });
                    }
                }
                break :blk .false;
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

            const MSIKUsedValue: u1 = blk: {
                if (I2C1CLKSOURCE_MSIK and config.flags.I2C1Used_ForRCC or I2C4CLKSOURCE_MSIK and config.flags.I2C4Used_ForRCC or I2C2CLKSOURCE_MSIK and config.flags.I2C2Used_ForRCC or I2C3CLKSOURCE_MSIK and config.flags.I2C3Used_ForRCC or MDF1CLKSOURCE_MSIK and config.flags.MDF1_Used or ADF1CLKSOURCE_MSIK and config.flags.ADF1_Used or ADCSourceMSIK and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or check_MCU("DAC1") or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC4 and config.flags.ADCUsed_ForRCC)) or LPTIM1CLKSOURCE_MSIK and config.flags.LPTIM1Used_ForRCC or LPTIM34CLKSOURCE_MSIK and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC) or LPUART1SourceMSIK and config.flags.LPUARTUsed_ForRCC or SPI1CLKSOURCE_MSIK and config.flags.SPI1Used_ForRCC or SPI2CLKSOURCE_MSIK and config.flags.SPI2Used_ForRCC or SPI3CLKSOURCE_MSIK and config.flags.SPI3Used_ForRCC or (CLK48CLKSOURCE_MSIK and SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (OCTOSPIMSourceMSIK and (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC)) or (CLK48CLKSOURCE_MSIK and config.flags.USB_OTG_FSUsed_ForRCC) or (MCO1SOURCE_MSIK and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1PUsedValue: u1 = blk: {
                if (MDF1CLKSOURCE_PLL1P and config.flags.MDF1_Used or ADF1CLKSOURCE_PLL1P and config.flags.ADF1_Used or (SDMMC1SourceIsPllP and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or (SAI2SourcePLL1P and (config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI2_SAIAUsed_ForRCC)) or (SAI1SourcePLL1P and (config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1QUsedValue: u1 = blk: {
                if (((config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC) and OCTOSPIMSourcePLL1Q) or FDCANSourcePLL1Q and config.flags.FDCAN1Used_ForRCC or (CK48SourcePLL1Q and config.flags.USB_OTG_FSUsed_ForRCC) or (CK48SourcePLL1Q and SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL1RUsedValue: u1 = blk: {
                if (((SysSourcePLL) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_PLL1CLK, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLLUsedValue: u1 = blk: {
                if (check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL1RUsedValue), PLL1RUsedValue, 1, .@"=")) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2PUsedValue: u1 = blk: {
                if ((FDCANSourcePLL2P and config.flags.FDCAN1Used_ForRCC) or ((SAI1SourcePLL2P and (config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC)) or (SAI2SourcePLL2P and (config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI2_SAIAUsed_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2QUsedValue: u1 = blk: {
                if ((config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC) and OCTOSPIMSourcePLL2Q or (CK48SourcePLL2Q and config.flags.USB_OTG_FSUsed_ForRCC) or (CK48SourcePLL2Q and SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL2RUsedValue: u1 = blk: {
                if ((ADCSourcePLL2R and check_MCU("DAC1")) or (ADCSourcePLL2R and ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC4 and config.flags.ADCUsed_ForRCC)))) {
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

            const PLL3PUsedValue: u1 = blk: {
                if (((SAI1SourcePLL3P and (config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC)) or (SAI2SourcePLL3P and (config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI2_SAIAUsed_ForRCC)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3QUsedValue: u1 = blk: {
                if ((MDF1CLKSOURCE_PLL3Q and config.flags.MDF1_Used) or (ADF1CLKSOURCE_PLL3Q and config.flags.ADF1_Used)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLL3UsedValue: u1 = blk: {
                if (check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const MSISUsedValue: u32 = blk: {
                if (WakeUpClockMSI and check_MCU("S_LPBAM_CONF")) {
                    break :blk 1;
                } else if (!check_MCU("S_LPBAM_CONF") and ((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_MSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_MSI, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)) or PLLSourceMSI and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or (PLL2SourceMSI and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) or (PLL3SourceMSI and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const MSIUsedValue: u1 = blk: {
                if (check_ref(@TypeOf(MSIKUsedValue), MSIKUsedValue, 1, .@"=") or check_ref(@TypeOf(MSISUsedValue), MSISUsedValue, 1, .@"=")) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSEUsedValue: u1 = blk: {
                if (CLKSOURCE_LSE or DAC1CLKSOURCE_LSE and check_MCU("DAC1") or ((MSIAutoCalibrationON or MSIKAutoCalibrationON) and check_ref(@TypeOf(MSIUsedValue), MSIUsedValue, 1, .@"=") and (config.flags.LSEByPass or config.flags.LSEByPassRTC or config.flags.LSEOscillator or config.flags.LSEOscillatorRTC)) or (LSCOSSourceLSE and config.flags.LSCOConfig) or (check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM16")) or (check_MCU("SEM2RCC_LSE_REQUIRED_TIM2") and check_MCU("Semaphore_TIM2_L4_ETR_REMAPTIM2") and check_MCU("TIM2")) or (check_MCU("Semaphore_input_Channel1_directTIM15") and true and check_MCU("SEM2RCC_LSE_REQUIRED1_TIM15")) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (USART2SourceLSE and config.flags.USART2Used_ForRCC) or (USART3SourceLSE and config.flags.USART3Used_ForRCC) or (UART4SourceLSE and config.flags.UART4Used_ForRCC) or (UART5SourceLSE and config.flags.UART5Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCELSE and config.flags.LPTIM2Used_ForRCC) or (LPTIM3SOURCELSE and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC)) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC or config.flags.LCDUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSE_Drive_CapabilityValue: ?LSE_Drive_CapabilityList = blk: {
                if ((config.flags.LSEOscillator or config.flags.LSEOscillatorRTC) and (check_ref(@TypeOf(LSEUsedValue), LSEUsedValue, 1, .@"="))) {
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

            const PLL1MBOOSTValue: ?PLL1MBOOSTList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.extra_config.PLL1MBOOST) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "PLL1MBOOST", "S_LPBAM_CONF", "PLL used" });
                    }
                    break :blk null;
                } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    const user_val = config.extra_config.PLL1MBOOST;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_PLLMBOOST_DIV1 => {},
                            .RCC_PLLMBOOST_DIV2 => {},
                            .RCC_PLLMBOOST_DIV4 => {},
                            .RCC_PLLMBOOST_DIV6 => {},
                            .RCC_PLLMBOOST_DIV8 => {},
                            .RCC_PLLMBOOST_DIV10 => {},
                            .RCC_PLLMBOOST_DIV12 => {},
                            .RCC_PLLMBOOST_DIV14 => {},
                            .RCC_PLLMBOOST_DIV16 => {},
                        }
                    }
                    break :blk user_val orelse .RCC_PLLMBOOST_DIV1;
                }
                if (config.extra_config.PLL1MBOOST) |_| {
                    return comptime_fail_or_error(error.InvalidConfig,
                        \\
                        \\Error on {s} | expr: {s} diagnostic: {s} 
                        \\Value should be null.
                        \\note: some configurations are invalid in certain cases.
                        \\
                        \\
                    , .{ "PLL1MBOOST", "Else", "No additional information" });
                }
                break :blk null;
            };

            const MSIKERONValue: ?MSIKERONList = blk: {
                if (config.flags.LPTIM1_Used and LPTIM1CLKSOURCE_MSIK or (config.flags.LPTIM3_Used or config.flags.LPTIM4_Used) and LPTIM34CLKSOURCE_MSIK) {
                    if (config.extra_config.MSIKERON) |val| {
                        if (val != .true) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "MSIKERON",
                                "LPTIM1_Used & LPTIM1CLKSOURCE_MSIK | (LPTIM3_Used | LPTIM4_Used) & LPTIM34CLKSOURCE_MSIK",
                                "",
                                "true",
                                val,
                            });
                        }
                    }
                    break :blk .true;
                }
                if (config.extra_config.MSIKERON) |_| {
                    return comptime_fail_or_error(error.InvalidConfig,
                        \\
                        \\Error on {s} | expr: {s} diagnostic: {s} 
                        \\Value should be null.
                        \\note: some configurations are invalid in certain cases.
                        \\
                        \\
                    , .{ "MSIKERON", "Else", "No additional information" });
                }
                break :blk null;
            };

            const HSIKERONValue: ?HSIKERONList = blk: {
                if (config.flags.LPTIM1_Used and LPTIM1SOURCEHSI or config.flags.LPTIM2_Used and LPTIM2SOURCEHSI or (config.flags.LPTIM3_Used or config.flags.LPTIM4_Used) and LPTIM3SOURCEHSI) {
                    if (config.extra_config.HSIKERON) |val| {
                        if (val != .true) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "HSIKERON",
                                "LPTIM1_Used & LPTIM1SOURCEHSI | LPTIM2_Used & LPTIM2SOURCEHSI | (LPTIM3_Used | LPTIM4_Used) & LPTIM3SOURCEHSI",
                                "",
                                "true",
                                val,
                            });
                        }
                    }
                    hsikeron_ENABLED = true;
                    break :blk .true;
                }
                if (config.extra_config.HSIKERON) |_| {
                    return comptime_fail_or_error(error.InvalidConfig,
                        \\
                        \\Error on {s} | expr: {s} diagnostic: {s} 
                        \\Value should be null.
                        \\note: some configurations are invalid in certain cases.
                        \\
                        \\
                    , .{ "HSIKERON", "Else", "No additional information" });
                }
                break :blk null;
            };

            const EnableCRSValue: EnableCRSList = blk: {
                if (config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RNGEnableLPBAMValue: RNGEnableLPBAMList = blk: {
                if (config.flags.RNGUsed_ForRCC and !check_MCU("S_LPBAM_CONF")) {
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

            const SDMMCEnableLPBAMValue: SDMMCEnableLPBAMList = blk: {
                if ((config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC) and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USB_OTG_FSUsed_ForRCC and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableSAESValue: EnableSAESList = blk: {
                if (config.flags.SAES_Used) {
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

            const notInLPBAMValue: notInLPBAMList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    break :blk .false;
                }
                break :blk .true;
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

            const DACEnableValue: DACEnableList = blk: {
                if (check_MCU("DAC1")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if ((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC4 and config.flags.ADCUsed_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SDMMCEnableValue: SDMMCEnableList = blk: {
                if ((config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) {
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

            const I2C3EnableValue: I2C3EnableList = blk: {
                if (config.flags.I2C3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if ((config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI2EnableValue: SAI2EnableList = blk: {
                if (config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI2_SAIAUsed_ForRCC) {
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

            const MDF1EnableValue: MDF1EnableList = blk: {
                if (config.flags.MDF1_Used) {
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

            const OCTOSPIMEnableValue: OCTOSPIMEnableList = blk: {
                if (config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM3EnableValue: LPTIM3EnableList = blk: {
                if ((config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC)) {
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

            const LSCOEnableValue: LSCOEnableList = blk: {
                if (config.flags.LSCOConfig) {
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

            const SPI1EnableValue: SPI1EnableList = blk: {
                if (config.flags.SPI1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI3EnableValue: SPI3EnableList = blk: {
                if (config.flags.SPI3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPI2EnableValue: SPI2EnableList = blk: {
                if (config.flags.SPI2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableLPBAMValue: SAI1EnableLPBAMList = blk: {
                if ((config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC) and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI2EnableLPBAMValue: SAI2EnableLPBAMList = blk: {
                if ((config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI2_SAIAUsed_ForRCC) and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MDF1EnableLPBAMValue: MDF1EnableLPBAMList = blk: {
                if (config.flags.MDF1_Used and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADF1EnableLPBAMValue: ADF1EnableLPBAMList = blk: {
                if (config.flags.ADF1_Used and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FDCANEnableLPBAMValue: FDCANEnableLPBAMList = blk: {
                if (config.flags.FDCAN1Used_ForRCC and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const OCTOSPIMEnableLPBAMValue: OCTOSPIMEnableLPBAMList = blk: {
                if ((config.flags.OCTOSPI1Used_ForRCC or config.flags.OCTOSPI2Used_ForRCC) and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableLPBAMValue: ADCEnableLPBAMList = blk: {
                if (((config.flags.USE_ADC1 and config.flags.ADC1UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC2 and config.flags.ADC2UsedAsynchronousCLK_ForRCC) or (config.flags.USE_ADC4 and config.flags.ADCUsed_ForRCC)) and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const DACEnableLPBAMValue: DACEnableLPBAMList = blk: {
                if (check_MCU("DAC1") and !check_MCU("S_LPBAM_CONF")) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const FullHSI48UsedValue: u1 = blk: {
                if (RNGCLKSOURCE_HSI48 and config.flags.RNGUsed_ForRCC or (CK48SourceHSI48 and SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB or (CK48SourceHSI48 and config.flags.USB_OTG_FSUsed_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_HSI48, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig))))) {
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

            const HSIUsedValue: u1 = blk: {
                if (WakeUpClockHSI and check_MCU("S_LPBAM_CONF") or SPI1CLKSOURCE_HSI and config.flags.SPI1Used_ForRCC or SPI2CLKSOURCE_HSI and config.flags.SPI2Used_ForRCC or SPI3CLKSOURCE_HSI and config.flags.SPI3Used_ForRCC or ADCSourceHSI and (config.flags.USE_ADC1 or config.flags.USE_ADC2 or config.flags.USE_ADC4 or check_MCU("DAC1")) or (RNGCLKSOURCE_HSI and config.flags.RNGUsed_ForRCC) or (config.flags.UCPD1_Used) or (SAI2SourceHSI and (config.flags.SAI2_SAIBUsed_ForRCC or config.flags.SAI2_SAIAUsed_ForRCC)) or (SAI1SourceHSI and (config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC)) or (USART1SourceHSI and config.flags.USART1Used_ForRCC) or (USART2SourceHSI and config.flags.USART2Used_ForRCC) or (USART3SourceHSI and config.flags.USART3Used_ForRCC) or (UART4SourceHSI and config.flags.UART4Used_ForRCC) or (UART5SourceHSI and config.flags.UART5Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCEHSI and config.flags.LPTIM2Used_ForRCC) or (LPTIM3SOURCEHSI and (config.flags.LPTIM3Used_ForRCC or config.flags.LPTIM4Used_ForRCC)) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C2SourceHSI and config.flags.I2C2Used_ForRCC) or (I2C3SourceHSI and config.flags.I2C3Used_ForRCC) or (I2C4SourceHSI and config.flags.I2C4Used_ForRCC) or (check_MCU("SWPMISourceHSI") and config.flags.SWPMI1Used_ForRCC) or (PLLSourceHSI and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) or (PLL2SourceHSI and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) or (PLL3SourceHSI and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM17") and check_MCU("TIM17") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM17")) or config.flags.MCOConfig))))) {
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
                if (((RNGCLKSOURCE_HSI48 or RNGCLKSOURCE_HSI48DIV2) and config.flags.RNGUsed_ForRCC) or (CK48SourceHSI48 and SDMMC1SourceIsClock48 and (config.flags.SDMMC1Used_ForRCC or config.flags.SDMMC2Used_ForRCC)) or config.flags.CRSActivatedSourceGPIO or config.flags.CRSActivatedSourceLSE or config.flags.CRSActivatedSourceUSB or (CK48SourceHSI48 and config.flags.USB_OTG_FSUsed_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_HSI48, .@"=")) and ((((check_MCU("Semaphore_input_Channel1TIM16") and check_MCU("TIM16") and check_MCU("SEM2RCC_MCO_REQUIRED_TIM16")) or config.flags.MCOConfig))))) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            if (!check_MCU("S_LPBAM_CONF")) {
                HSIRC.nodetype = .source;
                HSIRC.value = HSI_VALUEValue;
            }
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE CRSCLKoutput ======
            if (check_ref(@TypeOf(EnableCRSValue), EnableCRSValue, .true, .@"=")) {
                CRSCLKoutput.nodetype = .output;
                CRSCLKoutput.parents = &.{&HSI48RC};
            }
            // ======= NODE HSI48RC ======
            if (check_ref(@TypeOf(EnableCRSValue), EnableCRSValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableLPBAMValue), RNGEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                if (!check_MCU("S_LPBAM_CONF")) {
                    HSI48RC.nodetype = .source;
                    HSI48RC.value = HSI48_VALUEValue;
                }
                HSI48RC.nodetype = .source;
                HSI48RC.value = HSI48_VALUEValue;
            }
            // ======= NODE SHSIRC ======
            if (check_ref(@TypeOf(EnableSAESValue), EnableSAESValue, .true, .@"=")) {
                if (check_MCU("SAES_Exist")) {
                    SHSIRC.nodetype = .source;
                    SHSIRC.value = SHSI_VALUEValue;
                }
            }
            // ======= NODE SHSIDiv ======
            if (check_ref(@TypeOf(EnableSAESValue), EnableSAESValue, .true, .@"=")) {
                if (check_MCU("SAES_Exist")) {
                    SHSIDiv.nodetype = .div;
                    SHSIDiv.value = @floatFromInt(SHSIDivValue);
                    SHSIDiv.parents = &.{&SHSIRC};
                }
            }
            // ======= NODE SAESMult ======
            if (check_ref(@TypeOf(EnableSAESValue), EnableSAESValue, .true, .@"=")) {
                if (check_MCU("SAES_Exist")) {
                    SAESMult.nodetype = .multi;
                    SAESMult.parents = switch (SAESSourceValue) {
                        .RCC_SAESCLKSOURCE_SHSI => &.{&SHSIRC},
                        .RCC_SAESCLKSOURCE_SHSI_DIV2 => &.{&SHSIDiv},
                    };
                }
            }
            // ======= NODE SAESoutput ======
            if (check_ref(@TypeOf(EnableSAESValue), EnableSAESValue, .true, .@"=")) {
                if (check_MCU("SAES_Exist")) {
                    SAESoutput.nodetype = .output;
                    SAESoutput.parents = &.{&SAESMult};
                }
            }
            // ======= NODE LSIRC ======
            if (check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"=")) {
                if (!check_MCU("S_LPBAM_CONF")) {
                    LSIRC.nodetype = .source;
                    LSIRC.value = LSI_VALUEValue;
                }
                LSIRC.nodetype = .source;
                LSIRC.value = LSI_VALUEValue;
            }
            // ======= NODE LSIDIV ======
            LSIDIV.nodetype = .div;
            LSIDIV.value = try LSIDIVValue.get();
            LSIDIV.parents = &.{&LSIRC};

            // ======= NODE LSEOSC ======
            if (!check_MCU("S_LPBAM_CONF")) {
                LSEOSC.nodetype = .source;
                LSEOSC.value = LSE_VALUEValue;
            }
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE MSIRC ======
            if (!check_MCU("S_LPBAM_CONF")) {
                MSIRC.nodetype = .source;
                MSIRC.value = try MSIClockRangeValue.get();
            }
            MSIRC.nodetype = .source;
            MSIRC.value = try MSIClockRangeValue.get();

            // ======= NODE MSIKRC ======
            MSIKRC.nodetype = .source;
            MSIKRC.value = try MSIKClockRangeValue.get();

            // ======= NODE SAI1_EXT ======
            if (check_ref(@TypeOf(EnableExtClockForSAI1Value), EnableExtClockForSAI1Value, .true, .@"=")) {
                SAI1_EXT.nodetype = .source;
                SAI1_EXT.value = EXTERNALSAI1_CLOCK_VALUEValue;
            }
            // ======= NODE RCC_Stop_WakeUpClock ======
            if (check_MCU("S_LPBAM_CONF")) {
                RCC_Stop_WakeUpClock.nodetype = .multi;
                RCC_Stop_WakeUpClock.parents = switch (RCC_Stop_WakeUpClockValue) {
                    .RCC_STOP_WAKEUPCLOCK_MSI => &.{&MSIRC},
                    .RCC_STOP_WAKEUPCLOCK_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE WakeUpClockOutput ======
            if (check_MCU("S_LPBAM_CONF")) {
                WakeUpClockOutput.nodetype = .output;
                WakeUpClockOutput.parents = &.{&RCC_Stop_WakeUpClock};
            }
            // ======= NODE SysClkSource ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                if (!check_MCU("S_LPBAM_CONF")) {
                    SysClkSource.nodetype = .multi;
                    SysClkSource.parents = switch (SYSCLKSourceValue) {
                        .RCC_SYSCLKSOURCE_MSI => &.{&MSIRC},
                        .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                        .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLL1R},
                    };
                }
                SysClkSource.nodetype = .multi;
                SysClkSource.parents = switch (SYSCLKSourceValue) {
                    .RCC_SYSCLKSOURCE_MSI => &.{&MSIRC},
                    .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                    .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLL1R},
                };
            }
            // ======= NODE SysCLKOutput ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                SysCLKOutput.nodetype = .output;
                SysCLKOutput.parents = &.{&SysClkSource};
            }
            // ======= NODE PLLSource ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                if (!check_MCU("S_LPBAM_CONF")) {
                    PLLSource.nodetype = .multi;
                    PLLSource.parents = switch (PLLSourceVirtualValue) {
                        .RCC_PLLSOURCE_MSI => &.{&MSIRC},
                        .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                        .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                    };
                }
                PLLSource.nodetype = .multi;
                PLLSource.parents = switch (PLLSourceVirtualValue) {
                    .RCC_PLLSOURCE_MSI => &.{&MSIRC},
                    .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                    .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE PLL2Source ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                if (!check_MCU("S_LPBAM_CONF")) {
                    PLL2Source.nodetype = .multi;
                    PLL2Source.parents = switch (PLL2SourceValue) {
                        .RCC_PLLSOURCE_MSI => &.{&MSIRC},
                        .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                        .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                    };
                }
                PLL2Source.nodetype = .multi;
                PLL2Source.parents = switch (PLL2SourceValue) {
                    .RCC_PLLSOURCE_MSI => &.{&MSIRC},
                    .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                    .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE PLL3Source ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                if (!check_MCU("S_LPBAM_CONF")) {
                    PLL3Source.nodetype = .multi;
                    PLL3Source.parents = switch (PLL3SourceValue) {
                        .RCC_PLLSOURCE_MSI => &.{&MSIRC},
                        .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                        .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                    };
                }
                PLL3Source.nodetype = .multi;
                PLL3Source.parents = switch (PLL3SourceValue) {
                    .RCC_PLLSOURCE_MSI => &.{&MSIRC},
                    .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                    .RCC_PLLSOURCE_HSE => &.{&HSEOSC},
                };
            }
            // ======= NODE PLLM ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLLM.nodetype = .div;
                PLLM.value = @floatFromInt(PLLMValue);
                PLLM.parents = &.{&PLLSource};
            }
            // ======= NODE PLL2M ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLL2M.nodetype = .div;
                PLL2M.value = @floatFromInt(PLL2MValue);
                PLL2M.parents = &.{&PLL2Source};
            }
            // ======= NODE PLL3M ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLL3M.nodetype = .div;
                PLL3M.value = @floatFromInt(PLL3MValue);
                PLL3M.parents = &.{&PLL3Source};
            }
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
                    .RCC_RTCCLKSOURCE_LSI => &.{&LSIDIV},
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
                IWDGOutput.parents = &.{&LSIDIV};
            }
            // ======= NODE USART1Mult ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1Mult.nodetype = .multi;
                USART1Mult.parents = switch (USART1CLockSelectionVirtualValue) {
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
                if (check_MCU("USART2_Exist")) {
                    USART2Mult.nodetype = .multi;
                    USART2Mult.parents = switch (USART2CLockSelectionVirtualValue) {
                        .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                        .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                        .RCC_USART2CLKSOURCE_HSI => &.{&HSIRC},
                        .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                    };
                }
            }
            // ======= NODE USART2output ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                if (check_MCU("USART2_Exist")) {
                    USART2output.nodetype = .output;
                    USART2output.parents = &.{&USART2Mult};
                }
            }
            // ======= NODE USART3Mult ======
            if (check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=")) {
                USART3Mult.nodetype = .multi;
                USART3Mult.parents = switch (USART3CLockSelectionVirtualValue) {
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
                UART4Mult.parents = switch (UART4CLockSelectionVirtualValue) {
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
                if (check_MCU("UART5_Exist")) {
                    UART5Mult.nodetype = .multi;
                    UART5Mult.parents = switch (UART5CLockSelectionVirtualValue) {
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
            // ======= NODE LPUART1Mult ======
            if (check_ref(@TypeOf(LPUART1EnableValue), LPUART1EnableValue, .true, .@"=")) {
                LPUART1Mult.nodetype = .multi;
                LPUART1Mult.parents = switch (LPUART1CLockSelectionVirtualValue) {
                    .RCC_LPUART1CLKSOURCE_PCLK3 => &.{&APB3Output},
                    .RCC_LPUART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_LPUART1CLKSOURCE_MSIK => &.{&MSIKRC},
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
                LPTIM1Mult.parents = switch (LPTIM1CLockSelectionVirtualValue) {
                    .RCC_LPTIM1CLKSOURCE_MSIK => &.{&MSIKRC},
                    .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIDIV},
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
                LPTIM2Mult.parents = switch (LPTIM2CLockSelectionVirtualValue) {
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIDIV},
                    .RCC_LPTIM2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM2output ======
            if (check_ref(@TypeOf(LPTIM2EnableValue), LPTIM2EnableValue, .true, .@"=")) {
                LPTIM2output.nodetype = .output;
                LPTIM2output.parents = &.{&LPTIM2Mult};
            }
            // ======= NODE DACMult ======
            if (check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"=")) {
                DACMult.nodetype = .multi;
                DACMult.parents = switch (DACCLockSelectionVirtualValue) {
                    .RCC_DAC1CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_DAC1CLKSOURCE_LSI => &.{&LSIDIV},
                };
            }
            // ======= NODE DACoutput ======
            if (check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"=")) {
                DACoutput.nodetype = .output;
                DACoutput.parents = &.{&DACMult};
            }
            // ======= NODE ADCMult ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"=")) {
                ADCMult.nodetype = .multi;
                ADCMult.parents = switch (ADCCLockSelectionValue) {
                    .RCC_ADCDACCLKSOURCE_HCLK => &.{&AHBOutput},
                    .RCC_ADCDACCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_ADCDACCLKSOURCE_PLL2 => &.{&PLL2R},
                    .RCC_ADCDACCLKSOURCE_HSE => &.{&HSEOSC},
                    .RCC_ADCDACCLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_ADCDACCLKSOURCE_MSIK => &.{&MSIKRC},
                };
            }
            // ======= NODE ADCoutput ======
            if (check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(DACEnableValue), DACEnableValue, .true, .@"=")) {
                ADCoutput.nodetype = .output;
                ADCoutput.parents = &.{&ADCMult};
            }
            // ======= NODE CK48Mult ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=")) {
                if (check_MCU("SDMMC1_Exist") or check_MCU("SDMMC2_Exist") or check_MCU("USB_OTG_FS_Exist") or check_MCU("USB_DRD_FS_Exist")) {
                    CK48Mult.nodetype = .multi;
                    CK48Mult.parents = switch (CK48CLockSelectionValue) {
                        .RCC_CLK48CLKSOURCE_PLL2 => &.{&PLL2Q},
                        .RCC_CLK48CLKSOURCE_PLL1 => &.{&PLL1Q},
                        .RCC_CLK48CLKSOURCE_MSIK => &.{&MSIKRC},
                        .RCC_CLK48CLKSOURCE_HSI48 => &.{&HSI48RC},
                    };
                }
            }
            // ======= NODE CK48output ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=")) {
                if (check_MCU("SDMMC1_Exist") or check_MCU("SDMMC2_Exist") or check_MCU("USB_OTG_FS_Exist") or check_MCU("USB_DRD_FS_Exist")) {
                    CK48output.nodetype = .output;
                    CK48output.parents = &.{&CK48Mult};
                }
            }
            // ======= NODE USBoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                if (check_MCU("USB_OTG_FS_Exist") or check_MCU("USB_DRD_FS_Exist")) {
                    USBoutput.nodetype = .output;
                    USBoutput.parents = &.{&CK48Mult};
                }
            }
            // ======= NODE SDMMC1Mult ======
            if (check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=")) {
                if (check_MCU("SDMMC1_Exist") or check_MCU("SDMMC2_Exist")) {
                    SDMMC1Mult.nodetype = .multi;
                    SDMMC1Mult.parents = switch (SDMMCClockSelectionValue) {
                        .RCC_SDMMCCLKSOURCE_PLL1 => &.{&PLL1P},
                        .RCC_SDMMCCLKSOURCE_CLK48 => &.{&CK48Mult},
                    };
                }
            }
            // ======= NODE SDMMCC1Output ======
            if (check_ref(@TypeOf(SDMMCEnableValue), SDMMCEnableValue, .true, .@"=")) {
                if (check_MCU("SDMMC1_Exist") or check_MCU("SDMMC2_Exist")) {
                    SDMMCC1Output.nodetype = .output;
                    SDMMCC1Output.parents = &.{&SDMMC1Mult};
                }
            }
            // ======= NODE FDCANMult ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=")) {
                if (check_MCU("FDCAN1_Exist")) {
                    FDCANMult.nodetype = .multi;
                    FDCANMult.parents = switch (FDCANClockSelectionValue) {
                        .RCC_FDCAN1CLKSOURCE_PLL1 => &.{&PLL1Q},
                        .RCC_FDCAN1CLKSOURCE_PLL2 => &.{&PLL2P},
                        .RCC_FDCAN1CLKSOURCE_HSE => &.{&HSEOSC},
                    };
                }
            }
            // ======= NODE FDCANOutput ======
            if (check_ref(@TypeOf(FDCANEnableValue), FDCANEnableValue, .true, .@"=")) {
                if (check_MCU("FDCAN1_Exist")) {
                    FDCANOutput.nodetype = .output;
                    FDCANOutput.parents = &.{&FDCANMult};
                }
            }
            // ======= NODE I2C1Mult ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                I2C1Mult.nodetype = .multi;
                I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C1CLKSOURCE_MSIK => &.{&MSIKRC},
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
                    .RCC_I2C2CLKSOURCE_MSIK => &.{&MSIKRC},
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
                    .RCC_I2C3CLKSOURCE_PCLK3 => &.{&APB3Output},
                    .RCC_I2C3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C3CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C3CLKSOURCE_MSIK => &.{&MSIKRC},
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
                    .RCC_SAI1CLKSOURCE_PLL2 => &.{&PLL2P},
                    .RCC_SAI1CLKSOURCE_PLL3 => &.{&PLL3P},
                    .RCC_SAI1CLKSOURCE_PLL1 => &.{&PLL1P},
                    .RCC_SAI1CLKSOURCE_PIN => &.{&SAI1_EXT},
                    .RCC_SAI1CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE SAI1output ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1output.nodetype = .output;
                SAI1output.parents = &.{&SAI1Mult};
            }
            // ======= NODE SAI2Mult ======
            if (check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                if (check_MCU("SAI2_Exist")) {
                    SAI2Mult.nodetype = .multi;
                    SAI2Mult.parents = switch (SAI2CLockSelectionValue) {
                        .RCC_SAI2CLKSOURCE_PLL2 => &.{&PLL2P},
                        .RCC_SAI2CLKSOURCE_PLL3 => &.{&PLL3P},
                        .RCC_SAI2CLKSOURCE_PLL1 => &.{&PLL1P},
                        .RCC_SAI2CLKSOURCE_PIN => &.{&SAI1_EXT},
                        .RCC_SAI2CLKSOURCE_HSI => &.{&HSIRC},
                    };
                }
            }
            // ======= NODE SAI2output ======
            if (check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                if (check_MCU("SAI2_Exist")) {
                    SAI2output.nodetype = .output;
                    SAI2output.parents = &.{&SAI2Mult};
                }
            }
            // ======= NODE I2C4Mult ======
            if (check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=")) {
                I2C4Mult.nodetype = .multi;
                I2C4Mult.parents = switch (I2C4CLockSelectionValue) {
                    .RCC_I2C4CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C4CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C4CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C4CLKSOURCE_MSIK => &.{&MSIKRC},
                };
            }
            // ======= NODE I2C4output ======
            if (check_ref(@TypeOf(I2C4EnableValue), I2C4EnableValue, .true, .@"=")) {
                I2C4output.nodetype = .output;
                I2C4output.parents = &.{&I2C4Mult};
            }
            // ======= NODE MDF1Mult ======
            if (check_ref(@TypeOf(MDF1EnableValue), MDF1EnableValue, .true, .@"=")) {
                MDF1Mult.nodetype = .multi;
                MDF1Mult.parents = switch (MdfClockSelectionValue) {
                    .RCC_MDF1CLKSOURCE_HCLK => &.{&AHBOutput},
                    .RCC_MDF1CLKSOURCE_PLL1 => &.{&PLL1P},
                    .RCC_MDF1CLKSOURCE_PLL3 => &.{&PLL3Q},
                    .RCC_MDF1CLKSOURCE_PIN => &.{&SAI1_EXT},
                    .RCC_MDF1CLKSOURCE_MSIK => &.{&MSIKRC},
                };
            }
            // ======= NODE MDF1output ======
            if (check_ref(@TypeOf(MDF1EnableValue), MDF1EnableValue, .true, .@"=")) {
                MDF1output.nodetype = .output;
                MDF1output.parents = &.{&MDF1Mult};
            }
            // ======= NODE ADF1Mult ======
            if (check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"=")) {
                ADF1Mult.nodetype = .multi;
                ADF1Mult.parents = switch (AdfClockSelectionValue) {
                    .RCC_ADF1CLKSOURCE_HCLK => &.{&AHBOutput},
                    .RCC_ADF1CLKSOURCE_PLL1 => &.{&PLL1P},
                    .RCC_ADF1CLKSOURCE_PLL3 => &.{&PLL3Q},
                    .RCC_ADF1CLKSOURCE_PIN => &.{&SAI1_EXT},
                    .RCC_ADF1CLKSOURCE_MSIK => &.{&MSIKRC},
                };
            }
            // ======= NODE ADF1output ======
            if (check_ref(@TypeOf(ADF1EnableValue), ADF1EnableValue, .true, .@"=")) {
                ADF1output.nodetype = .output;
                ADF1output.parents = &.{&ADF1Mult};
            }
            // ======= NODE OCTOSPIMMult ======
            if (check_ref(@TypeOf(OCTOSPIMEnableValue), OCTOSPIMEnableValue, .true, .@"=")) {
                OCTOSPIMMult.nodetype = .multi;
                OCTOSPIMMult.parents = switch (OCTOSPIMCLockSelectionValue) {
                    .RCC_OSPICLKSOURCE_MSIK => &.{&MSIKRC},
                    .RCC_OSPICLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_OSPICLKSOURCE_PLL1 => &.{&PLL1Q},
                    .RCC_OSPICLKSOURCE_PLL2 => &.{&PLL2Q},
                };
            }
            // ======= NODE OCTOSPIMoutput ======
            if (check_ref(@TypeOf(OCTOSPIMEnableValue), OCTOSPIMEnableValue, .true, .@"=")) {
                OCTOSPIMoutput.nodetype = .output;
                OCTOSPIMoutput.parents = &.{&OCTOSPIMMult};
            }
            // ======= NODE LPTIM3Mult ======
            if (check_ref(@TypeOf(LPTIM3EnableValue), LPTIM3EnableValue, .true, .@"=")) {
                LPTIM3Mult.nodetype = .multi;
                LPTIM3Mult.parents = switch (LPTIM3CLockSelectionVirtualValue) {
                    .RCC_LPTIM34CLKSOURCE_MSIK => &.{&MSIKRC},
                    .RCC_LPTIM34CLKSOURCE_LSI => &.{&LSIDIV},
                    .RCC_LPTIM34CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM34CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM3output ======
            if (check_ref(@TypeOf(LPTIM3EnableValue), LPTIM3EnableValue, .true, .@"=")) {
                LPTIM3output.nodetype = .output;
                LPTIM3output.parents = &.{&LPTIM3Mult};
            }
            // ======= NODE HSI48DivToRNG ======
            if (check_ref(@TypeOf(RNGEnableLPBAMValue), RNGEnableLPBAMValue, .true, .@"=")) {
                HSI48DivToRNG.nodetype = .div;
                HSI48DivToRNG.value = @floatFromInt(HSI48DivToRNGValue);
                HSI48DivToRNG.parents = &.{&HSI48RC};
            }
            // ======= NODE RNGMult ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGMult.nodetype = .multi;
                RNGMult.parents = switch (RNGCLockSelectionValue) {
                    .RCC_RNGCLKSOURCE_HSI48 => &.{&HSI48RC},
                    .RCC_RNGCLKSOURCE_HSI48_DIV2 => &.{&HSI48DivToRNG},
                    .RCC_RNGCLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE RNGoutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGoutput.nodetype = .output;
                RNGoutput.parents = &.{&RNGMult};
            }
            // ======= NODE MCOMult ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCO1SourceVirtualValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIDIV},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLL1CLK => &.{&PLL1R},
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO1SOURCE_MSI => &.{&MSIRC},
                    .RCC_MCO1SOURCE_HSI48 => &.{&HSI48RC},
                    .RCC_MCO1SOURCE_MSIK => &.{&MSIKRC},
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
                LSCOMult.parents = switch (LSCOSource1VirtualValue) {
                    .RCC_LSCOSOURCE_LSI => &.{&LSIDIV},
                    .RCC_LSCOSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LSCOOutput ======
            if (check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"=")) {
                LSCOOutput.nodetype = .output;
                LSCOOutput.parents = &.{&LSCOMult};
            }
            // ======= NODE AHBPrescaler ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                if (!check_MCU("S_LPBAM_CONF")) {
                    AHBPrescaler.nodetype = .div;
                    AHBPrescaler.value = try AHBCLKDividerValue.get();
                    AHBPrescaler.parents = &.{&SysCLKOutput};
                }
                AHBPrescaler.nodetype = .div;
                AHBPrescaler.value = try AHBCLKDividerValue.get();
                AHBPrescaler.parents = &.{&SysCLKOutput};
            }
            // ======= NODE AHBOutput ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                AHBOutput.nodetype = .output;
                AHBOutput.parents = &.{&AHBPrescaler};
            }
            // ======= NODE HCLKOutput ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                HCLKOutput.nodetype = .output;
                HCLKOutput.parents = &.{&AHBOutput};
            }
            // ======= NODE CortexPrescaler ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                CortexPrescaler.nodetype = .div;
                CortexPrescaler.value = try Cortex_DivValue.get();
                CortexPrescaler.parents = &.{&AHBOutput};
            }
            // ======= NODE CortexCLockSelection ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                CortexCLockSelection.nodetype = .multi;
                CortexCLockSelection.parents = switch (CortexCLockSelectionVirtualValue) {
                    .SYSTICK_CLKSOURCE_HCLK_1_8 => &.{&CortexPrescaler},
                    .SYSTICK_CLKSOURCE_LSE => &.{&LSEOSC},
                    .SYSTICK_CLKSOURCE_LSI => &.{&LSIDIV},
                };
            }
            // ======= NODE CortexSysOutput ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                CortexSysOutput.nodetype = .output;
                CortexSysOutput.parents = &.{&CortexCLockSelection};
            }
            // ======= NODE FCLKCortexOutput ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                FCLKCortexOutput.nodetype = .output;
                FCLKCortexOutput.parents = &.{&AHBOutput};
            }
            // ======= NODE APB1Prescaler ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                APB1Prescaler.nodetype = .div;
                APB1Prescaler.value = try APB1CLKDividerValue.get();
                APB1Prescaler.parents = &.{&AHBOutput};
            }
            // ======= NODE APB1Output ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                APB1Output.nodetype = .output;
                APB1Output.parents = &.{&APB1Prescaler};
            }
            // ======= NODE TimPrescalerAPB1 ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                TimPrescalerAPB1.nodetype = .mul;
                TimPrescalerAPB1.value = @floatFromInt(APB1TimCLKDividerValue);
                TimPrescalerAPB1.parents = &.{&APB1Prescaler};
            }
            // ======= NODE TimPrescOut1 ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                TimPrescOut1.nodetype = .output;
                TimPrescOut1.parents = &.{&TimPrescalerAPB1};
            }
            // ======= NODE APB2Prescaler ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                APB2Prescaler.nodetype = .div;
                APB2Prescaler.value = try APB2CLKDividerValue.get();
                APB2Prescaler.parents = &.{&AHBOutput};
            }
            // ======= NODE APB2Output ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                APB2Output.nodetype = .output;
                APB2Output.parents = &.{&APB2Prescaler};
            }
            // ======= NODE APB3Prescaler ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                APB3Prescaler.nodetype = .div;
                APB3Prescaler.value = try APB3CLKDividerValue.get();
                APB3Prescaler.parents = &.{&AHBOutput};
            }
            // ======= NODE APB3Output ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                APB3Output.nodetype = .output;
                APB3Output.parents = &.{&APB3Prescaler};
            }
            // ======= NODE TimPrescalerAPB2 ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                TimPrescalerAPB2.nodetype = .mul;
                TimPrescalerAPB2.value = @floatFromInt(APB2TimCLKDividerValue);
                TimPrescalerAPB2.parents = &.{&APB2Prescaler};
            }
            // ======= NODE TimPrescOut2 ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                TimPrescOut2.nodetype = .output;
                TimPrescOut2.parents = &.{&TimPrescalerAPB2};
            }
            // ======= NODE UCPD1Output ======
            if (check_ref(@TypeOf(UCPDEnableValue), UCPDEnableValue, .true, .@"=")) {
                if (check_MCU("UCPD1_Exist")) {
                    UCPD1Output.nodetype = .output;
                    UCPD1Output.parents = &.{&HSIRC};
                }
            }
            // ======= NODE SPI1Mult ======
            if (check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=")) {
                SPI1Mult.nodetype = .multi;
                SPI1Mult.parents = switch (SPI1CLockSelectionValue) {
                    .RCC_SPI1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                    .RCC_SPI1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_SPI1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SPI1CLKSOURCE_MSIK => &.{&MSIKRC},
                };
            }
            // ======= NODE SPI1output ======
            if (check_ref(@TypeOf(SPI1EnableValue), SPI1EnableValue, .true, .@"=")) {
                SPI1output.nodetype = .output;
                SPI1output.parents = &.{&SPI1Mult};
            }
            // ======= NODE SPI3Mult ======
            if (check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"=")) {
                SPI3Mult.nodetype = .multi;
                SPI3Mult.parents = switch (SPI3CLockSelectionValue) {
                    .RCC_SPI3CLKSOURCE_PCLK3 => &.{&APB3Output},
                    .RCC_SPI3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_SPI3CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SPI3CLKSOURCE_MSIK => &.{&MSIKRC},
                };
            }
            // ======= NODE SPI3output ======
            if (check_ref(@TypeOf(SPI3EnableValue), SPI3EnableValue, .true, .@"=")) {
                SPI3output.nodetype = .output;
                SPI3output.parents = &.{&SPI3Mult};
            }
            // ======= NODE SPI2Mult ======
            if (check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"=")) {
                SPI2Mult.nodetype = .multi;
                SPI2Mult.parents = switch (SPI2CLockSelectionValue) {
                    .RCC_SPI2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_SPI2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_SPI2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SPI2CLKSOURCE_MSIK => &.{&MSIKRC},
                };
            }
            // ======= NODE SPI2output ======
            if (check_ref(@TypeOf(SPI2EnableValue), SPI2EnableValue, .true, .@"=")) {
                SPI2output.nodetype = .output;
                SPI2output.parents = &.{&SPI2Mult};
            }
            // ======= NODE PLLN ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLLN.nodetype = .mulfrac;
                PLLN.value = @floatFromInt(PLLNValue);
                PLLN.parents = &.{ &PLLM, &PLLFRACN };
            }
            // ======= NODE PLLFRACN ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLLFRACN.nodetype = .source;
                PLLFRACN.value = @floatFromInt(PLLFRACNValue);
            }
            // ======= NODE PLL1P ======
            if (check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(MDF1EnableLPBAMValue), MDF1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(ADF1EnableLPBAMValue), ADF1EnableLPBAMValue, .true, .@"=")) {
                PLL1P.nodetype = .div;
                PLL1P.value = @floatFromInt(PLL1PValue);
                PLL1P.parents = &.{&PLLN};
            }
            // ======= NODE PLLPoutput ======
            if (check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(MDF1EnableLPBAMValue), MDF1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(ADF1EnableLPBAMValue), ADF1EnableLPBAMValue, .true, .@"=")) {
                PLLPoutput.nodetype = .output;
                PLLPoutput.parents = &.{&PLL1P};
            }
            // ======= NODE PLL1Q ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableLPBAMValue), FDCANEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(OCTOSPIMEnableLPBAMValue), OCTOSPIMEnableLPBAMValue, .true, .@"=")) {
                PLL1Q.nodetype = .div;
                PLL1Q.value = @floatFromInt(PLL1QValue);
                PLL1Q.parents = &.{&PLLN};
            }
            // ======= NODE PLLQoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableLPBAMValue), FDCANEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(OCTOSPIMEnableLPBAMValue), OCTOSPIMEnableLPBAMValue, .true, .@"=")) {
                PLLQoutput.nodetype = .output;
                PLLQoutput.parents = &.{&PLL1Q};
            }
            // ======= NODE PLL1R ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLL1R.nodetype = .div;
                PLL1R.value = try PLL1RValue.get();
                PLL1R.parents = &.{&PLLN};
            }
            // ======= NODE PLL2N ======
            if (check_ref(@TypeOf(OCTOSPIMEnableValue), OCTOSPIMEnableValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableLPBAMValue), FDCANEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableLPBAMValue), ADCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(DACEnableLPBAMValue), DACEnableLPBAMValue, .true, .@"=")) {
                PLL2N.nodetype = .mulfrac;
                PLL2N.value = @floatFromInt(PLL2NValue);
                PLL2N.parents = &.{ &PLL2M, &PLL2FRACN };
            }
            // ======= NODE PLL2FRACN ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLL2FRACN.nodetype = .source;
                PLL2FRACN.value = @floatFromInt(PLL2FRACNValue);
            }
            // ======= NODE PLL2P ======
            if (check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableLPBAMValue), FDCANEnableLPBAMValue, .true, .@"=")) {
                PLL2P.nodetype = .div;
                PLL2P.value = @floatFromInt(PLL2PValue);
                PLL2P.parents = &.{&PLL2N};
            }
            // ======= NODE PLL2Poutput ======
            if (check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(FDCANEnableLPBAMValue), FDCANEnableLPBAMValue, .true, .@"=")) {
                PLL2Poutput.nodetype = .output;
                PLL2Poutput.parents = &.{&PLL2P};
            }
            // ======= NODE PLL2Q ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(OCTOSPIMEnableLPBAMValue), OCTOSPIMEnableLPBAMValue, .true, .@"=")) {
                PLL2Q.nodetype = .div;
                PLL2Q.value = @floatFromInt(PLL2QValue);
                PLL2Q.parents = &.{&PLL2N};
            }
            // ======= NODE PLL2Qoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMCEnableLPBAMValue), SDMMCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(OCTOSPIMEnableLPBAMValue), OCTOSPIMEnableLPBAMValue, .true, .@"=")) {
                PLL2Qoutput.nodetype = .output;
                PLL2Qoutput.parents = &.{&PLL2Q};
            }
            // ======= NODE PLL2R ======
            if (check_ref(@TypeOf(ADCEnableLPBAMValue), ADCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(DACEnableLPBAMValue), DACEnableLPBAMValue, .true, .@"=")) {
                PLL2R.nodetype = .div;
                PLL2R.value = @floatFromInt(PLL2RValue);
                PLL2R.parents = &.{&PLL2N};
            }
            // ======= NODE PLL2Routput ======
            if (check_ref(@TypeOf(ADCEnableLPBAMValue), ADCEnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(DACEnableLPBAMValue), DACEnableLPBAMValue, .true, .@"=")) {
                PLL2Routput.nodetype = .output;
                PLL2Routput.parents = &.{&PLL2R};
            }
            // ======= NODE PLL3N ======
            if (check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(MDF1EnableLPBAMValue), MDF1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(ADF1EnableLPBAMValue), ADF1EnableLPBAMValue, .true, .@"=")) {
                PLL3N.nodetype = .mulfrac;
                PLL3N.value = @floatFromInt(PLL3NValue);
                PLL3N.parents = &.{ &PLL3M, &PLL3FRACN };
            }
            // ======= NODE PLL3FRACN ======
            if (check_ref(@TypeOf(notInLPBAMValue), notInLPBAMValue, .true, .@"=")) {
                PLL3FRACN.nodetype = .source;
                PLL3FRACN.value = @floatFromInt(PLL3FRACNValue);
            }
            // ======= NODE PLL3P ======
            if (check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=")) {
                PLL3P.nodetype = .div;
                PLL3P.value = @floatFromInt(PLL3PValue);
                PLL3P.parents = &.{&PLL3N};
            }
            // ======= NODE PLL3Poutput ======
            if (check_ref(@TypeOf(SAI1EnableLPBAMValue), SAI1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableLPBAMValue), SAI2EnableLPBAMValue, .true, .@"=")) {
                PLL3Poutput.nodetype = .output;
                PLL3Poutput.parents = &.{&PLL3P};
            }
            // ======= NODE PLL3Q ======
            if (check_ref(@TypeOf(MDF1EnableLPBAMValue), MDF1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(ADF1EnableLPBAMValue), ADF1EnableLPBAMValue, .true, .@"=")) {
                PLL3Q.nodetype = .div;
                PLL3Q.value = @floatFromInt(PLL3QValue);
                PLL3Q.parents = &.{&PLL3N};
            }
            // ======= NODE PLL3Qoutput ======
            if (check_ref(@TypeOf(MDF1EnableLPBAMValue), MDF1EnableLPBAMValue, .true, .@"=") or check_ref(@TypeOf(ADF1EnableLPBAMValue), ADF1EnableLPBAMValue, .true, .@"=")) {
                PLL3Qoutput.nodetype = .output;
                PLL3Qoutput.parents = &.{&PLL3Q};
            }
            // ======= NODE PLL3R ======
            if (config.flags.notUsed) {
                PLL3R.nodetype = .div;
                PLL3R.value = @floatFromInt(PLL3RValue);
                PLL3R.parents = &.{&PLL3N};
            }
            // ======= NODE PLL3Routput ======
            if (config.flags.notUsed) {
                PLL3Routput.nodetype = .output;
                PLL3Routput.parents = &.{&PLL3R};
            }
            // ======= NODE MSIS ======
            MSIS.nodetype = .output;
            MSIS.parents = &.{&MSIRC};

            // ======= NODE PLLSRC ======
            PLLSRC.nodetype = .output;
            PLLSRC.parents = &.{&PLLSource};

            // ======= NODE VCOInput ======
            VCOInput.nodetype = .output;
            VCOInput.parents = &.{&PLLM};

            // ======= NODE VCOInput2 ======
            VCOInput2.nodetype = .output;
            VCOInput2.parents = &.{&PLL2M};

            // ======= NODE VCOInput3 ======
            VCOInput3.nodetype = .output;
            VCOInput3.parents = &.{&PLL3M};

            // ======= NODE VCOOutput ======
            VCOOutput.nodetype = .output;
            VCOOutput.parents = &.{&PLLN};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLL1R};

            // ======= NODE VCOPLL2Output ======
            VCOPLL2Output.nodetype = .output;
            VCOPLL2Output.parents = &.{&PLL2N};

            // ======= NODE VCOPLL3Output ======
            VCOPLL3Output.nodetype = .output;
            VCOPLL3Output.parents = &.{&PLL3N};

            // ======= NODE LSIclk ======
            LSIclk.nodetype = .output;
            LSIclk.parents = &.{&LSIDIV};

            //======== POST REFS ========

            //======= CRSFreq_Value ========
            const CRSFreq_ValueValue = CRSCLKoutput.get_as_ref();
            ignore_value(CRSFreq_ValueValue);

            //======= SAESFreq_Value ========
            const SAESFreq_ValueValue = SAESoutput.get_as_ref();
            ignore_value(SAESFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if (scale1) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            const PWR_Regulator_Voltage_ScaleValue: ?PWR_Regulator_Voltage_ScaleList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |_| {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Value should be null.
                            \\note: some configurations are invalid in certain cases.
                            \\
                            \\
                        , .{ "PWR_Regulator_Voltage_Scale", "S_LPBAM_CONF", "" });
                    }
                    break :blk null;
                } else if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"="))) and !(check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=") or check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=") or check_ref(@TypeOf(FullHSI48UsedValue), FullHSI48UsedValue, 1, .@"=") or (check_ref(@TypeOf(MSIKClockRangeValue), MSIKClockRangeValue, .RCC_MSIKRANGE_0, .@"=")) and check_ref(@TypeOf(MSIKUsedValue), MSIKUsedValue, 1, .@"=") or (check_ref(@TypeOf(MSIClockRangeValue), MSIClockRangeValue, .RCC_MSIRANGE_0, .@"=")) and check_ref(@TypeOf(MSISUsedValue), MSISUsedValue, 1, .@"="))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE4 => scale4 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE3 => scale3 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale4 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE4;
                    };
                } else if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"=")))) {
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
                                    "((SYSCLKFreq_VALUE <24000000) | (SYSCLKFreq_VALUE =24000000))",
                                    "Range 4 is not allowed when using PLLs, HSI48 not devided by 2 or MSKI/MSIS having 48 MHz",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range3" else "PWR_REGULATOR_VOLTAGE_SCALE3",
                                    if (patch_logs) "Range2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale3 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                    };
                } else if ((SysSourceHSE and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 55000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 55000000, .@"="))))) {
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
                                    "(SysSourceHSE & ((SYSCLKFreq_VALUE <55000000) | (SYSCLKFreq_VALUE =55000000)))",
                                    "Range 4 is not allowed when using PLLs, HSI48 not devided by 2 or MSKI/MSIS having 48 MHz",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range3" else "PWR_REGULATOR_VOLTAGE_SCALE3",
                                    if (patch_logs) "Range2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale3 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                    };
                } else if ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 55000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 55000000, .@"="))) {
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
                                    "(SYSCLKFreq_VALUE < 55000000) | (SYSCLKFreq_VALUE = 55000000)",
                                    "Range 4 is not allowed when using PLLs, HSI48 not devided by 2 or MSKI/MSIS having 48 MHz",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range3" else "PWR_REGULATOR_VOLTAGE_SCALE3",
                                    if (patch_logs) "Range2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale3 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE3;
                    };
                } else if ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 110000000, .@"<")) or (check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 110000000, .@"="))) {
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
                                    "(SYSCLKFreq_VALUE < 110000000) | (SYSCLKFreq_VALUE = 110000000)",
                                    "Range 4 is not allowed when using PLLs, HSI48 not devided by 2 or MSKI/MSIS having 48 MHz",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Range2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "Range1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        scale2 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE2;
                    };
                }
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
                if ((config.flags.HSEByPass or config.flags.HSEDIGByPass) and scale4) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 2.4e7,
                    };

                    break :blk user_val orelse 1.6e7;
                } else if (config.flags.HSEByPass or config.flags.HSEDIGByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 5e7,
                    };

                    break :blk user_val orelse 1.6e7;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 5e7,
                };

                break :blk user_val orelse 1.6e7;
            };

            // ======= NODE HSEOSC ======
            if (!check_MCU("S_LPBAM_CONF")) {
                HSEOSC.nodetype = .source;
                HSEOSC.value = HSE_VALUEValue;
            }
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            //======= WakeUpClockFreq_VALUE ========
            const WakeUpClockFreq_VALUEValue = WakeUpClockOutput.get_as_ref();
            ignore_value(WakeUpClockFreq_VALUEValue);

            WakeUpClockOutput.limit = .{
                .min = null,
                .max = 2.4e7,
            };

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);

            RTCOutput.limit = .{
                .min = null,
                .max = 1.5625e6,
            };

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                USART1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                USART1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                USART1output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                USART1output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                USART2output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                USART2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                USART2output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                USART2output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                USART3output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                USART3output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                USART3output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                USART3output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= UART4Freq_Value ========
            const UART4Freq_ValueValue = UART4output.get_as_ref();
            ignore_value(UART4Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                UART4output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                UART4output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                UART4output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                UART4output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= UART5Freq_Value ========
            const UART5Freq_ValueValue = UART5output.get_as_ref();
            ignore_value(UART5Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                UART5output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                UART5output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                UART5output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                UART5output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            }

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= DACFreq_Value ========
            const DACFreq_ValueValue = DACoutput.get_as_ref();
            ignore_value(DACFreq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= CK48Freq_Value ========
            const CK48Freq_ValueValue = CK48output.get_as_ref();
            ignore_value(CK48Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                CK48output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                CK48output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                CK48output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                CK48output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else {
                CK48output.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            }

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);

            //======= SDMMCFreq_Value ========
            const SDMMCFreq_ValueValue = SDMMCC1Output.get_as_ref();
            ignore_value(SDMMCFreq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                SDMMCC1Output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                SDMMCC1Output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                SDMMCC1Output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                SDMMCC1Output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else {
                SDMMCC1Output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= FDCANFreq_Value ========
            const FDCANFreq_ValueValue = FDCANOutput.get_as_ref();
            ignore_value(FDCANFreq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                FDCANOutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                I2C2output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                I2C3output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                I2C3output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                I2C3output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                I2C3output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= SAI2Freq_Value ========
            const SAI2Freq_ValueValue = SAI2output.get_as_ref();
            ignore_value(SAI2Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                SAI2output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                SAI2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                SAI2output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                SAI2output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= I2C4Freq_Value ========
            const I2C4Freq_ValueValue = I2C4output.get_as_ref();
            ignore_value(I2C4Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                I2C4output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= MDF1Freq_Value ========
            const MDF1Freq_ValueValue = MDF1output.get_as_ref();
            ignore_value(MDF1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                MDF1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                MDF1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                MDF1output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                MDF1output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= ADF1Freq_Value ========
            const ADF1Freq_ValueValue = ADF1output.get_as_ref();
            ignore_value(ADF1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                ADF1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                ADF1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                ADF1output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                ADF1output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= OCTOSPIMFreq_Value ========
            const OCTOSPIMFreq_ValueValue = OCTOSPIMoutput.get_as_ref();
            ignore_value(OCTOSPIMFreq_ValueValue);
            if (OCTOSPIMSourcePLL1Q or OCTOSPIMSourcePLL2Q) {
                OCTOSPIMoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                };
            } else if (scale4 or check_MCU("S_LPBAM_CONF")) {
                OCTOSPIMoutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                OCTOSPIMoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                OCTOSPIMoutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                OCTOSPIMoutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= LPTIM3Freq_Value ========
            const LPTIM3Freq_ValueValue = LPTIM3output.get_as_ref();
            ignore_value(LPTIM3Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                LPTIM3output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                LPTIM3output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                LPTIM3output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                LPTIM3output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);
            if (check_MCU("S_LPBAM_CONF")) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                };
            } else {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            }

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= LSCOPinFreq_Value ========
            const LSCOPinFreq_ValueValue = LSCOOutput.get_as_ref();
            ignore_value(LSCOPinFreq_ValueValue);

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if (scale1) {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);
            if (scale1) {
                HCLKOutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                HCLKOutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                HCLKOutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                HCLKOutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);
            if (scale1) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);
            if (scale1) {
                FCLKCortexOutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                FCLKCortexOutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                FCLKCortexOutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                FCLKCortexOutput.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);
            if (scale1) {
                APB1Output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                APB1Output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                APB1Output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                APB1Output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);
            if (scale1) {
                TimPrescOut1.limit = .{
                    .min = null,
                    .max = 3.2e8,
                };
            } else if (scale2) {
                TimPrescOut1.limit = .{
                    .min = null,
                    .max = 2.2e8,
                };
            } else if (scale3) {
                TimPrescOut1.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale4) {
                TimPrescOut1.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            }

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);
            if (scale1) {
                APB2Output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                APB2Output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                APB2Output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                APB2Output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= APB3Freq_Value ========
            const APB3Freq_ValueValue = APB3Output.get_as_ref();
            ignore_value(APB3Freq_ValueValue);
            if (scale1) {
                APB3Output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                APB3Output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                APB3Output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            } else if (scale4) {
                APB3Output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            }

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);
            if (scale1) {
                TimPrescOut2.limit = .{
                    .min = null,
                    .max = 3.2e8,
                };
            } else if (scale2) {
                TimPrescOut2.limit = .{
                    .min = null,
                    .max = 2.2e8,
                };
            } else if (scale3) {
                TimPrescOut2.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale4) {
                TimPrescOut2.limit = .{
                    .min = null,
                    .max = 4.8e7,
                };
            }

            //======= UCPD1outputFreq_Value ========
            const UCPD1outputFreq_ValueValue = UCPD1Output.get_as_ref();
            ignore_value(UCPD1outputFreq_ValueValue);

            //======= SPI1Freq_Value ========
            const SPI1Freq_ValueValue = SPI1output.get_as_ref();
            ignore_value(SPI1Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                SPI1output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= SPI3Freq_Value ========
            const SPI3Freq_ValueValue = SPI3output.get_as_ref();
            ignore_value(SPI3Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                SPI3output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= SPI2Freq_Value ========
            const SPI2Freq_ValueValue = SPI2output.get_as_ref();
            ignore_value(SPI2Freq_ValueValue);
            if (scale4 or check_MCU("S_LPBAM_CONF")) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 2.4e7,
                };
            } else if (scale1) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3) {
                SPI2output.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) {
                PLLPoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) {
                PLLPoutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=")) {
                PLLPoutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if (OCTOSPIMSourcePLL1Q and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                };
            } else if (scale1 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=")) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLL2PoutputFreq_Value ========
            const PLL2PoutputFreq_ValueValue = PLL2Poutput.get_as_ref();
            ignore_value(PLL2PoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                PLL2Poutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                PLL2Poutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2PUsedValue), PLL2PUsedValue, 1, .@"=")) {
                PLL2Poutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLL2QoutputFreq_Value ========
            const PLL2QoutputFreq_ValueValue = PLL2Qoutput.get_as_ref();
            ignore_value(PLL2QoutputFreq_ValueValue);
            if (OCTOSPIMSourcePLL2Q and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 2e8,
                };
            } else if (scale1 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2QUsedValue), PLL2QUsedValue, 1, .@"=")) {
                PLL2Qoutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLL2RoutputFreq_Value ========
            const PLL2RoutputFreq_ValueValue = PLL2Routput.get_as_ref();
            ignore_value(PLL2RoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                PLL2Routput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                PLL2Routput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2RUsedValue), PLL2RUsedValue, 1, .@"=")) {
                PLL2Routput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLL3PoutputFreq_Value ========
            const PLL3PoutputFreq_ValueValue = PLL3Poutput.get_as_ref();
            ignore_value(PLL3PoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                PLL3Poutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                PLL3Poutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL3PUsedValue), PLL3PUsedValue, 1, .@"=")) {
                PLL3Poutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLL3QoutputFreq_Value ========
            const PLL3QoutputFreq_ValueValue = PLL3Qoutput.get_as_ref();
            ignore_value(PLL3QoutputFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                PLL3Qoutput.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                PLL3Qoutput.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL3QUsedValue), PLL3QUsedValue, 1, .@"=")) {
                PLL3Qoutput.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= PLL3RoutputFreq_Value ========
            const PLL3RoutputFreq_ValueValue = PLL3Routput.get_as_ref();
            ignore_value(PLL3RoutputFreq_ValueValue);

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 4e6,
                    .max = 1.6e7,
                };
            }

            //======= VCOInput2Freq_Value ========
            const VCOInput2Freq_ValueValue = VCOInput2.get_as_ref();
            ignore_value(VCOInput2Freq_ValueValue);
            if ((check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"="))) {
                VCOInput2.limit = .{
                    .min = 4e6,
                    .max = 1.6e7,
                };
            }

            //======= VCOInput3Freq_Value ========
            const VCOInput3Freq_ValueValue = VCOInput3.get_as_ref();
            ignore_value(VCOInput3Freq_ValueValue);
            if ((check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"="))) {
                VCOInput3.limit = .{
                    .min = 4e6,
                    .max = 1.6e7,
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if ((scale1 or scale2) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOOutput.limit = .{
                    .min = 1.28e8,
                    .max = 5.44e8,
                };
            } else if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOOutput.limit = .{
                    .min = 1.28e8,
                    .max = 3.3e8,
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if (scale1 and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = null,
                    .max = 1.6e8,
                };
            } else if (scale2 and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = null,
                    .max = 1.1e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = null,
                    .max = 5.5e7,
                };
            }

            //======= VCOPLL2OutputFreq_Value ========
            const VCOPLL2OutputFreq_ValueValue = VCOPLL2Output.get_as_ref();
            ignore_value(VCOPLL2OutputFreq_ValueValue);
            if ((scale1 or scale2) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                VCOPLL2Output.limit = .{
                    .min = 1.28e8,
                    .max = 5.44e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                VCOPLL2Output.limit = .{
                    .min = 1.28e8,
                    .max = 3.3e8,
                };
            }

            //======= VCOPLL3OutputFreq_Value ========
            const VCOPLL3OutputFreq_ValueValue = VCOPLL3Output.get_as_ref();
            ignore_value(VCOPLL3OutputFreq_ValueValue);
            if ((scale1 or scale2) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                VCOPLL3Output.limit = .{
                    .min = 1.28e8,
                    .max = 5.44e8,
                };
            } else if (scale3 and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                VCOPLL3Output.limit = .{
                    .min = 1.28e8,
                    .max = 3.3e8,
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
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
                                "S_LPBAM_CONF",
                                "",
                                "FLASH_LATENCY_4",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_4;
                } else if ((scale4 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 12000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 12000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_0 => {},
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
                                    "(scale4 & ((HCLKFreq_Value < 12000000)|(HCLKFreq_Value= 12000000 )))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_0",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_0;
                } else if ((scale4 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"="))))) {
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
                                "(scale4 & ((HCLKFreq_Value < 24000000)|(HCLKFreq_Value= 24000000 )))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale3 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_0 => {},
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
                                    "(scale3 & ((HCLKFreq_Value < 24000000)|(HCLKFreq_Value= 24000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_0",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_0;
                } else if ((scale3 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
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
                                    "(scale3 & ((HCLKFreq_Value < 48000000)|(HCLKFreq_Value= 48000000 )))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if ((scale3 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 55000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 55000000, .@"="))))) {
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
                                "(scale3 & ((HCLKFreq_Value < 55000000)|(HCLKFreq_Value= 55000000)))",
                                "",
                                "FLASH_LATENCY_2",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if ((scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 30000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 30000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_0 => {},
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
                                    "(scale2 & ((HCLKFreq_Value < 30000000)|(HCLKFreq_Value= 30000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_0",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_0;
                } else if ((scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
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
                                    "(scale2 & ((HCLKFreq_Value < 60000000)|(HCLKFreq_Value= 60000000 )))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if ((scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_2 => {},
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
                                    "(scale2 & ((HCLKFreq_Value < 90000000)|(HCLKFreq_Value= 90000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_2",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if ((scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@"="))))) {
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
                                "(scale2 & ((HCLKFreq_Value < 110000000)|(HCLKFreq_Value= 110000000)))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
                            .FLASH_LATENCY_0 => {},
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_0;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 64000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 64000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_2 => {},
                            .FLASH_LATENCY_1 => {},
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
                                    "(scale1 & ((HCLKFreq_Value < 64000000) |(HCLKFreq_Value = 64000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_2",
                                    "FLASH_LATENCY_1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_1;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 96000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 96000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_3 => {},
                            .FLASH_LATENCY_2 => {},
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
                                    "(scale1 & ((HCLKFreq_Value < 96000000) |(HCLKFreq_Value = 96000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_2",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 128000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 128000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_4 => {},
                            .FLASH_LATENCY_3 => {},
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
                                    "(scale1 & ((HCLKFreq_Value < 128000000) |(HCLKFreq_Value = 128000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_4",
                                    "FLASH_LATENCY_3",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_3;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@"="))))) {
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
                                "(scale1 & ((HCLKFreq_Value < 160000000) |(HCLKFreq_Value = 160000000)))",
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

            const PLL1_VCI_RangeValue: ?PLL1_VCI_RangeList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    break :blk null;
                } else if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLLVCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLLVCIRANGE_1;
                }
                break :blk .RCC_PLLVCIRANGE_1;
            };

            const PLL2_VCI_RangeValue: ?PLL2_VCI_RangeList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    break :blk null;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLLVCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput2Freq_ValueValue), VCOInput2Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLLVCIRANGE_1;
                }
                break :blk .RCC_PLLVCIRANGE_1;
            };

            const PLL3_VCI_RangeValue: ?PLL3_VCI_RangeList = blk: {
                if (check_MCU("S_LPBAM_CONF")) {
                    break :blk null;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLLVCIRANGE_0;
                } else if (((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInput3Freq_ValueValue), VCOInput3Freq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    break :blk .RCC_PLLVCIRANGE_1;
                }
                break :blk .RCC_PLLVCIRANGE_1;
            };
            out.HSIRC = try HSIRC.get_output();
            out.CRSCLKoutput = try CRSCLKoutput.get_output();
            out.HSI48RC = try HSI48RC.get_output();
            out.SHSIRC = try SHSIRC.get_output();
            out.SHSIDiv = try SHSIDiv.get_output();
            out.SAESMult = try SAESMult.get_output();
            out.SAESoutput = try SAESoutput.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSIDIV = try LSIDIV.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.MSIRC = try MSIRC.get_output();
            out.MSIKRC = try MSIKRC.get_output();
            out.SAI1_EXT = try SAI1_EXT.get_output();
            out.RCC_Stop_WakeUpClock = try RCC_Stop_WakeUpClock.get_output();
            out.WakeUpClockOutput = try WakeUpClockOutput.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.PLL2Source = try PLL2Source.get_output();
            out.PLL3Source = try PLL3Source.get_output();
            out.PLLM = try PLLM.get_output();
            out.PLL2M = try PLL2M.get_output();
            out.PLL3M = try PLL3M.get_output();
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
            out.DACMult = try DACMult.get_output();
            out.DACoutput = try DACoutput.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.CK48Mult = try CK48Mult.get_output();
            out.CK48output = try CK48output.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.SDMMC1Mult = try SDMMC1Mult.get_output();
            out.SDMMCC1Output = try SDMMCC1Output.get_output();
            out.FDCANMult = try FDCANMult.get_output();
            out.FDCANOutput = try FDCANOutput.get_output();
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
            out.MDF1Mult = try MDF1Mult.get_output();
            out.MDF1output = try MDF1output.get_output();
            out.ADF1Mult = try ADF1Mult.get_output();
            out.ADF1output = try ADF1output.get_output();
            out.OCTOSPIMMult = try OCTOSPIMMult.get_output();
            out.OCTOSPIMoutput = try OCTOSPIMoutput.get_output();
            out.LPTIM3Mult = try LPTIM3Mult.get_output();
            out.LPTIM3output = try LPTIM3output.get_output();
            out.HSI48DivToRNG = try HSI48DivToRNG.get_output();
            out.RNGMult = try RNGMult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
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
            out.PLLPoutput = try PLLPoutput.get_output();
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
            out.PLL3N = try PLL3N.get_output();
            out.PLL3FRACN = try PLL3FRACN.get_output();
            out.PLL3P = try PLL3P.get_output();
            out.PLL3Poutput = try PLL3Poutput.get_output();
            out.PLL3Q = try PLL3Q.get_output();
            out.PLL3Qoutput = try PLL3Qoutput.get_output();
            out.PLL3R = try PLL3R.get_output();
            out.PLL3Routput = try PLL3Routput.get_output();
            out.MSIS = try MSIS.get_extra_output();
            out.PLLSRC = try PLLSRC.get_extra_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOInput2 = try VCOInput2.get_extra_output();
            out.VCOInput3 = try VCOInput3.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.VCOPLL2Output = try VCOPLL2Output.get_extra_output();
            out.VCOPLL3Output = try VCOPLL3Output.get_extra_output();
            out.LSIclk = try LSIclk.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(CRSFreq_ValueValue);
            ignore_value(HSI48_VALUEValue);
            ignore_value(SHSI_VALUEValue);
            ref_out.SHSIDiv = SHSIDivValue;
            ref_out.SAESSource = SAESSourceValue;
            ignore_value(SAESFreq_ValueValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ref_out.LSIDIV = LSIDIVValue;
            ignore_value(LSE_VALUEValue);
            ref_out.MSIClockRange = MSIClockRangeValue;
            ref_out.MSIKClockRange = MSIKClockRangeValue;
            ignore_value(EXTERNALSAI1_CLOCK_VALUEValue);
            ref_out.RCC_Stop_WakeUpClock = RCC_Stop_WakeUpClockValue;
            ignore_value(WakeUpClockFreq_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLL2Source = PLL2SourceValue;
            ref_out.PLL3Source = PLL3SourceValue;
            ref_out.PLLM = PLLMValue;
            ref_out.PLL2M = PLL2MValue;
            ref_out.PLL3M = PLL3MValue;
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.USART1CLockSelectionVirtual = USART1CLockSelectionVirtualValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.USART2CLockSelectionVirtual = USART2CLockSelectionVirtualValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.USART3CLockSelectionVirtual = USART3CLockSelectionVirtualValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.UART4CLockSelectionVirtual = UART4CLockSelectionVirtualValue;
            ignore_value(UART4Freq_ValueValue);
            ref_out.UART5CLockSelectionVirtual = UART5CLockSelectionVirtualValue;
            ignore_value(UART5Freq_ValueValue);
            ref_out.LPUART1CLockSelectionVirtual = LPUART1CLockSelectionVirtualValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelectionVirtual = LPTIM1CLockSelectionVirtualValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.LPTIM2CLockSelectionVirtual = LPTIM2CLockSelectionVirtualValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.DACCLockSelectionVirtual = DACCLockSelectionVirtualValue;
            ignore_value(DACFreq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.CK48CLockSelection = CK48CLockSelectionValue;
            ignore_value(CK48Freq_ValueValue);
            ignore_value(USBFreq_ValueValue);
            ref_out.SDMMCClockSelection = SDMMCClockSelectionValue;
            ignore_value(SDMMCFreq_ValueValue);
            ref_out.FDCANClockSelection = FDCANClockSelectionValue;
            ignore_value(FDCANFreq_ValueValue);
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
            ref_out.MdfClockSelection = MdfClockSelectionValue;
            ignore_value(MDF1Freq_ValueValue);
            ref_out.AdfClockSelection = AdfClockSelectionValue;
            ignore_value(ADF1Freq_ValueValue);
            ref_out.OCTOSPIMCLockSelection = OCTOSPIMCLockSelectionValue;
            ignore_value(OCTOSPIMFreq_ValueValue);
            ref_out.LPTIM3CLockSelectionVirtual = LPTIM3CLockSelectionVirtualValue;
            ignore_value(LPTIM3Freq_ValueValue);
            ref_out.HSI48DivToRNG = HSI48DivToRNGValue;
            ref_out.RNGCLockSelection = RNGCLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.RCC_MCO1SourceVirtual = RCC_MCO1SourceVirtualValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.LSCOSource1Virtual = LSCOSource1VirtualValue;
            ignore_value(LSCOPinFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ref_out.CortexCLockSelectionVirtual = CortexCLockSelectionVirtualValue;
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
            ignore_value(PLLPoutputFreq_ValueValue);
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
            ref_out.PLL3N = PLL3NValue;
            ignore_value(PLL3FRACNValue);
            ref_out.PLL3P = PLL3PValue;
            ignore_value(PLL3PoutputFreq_ValueValue);
            ref_out.PLL3Q = PLL3QValue;
            ignore_value(PLL3QoutputFreq_ValueValue);
            ref_out.PLL3R = PLL3RValue;
            ignore_value(PLL3RoutputFreq_ValueValue);
            ignore_value(MSI_VALUEValue);
            ignore_value(EPOD_VALUEValue);
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOInput2Freq_ValueValue);
            ignore_value(VCOInput3Freq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLRCLKFreq_ValueValue);
            ignore_value(VCOPLL2OutputFreq_ValueValue);
            ignore_value(VCOPLL3OutputFreq_ValueValue);
            ignore_value(LSIDIV_VALUEValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.MSICalibrationValue = MSICalibrationValueValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.MSIAutoCalibration = MSIAutoCalibrationValue;
            ref_out.flags.MSIPLLFAST = MSIPLLFASTValue == .true;
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
            ref_out.PLL1MBOOST = PLL1MBOOSTValue;
            ref_out.PLL1_VCI_Range = PLL1_VCI_RangeValue;
            ref_out.PLL2_VCI_Range = PLL2_VCI_RangeValue;
            ref_out.PLL3_VCI_Range = PLL3_VCI_RangeValue;
            ref_out.flags.MSIKERON = MSIKERONValue == .true;
            ref_out.flags.HSIKERON = HSIKERONValue == .true;
            ref_out.flags.EnableCRS = EnableCRSValue == .true;
            ref_out.flags.RNGEnableLPBAM = RNGEnableLPBAMValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.SDMMCEnableLPBAM = SDMMCEnableLPBAMValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.EnableSAES = EnableSAESValue == .true;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.EnableExtClockForSAI1 = EnableExtClockForSAI1Value == .true;
            ref_out.flags.notInLPBAM = notInLPBAMValue == .true;
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
            ref_out.flags.DACEnable = DACEnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.SDMMCEnable = SDMMCEnableValue == .true;
            ref_out.flags.FDCANEnable = FDCANEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.SAI2Enable = SAI2EnableValue == .true;
            ref_out.flags.I2C4Enable = I2C4EnableValue == .true;
            ref_out.flags.MDF1Enable = MDF1EnableValue == .true;
            ref_out.flags.ADF1Enable = ADF1EnableValue == .true;
            ref_out.flags.OCTOSPIMEnable = OCTOSPIMEnableValue == .true;
            ref_out.flags.LPTIM3Enable = LPTIM3EnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.UCPDEnable = UCPDEnableValue == .true;
            ref_out.flags.SPI1Enable = SPI1EnableValue == .true;
            ref_out.flags.SPI3Enable = SPI3EnableValue == .true;
            ref_out.flags.SPI2Enable = SPI2EnableValue == .true;
            ref_out.flags.SAI1EnableLPBAM = SAI1EnableLPBAMValue == .true;
            ref_out.flags.SAI2EnableLPBAM = SAI2EnableLPBAMValue == .true;
            ref_out.flags.MDF1EnableLPBAM = MDF1EnableLPBAMValue == .true;
            ref_out.flags.ADF1EnableLPBAM = ADF1EnableLPBAMValue == .true;
            ref_out.flags.FDCANEnableLPBAM = FDCANEnableLPBAMValue == .true;
            ref_out.flags.OCTOSPIMEnableLPBAM = OCTOSPIMEnableLPBAMValue == .true;
            ref_out.flags.ADCEnableLPBAM = ADCEnableLPBAMValue == .true;
            ref_out.flags.DACEnableLPBAM = DACEnableLPBAMValue == .true;
            ref_out.flags.PLL1PUsed = PLL1PUsedValue != 0;
            ref_out.flags.PLL1QUsed = PLL1QUsedValue != 0;
            ref_out.flags.PLL2PUsed = PLL2PUsedValue != 0;
            ref_out.flags.PLL2QUsed = PLL2QUsedValue != 0;
            ref_out.flags.PLL2RUsed = PLL2RUsedValue != 0;
            ref_out.flags.PLL3PUsed = PLL3PUsedValue != 0;
            ref_out.flags.PLL3QUsed = PLL3QUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.PLL2Used = PLL2UsedValue != 0;
            ref_out.flags.PLL3Used = PLL3UsedValue != 0;
            ref_out.flags.FullHSI48Used = FullHSI48UsedValue != 0;
            ref_out.flags.MSIKUsed = MSIKUsedValue != 0;
            ref_out.MSISUsed = MSISUsedValue;
            ref_out.LSEState = LSEStateValue;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.EnbaleCSS = EnbaleCSSValue == .true;
            ref_out.flags.HSI48Used = HSI48UsedValue != 0;
            ref_out.flags.PLL1RUsed = PLL1RUsedValue != 0;
            ref_out.flags.MSIUsed = MSIUsedValue != 0;

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
