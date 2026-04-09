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
            CLK48 = 0,
            SYS = 1,
        };
        pub const RCC_SAISEL = enum(u2) {
            PLLSAI1_Q = 0,
            PLLI2S1_Q = 1,
            AFIF = 2,
            HSI_HSE = 3,
        };
        pub const RCC_I2CSEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
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
        pub const RCC_MCO1SEL = enum(u2) {
            HSI = 0,
            LSE = 1,
            HSE = 2,
            PLL = 3,
        };
        pub const RCC_ISSRC = enum(u1) {
            PLLI2S = 0,
            CKIN = 1,
        };
        pub const RCC_USART1SEL = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
        };
        pub const RCC_DSISEL = enum(u1) {
            DSI_PHY = 0,
            PLL1_R = 1,
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
        pub const RCC_ADFSDMSEL = enum(u1) {
            SAI1 = 0,
            SAI2 = 1,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumHigh = 1,
            MediumLow = 2,
            High = 3,
        };
        pub const RCC_TIMPRE = enum(u1) {
            Mul2 = 0,
            Mul4 = 1,
        };
        pub const RCC_DFSDMSEL = enum(u1) {
            PCLK2 = 0,
            SYS = 1,
        };
        pub const RCC_MCO2SEL = enum(u2) {
            SYS = 0,
            PLLI2S = 1,
            HSE = 2,
            PLL = 3,
        };
        pub const RCC_CLK48SEL = enum(u1) {
            PLL1_Q = 0,
            PLLSAI1_P = 1,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
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
        pub const RCC_LPTIMSEL = enum(u2) {
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
        pub const RCC_USART2SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSI = 2,
            LSE = 3,
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

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_P,
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .PLL1_P => .RCC_SYSCLKSOURCE_PLLCLK,
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

        pub const PLL48CLockSelectionList = enum {
            RCC_CLK48SOURCE_PLLSAIP,
            RCC_CLK48SOURCE_PLL,

            pub fn to_enum(self: @This()) anyerror!RCC_CLK48SEL {
                return switch (self) {
                    .RCC_CLK48SOURCE_PLL => .PLL1_Q,
                    .RCC_CLK48SOURCE_PLLSAIP => .PLLSAI1_P,
                };
            }
            pub fn from_enum(item: RCC_CLK48SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_CLK48SOURCE_PLL,
                    .PLLSAI1_P => .RCC_CLK48SOURCE_PLLSAIP,
                };
            }
        };

        pub const SAI1CLockSelectionList = enum {
            RCC_SAI1CLKSOURCE_PLLSAI,
            RCC_SAI1CLKSOURCE_PLLI2S,
            RCC_SAI1CLKSOURCE_PIN,
            RCC_SAI1CLKSOURCE_PLLSRC,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SAI1CLKSOURCE_PIN => .AFIF,
                    .RCC_SAI1CLKSOURCE_PLLSRC => .HSI_HSE,
                    .RCC_SAI1CLKSOURCE_PLLI2S => .PLLI2S1_Q,
                    .RCC_SAI1CLKSOURCE_PLLSAI => .PLLSAI1_Q,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .AFIF => .RCC_SAI1CLKSOURCE_PIN,
                    .HSI_HSE => .RCC_SAI1CLKSOURCE_PLLSRC,
                    .PLLI2S1_Q => .RCC_SAI1CLKSOURCE_PLLI2S,
                    .PLLSAI1_Q => .RCC_SAI1CLKSOURCE_PLLSAI,
                };
            }
        };

        pub const SAI2CLockSelectionList = enum {
            RCC_SAI2CLKSOURCE_PLLSAI,
            RCC_SAI2CLKSOURCE_PLLI2S,
            RCC_SAI2CLKSOURCE_PIN,
            RCC_SAI2CLKSOURCE_PLLSRC,

            pub fn to_enum(self: @This()) anyerror!RCC_SAISEL {
                return switch (self) {
                    .RCC_SAI2CLKSOURCE_PIN => .AFIF,
                    .RCC_SAI2CLKSOURCE_PLLI2S => .PLLI2S1_Q,
                    .RCC_SAI2CLKSOURCE_PLLSAI => .PLLSAI1_Q,
                    .RCC_SAI2CLKSOURCE_PLLSRC => .HSI_HSE,
                };
            }
            pub fn from_enum(item: RCC_SAISEL) anyerror!@This() {
                return switch (item) {
                    .AFIF => .RCC_SAI2CLKSOURCE_PIN,
                    .PLLI2S1_Q => .RCC_SAI2CLKSOURCE_PLLI2S,
                    .PLLSAI1_Q => .RCC_SAI2CLKSOURCE_PLLSAI,
                    .HSI_HSE => .RCC_SAI2CLKSOURCE_PLLSRC,
                };
            }
        };

        pub const DFSDMAudioSelectionList = enum {
            RCC_DFSDM1AUDIOCLKSOURCE_SAI1,
            RCC_DFSDM1AUDIOCLKSOURCE_SAI2,

            pub fn to_enum(self: @This()) anyerror!RCC_ADFSDMSEL {
                return switch (self) {
                    .RCC_DFSDM1AUDIOCLKSOURCE_SAI2 => .SAI2,
                    .RCC_DFSDM1AUDIOCLKSOURCE_SAI1 => .SAI1,
                };
            }
            pub fn from_enum(item: RCC_ADFSDMSEL) anyerror!@This() {
                return switch (item) {
                    .SAI2 => .RCC_DFSDM1AUDIOCLKSOURCE_SAI2,
                    .SAI1 => .RCC_DFSDM1AUDIOCLKSOURCE_SAI1,
                };
            }
        };

        pub const SDMMCClockSelectionList = enum {
            RCC_SDMMC1CLKSOURCE_CLK48,
            RCC_SDMMC1CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_CLK48SEL {
                return switch (self) {
                    .RCC_SDMMC1CLKSOURCE_CLK48 => .PLL1_Q,
                    .RCC_SDMMC1CLKSOURCE_SYSCLK => .PLLSAI1_P,
                };
            }
            pub fn from_enum(item: RCC_CLK48SEL) anyerror!@This() {
                return switch (item) {
                    .PLL1_Q => .RCC_SDMMC1CLKSOURCE_CLK48,
                    .PLLSAI1_P => .RCC_SDMMC1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const SDMMC2ClockSelectionList = enum {
            RCC_SDMMC2CLKSOURCE_CLK48,
            RCC_SDMMC2CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SDMMCSEL {
                return switch (self) {
                    .RCC_SDMMC2CLKSOURCE_CLK48 => .CLK48,
                    .RCC_SDMMC2CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_SDMMCSEL) anyerror!@This() {
                return switch (item) {
                    .CLK48 => .RCC_SDMMC2CLKSOURCE_CLK48,
                    .SYS => .RCC_SDMMC2CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const I2SCLockSelectionList = enum {
            RCC_I2SCLKSOURCE_EXT,
            RCC_I2SCLKSOURCE_PLLI2S,

            pub fn to_enum(self: @This()) anyerror!RCC_ISSRC {
                return switch (self) {
                    .RCC_I2SCLKSOURCE_PLLI2S => .PLLI2S,
                    .RCC_I2SCLKSOURCE_EXT => .CKIN,
                };
            }
            pub fn from_enum(item: RCC_ISSRC) anyerror!@This() {
                return switch (item) {
                    .PLLI2S => .RCC_I2SCLKSOURCE_PLLI2S,
                    .CKIN => .RCC_I2SCLKSOURCE_EXT,
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

        pub const USART2CLockSelectionList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART2SEL {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART2CLKSOURCE_HSI => .HSI,
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USART2SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                };
            }
        };

        pub const USART3CLockSelectionList = enum {
            RCC_USART3CLKSOURCE_PCLK1,
            RCC_USART3CLKSOURCE_SYSCLK,
            RCC_USART3CLKSOURCE_HSI,
            RCC_USART3CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART2SEL {
                return switch (self) {
                    .RCC_USART3CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USART2SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .SYS => .RCC_USART3CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
                };
            }
        };

        pub const USART6CLockSelectionList = enum {
            RCC_USART6CLKSOURCE_PCLK2,
            RCC_USART6CLKSOURCE_SYSCLK,
            RCC_USART6CLKSOURCE_HSI,
            RCC_USART6CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART1SEL {
                return switch (self) {
                    .RCC_USART6CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART6CLKSOURCE_PCLK2 => .PCLK2,
                    .RCC_USART6CLKSOURCE_LSE => .LSE,
                    .RCC_USART6CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_USART1SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART6CLKSOURCE_SYSCLK,
                    .PCLK2 => .RCC_USART6CLKSOURCE_PCLK2,
                    .LSE => .RCC_USART6CLKSOURCE_LSE,
                    .HSI => .RCC_USART6CLKSOURCE_HSI,
                };
            }
        };

        pub const UART4CLockSelectionList = enum {
            RCC_UART4CLKSOURCE_PCLK1,
            RCC_UART4CLKSOURCE_SYSCLK,
            RCC_UART4CLKSOURCE_HSI,
            RCC_UART4CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART2SEL {
                return switch (self) {
                    .RCC_UART4CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_UART4CLKSOURCE_HSI => .HSI,
                    .RCC_UART4CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART4CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USART2SEL) anyerror!@This() {
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

            pub fn to_enum(self: @This()) anyerror!RCC_USART2SEL {
                return switch (self) {
                    .RCC_UART5CLKSOURCE_LSE => .LSE,
                    .RCC_UART5CLKSOURCE_HSI => .HSI,
                    .RCC_UART5CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART5CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USART2SEL) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_UART5CLKSOURCE_LSE,
                    .HSI => .RCC_UART5CLKSOURCE_HSI,
                    .SYS => .RCC_UART5CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_UART5CLKSOURCE_PCLK1,
                };
            }
        };

        pub const UART7CLockSelectionList = enum {
            RCC_UART7CLKSOURCE_PCLK1,
            RCC_UART7CLKSOURCE_SYSCLK,
            RCC_UART7CLKSOURCE_HSI,
            RCC_UART7CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART2SEL {
                return switch (self) {
                    .RCC_UART7CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_UART7CLKSOURCE_LSE => .LSE,
                    .RCC_UART7CLKSOURCE_HSI => .HSI,
                    .RCC_UART7CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_USART2SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_UART7CLKSOURCE_PCLK1,
                    .LSE => .RCC_UART7CLKSOURCE_LSE,
                    .HSI => .RCC_UART7CLKSOURCE_HSI,
                    .SYS => .RCC_UART7CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const UART8CLockSelectionList = enum {
            RCC_UART8CLKSOURCE_PCLK1,
            RCC_UART8CLKSOURCE_SYSCLK,
            RCC_UART8CLKSOURCE_HSI,
            RCC_UART8CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART2SEL {
                return switch (self) {
                    .RCC_UART8CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_UART8CLKSOURCE_HSI => .HSI,
                    .RCC_UART8CLKSOURCE_SYSCLK => .SYS,
                    .RCC_UART8CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USART2SEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_UART8CLKSOURCE_PCLK1,
                    .HSI => .RCC_UART8CLKSOURCE_HSI,
                    .SYS => .RCC_UART8CLKSOURCE_SYSCLK,
                    .LSE => .RCC_UART8CLKSOURCE_LSE,
                };
            }
        };

        pub const LPTIM1CLockSelectionList = enum {
            RCC_LPTIM1CLKSOURCE_PCLK,
            RCC_LPTIM1CLKSOURCE_LSI,
            RCC_LPTIM1CLKSOURCE_HSI,
            RCC_LPTIM1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_LPTIMSEL {
                return switch (self) {
                    .RCC_LPTIM1CLKSOURCE_PCLK => .PCLK1,
                    .RCC_LPTIM1CLKSOURCE_HSI => .HSI,
                    .RCC_LPTIM1CLKSOURCE_LSI => .LSI,
                    .RCC_LPTIM1CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_LPTIMSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_LPTIM1CLKSOURCE_PCLK,
                    .HSI => .RCC_LPTIM1CLKSOURCE_HSI,
                    .LSI => .RCC_LPTIM1CLKSOURCE_LSI,
                    .LSE => .RCC_LPTIM1CLKSOURCE_LSE,
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

        pub const DFSDMSelectionList = enum {
            RCC_DFSDM1CLKSOURCE_PCLK,
            RCC_DFSDM1CLKSOURCE_SYSCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_DFSDMSEL {
                return switch (self) {
                    .RCC_DFSDM1CLKSOURCE_PCLK => .PCLK2,
                    .RCC_DFSDM1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_DFSDMSEL) anyerror!@This() {
                return switch (item) {
                    .PCLK2 => .RCC_DFSDM1CLKSOURCE_PCLK,
                    .SYS => .RCC_DFSDM1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const DSICLockSelectionList = enum {
            RCC_DSICLKSOURCE_PLLR,
            RCC_DSICLKSOURCE_DSIPHY,

            pub fn to_enum(self: @This()) anyerror!RCC_DSISEL {
                return switch (self) {
                    .RCC_DSICLKSOURCE_DSIPHY => .DSI_PHY,
                    .RCC_DSICLKSOURCE_PLLR => .PLL1_R,
                };
            }
            pub fn from_enum(item: RCC_DSISEL) anyerror!@This() {
                return switch (item) {
                    .DSI_PHY => .RCC_DSICLKSOURCE_DSIPHY,
                    .PLL1_R => .RCC_DSICLKSOURCE_PLLR,
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

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .DSI_PLL_OUT_DIV1 => 1,
                    .DSI_PLL_OUT_DIV2 => 2,
                    .DSI_PLL_OUT_DIV4 => 4,
                    .DSI_PLL_OUT_DIV8 => 8,
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

        pub const PLLSAIRDivList = enum {
            RCC_PLLSAIDIVR_2,
            RCC_PLLSAIDIVR_4,
            RCC_PLLSAIDIVR_8,
            RCC_PLLSAIDIVR_16,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_PLLSAIDIVR_8 => .Div8,
                    .RCC_PLLSAIDIVR_4 => .Div4,
                    .RCC_PLLSAIDIVR_16 => .Div16,
                    .RCC_PLLSAIDIVR_2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div8 => .RCC_PLLSAIDIVR_8,
                    .Div4 => .RCC_PLLSAIDIVR_4,
                    .Div16 => .RCC_PLLSAIDIVR_16,
                    .Div2 => .RCC_PLLSAIDIVR_2,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "PLLSAIRDiv" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLSAIDIVR_2 => 2,
                    .RCC_PLLSAIDIVR_4 => 4,
                    .RCC_PLLSAIDIVR_8 => 8,
                    .RCC_PLLSAIDIVR_16 => 16,
                };
            }
        };

        pub const PLLI2SPList = enum {
            RCC_PLLP_DIV2,
            RCC_PLLP_DIV4,
            RCC_PLLP_DIV6,
            RCC_PLLP_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLI2SDIVQ {
                return switch (self) {
                    .RCC_PLLP_DIV2 => .Div2,
                    .RCC_PLLP_DIV8 => .Div8,
                    .RCC_PLLP_DIV6 => .Div6,
                    .RCC_PLLP_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_PLLI2SDIVQ) anyerror!@This() {
                return switch (item) {
                    .Div2 => .RCC_PLLP_DIV2,
                    .Div8 => .RCC_PLLP_DIV8,
                    .Div6 => .RCC_PLLP_DIV6,
                    .Div4 => .RCC_PLLP_DIV4,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PLLI2SDIVQ", @tagName(item), "PLLI2SP" },
                    ),
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
            FLASH_LATENCY_9,

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
                    .FLASH_LATENCY_9 => .WS9,
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
                    .WS9 => .FLASH_LATENCY_9,
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

        pub const PWREXT_OverDriveList = enum {
            PWREXT_OverDrive_ACTIVATED,
            PWREXT_OverDrive_DESACTIVATED,
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

        pub const RTCEnableList = enum {
            true,
            false,
        };

        pub const LSIEnableList = enum {
            true,
        };

        pub const ExtClockEnableList = enum {
            true,
            false,
        };

        pub const EnableHSERTCDevisorList = enum {
            true,
            false,
        };

        pub const IWDGEnableList = enum {
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

        pub const I2C4EnableList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const SDMMC1EnableList = enum {
            true,
            false,
        };

        pub const SDMMC2EnableList = enum {
            true,
            false,
        };

        pub const RNGEnableList = enum {
            true,
            false,
        };

        pub const LCDEnableList = enum {
            true,
            false,
        };

        pub const SPDIFEnableList = enum {
            true,
            false,
        };

        pub const SAI1EnableList = enum {
            true,
            false,
        };

        pub const EnableDFSDMAudioList = enum {
            true,
            false,
        };

        pub const SAI2EnableList = enum {
            true,
            false,
        };

        pub const I2SEnableList = enum {
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

        pub const USART6EnableList = enum {
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

        pub const UART7EnableList = enum {
            true,
            false,
        };

        pub const UART8EnableList = enum {
            true,
            false,
        };

        pub const LPTIM1EnableList = enum {
            true,
            false,
        };

        pub const CECEnableList = enum {
            true,
            false,
        };

        pub const EnableDFSDMList = enum {
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

        pub const EnablePLLRDSIList = enum {
            false,
        };

        pub const MCO2I2SEnableList = enum {
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
            ETHUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            DSIUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            SAI2Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            USART6Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            LPTIMUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
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
            ETHUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            DSIUsed_ForRCC: bool = false,
            RNGUsed_ForRCC: bool = false,
            SDMMC2Used_ForRCC: bool = false,
            SDMMC1Used_ForRCC: bool = false,
            I2S1Used_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            SAI1Used_ForRCC: bool = false,
            DFSDM1Used_ForRCC: bool = false,
            SAI2Used_ForRCC: bool = false,
            LTDCUsed_ForRCC: bool = false,
            SPDIFRXUsed_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            USART6Used_ForRCC: bool = false,
            UART4Used_ForRCC: bool = false,
            UART5Used_ForRCC: bool = false,
            UART7Used_ForRCC: bool = false,
            UART8Used_ForRCC: bool = false,
            LPTIMUsed_ForRCC: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            I2C3Used_ForRCC: bool = false,
            I2C4Used_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            PLLSAIUsed: bool = false, //Reference flag
            PLLI2SUsed: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            LSIEnable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            I2C3Enable: bool = false, //Reference flag
            I2C4Enable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            SDMMC1Enable: bool = false, //Reference flag
            SDMMC2Enable: bool = false, //Reference flag
            RNGEnable: bool = false, //Reference flag
            LCDEnable: bool = false, //Reference flag
            SPDIFEnable: bool = false, //Reference flag
            SAI1Enable: bool = false, //Reference flag
            EnableDFSDMAudio: bool = false, //Reference flag
            SAI2Enable: bool = false, //Reference flag
            I2SEnable: bool = false, //Reference flag
            MCO1OutPutEnable: bool = false, //Reference flag
            MCO2OutPutEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            USART6Enable: bool = false, //Reference flag
            UART4Enable: bool = false, //Reference flag
            UART5Enable: bool = false, //Reference flag
            UART7Enable: bool = false, //Reference flag
            UART8Enable: bool = false, //Reference flag
            LPTIM1Enable: bool = false, //Reference flag
            CECEnable: bool = false, //Reference flag
            EnableDFSDM: bool = false, //Reference flag
            EnableHSEDSI: bool = false, //Reference flag
            EnableDSI: bool = false, //Reference flag
            EnablePLLRDSI: bool = false, //Reference flag
            MCO2I2SEnable: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            HSEUsed: bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            FLatency: ?FLatencyList = null,
            HSICalibrationValue: ?u32 = null,
            RCC_TIM_PRescaler_Selection: ?RCC_TIM_PRescaler_SelectionList = null,
            PWREXT_OverDrive: ?PWREXT_OverDriveList = null,
            PWR_Regulator_Voltage_Scale: ?PWR_Regulator_Voltage_ScaleList = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLM: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            I2C2CLockSelection: ?I2C2CLockSelectionList = null,
            I2C3CLockSelection: ?I2C3CLockSelectionList = null,
            I2C4CLockSelection: ?I2C4CLockSelectionList = null,
            PLL48CLockSelection: ?PLL48CLockSelectionList = null,
            SAI1CLockSelection: ?SAI1CLockSelectionList = null,
            SAI2CLockSelection: ?SAI2CLockSelectionList = null,
            DFSDMAudioSelection: ?DFSDMAudioSelectionList = null,
            SDMMCClockSelection: ?SDMMCClockSelectionList = null,
            SDMMC2ClockSelection: ?SDMMC2ClockSelectionList = null,
            I2SCLockSelection: ?I2SCLockSelectionList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv1: ?RCC_MCODiv1List = null,
            RCC_MCO2Source: ?RCC_MCO2SourceList = null,
            RCC_MCODiv2: ?RCC_MCODiv2List = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            USART2CLockSelection: ?USART2CLockSelectionList = null,
            USART3CLockSelection: ?USART3CLockSelectionList = null,
            USART6CLockSelection: ?USART6CLockSelectionList = null,
            UART4CLockSelection: ?UART4CLockSelectionList = null,
            UART5CLockSelection: ?UART5CLockSelectionList = null,
            UART7CLockSelection: ?UART7CLockSelectionList = null,
            UART8CLockSelection: ?UART8CLockSelectionList = null,
            LPTIM1CLockSelection: ?LPTIM1CLockSelectionList = null,
            CECClockSelection: ?CECClockSelectionList = null,
            DFSDMSelection: ?DFSDMSelectionList = null,
            DSICLockSelection: ?DSICLockSelectionList = null,
            DSITX_Div: ?u32 = null,
            PLLDSIIDF: ?PLLDSIIDFList = null,
            PLLDSINDIV: ?u32 = null,
            PLLDSIODF: ?PLLDSIODFList = null,
            PLLN: ?u32 = null,
            PLLP: ?PLLPList = null,
            PLLQ: ?u32 = null,
            PLLR: ?u32 = null,
            PLLSAIN: ?u32 = null,
            PLLSAIP: ?PLLSAIPList = null,
            PLLSAIQ: ?u32 = null,
            PLLSAIQDiv: ?u32 = null,
            PLLSAIR: ?u32 = null,
            PLLSAIRDiv: ?PLLSAIRDivList = null,
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
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RTCClockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            I2C2CLockSelection: I2C2CLockSelectionList,
            I2C3CLockSelection: I2C3CLockSelectionList,
            I2C4CLockSelection: I2C4CLockSelectionList,
            PLL48CLockSelection: PLL48CLockSelectionList,
            SAI1CLockSelection: SAI1CLockSelectionList,
            SAI2CLockSelection: SAI2CLockSelectionList,
            DFSDMAudioSelection: DFSDMAudioSelectionList,
            SDMMCClockSelection: SDMMCClockSelectionList,
            SDMMC2ClockSelection: SDMMC2ClockSelectionList,
            I2SCLockSelection: I2SCLockSelectionList,
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
            USART1CLockSelection: USART1CLockSelectionList,
            USART2CLockSelection: USART2CLockSelectionList,
            USART3CLockSelection: USART3CLockSelectionList,
            USART6CLockSelection: USART6CLockSelectionList,
            UART4CLockSelection: UART4CLockSelectionList,
            UART5CLockSelection: UART5CLockSelectionList,
            UART7CLockSelection: UART7CLockSelectionList,
            UART8CLockSelection: UART8CLockSelectionList,
            LPTIM1CLockSelection: LPTIM1CLockSelectionList,
            HSI_Div_CEC: u32,
            CECClockSelection: CECClockSelectionList,
            DFSDMSelection: DFSDMSelectionList,
            DSIPHY_Div: u32,
            DSICLockSelection: DSICLockSelectionList,
            DSITX_Div: u32,
            PLLDSIIDF: PLLDSIIDFList,
            PLLDSIMult: u32,
            PLLDSINDIV: u32,
            PLLDSIDev: u32,
            PLLDSIODF: PLLDSIODFList,
            PLLN: u32,
            PLLP: PLLPList,
            PLLQ: u32,
            PLLR: u32,
            PLLSAIN: u32,
            PLLSAIP: PLLSAIPList,
            PLLSAIQ: u32,
            PLLSAIQDiv: u32,
            PLLSAIR: u32,
            PLLSAIRDiv: PLLSAIRDivList,
            PLLI2SN: u32,
            PLLI2SP: PLLI2SPList,
            PLLI2SQ: u32,
            PLLI2SQDiv: u32,
            PLLI2SR: u32,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            RCC_TIM_PRescaler_Selection: RCC_TIM_PRescaler_SelectionList,
            PWREXT_OverDrive: PWREXT_OverDriveList,
            PWR_Regulator_Voltage_Scale: PWR_Regulator_Voltage_ScaleList,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            FLatency: ?FLASH_LATENCY = null,
            HSICalibrationValue: ?u32 = null,
            RCC_TIM_PRescaler_Selection: ?RCC_TIMPRE = null,
            PWREXT_OverDrive: ?PWREXT_OverDriveList = null,
            PWR_Regulator_Voltage_Scale: ?PWR_VOS = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .FLatency = if (self.FLatency) |val| try FLatencyList.from_enum(val) else null,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .RCC_TIM_PRescaler_Selection = if (self.RCC_TIM_PRescaler_Selection) |val| try RCC_TIM_PRescaler_SelectionList.from_enum(val) else null,
                    .PWREXT_OverDrive = self.PWREXT_OverDrive,
                    .PWR_Regulator_Voltage_Scale = if (self.PWR_Regulator_Voltage_Scale) |val| try PWR_Regulator_Voltage_ScaleList.from_enum(val) else null,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLM: ?u32 = null,
            RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEList = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            I2C1CLockSelection: ?RCC_I2CSEL = null,
            I2C2CLockSelection: ?RCC_I2CSEL = null,
            I2C3CLockSelection: ?RCC_I2CSEL = null,
            I2C4CLockSelection: ?RCC_I2CSEL = null,
            PLL48CLockSelection: ?RCC_CLK48SEL = null,
            SAI1CLockSelection: ?RCC_SAISEL = null,
            SAI2CLockSelection: ?RCC_SAISEL = null,
            DFSDMAudioSelection: ?RCC_ADFSDMSEL = null,
            SDMMCClockSelection: ?RCC_CLK48SEL = null,
            SDMMC2ClockSelection: ?RCC_SDMMCSEL = null,
            I2SCLockSelection: ?RCC_ISSRC = null,
            RCC_MCO1Source: ?RCC_MCO1SEL = null,
            RCC_MCODiv1: ?RCC_MCOPRE = null,
            RCC_MCO2Source: ?RCC_MCO2SEL = null,
            RCC_MCODiv2: ?RCC_MCOPRE = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            USART1CLockSelection: ?RCC_USART1SEL = null,
            USART2CLockSelection: ?RCC_USART2SEL = null,
            USART3CLockSelection: ?RCC_USART2SEL = null,
            USART6CLockSelection: ?RCC_USART1SEL = null,
            UART4CLockSelection: ?RCC_USART2SEL = null,
            UART5CLockSelection: ?RCC_USART2SEL = null,
            UART7CLockSelection: ?RCC_USART2SEL = null,
            UART8CLockSelection: ?RCC_USART2SEL = null,
            LPTIM1CLockSelection: ?RCC_LPTIMSEL = null,
            CECClockSelection: ?RCC_CECSEL = null,
            DFSDMSelection: ?RCC_DFSDMSEL = null,
            DSICLockSelection: ?RCC_DSISEL = null,
            DSITX_Div: ?u32 = null,
            PLLDSIIDF: ?PLLDSIIDFList = null,
            PLLDSINDIV: ?u32 = null,
            PLLDSIODF: ?PLLDSIODFList = null,
            PLLN: ?u32 = null,
            PLLP: ?RCC_PLLP = null,
            PLLQ: ?u32 = null,
            PLLR: ?u32 = null,
            PLLSAIN: ?u32 = null,
            PLLSAIP: ?RCC_PLLSAIDIVQ = null,
            PLLSAIQ: ?u32 = null,
            PLLSAIQDiv: ?u32 = null,
            PLLSAIR: ?u32 = null,
            PLLSAIRDiv: ?RCC_HPRE = null,
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
                    .LSI_VALUE = self.LSI_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLM = self.PLLM,
                    .RCC_RTC_Clock_Source_FROM_HSE = self.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .I2C2CLockSelection = if (self.I2C2CLockSelection) |val| try I2C2CLockSelectionList.from_enum(val) else null,
                    .I2C3CLockSelection = if (self.I2C3CLockSelection) |val| try I2C3CLockSelectionList.from_enum(val) else null,
                    .I2C4CLockSelection = if (self.I2C4CLockSelection) |val| try I2C4CLockSelectionList.from_enum(val) else null,
                    .PLL48CLockSelection = if (self.PLL48CLockSelection) |val| try PLL48CLockSelectionList.from_enum(val) else null,
                    .SAI1CLockSelection = if (self.SAI1CLockSelection) |val| try SAI1CLockSelectionList.from_enum(val) else null,
                    .SAI2CLockSelection = if (self.SAI2CLockSelection) |val| try SAI2CLockSelectionList.from_enum(val) else null,
                    .DFSDMAudioSelection = if (self.DFSDMAudioSelection) |val| try DFSDMAudioSelectionList.from_enum(val) else null,
                    .SDMMCClockSelection = if (self.SDMMCClockSelection) |val| try SDMMCClockSelectionList.from_enum(val) else null,
                    .SDMMC2ClockSelection = if (self.SDMMC2ClockSelection) |val| try SDMMC2ClockSelectionList.from_enum(val) else null,
                    .I2SCLockSelection = if (self.I2SCLockSelection) |val| try I2SCLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv1 = if (self.RCC_MCODiv1) |val| try RCC_MCODiv1List.from_enum(val) else null,
                    .RCC_MCO2Source = if (self.RCC_MCO2Source) |val| try RCC_MCO2SourceList.from_enum(val) else null,
                    .RCC_MCODiv2 = if (self.RCC_MCODiv2) |val| try RCC_MCODiv2List.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .USART2CLockSelection = if (self.USART2CLockSelection) |val| try USART2CLockSelectionList.from_enum(val) else null,
                    .USART3CLockSelection = if (self.USART3CLockSelection) |val| try USART3CLockSelectionList.from_enum(val) else null,
                    .USART6CLockSelection = if (self.USART6CLockSelection) |val| try USART6CLockSelectionList.from_enum(val) else null,
                    .UART4CLockSelection = if (self.UART4CLockSelection) |val| try UART4CLockSelectionList.from_enum(val) else null,
                    .UART5CLockSelection = if (self.UART5CLockSelection) |val| try UART5CLockSelectionList.from_enum(val) else null,
                    .UART7CLockSelection = if (self.UART7CLockSelection) |val| try UART7CLockSelectionList.from_enum(val) else null,
                    .UART8CLockSelection = if (self.UART8CLockSelection) |val| try UART8CLockSelectionList.from_enum(val) else null,
                    .LPTIM1CLockSelection = if (self.LPTIM1CLockSelection) |val| try LPTIM1CLockSelectionList.from_enum(val) else null,
                    .CECClockSelection = if (self.CECClockSelection) |val| try CECClockSelectionList.from_enum(val) else null,
                    .DFSDMSelection = if (self.DFSDMSelection) |val| try DFSDMSelectionList.from_enum(val) else null,
                    .DSICLockSelection = if (self.DSICLockSelection) |val| try DSICLockSelectionList.from_enum(val) else null,
                    .DSITX_Div = self.DSITX_Div,
                    .PLLDSIIDF = self.PLLDSIIDF,
                    .PLLDSINDIV = self.PLLDSINDIV,
                    .PLLDSIODF = self.PLLDSIODF,
                    .PLLN = self.PLLN,
                    .PLLP = if (self.PLLP) |val| try PLLPList.from_enum(val) else null,
                    .PLLQ = self.PLLQ,
                    .PLLR = self.PLLR,
                    .PLLSAIN = self.PLLSAIN,
                    .PLLSAIP = if (self.PLLSAIP) |val| try PLLSAIPList.from_enum(val) else null,
                    .PLLSAIQ = self.PLLSAIQ,
                    .PLLSAIQDiv = self.PLLSAIQDiv,
                    .PLLSAIR = self.PLLSAIR,
                    .PLLSAIRDiv = if (self.PLLSAIRDiv) |val| try PLLSAIRDivList.from_enum(val) else null,
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
            RCC_RTC_Clock_Source_FROM_HSE: RCC_RTC_Clock_Source_FROM_HSEList,
            RTCClockSelection: RCC_RTCSEL,
            I2C1CLockSelection: RCC_I2CSEL,
            I2C2CLockSelection: RCC_I2CSEL,
            I2C3CLockSelection: RCC_I2CSEL,
            I2C4CLockSelection: RCC_I2CSEL,
            PLL48CLockSelection: RCC_CLK48SEL,
            SAI1CLockSelection: RCC_SAISEL,
            SAI2CLockSelection: RCC_SAISEL,
            DFSDMAudioSelection: RCC_ADFSDMSEL,
            SDMMCClockSelection: RCC_CLK48SEL,
            SDMMC2ClockSelection: RCC_SDMMCSEL,
            I2SCLockSelection: RCC_ISSRC,
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
            USART1CLockSelection: RCC_USART1SEL,
            USART2CLockSelection: RCC_USART2SEL,
            USART3CLockSelection: RCC_USART2SEL,
            USART6CLockSelection: RCC_USART1SEL,
            UART4CLockSelection: RCC_USART2SEL,
            UART5CLockSelection: RCC_USART2SEL,
            UART7CLockSelection: RCC_USART2SEL,
            UART8CLockSelection: RCC_USART2SEL,
            LPTIM1CLockSelection: RCC_LPTIMSEL,
            HSI_Div_CEC: u32,
            CECClockSelection: RCC_CECSEL,
            DFSDMSelection: RCC_DFSDMSEL,
            DSIPHY_Div: u32,
            DSICLockSelection: RCC_DSISEL,
            DSITX_Div: u32,
            PLLDSIIDF: PLLDSIIDFList,
            PLLDSIMult: u32,
            PLLDSINDIV: u32,
            PLLDSIDev: u32,
            PLLDSIODF: PLLDSIODFList,
            PLLN: u32,
            PLLP: RCC_PLLP,
            PLLQ: u32,
            PLLR: u32,
            PLLSAIN: u32,
            PLLSAIP: RCC_PLLSAIDIVQ,
            PLLSAIQ: u32,
            PLLSAIQDiv: u32,
            PLLSAIR: u32,
            PLLSAIRDiv: RCC_HPRE,
            PLLI2SN: u32,
            PLLI2SP: RCC_PLLI2SDIVQ,
            PLLI2SQ: u32,
            PLLI2SQDiv: u32,
            PLLI2SR: u32,
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: u32,
            RCC_TIM_PRescaler_Selection: RCC_TIMPRE,
            PWREXT_OverDrive: PWREXT_OverDriveList,
            PWR_Regulator_Voltage_Scale: PWR_VOS,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLM = cubemx_config.PLLM,
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .I2C2CLockSelection = try cubemx_config.I2C2CLockSelection.to_enum(),
                    .I2C3CLockSelection = try cubemx_config.I2C3CLockSelection.to_enum(),
                    .I2C4CLockSelection = try cubemx_config.I2C4CLockSelection.to_enum(),
                    .PLL48CLockSelection = try cubemx_config.PLL48CLockSelection.to_enum(),
                    .SAI1CLockSelection = try cubemx_config.SAI1CLockSelection.to_enum(),
                    .SAI2CLockSelection = try cubemx_config.SAI2CLockSelection.to_enum(),
                    .DFSDMAudioSelection = try cubemx_config.DFSDMAudioSelection.to_enum(),
                    .SDMMCClockSelection = try cubemx_config.SDMMCClockSelection.to_enum(),
                    .SDMMC2ClockSelection = try cubemx_config.SDMMC2ClockSelection.to_enum(),
                    .I2SCLockSelection = try cubemx_config.I2SCLockSelection.to_enum(),
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
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .USART2CLockSelection = try cubemx_config.USART2CLockSelection.to_enum(),
                    .USART3CLockSelection = try cubemx_config.USART3CLockSelection.to_enum(),
                    .USART6CLockSelection = try cubemx_config.USART6CLockSelection.to_enum(),
                    .UART4CLockSelection = try cubemx_config.UART4CLockSelection.to_enum(),
                    .UART5CLockSelection = try cubemx_config.UART5CLockSelection.to_enum(),
                    .UART7CLockSelection = try cubemx_config.UART7CLockSelection.to_enum(),
                    .UART8CLockSelection = try cubemx_config.UART8CLockSelection.to_enum(),
                    .LPTIM1CLockSelection = try cubemx_config.LPTIM1CLockSelection.to_enum(),
                    .HSI_Div_CEC = cubemx_config.HSI_Div_CEC,
                    .CECClockSelection = try cubemx_config.CECClockSelection.to_enum(),
                    .DFSDMSelection = try cubemx_config.DFSDMSelection.to_enum(),
                    .DSIPHY_Div = cubemx_config.DSIPHY_Div,
                    .DSICLockSelection = try cubemx_config.DSICLockSelection.to_enum(),
                    .DSITX_Div = cubemx_config.DSITX_Div,
                    .PLLDSIIDF = cubemx_config.PLLDSIIDF,
                    .PLLDSIMult = cubemx_config.PLLDSIMult,
                    .PLLDSINDIV = cubemx_config.PLLDSINDIV,
                    .PLLDSIDev = cubemx_config.PLLDSIDev,
                    .PLLDSIODF = cubemx_config.PLLDSIODF,
                    .PLLN = cubemx_config.PLLN,
                    .PLLP = try cubemx_config.PLLP.to_enum(),
                    .PLLQ = cubemx_config.PLLQ,
                    .PLLR = cubemx_config.PLLR,
                    .PLLSAIN = cubemx_config.PLLSAIN,
                    .PLLSAIP = try cubemx_config.PLLSAIP.to_enum(),
                    .PLLSAIQ = cubemx_config.PLLSAIQ,
                    .PLLSAIQDiv = cubemx_config.PLLSAIQDiv,
                    .PLLSAIR = cubemx_config.PLLSAIR,
                    .PLLSAIRDiv = try cubemx_config.PLLSAIRDiv.to_enum(),
                    .PLLI2SN = cubemx_config.PLLI2SN,
                    .PLLI2SP = try cubemx_config.PLLI2SP.to_enum(),
                    .PLLI2SQ = cubemx_config.PLLI2SQ,
                    .PLLI2SQDiv = cubemx_config.PLLI2SQDiv,
                    .PLLI2SR = cubemx_config.PLLI2SR,
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = try cubemx_config.FLatency.to_enum(),
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
                    .RCC_TIM_PRescaler_Selection = try cubemx_config.RCC_TIM_PRescaler_Selection.to_enum(),
                    .PWREXT_OverDrive = cubemx_config.PWREXT_OverDrive,
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
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            I2S_CKIN: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            PLLSource: u32 = 0,
            PLLM: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2output: u32 = 0,
            I2C3Mult: u32 = 0,
            I2C3output: u32 = 0,
            I2C4Mult: u32 = 0,
            I2C4output: u32 = 0,
            PLL48Mult: u32 = 0,
            RNGoutput: u32 = 0,
            USBoutput: u32 = 0,
            LCDTFTKOutput: u32 = 0,
            SPDIFoutput: u32 = 0,
            SAI1Mult: u32 = 0,
            SAI1output: u32 = 0,
            SAI2Mult: u32 = 0,
            SAI2output: u32 = 0,
            DFSDMAudioMult: u32 = 0,
            DFSDMAudiooutput: u32 = 0,
            SDMMCMult: u32 = 0,
            SDMMCoutput: u32 = 0,
            SDMMC2Mult: u32 = 0,
            SDMMC2output: u32 = 0,
            I2SMult: u32 = 0,
            I2Soutput: u32 = 0,
            EthernetPtpOutput: u32 = 0,
            MCO1Mult: u32 = 0,
            MCO1Div: u32 = 0,
            MCO1Pin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            AHBPrescaler: u32 = 0,
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
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3output: u32 = 0,
            USART6Mult: u32 = 0,
            USART6output: u32 = 0,
            UART4Mult: u32 = 0,
            UART4output: u32 = 0,
            UART5Mult: u32 = 0,
            UART5output: u32 = 0,
            UART7Mult: u32 = 0,
            UART7output: u32 = 0,
            UART8Mult: u32 = 0,
            UART8output: u32 = 0,
            LPTIM1Mult: u32 = 0,
            LPTIM1Output: u32 = 0,
            HSIDivCEC: u32 = 0,
            CECMult: u32 = 0,
            CECOutput: u32 = 0,
            DFSDMMult: u32 = 0,
            DFSDMoutput: u32 = 0,
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
            PLLN: u32 = 0,
            PLLP: u32 = 0,
            PLLQ: u32 = 0,
            PLLQoutput: u32 = 0,
            PLLR: u32 = 0,
            PLLRoutput: u32 = 0,
            PLLSAIN: u32 = 0,
            PLLSAIP: u32 = 0,
            PLLSAIoutput: u32 = 0,
            PLLSAIQ: u32 = 0,
            PLLSAIQDiv: u32 = 0,
            PLLSAIR: u32 = 0,
            PLLSAIRDiv: u32 = 0,
            PLLI2SN: u32 = 0,
            PLLI2SP: u32 = 0,
            PLLI2SQ: u32 = 0,
            PLLI2SQDiv: u32 = 0,
            PLLI2SR: u32 = 0,
            PLLI2SRoutput: u32 = 0,
            VCOInput: u32 = 0,
            VCOOutput: u32 = 0,
            PLLCLK: u32 = 0,
            PLLQCLK: u32 = 0,
            VCOSAIOutput: u32 = 0,
            PLLSAIPCLK: u32 = 0,
            PLLSAIQCLK: u32 = 0,
            PLLSAIRCLK: u32 = 0,
            VCOI2SOutput: u32 = 0,
            PLLI2SPCLK: u32 = 0,
            PLLI2SQCLK: u32 = 0,
            PLLI2SRCLK: u32 = 0,
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
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
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
            var USBSourceisPLLSAI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USBSourceisPLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLSAI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLI2S: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI1SourcePLLsrc: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLLSAI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLLI2S: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourceEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var SAI2SourcePLLsrc: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMADSourceSAI1: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMADSourceSAI2: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1SourceCK48: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC2SourceCK48: bool = false; //semaphore for processing, not an actual flag in the output;
            var SDMMC2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourceIsEXT: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2SSourceIsPLLI2SR: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceIsPLLI2SP: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourcePCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART3SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART6SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART6SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART6SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART6SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART4SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART5SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART7SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART7Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART7SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART7SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART8SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART8Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART8SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var UART8SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCEHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LPTIM1SOURCELSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var CECSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMisAPB2: bool = false; //semaphore for processing, not an actual flag in the output;
            var DFSDMissys: bool = false; //semaphore for processing, not an actual flag in the output;
            var DSISourceisPLLR: bool = false; //semaphore for processing, not an actual flag in the output;
            var DSISourceisDSIPHY: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLI2SDiv2: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLI2SDiv4: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLI2SDiv6: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLI2SDiv8: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var PLL48Mult = ClockNode{
                .name = "PLL48Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var RNGoutput = ClockNode{
                .name = "RNGoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBoutput = ClockNode{
                .name = "USBoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LCDTFTKOutput = ClockNode{
                .name = "LCDTFTKOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SPDIFoutput = ClockNode{
                .name = "SPDIFoutput",
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

            var DFSDMAudioMult = ClockNode{
                .name = "DFSDMAudioMult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var DFSDMAudiooutput = ClockNode{
                .name = "DFSDMAudiooutput",
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

            var SDMMC2Mult = ClockNode{
                .name = "SDMMC2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SDMMC2output = ClockNode{
                .name = "SDMMC2output",
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

            var EthernetPtpOutput = ClockNode{
                .name = "EthernetPtpOutput",
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

            var USART6Mult = ClockNode{
                .name = "USART6Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART6output = ClockNode{
                .name = "USART6output",
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

            var UART7Mult = ClockNode{
                .name = "UART7Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART7output = ClockNode{
                .name = "UART7output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART8Mult = ClockNode{
                .name = "UART8Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var UART8output = ClockNode{
                .name = "UART8output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM1Mult = ClockNode{
                .name = "LPTIM1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var LPTIM1Output = ClockNode{
                .name = "LPTIM1Output",
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

            var PLLRoutput = ClockNode{
                .name = "PLLRoutput",
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

            var PLLSAIR = ClockNode{
                .name = "PLLSAIR",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLSAIRDiv = ClockNode{
                .name = "PLLSAIRDiv",
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

            var PLLI2SRoutput = ClockNode{
                .name = "PLLI2SRoutput",
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

            var PLLSAIRCLK = ClockNode{
                .name = "PLLSAIRCLK",
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

            var PLLI2SQCLK = ClockNode{
                .name = "PLLI2SQCLK",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLI2SRCLK = ClockNode{
                .name = "PLLI2SRCLK",
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
                const user_val = config.LSI_VALUE;
                LSIRC.limit = .{
                    .min = 1.7e4,
                    .max = 4.7e4,
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

            const PLL48CLockSelectionValue: PLL48CLockSelectionList = blk: {
                const user_val = config.PLL48CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CLK48SOURCE_PLLSAIP => USBSourceisPLLSAI = true,
                        .RCC_CLK48SOURCE_PLL => USBSourceisPLL = true,
                    }
                }
                break :blk user_val orelse {
                    USBSourceisPLL = true;
                    break :blk .RCC_CLK48SOURCE_PLL;
                };
            };

            const SAI1CLockSelectionValue: SAI1CLockSelectionList = blk: {
                const user_val = config.SAI1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI1CLKSOURCE_PLLSAI => SAI1SourcePLLSAI = true,
                        .RCC_SAI1CLKSOURCE_PLLI2S => SAI1SourcePLLI2S = true,
                        .RCC_SAI1CLKSOURCE_PIN => SAI1SourceEXT = true,
                        .RCC_SAI1CLKSOURCE_PLLSRC => SAI1SourcePLLsrc = true,
                    }
                }
                break :blk user_val orelse {
                    SAI1SourcePLLSAI = true;
                    break :blk .RCC_SAI1CLKSOURCE_PLLSAI;
                };
            };

            const SAI2CLockSelectionValue: SAI2CLockSelectionList = blk: {
                const user_val = config.SAI2CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SAI2CLKSOURCE_PLLSAI => SAI2SourcePLLSAI = true,
                        .RCC_SAI2CLKSOURCE_PLLI2S => SAI2SourcePLLI2S = true,
                        .RCC_SAI2CLKSOURCE_PIN => SAI2SourceEXT = true,
                        .RCC_SAI2CLKSOURCE_PLLSRC => SAI2SourcePLLsrc = true,
                    }
                }
                break :blk user_val orelse {
                    SAI2SourcePLLSAI = true;
                    break :blk .RCC_SAI2CLKSOURCE_PLLSAI;
                };
            };

            const DFSDMAudioSelectionValue: DFSDMAudioSelectionList = blk: {
                const user_val = config.DFSDMAudioSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DFSDM1AUDIOCLKSOURCE_SAI1 => DFSDMADSourceSAI1 = true,
                        .RCC_DFSDM1AUDIOCLKSOURCE_SAI2 => DFSDMADSourceSAI2 = true,
                    }
                }
                break :blk user_val orelse {
                    DFSDMADSourceSAI1 = true;
                    break :blk .RCC_DFSDM1AUDIOCLKSOURCE_SAI1;
                };
            };

            const SDMMCClockSelectionValue: SDMMCClockSelectionList = blk: {
                const user_val = config.SDMMCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SDMMC1CLKSOURCE_CLK48 => SDMMC1SourceCK48 = true,
                        .RCC_SDMMC1CLKSOURCE_SYSCLK => SDMMC1SourceSys = true,
                    }
                }
                break :blk user_val orelse {
                    SDMMC1SourceSys = true;
                    break :blk .RCC_SDMMC1CLKSOURCE_SYSCLK;
                };
            };

            const SDMMC2ClockSelectionValue: SDMMC2ClockSelectionList = blk: {
                const user_val = config.SDMMC2ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SDMMC2CLKSOURCE_CLK48 => SDMMC2SourceCK48 = true,
                        .RCC_SDMMC2CLKSOURCE_SYSCLK => SDMMC2SourceSys = true,
                    }
                }
                break :blk user_val orelse {
                    SDMMC2SourceSys = true;
                    break :blk .RCC_SDMMC2CLKSOURCE_SYSCLK;
                };
            };

            const I2SCLockSelectionValue: I2SCLockSelectionList = blk: {
                const user_val = config.I2SCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2SCLKSOURCE_EXT => I2SSourceIsEXT = true,
                        .RCC_I2SCLKSOURCE_PLLI2S => I2SSourceIsPLLI2SR = true,
                    }
                }
                break :blk user_val orelse {
                    I2SSourceIsPLLI2SR = true;
                    break :blk .RCC_I2SCLKSOURCE_PLLI2S;
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

            const USART6CLockSelectionValue: USART6CLockSelectionList = blk: {
                const user_val = config.USART6CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART6CLKSOURCE_PCLK2 => USART6SourcePCLK1 = true,
                        .RCC_USART6CLKSOURCE_SYSCLK => USART6SourceSys = true,
                        .RCC_USART6CLKSOURCE_HSI => USART6SourceHSI = true,
                        .RCC_USART6CLKSOURCE_LSE => USART6SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART6SourcePCLK1 = true;
                    break :blk .RCC_USART6CLKSOURCE_PCLK2;
                };
            };

            const UART4CLockSelectionValue: UART4CLockSelectionList = blk: {
                const user_val = config.UART4CLockSelection;

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

            const UART5CLockSelectionValue: UART5CLockSelectionList = blk: {
                const user_val = config.UART5CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART5CLKSOURCE_PCLK1 => UART5SourcePCLK1 = true,
                        .RCC_UART5CLKSOURCE_SYSCLK => UART5Sourcesys = true,
                        .RCC_UART5CLKSOURCE_HSI => UART5SourceHSI = true,
                        .RCC_UART5CLKSOURCE_LSE => UART5SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    UART5SourcePCLK1 = true;
                    break :blk .RCC_UART5CLKSOURCE_PCLK1;
                };
            };

            const UART7CLockSelectionValue: UART7CLockSelectionList = blk: {
                const user_val = config.UART7CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART7CLKSOURCE_PCLK1 => UART7SourcePCLK1 = true,
                        .RCC_UART7CLKSOURCE_SYSCLK => UART7Sourcesys = true,
                        .RCC_UART7CLKSOURCE_HSI => UART7SourceHSI = true,
                        .RCC_UART7CLKSOURCE_LSE => UART7SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    UART7SourcePCLK1 = true;
                    break :blk .RCC_UART7CLKSOURCE_PCLK1;
                };
            };

            const UART8CLockSelectionValue: UART8CLockSelectionList = blk: {
                const user_val = config.UART8CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_UART8CLKSOURCE_PCLK1 => UART8SourcePCLK1 = true,
                        .RCC_UART8CLKSOURCE_SYSCLK => UART8Sourcesys = true,
                        .RCC_UART8CLKSOURCE_HSI => UART8SourceHSI = true,
                        .RCC_UART8CLKSOURCE_LSE => UART8SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    UART8SourcePCLK1 = true;
                    break :blk .RCC_UART8CLKSOURCE_PCLK1;
                };
            };

            const LPTIM1CLockSelectionValue: LPTIM1CLockSelectionList = blk: {
                const user_val = config.LPTIM1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_LPTIM1CLKSOURCE_PCLK => {},
                        .RCC_LPTIM1CLKSOURCE_LSI => LPTIM1SOURCELSI = true,
                        .RCC_LPTIM1CLKSOURCE_HSI => LPTIM1SOURCEHSI = true,
                        .RCC_LPTIM1CLKSOURCE_LSE => LPTIM1SOURCELSE = true,
                    }
                }
                break :blk user_val orelse .RCC_LPTIM1CLKSOURCE_PCLK;
            };

            const HSI_Div_CECValue: u32 = blk: {
                break :blk 488;
            };

            const CECClockSelectionValue: CECClockSelectionList = blk: {
                const user_val = config.CECClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_CECCLKSOURCE_HSI => CECSourceHSI = true,
                        .RCC_CECCLKSOURCE_LSE => CECSourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    CECSourceHSI = true;
                    break :blk .RCC_CECCLKSOURCE_HSI;
                };
            };

            const DFSDMSelectionValue: DFSDMSelectionList = blk: {
                const user_val = config.DFSDMSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DFSDM1CLKSOURCE_PCLK => DFSDMisAPB2 = true,
                        .RCC_DFSDM1CLKSOURCE_SYSCLK => DFSDMissys = true,
                    }
                }
                break :blk user_val orelse {
                    DFSDMisAPB2 = true;
                    break :blk .RCC_DFSDM1CLKSOURCE_PCLK;
                };
            };

            const DSIPHY_DivValue: u32 = blk: {
                break :blk 8;
            };

            const DSICLockSelectionValue: DSICLockSelectionList = blk: {
                const user_val = config.DSICLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_DSICLKSOURCE_PLLR => DSISourceisPLLR = true,
                        .RCC_DSICLKSOURCE_DSIPHY => DSISourceisDSIPHY = true,
                    }
                }
                break :blk user_val orelse {
                    DSISourceisDSIPHY = true;
                    break :blk .RCC_DSICLKSOURCE_DSIPHY;
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

            const PLLSAIRValue: u32 = blk: {
                const user_val = config.PLLSAIR;
                if (user_val) |val| {
                    if (val < 2) {
                        return comptime_fail_or_error(error.InvalidConfig,
                            \\
                            \\Error on {s} | expr: {s} diagnostic: {s} 
                            \\Underflow Value - min: {d} found: {d}
                            \\note: ranges values may change depending on the configuration
                            \\
                        , .{
                            "PLLSAIR",
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
                            "PLLSAIR",
                            "Else",
                            "No additional information",
                            7,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 2;
            };

            const PLLSAIRDivValue: PLLSAIRDivList = blk: {
                const user_val = config.PLLSAIRDiv;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLSAIDIVR_2 => {},
                        .RCC_PLLSAIDIVR_4 => {},
                        .RCC_PLLSAIDIVR_8 => {},
                        .RCC_PLLSAIDIVR_16 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLSAIDIVR_2;
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
                        .RCC_PLLP_DIV2 => PLLI2SDiv2 = true,
                        .RCC_PLLP_DIV4 => PLLI2SDiv4 = true,
                        .RCC_PLLP_DIV6 => PLLI2SDiv6 = true,
                        .RCC_PLLP_DIV8 => PLLI2SDiv8 = true,
                    }
                }
                break :blk user_val orelse {
                    PLLI2SDiv2 = true;
                    break :blk .RCC_PLLP_DIV2;
                };
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

            const PLLUsedValue: u1 = blk: {
                if ((config.flags.DSIUsed_ForRCC and DSISourceisPLLR) or (SysSourceIsPLLclk) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and (config.flags.MCO1Config or (check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_MCO1_REQUIRED_TIM11")))) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_PLLCLK, .@"=")) and config.flags.MCO2Config) or (USBSourceisPLL and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.RNGUsed_ForRCC or (config.flags.SDMMC2Used_ForRCC and SDMMC2SourceCK48) or (config.flags.SDMMC1Used_ForRCC and SDMMC1SourceCK48)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLLSAIUsedValue: u1 = blk: {
                if (config.flags.LTDCUsed_ForRCC or ((SAI1SourcePLLSAI and ((config.flags.SAI1Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI1)))) or (SAI2SourcePLLSAI and (config.flags.SAI2Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI2)))) or (((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or (config.flags.SDMMC2Used_ForRCC and SDMMC2SourceCK48) or (SDMMC1SourceCK48 and config.flags.SDMMC1Used_ForRCC)) and USBSourceisPLLSAI))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLLI2SUsedValue: u1 = blk: {
                if ((config.flags.MCO2Config and MCOSourceIsPLLI2SP) or ((SAI1SourcePLLI2S and ((config.flags.SAI1Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI1)))) or (SAI2SourcePLLI2S and (config.flags.SAI2Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI2)))) or (I2SSourceIsPLLI2SR and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC)) or config.flags.SPDIFRXUsed_ForRCC) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((USART1SourceHSI and config.flags.USART1Used_ForRCC) or (USART2SourceHSI and config.flags.USART2Used_ForRCC) or (USART3SourceHSI and config.flags.USART3Used_ForRCC) or (USART6SourceHSI and config.flags.USART6Used_ForRCC) or (UART4SourceHSI and config.flags.UART4Used_ForRCC) or (UART5SourceHSI and config.flags.UART5Used_ForRCC) or (UART7SourceHSI and config.flags.UART7Used_ForRCC) or (UART8SourceHSI and config.flags.UART8Used_ForRCC) or (LPTIM1SOURCEHSI and config.flags.LPTIMUsed_ForRCC) or (I2C1SourceHSI and config.flags.I2C1Used_ForRCC) or (I2C2SourceHSI and config.flags.I2C2Used_ForRCC) or (I2C3SourceHSI and config.flags.I2C3Used_ForRCC) or (I2C4SourceHSI and config.flags.I2C4Used_ForRCC) or (CECSourceHSI and config.flags.CECUsed_ForRCC) or ((PLLSourceHSI) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAIUsedValue), PLLSAIUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLI2SUsedValue), PLLI2SUsedValue, 1, .@"=") or (SAI1SourcePLLsrc and (config.flags.SAI1Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI1))) or (SAI2SourcePLLsrc and (config.flags.SAI2Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI2))))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and (((config.flags.MCO1Config or (check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_MCO1_REQUIRED_TIM11"))))))) {
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
                        if (val > 31) {
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
                                31,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 16;
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
                if ((check_MCU("SEM2RCC_LSE_REQUIRED_TIM5") and check_MCU("TIM5") and check_MCU("Semaphore_input_Channel4TIM5")) or (CECSourceLSE and config.flags.CECUsed_ForRCC) or (USART1SourceLSE and config.flags.USART1Used_ForRCC) or (USART2SourceLSE and config.flags.USART2Used_ForRCC) or (USART3SourceLSE and config.flags.USART3Used_ForRCC) or (USART6SourceLSE and config.flags.USART6Used_ForRCC) or (UART4SourceLSE and config.flags.UART4Used_ForRCC) or (UART5SourceLSE and config.flags.UART5Used_ForRCC) or (UART7SourceLSE and config.flags.UART7Used_ForRCC) or (UART8SourceLSE and config.flags.UART8Used_ForRCC) or (LPTIM1SOURCELSE and config.flags.LPTIMUsed_ForRCC) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and (config.flags.MCO1Config or (check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_MCO1_REQUIRED_TIM11")))) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTCUsed_ForRCC))) {
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

            const RTCEnableValue: RTCEnableList = blk: {
                if (config.flags.RTCUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
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

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            const I2C4EnableValue: I2C4EnableList = blk: {
                if (config.flags.I2C4Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SDMMC1EnableValue: SDMMC1EnableList = blk: {
                if (config.flags.SDMMC1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SDMMC2EnableValue: SDMMC2EnableList = blk: {
                if (config.flags.SDMMC2Used_ForRCC) {
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

            const LCDEnableValue: LCDEnableList = blk: {
                if (config.flags.LTDCUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SPDIFEnableValue: SPDIFEnableList = blk: {
                if (config.flags.SPDIFRXUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SAI1EnableValue: SAI1EnableList = blk: {
                if ((config.flags.SAI1Used_ForRCC)) {
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

            const SAI2EnableValue: SAI2EnableList = blk: {
                if (config.flags.SAI2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2SEnableValue: I2SEnableList = blk: {
                if (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCO1OutPutEnableValue: MCO1OutPutEnableList = blk: {
                if (config.flags.MCO1Config or (check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_MCO1_REQUIRED_TIM11"))) {
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

            const USART6EnableValue: USART6EnableList = blk: {
                if (config.flags.USART6Used_ForRCC) {
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

            const UART7EnableValue: UART7EnableList = blk: {
                if (config.flags.UART7Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const UART8EnableValue: UART8EnableList = blk: {
                if (config.flags.UART8Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const LPTIM1EnableValue: LPTIM1EnableList = blk: {
                if (config.flags.LPTIMUsed_ForRCC) {
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

            const EnableDFSDMValue: EnableDFSDMList = blk: {
                if (config.flags.DFSDM1Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSEDSIValue: EnableHSEDSIList = blk: {
                if ((config.flags.DSIUsed_ForRCC) and (config.flags.HSEOscillator or config.flags.HSEByPass) or ((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11")))) {
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

            const EnablePLLRDSIValue: EnablePLLRDSIList = blk: {
                break :blk .false;
            };

            const MCO2I2SEnableValue: MCO2I2SEnableList = blk: {
                if ((config.flags.MCO2Config)) {
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

            const HSEUsedValue: u1 = blk: {
                if (config.flags.DSIUsed_ForRCC or ((config.flags.HSEByPass or config.flags.HSEOscillator) and (check_MCU("SEM2RCC_HSE_REQUIRED_TIM11") and check_MCU("TIM11") and check_MCU("Semaphore_input_Channel1TIM11"))) or ((config.flags.RTCUsed_ForRCC) and !((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) or ((PLLSourceHSE) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAIUsedValue), PLLSAIUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLI2SUsedValue), PLLI2SUsedValue, 1, .@"=") or (SAI1SourcePLLsrc and (config.flags.SAI1Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI1))) or (SAI2SourcePLLsrc and (config.flags.SAI2Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI2))))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSE, .@"=")) and ((config.flags.MCO1Config or (check_MCU("Semaphore_input_Channel1TIM11") and check_MCU("TIM11") and check_MCU("SEM2RCC_MCO1_REQUIRED_TIM11"))))) or (((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_HSE, .@"=")) or (MCOSourceIsPLLI2SP and (check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")))) and (config.flags.MCO2Config))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSIUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_LSI_REQUIRED_TIM5") and check_MCU("TIM5") and check_MCU("Semaphore_input_Channel4TIM5")) or (LPTIM1SOURCELSI and config.flags.LPTIMUsed_ForRCC) or (config.flags.IWDGUsed_ForRCC or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (config.flags.RTCUsed_ForRCC)))) {
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
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

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
            // ======= NODE PLL48Mult ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC2EnableValue), SDMMC2EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLL48Mult.nodetype = .multi;
                PLL48Mult.parents = switch (PLL48CLockSelectionValue) {
                    .RCC_CLK48SOURCE_PLL => &.{&PLLQ},
                    .RCC_CLK48SOURCE_PLLSAIP => &.{&PLLSAIP},
                };
            }
            // ======= NODE RNGoutput ======
            if (check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                RNGoutput.nodetype = .output;
                RNGoutput.parents = &.{&PLL48Mult};
            }
            // ======= NODE USBoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                USBoutput.nodetype = .output;
                USBoutput.parents = &.{&PLL48Mult};
            }
            // ======= NODE LCDTFTKOutput ======
            if (check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")) {
                if (check_MCU("LTDC_Exist")) {
                    LCDTFTKOutput.nodetype = .output;
                    LCDTFTKOutput.parents = &.{&PLLSAIRDiv};
                }
            }
            // ======= NODE SPDIFoutput ======
            if (check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                SPDIFoutput.nodetype = .output;
                SPDIFoutput.parents = &.{&PLLI2SP};
            }
            // ======= NODE SAI1Mult ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                SAI1Mult.nodetype = .multi;
                SAI1Mult.parents = switch (SAI1CLockSelectionValue) {
                    .RCC_SAI1CLKSOURCE_PLLSAI => &.{&PLLSAIQDiv},
                    .RCC_SAI1CLKSOURCE_PLLI2S => &.{&PLLI2SQDiv},
                    .RCC_SAI1CLKSOURCE_PIN => &.{&I2S_CKIN},
                    .RCC_SAI1CLKSOURCE_PLLSRC => &.{&PLLSource},
                };
            }
            // ======= NODE SAI1output ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=")) {
                SAI1output.nodetype = .output;
                SAI1output.parents = &.{&SAI1Mult};
            }
            // ======= NODE SAI2Mult ======
            if (check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                SAI2Mult.nodetype = .multi;
                SAI2Mult.parents = switch (SAI2CLockSelectionValue) {
                    .RCC_SAI2CLKSOURCE_PLLSAI => &.{&PLLSAIQDiv},
                    .RCC_SAI2CLKSOURCE_PLLI2S => &.{&PLLI2SQDiv},
                    .RCC_SAI2CLKSOURCE_PIN => &.{&I2S_CKIN},
                    .RCC_SAI2CLKSOURCE_PLLSRC => &.{&PLLSource},
                };
            }
            // ======= NODE SAI2output ======
            if (check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=")) {
                SAI2output.nodetype = .output;
                SAI2output.parents = &.{&SAI2Mult};
            }
            // ======= NODE DFSDMAudioMult ======
            if (check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                DFSDMAudioMult.nodetype = .multi;
                DFSDMAudioMult.parents = switch (DFSDMAudioSelectionValue) {
                    .RCC_DFSDM1AUDIOCLKSOURCE_SAI1 => &.{&SAI1Mult},
                    .RCC_DFSDM1AUDIOCLKSOURCE_SAI2 => &.{&SAI2Mult},
                };
            }
            // ======= NODE DFSDMAudiooutput ======
            if (check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                DFSDMAudiooutput.nodetype = .output;
                DFSDMAudiooutput.parents = &.{&DFSDMAudioMult};
            }
            // ======= NODE SDMMCMult ======
            if (check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=")) {
                SDMMCMult.nodetype = .multi;
                SDMMCMult.parents = switch (SDMMCClockSelectionValue) {
                    .RCC_SDMMC1CLKSOURCE_CLK48 => &.{&PLL48Mult},
                    .RCC_SDMMC1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE SDMMCoutput ======
            if (check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=")) {
                SDMMCoutput.nodetype = .output;
                SDMMCoutput.parents = &.{&SDMMCMult};
            }
            // ======= NODE SDMMC2Mult ======
            if (check_ref(@TypeOf(SDMMC2EnableValue), SDMMC2EnableValue, .true, .@"=")) {
                SDMMC2Mult.nodetype = .multi;
                SDMMC2Mult.parents = switch (SDMMC2ClockSelectionValue) {
                    .RCC_SDMMC2CLKSOURCE_CLK48 => &.{&PLL48Mult},
                    .RCC_SDMMC2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE SDMMC2output ======
            if (check_ref(@TypeOf(SDMMC2EnableValue), SDMMC2EnableValue, .true, .@"=")) {
                SDMMC2output.nodetype = .output;
                SDMMC2output.parents = &.{&SDMMC2Mult};
            }
            // ======= NODE I2SMult ======
            if (check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                I2SMult.nodetype = .multi;
                I2SMult.parents = switch (I2SCLockSelectionValue) {
                    .RCC_I2SCLKSOURCE_PLLI2S => &.{&PLLI2SR},
                    .RCC_I2SCLKSOURCE_EXT => &.{&I2S_CKIN},
                };
            }
            // ======= NODE I2Soutput ======
            if (check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                I2Soutput.nodetype = .output;
                I2Soutput.parents = &.{&I2SMult};
            }
            // ======= NODE EthernetPtpOutput ======
            EthernetPtpOutput.nodetype = .output;
            EthernetPtpOutput.parents = &.{&AHBPrescaler};

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
            // ======= NODE USART6Mult ======
            if (check_ref(@TypeOf(USART6EnableValue), USART6EnableValue, .true, .@"=")) {
                USART6Mult.nodetype = .multi;
                USART6Mult.parents = switch (USART6CLockSelectionValue) {
                    .RCC_USART6CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                    .RCC_USART6CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART6CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART6CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE USART6output ======
            if (check_ref(@TypeOf(USART6EnableValue), USART6EnableValue, .true, .@"=")) {
                USART6output.nodetype = .output;
                USART6output.parents = &.{&USART6Mult};
            }
            // ======= NODE UART4Mult ======
            if (check_ref(@TypeOf(UART4EnableValue), UART4EnableValue, .true, .@"=")) {
                UART4Mult.nodetype = .multi;
                UART4Mult.parents = switch (UART4CLockSelectionValue) {
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
                UART5Mult.nodetype = .multi;
                UART5Mult.parents = switch (UART5CLockSelectionValue) {
                    .RCC_UART5CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_UART5CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_UART5CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_UART5CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE UART5output ======
            if (check_ref(@TypeOf(UART5EnableValue), UART5EnableValue, .true, .@"=")) {
                UART5output.nodetype = .output;
                UART5output.parents = &.{&UART5Mult};
            }
            // ======= NODE UART7Mult ======
            if (check_ref(@TypeOf(UART7EnableValue), UART7EnableValue, .true, .@"=")) {
                UART7Mult.nodetype = .multi;
                UART7Mult.parents = switch (UART7CLockSelectionValue) {
                    .RCC_UART7CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_UART7CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_UART7CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_UART7CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE UART7output ======
            if (check_ref(@TypeOf(UART7EnableValue), UART7EnableValue, .true, .@"=")) {
                UART7output.nodetype = .output;
                UART7output.parents = &.{&UART7Mult};
            }
            // ======= NODE UART8Mult ======
            if (check_ref(@TypeOf(UART8EnableValue), UART8EnableValue, .true, .@"=")) {
                UART8Mult.nodetype = .multi;
                UART8Mult.parents = switch (UART8CLockSelectionValue) {
                    .RCC_UART8CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                    .RCC_UART8CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_UART8CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_UART8CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE UART8output ======
            if (check_ref(@TypeOf(UART8EnableValue), UART8EnableValue, .true, .@"=")) {
                UART8output.nodetype = .output;
                UART8output.parents = &.{&UART8Mult};
            }
            // ======= NODE LPTIM1Mult ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1Mult.nodetype = .multi;
                LPTIM1Mult.parents = switch (LPTIM1CLockSelectionValue) {
                    .RCC_LPTIM1CLKSOURCE_PCLK => &.{&APB1Prescaler},
                    .RCC_LPTIM1CLKSOURCE_LSI => &.{&LSIRC},
                    .RCC_LPTIM1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_LPTIM1CLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE LPTIM1Output ======
            if (check_ref(@TypeOf(LPTIM1EnableValue), LPTIM1EnableValue, .true, .@"=")) {
                LPTIM1Output.nodetype = .output;
                LPTIM1Output.parents = &.{&LPTIM1Mult};
            }
            // ======= NODE HSIDivCEC ======
            if (check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"=")) {
                HSIDivCEC.nodetype = .div;
                HSIDivCEC.value = @floatFromInt(HSI_Div_CECValue);
                HSIDivCEC.parents = &.{&HSIRC};
            }
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
            // ======= NODE DFSDMMult ======
            if (check_ref(@TypeOf(EnableDFSDMValue), EnableDFSDMValue, .true, .@"=")) {
                DFSDMMult.nodetype = .multi;
                DFSDMMult.parents = switch (DFSDMSelectionValue) {
                    .RCC_DFSDM1CLKSOURCE_PCLK => &.{&APB2Prescaler},
                    .RCC_DFSDM1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE DFSDMoutput ======
            if (check_ref(@TypeOf(EnableDFSDMValue), EnableDFSDMValue, .true, .@"=")) {
                DFSDMoutput.nodetype = .output;
                DFSDMoutput.parents = &.{&DFSDMMult};
            }
            // ======= NODE DSIPHYPrescaler ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    DSIPHYPrescaler.nodetype = .div;
                    DSIPHYPrescaler.value = @floatFromInt(DSIPHY_DivValue);
                    DSIPHYPrescaler.parents = &.{&PLLDSIODF};
                }
            }
            // ======= NODE DSIMult ======
            if (check_ref(@TypeOf(EnableDSIValue), EnableDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    DSIMult.nodetype = .multi;
                    DSIMult.parents = switch (DSICLockSelectionValue) {
                        .RCC_DSICLKSOURCE_PLLR => &.{&PLLRoutput},
                        .RCC_DSICLKSOURCE_DSIPHY => &.{&DSIPHYPrescaler},
                    };
                }
            }
            // ======= NODE DSIoutput ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    DSIoutput.nodetype = .output;
                    DSIoutput.parents = &.{&DSIMult};
                }
            }
            // ======= NODE DSITXPrescaler ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    DSITXPrescaler.nodetype = .div;
                    DSITXPrescaler.value = @floatFromInt(DSITX_DivValue);
                    DSITXPrescaler.parents = &.{&DSIMult};
                }
            }
            // ======= NODE DSITXCLKEsc ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    DSITXCLKEsc.nodetype = .output;
                    DSITXCLKEsc.parents = &.{&DSITXPrescaler};
                }
            }
            // ======= NODE PLLDSIIDF ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    PLLDSIIDF.nodetype = .div;
                    PLLDSIIDF.value = try PLLDSIIDFValue.get();
                    PLLDSIIDF.parents = &.{&HSEOSC};
                }
            }
            // ======= NODE PLLDSIMultiplicator ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    PLLDSIMultiplicator.nodetype = .mul;
                    PLLDSIMultiplicator.value = @floatFromInt(PLLDSIMultValue);
                    PLLDSIMultiplicator.parents = &.{&PLLDSIIDF};
                }
            }
            // ======= NODE PLLDSINDIV ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    PLLDSINDIV.nodetype = .mul;
                    PLLDSINDIV.value = @floatFromInt(PLLDSINDIVValue);
                    PLLDSINDIV.parents = &.{&PLLDSIMultiplicator};
                }
            }
            // ======= NODE VCOoutput ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    VCOoutput.nodetype = .output;
                    VCOoutput.parents = &.{&PLLDSINDIV};
                }
            }
            // ======= NODE PLLDSIDevisor ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    PLLDSIDevisor.nodetype = .div;
                    PLLDSIDevisor.value = @floatFromInt(PLLDSIDevValue);
                    PLLDSIDevisor.parents = &.{&VCOoutput};
                }
            }
            // ======= NODE PLLDSIODF ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    PLLDSIODF.nodetype = .div;
                    PLLDSIODF.value = try PLLDSIODFValue.get();
                    PLLDSIODF.parents = &.{&PLLDSIDevisor};
                }
            }
            // ======= NODE PLLDSIoutput ======
            if (check_ref(@TypeOf(EnableHSEDSIValue), EnableHSEDSIValue, .true, .@"=")) {
                if (check_MCU("DSIHOST_Exist")) {
                    PLLDSIoutput.nodetype = .output;
                    PLLDSIoutput.parents = &.{&PLLDSIODF};
                }
            }
            // ======= NODE PLLN ======
            PLLN.nodetype = .mul;
            PLLN.value = @floatFromInt(PLLNValue);
            PLLN.parents = &.{&PLLM};

            // ======= NODE PLLP ======
            PLLP.nodetype = .div;
            PLLP.value = try PLLPValue.get();
            PLLP.parents = &.{&PLLN};

            // ======= NODE PLLQ ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC2EnableValue), SDMMC2EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLQ.nodetype = .div;
                PLLQ.value = @floatFromInt(PLLQValue);
                PLLQ.parents = &.{&PLLN};
            }
            // ======= NODE PLLQoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC2EnableValue), SDMMC2EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLQoutput.nodetype = .output;
                PLLQoutput.parents = &.{&PLLQ};
            }
            // ======= NODE PLLR ======
            if (check_ref(@TypeOf(EnableDSIValue), EnableDSIValue, .true, .@"=")) {
                PLLR.nodetype = .div;
                PLLR.value = @floatFromInt(PLLRValue);
                PLLR.parents = &.{&PLLN};
            }
            // ======= NODE PLLRoutput ======
            if (false) {
                PLLRoutput.nodetype = .output;
                PLLRoutput.parents = &.{&PLLR};
            }
            // ======= NODE PLLSAIN ======
            PLLSAIN.nodetype = .mul;
            PLLSAIN.value = @floatFromInt(PLLSAINValue);
            PLLSAIN.parents = &.{&PLLM};

            // ======= NODE PLLSAIP ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC2EnableValue), SDMMC2EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLSAIP.nodetype = .div;
                PLLSAIP.value = try PLLSAIPValue.get();
                PLLSAIP.parents = &.{&PLLSAIN};
            }
            // ======= NODE PLLSAIoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC1EnableValue), SDMMC1EnableValue, .true, .@"=") or check_ref(@TypeOf(SDMMC2EnableValue), SDMMC2EnableValue, .true, .@"=") or check_ref(@TypeOf(RNGEnableValue), RNGEnableValue, .true, .@"=")) {
                PLLSAIoutput.nodetype = .output;
                PLLSAIoutput.parents = &.{&PLLSAIP};
            }
            // ======= NODE PLLSAIQ ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or false or check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                PLLSAIQ.nodetype = .div;
                PLLSAIQ.value = @floatFromInt(PLLSAIQValue);
                PLLSAIQ.parents = &.{&PLLSAIN};
            }
            // ======= NODE PLLSAIQDiv ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                PLLSAIQDiv.nodetype = .div;
                PLLSAIQDiv.value = @floatFromInt(PLLSAIQDivValue);
                PLLSAIQDiv.parents = &.{&PLLSAIQ};
            }
            // ======= NODE PLLSAIR ======
            if (check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")) {
                PLLSAIR.nodetype = .div;
                PLLSAIR.value = @floatFromInt(PLLSAIRValue);
                PLLSAIR.parents = &.{&PLLSAIN};
            }
            // ======= NODE PLLSAIRDiv ======
            if (check_ref(@TypeOf(LCDEnableValue), LCDEnableValue, .true, .@"=")) {
                PLLSAIRDiv.nodetype = .div;
                PLLSAIRDiv.value = try PLLSAIRDivValue.get();
                PLLSAIRDiv.parents = &.{&PLLSAIR};
            }
            // ======= NODE PLLI2SN ======
            PLLI2SN.nodetype = .mul;
            PLLI2SN.value = @floatFromInt(PLLI2SNValue);
            PLLI2SN.parents = &.{&PLLM};

            // ======= NODE PLLI2SP ======
            if (check_ref(@TypeOf(SPDIFEnableValue), SPDIFEnableValue, .true, .@"=")) {
                PLLI2SP.nodetype = .div;
                PLLI2SP.value = try PLLI2SPValue.get();
                PLLI2SP.parents = &.{&PLLI2SN};
            }
            // ======= NODE PLLI2SQ ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                PLLI2SQ.nodetype = .div;
                PLLI2SQ.value = @floatFromInt(PLLI2SQValue);
                PLLI2SQ.parents = &.{&PLLI2SN};
            }
            // ======= NODE PLLI2SQDiv ======
            if (check_ref(@TypeOf(SAI1EnableValue), SAI1EnableValue, .true, .@"=") or check_ref(@TypeOf(SAI2EnableValue), SAI2EnableValue, .true, .@"=") or check_ref(@TypeOf(EnableDFSDMAudioValue), EnableDFSDMAudioValue, .true, .@"=")) {
                PLLI2SQDiv.nodetype = .div;
                PLLI2SQDiv.value = @floatFromInt(PLLI2SQDivValue);
                PLLI2SQDiv.parents = &.{&PLLI2SQ};
            }
            // ======= NODE PLLI2SR ======
            if (check_ref(@TypeOf(MCO2I2SEnableValue), MCO2I2SEnableValue, .true, .@"=") or check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                PLLI2SR.nodetype = .div;
                PLLI2SR.value = @floatFromInt(PLLI2SRValue);
                PLLI2SR.parents = &.{&PLLI2SN};
            }
            // ======= NODE PLLI2SRoutput ======
            if (check_ref(@TypeOf(MCO2I2SEnableValue), MCO2I2SEnableValue, .true, .@"=") or check_ref(@TypeOf(I2SEnableValue), I2SEnableValue, .true, .@"=")) {
                PLLI2SRoutput.nodetype = .output;
                PLLI2SRoutput.parents = &.{&PLLI2SR};
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

            // ======= NODE VCOSAIOutput ======
            VCOSAIOutput.nodetype = .output;
            VCOSAIOutput.parents = &.{&PLLSAIN};

            // ======= NODE PLLSAIPCLK ======
            PLLSAIPCLK.nodetype = .output;
            PLLSAIPCLK.parents = &.{&PLLSAIP};

            // ======= NODE PLLSAIQCLK ======
            PLLSAIQCLK.nodetype = .output;
            PLLSAIQCLK.parents = &.{&PLLSAIQ};

            // ======= NODE PLLSAIRCLK ======
            PLLSAIRCLK.nodetype = .output;
            PLLSAIRCLK.parents = &.{&PLLSAIR};

            // ======= NODE VCOI2SOutput ======
            VCOI2SOutput.nodetype = .output;
            VCOI2SOutput.parents = &.{&PLLI2SN};

            // ======= NODE PLLI2SPCLK ======
            PLLI2SPCLK.nodetype = .output;
            PLLI2SPCLK.parents = &.{&PLLI2SP};

            // ======= NODE PLLI2SQCLK ======
            PLLI2SQCLK.nodetype = .output;
            PLLI2SQCLK.parents = &.{&PLLI2SQ};

            // ======= NODE PLLI2SRCLK ======
            PLLI2SRCLK.nodetype = .output;
            PLLI2SRCLK.parents = &.{&PLLI2SR};

            //======== POST REFS ========

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")))) {
                RTCOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

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

            //======= RNGFreq_Value ========
            const RNGFreq_ValueValue = RNGoutput.get_as_ref();
            ignore_value(RNGFreq_ValueValue);

            RNGoutput.limit = .{
                .min = null,
                .max = 4.8e7,
            };

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);
            if (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC) {
                USBoutput.limit = .{
                    .min = 4.788e7,
                    .max = 4.812e7,
                };
            }

            //======= LCDTFTFreq_Value ========
            const LCDTFTFreq_ValueValue = LCDTFTKOutput.get_as_ref();
            ignore_value(LCDTFTFreq_ValueValue);

            //======= SPDIFRXFreq_Value ========
            const SPDIFRXFreq_ValueValue = SPDIFoutput.get_as_ref();
            ignore_value(SPDIFRXFreq_ValueValue);

            SPDIFoutput.limit = .{
                .min = 5.632e6,
                .max = null,
            };

            //======= SAI1Freq_Value ========
            const SAI1Freq_ValueValue = SAI1output.get_as_ref();
            ignore_value(SAI1Freq_ValueValue);

            //======= SAI2Freq_Value ========
            const SAI2Freq_ValueValue = SAI2output.get_as_ref();
            ignore_value(SAI2Freq_ValueValue);

            //======= DFSDMAudioFreq_Value ========
            const DFSDMAudioFreq_ValueValue = DFSDMAudiooutput.get_as_ref();
            ignore_value(DFSDMAudioFreq_ValueValue);

            //======= SDMMCFreq_Value ========
            const SDMMCFreq_ValueValue = SDMMCoutput.get_as_ref();
            ignore_value(SDMMCFreq_ValueValue);

            SDMMCoutput.limit = .{
                .min = null,
                .max = 5e7,
            };

            //======= SDMMC2Freq_Value ========
            const SDMMC2Freq_ValueValue = SDMMC2output.get_as_ref();
            ignore_value(SDMMC2Freq_ValueValue);

            SDMMC2output.limit = .{
                .min = null,
                .max = 5e7,
            };

            //======= I2SFreq_Value ========
            const I2SFreq_ValueValue = I2Soutput.get_as_ref();
            ignore_value(I2SFreq_ValueValue);

            //======= EthernetFreq_Value ========
            const EthernetFreq_ValueValue = EthernetPtpOutput.get_as_ref();
            ignore_value(EthernetFreq_ValueValue);

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCO1Pin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= MCO2PinFreq_Value ========
            const MCO2PinFreq_ValueValue = MCO2Pin.get_as_ref();
            ignore_value(MCO2PinFreq_ValueValue);

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if ((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_HSUsed_ForRCC)) {
                AHBOutput.limit = .{
                    .min = 3e7,
                    .max = 2.16e8,
                };
            } else if (config.flags.ETHUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 2.5e7,
                    .max = 2.16e8,
                };
            } else if (config.flags.USB_OTG_FSUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 1.42e7,
                    .max = 2.16e8,
                };
            } else {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 2.16e8,
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
                const max_APB1Output = 54000000;
                const min_APB1Output = try math_op(?@TypeOf(RTCFreq_ValueValue), RTCFreq_ValueValue, 4, .@"*", "RTCFreq_Value");

                APB1Output.limit = .{
                    .min = min_APB1Output,
                    .max = max_APB1Output,
                    .min_expr = "=RTCFreq_Value*4",
                    .max_expr = "54000000",
                };
            } else {
                APB1Output.limit = .{
                    .min = null,
                    .max = 5.4e7,
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
                .max = 1.08e8,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);

            //======= USART6Freq_Value ========
            const USART6Freq_ValueValue = USART6output.get_as_ref();
            ignore_value(USART6Freq_ValueValue);

            //======= UART4Freq_Value ========
            const UART4Freq_ValueValue = UART4output.get_as_ref();
            ignore_value(UART4Freq_ValueValue);

            //======= UART5Freq_Value ========
            const UART5Freq_ValueValue = UART5output.get_as_ref();
            ignore_value(UART5Freq_ValueValue);

            //======= UART7Freq_Value ========
            const UART7Freq_ValueValue = UART7output.get_as_ref();
            ignore_value(UART7Freq_ValueValue);

            //======= UART8Freq_Value ========
            const UART8Freq_ValueValue = UART8output.get_as_ref();
            ignore_value(UART8Freq_ValueValue);

            //======= LPTIM1Freq_Value ========
            const LPTIM1Freq_ValueValue = LPTIM1Output.get_as_ref();
            ignore_value(LPTIM1Freq_ValueValue);

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECOutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);

            //======= DFSDMFreq_Value ========
            const DFSDMFreq_ValueValue = DFSDMoutput.get_as_ref();
            ignore_value(DFSDMFreq_ValueValue);

            //======= DSIFreq_Value ========
            const DSIFreq_ValueValue = DSIoutput.get_as_ref();
            ignore_value(DSIFreq_ValueValue);
            if (config.flags.DSIUsed_ForRCC and DSISourceisPLLR) {
                DSIoutput.limit = .{
                    .min = null,
                    .max = 6.25e7,
                };
            } else {
                DSIoutput.limit = .{
                    .min = null,
                    .max = 6.25e7,
                };
            }

            //======= DSITXEscFreq_Value ========
            const DSITXEscFreq_ValueValue = DSITXCLKEsc.get_as_ref();
            ignore_value(DSITXEscFreq_ValueValue);

            DSITXCLKEsc.limit = .{
                .min = null,
                .max = 2e7,
            };

            //======= PLLDSIVCOFreq_Value ========
            const PLLDSIVCOFreq_ValueValue = VCOoutput.get_as_ref();
            ignore_value(PLLDSIVCOFreq_ValueValue);

            VCOoutput.limit = .{
                .min = 5e8,
                .max = 1e9,
            };

            //======= PLLDSIFreq_Value ========
            const PLLDSIFreq_ValueValue = PLLDSIoutput.get_as_ref();
            ignore_value(PLLDSIFreq_ValueValue);

            PLLDSIoutput.limit = .{
                .min = 8e7,
                .max = 5e8,
            };

            //======= PLLQoutputFreq_Value ========
            const PLLQoutputFreq_ValueValue = PLLQoutput.get_as_ref();
            ignore_value(PLLQoutputFreq_ValueValue);
            if ((USBSourceisPLL and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.RNGUsed_ForRCC or (config.flags.SDMMC2Used_ForRCC and SDMMC2SourceCK48) or (config.flags.SDMMC1Used_ForRCC and SDMMC1SourceCK48)))) {
                PLLQoutput.limit = .{
                    .min = null,
                    .max = 7.5e7,
                };
            }

            //======= PLLRFreq_Value ========
            const PLLRFreq_ValueValue = PLLRoutput.get_as_ref();
            ignore_value(PLLRFreq_ValueValue);

            //======= PLLSAIoutputFreq_Value ========
            const PLLSAIoutputFreq_ValueValue = PLLSAIoutput.get_as_ref();
            ignore_value(PLLSAIoutputFreq_ValueValue);
            if ((((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or (config.flags.SDMMC2Used_ForRCC and SDMMC2SourceCK48) or (SDMMC1SourceCK48 and config.flags.SDMMC1Used_ForRCC)) and USBSourceisPLLSAI))) {
                PLLSAIoutput.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLI2SRoutputFreq_Value ========
            const PLLI2SRoutputFreq_ValueValue = PLLI2SRoutput.get_as_ref();
            ignore_value(PLLI2SRoutputFreq_ValueValue);
            if ((config.flags.MCO2Config and MCOSourceIsPLLI2SP) or (I2SSourceIsPLLI2SR and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC))) {
                PLLI2SRoutput.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= VCOInputFreq_Value ========
            const VCOInputFreq_ValueValue = VCOInput.get_as_ref();
            ignore_value(VCOInputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLSAIUsedValue), PLLSAIUsedValue, 1, .@"=") or check_ref(@TypeOf(PLLI2SUsedValue), PLLI2SUsedValue, 1, .@"=")) {
                VCOInput.limit = .{
                    .min = 9.5e5,
                    .max = 2.1e6,
                };
            }

            //======= VCOOutputFreq_Value ========
            const VCOOutputFreq_ValueValue = VCOOutput.get_as_ref();
            ignore_value(VCOOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCOOutput.limit = .{
                    .min = 1.92e8,
                    .max = 4.32e8,
                };
            }

            //======= PLLCLKFreq_Value ========
            const PLLCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = 2.4e7,
                    .max = 2.16e8,
                };
            }

            //======= PLLQCLKFreq_Value ========
            const PLLQCLKFreq_ValueValue = PLLQCLK.get_as_ref();
            ignore_value(PLLQCLKFreq_ValueValue);
            if ((USBSourceisPLL and (config.flags.USB_OTG_FSUsed_ForRCC or config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.RNGUsed_ForRCC or (config.flags.SDMMC2Used_ForRCC and SDMMC2SourceCK48) or (config.flags.SDMMC1Used_ForRCC and SDMMC1SourceCK48)))) {
                PLLQCLK.limit = .{
                    .min = null,
                    .max = 7.5e7,
                };
            }

            //======= VCOSAIOutputFreq_Value ========
            const VCOSAIOutputFreq_ValueValue = VCOSAIOutput.get_as_ref();
            ignore_value(VCOSAIOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLSAIUsedValue), PLLSAIUsedValue, 1, .@"=")) {
                VCOSAIOutput.limit = .{
                    .min = 1.92e8,
                    .max = 4.32e8,
                };
            }

            //======= PLLSAIPCLKFreq_Value ========
            const PLLSAIPCLKFreq_ValueValue = PLLSAIPCLK.get_as_ref();
            ignore_value(PLLSAIPCLKFreq_ValueValue);
            if ((((config.flags.USB_OTG_HSEmbeddedPHYUsed_ForRCC or config.flags.USB_OTG_FSUsed_ForRCC or config.flags.RNGUsed_ForRCC or (config.flags.SDMMC2Used_ForRCC and SDMMC2SourceCK48) or (SDMMC1SourceCK48 and config.flags.SDMMC1Used_ForRCC)) and USBSourceisPLLSAI))) {
                PLLSAIPCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLSAIQCLKFreq_Value ========
            const PLLSAIQCLKFreq_ValueValue = PLLSAIQCLK.get_as_ref();
            ignore_value(PLLSAIQCLKFreq_ValueValue);
            if (((SAI1SourcePLLSAI and ((config.flags.SAI1Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI1)))) or (SAI2SourcePLLSAI and (config.flags.SAI2Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI2))))) {
                PLLSAIQCLK.limit = .{
                    .min = null,
                    .max = 7.5e7,
                };
            }

            //======= PLLSAIRCLKFreq_Value ========
            const PLLSAIRCLKFreq_ValueValue = PLLSAIRCLK.get_as_ref();
            ignore_value(PLLSAIRCLKFreq_ValueValue);
            if (config.flags.LTDCUsed_ForRCC) {
                PLLSAIRCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= VCOI2SOutputFreq_Value ========
            const VCOI2SOutputFreq_ValueValue = VCOI2SOutput.get_as_ref();
            ignore_value(VCOI2SOutputFreq_ValueValue);
            if (check_ref(@TypeOf(PLLI2SUsedValue), PLLI2SUsedValue, 1, .@"=")) {
                VCOI2SOutput.limit = .{
                    .min = 1.92e8,
                    .max = 4.32e8,
                };
            }

            //======= PLLI2SPCLKFreq_Value ========
            const PLLI2SPCLKFreq_ValueValue = PLLI2SPCLK.get_as_ref();
            ignore_value(PLLI2SPCLKFreq_ValueValue);
            if (config.flags.SPDIFRXUsed_ForRCC) {
                PLLI2SPCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLI2SQCLKFreq_Value ========
            const PLLI2SQCLKFreq_ValueValue = PLLI2SQCLK.get_as_ref();
            ignore_value(PLLI2SQCLKFreq_ValueValue);
            if (((SAI1SourcePLLI2S and ((config.flags.SAI1Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI1)))) or (SAI2SourcePLLI2S and (config.flags.SAI2Used_ForRCC or (config.flags.DFSDM1Used_ForRCC and check_MCU("SEM2RCC_SAI1_CK_REQUIRED_DFSDM1") and DFSDMADSourceSAI2))))) {
                PLLI2SQCLK.limit = .{
                    .min = null,
                    .max = 2.16e8,
                };
            }

            //======= PLLI2SRCLKFreq_Value ========
            const PLLI2SRCLKFreq_ValueValue = PLLI2SRCLK.get_as_ref();
            ignore_value(PLLI2SRCLKFreq_ValueValue);
            if ((config.flags.MCO2Config and MCOSourceIsPLLI2SP) or (I2SSourceIsPLLI2SR and (config.flags.I2S1Used_ForRCC or config.flags.I2S2Used_ForRCC or config.flags.I2S3Used_ForRCC))) {
                PLLI2SRCLK.limit = .{
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

            const PWR_Regulator_Voltage_ScaleValue: PWR_Regulator_Voltage_ScaleList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@">")))) {
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
                                "((HCLKFreq_Value > 180000000))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if (((check_ref(@TypeOf(config.extra_config.PWREXT_OverDrive), config.extra_config.PWREXT_OverDrive, .PWREXT_OverDrive_DESACTIVATED, .@"=")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@">"))))) {
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
                                "((PWREXT_OverDrive=PWREXT_OverDrive_DESACTIVATED)&((HCLKFreq_Value > 168000000)))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if (((check_ref(@TypeOf(config.extra_config.PWREXT_OverDrive), config.extra_config.PWREXT_OverDrive, .PWREXT_OverDrive_ACTIVATED, .@"=")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@">"))))) {
                    const user_val = config.extra_config.PWR_Regulator_Voltage_Scale;

                    if (user_val) |val| {
                        switch (val) {
                            .PWR_REGULATOR_VOLTAGE_SCALE1 => {},
                            .PWR_REGULATOR_VOLTAGE_SCALE2 => {},
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
                                    "((PWREXT_OverDrive=PWREXT_OverDrive_ACTIVATED)&((HCLKFreq_Value > 168000000)))",
                                    "",
                                    if (patch_logs) @tagName(try val.to_enum()) else @tagName(val),
                                    if (patch_logs) "SCALE1" else "PWR_REGULATOR_VOLTAGE_SCALE1",
                                    if (patch_logs) "SCALE2" else "PWR_REGULATOR_VOLTAGE_SCALE2",
                                });
                            },
                        }
                    }
                    break :blk user_val orelse .PWR_REGULATOR_VOLTAGE_SCALE1;
                } else if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@">"))) {
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
                                    "(HCLKFreq_Value > 144000000)",
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

            const PWREXT_OverDriveValue: PWREXT_OverDriveList = blk: {
                if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@">")) or (check_ref(@TypeOf(APB1Freq_ValueValue), APB1Freq_ValueValue, 45000000, .@">")) or (check_ref(@TypeOf(APB2Freq_ValueValue), APB2Freq_ValueValue, 90000000, .@">"))) {
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
                                "(HCLKFreq_Value > 180000000)|(APB1Freq_Value > 45000000)|(APB2Freq_Value > 90000000) ",
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
                } else if (check_ref(@TypeOf(config.extra_config.PWR_Regulator_Voltage_Scale), config.extra_config.PWR_Regulator_Voltage_Scale, .PWR_REGULATOR_VOLTAGE_SCALE3, .@"=")) {
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
                                "PWR_Regulator_Voltage_Scale = PWR_REGULATOR_VOLTAGE_SCALE3",
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
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 150000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 110000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 132000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 132000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 100000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@"=")))))) {
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7)) &  ((VDD_VALUE < 3.6)|(VDD_VALUE =3.6  ))) & ((HCLKFreq_Value > 150000000) &  ((HCLKFreq_Value < 180000000)|(HCLKFreq_Value= 180000000 ))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4 )) &   ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7 ))) & ((HCLKFreq_Value > 120000000) & ((HCLKFreq_Value < 144000000)|(HCLKFreq_Value =144000000  ))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1 )) &   ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4 ))) & ((HCLKFreq_Value > 110000000) & ((HCLKFreq_Value < 132000000)|(HCLKFreq_Value = 132000000 ))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8  )) &    ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 100000000) & ((HCLKFreq_Value < 120000000)|(HCLKFreq_Value = 120000000 ))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_5;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 144000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 132000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 154000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 154000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 120000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@"=")))))) {
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7)) &((VDD_VALUE < 3.6)|(VDD_VALUE =3.6))) &  ((HCLKFreq_Value > 180000000) &  ((HCLKFreq_Value < 210000000)|(HCLKFreq_Value= 210000000 ))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4)) & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 144000000) & ((HCLKFreq_Value < 168000000)|(HCLKFreq_Value = 168000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1)) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 132000000) & ((HCLKFreq_Value < 154000000)|(HCLKFreq_Value = 154000000))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8)) &  ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 120000000) & ((HCLKFreq_Value < 140000000)|(HCLKFreq_Value = 140000000))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_6;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 3.6, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 210000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 216000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 216000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 168000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 192000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 192000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 154000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 176000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 176000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 140000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@"=")))))) {
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
                                "\r\n\t\t((((VDD_VALUE > 2.7)|(VDD_VALUE = 2.7)) &((VDD_VALUE < 3.6)|(VDD_VALUE =3.6))) &  ((HCLKFreq_Value > 210000000) & ((HCLKFreq_Value < 216000000)|(HCLKFreq_Value = 216000000 ))))|\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4)) & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 168000000) & ((HCLKFreq_Value < 192000000)|(HCLKFreq_Value = 192000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1)) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 154000000) & ((HCLKFreq_Value < 176000000)|(HCLKFreq_Value = 176000000))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8)) &  ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 140000000) & ((HCLKFreq_Value < 160000000)|(HCLKFreq_Value = 160000000))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_7;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.7, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 192000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 216000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 216000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 176000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 198000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 198000000, .@"="))))) or ((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 160000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 180000000, .@"=")))))) {
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
                                "\r\n\t\t((((VDD_VALUE > 2.4)|(VDD_VALUE= 2.4)) & ((VDD_VALUE < 2.7)|(VDD_VALUE = 2.7))) & ((HCLKFreq_Value > 192000000) & ((HCLKFreq_Value < 216000000)|(HCLKFreq_Value = 216000000))))|\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1)) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 176000000)& ((HCLKFreq_Value < 198000000)|(HCLKFreq_Value = 198000000))))|\r\n\t\t((((VDD_VALUE > 1.8)|(VDD_VALUE=1.8)) &  ((VDD_VALUE < 2.1)|(VDD_VALUE = 2.1))) & ((HCLKFreq_Value > 160000000) & ((HCLKFreq_Value < 180000000)|(HCLKFreq_Value = 180000000))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_8;
                } else if (((((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@"="))) and ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.4, .@"=")))) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 198000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 216000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 216000000, .@"=")))))) {
                    if (config.extra_config.FLatency) |val| {
                        if (val != .FLASH_LATENCY_9) {
                            const patch_str = if (patch_logs) "WS9" else "FLASH_LATENCY_9";
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
                                "\r\n\t\t((((VDD_VALUE > 2.1)|(VDD_VALUE= 2.1)) & ((VDD_VALUE < 2.4)|(VDD_VALUE = 2.4))) & ((HCLKFreq_Value > 198000000)& ((HCLKFreq_Value < 216000000)|(HCLKFreq_Value = 216000000))))",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_9;
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
                        .FLASH_LATENCY_9 => {},
                    }
                }
                break :blk user_val orelse .FLASH_LATENCY_0;
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
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2output = try I2C2output.get_output();
            out.I2C3Mult = try I2C3Mult.get_output();
            out.I2C3output = try I2C3output.get_output();
            out.I2C4Mult = try I2C4Mult.get_output();
            out.I2C4output = try I2C4output.get_output();
            out.PLL48Mult = try PLL48Mult.get_output();
            out.RNGoutput = try RNGoutput.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.LCDTFTKOutput = try LCDTFTKOutput.get_output();
            out.SPDIFoutput = try SPDIFoutput.get_output();
            out.SAI1Mult = try SAI1Mult.get_output();
            out.SAI1output = try SAI1output.get_output();
            out.SAI2Mult = try SAI2Mult.get_output();
            out.SAI2output = try SAI2output.get_output();
            out.DFSDMAudioMult = try DFSDMAudioMult.get_output();
            out.DFSDMAudiooutput = try DFSDMAudiooutput.get_output();
            out.SDMMCMult = try SDMMCMult.get_output();
            out.SDMMCoutput = try SDMMCoutput.get_output();
            out.SDMMC2Mult = try SDMMC2Mult.get_output();
            out.SDMMC2output = try SDMMC2output.get_output();
            out.I2SMult = try I2SMult.get_output();
            out.I2Soutput = try I2Soutput.get_output();
            out.EthernetPtpOutput = try EthernetPtpOutput.get_output();
            out.MCO1Mult = try MCO1Mult.get_output();
            out.MCO1Div = try MCO1Div.get_output();
            out.MCO1Pin = try MCO1Pin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
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
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2output = try USART2output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3output = try USART3output.get_output();
            out.USART6Mult = try USART6Mult.get_output();
            out.USART6output = try USART6output.get_output();
            out.UART4Mult = try UART4Mult.get_output();
            out.UART4output = try UART4output.get_output();
            out.UART5Mult = try UART5Mult.get_output();
            out.UART5output = try UART5output.get_output();
            out.UART7Mult = try UART7Mult.get_output();
            out.UART7output = try UART7output.get_output();
            out.UART8Mult = try UART8Mult.get_output();
            out.UART8output = try UART8output.get_output();
            out.LPTIM1Mult = try LPTIM1Mult.get_output();
            out.LPTIM1Output = try LPTIM1Output.get_output();
            out.HSIDivCEC = try HSIDivCEC.get_output();
            out.CECMult = try CECMult.get_output();
            out.CECOutput = try CECOutput.get_output();
            out.DFSDMMult = try DFSDMMult.get_output();
            out.DFSDMoutput = try DFSDMoutput.get_output();
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
            out.PLLN = try PLLN.get_output();
            out.PLLP = try PLLP.get_output();
            out.PLLQ = try PLLQ.get_output();
            out.PLLQoutput = try PLLQoutput.get_output();
            out.PLLR = try PLLR.get_output();
            out.PLLRoutput = try PLLRoutput.get_output();
            out.PLLSAIN = try PLLSAIN.get_output();
            out.PLLSAIP = try PLLSAIP.get_output();
            out.PLLSAIoutput = try PLLSAIoutput.get_output();
            out.PLLSAIQ = try PLLSAIQ.get_output();
            out.PLLSAIQDiv = try PLLSAIQDiv.get_output();
            out.PLLSAIR = try PLLSAIR.get_output();
            out.PLLSAIRDiv = try PLLSAIRDiv.get_output();
            out.PLLI2SN = try PLLI2SN.get_output();
            out.PLLI2SP = try PLLI2SP.get_output();
            out.PLLI2SQ = try PLLI2SQ.get_output();
            out.PLLI2SQDiv = try PLLI2SQDiv.get_output();
            out.PLLI2SR = try PLLI2SR.get_output();
            out.PLLI2SRoutput = try PLLI2SRoutput.get_output();
            out.VCOInput = try VCOInput.get_extra_output();
            out.VCOOutput = try VCOOutput.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.PLLQCLK = try PLLQCLK.get_extra_output();
            out.VCOSAIOutput = try VCOSAIOutput.get_extra_output();
            out.PLLSAIPCLK = try PLLSAIPCLK.get_extra_output();
            out.PLLSAIQCLK = try PLLSAIQCLK.get_extra_output();
            out.PLLSAIRCLK = try PLLSAIRCLK.get_extra_output();
            out.VCOI2SOutput = try VCOI2SOutput.get_extra_output();
            out.PLLI2SPCLK = try PLLI2SPCLK.get_extra_output();
            out.PLLI2SQCLK = try PLLI2SQCLK.get_extra_output();
            out.PLLI2SRCLK = try PLLI2SRCLK.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ref_out.PLLM = PLLMValue;
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2C2CLockSelection = I2C2CLockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.I2C3CLockSelection = I2C3CLockSelectionValue;
            ignore_value(I2C3Freq_ValueValue);
            ref_out.I2C4CLockSelection = I2C4CLockSelectionValue;
            ignore_value(I2C4Freq_ValueValue);
            ref_out.PLL48CLockSelection = PLL48CLockSelectionValue;
            ignore_value(RNGFreq_ValueValue);
            ignore_value(USBFreq_ValueValue);
            ignore_value(LCDTFTFreq_ValueValue);
            ignore_value(SPDIFRXFreq_ValueValue);
            ref_out.SAI1CLockSelection = SAI1CLockSelectionValue;
            ignore_value(SAI1Freq_ValueValue);
            ref_out.SAI2CLockSelection = SAI2CLockSelectionValue;
            ignore_value(SAI2Freq_ValueValue);
            ref_out.DFSDMAudioSelection = DFSDMAudioSelectionValue;
            ignore_value(DFSDMAudioFreq_ValueValue);
            ref_out.SDMMCClockSelection = SDMMCClockSelectionValue;
            ignore_value(SDMMCFreq_ValueValue);
            ref_out.SDMMC2ClockSelection = SDMMC2ClockSelectionValue;
            ignore_value(SDMMC2Freq_ValueValue);
            ref_out.I2SCLockSelection = I2SCLockSelectionValue;
            ignore_value(I2SFreq_ValueValue);
            ignore_value(EthernetFreq_ValueValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv1 = RCC_MCODiv1Value;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCODiv2 = RCC_MCODiv2Value;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
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
            ref_out.USART1CLockSelection = USART1CLockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.USART2CLockSelection = USART2CLockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.USART3CLockSelection = USART3CLockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.USART6CLockSelection = USART6CLockSelectionValue;
            ignore_value(USART6Freq_ValueValue);
            ref_out.UART4CLockSelection = UART4CLockSelectionValue;
            ignore_value(UART4Freq_ValueValue);
            ref_out.UART5CLockSelection = UART5CLockSelectionValue;
            ignore_value(UART5Freq_ValueValue);
            ref_out.UART7CLockSelection = UART7CLockSelectionValue;
            ignore_value(UART7Freq_ValueValue);
            ref_out.UART8CLockSelection = UART8CLockSelectionValue;
            ignore_value(UART8Freq_ValueValue);
            ref_out.LPTIM1CLockSelection = LPTIM1CLockSelectionValue;
            ignore_value(LPTIM1Freq_ValueValue);
            ref_out.HSI_Div_CEC = HSI_Div_CECValue;
            ref_out.CECClockSelection = CECClockSelectionValue;
            ignore_value(CECFreq_ValueValue);
            ref_out.DFSDMSelection = DFSDMSelectionValue;
            ignore_value(DFSDMFreq_ValueValue);
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
            ref_out.PLLN = PLLNValue;
            ref_out.PLLP = PLLPValue;
            ref_out.PLLQ = PLLQValue;
            ignore_value(PLLQoutputFreq_ValueValue);
            ref_out.PLLR = PLLRValue;
            ignore_value(PLLRFreq_ValueValue);
            ref_out.PLLSAIN = PLLSAINValue;
            ref_out.PLLSAIP = PLLSAIPValue;
            ignore_value(PLLSAIoutputFreq_ValueValue);
            ref_out.PLLSAIQ = PLLSAIQValue;
            ref_out.PLLSAIQDiv = PLLSAIQDivValue;
            ref_out.PLLSAIR = PLLSAIRValue;
            ref_out.PLLSAIRDiv = PLLSAIRDivValue;
            ref_out.PLLI2SN = PLLI2SNValue;
            ref_out.PLLI2SP = PLLI2SPValue;
            ref_out.PLLI2SQ = PLLI2SQValue;
            ref_out.PLLI2SQDiv = PLLI2SQDivValue;
            ref_out.PLLI2SR = PLLI2SRValue;
            ignore_value(PLLI2SRoutputFreq_ValueValue);
            ignore_value(VCOInputFreq_ValueValue);
            ignore_value(VCOOutputFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ignore_value(PLLQCLKFreq_ValueValue);
            ignore_value(VCOSAIOutputFreq_ValueValue);
            ignore_value(PLLSAIPCLKFreq_ValueValue);
            ignore_value(PLLSAIQCLKFreq_ValueValue);
            ignore_value(PLLSAIRCLKFreq_ValueValue);
            ignore_value(VCOI2SOutputFreq_ValueValue);
            ignore_value(PLLI2SPCLKFreq_ValueValue);
            ignore_value(PLLI2SQCLKFreq_ValueValue);
            ignore_value(PLLI2SRCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.RCC_TIM_PRescaler_Selection = RCC_TIM_PRescaler_SelectionValue;
            ref_out.PWREXT_OverDrive = PWREXT_OverDriveValue;
            ref_out.PWR_Regulator_Voltage_Scale = PWR_Regulator_Voltage_ScaleValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.PLLSAIUsed = PLLSAIUsedValue != 0;
            ref_out.flags.PLLI2SUsed = PLLI2SUsedValue != 0;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.I2C3Enable = I2C3EnableValue == .true;
            ref_out.flags.I2C4Enable = I2C4EnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.SDMMC1Enable = SDMMC1EnableValue == .true;
            ref_out.flags.SDMMC2Enable = SDMMC2EnableValue == .true;
            ref_out.flags.RNGEnable = RNGEnableValue == .true;
            ref_out.flags.LCDEnable = LCDEnableValue == .true;
            ref_out.flags.SPDIFEnable = SPDIFEnableValue == .true;
            ref_out.flags.SAI1Enable = SAI1EnableValue == .true;
            ref_out.flags.EnableDFSDMAudio = EnableDFSDMAudioValue == .true;
            ref_out.flags.SAI2Enable = SAI2EnableValue == .true;
            ref_out.flags.I2SEnable = I2SEnableValue == .true;
            ref_out.flags.MCO1OutPutEnable = MCO1OutPutEnableValue == .true;
            ref_out.flags.MCO2OutPutEnable = MCO2OutPutEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.USART6Enable = USART6EnableValue == .true;
            ref_out.flags.UART4Enable = UART4EnableValue == .true;
            ref_out.flags.UART5Enable = UART5EnableValue == .true;
            ref_out.flags.UART7Enable = UART7EnableValue == .true;
            ref_out.flags.UART8Enable = UART8EnableValue == .true;
            ref_out.flags.LPTIM1Enable = LPTIM1EnableValue == .true;
            ref_out.flags.CECEnable = CECEnableValue == .true;
            ref_out.flags.EnableDFSDM = EnableDFSDMValue == .true;
            ref_out.flags.EnableHSEDSI = EnableHSEDSIValue == .true;
            ref_out.flags.EnableDSI = EnableDSIValue == .true;
            ref_out.flags.EnablePLLRDSI = false;
            ignore_value(EnablePLLRDSIValue);
            ref_out.flags.MCO2I2SEnable = MCO2I2SEnableValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.HSEUsed = HSEUsedValue != 0;
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
