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
            HSI = 2,
            HSE = 3,
        };
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
        };
        pub const PWR_REGPASEL = enum(u1) {
            B_0x0 = 0,
            B_0x1 = 1,
        };
        pub const RCC_LSI2CFG = enum(u4) {
            Sensitivity0At80C = 0,
            Sensitivity0At50C = 1,
            Sensitivity0At20C = 2,
        };
        pub const RCC_SW = enum(u2) {
            HSI = 0,
            HSE = 2,
            PLL1_R = 3,
        };
        pub const RCC_MCOSEL = enum(u4) {
            DISABLED = 0,
            SYSCLKPRE = 1,
            HSI = 3,
            HSE = 4,
            PLL1_R = 5,
            LSI = 6,
            LSE = 7,
            PLL1_P = 8,
            PLL1_Q = 9,
            HCLK5 = 10,
        };
        pub const RCC_HPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
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
        pub const RCC_PLLRCLKPRESTEP = enum(u1) {
            STEP2 = 0,
            STEP3 = 1,
        };
        pub const RCC_OTGHSSEL = enum(u2) {
            HSE = 0,
            PLL1_P = 1,
            HSE_DIV_2 = 2,
            PLL1_P_DIV_2 = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_PLLRGE = enum(u2) {
            FREQ_4TO8MHZ = 0,
            FREQ_8TO16MHZ = 3,
        };
        pub const RCC_HPRE5 = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div3 = 5,
            Div4 = 6,
            Div6 = 7,
        };

        pub const HseDivList = enum {
            RCC_HSE_DIV1,
            RCC_HSE_DIV2,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_HSE_DIV1 => .Div1,
                    .RCC_HSE_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_HSE_DIV1,
                    .Div2 => .RCC_HSE_DIV2,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PPRE", @tagName(item), "HseDiv" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HSE_DIV1 => 1,
                    .RCC_HSE_DIV2 => 2,
                };
            }
        };

        pub const LSIDIVList = enum {
            RCC_LSI_DIV1,
            RCC_LSI_DIV128,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_LSI_DIV1 => 1,
                    .RCC_LSI_DIV128 => 128,
                };
            }
        };

        pub const RSTClockSelectionVirtualList = enum {
            RCC_RADIOSTCLKSOURCE_HSE_DIV1000,
            RCC_RADIOSTCLKSOURCE_LSI,
            RCC_RADIOSTCLKSOURCE_LSE,
        };

        pub const SYSCLKSourceVirtualList = enum {
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_R,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
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

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_HSE_DIV32,
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,
        };

        pub const USART2CLockSelectionVirtualList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_OTGHSSEL {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_SYSCLK => .PLL1_P,
                    .RCC_USART2CLKSOURCE_HSI => .HSE,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PLL1_P_DIV_2,
                    .RCC_USART2CLKSOURCE_LSE => .HSE_DIV_2,
                };
            }
            pub fn from_enum(item: RCC_OTGHSSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSE => .RCC_USART2CLKSOURCE_HSI,
                    .PLL1_P_DIV_2 => .RCC_USART2CLKSOURCE_PCLK1,
                    .HSE_DIV_2 => .RCC_USART2CLKSOURCE_LSE,
                };
            }
        };

        pub const USART1CLockSelectionVirtualList = enum {
            RCC_USART1CLKSOURCE_PCLK2,
            RCC_USART1CLKSOURCE_SYSCLK,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE5 {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_SYSCLK => .Div4,
                    .RCC_USART1CLKSOURCE_PCLK2 => .Div2,
                    .RCC_USART1CLKSOURCE_HSI => .Div6,
                    .RCC_USART1CLKSOURCE_LSE => .Div1,
                };
            }
            pub fn from_enum(item: RCC_HPRE5) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_USART1CLKSOURCE_SYSCLK,
                    .Div2 => .RCC_USART1CLKSOURCE_PCLK2,
                    .Div6 => .RCC_USART1CLKSOURCE_HSI,
                    .Div1 => .RCC_USART1CLKSOURCE_LSE,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE5", @tagName(item), "USART1CLockSelectionVirtual" },
                    ),
                };
            }
        };

        pub const LPUART1CLockSelectionVirtualList = enum {
            RCC_LPUART1CLKSOURCE_PCLK7,
            RCC_LPUART1CLKSOURCE_SYSCLK,
            RCC_LPUART1CLKSOURCE_HSI,
            RCC_LPUART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_OTGHSSEL {
                return switch (self) {
                    .RCC_LPUART1CLKSOURCE_SYSCLK => .PLL1_P,
                    .RCC_LPUART1CLKSOURCE_LSE => .HSE_DIV_2,
                    .RCC_LPUART1CLKSOURCE_PCLK7 => .PLL1_P_DIV_2,
                    .RCC_LPUART1CLKSOURCE_HSI => .HSE,
                };
            }
            pub fn from_enum(item: RCC_OTGHSSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P => .RCC_LPUART1CLKSOURCE_SYSCLK,
                    .HSE_DIV_2 => .RCC_LPUART1CLKSOURCE_LSE,
                    .PLL1_P_DIV_2 => .RCC_LPUART1CLKSOURCE_PCLK7,
                    .HSE => .RCC_LPUART1CLKSOURCE_HSI,
                };
            }
        };

        pub const LPTIM1CLockSelectionVirtualList = enum {
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_HSI,
            RCC_LPTIM1CLKSOURCE_PCLK7,
            RCC_LPTIM1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_OTGHSSEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_LSE => .HSE_DIV_2,
                    .RCC_LPTIM1CLKSOURCE_PCLK7 => .PLL1_P,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSE,
                    .RCC_LPTIM1CLKSOURCE_LSI => .PLL1_P_DIV_2,
                };
            }
            pub fn from_enum(item: RCC_OTGHSSEL) anyerror!@This() {
                return switch (item) {
                    .HSE_DIV_2 => .RCC_LPTIM1CLKSOURCE_LSE,
                    .PLL1_P => .RCC_LPTIM1CLKSOURCE_PCLK7,
                    .HSE => .RCC_LPTIM1CLKSOURCE_HSI,
                    .PLL1_P_DIV_2 => .RCC_LPTIM1CLKSOURCE_LSI,
                };
            }
        };

        pub const LPTIM2CLockSelectionVirtualList = enum {
            RCC_LPTIM2CLKSOURCE_PCLK1,
            RCC_LPTIM2CLKSOURCE_LSI,
            RCC_LPTIM2CLKSOURCE_HSI,
            RCC_LPTIM2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_OTGHSSEL {
                return switch (self) {
                    .RCC_LPTIM2CLKSOURCE_LSI => .PLL1_P_DIV_2,
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => .PLL1_P,
                    .RCC_LPTIM2CLKSOURCE_HSI => .HSE,
                    .RCC_LPTIM2CLKSOURCE_LSE => .HSE_DIV_2,
                };
            }
            pub fn from_enum(item: RCC_OTGHSSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P_DIV_2 => .RCC_LPTIM2CLKSOURCE_LSI,
                    .PLL1_P => .RCC_LPTIM2CLKSOURCE_PCLK1,
                    .HSE => .RCC_LPTIM2CLKSOURCE_HSI,
                    .HSE_DIV_2 => .RCC_LPTIM2CLKSOURCE_LSE,
                };
            }
        };

        pub const ADCCLockSelectionVirtualList = enum {
            RCC_ADCCLKSOURCE_HCLK,
            RCC_ADCCLKSOURCE_SYSCLK,
            RCC_ADCCLKSOURCE_HSE,
            RCC_ADCCLKSOURCE_HSI,
            RCC_ADCCLKSOURCE_PLL1P,
        };

        pub const ASClockSelectionList = enum {
            RCC_ASCLKSOURCE_PLL1P,
            RCC_ASCLKSOURCE_PLL1Q,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRCLKPRESTEP {
                return switch (self) {
                    .RCC_ASCLKSOURCE_PLL1P => .STEP2,
                    .RCC_ASCLKSOURCE_PLL1Q => .STEP3,
                };
            }
            pub fn from_enum(item: RCC_PLLRCLKPRESTEP) anyerror!@This() {
                return switch (item) {
                    .STEP2 => .RCC_ASCLKSOURCE_PLL1P,
                    .STEP3 => .RCC_ASCLKSOURCE_PLL1Q,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
            RCC_I2C1CLKSOURCE_PCLK1,
            RCC_I2C1CLKSOURCE_SYSCLK,
            RCC_I2C1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_OTGHSSEL {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_HSI => .HSE,
                    .RCC_I2C1CLKSOURCE_SYSCLK => .PLL1_P,
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PLL1_P_DIV_2,
                };
            }
            pub fn from_enum(item: RCC_OTGHSSEL) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_I2C1CLKSOURCE_HSI,
                    .PLL1_P => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .PLL1_P_DIV_2 => .RCC_I2C1CLKSOURCE_PCLK1,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_OTGHSSEL", @tagName(item), "I2C1CLockSelection" },
                    ),
                };
            }
        };

        pub const I2C3CLockSelectionList = enum {
            RCC_I2C3CLKSOURCE_PCLK7,
            RCC_I2C3CLKSOURCE_SYSCLK,
            RCC_I2C3CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_I2C3CLKSOURCE_HSI => .HSI,
                    .RCC_I2C3CLKSOURCE_SYSCLK => .PLL1_R,
                    .RCC_I2C3CLKSOURCE_PCLK7 => .HSE,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C3CLKSOURCE_HSI,
                    .PLL1_R => .RCC_I2C3CLKSOURCE_SYSCLK,
                    .HSE => .RCC_I2C3CLKSOURCE_PCLK7,
                };
            }
        };

        pub const SAI1CLockSelectionVirtualList = enum {
            RCC_SAI1CLKSOURCE_PIN,
            RCC_SAI1CLKSOURCE_HSI,
            RCC_SAI1CLKSOURCE_SYSCLK,
            RCC_SAI1CLKSOURCE_PLL1P,
            RCC_SAI1CLKSOURCE_PLL1Q,

            pub fn to_enum(self: @This()) anyerror!RCC_PPRE {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PLL1Q => .Div2,
                    .RCC_SAI1CLKSOURCE_SYSCLK => .Div16,
                    .RCC_SAI1CLKSOURCE_PIN => .Div4,
                    .RCC_SAI1CLKSOURCE_PLL1P => .Div1,
                    .RCC_SAI1CLKSOURCE_HSI => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PPRE) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_SAI1CLKSOURCE_PLL1Q,
                    .Div16 => .RCC_SAI1CLKSOURCE_SYSCLK,
                    .Div4 => .RCC_SAI1CLKSOURCE_PIN,
                    .Div1 => .RCC_SAI1CLKSOURCE_PLL1P,
                    .Div8 => .RCC_SAI1CLKSOURCE_HSI,
                };
            }
        };

        pub const RNGCLockSelectionVirtualList = enum {
            RCC_RNGCLKSOURCE_PLL1Q,
            RCC_RNGCLKSOURCE_HSI,
            RCC_RNGCLKSOURCE_LSI,
            RCC_RNGCLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_OTGHSSEL {
                return switch (self) {
                    .RCC_RNGCLKSOURCE_HSI => .HSE,
                    .RCC_RNGCLKSOURCE_LSI => .PLL1_P,
                    .RCC_RNGCLKSOURCE_PLL1Q => .PLL1_P_DIV_2,
                    .RCC_RNGCLKSOURCE_LSE => .HSE_DIV_2,
                };
            }
            pub fn from_enum(item: RCC_OTGHSSEL) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_RNGCLKSOURCE_HSI,
                    .PLL1_P => .RCC_RNGCLKSOURCE_LSI,
                    .PLL1_P_DIV_2 => .RCC_RNGCLKSOURCE_PLL1Q,
                    .HSE_DIV_2 => .RCC_RNGCLKSOURCE_LSE,
                };
            }
        };

        pub const RCC_MCO1SourceVirtualList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_HCLK5,
            RCC_MCO1SOURCE_PLL1RCLK,
            RCC_MCO1SOURCE_PLL1PCLK,
            RCC_MCO1SOURCE_PLL1QCLK,
            RCC_MCO1SOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_PLL1PCLK => .PLL1_P,
                    .RCC_MCO1SOURCE_PLL1QCLK => .PLL1_Q,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HCLK5 => .HCLK5,
                    .RCC_MCO1SOURCE_PLL1RCLK => .PLL1_R,
                    .RCC_MCO1SOURCE_SYSCLK => .SYSCLKPRE,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .PLL1_P => .RCC_MCO1SOURCE_PLL1PCLK,
                    .PLL1_Q => .RCC_MCO1SOURCE_PLL1QCLK,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HCLK5 => .RCC_MCO1SOURCE_HCLK5,
                    .PLL1_R => .RCC_MCO1SOURCE_PLL1RCLK,
                    .SYSCLKPRE => .RCC_MCO1SOURCE_SYSCLK,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_MCOSEL", @tagName(item), "RCC_MCO1SourceVirtual" },
                    ),
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
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_16 => .Div16,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_MCODIV_1,
                    .Div4 => .RCC_MCODIV_4,
                    .Div2 => .RCC_MCODIV_2,
                    .Div8 => .RCC_MCODIV_8,
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
                };
            }
        };

        pub const LSCOSource1VirtualList = enum {
            RCC_LSCOSOURCE_LSI,
            RCC_LSCOSOURCE_LSE,
        };

        pub const AHB5CLKDividerList = enum {
            DIV1,
            DIV2,
            DIV3,
            DIV4,
            DIV6,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE5 {
                return switch (self) {
                    .DIV4 => .Div4,
                    .DIV2 => .Div2,
                    .DIV3 => .Div3,
                    .DIV1 => .Div1,
                    .DIV6 => .Div6,
                };
            }
            pub fn from_enum(item: RCC_HPRE5) anyerror!@This() {
                return switch (item) {
                    .Div4 => .DIV4,
                    .Div2 => .DIV2,
                    .Div3 => .DIV3,
                    .Div1 => .DIV1,
                    .Div6 => .DIV6,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .DIV1 => 1,
                    .DIV2 => 2,
                    .DIV3 => 3,
                    .DIV4 => 4,
                    .DIV6 => 6,
                };
            }
        };

        pub const AHBCLKDividerList = enum {
            RCC_SYSCLK_DIV1,
            RCC_SYSCLK_DIV2,
            RCC_SYSCLK_DIV4,
            RCC_SYSCLK_DIV8,
            RCC_SYSCLK_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_SYSCLK_DIV4 => .Div4,
                    .RCC_SYSCLK_DIV16 => .Div16,
                    .RCC_SYSCLK_DIV2 => .Div2,
                    .RCC_SYSCLK_DIV1 => .Div1,
                    .RCC_SYSCLK_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_SYSCLK_DIV4,
                    .Div16 => .RCC_SYSCLK_DIV16,
                    .Div2 => .RCC_SYSCLK_DIV2,
                    .Div1 => .RCC_SYSCLK_DIV1,
                    .Div8 => .RCC_SYSCLK_DIV8,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_SYSCLK_DIV1 => 1,
                    .RCC_SYSCLK_DIV2 => 2,
                    .RCC_SYSCLK_DIV4 => 4,
                    .RCC_SYSCLK_DIV8 => 8,
                    .RCC_SYSCLK_DIV16 => 16,
                };
            }
        };

        pub const CortexCLockSelectionVirtualList = enum {
            RCC_SYSTICKCLKSOURCE_HCLK_DIV8,
            RCC_SYSTICKCLKSOURCE_LSI,
            RCC_SYSTICKCLKSOURCE_LSE,
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

        pub const APB7CLKDividerList = enum {
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
            RCC_SPI1CLKSOURCE_PCLK2,
            RCC_SPI1CLKSOURCE_SYSCLK,
            RCC_SPI1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_OTGHSSEL {
                return switch (self) {
                    .RCC_SPI1CLKSOURCE_PCLK2 => .PLL1_P_DIV_2,
                    .RCC_SPI1CLKSOURCE_SYSCLK => .PLL1_P,
                    .RCC_SPI1CLKSOURCE_HSI => .HSE,
                };
            }
            pub fn from_enum(item: RCC_OTGHSSEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_P_DIV_2 => .RCC_SPI1CLKSOURCE_PCLK2,
                    .PLL1_P => .RCC_SPI1CLKSOURCE_SYSCLK,
                    .HSE => .RCC_SPI1CLKSOURCE_HSI,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_OTGHSSEL", @tagName(item), "SPI1CLockSelection" },
                    ),
                };
            }
        };

        pub const SPI3CLockSelectionList = enum {
            RCC_SPI3CLKSOURCE_PCLK7,
            RCC_SPI3CLKSOURCE_SYSCLK,
            RCC_SPI3CLKSOURCE_HSI,
        };

        pub const PLL1PList = enum {
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
                        .{ "RCC_PLLDIV", @tagName(item), "PLL1P" },
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

        pub const PREFETCH_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const FLatencyList = enum {
            FLASH_LATENCY_1,
            FLASH_LATENCY_0,
            FLASH_LATENCY_3,
            FLASH_LATENCY_2,
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE2,

            pub fn to_enum(self: @This()) anyerror!PWR_REGPASEL {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .B_0x0,
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .B_0x1,
                };
            }
            pub fn from_enum(item: PWR_REGPASEL) anyerror!@This() {
                return switch (item) {
                    .B_0x0 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .B_0x1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                };
            }
        };

        pub const LSE_TrimmingList = enum {
            RCC_LSETRIMMING_R,
            RCC_LSETRIMMING_1_2_R,
            RCC_LSETRIMMING_2_3_R,
            RCC_LSETRIMMING_3_4_R,
        };

        pub const LSE_Drive_CapabilityList = enum {
            RCC_LSEDRIVE_MEDIUMLOW,
            RCC_LSEDRIVE_MEDIUMHIGH,
            RCC_LSEDRIVE_HIGH,

            pub fn to_enum(self: @This()) anyerror!RCC_LSI2CFG {
                return switch (self) {
                    .RCC_LSEDRIVE_MEDIUMLOW => .Sensitivity0At20C,
                    .RCC_LSEDRIVE_MEDIUMHIGH => .Sensitivity0At50C,
                    .RCC_LSEDRIVE_HIGH => .Sensitivity0At80C,
                };
            }
            pub fn from_enum(item: RCC_LSI2CFG) anyerror!@This() {
                return switch (item) {
                    .Sensitivity0At20C => .RCC_LSEDRIVE_MEDIUMLOW,
                    .Sensitivity0At50C => .RCC_LSEDRIVE_MEDIUMHIGH,
                    .Sensitivity0At80C => .RCC_LSEDRIVE_HIGH,
                };
            }
        };

        pub const PLL1_VCI_RangeList = enum {
            RCC_PLL_VCOINPUT_RANGE0,
            RCC_PLL_VCOINPUT_RANGE1,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLRGE {
                return switch (self) {
                    .RCC_PLL_VCOINPUT_RANGE1 => .FREQ_8TO16MHZ,
                    .RCC_PLL_VCOINPUT_RANGE0 => .FREQ_4TO8MHZ,
                };
            }
            pub fn from_enum(item: RCC_PLLRGE) anyerror!@This() {
                return switch (item) {
                    .FREQ_8TO16MHZ => .RCC_PLL_VCOINPUT_RANGE1,
                    .FREQ_4TO8MHZ => .RCC_PLL_VCOINPUT_RANGE0,
                };
            }
        };

        pub const EnableHSEList = enum {
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

        pub const EnableHSERFDevisorList = enum {
            true,
            false,
        };

        pub const RFEnableList = enum {
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

        pub const USART2EnableList = enum {
            true,
            false,
        };

        pub const USART1EnableList = enum {
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

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const ASEnableList = enum {
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

        pub const SAI1EnableList = enum {
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

        pub const LSCOEnableList = enum {
            true,
            false,
        };

        pub const SAESEnableList = enum {
            true,
            false,
        };

        pub const SystickEnableList = enum {
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
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            LSEByPassRTC: bool = false,
            LSEOscillatorRTC: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            AUDIOSYNC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC4: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            PLLRUsed: bool = false,
            RF_Used: bool = false,
            LPTIM2_UsedUsed_ForRCC: bool = false,
            SPI1Used_ForRCCC: bool = false,
            EnableCSS: bool = false,
            RNG_Used: bool = false,
            ADC4_Used: bool = false,
            TIM17_Used: bool = false,
            TIM16_Used: bool = false,
            SAES_Used: bool = false,
            SAI1_Used: bool = false,
            LPTIM2_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            SEM2RCC_HSI_REQUIRED_LPTIM2: bool = false,
            SEM2RCC_HSI_REQUIRED_TIM17: bool = false,
            SEM2RCC_HSI_REQUIRED_TIM16: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            STM32WBA5MJGHx: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            TIM15: bool = true,
            Semaphore_input_Channel1_directTIM15: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            RCC_HCLK_DIV1: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            RCC_MCO1SOURCE_PLL1RCLK: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            Systick_External: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            LSEByPassRTC: bool = false,
            LSEOscillatorRTC: bool = false,
            MCOConfig: bool = false,
            LSCOConfig: bool = false,
            SAI1EXTCLK: bool = false,
            AUDIOSYNC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            LPUARTUsed_ForRCC: bool = false,
            LPTIM1Used_ForRCC: bool = false,
            LPTIM2Used_ForRCC: bool = false,
            USE_ADC4: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            SAI1_SAIBUsed_ForRCC: bool = false,
            SAI1_SAIAUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SPI1Used_ForRCC: bool = false,
            SPI3Used_ForRCC: bool = false,
            PLLRUsed: bool = false,
            RF_Used: bool = false,
            LPTIM2_UsedUsed_ForRCC: bool = false,
            SPI1Used_ForRCCC: bool = false,
            EnableCSS: bool = false,
            RNG_Used: bool = false,
            ADC4_Used: bool = false,
            TIM17_Used: bool = false,
            TIM16_Used: bool = false,
            SAES_Used: bool = false,
            SAI1_Used: bool = false,
            LPTIM2_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM16: bool = false,
            SEM2RCC_HSI_REQUIRED_LPTIM2: bool = false,
            SEM2RCC_HSI_REQUIRED_TIM17: bool = false,
            SEM2RCC_HSI_REQUIRED_TIM16: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            STM32WBA5MJGHx: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM15: bool = false,
            TIM15: bool = true,
            Semaphore_input_Channel1_directTIM15: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            RCC_HCLK_DIV1: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            RCC_MCO1SOURCE_PLL1RCLK: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            Systick_External: bool = false,
            PREFETCH_ENABLE: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            LSIEnable: bool = false, //Reference flag
            EnableExtClockForSAI1: bool = false, //Reference flag
            EnableHSERFDevisor: bool = false, //Reference flag
            RFEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            LPUART1Enable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            LPTIM2Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            ASEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            SAESEnable: bool = false, //Reference flag
            SystickEnable: bool = false, //Reference flag
            SPI1Enable: bool = false, //Reference flag
            SPI3Enable: bool = false, //Reference flag
            PLL1PUsed: bool = false, //Reference flag
            PLL1QUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag
            PLL1RUsed: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            HSE_Trimming: ?u32 = null,
            LSE_Trimming: ?LSE_TrimmingList = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSE_VALUE: ?f32 = null,
            HseDiv: ?HseDivList = null,
            LSI_VALUE: ?f32 = null,
            LSIDIV: ?LSIDIVList = null,
            LSI2_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            RSTClockSelectionVirtual: ?RSTClockSelectionVirtualList = null,
            SYSCLKSourceVirtual: ?SYSCLKSourceVirtualList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?u32 = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART2CLockSelectionVirtual: ?USART2CLockSelectionVirtualList = null,
            USART1CLockSelectionVirtual: ?USART1CLockSelectionVirtualList = null,
            LPUART1CLockSelectionVirtual: ?LPUART1CLockSelectionVirtualList = null,
            LPTIM1CLockSelectionVirtual: ?LPTIM1CLockSelectionVirtualList = null,
            LPTIM2CLockSelectionVirtual: ?LPTIM2CLockSelectionVirtualList = null,
            ADCCLockSelectionVirtual: ?ADCCLockSelectionVirtualList = null,
            ASClockSelection: ?ASClockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
            SAI1CLockSelectionVirtual: ?SAI1CLockSelectionVirtualList = null,
            RNGCLockSelectionVirtual: ?RNGCLockSelectionVirtualList = null,
            RCC_MCO1SourceVirtual: ?RCC_MCO1SourceVirtualList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            LSCOSource1Virtual: ?LSCOSource1VirtualList = null,
            AHB5CLKDivider: ?AHB5CLKDividerList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            CortexCLockSelectionVirtual: ?CortexCLockSelectionVirtualList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            APB7CLKDivider: ?APB7CLKDividerList = null,
            SPI1CLockSelection: ?SPI1CLockSelectionList = null,
            SPI3CLockSelection: ?SPI3CLockSelectionList = null,
            PLLN: ?u32 = null,
            PLLFRACN: ?u32 = null,
            PLL1P: ?PLL1PList = null,
            PLL1Q: ?u32 = null,
            PLL1R: ?u32 = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HseDiv: HseDivList,
            LSIDIV: LSIDIVList,
            RCC_RST_Clock_Source_FROM_HSE: u32,
            RSTClockSelectionVirtual: RSTClockSelectionVirtualList,
            SYSCLKSourceVirtual: SYSCLKSourceVirtualList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLM: u32,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART2CLockSelectionVirtual: USART2CLockSelectionVirtualList,
            USART1CLockSelectionVirtual: USART1CLockSelectionVirtualList,
            LPUART1CLockSelectionVirtual: LPUART1CLockSelectionVirtualList,
            LPTIM1CLockSelectionVirtual: LPTIM1CLockSelectionVirtualList,
            LPTIM2CLockSelectionVirtual: LPTIM2CLockSelectionVirtualList,
            ADCCLockSelectionVirtual: ADCCLockSelectionVirtualList,
            ASClockSelection: ASClockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C3CLockSelection: I2C3CLockSelectionList,
            SAI1CLockSelectionVirtual: SAI1CLockSelectionVirtualList,
            pllqDivToRNG: u32,
            RNGCLockSelectionVirtual: RNGCLockSelectionVirtualList,
            RCC_MCO1SourceVirtual: RCC_MCO1SourceVirtualList,
            RCC_MCODiv: RCC_MCODivList,
            LSCOSource1Virtual: LSCOSource1VirtualList,
            AHB5CLKDivider: AHB5CLKDividerList,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: u32,
            CortexCLockSelectionVirtual: CortexCLockSelectionVirtualList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB7CLKDivider: APB7CLKDividerList,
            APB2TimCLKDivider: u32,
            SPI1CLockSelection: SPI1CLockSelectionList,
            SPI3CLockSelection: SPI3CLockSelectionList,
            PLLN: u32,
            PLL1P: PLL1PList,
            PLL1Q: u32,
            PLL1R: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            HSE_Timout: u32,
            LSE_Timout: u32,
            HSE_Trimming: u32,
            LSE_Trimming: LSE_TrimmingList,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
            PLL1_VCI_Range: PLL1_VCI_RangeList,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            PWR_Regulator_Voltage_Scale: ?PWR_REGPASEL = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            HSE_Trimming: ?u32 = null,
            LSE_Trimming: ?LSE_TrimmingList = null,
            LSE_Drive_Capability: ?RCC_LSI2CFG = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .FLatency = self.FLatency,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .HSE_Trimming = self.HSE_Trimming,
                    .LSE_Trimming = self.LSE_Trimming,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSE_VALUE: ?f32 = null,
            HseDiv: ?RCC_PPRE = null,
            LSI_VALUE: ?f32 = null,
            LSIDIV: ?LSIDIVList = null,
            LSI2_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            RSTClockSelectionVirtual: ?RSTClockSelectionVirtualList = null,
            SYSCLKSourceVirtual: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?u32 = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART2CLockSelectionVirtual: ?RCC_OTGHSSEL = null,
            USART1CLockSelectionVirtual: ?RCC_HPRE5 = null,
            LPUART1CLockSelectionVirtual: ?RCC_OTGHSSEL = null,
            LPTIM1CLockSelectionVirtual: ?RCC_OTGHSSEL = null,
            LPTIM2CLockSelectionVirtual: ?RCC_OTGHSSEL = null,
            ADCCLockSelectionVirtual: ?ADCCLockSelectionVirtualList = null,
            ASClockSelection: ?RCC_PLLRCLKPRESTEP = null,
            I2C1CLockSelection: ?RCC_OTGHSSEL = null,
            I2C3CLockSelection: ?RCC_SW = null,
            SAI1CLockSelectionVirtual: ?RCC_PPRE = null,
            RNGCLockSelectionVirtual: ?RCC_OTGHSSEL = null,
            RCC_MCO1SourceVirtual: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            LSCOSource1Virtual: ?LSCOSource1VirtualList = null,
            AHB5CLKDivider: ?RCC_HPRE5 = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            CortexCLockSelectionVirtual: ?CortexCLockSelectionVirtualList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            APB7CLKDivider: ?RCC_PPRE = null,
            SPI1CLockSelection: ?RCC_OTGHSSEL = null,
            SPI3CLockSelection: ?SPI3CLockSelectionList = null,
            PLLN: ?u32 = null,
            PLLFRACN: ?u32 = null,
            PLL1P: ?RCC_PLLDIV = null,
            PLL1Q: ?u32 = null,
            PLL1R: ?u32 = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSE_VALUE = self.HSE_VALUE,
                    .HseDiv = if (self.HseDiv) |val| try HseDivList.from_enum(val) else null,
                    .LSI_VALUE = self.LSI_VALUE,
                    .LSIDIV = self.LSIDIV,
                    .LSI2_VALUE = self.LSI2_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .RSTClockSelectionVirtual = self.RSTClockSelectionVirtual,
                    .SYSCLKSourceVirtual = if (self.SYSCLKSourceVirtual) |val| try SYSCLKSourceVirtualList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = self.PLLM,
                    .RTCClockSelection = self.RTCClockSelection,
                    .USART2CLockSelectionVirtual = if (self.USART2CLockSelectionVirtual) |val| try USART2CLockSelectionVirtualList.from_enum(val) else null,
                    .USART1CLockSelectionVirtual = if (self.USART1CLockSelectionVirtual) |val| try USART1CLockSelectionVirtualList.from_enum(val) else null,
                    .LPUART1CLockSelectionVirtual = if (self.LPUART1CLockSelectionVirtual) |val| try LPUART1CLockSelectionVirtualList.from_enum(val) else null,
                    .LPTIM1CLockSelectionVirtual = if (self.LPTIM1CLockSelectionVirtual) |val| try LPTIM1CLockSelectionVirtualList.from_enum(val) else null,
                    .LPTIM2CLockSelectionVirtual = if (self.LPTIM2CLockSelectionVirtual) |val| try LPTIM2CLockSelectionVirtualList.from_enum(val) else null,
                    .ADCCLockSelectionVirtual = self.ADCCLockSelectionVirtual,
                    .ASClockSelection = if (self.ASClockSelection) |val| try ASClockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C3CLockSelection = if (self.I2C3CLockSelection) |val| try I2C3CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelectionVirtual = if (self.SAI1CLockSelectionVirtual) |val| try SAI1CLockSelectionVirtualList.from_enum(val) else null,
                    .RNGCLockSelectionVirtual = if (self.RNGCLockSelectionVirtual) |val| try RNGCLockSelectionVirtualList.from_enum(val) else null,
                    .RCC_MCO1SourceVirtual = if (self.RCC_MCO1SourceVirtual) |val| try RCC_MCO1SourceVirtualList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .LSCOSource1Virtual = self.LSCOSource1Virtual,
                    .AHB5CLKDivider = if (self.AHB5CLKDivider) |val| try AHB5CLKDividerList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .CortexCLockSelectionVirtual = self.CortexCLockSelectionVirtual,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .APB7CLKDivider = if (self.APB7CLKDivider) |val| try APB7CLKDividerList.from_enum(val) else null,
                    .SPI1CLockSelection = if (self.SPI1CLockSelection) |val| try SPI1CLockSelectionList.from_enum(val) else null,
                    .SPI3CLockSelection = self.SPI3CLockSelection,
                    .PLLN = self.PLLN,
                    .PLLFRACN = self.PLLFRACN,
                    .PLL1P = if (self.PLL1P) |val| try PLL1PList.from_enum(val) else null,
                    .PLL1Q = self.PLL1Q,
                    .PLL1R = self.PLL1R,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HseDiv: RCC_PPRE,
            LSIDIV: LSIDIVList,
            RCC_RST_Clock_Source_FROM_HSE: u32,
            RSTClockSelectionVirtual: RSTClockSelectionVirtualList,
            SYSCLKSourceVirtual: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLM: u32,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART2CLockSelectionVirtual: RCC_OTGHSSEL,
            USART1CLockSelectionVirtual: RCC_HPRE5,
            LPUART1CLockSelectionVirtual: RCC_OTGHSSEL,
            LPTIM1CLockSelectionVirtual: RCC_OTGHSSEL,
            LPTIM2CLockSelectionVirtual: RCC_OTGHSSEL,
            ADCCLockSelectionVirtual: ADCCLockSelectionVirtualList,
            ASClockSelection: RCC_PLLRCLKPRESTEP,
            I2C1CLockSelection: RCC_OTGHSSEL,
            I2C3CLockSelection: RCC_SW,
            SAI1CLockSelectionVirtual: RCC_PPRE,
            pllqDivToRNG: u32,
            RNGCLockSelectionVirtual: RCC_OTGHSSEL,
            RCC_MCO1SourceVirtual: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            LSCOSource1Virtual: LSCOSource1VirtualList,
            AHB5CLKDivider: RCC_HPRE5,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: u32,
            CortexCLockSelectionVirtual: CortexCLockSelectionVirtualList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB7CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            SPI1CLockSelection: RCC_OTGHSSEL,
            SPI3CLockSelection: SPI3CLockSelectionList,
            PLLN: u32,
            PLL1P: RCC_PLLDIV,
            PLL1Q: u32,
            PLL1R: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            PWR_Regulator_Voltage_Scale: PWR_REGPASEL,
            HSE_Timout: u32,
            LSE_Timout: u32,
            HSE_Trimming: u32,
            LSE_Trimming: LSE_TrimmingList,
            LSE_Drive_Capability: ?RCC_LSI2CFG,
            PLL1_VCI_Range: RCC_PLLRGE,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HseDiv = try cubemx_config.HseDiv.to_enum(),
                    .LSIDIV = cubemx_config.LSIDIV,
                    .RCC_RST_Clock_Source_FROM_HSE = cubemx_config.RCC_RST_Clock_Source_FROM_HSE,
                    .RSTClockSelectionVirtual = cubemx_config.RSTClockSelectionVirtual,
                    .SYSCLKSourceVirtual = try cubemx_config.SYSCLKSourceVirtual.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = cubemx_config.PLLM,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = cubemx_config.RTCClockSelection,
                    .USART2CLockSelectionVirtual = try cubemx_config.USART2CLockSelectionVirtual.to_enum(),
                    .USART1CLockSelectionVirtual = try cubemx_config.USART1CLockSelectionVirtual.to_enum(),
                    .LPUART1CLockSelectionVirtual = try cubemx_config.LPUART1CLockSelectionVirtual.to_enum(),
                    .LPTIM1CLockSelectionVirtual = try cubemx_config.LPTIM1CLockSelectionVirtual.to_enum(),
                    .LPTIM2CLockSelectionVirtual = try cubemx_config.LPTIM2CLockSelectionVirtual.to_enum(),
                    .ADCCLockSelectionVirtual = cubemx_config.ADCCLockSelectionVirtual,
                    .ASClockSelection = try cubemx_config.ASClockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C3CLockSelection = try cubemx_config.I2C3CLockSelection.to_enum(),
                    .SAI1CLockSelectionVirtual = try cubemx_config.SAI1CLockSelectionVirtual.to_enum(),
                    .pllqDivToRNG = cubemx_config.pllqDivToRNG,
                    .RNGCLockSelectionVirtual = try cubemx_config.RNGCLockSelectionVirtual.to_enum(),
                    .RCC_MCO1SourceVirtual = try cubemx_config.RCC_MCO1SourceVirtual.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .LSCOSource1Virtual = cubemx_config.LSCOSource1Virtual,
                    .AHB5CLKDivider = try cubemx_config.AHB5CLKDivider.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .CortexCLockSelectionVirtual = cubemx_config.CortexCLockSelectionVirtual,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB7CLKDivider = try cubemx_config.APB7CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .SPI1CLockSelection = try cubemx_config.SPI1CLockSelection.to_enum(),
                    .SPI3CLockSelection = cubemx_config.SPI3CLockSelection,
                    .PLLN = cubemx_config.PLLN,
                    .PLL1P = try cubemx_config.PLL1P.to_enum(),
                    .PLL1Q = cubemx_config.PLL1Q,
                    .PLL1R = cubemx_config.PLL1R,
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = cubemx_config.FLatency,
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
                    .HSE_Trimming = cubemx_config.HSE_Trimming,
                    .LSE_Trimming = cubemx_config.LSE_Trimming,
                    .LSE_Drive_Capability = if (cubemx_config.LSE_Drive_Capability) |val| try val.to_enum() else null,
                    .PLL1_VCI_Range = try cubemx_config.PLL1_VCI_Range.to_enum(),
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
            HSEOSC: u32 = 0,
            HseDiv: u32 = 0,
            LSIRC: u32 = 0,
            LSIOut: u32 = 0,
            LSI2RC: u32 = 0,
            LSIDIV: u32 = 0,
            LSEOSC: u32 = 0,
            SAI1_EXT: u32 = 0,
            HSERSTDevisor: u32 = 0,
            RSTClkSource: u32 = 0,
            RSTOutput: u32 = 0,
            RSTRFOutput: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PLLSource: u32 = 0,
            PLLM: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            USART2Mult: u32 = 0,
            USART2output: u32 = 0,
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            LPUART1Mult: u32 = 0,
            LPUART1output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1output: u32 = 0,
            LPTIM2Mult: u32 = 0,
            LPTIM2output: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            ASMult: u32 = 0,
            ASoutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3output: u32 = 0,
            SAI1Mult: u32 = 0,
            SAI1output: u32 = 0,
            pllqDivToRNG: u32 = 0,
            RNGMult: u32 = 0,
            RNGoutput: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
            AHB5Prescaler: u32 = 0,
            AHB5Output: u32 = 0,
            SAESOutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            HCLK4Output: u32 = 0,
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
            APB7Prescaler: u32 = 0,
            APB7Output: u32 = 0,
            TimPrescalerAPB2: u32 = 0,
            TimPrescOut2: u32 = 0,
            SPI1Mult: u32 = 0,
            SPI1output: u32 = 0,
            SPI3Mult: u32 = 0,
            SPI3output: u32 = 0,
            PLLN: u32 = 0,
            PLLFRACN: u32 = 0,
            PLL1P: u32 = 0,
            PLLPoutput: u32 = 0,
            PLL1Q: u32 = 0,
            PLLQoutput: u32 = 0,
            PLL1R: u32 = 0,
            VCOInput: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            LSI1: u32 = 0,
            HSESYS: u32 = 0,
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

            var hsepres: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSI_DIV1: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSI_DIV128: bool = false; //semaphore for processing, not an actual flag in the output;
            var RST_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RST_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RST_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPUART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM2SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var adc_pll1p: bool = false; //semaphore for processing, not an actual flag in the output;
            var ASPLL1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var ASPLL1Q: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLL1P: bool = false; //semaphore for processing, not an actual flag in the output;
            var sai1_pll1q: bool = false; //semaphore for processing, not an actual flag in the output;
            var rng_pll1q: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RNGCLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO1SOURCE_HSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var mco1_pll1r: bool = false; //semaphore for processing, not an actual flag in the output;
            var mco1_pll1p: bool = false; //semaphore for processing, not an actual flag in the output;
            var mco1_pll1q: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHB5_1: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHB5_2: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHB5_3: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHB5_4: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHB5_6: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_HCLK_1_8: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_LSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CLKSOURCE_LSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI1CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPI3CLKSOURCE_HSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale1: bool = false; //semaphore for processing, not an actual flag in the output;
            var scale2: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSE_R: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var HSEOSC = ClockNode{
                .name = "HSEOSC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HseDiv = ClockNode{
                .name = "HseDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSIRC = ClockNode{
                .name = "LSIRC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSIOut = ClockNode{
                .name = "LSIOut",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LSI2RC = ClockNode{
                .name = "LSI2RC",
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

            var SAI1_EXT = ClockNode{
                .name = "SAI1_EXT",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSERSTDevisor = ClockNode{
                .name = "HSERSTDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RSTClkSource = ClockNode{
                .name = "RSTClkSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RSTOutput = ClockNode{
                .name = "RSTOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RSTRFOutput = ClockNode{
                .name = "RSTRFOutput",
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

            var IWDGOutput = ClockNode{
                .name = "IWDGOutput",
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

            var ASMult = ClockNode{
                .name = "ASMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ASoutput = ClockNode{
                .name = "ASoutput",
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

            var pllqDivToRNG = ClockNode{
                .name = "pllqDivToRNG",
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

            var AHB5Prescaler = ClockNode{
                .name = "AHB5Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var AHB5Output = ClockNode{
                .name = "AHB5Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAESOutput = ClockNode{
                .name = "SAESOutput",
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

            var HCLK4Output = ClockNode{
                .name = "HCLK4Output",
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

            var APB7Prescaler = ClockNode{
                .name = "APB7Prescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APB7Output = ClockNode{
                .name = "APB7Output",
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

            var LSI1 = ClockNode{
                .name = "LSI1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSESYS = ClockNode{
                .name = "HSESYS",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const HSE_VALUEValue: f32 = blk: {
                if ((config.flags.STM32WBA5MJGHx)) {
                    if (config.HSE_VALUE) |val| {
                        if (val != 3.2e7) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {e} found: {e}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "HSE_VALUE",
                                "(STM32WBA5MJGHx)",
                                "HSE in Crystal/Bypass Mode",
                                3.2e7,
                                val,
                            });
                        }
                    }
                    HSEOSC.limit = .{
                        .min = 3.2e7,
                        .max = 3.2e7,
                        .main_expr = "(STM32WBA5MJGHx)",
                        .main_dialog = "HSE in Crystal/Bypass Mode",
                    };
                    break :blk 3.2e7;
                } else if ((config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 3.2e7,
                        .main_expr = "(HSEOscillator|HSEByPass)",
                        .main_dialog = "HSE in Crystal/Bypass Mode",
                    };
                    break :blk user_val orelse 1.6e7;
                }
                if (config.HSE_VALUE) |val| {
                    if (val != 1.6e7) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Expected Fixed Value: {e} found: {e}
                            \\note: some values are fixed depending on the clock configuration.
                            \\
                            \\
                        , .{
                            "HSE_VALUE",
                            "Else",
                            "No additional information",
                            1.6e7,
                            val,
                        });
                    }
                }
                HSEOSC.limit = .{
                    .min = 1.6e7,
                    .max = 1.6e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk 1.6e7;
            };

            const HseDivValue: HseDivList = blk: {
                const user_val = config.HseDiv;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSE_DIV1 => {},
                        .RCC_HSE_DIV2 => hsepres = true,
                    }
                }
                break :blk user_val orelse .RCC_HSE_DIV1;
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

            const LSI2_VALUEValue: f32 = blk: {
                const user_val = config.LSI2_VALUE;
                LSI2RC.limit = .{
                    .min = 3.14e4,
                    .max = 3.26e4,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 3.2e4;
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
                        .main_expr = "(LSEOscillator | LSEOscillatorRTC)",
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

            const EXTERNALSAI1_CLOCK_VALUEValue: f32 = blk: {
                break :blk 4.8e4;
            };

            const RCC_RST_Clock_Source_FROM_HSEValue: u32 = blk: {
                break :blk 1000;
            };

            const RSTClockSelectionVirtualValue: RSTClockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.RSTClockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_RADIOSTCLKSOURCE_HSE_DIV1000 => RST_HSE = true,
                            .RCC_RADIOSTCLKSOURCE_LSI => RST_LSI = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "RSTClockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is only for RTC",
                                    @tagName(val),
                                    "RCC_RADIOSTCLKSOURCE_HSE_DIV1000",
                                    "RCC_RADIOSTCLKSOURCE_LSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        RST_HSE = true;
                        break :blk .RCC_RADIOSTCLKSOURCE_HSE_DIV1000;
                    };
                }
                const user_val = config.RSTClockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RADIOSTCLKSOURCE_HSE_DIV1000 => RST_HSE = true,
                        .RCC_RADIOSTCLKSOURCE_LSE => RST_LSE = true,
                        .RCC_RADIOSTCLKSOURCE_LSI => RST_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    RST_HSE = true;
                    break :blk .RCC_RADIOSTCLKSOURCE_HSE_DIV1000;
                };
            };

            const SYSCLKSourceVirtualValue: SYSCLKSourceVirtualList = blk: {
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
                    if (val > 8) {
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
                            8,
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

            const USART2CLockSelectionVirtualValue: USART2CLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
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
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_P_DIV_2" else "RCC_USART2CLKSOURCE_PCLK1",
                                    if (patch_logs) "PLL1_P" else "RCC_USART2CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSE" else "RCC_USART2CLKSOURCE_HSI",
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

            const USART1CLockSelectionVirtualValue: USART1CLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.USART1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_USART1CLKSOURCE_PCLK2 => {},
                            .RCC_USART1CLKSOURCE_SYSCLK => {},
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
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Div2" else "RCC_USART1CLKSOURCE_PCLK2",
                                    if (patch_logs) "Div4" else "RCC_USART1CLKSOURCE_SYSCLK",
                                    if (patch_logs) "Div6" else "RCC_USART1CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK2;
                }
                const user_val = config.USART1CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK2 => {},
                        .RCC_USART1CLKSOURCE_SYSCLK => {},
                        .RCC_USART1CLKSOURCE_HSI => USART1SourceHSI = true,
                        .RCC_USART1CLKSOURCE_LSE => USART1SourceLSE = true,
                    }
                }
                break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK2;
            };

            const LPUART1CLockSelectionVirtualValue: LPUART1CLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPUART1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPUART1CLKSOURCE_PCLK7 => {},
                            .RCC_LPUART1CLKSOURCE_SYSCLK => {},
                            .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
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
                                    "(LSEOscillatorRTC|LSEByPassRTC)",
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_P_DIV_2" else "RCC_LPUART1CLKSOURCE_PCLK7",
                                    if (patch_logs) "PLL1_P" else "RCC_LPUART1CLKSOURCE_SYSCLK",
                                    if (patch_logs) "HSE" else "RCC_LPUART1CLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_LPUART1CLKSOURCE_PCLK7;
                }
                const user_val = config.LPUART1CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPUART1CLKSOURCE_PCLK7 => {},
                        .RCC_LPUART1CLKSOURCE_SYSCLK => {},
                        .RCC_LPUART1CLKSOURCE_HSI => LPUART1SourceHSI = true,
                        .RCC_LPUART1CLKSOURCE_LSE => LPUART1SourceLSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPUART1CLKSOURCE_PCLK7;
            };

            const LPTIM1CLockSelectionVirtualValue: LPTIM1CLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.LPTIM1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                            .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
                            .RCC_LPTIM1CLKSOURCE_PCLK7 => {},
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
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_P_DIV_2" else "RCC_LPTIM1CLKSOURCE_LSI",
                                    if (patch_logs) "HSE" else "RCC_LPTIM1CLKSOURCE_HSI",
                                    if (patch_logs) "PLL1_P" else "RCC_LPTIM1CLKSOURCE_PCLK7",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK7;
                }
                const user_val = config.LPTIM1CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1SOURCELSE = true,
                        .RCC_LPTIM1CLKSOURCE_PCLK7 => {},
                    }
                }
                break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK7;
            };

            const LPTIM2CLockSelectionVirtualValue: LPTIM2CLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
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
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_P" else "RCC_LPTIM2CLKSOURCE_PCLK1",
                                    if (patch_logs) "PLL1_P_DIV_2" else "RCC_LPTIM2CLKSOURCE_LSI",
                                    if (patch_logs) "HSE" else "RCC_LPTIM2CLKSOURCE_HSI",
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

            const ASClockSelectionValue: ASClockSelectionList = blk: {
                const user_val = config.ASClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ASCLKSOURCE_PLL1P => ASPLL1P = true,
                        .RCC_ASCLKSOURCE_PLL1Q => ASPLL1Q = true,
                    }
                }
                break :blk user_val orelse {
                    ASPLL1P = true;
                    break :blk .RCC_ASCLKSOURCE_PLL1P;
                };
            };

            const I2C1CLockSelectionValue: I2C1CLockSelectionList = blk: {
                const user_val = config.I2C1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_PCLK1 => {},
                        .RCC_I2C1CLKSOURCE_SYSCLK => I2C1SourceSys = true,
                        .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C1CLKSOURCE_PCLK1;
            };

            const I2C3CLockSelectionValue: I2C3CLockSelectionList = blk: {
                const user_val = config.I2C3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C3CLKSOURCE_PCLK7 => {},
                        .RCC_I2C3CLKSOURCE_SYSCLK => I2C3SourceSys = true,
                        .RCC_I2C3CLKSOURCE_HSI => I2C3SourceHSI = true,
                    }
                }
                break :blk user_val orelse .RCC_I2C3CLKSOURCE_PCLK7;
            };

            const pllqDivToRNGValue: u32 = blk: {
                break :blk 2;
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
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "LSCOSource1Virtual",
                                "(LSEOscillatorRTC|LSEByPassRTC)",
                                "LSE is only for RTC",
                                "RCC_LSCOSOURCE_LSI",
                                val,
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

            const AHB5CLKDividerValue: AHB5CLKDividerList = blk: {
                if (SysSourcePLL) {
                    const user_val = config.AHB5CLKDivider;

                    if (user_val) |val| {
                        switch (val) {
                            .DIV1 => AHB5_1 = true,
                            .DIV2 => AHB5_2 = true,
                            .DIV3 => AHB5_3 = true,
                            .DIV4 => AHB5_4 = true,
                            .DIV6 => AHB5_6 = true,
                        }
                    }
                    break :blk user_val orelse {
                        AHB5_1 = true;
                        break :blk .DIV1;
                    };
                }
                const user_val = config.AHB5CLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .DIV1 => AHB5_1 = true,
                        .DIV2 => AHB5_2 = true,
                        else => {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Option not available in this condition: .{s}.
                                \\note: available options:
                                \\ - {s}
                                \\ - {s}
                            , .{
                                "AHB5CLKDivider",
                                "Else",
                                "No additional information",
                                if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                if (patch_logs) "Div1" else "DIV1",
                                if (patch_logs) "Div2" else "DIV2",
                            });
                        },
                    }
                }
                break :blk user_val orelse {
                    AHB5_1 = true;
                    break :blk .DIV1;
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
                    }
                }
                break :blk user_val orelse {
                    AHBCLKDivider1 = true;
                    break :blk .RCC_SYSCLK_DIV1;
                };
            };

            const Cortex_DivValue: u32 = blk: {
                break :blk 8;
            };

            const CortexCLockSelectionVirtualValue: CortexCLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC)) {
                    const user_val = config.CortexCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SYSTICKCLKSOURCE_HCLK_DIV8 => CLKSOURCE_HCLK_1_8 = true,
                            .RCC_SYSTICKCLKSOURCE_LSI => CLKSOURCE_LSI = true,
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
                                    "LSE is only for RTC",
                                    @tagName(val),
                                    "RCC_SYSTICKCLKSOURCE_HCLK_DIV8",
                                    "RCC_SYSTICKCLKSOURCE_LSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        CLKSOURCE_HCLK_1_8 = true;
                        break :blk .RCC_SYSTICKCLKSOURCE_HCLK_DIV8;
                    };
                }
                const user_val = config.CortexCLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSTICKCLKSOURCE_HCLK_DIV8 => CLKSOURCE_HCLK_1_8 = true,
                        .RCC_SYSTICKCLKSOURCE_LSE => CLKSOURCE_LSE = true,
                        .RCC_SYSTICKCLKSOURCE_LSI => CLKSOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    CLKSOURCE_HCLK_1_8 = true;
                    break :blk .RCC_SYSTICKCLKSOURCE_HCLK_DIV8;
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

            const APB7CLKDividerValue: APB7CLKDividerList = blk: {
                const user_val = config.APB7CLKDivider;

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
                const user_val = config.SPI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI1CLKSOURCE_PCLK2 => {},
                        .RCC_SPI1CLKSOURCE_SYSCLK => {},
                        .RCC_SPI1CLKSOURCE_HSI => SPI1CLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse .RCC_SPI1CLKSOURCE_PCLK2;
            };

            const SPI3CLockSelectionValue: SPI3CLockSelectionList = blk: {
                const user_val = config.SPI3CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPI3CLKSOURCE_PCLK7 => {},
                        .RCC_SPI3CLKSOURCE_SYSCLK => {},
                        .RCC_SPI3CLKSOURCE_HSI => SPI3CLKSOURCE_HSI = true,
                    }
                }
                break :blk user_val orelse .RCC_SPI3CLKSOURCE_PCLK7;
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

            const LSI1_VALUEValue: f32 = blk: {
                LSI1.limit = .{
                    .min = 3.14e4,
                    .max = 3.26e4,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
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

            const HSE_TrimmingValue: u32 = blk: {
                const user_val = config.extra_config.HSE_Trimming;
                if (user_val) |val| {
                    if (val < 0) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "HSE_Trimming",
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
                            "HSE_Trimming",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 0;
            };

            const LSE_TrimmingValue: LSE_TrimmingList = blk: {
                const user_val = config.extra_config.LSE_Trimming;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LSETRIMMING_R => LSE_R = true,
                        .RCC_LSETRIMMING_1_2_R => {},
                        .RCC_LSETRIMMING_2_3_R => {},
                        .RCC_LSETRIMMING_3_4_R => {},
                    }
                }
                break :blk user_val orelse {
                    LSE_R = true;
                    break :blk .RCC_LSETRIMMING_R;
                };
            };

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEOscillator or config.flags.HSEByPass)) {
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
                } else if (config.flags.SAI1EXTCLK) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERFDevisorValue: EnableHSERFDevisorList = blk: {
                if (config.flags.RF_Used and ((config.flags.HSEOscillator or config.flags.HSEByPass))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RFEnableValue: RFEnableList = blk: {
                if (config.flags.RF_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
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

            const ADCEnableValue: ADCEnableList = blk: {
                if ((config.flags.USE_ADC4 and config.flags.ADC4_Used)) {
                    break :blk .true;
                } else if ((config.flags.USE_ADC4 and config.flags.ADC4_Used)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ASEnableValue: ASEnableList = blk: {
                if (config.flags.AUDIOSYNC) {
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

            const SAI1EnableValue: SAI1EnableList = blk: {
                if ((config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC)) {
                    break :blk .true;
                } else if ((config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC)) {
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
                if ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig) {
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

            const SAESEnableValue: SAESEnableList = blk: {
                if (config.flags.SAES_Used) {
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

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if (((PLLSourceHSE and SysSourcePLL) or (check_ref(@TypeOf(SYSCLKSourceVirtualValue), SYSCLKSourceVirtualValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE HseDiv ======
            HseDiv.nodetype = .div;
            HseDiv.value = try HseDivValue.get();
            HseDiv.parents = &.{&HSEOSC};

            // ======= NODE LSIRC ======
            if (!check_MCU("STM32WBAx4") and !check_MCU("STM32WBAx5")) {
                LSIRC.nodetype = .source;
                LSIRC.value = LSI_VALUEValue;
            } else if (check_MCU("STM32WBAx4") or check_MCU("STM32WBAx5")) {
                LSIRC.nodetype = .source;
                LSIRC.value = LSI_VALUEValue;
            }
            // ======= NODE LSIOut ======
            if (!check_MCU("STM32WBAx4") and !check_MCU("STM32WBAx5")) {
                LSIOut.nodetype = .div;
                LSIOut.value = try LSIDIVValue.get();
                LSIOut.parents = &.{&LSIRC};
            } else if (check_MCU("STM32WBAx4") or check_MCU("STM32WBAx5")) {
                LSIOut.nodetype = .div;
                LSIOut.value = try LSIDIVValue.get();
                LSIOut.parents = &.{&LSIDIV};
            }
            // ======= NODE LSI2RC ======
            if (check_MCU("STM32WBAx4") or check_MCU("STM32WBAx5")) {
                LSI2RC.nodetype = .source;
                LSI2RC.value = LSI2_VALUEValue;
            }
            // ======= NODE LSIDIV ======
            if (check_MCU("STM32WBAx4") or check_MCU("STM32WBAx5")) {
                LSIDIV.nodetype = .div;
                LSIDIV.value = try LSIDIVValue.get();
                LSIDIV.parents = &.{&LSIRC};
            }
            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE SAI1_EXT ======
            SAI1_EXT.nodetype = .source;
            SAI1_EXT.value = EXTERNALSAI1_CLOCK_VALUEValue;

            // ======= NODE HSERSTDevisor ======
            HSERSTDevisor.nodetype = .div;
            HSERSTDevisor.value = @floatFromInt(RCC_RST_Clock_Source_FROM_HSEValue);
            HSERSTDevisor.parents = &.{&HSEOSC};

            // ======= NODE RSTClkSource ======
            if (check_MCU("STM32WBAx4") or check_MCU("STM32WBAx5") or check_MCU("STM32WBAx0")) {
                RSTClkSource.nodetype = .multi;
                RSTClkSource.parents = switch (RSTClockSelectionVirtualValue) {
                    .RCC_RADIOSTCLKSOURCE_HSE_DIV1000 => &.{&HSERSTDevisor},
                    .RCC_RADIOSTCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RADIOSTCLKSOURCE_LSI => &.{&LSIOut},
                };
            } else if (!check_MCU("STM32WBAx4") and !check_MCU("STM32WBAx5") and !check_MCU("STM32WBAx0")) {
                RSTClkSource.nodetype = .multi;
                RSTClkSource.parents = switch (RSTClockSelectionVirtualValue) {
                    .RCC_RADIOSTCLKSOURCE_HSE_DIV1000 => &.{&HSERSTDevisor},
                    .RCC_RADIOSTCLKSOURCE_LSE => &.{&LSEOSC},
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
                        "RSTClkSource",
                        "!STM32WBAx4 & !STM32WBAx5 & !STM32WBAx0",
                        "",
                        "RSTClockSelectionVirtual",
                        if (patch_logs) @tagName(try RSTClockSelectionVirtualValue.to_enum()) else @tagName(RSTClockSelectionVirtualValue),
                        if (patch_logs) @tagName(try RSTClockSelectionVirtualList.to_enum(.RCC_RADIOSTCLKSOURCE_HSE_DIV1000)) else @tagName(RSTClockSelectionVirtualList.RCC_RADIOSTCLKSOURCE_HSE_DIV1000),
                        if (patch_logs) @tagName(try RSTClockSelectionVirtualList.to_enum(.RCC_RADIOSTCLKSOURCE_LSE)) else @tagName(RSTClockSelectionVirtualList.RCC_RADIOSTCLKSOURCE_LSE),
                    }),
                };
            }
            // ======= NODE RSTOutput ======
            if (!check_MCU("STM32WBAx4") and !check_MCU("STM32WBAx5") and !check_MCU("STM32WBAx0")) {
                RSTOutput.nodetype = .output;
                RSTOutput.parents = &.{&RSTClkSource};
            }
            RSTOutput.nodetype = .output;
            RSTOutput.parents = &.{&RSTClkSource};

            // ======= NODE RSTRFOutput ======
            RSTRFOutput.nodetype = .output;
            RSTRFOutput.parents = &.{&HSEOSC};

            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceVirtualValue) {
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HseDiv},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLL1R},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI => &.{&HSIRC},
                .RCC_PLLSOURCE_HSE => &.{&HseDiv},
            };

            // ======= NODE PLLM ======
            PLLM.nodetype = .div;
            PLLM.value = @floatFromInt(PLLMValue);
            PLLM.parents = &.{&PLLSource};

            // ======= NODE HSERTCDevisor ======
            HSERTCDevisor.nodetype = .div;
            HSERTCDevisor.value = @floatFromInt(RCC_RTC_Clock_Source_FROM_HSEValue);
            HSERTCDevisor.parents = &.{&HSEOSC};

            // ======= NODE RTCClkSource ======
            if (!check_MCU("STM32WBAx4") and !check_MCU("STM32WBAx5")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RTCClockSelectionValue) {
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => &.{&HSERTCDevisor},
                    .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RTCCLKSOURCE_LSI => &.{&LSIOut},
                };
            } else if (check_MCU("STM32WBAx4") or check_MCU("STM32WBAx5")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RTCClockSelectionValue) {
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => &.{&HSERTCDevisor},
                    .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_RTCCLKSOURCE_LSI => &.{&LSIOut},
                };
            }
            // ======= NODE RTCOutput ======
            RTCOutput.nodetype = .output;
            RTCOutput.parents = &.{&RTCClkSource};

            // ======= NODE IWDGOutput ======
            IWDGOutput.nodetype = .output;
            IWDGOutput.parents = &.{&LSIOut};

            // ======= NODE USART2Mult ======
            if (check_MCU("USART2_Exist")) {
                USART2Mult.nodetype = .multi;
                USART2Mult.parents = switch (USART2CLockSelectionVirtualValue) {
                    .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART2output ======
            if (check_MCU("USART2_Exist")) {
                USART2output.nodetype = .output;
                USART2output.parents = &.{&USART2Mult};
            }
            // ======= NODE USART1Mult ======
            USART1Mult.nodetype = .multi;
            USART1Mult.parents = switch (USART1CLockSelectionVirtualValue) {
                .RCC_USART1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART1output ======
            USART1output.nodetype = .output;
            USART1output.parents = &.{&USART1Mult};

            // ======= NODE LPUART1Mult ======
            LPUART1Mult.nodetype = .multi;
            LPUART1Mult.parents = switch (LPUART1CLockSelectionVirtualValue) {
                .RCC_LPUART1CLKSOURCE_PCLK7 => &.{&APB7Output},
                .RCC_LPUART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_LPUART1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_LPUART1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LPUART1output ======
            LPUART1output.nodetype = .output;
            LPUART1output.parents = &.{&LPUART1Mult};

            // ======= NODE LPTIM1Mult ======
            LPTIM1Mult.nodetype = .multi;
            LPTIM1Mult.parents = switch (LPTIM1CLockSelectionVirtualValue) {
                .RCC_LPTIM1CLKSOURCE_PCLK7 => &.{&APB7Output},
                .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIOut},
                .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRC},
                .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LPTIM1output ======
            LPTIM1output.nodetype = .output;
            LPTIM1output.parents = &.{&LPTIM1Mult};

            // ======= NODE LPTIM2Mult ======
            if (check_MCU("LPTIM2_Exist")) {
                LPTIM2Mult.nodetype = .multi;
                LPTIM2Mult.parents = switch (LPTIM2CLockSelectionVirtualValue) {
                    .RCC_LPTIM2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_LPTIM2CLKSOURCE_LSI => &.{&LSIOut},
                    .RCC_LPTIM2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM2CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM2output ======
            if (check_MCU("LPTIM2_Exist")) {
                LPTIM2output.nodetype = .output;
                LPTIM2output.parents = &.{&LPTIM2Mult};
            }
            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&ADCMult};

            // ======= NODE ASMult ======
            ASMult.nodetype = .multi;
            ASMult.parents = switch (ASClockSelectionValue) {
                .RCC_ASCLKSOURCE_PLL1P => &.{&PLL1P},
                .RCC_ASCLKSOURCE_PLL1Q => &.{&PLL1Q},
            };

            // ======= NODE ASoutput ======
            ASoutput.nodetype = .output;
            ASoutput.parents = &.{&ASMult};

            // ======= NODE I2C1Mult ======
            if (check_MCU("I2C1_Exist")) {
                I2C1Mult.nodetype = .multi;
                I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                    .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE I2C1output ======
            if (check_MCU("I2C1_Exist")) {
                I2C1output.nodetype = .output;
                I2C1output.parents = &.{&I2C1Mult};
            }
            // ======= NODE I2C3Mult ======
            I2C3Mult.nodetype = .multi;
            I2C3Mult.parents = switch (I2C3CLockSelectionValue) {
                .RCC_I2C3CLKSOURCE_PCLK7 => &.{&APB7Output},
                .RCC_I2C3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2C3CLKSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE I2C3output ======
            I2C3output.nodetype = .output;
            I2C3output.parents = &.{&I2C3Mult};

            // ======= NODE SAI1output ======
            if (check_MCU("SAI1_Exist")) {
                SAI1output.nodetype = .output;
                SAI1output.parents = &.{&SAI1Mult};
            }
            // ======= NODE pllqDivToRNG ======
            pllqDivToRNG.nodetype = .div;
            pllqDivToRNG.value = @floatFromInt(pllqDivToRNGValue);
            pllqDivToRNG.parents = &.{&PLL1Q};

            // ======= NODE RNGoutput ======
            RNGoutput.nodetype = .output;
            RNGoutput.parents = &.{&RNGMult};

            // ======= NODE MCODiv ======
            MCODiv.nodetype = .div;
            MCODiv.value = try RCC_MCODivValue.get();
            MCODiv.parents = &.{&MCOMult};

            // ======= NODE MCOPin ======
            MCOPin.nodetype = .output;
            MCOPin.parents = &.{&MCODiv};

            // ======= NODE LSCOMult ======
            LSCOMult.nodetype = .multi;
            LSCOMult.parents = switch (LSCOSource1VirtualValue) {
                .RCC_LSCOSOURCE_LSI => &.{&LSIOut},
                .RCC_LSCOSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LSCOOutput ======
            LSCOOutput.nodetype = .output;
            LSCOOutput.parents = &.{&LSCOMult};

            // ======= NODE AHB5Prescaler ======
            AHB5Prescaler.nodetype = .div;
            AHB5Prescaler.value = try AHB5CLKDividerValue.get();
            AHB5Prescaler.parents = &.{&SysCLKOutput};

            // ======= NODE AHB5Output ======
            AHB5Output.nodetype = .output;
            AHB5Output.parents = &.{&AHB5Prescaler};

            // ======= NODE SAESOutput ======
            if (check_MCU("SAES_Exist")) {
                SAESOutput.nodetype = .output;
                SAESOutput.parents = &.{&AHBOutput};
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

            // ======= NODE HCLK4Output ======
            HCLK4Output.nodetype = .output;
            HCLK4Output.parents = &.{&AHBOutput};

            // ======= NODE CortexPrescaler ======
            CortexPrescaler.nodetype = .div;
            CortexPrescaler.value = @floatFromInt(Cortex_DivValue);
            CortexPrescaler.parents = &.{&AHBOutput};

            // ======= NODE CortexCLockSelection ======
            CortexCLockSelection.nodetype = .multi;
            CortexCLockSelection.parents = switch (CortexCLockSelectionVirtualValue) {
                .RCC_SYSTICKCLKSOURCE_HCLK_DIV8 => &.{&CortexPrescaler},
                .RCC_SYSTICKCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_SYSTICKCLKSOURCE_LSI => &.{&LSIOut},
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

            // ======= NODE APB7Prescaler ======
            APB7Prescaler.nodetype = .div;
            APB7Prescaler.value = try APB7CLKDividerValue.get();
            APB7Prescaler.parents = &.{&AHBOutput};

            // ======= NODE APB7Output ======
            APB7Output.nodetype = .output;
            APB7Output.parents = &.{&APB7Prescaler};

            // ======= NODE TimPrescalerAPB2 ======
            TimPrescalerAPB2.nodetype = .mul;
            TimPrescalerAPB2.value = @floatFromInt(APB2TimCLKDividerValue);
            TimPrescalerAPB2.parents = &.{&APB2Prescaler};

            // ======= NODE TimPrescOut2 ======
            TimPrescOut2.nodetype = .output;
            TimPrescOut2.parents = &.{&TimPrescalerAPB2};

            // ======= NODE SPI1Mult ======
            if (check_MCU("SPI1_Exist")) {
                SPI1Mult.nodetype = .multi;
                SPI1Mult.parents = switch (SPI1CLockSelectionValue) {
                    .RCC_SPI1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                    .RCC_SPI1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_SPI1CLKSOURCE_HSI => &.{&HSIRC},
                };
            }
            // ======= NODE SPI1output ======
            if (check_MCU("SPI1_Exist")) {
                SPI1output.nodetype = .output;
                SPI1output.parents = &.{&SPI1Mult};
            }
            // ======= NODE SPI3Mult ======
            SPI3Mult.nodetype = .multi;
            SPI3Mult.parents = switch (SPI3CLockSelectionValue) {
                .RCC_SPI3CLKSOURCE_PCLK7 => &.{&APB7Output},
                .RCC_SPI3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_SPI3CLKSOURCE_HSI => &.{&HSIRC},
            };

            // ======= NODE SPI3output ======
            SPI3output.nodetype = .output;
            SPI3output.parents = &.{&SPI3Mult};

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

            // ======= NODE PLLPoutput ======
            PLLPoutput.nodetype = .output;
            PLLPoutput.parents = &.{&PLL1P};

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

            // ======= NODE VCOInput ======
            VCOInput.nodetype = .output;
            VCOInput.parents = &.{&PLLM};

            // ======= NODE VCOOutput ======
            VCOOutput.nodetype = .output;
            VCOOutput.parents = &.{&PLLN};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLL1R};

            // ======= NODE LSI1 ======
            LSI1.nodetype = .output;
            LSI1.parents = &.{&LSIRC};

            // ======= NODE HSESYS ======
            HSESYS.nodetype = .output;
            HSESYS.parents = &.{&HseDiv};

            //======== POST REFS ========

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"="))) and config.flags.RF_Used and RST_HSE) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE1) {
                            const patch_str = if (patch_logs) "B_0x1" else "PWR_REGULATOR_VOLTAGE_SCALE1";
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
                                "((HCLKFreq_Value < 16000000) | (HCLKFreq_Value=16000000)) & RF_Used & RST_HSE",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"=")))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => scale2 = true,
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => scale1 = true,
                        }
                    }
                    break :blk user_val orelse {
                        scale2 = true;
                        break :blk .PWR_REGULATOR_VOLTAGE_SCALE2;
                    };
                } else if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@">"))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE1) {
                            const patch_str = if (patch_logs) "B_0x1" else "PWR_REGULATOR_VOLTAGE_SCALE1";
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
                                "(HCLKFreq_Value > 16000000)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    scale1 = true;
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                }
                if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                    if (val != .PWR_REGULATOR_VOLTAGE_SCALE1) {
                        const patch_str = if (patch_logs) "B_0x1" else "PWR_REGULATOR_VOLTAGE_SCALE1";
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
                            "((HCLKFreq_Value < 16000000) | (HCLKFreq_Value=16000000)) & RF_Used & RST_HSE",
                            "",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                scale1 = true;
                break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
            };

            //======= RSTFreq_Value ========
            const RSTFreq_ValueValue = RSTOutput.get_as_ref();
            ignore_value(RSTFreq_ValueValue);
            if (scale1) {
                RSTOutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                RSTOutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= RSTRFFreq_Value ========
            const RSTRFFreq_ValueValue = RSTRFOutput.get_as_ref();
            ignore_value(RSTRFFreq_ValueValue);
            if (scale1) {
                RSTRFOutput.limit = .{
                    .min = null,
                    .max = 3.2e7,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                RSTRFOutput.limit = .{
                    .min = null,
                    .max = 3.2e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);

            RTCOutput.limit = .{
                .min = null,
                .max = 1.5625e6,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);
            if (scale1) {
                USART2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                USART2output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);
            if (scale1) {
                USART1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                USART1output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= LPUART1Freq_Value ========
            const LPUART1Freq_ValueValue = LPUART1output.get_as_ref();
            ignore_value(LPUART1Freq_ValueValue);
            if (scale1) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPUART1output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);
            if (scale1) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPTIM1output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= LPTIM2Freq_Value ========
            const LPTIM2Freq_ValueValue = LPTIM2output.get_as_ref();
            ignore_value(LPTIM2Freq_ValueValue);
            if (scale1) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                LPTIM2output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            const ADCCLockSelectionVirtualValue: ADCCLockSelectionVirtualList = blk: {
                if (scale2) {
                    const user_val = config.ADCCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_ADCCLKSOURCE_HCLK => {},
                            .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                            .RCC_ADCCLKSOURCE_HSE => ADCSourceHSE = true,
                            .RCC_ADCCLKSOURCE_HSI => ADCSourceHSI = true,
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
                                    "ADCCLockSelectionVirtual",
                                    "scale2",
                                    "PLL is not allowed in range 2",
                                    @tagName(val),
                                    "RCC_ADCCLKSOURCE_HCLK",
                                    "RCC_ADCCLKSOURCE_SYSCLK",
                                    "RCC_ADCCLKSOURCE_HSE",
                                    "RCC_ADCCLKSOURCE_HSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_ADCCLKSOURCE_HCLK;
                }
                const user_val = config.ADCCLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_HCLK => {},
                        .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                        .RCC_ADCCLKSOURCE_HSE => ADCSourceHSE = true,
                        .RCC_ADCCLKSOURCE_HSI => ADCSourceHSI = true,
                        .RCC_ADCCLKSOURCE_PLL1P => adc_pll1p = true,
                    }
                }
                break :blk user_val orelse .RCC_ADCCLKSOURCE_HCLK;
            };

            // ======= NODE ADCMult ======
            ADCMult.nodetype = .multi;
            ADCMult.parents = switch (ADCCLockSelectionVirtualValue) {
                .RCC_ADCCLKSOURCE_HCLK => &.{&AHBOutput},
                .RCC_ADCCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_ADCCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_ADCCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_ADCCLKSOURCE_PLL1P => &.{&PLL1P},
            };

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);
            if (scale1) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= ASFreq_Value ========
            const ASFreq_ValueValue = ASoutput.get_as_ref();
            ignore_value(ASFreq_ValueValue);
            if (scale1) {
                ASoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                ASoutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);
            if (scale1) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I2C1output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= I2C3Freq_Value ========
            const I2C3Freq_ValueValue = I2C3output.get_as_ref();
            ignore_value(I2C3Freq_ValueValue);
            if (scale1) {
                I2C3output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                I2C3output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            const SAI1CLockSelectionVirtualValue: SAI1CLockSelectionVirtualList = blk: {
                if (scale2) {
                    const user_val = config.SAI1CLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_SAI1CLKSOURCE_PIN => SAI1SourceEXT = true,
                            .RCC_SAI1CLKSOURCE_HSI => SAI1SourceHSI = true,
                            .RCC_SAI1CLKSOURCE_SYSCLK => {},
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
                                    "SAI1CLockSelectionVirtual",
                                    "scale2",
                                    "PLL is not allowed in range 2",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "Div4" else "RCC_SAI1CLKSOURCE_PIN",
                                    if (patch_logs) "Div8" else "RCC_SAI1CLKSOURCE_HSI",
                                    if (patch_logs) "Div16" else "RCC_SAI1CLKSOURCE_SYSCLK",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        SAI1SourceHSI = true;
                        break :blk .RCC_SAI1CLKSOURCE_HSI;
                    };
                }
                const user_val = config.SAI1CLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_PLL1P => SAI1SourcePLL1P = true,
                        .RCC_SAI1CLKSOURCE_PIN => SAI1SourceEXT = true,
                        .RCC_SAI1CLKSOURCE_HSI => SAI1SourceHSI = true,
                        .RCC_SAI1CLKSOURCE_PLL1Q => sai1_pll1q = true,
                        .RCC_SAI1CLKSOURCE_SYSCLK => {},
                    }
                }
                break :blk user_val orelse {
                    SAI1SourceHSI = true;
                    break :blk .RCC_SAI1CLKSOURCE_HSI;
                };
            };

            // ======= NODE SAI1Mult ======
            if (check_MCU("SAI1_Exist")) {
                SAI1Mult.nodetype = .multi;
                SAI1Mult.parents = switch (SAI1CLockSelectionVirtualValue) {
                    .RCC_SAI1CLKSOURCE_PLL1P => &.{&PLL1P},
                    .RCC_SAI1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_SAI1CLKSOURCE_PLL1Q => &.{&PLL1Q},
                    .RCC_SAI1CLKSOURCE_PIN => &.{&SAI1_EXT},
                    .RCC_SAI1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);
            if (scale1) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                SAI1output.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            const RNGCLockSelectionVirtualValue: RNGCLockSelectionVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC) and !scale2) {
                    const user_val = config.RNGCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_RNGCLKSOURCE_PLL1Q => rng_pll1q = true,
                            .RCC_RNGCLKSOURCE_HSI => RNGCLKSOURCE_HSI = true,
                            .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
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
                                    "RNGCLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC) & !scale2",
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "PLL1_P_DIV_2" else "RCC_RNGCLKSOURCE_PLL1Q",
                                    if (patch_logs) "HSE" else "RCC_RNGCLKSOURCE_HSI",
                                    if (patch_logs) "PLL1_P" else "RCC_RNGCLKSOURCE_LSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        RNGCLKSOURCE_HSI = true;
                        break :blk .RCC_RNGCLKSOURCE_HSI;
                    };
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC) and scale2) {
                    const user_val = config.RNGCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_RNGCLKSOURCE_HSI => RNGCLKSOURCE_HSI = true,
                            .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                    \\ - {s}
                                , .{
                                    "RNGCLockSelectionVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC) & scale2",
                                    "LSE only for RTC or PLL in range 2",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSE" else "RCC_RNGCLKSOURCE_HSI",
                                    if (patch_logs) "PLL1_P" else "RCC_RNGCLKSOURCE_LSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        RNGCLKSOURCE_HSI = true;
                        break :blk .RCC_RNGCLKSOURCE_HSI;
                    };
                } else if (!(config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC) and scale2) {
                    const user_val = config.RNGCLockSelectionVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_RNGCLKSOURCE_LSE => RNGCLKSOURCE_LSE = true,
                            .RCC_RNGCLKSOURCE_HSI => RNGCLKSOURCE_HSI = true,
                            .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
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
                                    "RNGCLockSelectionVirtual",
                                    "!(LSEOscillatorRTC|LSEByPassRTC) & scale2",
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSE_DIV_2" else "RCC_RNGCLKSOURCE_LSE",
                                    if (patch_logs) "HSE" else "RCC_RNGCLKSOURCE_HSI",
                                    if (patch_logs) "PLL1_P" else "RCC_RNGCLKSOURCE_LSI",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse {
                        RNGCLKSOURCE_HSI = true;
                        break :blk .RCC_RNGCLKSOURCE_HSI;
                    };
                }
                const user_val = config.RNGCLockSelectionVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RNGCLKSOURCE_LSE => RNGCLKSOURCE_LSE = true,
                        .RCC_RNGCLKSOURCE_PLL1Q => rng_pll1q = true,
                        .RCC_RNGCLKSOURCE_HSI => RNGCLKSOURCE_HSI = true,
                        .RCC_RNGCLKSOURCE_LSI => RNGCLKSOURCE_LSI = true,
                    }
                }
                break :blk user_val orelse {
                    RNGCLKSOURCE_HSI = true;
                    break :blk .RCC_RNGCLKSOURCE_HSI;
                };
            };

            // ======= NODE RNGMult ======
            RNGMult.nodetype = .multi;
            RNGMult.parents = switch (RNGCLockSelectionVirtualValue) {
                .RCC_RNGCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_RNGCLKSOURCE_PLL1Q => &.{&pllqDivToRNG},
                .RCC_RNGCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_RNGCLKSOURCE_LSI => &.{&LSIOut},
            };

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);
            if (scale1) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 4.8e7,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                RNGoutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            const RCC_MCO1SourceVirtualValue: RCC_MCO1SourceVirtualList = blk: {
                if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC) and scale2) {
                    const user_val = config.RCC_MCO1SourceVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MCO1SOURCE_SYSCLK => {},
                            .RCC_MCO1SOURCE_HSI => {},
                            .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                            .RCC_MCO1SOURCE_LSI => {},
                            .RCC_MCO1SOURCE_HCLK5 => {},
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
                                    "RCC_MCO1SourceVirtual",
                                    "(LSEOscillatorRTC|LSEByPassRTC) & scale2",
                                    "LSE only for RTC or PLL in range 2",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "SYSCLKPRE" else "RCC_MCO1SOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_MCO1SOURCE_HSI",
                                    if (patch_logs) "HSE" else "RCC_MCO1SOURCE_HSE",
                                    if (patch_logs) "LSI" else "RCC_MCO1SOURCE_LSI",
                                    if (patch_logs) "HCLK5" else "RCC_MCO1SOURCE_HCLK5",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
                } else if ((config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC) and !scale2) {
                    const user_val = config.RCC_MCO1SourceVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MCO1SOURCE_SYSCLK => {},
                            .RCC_MCO1SOURCE_HSI => {},
                            .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                            .RCC_MCO1SOURCE_PLL1RCLK => mco1_pll1r = true,
                            .RCC_MCO1SOURCE_LSI => {},
                            .RCC_MCO1SOURCE_PLL1PCLK => mco1_pll1p = true,
                            .RCC_MCO1SOURCE_PLL1QCLK => mco1_pll1q = true,
                            .RCC_MCO1SOURCE_HCLK5 => {},
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
                                    "(LSEOscillatorRTC|LSEByPassRTC) & !scale2",
                                    "LSE is only for RTC",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "SYSCLKPRE" else "RCC_MCO1SOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_MCO1SOURCE_HSI",
                                    if (patch_logs) "HSE" else "RCC_MCO1SOURCE_HSE",
                                    if (patch_logs) "PLL1_R" else "RCC_MCO1SOURCE_PLL1RCLK",
                                    if (patch_logs) "LSI" else "RCC_MCO1SOURCE_LSI",
                                    if (patch_logs) "PLL1_P" else "RCC_MCO1SOURCE_PLL1PCLK",
                                    if (patch_logs) "PLL1_Q" else "RCC_MCO1SOURCE_PLL1QCLK",
                                    if (patch_logs) "HCLK5" else "RCC_MCO1SOURCE_HCLK5",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
                } else if (!(config.flags.LSEOscillatorRTC or config.flags.LSEByPassRTC) and scale2) {
                    const user_val = config.RCC_MCO1SourceVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_MCO1SOURCE_SYSCLK => {},
                            .RCC_MCO1SOURCE_HSI => {},
                            .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                            .RCC_MCO1SOURCE_LSE => {},
                            .RCC_MCO1SOURCE_LSI => {},
                            .RCC_MCO1SOURCE_HCLK5 => {},
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
                                    "RCC_MCO1SourceVirtual",
                                    "!(LSEOscillatorRTC|LSEByPassRTC) & scale2",
                                    "PLL not allowed in range 2",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "SYSCLKPRE" else "RCC_MCO1SOURCE_SYSCLK",
                                    if (patch_logs) "HSI" else "RCC_MCO1SOURCE_HSI",
                                    if (patch_logs) "HSE" else "RCC_MCO1SOURCE_HSE",
                                    if (patch_logs) "LSE" else "RCC_MCO1SOURCE_LSE",
                                    if (patch_logs) "LSI" else "RCC_MCO1SOURCE_LSI",
                                    if (patch_logs) "HCLK5" else "RCC_MCO1SOURCE_HCLK5",
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
                        .RCC_MCO1SOURCE_HSE => MCO1SOURCE_HSE = true,
                        .RCC_MCO1SOURCE_PLL1RCLK => mco1_pll1r = true,
                        .RCC_MCO1SOURCE_LSE => {},
                        .RCC_MCO1SOURCE_LSI => {},
                        .RCC_MCO1SOURCE_PLL1PCLK => mco1_pll1p = true,
                        .RCC_MCO1SOURCE_PLL1QCLK => mco1_pll1q = true,
                        .RCC_MCO1SOURCE_HCLK5 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
            };

            // ======= NODE MCOMult ======
            MCOMult.nodetype = .multi;
            MCOMult.parents = switch (RCC_MCO1SourceVirtualValue) {
                .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO1SOURCE_LSI => &.{&LSIOut},
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                .RCC_MCO1SOURCE_PLL1RCLK => &.{&PLL1R},
                .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_MCO1SOURCE_PLL1PCLK => &.{&PLL1P},
                .RCC_MCO1SOURCE_PLL1QCLK => &.{&PLL1Q},
                .RCC_MCO1SOURCE_HCLK5 => &.{&AHB5Output},
            };

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);
            if (scale1) {
                MCOPin.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                MCOPin.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= LSCOPinFreq_Value ========
            const LSCOPinFreq_ValueValue = LSCOOutput.get_as_ref();
            ignore_value(LSCOPinFreq_ValueValue);

            //======= AHB5Freq_Value ========
            const AHB5Freq_ValueValue = AHB5Output.get_as_ref();
            ignore_value(AHB5Freq_ValueValue);

            AHB5Output.limit = .{
                .min = null,
                .max = 3.2e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= SAESFreq_Value ========
            const SAESFreq_ValueValue = SAESOutput.get_as_ref();
            ignore_value(SAESFreq_ValueValue);

            SAESOutput.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            HCLKOutput.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AHB4Freq_Value ========
            const AHB4Freq_ValueValue = HCLK4Output.get_as_ref();
            ignore_value(AHB4Freq_ValueValue);

            HCLK4Output.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);
            if (scale1) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "scale1",
                    .main_dialog = "",
                };
            } else if (scale2) {
                CortexSysOutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            FCLKCortexOutput.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);

            APB1Output.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            TimPrescOut1.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB7Freq_Value ========
            const APB7Freq_ValueValue = APB7Output.get_as_ref();
            ignore_value(APB7Freq_ValueValue);

            APB7Output.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            TimPrescOut2.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

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
                    .max = 1.6e7,
                    .main_expr = "scale2",
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
                    .max = 1.6e7,
                    .main_expr = "scale2",
                    .main_dialog = "",
                };
            }

            const PLL1PUsedValue: u1 = blk: {
                if (SAI1SourcePLL1P and config.flags.SAI1_Used or config.flags.MCOConfig and mco1_pll1p or config.flags.ADC4_Used and adc_pll1p) {
                    break :blk 1;
                }
                break :blk 0;
            };

            //======= PLLPoutputFreq_Value ========
            const PLLPoutputFreq_ValueValue = PLLPoutput.get_as_ref();
            ignore_value(PLLPoutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=") and scale1) {
                PLLPoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "PLL1PUsed=1 & scale1",
                    .main_dialog = " ",
                };
            } else if (check_ref(@TypeOf(PLL1PUsedValue), PLL1PUsedValue, 1, .@"=") and scale2) {
                PLLPoutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "PLL1PUsed=1 & scale2",
                    .main_dialog = "",
                };
            }

            const PLL1QUsedValue: u1 = blk: {
                if (config.flags.MCOConfig and mco1_pll1q or sai1_pll1q and config.flags.SAI1_Used or rng_pll1q and config.flags.RNG_Used) {
                    break :blk 1;
                }
                break :blk 0;
            };

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=") and scale1) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "PLL1QUsed=1 & scale1",
                    .main_dialog = " ",
                };
            } else if (check_ref(@TypeOf(PLL1QUsedValue), PLL1QUsedValue, 1, .@"=") and scale2) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "PLL1QUsed=1 & scale2",
                    .main_dialog = "",
                };
            }

            const PLL1RUsedValue: u1 = blk: {
                if (((SysSourcePLL) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_PLL1RCLK, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig)))) {
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

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if ((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) {
                VCOInput.limit = .{
                    .min = 4e6,
                    .max = 1.6e7,
                    .main_expr = "(PLLUsed=1) ",
                    .main_dialog = " PLLUsed=1",
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOOutput.limit = .{
                    .min = 1.28e8,
                    .max = 5.44e8,
                    .main_expr = "PLLUsed=1",
                    .main_dialog = "",
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if (config.flags.PLLRUsed and scale1) {
                PLLCLK.limit = .{
                    .min = null,
                    .max = 1e8,
                    .main_expr = "PLLRUsed=1 & scale1",
                    .main_dialog = " ",
                };
            } else if (config.flags.PLLRUsed and scale2) {
                PLLCLK.limit = .{
                    .min = null,
                    .max = 1.6e7,
                    .main_expr = "PLLRUsed=1 & scale2",
                    .main_dialog = "",
                };
            }

            //======= HSESYSFreq_VALUE ========
            const HSESYSFreq_VALUEValue = HSESYS.get_as_ref();
            ignore_value(HSESYSFreq_VALUEValue);

            HSESYS.limit = .{
                .min = null,
                .max = 1e8,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            const FLatencyValue: FLatencyList = blk: {
                if ((scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 8000000, .@"="))))) {
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
                                    "(scale2 & ((HCLKFreq_Value < 8000000)|(HCLKFreq_Value=8000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_1",
                                    "FLASH_LATENCY_0",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_0;
                } else if ((scale2 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 16000000, .@"="))))) {
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
                                "(scale2 & ((HCLKFreq_Value < 16000000)|(HCLKFreq_Value=16000000 )))",
                                "",
                                "FLASH_LATENCY_1",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 32000000, .@"="))))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
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
                                    "(scale1 & ((HCLKFreq_Value < 64000000) |(HCLKFreq_Value=64000000)))",
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
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 96000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 96000000, .@"="))))) {
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
                                    "(scale1 & ((HCLKFreq_Value < 96000000) |(HCLKFreq_Value=96000000)))",
                                    "",
                                    @tagName(val),
                                    "FLASH_LATENCY_3",
                                    "FLASH_LATENCY_2",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_2;
                } else if ((scale1 and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 100000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 100000000, .@"="))))) {
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
                                "(scale1 & ((HCLKFreq_Value < 100000000) |(HCLKFreq_Value=100000000)))",
                                "",
                                "FLASH_LATENCY_3",
                                val,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
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

            const LSEUsedValue: u1 = blk: {
                if (RNGCLKSOURCE_LSE and config.flags.RNG_Used or RST_LSE and config.flags.RF_Used or CLKSOURCE_LSE or (LSCOSSourceLSE and config.flags.LSCOConfig) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16_Used and config.flags.SEM2RCC_LSE_REQUIRED1_TIM16) or (config.flags.SEM2RCC_LSE_REQUIRED_TIM2 and config.flags.Semaphore_TIM2_L4_ETR_REMAPTIM2 and config.flags.TIM2) or (config.flags.Semaphore_input_Channel1_directTIM15 and config.flags.TIM15 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM15) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (USART2SourceLSE and config.flags.USART2Used_ForRCC) or (LPUART1SourceLSE and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCELSE and config.flags.LPTIM2_UsedUsed_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig)) or (RTCSourceLSE and config.flags.RTCUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSE_Drive_CapabilityValue: ?LSE_Drive_CapabilityList = blk: {
                if ((config.flags.LSEOscillator or config.flags.LSEOscillatorRTC) and (check_ref(@TypeOf(LSEUsedValue), LSEUsedValue, 1, .@"="))) {
                    const user_val = config.extra_config.LSE_Drive_Capability;

                    if (user_val) |val| {
                        switch (val) {
                            .RCC_LSEDRIVE_MEDIUMLOW => {},
                            .RCC_LSEDRIVE_MEDIUMHIGH => {},
                            .RCC_LSEDRIVE_HIGH => {},
                        }
                    }
                    break :blk user_val orelse .RCC_LSEDRIVE_MEDIUMLOW;
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

            const PLL1_VCI_RangeValue: PLL1_VCI_RangeList = blk: {
                if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 4000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 4000000, .@"="))) and (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"<"))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE0;
                } else if (((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@">") or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 8000000, .@"="))) and ((check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 16000000, .@"<")) or (check_ref(@TypeOf(VCOInputFreq_ValueValue), VCOInputFreq_ValueValue, 16000000, .@"=")))) and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                    break :blk .RCC_PLL_VCOINPUT_RANGE1;
                }
                break :blk .RCC_PLL_VCOINPUT_RANGE1;
            };

            const HSIUsedValue: u1 = blk: {
                if (config.flags.SEM2RCC_HSI_REQUIRED_TIM16 and config.flags.TIM16_Used or config.flags.SEM2RCC_HSI_REQUIRED_TIM17 and config.flags.TIM17_Used or config.flags.SEM2RCC_HSI_REQUIRED_LPTIM2 and config.flags.LPTIM2_Used or SPI1CLKSOURCE_HSI and config.flags.SPI1Used_ForRCCC or SPI3CLKSOURCE_HSI and config.flags.SPI3Used_ForRCC or ADCSourceHSI and config.flags.ADC4_Used or (RNGCLKSOURCE_HSI and config.flags.RNGUsed_ForRCC) or (SAI1SourceHSI and (config.flags.SAI1_SAIBUsed_ForRCC or config.flags.SAI1_SAIAUsed_ForRCC)) or (USART1SourceHSI and config.flags.USART1Used_ForRCC) or (USART2SourceHSI and config.flags.USART2Used_ForRCC) or (LPUART1SourceHSI and config.flags.LPUARTUsed_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIM1Used_ForRCC) or (LPTIM2SOURCEHSI and config.flags.LPTIM2_UsedUsed_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C3SourceHSI and config.flags.I2C3Used_ForRCC) or (PLLSourceHSI and check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) or (check_ref(@TypeOf(SYSCLKSourceVirtualValue), SYSCLKSourceVirtualValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceVirtualValue), RCC_MCO1SourceVirtualValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16_Used and config.flags.SEM2RCC_MCO_REQUIRED_TIM16) or config.flags.MCOConfig))))) {
                    break :blk 1;
                }
                break :blk 0;
            };
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                HseDiv.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"="))) {
                LSIRC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"="))) {
                LSI2RC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableExtClockForSAI1Value), EnableExtClockForSAI1Value, .true, .@"="))) {
                SAI1_EXT.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSERFDevisorValue), EnableHSERFDevisorValue, .true, .@"="))) {
                HSERSTDevisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RFEnableValue), RFEnableValue, .true, .@"="))) {
                RSTClkSource.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RFEnableValue), RFEnableValue, .true, .@"="))) {
                RSTOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RFEnableValue), RFEnableValue, .true, .@"="))) {
                RSTRFOutput.nodetype = .off;
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
            if (!(check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"="))) {
                USART2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"="))) {
                USART2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1output.nodetype = .off;
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
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ASEnableValue), ASEnableValue, .true, .@"="))) {
                ASMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ASEnableValue), ASEnableValue, .true, .@"="))) {
                ASoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"="))) {
                I2C3Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C3EnableValue), I2C3EnableValue, .true, .@"="))) {
                I2C3output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"="))) {
                SAI1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"="))) {
                pllqDivToRNG.nodetype = .off;
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
            if (!(check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"="))) {
                LSCOMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(LSCOEnableValue), LSCOEnableValue, .true, .@"="))) {
                LSCOOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SAESEnableValue), SAESEnableValue, .true, .@"="))) {
                SAESOutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SystickEnableValue), SystickEnableValue, .true, .@"="))) {
                CortexCLockSelection.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(SystickEnableValue), SystickEnableValue, .true, .@"="))) {
                CortexSysOutput.nodetype = .off;
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
            if (!(check_ref(@TypeOf(ASEnableValue), ASEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                PLL1P.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ASEnableValue), ASEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                PLLPoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ASEnableValue), ASEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                PLL1Q.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ASEnableValue), ASEnableValue, .true, .@"=") or check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=") or check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                PLLQoutput.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.HseDiv = try HseDiv.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSIOut = try LSIOut.get_output();
            out.LSI2RC = try LSI2RC.get_output();
            out.LSIDIV = try LSIDIV.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.SAI1_EXT = try SAI1_EXT.get_output();
            out.HSERSTDevisor = try HSERSTDevisor.get_output();
            out.RSTClkSource = try RSTClkSource.get_output();
            out.RSTOutput = try RSTOutput.get_output();
            out.RSTRFOutput = try RSTRFOutput.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.PLLM = try PLLM.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2output = try USART2output.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.LPUART1Mult = try LPUART1Mult.get_output();
            out.LPUART1output = try LPUART1output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1output = try LPTIM1output.get_output();
            out.LPTIM2Mult = try LPTIM2Mult.get_output();
            out.LPTIM2output = try LPTIM2output.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.ASMult = try ASMult.get_output();
            out.ASoutput = try ASoutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3output = try I2C3output.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.SAI1output = try SAI1output.get_output();
            out.pllqDivToRNG = try pllqDivToRNG.get_output();
            out.RNGMult = try RNGMult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
            out.AHB5Prescaler = try AHB5Prescaler.get_output();
            out.AHB5Output = try AHB5Output.get_output();
            out.SAESOutput = try SAESOutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.HCLK4Output = try HCLK4Output.get_output();
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
            out.APB7Prescaler = try APB7Prescaler.get_output();
            out.APB7Output = try APB7Output.get_output();
            out.TimPrescalerAPB2 = try TimPrescalerAPB2.get_output();
            out.TimPrescOut2 = try TimPrescOut2.get_output();
            out.SPI1Mult = try SPI1Mult.get_output();
            out.SPI1output = try SPI1output.get_output();
            out.SPI3Mult = try SPI3Mult.get_output();
            out.SPI3output = try SPI3output.get_output();
            out.PLLN = try PLLN.get_output();
            out.PLLFRACN = try PLLFRACN.get_output();
            out.PLL1P = try PLL1P.get_output();
            out.PLLPoutput = try PLLPoutput.get_output();
            out.PLL1Q = try PLL1Q.get_output();
            out.PLLQoutput = try PLLQoutput.get_output();
            out.PLL1R = try PLL1R.get_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.LSI1 = try LSI1.get_extra_output();
            out.HSESYS = try HSESYS.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ref_out.HseDiv = HseDivValue;
            ignore_value(LSI_VALUEValue);
            ref_out.LSIDIV = LSIDIVValue;
            ignore_value(LSI2_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ignore_value(EXTERNALSAI1_CLOCK_VALUEValue);
            ref_out.RCC_RST_Clock_Source_FROM_HSE = RCC_RST_Clock_Source_FROM_HSEValue;
            ref_out.RSTClockSelectionVirtual = RSTClockSelectionVirtualValue;
            ignore_value(RSTFreq_ValueValue);
            ignore_value(RSTRFFreq_ValueValue);
            ref_out.SYSCLKSourceVirtual = SYSCLKSourceVirtualValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLLM = PLLMValue;
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.USART2CLockSelectionVirtual = USART2CLockSelectionVirtualValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.USART1CLockSelectionVirtual = USART1CLockSelectionVirtualValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.LPUART1CLockSelectionVirtual = LPUART1CLockSelectionVirtualValue;
            ignore_value(LPUART1Freq_ValueValue);
            ref_out.LPTIM1CLockSelectionVirtual = LPTIM1CLockSelectionVirtualValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.LPTIM2CLockSelectionVirtual = LPTIM2CLockSelectionVirtualValue;
            ignore_value(LPTIM2Freq_ValueValue);
            ref_out.ADCCLockSelectionVirtual = ADCCLockSelectionVirtualValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.ASClockSelection = ASClockSelectionValue;
            ignore_value(ASFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C3CLockSelection = I2C3CLockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ref_out.SAI1CLockSelectionVirtual = SAI1CLockSelectionVirtualValue;
            ignore_value(SAI1Freq_ValueValue);
            ref_out.pllqDivToRNG = pllqDivToRNGValue;
            ref_out.RNGCLockSelectionVirtual = RNGCLockSelectionVirtualValue;
            ignore_value(RNGFreq_ValueValue);
            ref_out.RCC_MCO1SourceVirtual = RCC_MCO1SourceVirtualValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.LSCOSource1Virtual = LSCOSource1VirtualValue;
            ignore_value(LSCOPinFreq_ValueValue);
            ref_out.AHB5CLKDivider = AHB5CLKDividerValue;
            ignore_value(AHB5Freq_ValueValue);
            ignore_value(SAESFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ignore_value(AHB4Freq_ValueValue);
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
            ref_out.APB7CLKDivider = APB7CLKDividerValue;
            ignore_value(APB7Freq_ValueValue);
            ref_out.APB2TimCLKDivider = APB2TimCLKDividerValue;
            ignore_value(APB2TimFreq_ValueValue);
            ref_out.SPI1CLockSelection = SPI1CLockSelectionValue;
            ignore_value(SPI1Freq_ValueValue);
            ref_out.SPI3CLockSelection = SPI3CLockSelectionValue;
            ignore_value(SPI3Freq_ValueValue);
            ref_out.PLLN = PLLNValue;
            ignore_value(PLLFRACNValue);
            ref_out.PLL1P = PLL1PValue;
            ignore_value(PLLPoutputFreq_ValueValue);
            ref_out.PLL1Q = PLL1QValue;
            ignore_value(PLLQoutputFreq_ValueValue);
            ref_out.PLL1R = PLL1RValue;
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLRCLKFreq_ValueValue);
            ignore_value(LSI1_VALUEValue);
            ignore_value(HSESYSFreq_VALUEValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.HSE_Trimming = HSE_TrimmingValue;
            ref_out.LSE_Trimming = LSE_TrimmingValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.PLL1_VCI_Range = PLL1_VCI_RangeValue;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.EnableExtClockForSAI1 = EnableExtClockForSAI1Value == .true;
            ref_out.flags.EnableHSERFDevisor = EnableHSERFDevisorValue == .true;
            ref_out.flags.RFEnable = RFEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.LPUART1Enable = LPUART1EnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.LPTIM2Enable = LPTIM2EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.ASEnable = ASEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.SAESEnable = SAESEnableValue == .true;
            ref_out.flags.SystickEnable = SystickEnableValue == .true;
            ref_out.flags.SPI1Enable = SPI1EnableValue == .true;
            ref_out.flags.SPI3Enable = SPI3EnableValue == .true;
            ref_out.flags.PLL1PUsed = PLL1PUsedValue != 0;
            ref_out.flags.PLL1QUsed = PLL1QUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.EnbaleCSS = EnbaleCSSValue == .true;
            ref_out.flags.PLL1RUsed = PLL1RUsedValue != 0;

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
