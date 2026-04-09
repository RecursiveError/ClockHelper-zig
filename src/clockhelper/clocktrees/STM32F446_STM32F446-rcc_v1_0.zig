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
        pub const RCC_PLLSRC = enum(u1) {
            HSI = 0,
            HSE = 1,
        };
        pub const RCC_SW = enum(u2) {
            HSI = 0,
            HSE = 1,
            PLL1_P = 2,
        };
        pub const RCC_SPDIFRXSEL = enum(u1) {
            PLL1_R = 0,
            PLLI2S1_P = 1,
        };
        pub const RCC_MCO1SEL = enum(u2) {
            HSI = 0,
            LSE = 1,
            HSE = 2,
            PLL = 3,
        };
        pub const RCC_PLLSAIDIVQ = enum(u5) {
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
        };
        pub const RCC_MCOPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div3 = 5,
            Div4 = 6,
            Div5 = 7,
        };
        pub const RCC_FMPI2CSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
        };
        pub const RCC_I2S1SRC = enum(u2) {
            PLLI2SR = 0,
            I2S_CKIN = 1,
            PLLR = 2,
            HSI_HSE = 3,
        };
        pub const RCC_TIMPRE = enum(u1) {
            Mul2 = 0,
            Mul4 = 1,
        };
        pub const RCC_MCO2SEL = enum(u2) {
            SYS = 0,
            PLLI2S = 1,
            HSE = 2,
            PLL = 3,
        };
        pub const RCC_CLK48SEL = enum(u1) {
            PLL1_Q = 0,
            PLLSAI1_Q = 1,
        };
        pub const RCC_SAI2SRC = enum(u2) {
            PLLSAI = 0,
            PLLI2S = 1,
            PLLR = 2,
            HSI_HSE = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_SDIOSEL = enum(u1) {
            CLK48 = 0,
            SYS = 1,
        };
        pub const RCC_CECSEL = enum(u1) {
            LSE = 0,
            HSI_DIV_488 = 1,
        };
        pub const RCC_PLLI2SDIVQ = enum(u5) {
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
        };
        pub const PWR_VOS = enum(u2) {
            SCALE3 = 1,
            SCALE2 = 2,
            SCALE1 = 3,
        };
        pub const RCC_PLLP = enum(u2) {
            Div2 = 0,
            Div4 = 1,
            Div6 = 2,
            Div8 = 3,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const FLASH_LATENCY = enum(u4) {
            WS0 = 0,
            WS1 = 1,
            WS2 = 2,
            WS3 = 3,
            WS4 = 4,
            WS5 = 5,
            WS6 = 6,
            WS7 = 7,
            WS8 = 8,
            WS9 = 9,
            WS10 = 10,
            WS11 = 11,
            WS12 = 12,
            WS13 = 13,
            WS14 = 14,
            WS15 = 15,
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,
            RCC_SYSCLKSOURCE_PLLRCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLRCLK => .PLL1_P,
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s}List - {s} cannot be mapped to {s}",
                        .{ "SYSCLKSource", @tagName(self), "RCC_SW" },
                    ),
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .PLL1_P => .RCC_SYSCLKSOURCE_PLLRCLK,
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_HSI,

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
                };
            }
        };

        pub const RCC_RTC_Clock_SourceVirtualList = enum {
            HSERTCDevisor,
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,

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

        pub const CECClockSelectionList = enum {
            RCC_CECCLKSOURCE_HSI,
            RCC_CECCLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_CECSEL {
                return switch (self) {
                    .RCC_CECCLKSOURCE_LSE => .LSE,
                    .RCC_CECCLKSOURCE_HSI => .HSI_DIV_488,
                };
            }
            pub fn from_enum(item: RCC_CECSEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_CECCLKSOURCE_LSE,
                    .HSI_DIV_488 => .RCC_CECCLKSOURCE_HSI,
                };
            }
        };

        pub const FMPI2C1SelectionList = enum {
            RCC_FMPI2C1CLKSOURCE_SYSCLK,
            RCC_FMPI2C1CLKSOURCE_HSI,
            RCC_FMPI2C1CLKSOURCE_APB,

            pub fn to_enum(self: @This()) anyerror!RCC_FMPI2CSEL {
                return switch (self) {
                    .RCC_FMPI2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_FMPI2C1CLKSOURCE_APB => .PCLK1,
                    .RCC_FMPI2C1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_FMPI2CSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_FMPI2C1CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_FMPI2C1CLKSOURCE_APB,
                    .HSI => .RCC_FMPI2C1CLKSOURCE_HSI,
                };
            }
        };

        pub const USBCLockSelectionList = enum {
            RCC_CLK48CLKSOURCE_PLLSAIP,
            RCC_CLK48CLKSOURCE_PLLQ,

            pub fn to_enum(self: @This()) anyerror!RCC_CLK48SEL {
                return switch (self) {
                    .RCC_CLK48CLKSOURCE_PLLSAIP => .PLLSAI1_Q,
                    .RCC_CLK48CLKSOURCE_PLLQ => .PLL1_Q,
                };
            }
            pub fn from_enum(item: RCC_CLK48SEL) anyerror!@This() {
                return switch (item) {
                    .PLLSAI1_Q => .RCC_CLK48CLKSOURCE_PLLSAIP,
                    .PLL1_Q => .RCC_CLK48CLKSOURCE_PLLQ,
                };
            }
        };

        pub const SPDIFCLockSelectionList = enum {
            RCC_SPDIFRXCLKSOURCE_PLLR,
            RCC_SPDIFRXCLKSOURCE_PLLI2SP,

            pub fn to_enum(self: @This()) anyerror!RCC_SPDIFRXSEL {
                return switch (self) {
                    .RCC_SPDIFRXCLKSOURCE_PLLI2SP => .PLLI2S1_P,
                    .RCC_SPDIFRXCLKSOURCE_PLLR => .PLL1_R,
                };
            }
            pub fn from_enum(item: RCC_SPDIFRXSEL) anyerror!@This() {
                return switch (item) {
                    .PLLI2S1_P => .RCC_SPDIFRXCLKSOURCE_PLLI2SP,
                    .PLL1_R => .RCC_SPDIFRXCLKSOURCE_PLLR,
                };
            }
        };

        pub const SDIOCLockSelectionList = enum {
            RCC_SDIOCLKSOURCE_CLK48,
            RCC_SDIOCLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SDIOSEL {
                return switch (self) {
                    .RCC_SDIOCLKSOURCE_SYSCLK => .SYS,
                    .RCC_SDIOCLKSOURCE_CLK48 => .CLK48,
                };
            }
            pub fn from_enum(item: RCC_SDIOSEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_SDIOCLKSOURCE_SYSCLK,
                    .CLK48 => .RCC_SDIOCLKSOURCE_CLK48,
                };
            }
        };

        pub const SAIACLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_EXT,
            RCC_SAI1CLKSOURCE_PLLR,
            RCC_SAI1CLKSOURCE_PLLI2S,
            RCC_SAI1CLKSOURCE_PLLSAI,

            pub fn to_enum(self: @This()) anyerror!RCC_SAI2SRC {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_EXT => .HSI_HSE,
                    .RCC_SAI1CLKSOURCE_PLLI2S => .PLLI2S,
                    .RCC_SAI1CLKSOURCE_PLLR => .PLLR,
                    .RCC_SAI1CLKSOURCE_PLLSAI => .PLLSAI,
                };
            }
            pub fn from_enum(item: RCC_SAI2SRC) anyerror!@This() {
                return switch (item) {
                    .HSI_HSE => .RCC_SAI1CLKSOURCE_EXT,
                    .PLLI2S => .RCC_SAI1CLKSOURCE_PLLI2S,
                    .PLLR => .RCC_SAI1CLKSOURCE_PLLR,
                    .PLLSAI => .RCC_SAI1CLKSOURCE_PLLSAI,
                };
            }
        };

        pub const SAIBCLockSelectionList = enum {
            RCC_SAI2CLKSOURCE_PLLSRC,
            RCC_SAI2CLKSOURCE_PLLR,
            RCC_SAI2CLKSOURCE_PLLI2S,
            RCC_SAI2CLKSOURCE_PLLSAI,

            pub fn to_enum(self: @This()) anyerror!RCC_SAI2SRC {
                return switch (self) {
                    .RCC_SAI2CLKSOURCE_PLLI2S => .PLLI2S,
                    .RCC_SAI2CLKSOURCE_PLLR => .PLLR,
                    .RCC_SAI2CLKSOURCE_PLLSRC => .HSI_HSE,
                    .RCC_SAI2CLKSOURCE_PLLSAI => .PLLSAI,
                };
            }
            pub fn from_enum(item: RCC_SAI2SRC) anyerror!@This() {
                return switch (item) {
                    .PLLI2S => .RCC_SAI2CLKSOURCE_PLLI2S,
                    .PLLR => .RCC_SAI2CLKSOURCE_PLLR,
                    .HSI_HSE => .RCC_SAI2CLKSOURCE_PLLSRC,
                    .PLLSAI => .RCC_SAI2CLKSOURCE_PLLSAI,
                };
            }
        };

        pub const I2S1CLockSelectionList = enum {
            RCC_I2SAPB1CLKSOURCE_PLLSRC,
            RCC_I2SAPB1CLKSOURCE_PLLR,
            RCC_I2SAPB1CLKSOURCE_EXT,
            RCC_I2SAPB1CLKSOURCE_PLLI2S,

            pub fn to_enum(self: @This()) anyerror!RCC_I2S1SRC {
                return switch (self) {
                    .RCC_I2SAPB1CLKSOURCE_PLLI2S => .PLLI2SR,
                    .RCC_I2SAPB1CLKSOURCE_PLLSRC => .HSI_HSE,
                    .RCC_I2SAPB1CLKSOURCE_EXT => .I2S_CKIN,
                    .RCC_I2SAPB1CLKSOURCE_PLLR => .PLLR,
                };
            }
            pub fn from_enum(item: RCC_I2S1SRC) anyerror!@This() {
                return switch (item) {
                    .PLLI2SR => .RCC_I2SAPB1CLKSOURCE_PLLI2S,
                    .HSI_HSE => .RCC_I2SAPB1CLKSOURCE_PLLSRC,
                    .I2S_CKIN => .RCC_I2SAPB1CLKSOURCE_EXT,
                    .PLLR => .RCC_I2SAPB1CLKSOURCE_PLLR,
                };
            }
        };

        pub const I2S2CLockSelectionList = enum {
            RCC_I2SAPB2CLKSOURCE_PLLSRC,
            RCC_I2SAPB2CLKSOURCE_PLLR,
            RCC_I2SAPB2CLKSOURCE_EXT,
            RCC_I2SAPB2CLKSOURCE_PLLI2S,

            pub fn to_enum(self: @This()) anyerror!RCC_I2S1SRC {
                return switch (self) {
                    .RCC_I2SAPB2CLKSOURCE_PLLR => .PLLR,
                    .RCC_I2SAPB2CLKSOURCE_PLLI2S => .PLLI2SR,
                    .RCC_I2SAPB2CLKSOURCE_PLLSRC => .HSI_HSE,
                    .RCC_I2SAPB2CLKSOURCE_EXT => .I2S_CKIN,
                };
            }
            pub fn from_enum(item: RCC_I2S1SRC) anyerror!@This() {
                return switch (item) {
                    .PLLR => .RCC_I2SAPB2CLKSOURCE_PLLR,
                    .PLLI2SR => .RCC_I2SAPB2CLKSOURCE_PLLI2S,
                    .HSI_HSE => .RCC_I2SAPB2CLKSOURCE_PLLSRC,
                    .I2S_CKIN => .RCC_I2SAPB2CLKSOURCE_EXT,
                };
            }
        };

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_MCO1SEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_MCO1SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .PLL => .RCC_MCO1SOURCE_PLLCLK,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                };
            }
        };

        pub const RCC_MCODiv1List = enum {
            RCC_MCODIV_1,
            RCC_MCODIV_2,
            RCC_MCODIV_3,
            RCC_MCODIV_4,
            RCC_MCODIV_5,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCODIV_3 => .Div3,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_5 => .Div5,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div3 => .RCC_MCODIV_3,
                    .Div4 => .RCC_MCODIV_4,
                    .Div5 => .RCC_MCODIV_5,
                    .Div1 => .RCC_MCODIV_1,
                    .Div2 => .RCC_MCODIV_2,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCODIV_1 => 1,
                    .RCC_MCODIV_2 => 2,
                    .RCC_MCODIV_3 => 3,
                    .RCC_MCODIV_4 => 4,
                    .RCC_MCODIV_5 => 5,
                };
            }
        };

        pub const RCC_MCO2SourceList = enum {
            RCC_MCO2SOURCE_SYSCLK,
            RCC_MCO2SOURCE_PLLI2SCLK,
            RCC_MCO2SOURCE_HSE,
            RCC_MCO2SOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_MCO2SEL {
                return switch (self) {
                    .RCC_MCO2SOURCE_PLLI2SCLK => .PLLI2S,
                    .RCC_MCO2SOURCE_SYSCLK => .SYS,
                    .RCC_MCO2SOURCE_PLLCLK => .PLL,
                    .RCC_MCO2SOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_MCO2SEL) anyerror!@This() {
                return switch (item) {
                    .PLLI2S => .RCC_MCO2SOURCE_PLLI2SCLK,
                    .SYS => .RCC_MCO2SOURCE_SYSCLK,
                    .PLL => .RCC_MCO2SOURCE_PLLCLK,
                    .HSE => .RCC_MCO2SOURCE_HSE,
                };
            }
        };

        pub const RCC_MCODiv2List = enum {
            RCC_MCODIV_1,
            RCC_MCODIV_2,
            RCC_MCODIV_3,
            RCC_MCODIV_4,
            RCC_MCODIV_5,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCODIV_3 => .Div3,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_5 => .Div5,
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div3 => .RCC_MCODIV_3,
                    .Div4 => .RCC_MCODIV_4,
                    .Div5 => .RCC_MCODIV_5,
                    .Div1 => .RCC_MCODIV_1,
                    .Div2 => .RCC_MCODIV_2,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCODIV_1 => 1,
                    .RCC_MCODIV_2 => 2,
                    .RCC_MCODIV_3 => 3,
                    .RCC_MCODIV_4 => 4,
                    .RCC_MCODIV_5 => 5,
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
            RCC_PLLP_DIV4,
            RCC_PLLP_DIV6,
            RCC_PLLP_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLP {
                return switch (self) {
                    .RCC_PLLP_DIV2 => .Div2,
                    .RCC_PLLP_DIV8 => .Div8,
                    .RCC_PLLP_DIV6 => .Div6,
                    .RCC_PLLP_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PLLP) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLP_DIV2,
                    .Div8 => .RCC_PLLP_DIV8,
                    .Div6 => .RCC_PLLP_DIV6,
                    .Div4 => .RCC_PLLP_DIV4,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLP_DIV2 => 2,
                    .RCC_PLLP_DIV4 => 4,
                    .RCC_PLLP_DIV6 => 6,
                    .RCC_PLLP_DIV8 => 8,
                };
            }
        };

        pub const PLLSAIPList = enum {
            RCC_PLLSAIP_DIV2,
            RCC_PLLSAIP_DIV4,
            RCC_PLLSAIP_DIV6,
            RCC_PLLSAIP_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSAIDIVQ {
                return switch (self) {
                    .RCC_PLLSAIP_DIV6 => .Div6,
                    .RCC_PLLSAIP_DIV4 => .Div4,
                    .RCC_PLLSAIP_DIV2 => .Div2,
                    .RCC_PLLSAIP_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PLLSAIDIVQ) anyerror!@This() {
                return switch (item) {
                    .Div6 => .RCC_PLLSAIP_DIV6,
                    .Div4 => .RCC_PLLSAIP_DIV4,
                    .Div2 => .RCC_PLLSAIP_DIV2,
                    .Div8 => .RCC_PLLSAIP_DIV8,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLSAIDIVQ", @tagName(item), "PLLSAIP" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLSAIP_DIV2 => 2,
                    .RCC_PLLSAIP_DIV4 => 4,
                    .RCC_PLLSAIP_DIV6 => 6,
                    .RCC_PLLSAIP_DIV8 => 8,
                };
            }
        };

        pub const PLLI2SPList = enum {
            RCC_PLLI2SP_DIV2,
            RCC_PLLI2SP_DIV4,
            RCC_PLLI2SP_DIV6,
            RCC_PLLI2SP_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLI2SDIVQ {
                return switch (self) {
                    .RCC_PLLI2SP_DIV4 => .Div4,
                    .RCC_PLLI2SP_DIV2 => .Div2,
                    .RCC_PLLI2SP_DIV6 => .Div6,
                    .RCC_PLLI2SP_DIV8 => .Div8,
                };
            }
            pub fn from_enum(item: RCC_PLLI2SDIVQ) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_PLLI2SP_DIV4,
                    .Div2 => .RCC_PLLI2SP_DIV2,
                    .Div6 => .RCC_PLLI2SP_DIV6,
                    .Div8 => .RCC_PLLI2SP_DIV8,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLI2SDIVQ", @tagName(item), "PLLI2SP" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLI2SP_DIV2 => 2,
                    .RCC_PLLI2SP_DIV4 => 4,
                    .RCC_PLLI2SP_DIV6 => 6,
                    .RCC_PLLI2SP_DIV8 => 8,
                };
            }
        };

        pub const INSTRUCTION_CACHE_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const PREFETCH_ENABLEList = enum {
            @"0",
            @"1",
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
            FLASH_LATENCY_5,
            FLASH_LATENCY_6,
            FLASH_LATENCY_7,
            FLASH_LATENCY_8,

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_2 => .WS2,
                    .FLASH_LATENCY_3 => .WS3,
                    .FLASH_LATENCY_6 => .WS6,
                    .FLASH_LATENCY_8 => .WS8,
                    .FLASH_LATENCY_5 => .WS5,
                    .FLASH_LATENCY_0 => .WS0,
                    .FLASH_LATENCY_1 => .WS1,
                    .FLASH_LATENCY_4 => .WS4,
                    .FLASH_LATENCY_7 => .WS7,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS2 => .FLASH_LATENCY_2,
                    .WS3 => .FLASH_LATENCY_3,
                    .WS6 => .FLASH_LATENCY_6,
                    .WS8 => .FLASH_LATENCY_8,
                    .WS5 => .FLASH_LATENCY_5,
                    .WS0 => .FLASH_LATENCY_0,
                    .WS1 => .FLASH_LATENCY_1,
                    .WS4 => .FLASH_LATENCY_4,
                    .WS7 => .FLASH_LATENCY_7,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "FLASH_LATENCY", @tagName(item), "FLatency" },
                    ),
                };
            }
        };

        pub const RCC_TIM_PRescaler_SelectionList = enum {
            RCC_TIMPRES_ACTIVATED,
            RCC_TIMPRES_DESACTIVATED,

            pub fn to_enum(self: @This()) anyerror!RCC_TIMPRE {
                return switch (self) {
                    .RCC_TIMPRES_ACTIVATED => .Mul4,
                    .RCC_TIMPRES_DESACTIVATED => .Mul2,
                };
            }
            pub fn from_enum(item: RCC_TIMPRE) anyerror!@This() {
                return switch (item) {
                    .Mul4 => .RCC_TIMPRES_ACTIVATED,
                    .Mul2 => .RCC_TIMPRES_DESACTIVATED,
                };
            }
        };

        pub const PWR_Regulator_Voltage_ScaleList = enum {
            PWR_REGULATOR_VOLTAGE_SCALE1,
            PWR_REGULATOR_VOLTAGE_SCALE2,
            PWR_REGULATOR_VOLTAGE_SCALE3,

            pub fn to_enum(self: @This()) anyerror!PWR_VOS {
                return switch (self) {
                    .PWR_REGULATOR_VOLTAGE_SCALE1 => .SCALE1,
                    .PWR_REGULATOR_VOLTAGE_SCALE2 => .SCALE2,
                    .PWR_REGULATOR_VOLTAGE_SCALE3 => .SCALE3,
                };
            }
            pub fn from_enum(item: PWR_VOS) anyerror!@This() {
                return switch (item) {
                    .SCALE1 => .PWR_REGULATOR_VOLTAGE_SCALE1,
                    .SCALE2 => .PWR_REGULATOR_VOLTAGE_SCALE2,
                    .SCALE3 => .PWR_REGULATOR_VOLTAGE_SCALE3,
                };
            }
        };

        pub const PWREXT_OverDriveList = enum {
            PWREXT_OverDrive_ACTIVATED,
            PWREXT_OverDrive_DESACTIVATED,
        };

        pub const ExtClockEnableList = enum {
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

        pub const CECEnableList = enum {
            true,
            false,
        };

        pub const EnableFMPI2C1List = enum {
            true,
            false,
        };

        pub const EnableUSBList = enum {
            true,
            false,
        };

        pub const EnableSDIOList = enum {
            true,
            false,
        };

        pub const EnableSPDIFList = enum {
            true,
            false,
        };

        pub const EnableSAIAList = enum {
            true,
            false,
        };

        pub const EnableSAIBList = enum {
            true,
            false,
        };

        pub const EnableI2S1List = enum {
            true,
            false,
        };

        pub const EnableI2S2List = enum {
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

        //=======ClockTree Flags========

        pub const Flags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCO1Config: bool = false,
            MCO2Config: bool = false,
            AudioClockConfig: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            USB_OTG_HSUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            SDIOUsed_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            SAI2Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            FMPI2C1Used_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
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
            USB_OTG_FSUsed_ForRCC: bool = false,
            USB_OTG_HSEmbeddedPHYUsed_ForRCC: bool = false,
            USB_OTG_HSUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            SDIOUsed_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            SAI2Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            FMPI2C1Used_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            CECEnable: bool = false, //Reference flag
            EnableFMPI2C1: bool = false, //Reference flag
            EnableUSB: bool = false, //Reference flag
            EnableSDIO: bool = false, //Reference flag
            EnableSPDIF: bool = false, //Reference flag
            EnableSAIA: bool = false, //Reference flag
            EnableSAIB: bool = false, //Reference flag
            EnableI2S1: bool = false, //Reference flag
            EnableI2S2: bool = false, //Reference flag
            MCO1OutPutEnable: bool = false, //Reference flag
            MCO2OutPutEnable: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            HSEUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionList = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            PWREXT_OverDrive: ?PWREXT_OverDriveList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?u32 = null,
            PLLSAIM: ?u32 = null,
            PLLI2SM: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RCC_RTC_Clock_SourceVirtual: ?RCC_RTC_Clock_SourceVirtualList = null,
            CECClockSelection: ?CECClockSelectionList = null,
            FMPI2C1Selection: ?FMPI2C1SelectionList = null,
            USBCLockSelection: ?USBCLockSelectionList = null,
            SPDIFCLockSelection: ?SPDIFCLockSelectionList = null,
            SDIOCLockSelection: ?SDIOCLockSelectionList = null,
            SAIACLockSelection: ?SAIACLockSelectionList = null,
            SAIBCLockSelection: ?SAIBCLockSelectionList = null,
            I2S1CLockSelection: ?I2S1CLockSelectionList = null,
            I2S2CLockSelection: ?I2S2CLockSelectionList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv1: ?RCC_MCODiv1List = null,
            RCC_MCO2Source: ?RCC_MCO2SourceList = null,
            RCC_MCODiv2: ?RCC_MCODiv2List = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            PLLN: ?u32 = null,
            PLLP: ?PLLPList = null,
            PLLQ: ?u32 = null,
            PLLR: ?u32 = null,
            PLLSAIN: ?u32 = null,
            PLLSAIP: ?PLLSAIPList = null,
            PLLSAIQ: ?u32 = null,
            PLLSAIQDiv: ?u32 = null,
            PLLI2SN: ?u32 = null,
            PLLI2SP: ?PLLI2SPList = null,
            PLLI2SQ: ?u32 = null,
            PLLI2SQDiv: ?u32 = null,
            PLLI2SR: ?u32 = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            SYSCLKSource: SYSCLKSourceList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLM: u32,
            PLLSAIM: u32,
            PLLI2SM: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RCC_RTC_Clock_SourceVirtual: RCC_RTC_Clock_SourceVirtualList,
            HSI_Div_CEC: u32,
            CECClockSelection: CECClockSelectionList,
            FMPI2C1Selection: FMPI2C1SelectionList,
            USBCLockSelection: USBCLockSelectionList,
            SPDIFCLockSelection: SPDIFCLockSelectionList,
            SDIOCLockSelection: SDIOCLockSelectionList,
            SAIACLockSelection: SAIACLockSelectionList,
            SAIBCLockSelection: SAIBCLockSelectionList,
            I2S1CLockSelection: I2S1CLockSelectionList,
            I2S2CLockSelection: I2S2CLockSelectionList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv1: RCC_MCODiv1List,
            RCC_MCO2Source: RCC_MCO2SourceList,
            RCC_MCODiv2: RCC_MCODiv2List,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB2TimCLKDivider: u32,
            PLLN: u32,
            PLLP: PLLPList,
            PLLQ: u32,
            PLLR: u32,
            PLLSAIN: u32,
            PLLSAIP: PLLSAIPList,
            PLLSAIQ: u32,
            PLLSAIQDiv: u32,
            PLLI2SN: u32,
            PLLI2SP: PLLI2SPList,
            PLLI2SQ: u32,
            PLLI2SQDiv: u32,
            PLLI2SR: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionList,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            PWREXT_OverDrive: PWREXT_OverDriveList,
            HSE_Timout: u32,
            LSE_Timout: u32,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            FLatency: ?FLASH_LATENCY = null,
            HSICalibrationValue: ?u32 = null,
            RCC_TIM_PRescaler_Selection: ?RCC_TIMPRE = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
            PWREXT_OverDrive: ?PWREXT_OverDriveList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .FLatency = if (self.FLatency) |val| try FLatencyList.from_enum(val) else null,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .RCC_TIM_PRescaler_Selection = if (self.RCC_TIM_PRescaler_Selection) |val| try RCC_TIM_PRescaler_SelectionList.from_enum(val) else null,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .PWREXT_OverDrive = self.PWREXT_OverDrive,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSE_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?u32 = null,
            PLLSAIM: ?u32 = null,
            PLLI2SM: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RCC_RTC_Clock_SourceVirtual: ?RCC_RTCSEL = null,
            CECClockSelection: ?RCC_CECSEL = null,
            FMPI2C1Selection: ?RCC_FMPI2CSEL = null,
            USBCLockSelection: ?RCC_CLK48SEL = null,
            SPDIFCLockSelection: ?RCC_SPDIFRXSEL = null,
            SDIOCLockSelection: ?RCC_SDIOSEL = null,
            SAIACLockSelection: ?RCC_SAI2SRC = null,
            SAIBCLockSelection: ?RCC_SAI2SRC = null,
            I2S1CLockSelection: ?RCC_I2S1SRC = null,
            I2S2CLockSelection: ?RCC_I2S1SRC = null,
            RCC_MCO1Source: ?RCC_MCO1SEL = null,
            RCC_MCODiv1: ?RCC_MCOPRE = null,
            RCC_MCO2Source: ?RCC_MCO2SEL = null,
            RCC_MCODiv2: ?RCC_MCOPRE = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            PLLN: ?u32 = null,
            PLLP: ?RCC_PLLP = null,
            PLLQ: ?u32 = null,
            PLLR: ?u32 = null,
            PLLSAIN: ?u32 = null,
            PLLSAIP: ?RCC_PLLSAIDIVQ = null,
            PLLSAIQ: ?u32 = null,
            PLLSAIQDiv: ?u32 = null,
            PLLI2SN: ?u32 = null,
            PLLI2SP: ?RCC_PLLI2SDIVQ = null,
            PLLI2SQ: ?u32 = null,
            PLLI2SQDiv: ?u32 = null,
            PLLI2SR: ?u32 = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = self.PLLM,
                    .PLLSAIM = self.PLLSAIM,
                    .PLLI2SM = self.PLLI2SM,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .RCC_RTC_Clock_SourceVirtual = if (self.RCC_RTC_Clock_SourceVirtual) |val| try RCC_RTC_Clock_SourceVirtualList.from_enum(val) else null,
                    .CECClockSelection = if (self.CECClockSelection) |val| try CECClockSelectionList.from_enum(val) else null,
                    .FMPI2C1Selection = if (self.FMPI2C1Selection) |val| try FMPI2C1SelectionList.from_enum(val) else null,
                    .USBCLockSelection = if (self.USBCLockSelection) |val| try USBCLockSelectionList.from_enum(val) else null,
                    .SPDIFCLockSelection = if (self.SPDIFCLockSelection) |val| try SPDIFCLockSelectionList.from_enum(val) else null,
                    .SDIOCLockSelection = if (self.SDIOCLockSelection) |val| try SDIOCLockSelectionList.from_enum(val) else null,
                    .SAIACLockSelection = if (self.SAIACLockSelection) |val| try SAIACLockSelectionList.from_enum(val) else null,
                    .SAIBCLockSelection = if (self.SAIBCLockSelection) |val| try SAIBCLockSelectionList.from_enum(val) else null,
                    .I2S1CLockSelection = if (self.I2S1CLockSelection) |val| try I2S1CLockSelectionList.from_enum(val) else null,
                    .I2S2CLockSelection = if (self.I2S2CLockSelection) |val| try I2S2CLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv1 = if (self.RCC_MCODiv1) |val| try RCC_MCODiv1List.from_enum(val) else null,
                    .RCC_MCO2Source = if (self.RCC_MCO2Source) |val| try RCC_MCO2SourceList.from_enum(val) else null,
                    .RCC_MCODiv2 = if (self.RCC_MCODiv2) |val| try RCC_MCODiv2List.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .PLLN = self.PLLN,
                    .PLLP = if (self.PLLP) |val| try PLLPList.from_enum(val) else null,
                    .PLLQ = self.PLLQ,
                    .PLLR = self.PLLR,
                    .PLLSAIN = self.PLLSAIN,
                    .PLLSAIP = if (self.PLLSAIP) |val| try PLLSAIPList.from_enum(val) else null,
                    .PLLSAIQ = self.PLLSAIQ,
                    .PLLSAIQDiv = self.PLLSAIQDiv,
                    .PLLI2SN = self.PLLI2SN,
                    .PLLI2SP = if (self.PLLI2SP) |val| try PLLI2SPList.from_enum(val) else null,
                    .PLLI2SQ = self.PLLI2SQ,
                    .PLLI2SQDiv = self.PLLI2SQDiv,
                    .PLLI2SR = self.PLLI2SR,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            SYSCLKSource: RCC_SW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLM: u32,
            PLLSAIM: u32,
            PLLI2SM: u32,
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RCC_RTC_Clock_SourceVirtual: RCC_RTCSEL,
            HSI_Div_CEC: u32,
            CECClockSelection: RCC_CECSEL,
            FMPI2C1Selection: RCC_FMPI2CSEL,
            USBCLockSelection: RCC_CLK48SEL,
            SPDIFCLockSelection: RCC_SPDIFRXSEL,
            SDIOCLockSelection: RCC_SDIOSEL,
            SAIACLockSelection: RCC_SAI2SRC,
            SAIBCLockSelection: RCC_SAI2SRC,
            I2S1CLockSelection: RCC_I2S1SRC,
            I2S2CLockSelection: RCC_I2S1SRC,
            RCC_MCO1Source: RCC_MCO1SEL,
            RCC_MCODiv1: RCC_MCOPRE,
            RCC_MCO2Source: RCC_MCO2SEL,
            RCC_MCODiv2: RCC_MCOPRE,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            PLLN: u32,
            PLLP: RCC_PLLP,
            PLLQ: u32,
            PLLR: u32,
            PLLSAIN: u32,
            PLLSAIP: RCC_PLLSAIDIVQ,
            PLLSAIQ: u32,
            PLLSAIQDiv: u32,
            PLLI2SN: u32,
            PLLI2SP: RCC_PLLI2SDIVQ,
            PLLI2SQ: u32,
            PLLI2SQDiv: u32,
            PLLI2SR: u32,
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: u32,
            RCC_TIM_PRescaler_Selection: RCC_TIMPRE,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
            PWREXT_OverDrive: PWREXT_OverDriveList,
            HSE_Timout: u32,
            LSE_Timout: u32,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = cubemx_config.PLLM,
                    .PLLSAIM = cubemx_config.PLLSAIM,
                    .PLLI2SM = cubemx_config.PLLI2SM,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RCC_RTC_Clock_SourceVirtual = try cubemx_config.RCC_RTC_Clock_SourceVirtual.to_enum(),
                    .HSI_Div_CEC = cubemx_config.HSI_Div_CEC,
                    .CECClockSelection = try cubemx_config.CECClockSelection.to_enum(),
                    .FMPI2C1Selection = try cubemx_config.FMPI2C1Selection.to_enum(),
                    .USBCLockSelection = try cubemx_config.USBCLockSelection.to_enum(),
                    .SPDIFCLockSelection = try cubemx_config.SPDIFCLockSelection.to_enum(),
                    .SDIOCLockSelection = try cubemx_config.SDIOCLockSelection.to_enum(),
                    .SAIACLockSelection = try cubemx_config.SAIACLockSelection.to_enum(),
                    .SAIBCLockSelection = try cubemx_config.SAIBCLockSelection.to_enum(),
                    .I2S1CLockSelection = try cubemx_config.I2S1CLockSelection.to_enum(),
                    .I2S2CLockSelection = try cubemx_config.I2S2CLockSelection.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv1 = try cubemx_config.RCC_MCODiv1.to_enum(),
                    .RCC_MCO2Source = try cubemx_config.RCC_MCO2Source.to_enum(),
                    .RCC_MCODiv2 = try cubemx_config.RCC_MCODiv2.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .PLLN = cubemx_config.PLLN,
                    .PLLP = try cubemx_config.PLLP.to_enum(),
                    .PLLQ = cubemx_config.PLLQ,
                    .PLLR = cubemx_config.PLLR,
                    .PLLSAIN = cubemx_config.PLLSAIN,
                    .PLLSAIP = try cubemx_config.PLLSAIP.to_enum(),
                    .PLLSAIQ = cubemx_config.PLLSAIQ,
                    .PLLSAIQDiv = cubemx_config.PLLSAIQDiv,
                    .PLLI2SN = cubemx_config.PLLI2SN,
                    .PLLI2SP = try cubemx_config.PLLI2SP.to_enum(),
                    .PLLI2SQ = cubemx_config.PLLI2SQ,
                    .PLLI2SQDiv = cubemx_config.PLLI2SQDiv,
                    .PLLI2SR = cubemx_config.PLLI2SR,
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = try cubemx_config.FLatency.to_enum(),
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .RCC_TIM_PRescaler_Selection = try cubemx_config.RCC_TIM_PRescaler_Selection.to_enum(),
                    .PWR_Regulator_Voltage_Scale = try cubemx_config.PWR_Regulator_Voltage_Scale.to_enum(),
                    .PWREXT_OverDrive = cubemx_config.PWREXT_OverDrive,
                    .HSE_Timout = cubemx_config.HSE_Timout,
                    .LSE_Timout = cubemx_config.LSE_Timout,
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
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            I2S_CKIN: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PLLSource: u32 = 0,
            PLLM: u32 = 0,
            PLLSAIM: u32 = 0,
            PLLI2SM: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            HSIDivCEC: u32 = 0,
            CECMult: u32 = 0,
            CECOutput: u32 = 0,
            FMPI2C1Mult: u32 = 0,
            FMPI2C1output: u32 = 0,
            USBMult: u32 = 0,
            USBoutput: u32 = 0,
            SPDIFMult: u32 = 0,
            SPDIFoutput: u32 = 0,
            SDIOMult: u32 = 0,
            SDIOoutput: u32 = 0,
            SAIAMult: u32 = 0,
            SAIAoutput: u32 = 0,
            SAIBMult: u32 = 0,
            SAIBoutput: u32 = 0,
            I2S1Mult: u32 = 0,
            I2S1output: u32 = 0,
            I2S2Mult: u32 = 0,
            I2S2output: u32 = 0,
            MCO1Mult: u32 = 0,
            MCO1Div: u32 = 0,
            MCO1Pin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            AHBPrescaler: u32 = 0,
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
            PLLQ: u32 = 0,
            PLLR: u32 = 0,
            PLLSAIN: u32 = 0,
            PLLSAIP: u32 = 0,
            PLLSAIoutput: u32 = 0,
            PLLSAIQ: u32 = 0,
            PLLSAIQDiv: u32 = 0,
            PLLI2SN: u32 = 0,
            PLLI2SP: u32 = 0,
            PLLI2Soutput: u32 = 0,
            PLLI2SQ: u32 = 0,
            PLLI2SQDiv: u32 = 0,
            PLLI2SR: u32 = 0,
            VCOInput: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            PLLQCLK: u32 = 0,
            PLLRCLK: u32 = 0,
            VCOSAIInput: u32 = 0,
            VCOSAIOutput: u32 = 0,
            PLLSAIPCLK: u32 = 0,
            PLLSAIQCLK: u32 = 0,
            VCOI2SInput: u32 = 0,
            VCOI2SOutput: u32 = 0,
            PLLI2SPCLK: u32 = 0,
            PLLI2SRCLK: u32 = 0,
            PLLI2SQCLK: u32 = 0,
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

            var SysSourceIsHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceIsHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceIsPLLclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceIsPLLR: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBSourceisPLLSAIP: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBSourceisPLLQ: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFSourceisPLLR: bool = false; //semaphore for processing, not an actual flag in the output;
            var SPDIFSourceisPLLI2SP: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDIOSourceIsClock48: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDIOSourceIsSysclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIASourceIsIsExt: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIASourceIsPLLR: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIASourceIsPLLI2SQ: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIASourceIsPLLSAI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIBSourceIsPllSRC: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIBSourceIsPLLR: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIBSourceIsPLLI2SQ: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAIBSourceIsPLLSAI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceIsPllsrc: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceIsPllR: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceIsEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceIsPLLI2SR: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourceIsPllsrc: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourceIsPllR: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourceIsEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S2SourceIsPLLI2SR: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceIsPLLI2SP: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var TimPrescalerEnabled: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var PLLSAIM = ClockNode{
                .name = "PLLSAIM",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SM = ClockNode{
                .name = "PLLI2SM",
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

            var HSIDivCEC = ClockNode{
                .name = "HSIDivCEC",
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

            var FMPI2C1Mult = ClockNode{
                .name = "FMPI2C1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var FMPI2C1output = ClockNode{
                .name = "FMPI2C1output",
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

            var SDIOMult = ClockNode{
                .name = "SDIOMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SDIOoutput = ClockNode{
                .name = "SDIOoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAIAMult = ClockNode{
                .name = "SAIAMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAIAoutput = ClockNode{
                .name = "SAIAoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAIBMult = ClockNode{
                .name = "SAIBMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SAIBoutput = ClockNode{
                .name = "SAIBoutput",
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

            var PLLQ = ClockNode{
                .name = "PLLQ",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLR = ClockNode{
                .name = "PLLR",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIN = ClockNode{
                .name = "PLLSAIN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIP = ClockNode{
                .name = "PLLSAIP",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIoutput = ClockNode{
                .name = "PLLSAIoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIQ = ClockNode{
                .name = "PLLSAIQ",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIQDiv = ClockNode{
                .name = "PLLSAIQDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SN = ClockNode{
                .name = "PLLI2SN",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SP = ClockNode{
                .name = "PLLI2SP",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2Soutput = ClockNode{
                .name = "PLLI2Soutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SQ = ClockNode{
                .name = "PLLI2SQ",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SQDiv = ClockNode{
                .name = "PLLI2SQDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SR = ClockNode{
                .name = "PLLI2SR",
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

            var PLLQCLK = ClockNode{
                .name = "PLLQCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLRCLK = ClockNode{
                .name = "PLLRCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOSAIInput = ClockNode{
                .name = "VCOSAIInput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOSAIOutput = ClockNode{
                .name = "VCOSAIOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIPCLK = ClockNode{
                .name = "PLLSAIPCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIQCLK = ClockNode{
                .name = "PLLSAIQCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOI2SInput = ClockNode{
                .name = "VCOI2SInput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var VCOI2SOutput = ClockNode{
                .name = "VCOI2SOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SPCLK = ClockNode{
                .name = "PLLI2SPCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SRCLK = ClockNode{
                .name = "PLLI2SRCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SQCLK = ClockNode{
                .name = "PLLI2SQCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 1.6e7;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 5e7,
                    };

                    break :blk user_val orelse 2.5e7;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 2.6e7,
                };

                break :blk user_val orelse 2.5e7;
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
                    .min = 0e0,
                    .max = 1e6,
                };

                break :blk user_val orelse 3.2768e4;
            };

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 1.2288e7;
            };

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_HSI => SysSourceIsHSI = true,
                        .RCC_SYSCLKSOURCE_HSE => SysSourceIsHSE = true,
                        .RCC_SYSCLKSOURCE_PLLCLK => SysSourceIsPLLclk = true,
                        .RCC_SYSCLKSOURCE_PLLRCLK => SysSourceIsPLLR = true,
                    }
                }
                break :blk user_val orelse {
                    SysSourceIsHSI = true;
                    break :blk .RCC_SYSCLKSOURCE_HSI;
                };
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if (((config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC))) {
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
                                "((USB_OTG_FSUsed_ForRCC|USB_OTG_HSEmbeddedPHYUsed_ForRCC)) ",
                                "PLL Mux should have HSE as input",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .RCC_PLLSOURCE_HSE;
                }
                const user_val = config.PLLSourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSOURCE_HSI => PLLSourceHSI = true,
                        .RCC_PLLSOURCE_HSE => {},
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
                    if (val < 2) {
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
                            2,
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
                break :blk user_val orelse 16;
            };

            const PLLSAIMValue: u32 = blk: {
                const user_val = config.PLLSAIM;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAIM",
                            "Else",
                            "No additional information",
                            2,
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
                            "PLLSAIM",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 16;
            };

            const PLLI2SMValue: u32 = blk: {
                const user_val = config.PLLI2SM;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SM",
                            "Else",
                            "No additional information",
                            2,
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
                            "PLLI2SM",
                            "Else",
                            "No additional information",
                            63,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 16;
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
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_HSE_DIV2;
            };

            const RCC_RTC_Clock_SourceVirtualValue: RCC_RTC_Clock_SourceVirtualList = blk: {
                if (((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11")))) {
                    const user_val = config.RCC_RTC_Clock_SourceVirtual;

                    if (user_val) |val| {
                        switch (val) {
                            .HSERTCDevisor => {},
                            else => {
                                return comptime_fail_or_error(error.InvalidConfig,
                                    \\
                                    \\Error on {s} | expr: {s} diagnostic: {s} 
                                    \\Option not available in this condition: .{s}.
                                    \\note: available options:
                                    \\ - {s}
                                , .{
                                    "RCC_RTC_Clock_SourceVirtual",
                                    "((HSEByPass|HSEOscillator)&(SEM2RCC_HSE_REQUIRED_TIM11 & TIM11 & Semaphore_input_Channel1TIM11))",
                                    "RTC Mux should have HSE as input when TIM11 remap is used",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "HSE" else "HSERTCDevisor",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .HSERTCDevisor;
                }
                const user_val = config.RCC_RTC_Clock_SourceVirtual;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => {},
                        .RCC_RTCCLKSOURCE_LSI => {},
                        .HSERTCDevisor => {},
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_LSI;
            };

            const HSI_Div_CECValue: u32 = blk: {
                break :blk 488;
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

            const FMPI2C1SelectionValue: FMPI2C1SelectionList = blk: {
                const user_val = config.FMPI2C1Selection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_FMPI2C1CLKSOURCE_SYSCLK => {},
                        .RCC_FMPI2C1CLKSOURCE_HSI => {},
                        .RCC_FMPI2C1CLKSOURCE_APB => {},
                    }
                }
                break :blk user_val orelse .RCC_FMPI2C1CLKSOURCE_APB;
            };

            const USBCLockSelectionValue: USBCLockSelectionList = blk: {
                const user_val = config.USBCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CLK48CLKSOURCE_PLLSAIP => USBSourceisPLLSAIP = true,
                        .RCC_CLK48CLKSOURCE_PLLQ => USBSourceisPLLQ = true,
                    }
                }
                break :blk user_val orelse {
                    USBSourceisPLLQ = true;
                    break :blk .RCC_CLK48CLKSOURCE_PLLQ;
                };
            };

            const SPDIFCLockSelectionValue: SPDIFCLockSelectionList = blk: {
                const user_val = config.SPDIFCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SPDIFRXCLKSOURCE_PLLR => SPDIFSourceisPLLR = true,
                        .RCC_SPDIFRXCLKSOURCE_PLLI2SP => SPDIFSourceisPLLI2SP = true,
                    }
                }
                break :blk user_val orelse {
                    SPDIFSourceisPLLR = true;
                    break :blk .RCC_SPDIFRXCLKSOURCE_PLLR;
                };
            };

            const SDIOCLockSelectionValue: SDIOCLockSelectionList = blk: {
                const user_val = config.SDIOCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SDIOCLKSOURCE_CLK48 => SDIOSourceIsClock48 = true,
                        .RCC_SDIOCLKSOURCE_SYSCLK => SDIOSourceIsSysclk = true,
                    }
                }
                break :blk user_val orelse {
                    SDIOSourceIsClock48 = true;
                    break :blk .RCC_SDIOCLKSOURCE_CLK48;
                };
            };

            const SAIACLockSelectionValue: SAIACLockSelectionList = blk: {
                const user_val = config.SAIACLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_EXT => SAIASourceIsIsExt = true,
                        .RCC_SAI1CLKSOURCE_PLLR => SAIASourceIsPLLR = true,
                        .RCC_SAI1CLKSOURCE_PLLI2S => SAIASourceIsPLLI2SQ = true,
                        .RCC_SAI1CLKSOURCE_PLLSAI => SAIASourceIsPLLSAI = true,
                    }
                }
                break :blk user_val orelse {
                    SAIASourceIsPLLSAI = true;
                    break :blk .RCC_SAI1CLKSOURCE_PLLSAI;
                };
            };

            const SAIBCLockSelectionValue: SAIBCLockSelectionList = blk: {
                const user_val = config.SAIBCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI2CLKSOURCE_PLLSRC => SAIBSourceIsPllSRC = true,
                        .RCC_SAI2CLKSOURCE_PLLR => SAIBSourceIsPLLR = true,
                        .RCC_SAI2CLKSOURCE_PLLI2S => SAIBSourceIsPLLI2SQ = true,
                        .RCC_SAI2CLKSOURCE_PLLSAI => SAIBSourceIsPLLSAI = true,
                    }
                }
                break :blk user_val orelse {
                    SAIBSourceIsPLLSAI = true;
                    break :blk .RCC_SAI2CLKSOURCE_PLLSAI;
                };
            };

            const I2S1CLockSelectionValue: I2S1CLockSelectionList = blk: {
                const user_val = config.I2S1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2SAPB1CLKSOURCE_PLLSRC => I2S1SourceIsPllsrc = true,
                        .RCC_I2SAPB1CLKSOURCE_PLLR => I2S1SourceIsPllR = true,
                        .RCC_I2SAPB1CLKSOURCE_EXT => I2S1SourceIsEXT = true,
                        .RCC_I2SAPB1CLKSOURCE_PLLI2S => I2S1SourceIsPLLI2SR = true,
                    }
                }
                break :blk user_val orelse {
                    I2S1SourceIsPLLI2SR = true;
                    break :blk .RCC_I2SAPB1CLKSOURCE_PLLI2S;
                };
            };

            const I2S2CLockSelectionValue: I2S2CLockSelectionList = blk: {
                const user_val = config.I2S2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2SAPB2CLKSOURCE_PLLSRC => I2S2SourceIsPllsrc = true,
                        .RCC_I2SAPB2CLKSOURCE_PLLR => I2S2SourceIsPllR = true,
                        .RCC_I2SAPB2CLKSOURCE_EXT => I2S2SourceIsEXT = true,
                        .RCC_I2SAPB2CLKSOURCE_PLLI2S => I2S2SourceIsPLLI2SR = true,
                    }
                }
                break :blk user_val orelse {
                    I2S2SourceIsPLLI2SR = true;
                    break :blk .RCC_I2SAPB2CLKSOURCE_PLLI2S;
                };
            };

            const RCC_MCO1SourceValue: RCC_MCO1SourceList = blk: {
                const user_val = config.RCC_MCO1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_HSI => {},
                        .RCC_MCO1SOURCE_LSE => {},
                        .RCC_MCO1SOURCE_HSE => {},
                        .RCC_MCO1SOURCE_PLLCLK => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_HSI;
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
                    }
                }
                break :blk user_val orelse .RCC_MCODIV_1;
            };

            const RCC_MCO2SourceValue: RCC_MCO2SourceList = blk: {
                const user_val = config.RCC_MCO2Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO2SOURCE_SYSCLK => {},
                        .RCC_MCO2SOURCE_PLLI2SCLK => MCOSourceIsPLLI2SP = true,
                        .RCC_MCO2SOURCE_HSE => {},
                        .RCC_MCO2SOURCE_PLLCLK => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO2SOURCE_SYSCLK;
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

            const PLLNValue: u32 = blk: {
                const user_val = config.PLLN;
                if (user_val) |val| {
                    if (val < 50) {
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
                            50,
                            val,
                        });
                    }
                    if (val > 432) {
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
                            432,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 192;
            };

            const PLLPValue: PLLPList = blk: {
                const user_val = config.PLLP;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLP_DIV2 => {},
                        .RCC_PLLP_DIV4 => {},
                        .RCC_PLLP_DIV6 => {},
                        .RCC_PLLP_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLP_DIV2;
            };

            const PLLQValue: u32 = blk: {
                const user_val = config.PLLQ;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLQ",
                            "Else",
                            "No additional information",
                            2,
                            val,
                        });
                    }
                    if (val > 15) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLQ",
                            "Else",
                            "No additional information",
                            15,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLLRValue: u32 = blk: {
                const user_val = config.PLLR;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLR",
                            "Else",
                            "No additional information",
                            2,
                            val,
                        });
                    }
                    if (val > 7) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLR",
                            "Else",
                            "No additional information",
                            7,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLLSAINValue: u32 = blk: {
                const user_val = config.PLLSAIN;
                if (user_val) |val| {
                    if (val < 50) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAIN",
                            "Else",
                            "No additional information",
                            50,
                            val,
                        });
                    }
                    if (val > 432) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAIN",
                            "Else",
                            "No additional information",
                            432,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 192;
            };

            const PLLSAIPValue: PLLSAIPList = blk: {
                const user_val = config.PLLSAIP;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSAIP_DIV2 => {},
                        .RCC_PLLSAIP_DIV4 => {},
                        .RCC_PLLSAIP_DIV6 => {},
                        .RCC_PLLSAIP_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLSAIP_DIV2;
            };

            const PLLSAIQValue: u32 = blk: {
                const user_val = config.PLLSAIQ;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAIQ",
                            "Else",
                            "No additional information",
                            2,
                            val,
                        });
                    }
                    if (val > 15) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAIQ",
                            "Else",
                            "No additional information",
                            15,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLLSAIQDivValue: u32 = blk: {
                const user_val = config.PLLSAIQDiv;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAIQDiv",
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
                            "PLLSAIQDiv",
                            "Else",
                            "No additional information",
                            32,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
            };

            const PLLI2SNValue: u32 = blk: {
                const user_val = config.PLLI2SN;
                if (user_val) |val| {
                    if (val < 50) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SN",
                            "Else",
                            "No additional information",
                            50,
                            val,
                        });
                    }
                    if (val > 432) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SN",
                            "Else",
                            "No additional information",
                            432,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 192;
            };

            const PLLI2SPValue: PLLI2SPList = blk: {
                const user_val = config.PLLI2SP;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLI2SP_DIV2 => {},
                        .RCC_PLLI2SP_DIV4 => {},
                        .RCC_PLLI2SP_DIV6 => {},
                        .RCC_PLLI2SP_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLI2SP_DIV2;
            };

            const PLLI2SQValue: u32 = blk: {
                const user_val = config.PLLI2SQ;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SQ",
                            "Else",
                            "No additional information",
                            2,
                            val,
                        });
                    }
                    if (val > 15) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SQ",
                            "Else",
                            "No additional information",
                            15,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLLI2SQDivValue: u32 = blk: {
                const user_val = config.PLLI2SQDiv;
                if (user_val) |val| {
                    if (val < 1) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SQDiv",
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
                            "PLLI2SQDiv",
                            "Else",
                            "No additional information",
                            32,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1;
            };

            const PLLI2SRValue: u32 = blk: {
                const user_val = config.PLLI2SR;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SR",
                            "Else",
                            "No additional information",
                            2,
                            val,
                        });
                    }
                    if (val > 7) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Overflow Value - max: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLI2SR",
                            "Else",
                            "No additional information",
                            7,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
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
                    if (val < 0) {
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
                            0,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 100;
            };

            const LSE_TimoutValue: u32 = blk: {
                const user_val = config.extra_config.LSE_Timout;
                if (user_val) |val| {
                    if (val < 0) {
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
                            0,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 5000;
            };

            const PLLUsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and config.flags.MCO1Config) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const ExtClockEnableValue: ExtClockEnableList = blk: {
                if (config.flags.AudioClockConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC) and (config.flags.HSEOscillator or config.flags.HSEByPass) or ((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11")))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RTCEnableValue: RTCEnableList = blk: {
                if (config.flags.RTCUsed_ForRCC or ((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11")))) {
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

            const CECEnableValue: CECEnableList = blk: {
                if (config.flags.CECUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableFMPI2C1Value: EnableFMPI2C1List = blk: {
                if (config.flags.FMPI2C1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableUSBValue: EnableUSBList = blk: {
                if ((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_FSUsed_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableSDIOValue: EnableSDIOList = blk: {
                if (config.flags.SDIOUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableSPDIFValue: EnableSPDIFList = blk: {
                if (config.flags.SPDIFRXUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableSAIAValue: EnableSAIAList = blk: {
                if (config.flags.SAI1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableSAIBValue: EnableSAIBList = blk: {
                if (config.flags.SAI2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableI2S1Value: EnableI2S1List = blk: {
                if ((config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableI2S2Value: EnableI2S2List = blk: {
                if (config.flags.I2S1Used_ForRCC) {
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

            const EnableHSEValue: EnableHSEList = blk: {
                if ((config.flags.HSEOscillator or config.flags.HSEByPass) or ((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11")))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if ((((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11"))) or config.flags.RTCUsed_ForRCC) and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
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

            const HSEUsedValue: u1 = blk: {
                if (((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11"))) or (config.flags.RTCUsed_ForRCC and !((check_ref(@TypeOf(RCC_RTC_Clock_SourceVirtualValue), RCC_RTC_Clock_SourceVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) or (check_ref(@TypeOf(RCC_RTC_Clock_SourceVirtualValue), RCC_RTC_Clock_SourceVirtualValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) or ((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or SysSourceIsPLLR or SysSourceIsPLLclk or ((SAIASourceIsPLLR or SAIASourceIsPLLI2SQ or SAIASourceIsPLLSAI) and config.flags.SAI1Used_ForRCC) or ((SAIBSourceIsPLLR or SAIBSourceIsPLLI2SQ or SAIBSourceIsPllSRC or SAIBSourceIsPLLSAI) and config.flags.SAI2Used_ForRCC) or ((I2S1SourceIsPllR or I2S1SourceIsPLLI2SR or I2S1SourceIsPllsrc) and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or ((I2S2SourceIsPllR or I2S2SourceIsPLLI2SR or I2S2SourceIsPllsrc) and config.flags.I2S1Used_ForRCC))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSE, .@"=")) and (config.flags.MCO1Config)) or (((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_HSE, .@"=")) or (MCOSourceIsPLLI2SP and (check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")))) and (config.flags.MCO2Config))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSEUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_LSE_REQUIRED_TIM5") and check_MCU("TIM5") and check_MCU("Semaphore_input_Channel4TIM5")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and (config.flags.MCO1Config)) or ((check_ref(@TypeOf(RCC_RTC_Clock_SourceVirtualValue), RCC_RTC_Clock_SourceVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and config.flags.RTCUsed_ForRCC) or ((check_ref(@TypeOf(CECClockSelectionValue), CECClockSelectionValue, .RCC_CECCLKSOURCE_LSE, .@"=")) and config.flags.CECUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((((MCOSourceIsPLLI2SP and (check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSI, .@"=")))) and (config.flags.MCO2Config)) or ((check_ref(@TypeOf(FMPI2C1SelectionValue), FMPI2C1SelectionValue, .RCC_FMPI2C1CLKSOURCE_HSI, .@"=")) and config.flags.FMPI2C1Used_ForRCC) or ((check_ref(@TypeOf(CECClockSelectionValue), CECClockSelectionValue, .RCC_CECCLKSOURCE_HSI, .@"=")) and config.flags.CECUsed_ForRCC) or (PLLSourceHSI and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or SysSourceIsPLLR or SysSourceIsPLLclk or ((SAIASourceIsPLLR or SAIASourceIsPLLI2SQ or SAIASourceIsPLLSAI) and config.flags.SAI1Used_ForRCC) or ((SAIBSourceIsPLLR or SAIBSourceIsPLLI2SQ or SAIBSourceIsPllSRC or SAIBSourceIsPLLSAI) and config.flags.SAI2Used_ForRCC) or ((I2S1SourceIsPllR or I2S1SourceIsPLLI2SR or I2S1SourceIsPllsrc) and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or ((I2S2SourceIsPllR or I2S2SourceIsPLLI2SR or I2S2SourceIsPllsrc) and config.flags.I2S1Used_ForRCC) or (config.flags.SPDIFRXUsed_ForRCC and (SPDIFSourceisPLLI2SP or SPDIFSourceisPLLR)))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and (config.flags.MCO1Config))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSIUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_LSI_REQUIRED_TIM5") and check_MCU("TIM5") and check_MCU("Semaphore_input_Channel4TIM5")) or config.flags.IWDGUsed_ForRCC or ((check_ref(@TypeOf(RCC_RTC_Clock_SourceVirtualValue), RCC_RTC_Clock_SourceVirtualValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (config.flags.RTCUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=") or SysSourceIsPLLR)) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE I2S_CKIN ======
            if (check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"=")) {
                I2S_CKIN.nodetype = .source;
                I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;
            }
            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLP},
                .RCC_SYSCLKSOURCE_PLLRCLK => &.{&PLLR},
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
            PLLM.value = @floatFromInt(PLLMValue);
            PLLM.parents = &.{&PLLSource};

            // ======= NODE PLLSAIM ======
            PLLSAIM.nodetype = .div;
            PLLSAIM.value = @floatFromInt(PLLSAIMValue);
            PLLSAIM.parents = &.{&PLLSource};

            // ======= NODE PLLI2SM ======
            PLLI2SM.nodetype = .div;
            PLLI2SM.value = @floatFromInt(PLLI2SMValue);
            PLLI2SM.parents = &.{&PLLSource};

            // ======= NODE HSERTCDevisor ======
            if (check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=")) {
                HSERTCDevisor.nodetype = .div;
                HSERTCDevisor.value = try RCC_RTC_Clock_Source_FROM_HSEValue.get();
                HSERTCDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE RTCClkSource ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RCC_RTC_Clock_SourceVirtualValue) {
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
            // ======= NODE HSIDivCEC ======
            HSIDivCEC.nodetype = .div;
            HSIDivCEC.value = @floatFromInt(HSI_Div_CECValue);
            HSIDivCEC.parents = &.{&HSIRC};

            // ======= NODE CECMult ======
            if (check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"=")) {
                CECMult.nodetype = .multi;
                CECMult.parents = switch (CECClockSelectionValue) {
                    .RCC_CECCLKSOURCE_HSI => &.{&HSIDivCEC},
                    .RCC_CECCLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE CECOutput ======
            if (check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"=")) {
                CECOutput.nodetype = .output;
                CECOutput.parents = &.{&CECMult};
            }
            // ======= NODE FMPI2C1Mult ======
            if (check_ref(@TypeOf(EnableFMPI2C1Value), EnableFMPI2C1Value, .true, .@"=")) {
                FMPI2C1Mult.nodetype = .multi;
                FMPI2C1Mult.parents = switch (FMPI2C1SelectionValue) {
                    .RCC_FMPI2C1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_FMPI2C1CLKSOURCE_APB => &.{&APB1Prescaler},
                    .RCC_FMPI2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE FMPI2C1output ======
            if (check_ref(@TypeOf(EnableFMPI2C1Value), EnableFMPI2C1Value, .true, .@"=")) {
                FMPI2C1output.nodetype = .output;
                FMPI2C1output.parents = &.{&FMPI2C1Mult};
            }
            // ======= NODE USBMult ======
            if (check_ref(@TypeOf(EnableUSBValue), EnableUSBValue, .true, .@"=") or check_ref(@TypeOf(EnableSDIOValue), EnableSDIOValue, .true, .@"=")) {
                USBMult.nodetype = .multi;
                USBMult.parents = switch (USBCLockSelectionValue) {
                    .RCC_CLK48CLKSOURCE_PLLQ => &.{&PLLQ},
                    .RCC_CLK48CLKSOURCE_PLLSAIP => &.{&PLLSAIP},
                };
            }
            // ======= NODE USBoutput ======
            if (check_ref(@TypeOf(EnableUSBValue), EnableUSBValue, .true, .@"=")) {
                USBoutput.nodetype = .output;
                USBoutput.parents = &.{&USBMult};
            }
            // ======= NODE SPDIFMult ======
            if (check_ref(@TypeOf(EnableSPDIFValue), EnableSPDIFValue, .true, .@"=")) {
                SPDIFMult.nodetype = .multi;
                SPDIFMult.parents = switch (SPDIFCLockSelectionValue) {
                    .RCC_SPDIFRXCLKSOURCE_PLLR => &.{&PLLR},
                    .RCC_SPDIFRXCLKSOURCE_PLLI2SP => &.{&PLLI2SP},
                };
            }
            // ======= NODE SPDIFoutput ======
            if (check_ref(@TypeOf(EnableSPDIFValue), EnableSPDIFValue, .true, .@"=")) {
                SPDIFoutput.nodetype = .output;
                SPDIFoutput.parents = &.{&SPDIFMult};
            }
            // ======= NODE SDIOMult ======
            if (check_ref(@TypeOf(EnableSDIOValue), EnableSDIOValue, .true, .@"=")) {
                SDIOMult.nodetype = .multi;
                SDIOMult.parents = switch (SDIOCLockSelectionValue) {
                    .RCC_SDIOCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_SDIOCLKSOURCE_CLK48 => &.{&USBMult},
                };
            }
            // ======= NODE SDIOoutput ======
            if (check_ref(@TypeOf(EnableSDIOValue), EnableSDIOValue, .true, .@"=")) {
                SDIOoutput.nodetype = .output;
                SDIOoutput.parents = &.{&SDIOMult};
            }
            // ======= NODE SAIAMult ======
            if (check_ref(@TypeOf(EnableSAIAValue), EnableSAIAValue, .true, .@"=")) {
                SAIAMult.nodetype = .multi;
                SAIAMult.parents = switch (SAIACLockSelectionValue) {
                    .RCC_SAI1CLKSOURCE_EXT => &.{&I2S_CKIN},
                    .RCC_SAI1CLKSOURCE_PLLR => &.{&PLLR},
                    .RCC_SAI1CLKSOURCE_PLLI2S => &.{&PLLI2SQDiv},
                    .RCC_SAI1CLKSOURCE_PLLSAI => &.{&PLLSAIQDiv},
                };
            }
            // ======= NODE SAIAoutput ======
            if (check_ref(@TypeOf(EnableSAIAValue), EnableSAIAValue, .true, .@"=")) {
                SAIAoutput.nodetype = .output;
                SAIAoutput.parents = &.{&SAIAMult};
            }
            // ======= NODE SAIBMult ======
            if (check_ref(@TypeOf(EnableSAIBValue), EnableSAIBValue, .true, .@"=")) {
                SAIBMult.nodetype = .multi;
                SAIBMult.parents = switch (SAIBCLockSelectionValue) {
                    .RCC_SAI2CLKSOURCE_PLLSRC => &.{&PLLSource},
                    .RCC_SAI2CLKSOURCE_PLLR => &.{&PLLR},
                    .RCC_SAI2CLKSOURCE_PLLI2S => &.{&PLLI2SQDiv},
                    .RCC_SAI2CLKSOURCE_PLLSAI => &.{&PLLSAIQDiv},
                };
            }
            // ======= NODE SAIBoutput ======
            if (check_ref(@TypeOf(EnableSAIBValue), EnableSAIBValue, .true, .@"=")) {
                SAIBoutput.nodetype = .output;
                SAIBoutput.parents = &.{&SAIBMult};
            }
            // ======= NODE I2S1Mult ======
            if (check_ref(@TypeOf(EnableI2S1Value), EnableI2S1Value, .true, .@"=")) {
                I2S1Mult.nodetype = .multi;
                I2S1Mult.parents = switch (I2S1CLockSelectionValue) {
                    .RCC_I2SAPB1CLKSOURCE_PLLSRC => &.{&PLLSource},
                    .RCC_I2SAPB1CLKSOURCE_PLLR => &.{&PLLR},
                    .RCC_I2SAPB1CLKSOURCE_EXT => &.{&I2S_CKIN},
                    .RCC_I2SAPB1CLKSOURCE_PLLI2S => &.{&PLLI2SR},
                };
            }
            // ======= NODE I2S1output ======
            if (check_ref(@TypeOf(EnableI2S1Value), EnableI2S1Value, .true, .@"=")) {
                I2S1output.nodetype = .output;
                I2S1output.parents = &.{&I2S1Mult};
            }
            // ======= NODE I2S2Mult ======
            if (check_ref(@TypeOf(EnableI2S2Value), EnableI2S2Value, .true, .@"=")) {
                I2S2Mult.nodetype = .multi;
                I2S2Mult.parents = switch (I2S2CLockSelectionValue) {
                    .RCC_I2SAPB2CLKSOURCE_PLLSRC => &.{&PLLSource},
                    .RCC_I2SAPB2CLKSOURCE_PLLR => &.{&PLLR},
                    .RCC_I2SAPB2CLKSOURCE_EXT => &.{&I2S_CKIN},
                    .RCC_I2SAPB2CLKSOURCE_PLLI2S => &.{&PLLI2SR},
                };
            }
            // ======= NODE I2S2output ======
            if (check_ref(@TypeOf(EnableI2S2Value), EnableI2S2Value, .true, .@"=")) {
                I2S2output.nodetype = .output;
                I2S2output.parents = &.{&I2S2Mult};
            }
            // ======= NODE MCO1Mult ======
            if (check_ref(@TypeOf(MCO1OutPutEnableValue), MCO1OutPutEnableValue, .true, .@"=")) {
                MCO1Mult.nodetype = .multi;
                MCO1Mult.parents = switch (RCC_MCO1SourceValue) {
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_PLLCLK => &.{&PLLP},
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
                    .RCC_MCO2SOURCE_SYSCLK => &.{&SysClkSource},
                    .RCC_MCO2SOURCE_PLLI2SCLK => &.{&PLLI2SR},
                    .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO2SOURCE_PLLCLK => &.{&PLLP},
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
            PLLP.nodetype = .div;
            PLLP.value = try PLLPValue.get();
            PLLP.parents = &.{&PLLN};

            // ======= NODE PLLQ ======
            if (check_ref(@TypeOf(EnableUSBValue), EnableUSBValue, .true, .@"=") or check_ref(@TypeOf(EnableSDIOValue), EnableSDIOValue, .true, .@"=")) {
                PLLQ.nodetype = .div;
                PLLQ.value = @floatFromInt(PLLQValue);
                PLLQ.parents = &.{&PLLN};
            }
            // ======= NODE PLLR ======
            PLLR.nodetype = .div;
            PLLR.value = @floatFromInt(PLLRValue);
            PLLR.parents = &.{&PLLN};

            // ======= NODE PLLSAIN ======
            PLLSAIN.nodetype = .mul;
            PLLSAIN.value = @floatFromInt(PLLSAINValue);
            PLLSAIN.parents = &.{&PLLSAIM};

            // ======= NODE PLLSAIP ======
            if (check_ref(@TypeOf(EnableUSBValue), EnableUSBValue, .true, .@"=") or check_ref(@TypeOf(EnableSDIOValue), EnableSDIOValue, .true, .@"=")) {
                PLLSAIP.nodetype = .div;
                PLLSAIP.value = try PLLSAIPValue.get();
                PLLSAIP.parents = &.{&PLLSAIN};
            }
            // ======= NODE PLLSAIoutput ======
            if (check_ref(@TypeOf(EnableUSBValue), EnableUSBValue, .true, .@"=") or check_ref(@TypeOf(EnableSDIOValue), EnableSDIOValue, .true, .@"=")) {
                PLLSAIoutput.nodetype = .output;
                PLLSAIoutput.parents = &.{&PLLSAIP};
            }
            // ======= NODE PLLSAIQ ======
            if (check_ref(@TypeOf(EnableSAIBValue), EnableSAIBValue, .true, .@"=") or check_ref(@TypeOf(EnableSAIAValue), EnableSAIAValue, .true, .@"=")) {
                PLLSAIQ.nodetype = .div;
                PLLSAIQ.value = @floatFromInt(PLLSAIQValue);
                PLLSAIQ.parents = &.{&PLLSAIN};
            }
            // ======= NODE PLLSAIQDiv ======
            if (check_ref(@TypeOf(EnableSAIBValue), EnableSAIBValue, .true, .@"=") or check_ref(@TypeOf(EnableSAIAValue), EnableSAIAValue, .true, .@"=")) {
                PLLSAIQDiv.nodetype = .div;
                PLLSAIQDiv.value = @floatFromInt(PLLSAIQDivValue);
                PLLSAIQDiv.parents = &.{&PLLSAIQ};
            }
            // ======= NODE PLLI2SN ======
            PLLI2SN.nodetype = .mul;
            PLLI2SN.value = @floatFromInt(PLLI2SNValue);
            PLLI2SN.parents = &.{&PLLI2SM};

            // ======= NODE PLLI2SP ======
            if (check_ref(@TypeOf(EnableSPDIFValue), EnableSPDIFValue, .true, .@"=")) {
                PLLI2SP.nodetype = .div;
                PLLI2SP.value = try PLLI2SPValue.get();
                PLLI2SP.parents = &.{&PLLI2SN};
            }
            // ======= NODE PLLI2Soutput ======
            if (check_ref(@TypeOf(EnableSPDIFValue), EnableSPDIFValue, .true, .@"=")) {
                PLLI2Soutput.nodetype = .output;
                PLLI2Soutput.parents = &.{&PLLI2SP};
            }
            // ======= NODE PLLI2SQ ======
            if (check_ref(@TypeOf(EnableSAIBValue), EnableSAIBValue, .true, .@"=") or check_ref(@TypeOf(EnableSAIAValue), EnableSAIAValue, .true, .@"=")) {
                PLLI2SQ.nodetype = .div;
                PLLI2SQ.value = @floatFromInt(PLLI2SQValue);
                PLLI2SQ.parents = &.{&PLLI2SN};
            }
            // ======= NODE PLLI2SQDiv ======
            if (check_ref(@TypeOf(EnableSAIBValue), EnableSAIBValue, .true, .@"=") or check_ref(@TypeOf(EnableSAIAValue), EnableSAIAValue, .true, .@"=")) {
                PLLI2SQDiv.nodetype = .div;
                PLLI2SQDiv.value = @floatFromInt(PLLI2SQDivValue);
                PLLI2SQDiv.parents = &.{&PLLI2SQ};
            }
            // ======= NODE PLLI2SR ======
            if (check_ref(@TypeOf(EnableI2S2Value), EnableI2S2Value, .true, .@"=") or check_ref(@TypeOf(EnableI2S1Value), EnableI2S1Value, .true, .@"=") or check_ref(@TypeOf(MCO2OutPutEnableValue), MCO2OutPutEnableValue, .true, .@"=")) {
                PLLI2SR.nodetype = .div;
                PLLI2SR.value = @floatFromInt(PLLI2SRValue);
                PLLI2SR.parents = &.{&PLLI2SN};
            }
            // ======= NODE VCOInput ======
            VCOInput.nodetype = .output;
            VCOInput.parents = &.{&PLLM};

            // ======= NODE VCOOutput ======
            VCOOutput.nodetype = .output;
            VCOOutput.parents = &.{&PLLN};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLLP};

            // ======= NODE PLLQCLK ======
            PLLQCLK.nodetype = .output;
            PLLQCLK.parents = &.{&PLLQ};

            // ======= NODE PLLRCLK ======
            PLLRCLK.nodetype = .output;
            PLLRCLK.parents = &.{&PLLR};

            // ======= NODE VCOSAIInput ======
            VCOSAIInput.nodetype = .output;
            VCOSAIInput.parents = &.{&PLLSAIM};

            // ======= NODE VCOSAIOutput ======
            VCOSAIOutput.nodetype = .output;
            VCOSAIOutput.parents = &.{&PLLSAIN};

            // ======= NODE PLLSAIPCLK ======
            PLLSAIPCLK.nodetype = .output;
            PLLSAIPCLK.parents = &.{&PLLSAIP};

            // ======= NODE PLLSAIQCLK ======
            PLLSAIQCLK.nodetype = .output;
            PLLSAIQCLK.parents = &.{&PLLSAIQ};

            // ======= NODE VCOI2SInput ======
            VCOI2SInput.nodetype = .output;
            VCOI2SInput.parents = &.{&PLLI2SM};

            // ======= NODE VCOI2SOutput ======
            VCOI2SOutput.nodetype = .output;
            VCOI2SOutput.parents = &.{&PLLI2SN};

            // ======= NODE PLLI2SPCLK ======
            PLLI2SPCLK.nodetype = .output;
            PLLI2SPCLK.parents = &.{&PLLI2SP};

            // ======= NODE PLLI2SRCLK ======
            PLLI2SRCLK.nodetype = .output;
            PLLI2SRCLK.parents = &.{&PLLI2SR};

            // ======= NODE PLLI2SQCLK ======
            PLLI2SQCLK.nodetype = .output;
            PLLI2SQCLK.parents = &.{&PLLI2SQ};

            //======== POST REFS ========

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 1.8e8,
            };

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RCC_RTC_Clock_SourceVirtualValue), RCC_RTC_Clock_SourceVirtualValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RCC_RTC_Clock_SourceVirtualValue), RCC_RTC_Clock_SourceVirtualValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) {
                RTCOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECOutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);

            //======= FMPI2C1Freq_Value ========
            const FMPI2C1Freq_ValueValue = FMPI2C1output.get_as_ref();
            ignore_value(FMPI2C1Freq_ValueValue);

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);
            if (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) {
                USBoutput.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                };
            }

            //======= SPDIFRXFreq_Value ========
            const SPDIFRXFreq_ValueValue = SPDIFoutput.get_as_ref();
            ignore_value(SPDIFRXFreq_ValueValue);

            SPDIFoutput.limit = .{
                .min = 5.632e6,
                .max = null,
            };

            //======= SDIOFreq_Value ========
            const SDIOFreq_ValueValue = SDIOoutput.get_as_ref();
            ignore_value(SDIOFreq_ValueValue);

            SDIOoutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= SAIAFreq_Value ========
            const SAIAFreq_ValueValue = SAIAoutput.get_as_ref();
            ignore_value(SAIAFreq_ValueValue);

            //======= SAIBFreq_Value ========
            const SAIBFreq_ValueValue = SAIBoutput.get_as_ref();
            ignore_value(SAIBFreq_ValueValue);

            //======= I2S1Freq_Value ========
            const I2S1Freq_ValueValue = I2S1output.get_as_ref();
            ignore_value(I2S1Freq_ValueValue);

            I2S1output.limit = .{
                .min = null,
                .max = 1.92e8,
            };

            //======= I2S2Freq_Value ========
            const I2S2Freq_ValueValue = I2S2output.get_as_ref();
            ignore_value(I2S2Freq_ValueValue);

            I2S2output.limit = .{
                .min = null,
                .max = 1.92e8,
            };

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCO1Pin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            MCO1Pin.limit = .{
                .min = null,
                .max = 1e8,
            };

            //======= MCO2PinFreq_Value ========
            const MCO2PinFreq_ValueValue = MCO2Pin.get_as_ref();
            ignore_value(MCO2PinFreq_ValueValue);

            MCO2Pin.limit = .{
                .min = null,
                .max = 1e8,
            };

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if ((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) {
                AHBOutput.limit = .{
                    .min = 3e7,
                    .max = 1.8e8,
                };
            } else if (config.flags.USB_OTG_FSUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 1.42e7,
                    .max = 1.8e8,
                };
            } else {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 1.8e8,
                };
            }

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);
            if (config.flags.RTCUsed_ForRCC) {
                const max_APB1Output = 45000000;
                const min_APB1Output = try math_op(?@TypeOf(RTCFreq_ValueValue), RTCFreq_ValueValue, 4, .@"*", "RTCFreq_Value");

                APB1Output.limit = .{
                    .min = min_APB1Output,
                    .max = max_APB1Output,
                    .min_expr = "=RTCFreq_Value*4",
                    .max_expr = "45000000",
                };
            } else {
                APB1Output.limit = .{
                    .min = null,
                    .max = 4.5e7,
                };
            }

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 9e7,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= PLLSAIoutputFreq_Value ========
            const PLLSAIoutputFreq_ValueValue = PLLSAIoutput.get_as_ref();
            ignore_value(PLLSAIoutputFreq_ValueValue);
            if ((USBSourceisPLLSAIP and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or (SDIOSourceIsClock48 and config.flags.SDIOUsed_ForRCC)))) {
                PLLSAIoutput.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLI2SoutputFreq_Value ========
            const PLLI2SoutputFreq_ValueValue = PLLI2Soutput.get_as_ref();
            ignore_value(PLLI2SoutputFreq_ValueValue);
            if ((config.flags.MCO2Config and MCOSourceIsPLLI2SP) or SPDIFSourceisPLLI2SP and config.flags.SPDIFRXUsed_ForRCC) {
                PLLI2Soutput.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or (SysSourceIsPLLclk or SysSourceIsPLLR) or ((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_FSUsed_ForRCC) and USBSourceisPLLQ) or (USBSourceisPLLQ and SDIOSourceIsClock48 and config.flags.SDIOUsed_ForRCC) or ((config.flags.SAI1Used_ForRCC) and SAIASourceIsPLLR) or ((config.flags.SAI2Used_ForRCC) and SAIBSourceIsPLLR) or (((config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) or config.flags.I2S1Used_ForRCC) and (I2S1SourceIsPllR or I2S2SourceIsPllR)) or (config.flags.SPDIFRXUsed_ForRCC and SPDIFSourceisPLLR)) {
                VCOInput.limit = .{
                    .min = 9.5e5,
                    .max = 2.1e6,
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or (SysSourceIsPLLclk or SysSourceIsPLLR) or ((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_FSUsed_ForRCC) and USBSourceisPLLQ) or (USBSourceisPLLQ and SDIOSourceIsClock48 and config.flags.SDIOUsed_ForRCC) or ((config.flags.SAI1Used_ForRCC) and SAIASourceIsPLLR) or ((config.flags.SAI2Used_ForRCC) and SAIBSourceIsPLLR) or (((config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) or config.flags.I2S1Used_ForRCC) and (I2S1SourceIsPllR or I2S2SourceIsPllR)) or (config.flags.SPDIFRXUsed_ForRCC and SPDIFSourceisPLLR)) {
                VCOOutput.limit = .{
                    .min = 1e8,
                    .max = 4.32e8,
                };
            }

            //======= PLLCLKFreq_Value ========
            const PLLCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or SysSourceIsPLLclk) {
                PLLCLK.limit = .{
                    .min = 2.4e7,
                    .max = 1.8e8,
                };
            }

            //======= PLLQCLKFreq_Value ========
            const PLLQCLKFreq_ValueValue = PLLQCLK.get_as_ref();
            ignore_value(PLLQCLKFreq_ValueValue);
            if (((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_FSUsed_ForRCC or (SDIOSourceIsClock48 and config.flags.SDIOUsed_ForRCC)) and USBSourceisPLLQ)) {
                PLLQCLK.limit = .{
                    .min = null,
                    .max = 7.5e7,
                };
            }

            //======= PLLRCLKFreq_Value ========
            const PLLRCLKFreq_ValueValue = PLLRCLK.get_as_ref();
            ignore_value(PLLRCLKFreq_ValueValue);
            if (SysSourceIsPLLR or ((config.flags.SAI1Used_ForRCC) and SAIASourceIsPLLR) or ((config.flags.SAI2Used_ForRCC) and SAIBSourceIsPLLR) or (((config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) or config.flags.I2S1Used_ForRCC) and (I2S1SourceIsPllR or I2S2SourceIsPllR)) or (config.flags.SPDIFRXUsed_ForRCC and SPDIFSourceisPLLR)) {
                PLLRCLK.limit = .{
                    .min = 2.4e7,
                    .max = 1.8e8,
                };
            }

            //======= VCOSAIInputFreq_Value ========
            const VCOSAIInputFreq_ValueValue = VCOSAIInput.get_as_ref();
            ignore_value(VCOSAIInputFreq_ValueValue);
            if ((USBSourceisPLLSAIP and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or (SDIOSourceIsClock48 and config.flags.SDIOUsed_ForRCC))) or (SAIASourceIsPLLSAI and config.flags.SAI1Used_ForRCC) or (SAIBSourceIsPLLSAI and config.flags.SAI2Used_ForRCC)) {
                VCOSAIInput.limit = .{
                    .min = 9.5e5,
                    .max = 2.1e6,
                };
            }

            //======= VCOSAIOutputFreq_Value ========
            const VCOSAIOutputFreq_ValueValue = VCOSAIOutput.get_as_ref();
            ignore_value(VCOSAIOutputFreq_ValueValue);
            if ((USBSourceisPLLSAIP and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or (SDIOSourceIsClock48 and config.flags.SDIOUsed_ForRCC))) or (SAIASourceIsPLLSAI and config.flags.SAI1Used_ForRCC) or (SAIBSourceIsPLLSAI and config.flags.SAI2Used_ForRCC)) {
                VCOSAIOutput.limit = .{
                    .min = 1e8,
                    .max = 4.32e8,
                };
            }

            //======= PLLSAIPCLKFreq_Value ========
            const PLLSAIPCLKFreq_ValueValue = PLLSAIPCLK.get_as_ref();
            ignore_value(PLLSAIPCLKFreq_ValueValue);
            if ((USBSourceisPLLSAIP and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or (SDIOSourceIsClock48 and config.flags.SDIOUsed_ForRCC)))) {
                PLLSAIPCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLSAIQCLKFreq_Value ========
            const PLLSAIQCLKFreq_ValueValue = PLLSAIQCLK.get_as_ref();
            ignore_value(PLLSAIQCLKFreq_ValueValue);
            if ((SAIASourceIsPLLSAI and config.flags.SAI1Used_ForRCC) or (SAIBSourceIsPLLSAI and config.flags.SAI2Used_ForRCC)) {
                PLLSAIQCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= VCOI2SInputFreq_Value ========
            const VCOI2SInputFreq_ValueValue = VCOI2SInput.get_as_ref();
            ignore_value(VCOI2SInputFreq_ValueValue);
            if ((config.flags.MCO2Config and MCOSourceIsPLLI2SP) or (SPDIFSourceisPLLI2SP and config.flags.SPDIFRXUsed_ForRCC) or (I2S1SourceIsPLLI2SR and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or (I2S2SourceIsPLLI2SR and config.flags.I2S1Used_ForRCC) or (SAIASourceIsPLLI2SQ and config.flags.SAI1Used_ForRCC) or (SAIBSourceIsPLLI2SQ and config.flags.SAI2Used_ForRCC)) {
                VCOI2SInput.limit = .{
                    .min = 9.5e5,
                    .max = 2.1e6,
                };
            }

            //======= VCOI2SOutputFreq_Value ========
            const VCOI2SOutputFreq_ValueValue = VCOI2SOutput.get_as_ref();
            ignore_value(VCOI2SOutputFreq_ValueValue);
            if ((config.flags.MCO2Config and MCOSourceIsPLLI2SP) or (SPDIFSourceisPLLI2SP and config.flags.SPDIFRXUsed_ForRCC) or (I2S1SourceIsPLLI2SR and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or (I2S2SourceIsPLLI2SR and config.flags.I2S1Used_ForRCC) or (SAIASourceIsPLLI2SQ and config.flags.SAI1Used_ForRCC) or (SAIBSourceIsPLLI2SQ and config.flags.SAI2Used_ForRCC)) {
                VCOI2SOutput.limit = .{
                    .min = 1e8,
                    .max = 4.32e8,
                };
            }

            //======= PLLI2SPCLKFreq_Value ========
            const PLLI2SPCLKFreq_ValueValue = PLLI2SPCLK.get_as_ref();
            ignore_value(PLLI2SPCLKFreq_ValueValue);
            if ((config.flags.MCO2Config and MCOSourceIsPLLI2SP) or SPDIFSourceisPLLI2SP and config.flags.SPDIFRXUsed_ForRCC) {
                PLLI2SPCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLI2SRCLKFreq_Value ========
            const PLLI2SRCLKFreq_ValueValue = PLLI2SRCLK.get_as_ref();
            ignore_value(PLLI2SRCLKFreq_ValueValue);
            if ((I2S1SourceIsPLLI2SR and (config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or (I2S2SourceIsPLLI2SR and config.flags.I2S1Used_ForRCC)) {
                PLLI2SRCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLI2SQCLKFreq_Value ========
            const PLLI2SQCLKFreq_ValueValue = PLLI2SQCLK.get_as_ref();
            ignore_value(PLLI2SQCLKFreq_ValueValue);
            if ((SAIASourceIsPLLI2SQ and config.flags.SAI1Used_ForRCC) or (SAIBSourceIsPLLI2SQ and config.flags.SAI2Used_ForRCC)) {
                PLLI2SQCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            const VDD_VALUEValue: f32 = blk: {
                if ((check_ref(@TypeOf(config.extra_config.PWREXT_OverDrive), config.extra_config.PWREXT_OverDrive, .PWREXT_OverDrive_ACTIVATED, .@"="))) {
                    const user_val = config.extra_config.VDD_VALUE;
                    if (user_val) |val| {
                        if (val < 2.1e0) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Underflow Value - min: {e} found: {e}
                                \\note: ranges values may change depending on the configuration
                                \\
                            , .{
                                "VDD_VALUE",
                                "(PWREXT_OverDrive=PWREXT_OverDrive_ACTIVATED) ",
                                "",
                                2.1e0,
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
                                "(PWREXT_OverDrive=PWREXT_OverDrive_ACTIVATED) ",
                                "",
                                3.6e0,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 3.3e0;
                }
                const user_val = config.extra_config.VDD_VALUE;
                if (user_val) |val| {
                    if (val < 1.7e0) {
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
                            1.7e0,
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

            const PWREXT_OverDriveValue: PWREXT_OverDriveList = blk: {
                if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@">"))) {
                    if (config.extra_config.PWREXT_OverDrive) |val| {
                        if (val != .PWREXT_OverDrive_ACTIVATED) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PWREXT_OverDrive",
                                "(HCLKFreq_Value > 168000000) ",
                                "",
                                "PWREXT_OverDrive_ACTIVATED",
                                val,
                            });
                        }
                    }
                    break :blk .PWREXT_OverDrive_ACTIVATED;
                } else if (((check_ref(@TypeOf(config.extra_config.VDD_VALUE), config.extra_config.VDD_VALUE, 1.7, .@">")) and (check_ref(@TypeOf(config.extra_config.VDD_VALUE), config.extra_config.VDD_VALUE, 2.1, .@"<")))) {
                    if (config.extra_config.PWREXT_OverDrive) |val| {
                        if (val != .PWREXT_OverDrive_DESACTIVATED) {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PWREXT_OverDrive",
                                "((VDD_VALUE>1.7)&(VDD_VALUE<2.1))",
                                "",
                                "PWREXT_OverDrive_DESACTIVATED",
                                val,
                            });
                        }
                    }
                    break :blk .PWREXT_OverDrive_DESACTIVATED;
                }
                const user_val = config.extra_config.PWREXT_OverDrive;

                if (user_val) |val| {
                    switch (val) {
                        .PWREXT_OverDrive_DESACTIVATED => {},
                        .PWREXT_OverDrive_ACTIVATED => {},
                    }
                }
                break :blk user_val orelse .PWREXT_OverDrive_DESACTIVATED;
            };

            const PREFETCH_ENABLEValue: PREFETCH_ENABLEList = blk: {
                if ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) and (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<"))) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"=")))) {
                    if (config.extra_config.PREFETCH_ENABLE) |val| {
                        if (val != .@"0") {
                            return comptime_fail_or_error(error.InvalidConfig,
                                \\
                                \\Error on {s} | expr: {s} diagnostic: {s} 
                                \\Expected Fixed Value: {s} found: {any}
                                \\note: some values are fixed depending on the clock configuration.
                                \\
                                \\
                            , .{
                                "PREFETCH_ENABLE",
                                "(((VDD_VALUE > 1.8) & (VDD_VALUE < 2.1))|(VDD_VALUE=1.8))",
                                "",
                                "0",
                                val,
                            });
                        }
                    }
                    break :blk .@"0";
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

            const FLatencyValue: FLatencyList = blk: {
                if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 30000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 30000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 22000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 22000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 20000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 20000000, .@"=")))))) {
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7)) & ((VDD_VALUE < 3.6)|(VDD_VALUE =3.6))) &  ((HCLKFreq_Value > 0) & ((HCLKFreq_Value < 30000000)|(HCLKFreq_Value =30000000))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4))  & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 0) & ((HCLKFreq_Value < 24000000)|(HCLKFreq_Value =24000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1))  & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 0) & ((HCLKFreq_Value < 22000000)|(HCLKFreq_Value= 22000000))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8))   & ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 0) & ((HCLKFreq_Value < 20000000)|(HCLKFreq_Value =20000000))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_0;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 30000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 22000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 44000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 44000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 20000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 40000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 40000000, .@"=")))))) {
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7))  & ((VDD_VALUE < 3.6)|(VDD_VALUE =3.6 ))) & ((HCLKFreq_Value > 30000000) &  ((HCLKFreq_Value < 60000000)|(HCLKFreq_Value= 60000000))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4 ))  & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 24000000) &  ((HCLKFreq_Value < 48000000)|(HCLKFreq_Value= 48000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1 ))  & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 22000000) &  ((HCLKFreq_Value < 44000000)|(HCLKFreq_Value =44000000))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8  ))  & ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 20000000) &  ((HCLKFreq_Value < 40000000)|(HCLKFreq_Value=40000000 ))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 72000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 72000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 44000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 66000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 66000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 40000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@"=")))))) {
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7 )) &  ((VDD_VALUE < 3.6)|(VDD_VALUE =3.6 ))) & ((HCLKFreq_Value > 60000000) & ((HCLKFreq_Value < 90000000)|(HCLKFreq_Value = 90000000))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4  ))  & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 48000000) & ((HCLKFreq_Value < 72000000)|(HCLKFreq_Value = 72000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1  ))  & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 44000000) & ((HCLKFreq_Value < 66000000)|(HCLKFreq_Value= 66000000 ))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8   ))   &((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 40000000) & ((HCLKFreq_Value < 60000000)|(HCLKFreq_Value= 60000000 ))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_2;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 90000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 72000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 96000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 96000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 66000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 88000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 88000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 60000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 80000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 80000000, .@"=")))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_3) {
                            const patch_str = if (patch_logs) "WS3" else "FLASH_LATENCY_3";
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7)) & ((VDD_VALUE < 3.6)|(VDD_VALUE =3.6 )))&  ((HCLKFreq_Value > 90000000) & ((HCLKFreq_Value < 120000000)|(HCLKFreq_Value = 120000000))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4 )) & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 72000000) & ((HCLKFreq_Value < 96000000)|(HCLKFreq_Value=   96000000 ))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1 )) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 66000000) & ((HCLKFreq_Value < 88000000)|(HCLKFreq_Value =  88000000 ))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8  )) & ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 60000000) & ((HCLKFreq_Value < 80000000)|(HCLKFreq_Value= 80000000   ))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_3;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 96000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 88000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 80000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 100000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 100000000, .@"=")))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_4) {
                            const patch_str = if (patch_logs) "WS4" else "FLASH_LATENCY_4";
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE =3.6  ))) & ((HCLKFreq_Value > 120000000) &  ((HCLKFreq_Value < 150000000)|(HCLKFreq_Value= 150000000 ))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4 )) &  ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7 ))) & ((HCLKFreq_Value > 96000000) &   ((HCLKFreq_Value < 120000000)|(HCLKFreq_Value = 120000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1 )) &  ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4 ))) & ((HCLKFreq_Value > 88000000) &   ((HCLKFreq_Value < 110000000)|(HCLKFreq_Value= 110000000 ))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8  )) &  ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1 ))) & ((HCLKFreq_Value > 80000000) &   ((HCLKFreq_Value < 100000000)|(HCLKFreq_Value =100000000 ))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_4;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@">"))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 132000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 132000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 100000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"=")))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_5) {
                            const patch_str = if (patch_logs) "WS5" else "FLASH_LATENCY_5";
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE =3.6   ))) &  (HCLKFreq_Value > 150000000))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4 )) &   ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7 ))) & ((HCLKFreq_Value > 120000000) & ((HCLKFreq_Value < 144000000)|(HCLKFreq_Value =144000000  ))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1 )) &   ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4 ))) & ((HCLKFreq_Value > 110000000) & ((HCLKFreq_Value < 132000000)|(HCLKFreq_Value = 132000000 ))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8  )) &    ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 100000000) & ((HCLKFreq_Value < 120000000)|(HCLKFreq_Value = 120000000 ))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_5;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 132000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 154000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 154000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"=")))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_6) {
                            const patch_str = if (patch_logs) "WS6" else "FLASH_LATENCY_6";
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
                                "\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4)) & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 144000000) & ((HCLKFreq_Value < 168000000)|(HCLKFreq_Value = 168000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1)) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 132000000) & ((HCLKFreq_Value < 154000000)|(HCLKFreq_Value = 154000000))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8)) &  ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 120000000) & ((HCLKFreq_Value < 140000000)|(HCLKFreq_Value = 140000000))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_6;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@">"))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 154000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 176000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 176000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@"=")))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_7) {
                            const patch_str = if (patch_logs) "WS7" else "FLASH_LATENCY_7";
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
                                "\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4)) & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & (HCLKFreq_Value >  168000000))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1)) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 154000000) & ((HCLKFreq_Value < 176000000)|(HCLKFreq_Value = 176000000))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8)) &  ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 140000000) & ((HCLKFreq_Value < 160000000)|(HCLKFreq_Value = 160000000))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_7;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 176000000, .@">"))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@">")))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_8) {
                            const patch_str = if (patch_logs) "WS8" else "FLASH_LATENCY_8";
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
                                "\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1)) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & (HCLKFreq_Value > 176000000))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8)) &  ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & (HCLKFreq_Value > 160000000))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_8;
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
                        .FLASH_LATENCY_8 => {},
                    }
                }
                break :blk user_val orelse .FLASH_LATENCY_0;
            };

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@">")))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE1) {
                            const patch_str = if (patch_logs) "SCALE1" else "PWR_REGULATOR_VOLTAGE_SCALE1";
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
                                "((HCLKFreq_Value > 168000000))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if (((check_ref(@TypeOf(PWREXT_OverDriveValue), PWREXT_OverDriveValue, .PWREXT_OverDrive_DESACTIVATED, .@"=")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@">")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@"="))))) {
                    if (config.extra_config.PWR_Regulator_Voltage_Scale) |val| {
                        if (val != .PWR_REGULATOR_VOLTAGE_SCALE1) {
                            const patch_str = if (patch_logs) "SCALE1" else "PWR_REGULATOR_VOLTAGE_SCALE1";
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
                                "((PWREXT_OverDrive=PWREXT_OverDrive_DESACTIVATED)&((HCLKFreq_Value > 144000000)|(HCLKFreq_Value=144000000)))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@">"))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => {},
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
                                    "(HCLKFreq_Value > 120000000)",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "SCALE2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                    if (patch_logs) "SCALE1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .PWR_REGULATOR_VOLTAGE_SCALE2;
                }
                const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                if (user_val) |val| {
                    switch (val) {
                        .PWR_REGULATOR_VOLTAGE_SCALE3 => {},
                        .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
                        .PWR_REGULATOR_VOLTAGE_SCALE1 => {},
                    }
                }
                break :blk user_val orelse .PWR_REGULATOR_VOLTAGE_SCALE3;
            };
            out.HSIRC = try HSIRC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.PLLM = try PLLM.get_output();
            out.PLLSAIM = try PLLSAIM.get_output();
            out.PLLI2SM = try PLLI2SM.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.HSIDivCEC = try HSIDivCEC.get_output();
            out.CECMult = try CECMult.get_output();
            out.CECOutput = try CECOutput.get_output();
            out.FMPI2C1Mult = try FMPI2C1Mult.get_output();
            out.FMPI2C1output = try FMPI2C1output.get_output();
            out.USBMult = try USBMult.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.SPDIFMult = try SPDIFMult.get_output();
            out.SPDIFoutput = try SPDIFoutput.get_output();
            out.SDIOMult = try SDIOMult.get_output();
            out.SDIOoutput = try SDIOoutput.get_output();
            out.SAIAMult = try SAIAMult.get_output();
            out.SAIAoutput = try SAIAoutput.get_output();
            out.SAIBMult = try SAIBMult.get_output();
            out.SAIBoutput = try SAIBoutput.get_output();
            out.I2S1Mult = try I2S1Mult.get_output();
            out.I2S1output = try I2S1output.get_output();
            out.I2S2Mult = try I2S2Mult.get_output();
            out.I2S2output = try I2S2output.get_output();
            out.MCO1Mult = try MCO1Mult.get_output();
            out.MCO1Div = try MCO1Div.get_output();
            out.MCO1Pin = try MCO1Pin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
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
            out.PLLQ = try PLLQ.get_output();
            out.PLLR = try PLLR.get_output();
            out.PLLSAIN = try PLLSAIN.get_output();
            out.PLLSAIP = try PLLSAIP.get_output();
            out.PLLSAIoutput = try PLLSAIoutput.get_output();
            out.PLLSAIQ = try PLLSAIQ.get_output();
            out.PLLSAIQDiv = try PLLSAIQDiv.get_output();
            out.PLLI2SN = try PLLI2SN.get_output();
            out.PLLI2SP = try PLLI2SP.get_output();
            out.PLLI2Soutput = try PLLI2Soutput.get_output();
            out.PLLI2SQ = try PLLI2SQ.get_output();
            out.PLLI2SQDiv = try PLLI2SQDiv.get_output();
            out.PLLI2SR = try PLLI2SR.get_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.PLLQCLK = try PLLQCLK.get_extra_output();
            out.PLLRCLK = try PLLRCLK.get_extra_output();
            out.VCOSAIInput = try VCOSAIInput.get_extra_output();
            out.VCOSAIOutput = try VCOSAIOutput.get_extra_output();
            out.PLLSAIPCLK = try PLLSAIPCLK.get_extra_output();
            out.PLLSAIQCLK = try PLLSAIQCLK.get_extra_output();
            out.VCOI2SInput = try VCOI2SInput.get_extra_output();
            out.VCOI2SOutput = try VCOI2SOutput.get_extra_output();
            out.PLLI2SPCLK = try PLLI2SPCLK.get_extra_output();
            out.PLLI2SRCLK = try PLLI2SRCLK.get_extra_output();
            out.PLLI2SQCLK = try PLLI2SQCLK.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLLM = PLLMValue;
            ref_out.PLLSAIM = PLLSAIMValue;
            ref_out.PLLI2SM = PLLI2SMValue;
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RCC_RTC_Clock_SourceVirtual = RCC_RTC_Clock_SourceVirtualValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.HSI_Div_CEC = HSI_Div_CECValue;
            ref_out.CECClockSelection = CECClockSelectionValue;
            ignore_value(CECFreq_ValueValue);
            ref_out.FMPI2C1Selection = FMPI2C1SelectionValue;
            ignore_value(FMPI2C1Freq_ValueValue);
            ref_out.USBCLockSelection = USBCLockSelectionValue;
            ignore_value(USBFreq_ValueValue);
            ref_out.SPDIFCLockSelection = SPDIFCLockSelectionValue;
            ignore_value(SPDIFRXFreq_ValueValue);
            ref_out.SDIOCLockSelection = SDIOCLockSelectionValue;
            ignore_value(SDIOFreq_ValueValue);
            ref_out.SAIACLockSelection = SAIACLockSelectionValue;
            ignore_value(SAIAFreq_ValueValue);
            ref_out.SAIBCLockSelection = SAIBCLockSelectionValue;
            ignore_value(SAIBFreq_ValueValue);
            ref_out.I2S1CLockSelection = I2S1CLockSelectionValue;
            ignore_value(I2S1Freq_ValueValue);
            ref_out.I2S2CLockSelection = I2S2CLockSelectionValue;
            ignore_value(I2S2Freq_ValueValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv1 = RCC_MCODiv1Value;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCODiv2 = RCC_MCODiv2Value;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
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
            ref_out.PLLQ = PLLQValue;
            ref_out.PLLR = PLLRValue;
            ref_out.PLLSAIN = PLLSAINValue;
            ref_out.PLLSAIP = PLLSAIPValue;
            ignore_value(PLLSAIoutputFreq_ValueValue);
            ref_out.PLLSAIQ = PLLSAIQValue;
            ref_out.PLLSAIQDiv = PLLSAIQDivValue;
            ref_out.PLLI2SN = PLLI2SNValue;
            ref_out.PLLI2SP = PLLI2SPValue;
            ignore_value(PLLI2SoutputFreq_ValueValue);
            ref_out.PLLI2SQ = PLLI2SQValue;
            ref_out.PLLI2SQDiv = PLLI2SQDivValue;
            ref_out.PLLI2SR = PLLI2SRValue;
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ignore_value(PLLQCLKFreq_ValueValue);
            ignore_value(PLLRCLKFreq_ValueValue);
            ignore_value(VCOSAIInputFreq_ValueValue);
            ignore_value(VCOSAIOutputFreq_ValueValue);
            ignore_value(PLLSAIPCLKFreq_ValueValue);
            ignore_value(PLLSAIQCLKFreq_ValueValue);
            ignore_value(VCOI2SInputFreq_ValueValue);
            ignore_value(VCOI2SOutputFreq_ValueValue);
            ignore_value(PLLI2SPCLKFreq_ValueValue);
            ignore_value(PLLI2SRCLKFreq_ValueValue);
            ignore_value(PLLI2SQCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_SelectionValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.PWREXT_OverDrive = PWREXT_OverDriveValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.CECEnable = CECEnableValue == .true;
            ref_out.flags.EnableFMPI2C1 = EnableFMPI2C1Value == .true;
            ref_out.flags.EnableUSB = EnableUSBValue == .true;
            ref_out.flags.EnableSDIO = EnableSDIOValue == .true;
            ref_out.flags.EnableSPDIF = EnableSPDIFValue == .true;
            ref_out.flags.EnableSAIA = EnableSAIAValue == .true;
            ref_out.flags.EnableSAIB = EnableSAIBValue == .true;
            ref_out.flags.EnableI2S1 = EnableI2S1Value == .true;
            ref_out.flags.EnableI2S2 = EnableI2S2Value == .true;
            ref_out.flags.MCO1OutPutEnable = MCO1OutPutEnableValue == .true;
            ref_out.flags.MCO2OutPutEnable = MCO2OutPutEnableValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.HSEUsed = HSEUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.LSIUsed = LSIUsedValue != 0;
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
