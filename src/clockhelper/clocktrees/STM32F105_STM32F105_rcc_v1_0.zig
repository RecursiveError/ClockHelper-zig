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
        pub const RCC_PLLSRC = enum(u1) {
            HSI_Div2 = 0,
            HSE_Div_PREDIV = 1,
        };
        pub const RCC_ADCPRE = enum(u2) {
            Div2 = 0,
            Div4 = 1,
            Div6 = 2,
            Div8 = 3,
        };
        pub const RCC_PLL2MUL = enum(u4) {
            Mul8 = 6,
            Mul9 = 7,
            Mul10 = 8,
            Mul11 = 9,
            Mul12 = 10,
            Mul13 = 11,
            Mul14 = 12,
            Mul16 = 14,
            Mul20 = 15,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const RCC_PLLMUL = enum(u4) {
            Mul4 = 2,
            Mul5 = 3,
            Mul6 = 4,
            Mul7 = 5,
            Mul8 = 6,
            Mul9 = 7,
            Mul6_5 = 13,
        };
        pub const RCC_I2S2SRC = enum(u1) {
            SYS = 0,
            PLL3 = 1,
        };
        pub const RCC_PREDIV1 = enum(u4) {
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
        pub const RCC_SW = enum(u2) {
            HSI = 0,
            HSE = 1,
            PLL1_P = 2,
        };
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 4,
            HSI = 5,
            HSE = 6,
            PLL = 7,
            PLL2 = 8,
            PLL3DIV2 = 9,
            XT1 = 10,
            PLL3 = 11,
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
        pub const FLASH_LATENCY = enum(u3) {
            WS0 = 0,
            WS1 = 1,
            WS2 = 2,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };

        pub const Prediv2List = enum {
            RCC_HSE_PREDIV2_DIV1,
            RCC_HSE_PREDIV2_DIV2,
            RCC_HSE_PREDIV2_DIV3,
            RCC_HSE_PREDIV2_DIV4,
            RCC_HSE_PREDIV2_DIV5,
            RCC_HSE_PREDIV2_DIV6,
            RCC_HSE_PREDIV2_DIV7,
            RCC_HSE_PREDIV2_DIV8,
            RCC_HSE_PREDIV2_DIV9,
            RCC_HSE_PREDIV2_DIV10,
            RCC_HSE_PREDIV2_DIV11,
            RCC_HSE_PREDIV2_DIV12,
            RCC_HSE_PREDIV2_DIV13,
            RCC_HSE_PREDIV2_DIV14,
            RCC_HSE_PREDIV2_DIV15,
            RCC_HSE_PREDIV2_DIV16,

            pub fn to_enum(self: @This()) anyerror!RCC_PREDIV1 {
                return switch (self) {
                    .RCC_HSE_PREDIV2_DIV4 => .Div4,
                    .RCC_HSE_PREDIV2_DIV8 => .Div8,
                    .RCC_HSE_PREDIV2_DIV2 => .Div2,
                    .RCC_HSE_PREDIV2_DIV16 => .Div16,
                    .RCC_HSE_PREDIV2_DIV10 => .Div10,
                    .RCC_HSE_PREDIV2_DIV14 => .Div14,
                    .RCC_HSE_PREDIV2_DIV5 => .Div5,
                    .RCC_HSE_PREDIV2_DIV7 => .Div7,
                    .RCC_HSE_PREDIV2_DIV12 => .Div12,
                    .RCC_HSE_PREDIV2_DIV11 => .Div11,
                    .RCC_HSE_PREDIV2_DIV6 => .Div6,
                    .RCC_HSE_PREDIV2_DIV13 => .Div13,
                    .RCC_HSE_PREDIV2_DIV3 => .Div3,
                    .RCC_HSE_PREDIV2_DIV9 => .Div9,
                    .RCC_HSE_PREDIV2_DIV15 => .Div15,
                    .RCC_HSE_PREDIV2_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_PREDIV1) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_HSE_PREDIV2_DIV4,
                    .Div8 => .RCC_HSE_PREDIV2_DIV8,
                    .Div2 => .RCC_HSE_PREDIV2_DIV2,
                    .Div16 => .RCC_HSE_PREDIV2_DIV16,
                    .Div10 => .RCC_HSE_PREDIV2_DIV10,
                    .Div14 => .RCC_HSE_PREDIV2_DIV14,
                    .Div5 => .RCC_HSE_PREDIV2_DIV5,
                    .Div7 => .RCC_HSE_PREDIV2_DIV7,
                    .Div12 => .RCC_HSE_PREDIV2_DIV12,
                    .Div11 => .RCC_HSE_PREDIV2_DIV11,
                    .Div6 => .RCC_HSE_PREDIV2_DIV6,
                    .Div13 => .RCC_HSE_PREDIV2_DIV13,
                    .Div3 => .RCC_HSE_PREDIV2_DIV3,
                    .Div9 => .RCC_HSE_PREDIV2_DIV9,
                    .Div15 => .RCC_HSE_PREDIV2_DIV15,
                    .Div1 => .RCC_HSE_PREDIV2_DIV1,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HSE_PREDIV2_DIV1 => 1,
                    .RCC_HSE_PREDIV2_DIV2 => 2,
                    .RCC_HSE_PREDIV2_DIV3 => 3,
                    .RCC_HSE_PREDIV2_DIV4 => 4,
                    .RCC_HSE_PREDIV2_DIV5 => 5,
                    .RCC_HSE_PREDIV2_DIV6 => 6,
                    .RCC_HSE_PREDIV2_DIV7 => 7,
                    .RCC_HSE_PREDIV2_DIV8 => 8,
                    .RCC_HSE_PREDIV2_DIV9 => 9,
                    .RCC_HSE_PREDIV2_DIV10 => 10,
                    .RCC_HSE_PREDIV2_DIV11 => 11,
                    .RCC_HSE_PREDIV2_DIV12 => 12,
                    .RCC_HSE_PREDIV2_DIV13 => 13,
                    .RCC_HSE_PREDIV2_DIV14 => 14,
                    .RCC_HSE_PREDIV2_DIV15 => 15,
                    .RCC_HSE_PREDIV2_DIV16 => 16,
                };
            }
        };

        pub const PLL2MulList = enum {
            RCC_PLL2_MUL8,
            RCC_PLL2_MUL9,
            RCC_PLL2_MUL10,
            RCC_PLL2_MUL11,
            RCC_PLL2_MUL12,
            RCC_PLL2_MUL13,
            RCC_PLL2_MUL14,
            RCC_PLL2_MUL16,
            RCC_PLL2_MUL20,

            pub fn to_enum(self: @This()) anyerror!RCC_PLL2MUL {
                return switch (self) {
                    .RCC_PLL2_MUL9 => .Mul9,
                    .RCC_PLL2_MUL14 => .Mul14,
                    .RCC_PLL2_MUL12 => .Mul12,
                    .RCC_PLL2_MUL11 => .Mul11,
                    .RCC_PLL2_MUL20 => .Mul20,
                    .RCC_PLL2_MUL8 => .Mul8,
                    .RCC_PLL2_MUL16 => .Mul16,
                    .RCC_PLL2_MUL13 => .Mul13,
                    .RCC_PLL2_MUL10 => .Mul10,
                };
            }
            pub fn from_enum(item: RCC_PLL2MUL) anyerror!@This() {
                return switch (item) {
                    .Mul9 => .RCC_PLL2_MUL9,
                    .Mul14 => .RCC_PLL2_MUL14,
                    .Mul12 => .RCC_PLL2_MUL12,
                    .Mul11 => .RCC_PLL2_MUL11,
                    .Mul20 => .RCC_PLL2_MUL20,
                    .Mul8 => .RCC_PLL2_MUL8,
                    .Mul16 => .RCC_PLL2_MUL16,
                    .Mul13 => .RCC_PLL2_MUL13,
                    .Mul10 => .RCC_PLL2_MUL10,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLL2_MUL8 => 8,
                    .RCC_PLL2_MUL9 => 9,
                    .RCC_PLL2_MUL10 => 10,
                    .RCC_PLL2_MUL11 => 11,
                    .RCC_PLL2_MUL12 => 12,
                    .RCC_PLL2_MUL13 => 13,
                    .RCC_PLL2_MUL14 => 14,
                    .RCC_PLL2_MUL16 => 16,
                    .RCC_PLL2_MUL20 => 20,
                };
            }
        };

        pub const PLL3MulList = enum {
            RCC_PLLI2S_MUL8,
            RCC_PLLI2S_MUL9,
            RCC_PLLI2S_MUL10,
            RCC_PLLI2S_MUL11,
            RCC_PLLI2S_MUL12,
            RCC_PLLI2S_MUL13,
            RCC_PLLI2S_MUL14,
            RCC_PLLI2S_MUL16,
            RCC_PLLI2S_MUL20,

            pub fn to_enum(self: @This()) anyerror!RCC_PLL2MUL {
                return switch (self) {
                    .RCC_PLLI2S_MUL12 => .Mul12,
                    .RCC_PLLI2S_MUL11 => .Mul11,
                    .RCC_PLLI2S_MUL20 => .Mul20,
                    .RCC_PLLI2S_MUL8 => .Mul8,
                    .RCC_PLLI2S_MUL9 => .Mul9,
                    .RCC_PLLI2S_MUL13 => .Mul13,
                    .RCC_PLLI2S_MUL16 => .Mul16,
                    .RCC_PLLI2S_MUL10 => .Mul10,
                    .RCC_PLLI2S_MUL14 => .Mul14,
                };
            }
            pub fn from_enum(item: RCC_PLL2MUL) anyerror!@This() {
                return switch (item) {
                    .Mul12 => .RCC_PLLI2S_MUL12,
                    .Mul11 => .RCC_PLLI2S_MUL11,
                    .Mul20 => .RCC_PLLI2S_MUL20,
                    .Mul8 => .RCC_PLLI2S_MUL8,
                    .Mul9 => .RCC_PLLI2S_MUL9,
                    .Mul13 => .RCC_PLLI2S_MUL13,
                    .Mul16 => .RCC_PLLI2S_MUL16,
                    .Mul10 => .RCC_PLLI2S_MUL10,
                    .Mul14 => .RCC_PLLI2S_MUL14,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLLI2S_MUL8 => 8,
                    .RCC_PLLI2S_MUL9 => 9,
                    .RCC_PLLI2S_MUL10 => 10,
                    .RCC_PLLI2S_MUL11 => 11,
                    .RCC_PLLI2S_MUL12 => 12,
                    .RCC_PLLI2S_MUL13 => 13,
                    .RCC_PLLI2S_MUL14 => 14,
                    .RCC_PLLI2S_MUL16 => 16,
                    .RCC_PLLI2S_MUL20 => 20,
                };
            }
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_PLLCLK,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_HSI => .HSI,
                    .RCC_SYSCLKSOURCE_PLLCLK => .PLL1_P,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .HSI => .RCC_SYSCLKSOURCE_HSI,
                    .PLL1_P => .RCC_SYSCLKSOURCE_PLLCLK,
                };
            }
        };

        pub const I2S2ClockSelectionList = enum {
            RCC_I2S2CLKSOURCE_SYSCLK,
            RCC_I2S2CLKSOURCE_PLLI2S_VCO,

            pub fn to_enum(self: @This()) anyerror!RCC_I2S2SRC {
                return switch (self) {
                    .RCC_I2S2CLKSOURCE_PLLI2S_VCO => .PLL3,
                    .RCC_I2S2CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_I2S2SRC) anyerror!@This() {
                return switch (item) {
                    .PLL3 => .RCC_I2S2CLKSOURCE_PLLI2S_VCO,
                    .SYS => .RCC_I2S2CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const I2S3ClockSelectionList = enum {
            RCC_I2S3CLKSOURCE_SYSCLK,
            RCC_I2S3CLKSOURCE_PLLI2S_VCO,

            pub fn to_enum(self: @This()) anyerror!RCC_I2S2SRC {
                return switch (self) {
                    .RCC_I2S3CLKSOURCE_PLLI2S_VCO => .PLL3,
                    .RCC_I2S3CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_I2S2SRC) anyerror!@This() {
                return switch (item) {
                    .PLL3 => .RCC_I2S3CLKSOURCE_PLLI2S_VCO,
                    .SYS => .RCC_I2S3CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,
            RCC_RTCCLKSOURCE_HSE_DIV128,

            pub fn to_enum(self: @This()) anyerror!RCC_RTCSEL {
                return switch (self) {
                    .RCC_RTCCLKSOURCE_LSI => .LSI,
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                    .RCC_RTCCLKSOURCE_HSE_DIV128 => .HSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
                    .HSE => .RCC_RTCCLKSOURCE_HSE_DIV128,
                };
            }
        };

        pub const RCC_MCOMult_Clock_Source_FROM_PLL3MULList = enum {
            RCC_MCO1SOURCE_PLL3CLK,
            RCC_MCO1SOURCE_PLL3CLK_DIV2,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCO1SOURCE_PLL3CLK => 1,
                    .RCC_MCO1SOURCE_PLL3CLK_DIV2 => 2,
                };
            }
        };

        pub const RCC_MCOSourceList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_PLLCLK,
            RCC_MCO1SOURCE_PLL2CLK,
            RCC_MCO1SOURCE_EXT_HSE,
            MCOPLL3Div,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .MCOPLL3Div => .PLL3,
                    .RCC_MCO1SOURCE_PLL2CLK => .PLL2,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_PLLCLK => .PLL,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_EXT_HSE => .XT1,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .PLL3 => .MCOPLL3Div,
                    .PLL2 => .RCC_MCO1SOURCE_PLL2CLK,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .PLL => .RCC_MCO1SOURCE_PLLCLK,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .XT1 => .RCC_MCO1SOURCE_EXT_HSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_MCOSEL", @tagName(item), "RCC_MCOSource" },
                    ),
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

        pub const TimSys_DivList = enum {
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

        pub const ADCPrescList = enum {
            RCC_ADCPCLK2_DIV2,
            RCC_ADCPCLK2_DIV4,
            RCC_ADCPCLK2_DIV6,
            RCC_ADCPCLK2_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCPRE {
                return switch (self) {
                    .RCC_ADCPCLK2_DIV4 => .Div4,
                    .RCC_ADCPCLK2_DIV8 => .Div8,
                    .RCC_ADCPCLK2_DIV2 => .Div2,
                    .RCC_ADCPCLK2_DIV6 => .Div6,
                };
            }
            pub fn from_enum(item: RCC_ADCPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_ADCPCLK2_DIV4,
                    .Div8 => .RCC_ADCPCLK2_DIV8,
                    .Div2 => .RCC_ADCPCLK2_DIV2,
                    .Div6 => .RCC_ADCPCLK2_DIV6,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_ADCPCLK2_DIV2 => 2,
                    .RCC_ADCPCLK2_DIV4 => 4,
                    .RCC_ADCPCLK2_DIV6 => 6,
                    .RCC_ADCPCLK2_DIV8 => 8,
                };
            }
        };

        pub const Prediv1SourceList = enum {
            RCC_PREDIV1_SOURCE_PLL2,
            RCC_PREDIV1_SOURCE_HSE,

            pub fn to_enum(self: @This()) anyerror!RCC_PREDIV1 {
                return switch (self) {
                    .RCC_PREDIV1_SOURCE_HSE => .Div1,
                    .RCC_PREDIV1_SOURCE_PLL2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_PREDIV1) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_PREDIV1_SOURCE_HSE,
                    .Div2 => .RCC_PREDIV1_SOURCE_PLL2,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_PREDIV1", @tagName(item), "Prediv1Source" },
                    ),
                };
            }
        };

        pub const HSEDivPLLList = enum {
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

            pub fn to_enum(self: @This()) anyerror!RCC_PREDIV1 {
                return switch (self) {
                    .RCC_HSE_PREDIV_DIV11 => .Div11,
                    .RCC_HSE_PREDIV_DIV15 => .Div15,
                    .RCC_HSE_PREDIV_DIV2 => .Div2,
                    .RCC_HSE_PREDIV_DIV3 => .Div3,
                    .RCC_HSE_PREDIV_DIV4 => .Div4,
                    .RCC_HSE_PREDIV_DIV10 => .Div10,
                    .RCC_HSE_PREDIV_DIV16 => .Div16,
                    .RCC_HSE_PREDIV_DIV9 => .Div9,
                    .RCC_HSE_PREDIV_DIV12 => .Div12,
                    .RCC_HSE_PREDIV_DIV14 => .Div14,
                    .RCC_HSE_PREDIV_DIV5 => .Div5,
                    .RCC_HSE_PREDIV_DIV6 => .Div6,
                    .RCC_HSE_PREDIV_DIV8 => .Div8,
                    .RCC_HSE_PREDIV_DIV13 => .Div13,
                    .RCC_HSE_PREDIV_DIV1 => .Div1,
                    .RCC_HSE_PREDIV_DIV7 => .Div7,
                };
            }
            pub fn from_enum(item: RCC_PREDIV1) anyerror!@This() {
                return switch (item) {
                    .Div11 => .RCC_HSE_PREDIV_DIV11,
                    .Div15 => .RCC_HSE_PREDIV_DIV15,
                    .Div2 => .RCC_HSE_PREDIV_DIV2,
                    .Div3 => .RCC_HSE_PREDIV_DIV3,
                    .Div4 => .RCC_HSE_PREDIV_DIV4,
                    .Div10 => .RCC_HSE_PREDIV_DIV10,
                    .Div16 => .RCC_HSE_PREDIV_DIV16,
                    .Div9 => .RCC_HSE_PREDIV_DIV9,
                    .Div12 => .RCC_HSE_PREDIV_DIV12,
                    .Div14 => .RCC_HSE_PREDIV_DIV14,
                    .Div5 => .RCC_HSE_PREDIV_DIV5,
                    .Div6 => .RCC_HSE_PREDIV_DIV6,
                    .Div8 => .RCC_HSE_PREDIV_DIV8,
                    .Div13 => .RCC_HSE_PREDIV_DIV13,
                    .Div1 => .RCC_HSE_PREDIV_DIV1,
                    .Div7 => .RCC_HSE_PREDIV_DIV7,
                };
            }
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

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_HSI_DIV2,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSI_DIV2 => .HSI_Div2,
                    .RCC_PLLSOURCE_HSE => .HSE_Div_PREDIV,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSI_Div2 => .RCC_PLLSOURCE_HSI_DIV2,
                    .HSE_Div_PREDIV => .RCC_PLLSOURCE_HSE,
                };
            }
        };

        pub const PLLMULList = enum {
            RCC_PLL_MUL4,
            RCC_PLL_MUL5,
            RCC_PLL_MUL6,
            RCC_PLL_MUL6_5,
            RCC_PLL_MUL7,
            RCC_PLL_MUL8,
            RCC_PLL_MUL9,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLMUL {
                return switch (self) {
                    .RCC_PLL_MUL7 => .Mul7,
                    .RCC_PLL_MUL6_5 => .Mul5,
                    .RCC_PLL_MUL6 => .Mul6,
                    .RCC_PLL_MUL9 => .Mul9,
                    .RCC_PLL_MUL4 => .Mul4,
                    .RCC_PLL_MUL8 => .Mul8,
                    .RCC_PLL_MUL5 => .Mul5,
                };
            }
            pub fn from_enum(item: RCC_PLLMUL) anyerror!@This() {
                return switch (item) {
                    .Mul7 => .RCC_PLL_MUL7,
                    .Mul5 => .RCC_PLL_MUL6_5,
                    .Mul6 => .RCC_PLL_MUL6,
                    .Mul9 => .RCC_PLL_MUL9,
                    .Mul4 => .RCC_PLL_MUL4,
                    .Mul8 => .RCC_PLL_MUL8,
                    .Mul5 => .RCC_PLL_MUL5,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLL_MUL4 => 4,
                    .RCC_PLL_MUL5 => 5,
                    .RCC_PLL_MUL6 => 6,
                    .RCC_PLL_MUL6_5 => 6.5,
                    .RCC_PLL_MUL7 => 7,
                    .RCC_PLL_MUL8 => 8,
                    .RCC_PLL_MUL9 => 9,
                };
            }
        };

        pub const USBPrescalerList = enum {
            RCC_USBCLKSOURCE_PLL_DIV2,
            RCC_USBCLKSOURCE_PLL_DIV3,

            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL_DIV2 => 2,
                    .RCC_USBCLKSOURCE_PLL_DIV3 => 3,
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

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_1 => .WS1,
                    .FLASH_LATENCY_0 => .WS0,
                    .FLASH_LATENCY_2 => .WS2,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS1 => .FLASH_LATENCY_1,
                    .WS0 => .FLASH_LATENCY_0,
                    .WS2 => .FLASH_LATENCY_2,
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

        pub const I2S2EnableList = enum {
            false,
            true,
        };

        pub const I2S3EnableList = enum {
            false,
            true,
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

        pub const EnableHSEMCODevisorList = enum {
            true,
            false,
        };

        pub const MCOEnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const EnableLSERTCList = enum {
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
            ETHUsed_ForRCC: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            RCC_PLLSOURCE_HSI_DIV2: bool = false,
            RCC_MCO1SOURCE_EXT_HSE: bool = false,
            RCC_MCO1SOURCE_HSE: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_SYSCLK_DIV1: bool = false,
            RCC_I2S3CLKSOURCE_PLLI2S_VCO: bool = false,
            RCC_I2S2CLKSOURCE_PLLI2S_VCO: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            RCC_MCO1SOURCE_PLL2CLK: bool = false,
            RCC_PREDIV1_SOURCE_PLL2: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_PLLSOURCE_HSE: bool = false,
            RCC_RTC_Clock_Source: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_MCO1SOURCE_PLL3CLK: bool = false,
            RCC_HCLK_DIV1: bool = false,
            RCC_MCO1SOURCE_PLL3CLK_DIV2: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            ETHUsed_ForRCC: bool = false,
            USB_OTG_FSUsed_ForRCC: bool = false,
            I2S2Used_ForRCC: bool = false,
            I2S3Used_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            USE_ADC2: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            RCC_PLLSOURCE_HSI_DIV2: bool = false,
            RCC_MCO1SOURCE_EXT_HSE: bool = false,
            RCC_MCO1SOURCE_HSE: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_SYSCLK_DIV1: bool = false,
            RCC_I2S3CLKSOURCE_PLLI2S_VCO: bool = false,
            RCC_I2S2CLKSOURCE_PLLI2S_VCO: bool = false,
            RCC_SYSCLKSOURCE_PLLCLK: bool = false,
            RCC_MCO1SOURCE_PLL2CLK: bool = false,
            RCC_PREDIV1_SOURCE_PLL2: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_PLLSOURCE_HSE: bool = false,
            RCC_RTC_Clock_Source: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_MCO1SOURCE_PLL3CLK: bool = false,
            RCC_HCLK_DIV1: bool = false,
            RCC_MCO1SOURCE_PLL3CLK_DIV2: bool = false,
            RCC_MCO1SOURCE_PLLCLK: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            I2S2Enable: bool = false, //Reference flag
            I2S3Enable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            EnableHSEMCODevisor: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            PLL2Used: bool = false, //Reference flag
            PLL3Used: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            HSEUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            LSE_VALUE: ?f32 = null,
            HSE_VALUE: ?f32 = null,
            Prediv2: ?Prediv2List = null,
            PLL2Mul: ?PLL2MulList = null,
            PLL3Mul: ?PLL3MulList = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            I2S2ClockSelection: ?I2S2ClockSelectionList = null,
            I2S3ClockSelection: ?I2S3ClockSelectionList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            RCC_MCOMult_Clock_Source_FROM_PLL3MUL: ?RCC_MCOMult_Clock_Source_FROM_PLL3MULList = null,
            RCC_MCOSource: ?RCC_MCOSourceList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            TimSys_Div: ?TimSys_DivList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            ADCPresc: ?ADCPrescList = null,
            Prediv1Source: ?Prediv1SourceList = null,
            HSEDivPLL: ?HSEDivPLLList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLMUL: ?PLLMULList = null,
            USBPrescaler: ?USBPrescalerList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDivPLL: u32,
            Prediv2: Prediv2List,
            PLL2Mul: PLL2MulList,
            PLL2VCOMul2: u32,
            PLL3Mul: PLL3MulList,
            PLL3VCOMul2: u32,
            SYSCLKSource: SYSCLKSourceList,
            I2S2ClockSelection: I2S2ClockSelectionList,
            I2S3ClockSelection: I2S3ClockSelectionList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            RCC_MCOMult_Clock_Source_FROM_PLL3MUL: RCC_MCOMult_Clock_Source_FROM_PLL3MULList,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: u32,
            RCC_MCOSource: RCC_MCOSourceList,
            AHBCLKDivider: AHBCLKDividerList,
            TimSys_Div: TimSys_DivList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            APB2TimCLKDivider: u32,
            ADCPresc: ADCPrescList,
            Prediv1Source: Prediv1SourceList,
            HSEDivPLL: HSEDivPLLList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLMUL: PLLMULList,
            PLLVCOMul2: u32,
            USBPrescaler: USBPrescalerList,
            VDD_VALUE: f32,
            FLatency: FLatencyList,
            HSICalibrationValue: u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
        };

        //=======Clocktree regular Configurations========

        pub const ExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            LSE_VALUE: ?f32 = null,
            HSE_VALUE: ?f32 = null,
            Prediv2: ?RCC_PREDIV1 = null,
            PLL2Mul: ?RCC_PLL2MUL = null,
            PLL3Mul: ?RCC_PLL2MUL = null,
            SYSCLKSource: ?RCC_SW = null,
            I2S2ClockSelection: ?RCC_I2S2SRC = null,
            I2S3ClockSelection: ?RCC_I2S2SRC = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            RCC_MCOMult_Clock_Source_FROM_PLL3MUL: ?RCC_MCOMult_Clock_Source_FROM_PLL3MULList = null,
            RCC_MCOSource: ?RCC_MCOSEL = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            TimSys_Div: ?TimSys_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            ADCPresc: ?RCC_ADCPRE = null,
            Prediv1Source: ?RCC_PREDIV1 = null,
            HSEDivPLL: ?RCC_PREDIV1 = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLMUL: ?RCC_PLLMUL = null,
            USBPrescaler: ?USBPrescalerList = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .LSE_VALUE = self.LSE_VALUE,
                    .HSE_VALUE = self.HSE_VALUE,
                    .Prediv2 = if (self.Prediv2) |val| try Prediv2List.from_enum(val) else null,
                    .PLL2Mul = if (self.PLL2Mul) |val| try PLL2MulList.from_enum(val) else null,
                    .PLL3Mul = if (self.PLL3Mul) |val| try PLL3MulList.from_enum(val) else null,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .I2S2ClockSelection = if (self.I2S2ClockSelection) |val| try I2S2ClockSelectionList.from_enum(val) else null,
                    .I2S3ClockSelection = if (self.I2S3ClockSelection) |val| try I2S3ClockSelectionList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .RCC_MCOMult_Clock_Source_FROM_PLL3MUL = self.RCC_MCOMult_Clock_Source_FROM_PLL3MUL,
                    .RCC_MCOSource = if (self.RCC_MCOSource) |val| try RCC_MCOSourceList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .TimSys_Div = self.TimSys_Div,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .ADCPresc = if (self.ADCPresc) |val| try ADCPrescList.from_enum(val) else null,
                    .Prediv1Source = if (self.Prediv1Source) |val| try Prediv1SourceList.from_enum(val) else null,
                    .HSEDivPLL = if (self.HSEDivPLL) |val| try HSEDivPLLList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLMUL = if (self.PLLMUL) |val| try PLLMULList.from_enum(val) else null,
                    .USBPrescaler = self.USBPrescaler,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSIDivPLL: u32,
            Prediv2: RCC_PREDIV1,
            PLL2Mul: RCC_PLL2MUL,
            PLL2VCOMul2: u32,
            PLL3Mul: RCC_PLL2MUL,
            PLL3VCOMul2: u32,
            SYSCLKSource: RCC_SW,
            I2S2ClockSelection: RCC_I2S2SRC,
            I2S3ClockSelection: RCC_I2S2SRC,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            RCC_MCOMult_Clock_Source_FROM_PLL3MUL: RCC_MCOMult_Clock_Source_FROM_PLL3MULList,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: u32,
            RCC_MCOSource: RCC_MCOSEL,
            AHBCLKDivider: RCC_HPRE,
            TimSys_Div: TimSys_DivList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            APB2TimCLKDivider: u32,
            ADCPresc: RCC_ADCPRE,
            Prediv1Source: RCC_PREDIV1,
            HSEDivPLL: RCC_PREDIV1,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLMUL: RCC_PLLMUL,
            PLLVCOMul2: u32,
            USBPrescaler: USBPrescalerList,
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: u32,
            HSE_Timout: u32,
            LSE_Timout: u32,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSIDivPLL = cubemx_config.HSIDivPLL,
                    .Prediv2 = try cubemx_config.Prediv2.to_enum(),
                    .PLL2Mul = try cubemx_config.PLL2Mul.to_enum(),
                    .PLL2VCOMul2 = cubemx_config.PLL2VCOMul2,
                    .PLL3Mul = try cubemx_config.PLL3Mul.to_enum(),
                    .PLL3VCOMul2 = cubemx_config.PLL3VCOMul2,
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .I2S2ClockSelection = try cubemx_config.I2S2ClockSelection.to_enum(),
                    .I2S3ClockSelection = try cubemx_config.I2S3ClockSelection.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .RCC_MCOMult_Clock_Source_FROM_PLL3MUL = cubemx_config.RCC_MCOMult_Clock_Source_FROM_PLL3MUL,
                    .RCC_MCOMult_Clock_Source_FROM_PLLMUL = cubemx_config.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
                    .RCC_MCOSource = try cubemx_config.RCC_MCOSource.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .TimSys_Div = cubemx_config.TimSys_Div,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .ADCPresc = try cubemx_config.ADCPresc.to_enum(),
                    .Prediv1Source = try cubemx_config.Prediv1Source.to_enum(),
                    .HSEDivPLL = try cubemx_config.HSEDivPLL.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLMUL = try cubemx_config.PLLMUL.to_enum(),
                    .PLLVCOMul2 = cubemx_config.PLLVCOMul2,
                    .USBPrescaler = cubemx_config.USBPrescaler,
                    .VDD_VALUE = cubemx_config.VDD_VALUE,
                    .FLatency = try cubemx_config.FLatency.to_enum(),
                    .HSICalibrationValue = cubemx_config.HSICalibrationValue,
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
            FLITFCLKoutput: u32 = 0,
            HSIDivPLL: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            HSEOSC: u32 = 0,
            Prediv2: u32 = 0,
            Prediv2output: u32 = 0,
            PLL2Mul: u32 = 0,
            PLL2VCOMul2: u32 = 0,
            PLL2VCOoutput: u32 = 0,
            PLL2CLKoutput: u32 = 0,
            PLL3Mul: u32 = 0,
            PLL3VCOMul2: u32 = 0,
            PLL3VCOoutput: u32 = 0,
            PLL3CLKoutput: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            I2S2Mult: u32 = 0,
            I2S2Output: u32 = 0,
            I2S3Mult: u32 = 0,
            I2S3Output: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            MCOPLL3Div: u32 = 0,
            MCOMultDivisor: u32 = 0,
            MCOMult: u32 = 0,
            MCOoutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            TimSysPresc: u32 = 0,
            TimSysOutput: u32 = 0,
            APB1Prescaler: u32 = 0,
            APB1Output: u32 = 0,
            TimPrescalerAPB1: u32 = 0,
            TimPrescOut1: u32 = 0,
            APB2Prescaler: u32 = 0,
            APB2Output: u32 = 0,
            TimPrescalerAPB2: u32 = 0,
            TimPrescOut2: u32 = 0,
            ADCprescaler: u32 = 0,
            ADCoutput: u32 = 0,
            Prediv1Source: u32 = 0,
            PreDiv1: u32 = 0,
            PLLSource: u32 = 0,
            VCO2output: u32 = 0,
            PLLMUL: u32 = 0,
            PLLVCOMul2: u32 = 0,
            USBPrescaler: u32 = 0,
            USBoutput: u32 = 0,
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

            if (@inComptime()) @setEvalBranchQuota(1000000);
            var out = ClockOutput{};
            var ref_out: CubeMXOutputConfig = undefined;

            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var FLITFCLKoutput = ClockNode{
                .name = "FLITFCLKoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSIDivPLL = ClockNode{
                .name = "HSIDivPLL",
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

            var Prediv2 = ClockNode{
                .name = "Prediv2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Prediv2output = ClockNode{
                .name = "Prediv2output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2Mul = ClockNode{
                .name = "PLL2Mul",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2VCOMul2 = ClockNode{
                .name = "PLL2VCOMul2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2VCOoutput = ClockNode{
                .name = "PLL2VCOoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL2CLKoutput = ClockNode{
                .name = "PLL2CLKoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3Mul = ClockNode{
                .name = "PLL3Mul",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3VCOMul2 = ClockNode{
                .name = "PLL3VCOMul2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3VCOoutput = ClockNode{
                .name = "PLL3VCOoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLL3CLKoutput = ClockNode{
                .name = "PLL3CLKoutput",
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

            var I2S2Mult = ClockNode{
                .name = "I2S2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S2Output = ClockNode{
                .name = "I2S2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S3Mult = ClockNode{
                .name = "I2S3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2S3Output = ClockNode{
                .name = "I2S3Output",
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

            var MCOPLL3Div = ClockNode{
                .name = "MCOPLL3Div",
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

            var TimSysPresc = ClockNode{
                .name = "TimSysPresc",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimSysOutput = ClockNode{
                .name = "TimSysOutput",
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

            var ADCprescaler = ClockNode{
                .name = "ADCprescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADCoutput = ClockNode{
                .name = "ADCoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var Prediv1Source = ClockNode{
                .name = "Prediv1Source",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PreDiv1 = ClockNode{
                .name = "PreDiv1",
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

            var PLLVCOMul2 = ClockNode{
                .name = "PLLVCOMul2",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBPrescaler = ClockNode{
                .name = "USBPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBoutput = ClockNode{
                .name = "USBoutput",
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

            const HSIDivPLLValue: u32 = blk: {
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

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 5e7,
                        .main_expr = "HSEByPass",
                        .main_dialog = "HSE in bypass Mode",
                    };
                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 3e6,
                    .max = 2.5e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 8e6;
            };

            const Prediv2Value: Prediv2List = blk: {
                const user_val = config.Prediv2;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSE_PREDIV2_DIV1 => {},
                        .RCC_HSE_PREDIV2_DIV2 => {},
                        .RCC_HSE_PREDIV2_DIV3 => {},
                        .RCC_HSE_PREDIV2_DIV4 => {},
                        .RCC_HSE_PREDIV2_DIV5 => {},
                        .RCC_HSE_PREDIV2_DIV6 => {},
                        .RCC_HSE_PREDIV2_DIV7 => {},
                        .RCC_HSE_PREDIV2_DIV8 => {},
                        .RCC_HSE_PREDIV2_DIV9 => {},
                        .RCC_HSE_PREDIV2_DIV10 => {},
                        .RCC_HSE_PREDIV2_DIV11 => {},
                        .RCC_HSE_PREDIV2_DIV12 => {},
                        .RCC_HSE_PREDIV2_DIV13 => {},
                        .RCC_HSE_PREDIV2_DIV14 => {},
                        .RCC_HSE_PREDIV2_DIV15 => {},
                        .RCC_HSE_PREDIV2_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_HSE_PREDIV2_DIV1;
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((config.flags.USB_OTG_FSUsed_ForRCC)) {
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
                                "(USB_OTG_FSUsed_ForRCC) ",
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
                        .RCC_PLLSOURCE_HSI_DIV2 => {},
                        .RCC_PLLSOURCE_HSE => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLSOURCE_HSI_DIV2;
            };

            const Prediv1SourceValue: Prediv1SourceList = blk: {
                const user_val = config.Prediv1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PREDIV1_SOURCE_PLL2 => {},
                        .RCC_PREDIV1_SOURCE_HSE => {},
                    }
                }
                break :blk user_val orelse .RCC_PREDIV1_SOURCE_HSE;
            };

            const RCC_MCOSourceValue: RCC_MCOSourceList = blk: {
                const user_val = config.RCC_MCOSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => {},
                        .RCC_MCO1SOURCE_HSI => {},
                        .RCC_MCO1SOURCE_HSE => {},
                        .RCC_MCO1SOURCE_PLLCLK => {},
                        .RCC_MCO1SOURCE_PLL2CLK => {},
                        .RCC_MCO1SOURCE_EXT_HSE => {},
                        .MCOPLL3Div => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
            };

            const PLL2UsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(Prediv1SourceValue), Prediv1SourceValue, .RCC_PREDIV1_SOURCE_PLL2, .@"="))) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_PLL2CLK, .@"=")) and config.flags.MCOConfig)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const I2S2ClockSelectionValue: I2S2ClockSelectionList = blk: {
                const user_val = config.I2S2ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2S2CLKSOURCE_SYSCLK => {},
                        .RCC_I2S2CLKSOURCE_PLLI2S_VCO => {},
                    }
                }
                break :blk user_val orelse .RCC_I2S2CLKSOURCE_SYSCLK;
            };

            const I2S3ClockSelectionValue: I2S3ClockSelectionList = blk: {
                const user_val = config.I2S3ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2S3CLKSOURCE_SYSCLK => {},
                        .RCC_I2S3CLKSOURCE_PLLI2S_VCO => {},
                    }
                }
                break :blk user_val orelse .RCC_I2S3CLKSOURCE_SYSCLK;
            };

            const PLL3UsedValue: u1 = blk: {
                if (((config.flags.I2S2Used_ForRCC and (check_ref(@TypeOf(I2S2ClockSelectionValue), I2S2ClockSelectionValue, .RCC_I2S2CLKSOURCE_PLLI2S_VCO, .@"="))) or (config.flags.I2S3Used_ForRCC and (check_ref(@TypeOf(I2S3ClockSelectionValue), I2S3ClockSelectionValue, .RCC_I2S3CLKSOURCE_PLLI2S_VCO, .@"=")))) or (((false) or (false)) and config.flags.MCOConfig)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const Prediv2FreqValueValue: f32 = blk: {
                if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=") or check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    Prediv2output.limit = .{
                        .min = 3e6,
                        .max = 5e6,
                        .main_expr = "PLL2Used=1|PLL3Used=1",
                        .main_dialog = "PLL2/PLL3 input",
                    };
                    break :blk 8e6;
                }
                Prediv2output.limit = .{
                    .min = 8e6,
                    .max = 8e6,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk 8e6;
            };

            const PLL2MulValue: PLL2MulList = blk: {
                const user_val = config.PLL2Mul;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLL2_MUL8 => {},
                        .RCC_PLL2_MUL9 => {},
                        .RCC_PLL2_MUL10 => {},
                        .RCC_PLL2_MUL11 => {},
                        .RCC_PLL2_MUL12 => {},
                        .RCC_PLL2_MUL13 => {},
                        .RCC_PLL2_MUL14 => {},
                        .RCC_PLL2_MUL16 => {},
                        .RCC_PLL2_MUL20 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLL2_MUL8;
            };

            const PLL2VCOMul2Value: u32 = blk: {
                break :blk 2;
            };

            const PLL2VCOoutputFreqValueValue: f32 = blk: {
                if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    PLL2VCOoutput.limit = .{
                        .min = 8e7,
                        .max = 1.48e8,
                        .main_expr = "PLL2Used=1",
                        .main_dialog = "PLL2_VCO constraint",
                    };
                    break :blk 1.28e8;
                }
                PLL2VCOoutput.limit = .{
                    .min = 1.28e8,
                    .max = 1.28e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk 1.28e8;
            };

            const PLL2CLKoutputFreqValueValue: f32 = blk: {
                if (check_ref(@TypeOf(PLL2UsedValue), PLL2UsedValue, 1, .@"=")) {
                    PLL2CLKoutput.limit = .{
                        .min = 4e7,
                        .max = 7.4e7,
                        .main_expr = "PLL2Used=1",
                        .main_dialog = "PLL2CLK constraint",
                    };
                    break :blk 6.4e7;
                }
                PLL2CLKoutput.limit = .{
                    .min = 6.4e7,
                    .max = 6.4e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk 6.4e7;
            };

            const PLL3MulValue: PLL3MulList = blk: {
                const user_val = config.PLL3Mul;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLLI2S_MUL8 => {},
                        .RCC_PLLI2S_MUL9 => {},
                        .RCC_PLLI2S_MUL10 => {},
                        .RCC_PLLI2S_MUL11 => {},
                        .RCC_PLLI2S_MUL12 => {},
                        .RCC_PLLI2S_MUL13 => {},
                        .RCC_PLLI2S_MUL14 => {},
                        .RCC_PLLI2S_MUL16 => {},
                        .RCC_PLLI2S_MUL20 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLLI2S_MUL8;
            };

            const PLL3VCOMul2Value: u32 = blk: {
                break :blk 2;
            };

            const PLL3VCOoutputFreqValueValue: f32 = blk: {
                if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    PLL3VCOoutput.limit = .{
                        .min = 8e7,
                        .max = 1.48e8,
                        .main_expr = "PLL3Used=1",
                        .main_dialog = "PLL3_VCO constraint",
                    };
                    break :blk 1.28e8;
                }
                PLL3VCOoutput.limit = .{
                    .min = 1.28e8,
                    .max = 1.28e8,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk 1.28e8;
            };

            const PLL3CLKoutputFreqValueValue: f32 = blk: {
                if (check_ref(@TypeOf(PLL3UsedValue), PLL3UsedValue, 1, .@"=")) {
                    PLL3CLKoutput.limit = .{
                        .min = 4e7,
                        .max = 7.4e7,
                        .main_expr = "PLL3Used=1",
                        .main_dialog = "PLL3CLK constraint",
                    };
                    break :blk 6.4e7;
                }
                PLL3CLKoutput.limit = .{
                    .min = 6.4e7,
                    .max = 6.4e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk 6.4e7;
            };

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_HSI => {},
                        .RCC_SYSCLKSOURCE_HSE => {},
                        .RCC_SYSCLKSOURCE_PLLCLK => {},
                    }
                }
                break :blk user_val orelse .RCC_SYSCLKSOURCE_HSI;
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: u32 = blk: {
                break :blk 128;
            };

            const RTCClockSelectionValue: RTCClockSelectionList = blk: {
                const user_val = config.RTCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => {},
                        .RCC_RTCCLKSOURCE_LSI => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV128 => {},
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_LSI;
            };

            const RCC_MCOMult_Clock_Source_FROM_PLL3MULValue: RCC_MCOMult_Clock_Source_FROM_PLL3MULList = blk: {
                const user_val = config.RCC_MCOMult_Clock_Source_FROM_PLL3MUL;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_PLL3CLK => {},
                        .RCC_MCO1SOURCE_PLL3CLK_DIV2 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_PLL3CLK;
            };

            const RCC_MCOMult_Clock_Source_FROM_PLLMULValue: u32 = blk: {
                break :blk 2;
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

            const TimSys_DivValue: TimSys_DivList = blk: {
                const user_val = config.TimSys_Div;

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

            const ADCPrescValue: ADCPrescList = blk: {
                const user_val = config.ADCPresc;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCPCLK2_DIV2 => {},
                        .RCC_ADCPCLK2_DIV4 => {},
                        .RCC_ADCPCLK2_DIV6 => {},
                        .RCC_ADCPCLK2_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_ADCPCLK2_DIV2;
            };

            const ADCFreqValueValue: f32 = blk: {
                ADCoutput.limit = .{
                    .min = null,
                    .max = 1.4e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk 4e6;
            };

            const HSEDivPLLValue: HSEDivPLLList = blk: {
                const user_val = config.HSEDivPLL;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSE_PREDIV_DIV1 => {},
                        .RCC_HSE_PREDIV_DIV2 => {},
                        .RCC_HSE_PREDIV_DIV3 => {},
                        .RCC_HSE_PREDIV_DIV4 => {},
                        .RCC_HSE_PREDIV_DIV5 => {},
                        .RCC_HSE_PREDIV_DIV6 => {},
                        .RCC_HSE_PREDIV_DIV7 => {},
                        .RCC_HSE_PREDIV_DIV8 => {},
                        .RCC_HSE_PREDIV_DIV9 => {},
                        .RCC_HSE_PREDIV_DIV10 => {},
                        .RCC_HSE_PREDIV_DIV11 => {},
                        .RCC_HSE_PREDIV_DIV12 => {},
                        .RCC_HSE_PREDIV_DIV13 => {},
                        .RCC_HSE_PREDIV_DIV14 => {},
                        .RCC_HSE_PREDIV_DIV15 => {},
                        .RCC_HSE_PREDIV_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_HSE_PREDIV_DIV1;
            };

            const PLLMULValue: PLLMULList = blk: {
                const user_val = config.PLLMUL;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLL_MUL4 => {},
                        .RCC_PLL_MUL5 => {},
                        .RCC_PLL_MUL6 => {},
                        .RCC_PLL_MUL6_5 => {},
                        .RCC_PLL_MUL7 => {},
                        .RCC_PLL_MUL8 => {},
                        .RCC_PLL_MUL9 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLL_MUL4;
            };

            const PLLVCOMul2Value: u32 = blk: {
                break :blk 2;
            };

            const USBPrescalerValue: USBPrescalerList = blk: {
                const user_val = config.USBPrescaler;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL_DIV2 => {},
                        .RCC_USBCLKSOURCE_PLL_DIV3 => {},
                    }
                }
                break :blk user_val orelse .RCC_USBCLKSOURCE_PLL_DIV3;
            };

            const VDD_VALUEValue: f32 = blk: {
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
                            "Else",
                            "No additional information",
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
                if (!check_ref(@TypeOf(AHBCLKDividerValue), AHBCLKDividerValue, .RCC_SYSCLK_DIV1, .@"=")) {
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
                                "!AHBCLKDivider=RCC_SYSCLK_DIV1",
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

            const PLLUsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_PLLCLK, .@"=")) and config.flags.MCOConfig) or config.flags.USB_OTG_FSUsed_ForRCC)) {
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

            const I2S2EnableValue: I2S2EnableList = blk: {
                if (!config.flags.I2S2Used_ForRCC) {
                    break :blk .false;
                } else if (config.flags.I2S2Used_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S3EnableValue: I2S3EnableList = blk: {
                if (!config.flags.I2S3Used_ForRCC) {
                    break :blk .false;
                } else if (config.flags.I2S3Used_ForRCC) {
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

            const EnableHSEMCODevisorValue: EnableHSEMCODevisorList = blk: {
                if ((config.flags.MCOConfig and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const MCOEnableValue: MCOEnableList = blk: {
                if (config.flags.MCOConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (config.flags.USE_ADC1 or config.flags.USE_ADC2) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USB_OTG_FSUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.LSEOscillator or config.flags.LSEByPass))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HSEUsedValue: u1 = blk: {
                if (((config.flags.I2S2Used_ForRCC and (check_ref(@TypeOf(I2S2ClockSelectionValue), I2S2ClockSelectionValue, .RCC_I2S2CLKSOURCE_PLLI2S_VCO, .@"="))) or (config.flags.I2S3Used_ForRCC and (check_ref(@TypeOf(I2S3ClockSelectionValue), I2S3ClockSelectionValue, .RCC_I2S3CLKSOURCE_PLLI2S_VCO, .@"=")))) or ((config.flags.RTCUsed_ForRCC) and !((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) or ((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"=")) or (((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSE, .@"=")) or (false) or (false) or (check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_PLL2CLK, .@"=")) or (check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_EXT_HSE, .@"="))) and config.flags.MCOConfig)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSEUsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and config.flags.RTCUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSIUsedValue: u1 = blk: {
                if ((config.flags.IWDGUsed_ForRCC or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and config.flags.RTCUsed_ForRCC))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSI_DIV2, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const EnbaleCSSValue: EnbaleCSSList = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            // ======= NODE FLITFCLKoutput ======
            FLITFCLKoutput.nodetype = .output;
            FLITFCLKoutput.parents = &.{&HSIRC};

            // ======= NODE HSIDivPLL ======
            HSIDivPLL.nodetype = .div;
            HSIDivPLL.value = @floatFromInt(HSIDivPLLValue);
            HSIDivPLL.parents = &.{&HSIRC};

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE Prediv2 ======
            Prediv2.nodetype = .div;
            Prediv2.value = try Prediv2Value.get();
            Prediv2.parents = &.{&HSEOSC};

            // ======= NODE Prediv2output ======
            Prediv2output.nodetype = .output;
            Prediv2output.parents = &.{&Prediv2};

            // ======= NODE PLL2Mul ======
            PLL2Mul.nodetype = .mul;
            PLL2Mul.value = try PLL2MulValue.get();
            PLL2Mul.parents = &.{&Prediv2output};

            // ======= NODE PLL2VCOMul2 ======
            PLL2VCOMul2.nodetype = .mul;
            PLL2VCOMul2.value = @floatFromInt(PLL2VCOMul2Value);
            PLL2VCOMul2.parents = &.{&PLL2Mul};

            // ======= NODE PLL2VCOoutput ======
            PLL2VCOoutput.nodetype = .output;
            PLL2VCOoutput.parents = &.{&PLL2VCOMul2};

            // ======= NODE PLL2CLKoutput ======
            PLL2CLKoutput.nodetype = .output;
            PLL2CLKoutput.parents = &.{&PLL2Mul};

            // ======= NODE PLL3Mul ======
            PLL3Mul.nodetype = .mul;
            PLL3Mul.value = try PLL3MulValue.get();
            PLL3Mul.parents = &.{&Prediv2output};

            // ======= NODE PLL3VCOMul2 ======
            PLL3VCOMul2.nodetype = .mul;
            PLL3VCOMul2.value = @floatFromInt(PLL3VCOMul2Value);
            PLL3VCOMul2.parents = &.{&PLL3Mul};

            // ======= NODE PLL3VCOoutput ======
            PLL3VCOoutput.nodetype = .output;
            PLL3VCOoutput.parents = &.{&PLL3VCOMul2};

            // ======= NODE PLL3CLKoutput ======
            PLL3CLKoutput.nodetype = .output;
            PLL3CLKoutput.parents = &.{&PLL3Mul};

            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_HSI => &.{&HSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_PLLCLK => &.{&PLLMUL},
            };

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SysClkSource};

            // ======= NODE I2S2Mult ======
            I2S2Mult.nodetype = .multi;
            I2S2Mult.parents = switch (I2S2ClockSelectionValue) {
                .RCC_I2S2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2S2CLKSOURCE_PLLI2S_VCO => &.{&PLL3VCOoutput},
            };

            // ======= NODE I2S2Output ======
            I2S2Output.nodetype = .output;
            I2S2Output.parents = &.{&I2S2Mult};

            // ======= NODE I2S3Mult ======
            I2S3Mult.nodetype = .multi;
            I2S3Mult.parents = switch (I2S3ClockSelectionValue) {
                .RCC_I2S3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2S3CLKSOURCE_PLLI2S_VCO => &.{&PLL3VCOoutput},
            };

            // ======= NODE I2S3Output ======
            I2S3Output.nodetype = .output;
            I2S3Output.parents = &.{&I2S3Mult};

            // ======= NODE HSERTCDevisor ======
            HSERTCDevisor.nodetype = .div;
            HSERTCDevisor.value = @floatFromInt(RCC_RTC_Clock_Source_FROM_HSEValue);
            HSERTCDevisor.parents = &.{&HSEOSC};

            // ======= NODE RTCClkSource ======
            RTCClkSource.nodetype = .multi;
            RTCClkSource.parents = switch (RTCClockSelectionValue) {
                .RCC_RTCCLKSOURCE_HSE_DIV128 => &.{&HSERTCDevisor},
                .RCC_RTCCLKSOURCE_LSE => &.{&LSEOSC},
                .RCC_RTCCLKSOURCE_LSI => &.{&LSIRC},
            };

            // ======= NODE RTCOutput ======
            RTCOutput.nodetype = .output;
            RTCOutput.parents = &.{&RTCClkSource};

            // ======= NODE IWDGOutput ======
            IWDGOutput.nodetype = .output;
            IWDGOutput.parents = &.{&LSIRC};

            // ======= NODE MCOPLL3Div ======
            MCOPLL3Div.nodetype = .div;
            MCOPLL3Div.value = try RCC_MCOMult_Clock_Source_FROM_PLL3MULValue.get();
            MCOPLL3Div.parents = &.{&PLL3CLKoutput};

            // ======= NODE MCOMultDivisor ======
            MCOMultDivisor.nodetype = .div;
            MCOMultDivisor.value = @floatFromInt(RCC_MCOMult_Clock_Source_FROM_PLLMULValue);
            MCOMultDivisor.parents = &.{&PLLMUL};

            // ======= NODE MCOMult ======
            MCOMult.nodetype = .multi;
            MCOMult.parents = switch (RCC_MCOSourceValue) {
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_MCO1SOURCE_PLLCLK => &.{&MCOMultDivisor},
                .RCC_MCO1SOURCE_PLL2CLK => &.{&PLL2CLKoutput},
                .MCOPLL3Div => &.{&MCOPLL3Div},
                .RCC_MCO1SOURCE_EXT_HSE => &.{&HSEOSC},
            };

            // ======= NODE MCOoutput ======
            MCOoutput.nodetype = .output;
            MCOoutput.parents = &.{&MCOMult};

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

            // ======= NODE TimSysPresc ======
            TimSysPresc.nodetype = .div;
            TimSysPresc.value = try TimSys_DivValue.get();
            TimSysPresc.parents = &.{&AHBOutput};

            // ======= NODE TimSysOutput ======
            TimSysOutput.nodetype = .output;
            TimSysOutput.parents = &.{&TimSysPresc};

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

            // ======= NODE ADCprescaler ======
            ADCprescaler.nodetype = .div;
            ADCprescaler.value = try ADCPrescValue.get();
            ADCprescaler.parents = &.{&APB2Prescaler};

            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&ADCprescaler};

            // ======= NODE Prediv1Source ======
            Prediv1Source.nodetype = .multi;
            Prediv1Source.parents = switch (Prediv1SourceValue) {
                .RCC_PREDIV1_SOURCE_HSE => &.{&HSEOSC},
                .RCC_PREDIV1_SOURCE_PLL2 => &.{&PLL2CLKoutput},
            };

            // ======= NODE PreDiv1 ======
            PreDiv1.nodetype = .div;
            PreDiv1.value = try HSEDivPLLValue.get();
            PreDiv1.parents = &.{&Prediv1Source};

            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI_DIV2 => &.{&HSIDivPLL},
                .RCC_PLLSOURCE_HSE => &.{&PreDiv1},
            };

            // ======= NODE VCO2output ======
            VCO2output.nodetype = .output;
            VCO2output.parents = &.{&PLLSource};

            // ======= NODE PLLMUL ======
            PLLMUL.nodetype = .mul;
            PLLMUL.value = try PLLMULValue.get();
            PLLMUL.parents = &.{&VCO2output};

            // ======= NODE PLLVCOMul2 ======
            PLLVCOMul2.nodetype = .mul;
            PLLVCOMul2.value = @floatFromInt(PLLVCOMul2Value);
            PLLVCOMul2.parents = &.{&PLLMUL};

            // ======= NODE USBPrescaler ======
            USBPrescaler.nodetype = .div;
            USBPrescaler.value = try USBPrescalerValue.get();
            USBPrescaler.parents = &.{&PLLVCOMul2};

            // ======= NODE USBoutput ======
            USBoutput.nodetype = .output;
            USBoutput.parents = &.{&USBPrescaler};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLLMUL};

            //======== POST REFS ========

            //======= FLITFCLKFreq_Value ========
            const FLITFCLKFreq_ValueValue = FLITFCLKoutput.get_as_ref();
            ignore_value(FLITFCLKFreq_ValueValue);

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            SysCLKOutput.limit = .{
                .min = null,
                .max = 7.2e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= I2S2Freq_Value ========
            const I2S2Freq_ValueValue = I2S2Output.get_as_ref();
            ignore_value(I2S2Freq_ValueValue);

            //======= I2S3Freq_Value ========
            const I2S3Freq_ValueValue = I2S3Output.get_as_ref();
            ignore_value(I2S3Freq_ValueValue);

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(config.flags.RCC_RTC_Clock_Source) and !(config.flags.RCC_RTC_Clock_Source))) {
                RTCOutput.limit = .{
                    .min = null,
                    .max = 1e6,
                    .main_expr = "(!(RCC_RTC_Clock_Source=RCC_RTCCLKSOURCE_LSE)&!(RCC_RTC_Clock_Source=RCC_RTCCLKSOURCE_LSI))",
                    .main_dialog = "RTC Has HSE as source",
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= MCOFreq_Value ========
            const MCOFreq_ValueValue = MCOoutput.get_as_ref();
            ignore_value(MCOFreq_ValueValue);

            MCOoutput.limit = .{
                .min = null,
                .max = 5e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);
            if (config.flags.ETHUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 2.5e7,
                    .max = 7.2e7,
                    .main_expr = "ETHUsed_ForRCC",
                    .main_dialog = "HCLK and ETH constraint",
                };
            } else if (config.flags.USB_OTG_FSUsed_ForRCC) {
                AHBOutput.limit = .{
                    .min = 1.42e7,
                    .max = 7.2e7,
                    .main_expr = "USB_OTG_FSUsed_ForRCC",
                    .main_dialog = "HCLK and USB Constraint",
                };
            } else {
                AHBOutput.limit = .{
                    .min = null,
                    .max = 7.2e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
            }

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= TimSysFreq_Value ========
            const TimSysFreq_ValueValue = TimSysOutput.get_as_ref();
            ignore_value(TimSysFreq_ValueValue);

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);

            APB1Output.limit = .{
                .min = null,
                .max = 3.6e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 7.2e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= VCOOutput2Freq_Value ========
            const VCOOutput2Freq_ValueValue = VCO2output.get_as_ref();
            ignore_value(VCOOutput2Freq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCO2output.limit = .{
                    .min = 3e6,
                    .max = 1.2e7,
                    .main_expr = "PLLUsed=1",
                    .main_dialog = "PLLMul input",
                };
            }

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);

            USBoutput.limit = .{
                .min = 4.788e7,
                .max = 4.812e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= PLLCLKFreq_Value ========
            const PLLCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = 1.8e7,
                    .max = 7.2e7,
                    .main_expr = "PLLUsed=1",
                    .main_dialog = "PLLMul Output",
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 0, .@">")) and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"<")) or ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@"=")))))) {
                    FLASH_LATENCY0 = true;
                    break :blk .FLASH_LATENCY_0;
                } else if (((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 24000000, .@">")) and ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 48000000, .@"<")) or ((check_ref(@TypeOf(SYSCLKFreq_VALUEValue), SYSCLKFreq_VALUEValue, 48000000, .@"=")))))) {
                    break :blk .FLASH_LATENCY_1;
                }
                break :blk .FLASH_LATENCY_2;
            };
            if (!(check_ref(@TypeOf(EnableLSEValue), EnableLSEValue, .true, .@"="))) {
                LSEOSC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                HSEOSC.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                Prediv2.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                Prediv2output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                PLL2Mul.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                PLL2VCOoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                PLL2CLKoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                PLL3Mul.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                PLL3VCOoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                PLL3CLKoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"="))) {
                I2S2Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S2EnableValue), I2S2EnableValue, .true, .@"="))) {
                I2S2Output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S3EnableValue), I2S3EnableValue, .true, .@"="))) {
                I2S3Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S3EnableValue), I2S3EnableValue, .true, .@"="))) {
                I2S3Output.nodetype = .off;
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
            if (!(check_ref(@TypeOf(EnableHSEMCODevisorValue), EnableHSEMCODevisorValue, .true, .@"="))) {
                MCOPLL3Div.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOMultDivisor.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"="))) {
                MCOoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCprescaler.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                Prediv1Source.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"="))) {
                PreDiv1.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                USBPrescaler.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"="))) {
                USBoutput.nodetype = .off;
            }
            out.HSIRC = try HSIRC.get_output();
            out.FLITFCLKoutput = try FLITFCLKoutput.get_output();
            out.HSIDivPLL = try HSIDivPLL.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.Prediv2 = try Prediv2.get_output();
            out.Prediv2output = try Prediv2output.get_output();
            out.PLL2Mul = try PLL2Mul.get_output();
            out.PLL2VCOMul2 = try PLL2VCOMul2.get_output();
            out.PLL2VCOoutput = try PLL2VCOoutput.get_output();
            out.PLL2CLKoutput = try PLL2CLKoutput.get_output();
            out.PLL3Mul = try PLL3Mul.get_output();
            out.PLL3VCOMul2 = try PLL3VCOMul2.get_output();
            out.PLL3VCOoutput = try PLL3VCOoutput.get_output();
            out.PLL3CLKoutput = try PLL3CLKoutput.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.I2S2Mult = try I2S2Mult.get_output();
            out.I2S2Output = try I2S2Output.get_output();
            out.I2S3Mult = try I2S3Mult.get_output();
            out.I2S3Output = try I2S3Output.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.MCOPLL3Div = try MCOPLL3Div.get_output();
            out.MCOMultDivisor = try MCOMultDivisor.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCOoutput = try MCOoutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.TimSysPresc = try TimSysPresc.get_output();
            out.TimSysOutput = try TimSysOutput.get_output();
            out.APB1Prescaler = try APB1Prescaler.get_output();
            out.APB1Output = try APB1Output.get_output();
            out.TimPrescalerAPB1 = try TimPrescalerAPB1.get_output();
            out.TimPrescOut1 = try TimPrescOut1.get_output();
            out.APB2Prescaler = try APB2Prescaler.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.TimPrescalerAPB2 = try TimPrescalerAPB2.get_output();
            out.TimPrescOut2 = try TimPrescOut2.get_output();
            out.ADCprescaler = try ADCprescaler.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.Prediv1Source = try Prediv1Source.get_output();
            out.PreDiv1 = try PreDiv1.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.VCO2output = try VCO2output.get_output();
            out.PLLMUL = try PLLMUL.get_output();
            out.PLLVCOMul2 = try PLLVCOMul2.get_output();
            out.USBPrescaler = try USBPrescaler.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            ignore_value(HSI_VALUEValue);
            ignore_value(FLITFCLKFreq_ValueValue);
            ref_out.HSIDivPLL = HSIDivPLLValue;
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ignore_value(HSE_VALUEValue);
            ref_out.Prediv2 = Prediv2Value;
            ignore_value(Prediv2FreqValueValue);
            ref_out.PLL2Mul = PLL2MulValue;
            ref_out.PLL2VCOMul2 = PLL2VCOMul2Value;
            ignore_value(PLL2VCOoutputFreqValueValue);
            ignore_value(PLL2CLKoutputFreqValueValue);
            ref_out.PLL3Mul = PLL3MulValue;
            ref_out.PLL3VCOMul2 = PLL3VCOMul2Value;
            ignore_value(PLL3VCOoutputFreqValueValue);
            ignore_value(PLL3CLKoutputFreqValueValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.I2S2ClockSelection = I2S2ClockSelectionValue;
            ignore_value(I2S2Freq_ValueValue);
            ref_out.I2S3ClockSelection = I2S3ClockSelectionValue;
            ignore_value(I2S3Freq_ValueValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.RCC_MCOMult_Clock_Source_FROM_PLL3MUL = RCC_MCOMult_Clock_Source_FROM_PLL3MULValue;
            ref_out.RCC_MCOMult_Clock_Source_FROM_PLLMUL = RCC_MCOMult_Clock_Source_FROM_PLLMULValue;
            ref_out.RCC_MCOSource = RCC_MCOSourceValue;
            ignore_value(MCOFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.TimSys_Div = TimSys_DivValue;
            ignore_value(TimSysFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APB1Freq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APB1TimFreq_ValueValue);
            ref_out.APB2CLKDivider = APB2CLKDividerValue;
            ignore_value(APB2Freq_ValueValue);
            ref_out.APB2TimCLKDivider = APB2TimCLKDividerValue;
            ignore_value(APB2TimFreq_ValueValue);
            ref_out.ADCPresc = ADCPrescValue;
            ignore_value(ADCFreqValueValue);
            ref_out.Prediv1Source = Prediv1SourceValue;
            ref_out.HSEDivPLL = HSEDivPLLValue;
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ignore_value(VCOOutput2Freq_ValueValue);
            ref_out.PLLMUL = PLLMULValue;
            ref_out.PLLVCOMul2 = PLLVCOMul2Value;
            ref_out.USBPrescaler = USBPrescalerValue;
            ignore_value(USBFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.I2S2Enable = I2S2EnableValue == .true;
            ref_out.flags.I2S3Enable = I2S3EnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.EnableHSEMCODevisor = EnableHSEMCODevisorValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.PLL2Used = PLL2UsedValue != 0;
            ref_out.flags.PLL3Used = PLL3UsedValue != 0;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.HSEUsed = HSEUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
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
