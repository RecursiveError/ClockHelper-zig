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
        pub const RCC_HSIKERDIV = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div3 = 2,
            Div4 = 3,
            Div5 = 4,
            Div6 = 5,
            Div7 = 6,
            Div8 = 7,
        };
        pub const RCC_MCOPRE = enum(u4) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
            Div32 = 5,
            Div64 = 6,
            Div128 = 7,
        };
        pub const RCC_HSIDIV = enum(u3) {
            Div1 = 0,
            Div2 = 1,
            Div4 = 2,
            Div8 = 3,
            Div16 = 4,
            Div32 = 5,
            Div64 = 6,
            Div128 = 7,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE_DIV_32 = 3,
        };
        pub const RCC_USART1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSIKER = 2,
            LSE = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumLow = 1,
            MediumHigh = 2,
            High = 3,
        };
        pub const RCC_I2S1SEL = enum(u2) {
            SYS = 0,
            HSIKER = 2,
            I2S_CKIN = 3,
        };
        pub const RCC_SW = enum(u3) {
            HSISYS = 0,
            HSE = 1,
            LSI = 3,
            LSE = 4,
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
        pub const RCC_MCOSEL = enum(u4) {
            SYS = 1,
            HSI = 3,
            HSE = 4,
            LSI = 6,
            LSE = 7,
        };
        pub const FLASH_LATENCY = enum(u3) {
            WS0 = 0,
            WS1 = 1,
        };
        pub const RCC_ADCSEL = enum(u2) {
            SYS = 0,
            HSIKER = 2,
        };
        pub const RCC_I2C1SEL = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            HSIKER = 2,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_LSCOSEL = enum(u1) {
            LSI = 0,
            LSE = 1,
        };

        pub const HSISYSCLKDividerList = enum {
            RCC_HSI_DIV1,
            RCC_HSI_DIV2,
            RCC_HSI_DIV4,
            RCC_HSI_DIV8,
            RCC_HSI_DIV16,
            RCC_HSI_DIV32,
            RCC_HSI_DIV64,
            RCC_HSI_DIV128,

            pub fn to_enum(self: @This()) anyerror!RCC_HSIDIV {
                return switch (self) {
                    .RCC_HSI_DIV32 => .Div32,
                    .RCC_HSI_DIV1 => .Div1,
                    .RCC_HSI_DIV16 => .Div16,
                    .RCC_HSI_DIV2 => .Div2,
                    .RCC_HSI_DIV64 => .Div64,
                    .RCC_HSI_DIV8 => .Div8,
                    .RCC_HSI_DIV4 => .Div4,
                    .RCC_HSI_DIV128 => .Div128,
                };
            }
            pub fn from_enum(item: RCC_HSIDIV) anyerror!@This() {
                return switch (item) {
                    .Div32 => .RCC_HSI_DIV32,
                    .Div1 => .RCC_HSI_DIV1,
                    .Div16 => .RCC_HSI_DIV16,
                    .Div2 => .RCC_HSI_DIV2,
                    .Div64 => .RCC_HSI_DIV64,
                    .Div8 => .RCC_HSI_DIV8,
                    .Div4 => .RCC_HSI_DIV4,
                    .Div128 => .RCC_HSI_DIV128,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HSI_DIV1 => 1,
                    .RCC_HSI_DIV2 => 2,
                    .RCC_HSI_DIV4 => 4,
                    .RCC_HSI_DIV8 => 8,
                    .RCC_HSI_DIV16 => 16,
                    .RCC_HSI_DIV32 => 32,
                    .RCC_HSI_DIV64 => 64,
                    .RCC_HSI_DIV128 => 128,
                };
            }
        };

        pub const HSIKERCLKDividerList = enum {
            RCC_HSIKER_DIV1,
            RCC_HSIKER_DIV2,
            RCC_HSIKER_DIV3,
            RCC_HSIKER_DIV4,
            RCC_HSIKER_DIV5,
            RCC_HSIKER_DIV6,
            RCC_HSIKER_DIV7,
            RCC_HSIKER_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_HSIKERDIV {
                return switch (self) {
                    .RCC_HSIKER_DIV6 => .Div6,
                    .RCC_HSIKER_DIV4 => .Div4,
                    .RCC_HSIKER_DIV3 => .Div3,
                    .RCC_HSIKER_DIV1 => .Div1,
                    .RCC_HSIKER_DIV8 => .Div8,
                    .RCC_HSIKER_DIV5 => .Div5,
                    .RCC_HSIKER_DIV7 => .Div7,
                    .RCC_HSIKER_DIV2 => .Div2,
                };
            }
            pub fn from_enum(item: RCC_HSIKERDIV) anyerror!@This() {
                return switch (item) {
                    .Div6 => .RCC_HSIKER_DIV6,
                    .Div4 => .RCC_HSIKER_DIV4,
                    .Div3 => .RCC_HSIKER_DIV3,
                    .Div1 => .RCC_HSIKER_DIV1,
                    .Div8 => .RCC_HSIKER_DIV8,
                    .Div5 => .RCC_HSIKER_DIV5,
                    .Div7 => .RCC_HSIKER_DIV7,
                    .Div2 => .RCC_HSIKER_DIV2,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_HSIKER_DIV1 => 1,
                    .RCC_HSIKER_DIV2 => 2,
                    .RCC_HSIKER_DIV3 => 3,
                    .RCC_HSIKER_DIV4 => 4,
                    .RCC_HSIKER_DIV5 => 5,
                    .RCC_HSIKER_DIV6 => 6,
                    .RCC_HSIKER_DIV7 => 7,
                    .RCC_HSIKER_DIV8 => 8,
                };
            }
        };

        pub const SYSCLKSourceList = enum {
            RCC_SYSCLKSOURCE_LSE,
            RCC_SYSCLKSOURCE_HSI,
            RCC_SYSCLKSOURCE_HSE,
            RCC_SYSCLKSOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_SW {
                return switch (self) {
                    .RCC_SYSCLKSOURCE_HSE => .HSE,
                    .RCC_SYSCLKSOURCE_LSE => .LSE,
                    .RCC_SYSCLKSOURCE_HSI => .HSISYS,
                    .RCC_SYSCLKSOURCE_LSI => .LSI,
                };
            }
            pub fn from_enum(item: RCC_SW) anyerror!@This() {
                return switch (item) {
                    .HSE => .RCC_SYSCLKSOURCE_HSE,
                    .LSE => .RCC_SYSCLKSOURCE_LSE,
                    .HSISYS => .RCC_SYSCLKSOURCE_HSI,
                    .LSI => .RCC_SYSCLKSOURCE_LSI,
                };
            }
        };

        pub const SYSDIVList = enum {
            RCC_SYSCLK_DIV1,

            pub fn to_enum(self: @This()) anyerror!RCC_HPRE {
                return switch (self) {
                    .RCC_SYSCLK_DIV1 => .Div1,
                };
            }
            pub fn from_enum(item: RCC_HPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_SYSCLK_DIV1,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_HPRE", @tagName(item), "SYSDIV" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_SYSCLK_DIV1 => 1,
                };
            }
        };

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,
            RCC_RTCCLKSOURCE_HSE_DIV32,

            pub fn to_enum(self: @This()) anyerror!RCC_RTCSEL {
                return switch (self) {
                    .RCC_RTCCLKSOURCE_LSI => .LSI,
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => .HSE_DIV_32,
                    .RCC_RTCCLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_RTCSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_RTCCLKSOURCE_LSI,
                    .HSE_DIV_32 => .RCC_RTCCLKSOURCE_HSE_DIV32,
                    .LSE => .RCC_RTCCLKSOURCE_LSE,
                };
            }
        };

        pub const USART1CLockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK1,
            RCC_USART1CLKSOURCE_SYSCLK,
            RCC_USART1CLKSOURCE_HSIKER,
            RCC_USART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART1SEL {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART1CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART1CLKSOURCE_HSIKER => .HSIKER,
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USART1SEL) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_USART1CLKSOURCE_PCLK1,
                    .HSIKER => .RCC_USART1CLKSOURCE_HSIKER,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
                };
            }
        };

        pub const I2S1CLockSelectionList = enum {
            RCC_I2S1CLKSOURCE_SYSCLK,
            RCC_I2S1CLKSOURCE_HSIKER,
            RCC_I2S1CLKSOURCE_EXT,

            pub fn to_enum(self: @This()) anyerror!RCC_I2S1SEL {
                return switch (self) {
                    .RCC_I2S1CLKSOURCE_EXT => .I2S_CKIN,
                    .RCC_I2S1CLKSOURCE_HSIKER => .HSIKER,
                    .RCC_I2S1CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_I2S1SEL) anyerror!@This() {
                return switch (item) {
                    .I2S_CKIN => .RCC_I2S1CLKSOURCE_EXT,
                    .HSIKER => .RCC_I2S1CLKSOURCE_HSIKER,
                    .SYS => .RCC_I2S1CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const ADCCLockSelectionList = enum {
            RCC_ADCCLKSOURCE_SYSCLK,
            RCC_ADCCLKSOURCE_HSIKER,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCSEL {
                return switch (self) {
                    .RCC_ADCCLKSOURCE_HSIKER => .HSIKER,
                    .RCC_ADCCLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ADCSEL) anyerror!@This() {
                return switch (item) {
                    .HSIKER => .RCC_ADCCLKSOURCE_HSIKER,
                    .SYS => .RCC_ADCCLKSOURCE_SYSCLK,
                };
            }
        };

        pub const I2C1CLockSelectionList = enum {
            RCC_I2C1CLKSOURCE_PCLK1,
            RCC_I2C1CLKSOURCE_SYSCLK,
            RCC_I2C1CLKSOURCE_HSIKER,

            pub fn to_enum(self: @This()) anyerror!RCC_I2C1SEL {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_HSIKER => .HSIKER,
                    .RCC_I2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C1CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_I2C1SEL) anyerror!@This() {
                return switch (item) {
                    .HSIKER => .RCC_I2C1CLKSOURCE_HSIKER,
                    .SYS => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .PCLK1 => .RCC_I2C1CLKSOURCE_PCLK1,
                };
            }
        };

        pub const RCC_MCO1SourceList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
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
                    .RCC_MCODIV_1 => .Div1,
                    .RCC_MCODIV_4 => .Div4,
                    .RCC_MCODIV_2 => .Div2,
                    .RCC_MCODIV_8 => .Div8,
                    .RCC_MCODIV_32 => .Div32,
                    .RCC_MCODIV_64 => .Div64,
                    .RCC_MCODIV_16 => .Div16,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div128 => .RCC_MCODIV_128,
                    .Div1 => .RCC_MCODIV_1,
                    .Div4 => .RCC_MCODIV_4,
                    .Div2 => .RCC_MCODIV_2,
                    .Div8 => .RCC_MCODIV_8,
                    .Div32 => .RCC_MCODIV_32,
                    .Div64 => .RCC_MCODIV_64,
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
                    .RCC_MCODIV_32 => 32,
                    .RCC_MCODIV_64 => 64,
                    .RCC_MCODIV_128 => 128,
                };
            }
        };

        pub const RCC_MCO2SourceList = enum {
            RCC_MCO2SOURCE_SYSCLK,
            RCC_MCO2SOURCE_HSI,
            RCC_MCO2SOURCE_HSE,
            RCC_MCO2SOURCE_LSE,
            RCC_MCO2SOURCE_LSI,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO2SOURCE_LSI => .LSI,
                    .RCC_MCO2SOURCE_LSE => .LSE,
                    .RCC_MCO2SOURCE_HSI => .HSI,
                    .RCC_MCO2SOURCE_HSE => .HSE,
                    .RCC_MCO2SOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_MCO2SOURCE_LSI,
                    .LSE => .RCC_MCO2SOURCE_LSE,
                    .HSI => .RCC_MCO2SOURCE_HSI,
                    .HSE => .RCC_MCO2SOURCE_HSE,
                    .SYS => .RCC_MCO2SOURCE_SYSCLK,
                };
            }
        };

        pub const RCC_MCO2DivList = enum {
            RCC_MCO2DIV_1,
            RCC_MCO2DIV_2,
            RCC_MCO2DIV_4,
            RCC_MCO2DIV_8,
            RCC_MCO2DIV_16,
            RCC_MCO2DIV_32,
            RCC_MCO2DIV_64,
            RCC_MCO2DIV_128,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOPRE {
                return switch (self) {
                    .RCC_MCO2DIV_1 => .Div1,
                    .RCC_MCO2DIV_2 => .Div2,
                    .RCC_MCO2DIV_4 => .Div4,
                    .RCC_MCO2DIV_8 => .Div8,
                    .RCC_MCO2DIV_32 => .Div32,
                    .RCC_MCO2DIV_64 => .Div64,
                    .RCC_MCO2DIV_16 => .Div16,
                    .RCC_MCO2DIV_128 => .Div128,
                };
            }
            pub fn from_enum(item: RCC_MCOPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_MCO2DIV_1,
                    .Div2 => .RCC_MCO2DIV_2,
                    .Div4 => .RCC_MCO2DIV_4,
                    .Div8 => .RCC_MCO2DIV_8,
                    .Div32 => .RCC_MCO2DIV_32,
                    .Div64 => .RCC_MCO2DIV_64,
                    .Div16 => .RCC_MCO2DIV_16,
                    .Div128 => .RCC_MCO2DIV_128,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_MCO2DIV_1 => 1,
                    .RCC_MCO2DIV_2 => 2,
                    .RCC_MCO2DIV_4 => 4,
                    .RCC_MCO2DIV_8 => 8,
                    .RCC_MCO2DIV_16 => 16,
                    .RCC_MCO2DIV_32 => 32,
                    .RCC_MCO2DIV_64 => 64,
                    .RCC_MCO2DIV_128 => 128,
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

        pub const AHBCLKDividerList = enum {
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

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_1 => .WS1,
                    .FLASH_LATENCY_0 => .WS0,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS1 => .FLASH_LATENCY_1,
                    .WS0 => .FLASH_LATENCY_0,
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

        pub const LSIEnableList = enum {
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

        pub const USART1EnableList = enum {
            true,
            false,
        };

        pub const I2S1EnableList = enum {
            true,
            false,
        };

        pub const ADCEnableList = enum {
            true,
            false,
        };

        pub const I2C1EnableList = enum {
            true,
            false,
        };

        pub const ExtClockEnableList = enum {
            true,
            false,
        };

        pub const MCOEnableList = enum {
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
            MCOConfig: bool = false,
            MCO2Config: bool = false,
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            EnableCSS: bool = false,
            I2C1_Used: bool = false,
            SPI1_Used: bool = false,
            I2S1_Used: bool = false,
            RTC_Used: bool = false,
            IWDG_Used: bool = false,
            USART1_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO2SOURCE_LSE: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            TIM16: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            RCC_SYSCLKSOURCE_LSE: bool = false,
            ADC1_USED: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_MCO2SOURCE_HSI: bool = false,
            RCC_APB1_DIV1: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            TIM17: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            MCO2Config: bool = false,
            LSCOConfig: bool = false,
            AudioClockConfig: bool = false,
            EnableCSS: bool = false,
            I2C1_Used: bool = false,
            SPI1_Used: bool = false,
            I2S1_Used: bool = false,
            RTC_Used: bool = false,
            IWDG_Used: bool = false,
            USART1_Used: bool = false,
            RCC_SYSCLKSOURCE_HSE: bool = false,
            RCC_MCO2SOURCE_LSE: bool = false,
            RCC_MCO1SOURCE_LSE: bool = false,
            TIM2: bool = false,
            Semaphore_TIM2_L4_ETR_REMAPTIM2: bool = false,
            SEM2RCC_LSE_REQUIRED_TIM2: bool = false,
            SEM2RCC_LSE_REQUIRED1_TIM16: bool = false,
            TIM16: bool = false,
            Semaphore_input_Channel1TIM16: bool = false,
            RCC_SYSCLKSOURCE_LSE: bool = false,
            ADC1_USED: bool = false,
            RCC_RTCCLKSOURCE_LSE: bool = false,
            RCC_RTCCLKSOURCE_LSI: bool = false,
            RCC_MCO2SOURCE_HSI: bool = false,
            RCC_APB1_DIV1: bool = false,
            SEM2RCC_MCO_REQUIRED_TIM17: bool = false,
            TIM17: bool = false,
            Semaphore_input_Channel1TIM17: bool = false,
            RCC_MCO1SOURCE_HSI: bool = false,
            RCC_SYSCLKSOURCE_HSI: bool = false,
            INSTRUCTION_CACHE_ENABLE: bool = false, //Reference flag
            PREFETCH_ENABLE: bool = false, //Reference flag
            DATA_CACHE_ENABLE: bool = false, //Reference flag
            LSIEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            I2S1Enable: bool = false, //Reference flag
            ADCEnable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            ExtClockEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            MCO2Enable: bool = false, //Reference flag
            LSCOEnable: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            EnableCSSLSE: bool = false, //Reference flag
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
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            HSISYSCLKDivider: ?HSISYSCLKDividerList = null,
            HSIKERCLKDivider: ?HSIKERCLKDividerList = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            USART1CLockSelection: ?USART1CLockSelectionList = null,
            I2S1CLockSelection: ?I2S1CLockSelectionList = null,
            ADCCLockSelection: ?ADCCLockSelectionList = null,
            I2C1CLockSelection: ?I2C1CLockSelectionList = null,
            RCC_MCO1Source: ?RCC_MCO1SourceList = null,
            RCC_MCODiv: ?RCC_MCODivList = null,
            RCC_MCO2Source: ?RCC_MCO2SourceList = null,
            RCC_MCO2Div: ?RCC_MCO2DivList = null,
            LSCOSource1: ?LSCOSource1List = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSISYSCLKDivider: HSISYSCLKDividerList,
            HSIKERCLKDivider: HSIKERCLKDividerList,
            SYSCLKSource: SYSCLKSourceList,
            SYSDIV: SYSDIVList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            USART1CLockSelection: USART1CLockSelectionList,
            I2S1CLockSelection: I2S1CLockSelectionList,
            ADCCLockSelection: ADCCLockSelectionList,
            I2C1CLockSelection: I2C1CLockSelectionList,
            RCC_MCO1Source: RCC_MCO1SourceList,
            RCC_MCODiv: RCC_MCODivList,
            RCC_MCO2Source: RCC_MCO2SourceList,
            RCC_MCO2Div: RCC_MCO2DivList,
            LSCOSource1: LSCOSource1List,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
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
            INSTRUCTION_CACHE_ENABLE: ?INSTRUCTION_CACHE_ENABLEList = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            DATA_CACHE_ENABLE: ?DATA_CACHE_ENABLEList = null,
            FLatency: ?FLASH_LATENCY = null,
            HSICalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            EnableCSSLSE: ?EnableCSSLSEList = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .INSTRUCTION_CACHE_ENABLE = self.INSTRUCTION_CACHE_ENABLE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .DATA_CACHE_ENABLE = self.DATA_CACHE_ENABLE,
                    .FLatency = if (self.FLatency) |val| try FLatencyList.from_enum(val) else null,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .EnableCSSLSE = self.EnableCSSLSE,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            HSISYSCLKDivider: ?RCC_HSIDIV = null,
            HSIKERCLKDivider: ?RCC_HSIKERDIV = null,
            HSE_VALUE: ?f32 = null,
            LSI_VALUE: ?f32 = null,
            LSE_VALUE: ?f32 = null,
            SYSCLKSource: ?RCC_SW = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            USART1CLockSelection: ?RCC_USART1SEL = null,
            I2S1CLockSelection: ?RCC_I2S1SEL = null,
            ADCCLockSelection: ?RCC_ADCSEL = null,
            I2C1CLockSelection: ?RCC_I2C1SEL = null,
            RCC_MCO1Source: ?RCC_MCOSEL = null,
            RCC_MCODiv: ?RCC_MCOPRE = null,
            RCC_MCO2Source: ?RCC_MCOSEL = null,
            RCC_MCO2Div: ?RCC_MCOPRE = null,
            LSCOSource1: ?RCC_LSCOSEL = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .HSISYSCLKDivider = if (self.HSISYSCLKDivider) |val| try HSISYSCLKDividerList.from_enum(val) else null,
                    .HSIKERCLKDivider = if (self.HSIKERCLKDivider) |val| try HSIKERCLKDividerList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .LSI_VALUE = self.LSI_VALUE,
                    .LSE_VALUE = self.LSE_VALUE,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .USART1CLockSelection = if (self.USART1CLockSelection) |val| try USART1CLockSelectionList.from_enum(val) else null,
                    .I2S1CLockSelection = if (self.I2S1CLockSelection) |val| try I2S1CLockSelectionList.from_enum(val) else null,
                    .ADCCLockSelection = if (self.ADCCLockSelection) |val| try ADCCLockSelectionList.from_enum(val) else null,
                    .I2C1CLockSelection = if (self.I2C1CLockSelection) |val| try I2C1CLockSelectionList.from_enum(val) else null,
                    .RCC_MCO1Source = if (self.RCC_MCO1Source) |val| try RCC_MCO1SourceList.from_enum(val) else null,
                    .RCC_MCODiv = if (self.RCC_MCODiv) |val| try RCC_MCODivList.from_enum(val) else null,
                    .RCC_MCO2Source = if (self.RCC_MCO2Source) |val| try RCC_MCO2SourceList.from_enum(val) else null,
                    .RCC_MCO2Div = if (self.RCC_MCO2Div) |val| try RCC_MCO2DivList.from_enum(val) else null,
                    .LSCOSource1 = if (self.LSCOSource1) |val| try LSCOSource1List.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSISYSCLKDivider: RCC_HSIDIV,
            HSIKERCLKDivider: RCC_HSIKERDIV,
            SYSCLKSource: RCC_SW,
            SYSDIV: RCC_HPRE,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            USART1CLockSelection: RCC_USART1SEL,
            I2S1CLockSelection: RCC_I2S1SEL,
            ADCCLockSelection: RCC_ADCSEL,
            I2C1CLockSelection: RCC_I2C1SEL,
            RCC_MCO1Source: RCC_MCOSEL,
            RCC_MCODiv: RCC_MCOPRE,
            RCC_MCO2Source: RCC_MCOSEL,
            RCC_MCO2Div: RCC_MCOPRE,
            LSCOSource1: RCC_LSCOSEL,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSISYSCLKDivider = try cubemx_config.HSISYSCLKDivider.to_enum(),
                    .HSIKERCLKDivider = try cubemx_config.HSIKERCLKDivider.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .SYSDIV = try cubemx_config.SYSDIV.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .USART1CLockSelection = try cubemx_config.USART1CLockSelection.to_enum(),
                    .I2S1CLockSelection = try cubemx_config.I2S1CLockSelection.to_enum(),
                    .ADCCLockSelection = try cubemx_config.ADCCLockSelection.to_enum(),
                    .I2C1CLockSelection = try cubemx_config.I2C1CLockSelection.to_enum(),
                    .RCC_MCO1Source = try cubemx_config.RCC_MCO1Source.to_enum(),
                    .RCC_MCODiv = try cubemx_config.RCC_MCODiv.to_enum(),
                    .RCC_MCO2Source = try cubemx_config.RCC_MCO2Source.to_enum(),
                    .RCC_MCO2Div = try cubemx_config.RCC_MCO2Div.to_enum(),
                    .LSCOSource1 = try cubemx_config.LSCOSource1.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
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
            HSISYS: u32 = 0,
            HSIKER: u32 = 0,
            HSEOSC: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            SysClkSource: u32 = 0,
            SYSDIV: u32 = 0,
            SysCLKOutput: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
            USART1Mult: u32 = 0,
            USART1output: u32 = 0,
            I2S1Mult: u32 = 0,
            I2S1output: u32 = 0,
            ADCMult: u32 = 0,
            ADCoutput: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1output: u32 = 0,
            I2S_CKIN: u32 = 0,
            MCOMult: u32 = 0,
            MCODiv: u32 = 0,
            MCOPin: u32 = 0,
            MCO2Mult: u32 = 0,
            MCO2Div: u32 = 0,
            MCO2Pin: u32 = 0,
            LSCOMult: u32 = 0,
            LSCOOutput: u32 = 0,
            AHBPrescaler: u32 = 0,
            PWRCLKoutput: u32 = 0,
            AHBOutput: u32 = 0,
            HCLKOutput: u32 = 0,
            CortexPrescaler: u32 = 0,
            CortexSysOutput: u32 = 0,
            FCLKCortexOutput: u32 = 0,
            APBPrescaler: u32 = 0,
            APBOutput: u32 = 0,
            TimPrescalerAPB: u32 = 0,
            TimPrescOut1: u32 = 0,
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

            var SysSourceLse: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceLsi: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var RTCSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourcePCLK2: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var USART1SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceSysclk: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceHsi: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2S1SourceExt: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var ADCSourceHsi: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourcePCLK1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceSys: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCOSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2Sourcesys: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var MCO2SourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var LSCOSSourceLSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var AHBCLKDivider1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var HSISYS = ClockNode{
                .name = "HSISYS",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSIKER = ClockNode{
                .name = "HSIKER",
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

            var SysClkSource = ClockNode{
                .name = "SysClkSource",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SYSDIV = ClockNode{
                .name = "SYSDIV",
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

            var I2S_CKIN = ClockNode{
                .name = "I2S_CKIN",
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

            var APBPrescaler = ClockNode{
                .name = "APBPrescaler",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var APBOutput = ClockNode{
                .name = "APBOutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimPrescalerAPB = ClockNode{
                .name = "TimPrescalerAPB",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var TimPrescOut1 = ClockNode{
                .name = "TimPrescOut1",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            const HSI_VALUEValue: f32 = blk: {
                break :blk 4.8e7;
            };

            const HSISYSCLKDividerValue: HSISYSCLKDividerList = blk: {
                const user_val = config.HSISYSCLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSI_DIV1 => {},
                        .RCC_HSI_DIV2 => {},
                        .RCC_HSI_DIV4 => {},
                        .RCC_HSI_DIV8 => {},
                        .RCC_HSI_DIV16 => {},
                        .RCC_HSI_DIV32 => {},
                        .RCC_HSI_DIV64 => {},
                        .RCC_HSI_DIV128 => {},
                    }
                }
                break :blk user_val orelse .RCC_HSI_DIV4;
            };

            const HSIKERCLKDividerValue: HSIKERCLKDividerList = blk: {
                const user_val = config.HSIKERCLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSIKER_DIV1 => {},
                        .RCC_HSIKER_DIV2 => {},
                        .RCC_HSIKER_DIV3 => {},
                        .RCC_HSIKER_DIV4 => {},
                        .RCC_HSIKER_DIV5 => {},
                        .RCC_HSIKER_DIV6 => {},
                        .RCC_HSIKER_DIV7 => {},
                        .RCC_HSIKER_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_HSIKER_DIV1;
            };

            const HSE_VALUEValue: f32 = blk: {
                if (config.flags.HSEByPass or config.flags.HSEOscillator) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 4e6,
                        .max = 4.8e7,
                        .main_expr = "HSEByPass|HSEOscillator",
                        .main_dialog = "HSE Mode",
                    };
                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 4.8e7,
                    .main_expr = "Else",
                    .main_dialog = "No additional information",
                };
                break :blk user_val orelse 8e6;
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

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SYSCLKSOURCE_LSE => SysSourceLse = true,
                        .RCC_SYSCLKSOURCE_HSI => SysSourceHSI = true,
                        .RCC_SYSCLKSOURCE_HSE => SysSourceHSE = true,
                        .RCC_SYSCLKSOURCE_LSI => SysSourceLsi = true,
                    }
                }
                break :blk user_val orelse {
                    SysSourceHSI = true;
                    break :blk .RCC_SYSCLKSOURCE_HSI;
                };
            };

            const SYSDIVValue: SYSDIVList = blk: {
                break :blk .RCC_SYSCLK_DIV1;
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: u32 = blk: {
                break :blk 32;
            };

            const RTCClockSelectionValue: RTCClockSelectionList = blk: {
                const user_val = config.RTCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => RTCSourceLSE = true,
                        .RCC_RTCCLKSOURCE_LSI => RTCSourceLSI = true,
                        .RCC_RTCCLKSOURCE_HSE_DIV32 => RTCSourceHSE = true,
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
                        .RCC_USART1CLKSOURCE_PCLK1 => USART1SourcePCLK2 = true,
                        .RCC_USART1CLKSOURCE_SYSCLK => USART1SourceSys = true,
                        .RCC_USART1CLKSOURCE_HSIKER => USART1SourceHSI = true,
                        .RCC_USART1CLKSOURCE_LSE => USART1SourceLSE = true,
                    }
                }
                break :blk user_val orelse {
                    USART1SourcePCLK2 = true;
                    break :blk .RCC_USART1CLKSOURCE_PCLK1;
                };
            };

            const I2S1CLockSelectionValue: I2S1CLockSelectionList = blk: {
                const user_val = config.I2S1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2S1CLKSOURCE_SYSCLK => I2S1SourceSysclk = true,
                        .RCC_I2S1CLKSOURCE_HSIKER => I2S1SourceHsi = true,
                        .RCC_I2S1CLKSOURCE_EXT => I2S1SourceExt = true,
                    }
                }
                break :blk user_val orelse {
                    I2S1SourceSysclk = true;
                    break :blk .RCC_I2S1CLKSOURCE_SYSCLK;
                };
            };

            const ADCCLockSelectionValue: ADCCLockSelectionList = blk: {
                const user_val = config.ADCCLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADCCLKSOURCE_SYSCLK => ADCSourceSys = true,
                        .RCC_ADCCLKSOURCE_HSIKER => ADCSourceHsi = true,
                    }
                }
                break :blk user_val orelse {
                    ADCSourceSys = true;
                    break :blk .RCC_ADCCLKSOURCE_SYSCLK;
                };
            };

            const I2C1CLockSelectionValue: I2C1CLockSelectionList = blk: {
                const user_val = config.I2C1CLockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_PCLK1 => I2C1SourcePCLK1 = true,
                        .RCC_I2C1CLKSOURCE_SYSCLK => I2C1SourceSys = true,
                        .RCC_I2C1CLKSOURCE_HSIKER => I2C1SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C1SourcePCLK1 = true;
                    break :blk .RCC_I2C1CLKSOURCE_PCLK1;
                };
            };

            const EXTERNAL_CLOCK_VALUEValue: f32 = blk: {
                break :blk 1.2288e7;
            };

            const RCC_MCO1SourceValue: RCC_MCO1SourceList = blk: {
                const user_val = config.RCC_MCO1Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => MCOSourcesys = true,
                        .RCC_MCO1SOURCE_HSI => MCOSourceHSI = true,
                        .RCC_MCO1SOURCE_HSE => MCOSourceHSE = true,
                        .RCC_MCO1SOURCE_LSE => MCOSourceLSE = true,
                        .RCC_MCO1SOURCE_LSI => MCOSourceLSI = true,
                    }
                }
                break :blk user_val orelse {
                    MCOSourcesys = true;
                    break :blk .RCC_MCO1SOURCE_SYSCLK;
                };
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
                        .RCC_MCODIV_32 => {},
                        .RCC_MCODIV_64 => {},
                        .RCC_MCODIV_128 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCODIV_1;
            };

            const RCC_MCO2SourceValue: RCC_MCO2SourceList = blk: {
                const user_val = config.RCC_MCO2Source;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO2SOURCE_SYSCLK => MCO2Sourcesys = true,
                        .RCC_MCO2SOURCE_HSI => MCO2SourceHSI = true,
                        .RCC_MCO2SOURCE_HSE => MCO2SourceHSE = true,
                        .RCC_MCO2SOURCE_LSE => MCO2SourceLSE = true,
                        .RCC_MCO2SOURCE_LSI => MCO2SourceLSI = true,
                    }
                }
                break :blk user_val orelse {
                    MCO2Sourcesys = true;
                    break :blk .RCC_MCO2SOURCE_SYSCLK;
                };
            };

            const RCC_MCO2DivValue: RCC_MCO2DivList = blk: {
                const user_val = config.RCC_MCO2Div;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO2DIV_1 => {},
                        .RCC_MCO2DIV_2 => {},
                        .RCC_MCO2DIV_4 => {},
                        .RCC_MCO2DIV_8 => {},
                        .RCC_MCO2DIV_16 => {},
                        .RCC_MCO2DIV_32 => {},
                        .RCC_MCO2DIV_64 => {},
                        .RCC_MCO2DIV_128 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO2DIV_1;
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

            const AHBCLKDividerValue: AHBCLKDividerList = blk: {
                const user_val = config.AHBCLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HCLK_DIV1 => AHBCLKDivider1 = true,
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
                break :blk user_val orelse {
                    AHBCLKDivider1 = true;
                    break :blk .RCC_HCLK_DIV1;
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

            const APB1CLKDividerValue: APB1CLKDividerList = blk: {
                const user_val = config.APB1CLKDivider;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_APB1_DIV1 => {},
                        .RCC_APB1_DIV2 => {},
                        .RCC_APB1_DIV4 => {},
                        .RCC_APB1_DIV8 => {},
                        .RCC_APB1_DIV16 => {},
                    }
                }
                break :blk user_val orelse .RCC_APB1_DIV1;
            };

            const APB1TimCLKDividerValue: u32 = blk: {
                if (check_ref(@TypeOf(APB1CLKDividerValue), APB1CLKDividerValue, .RCC_APB1_DIV1, .@"=")) {
                    break :blk 1;
                }
                break :blk 2;
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
                const user_val = config.extra_config.PREFETCH_ENABLE;

                if (user_val) |val| {
                    switch (val) {
                        .@"1" => {},
                        .@"0" => {},
                    }
                }
                break :blk user_val orelse .@"0";
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

            const HSIUsedValue: u1 = blk: {
                if ((I2S1SourceHsi and config.flags.I2S1_Used) or (I2S1SourceHsi and config.flags.SPI1_Used) or (ADCSourceHsi and config.flags.ADC1_USED) or (USART1SourceHSI and config.flags.USART1_Used) or (I2C1SourceHSI and config.flags.I2C1_Used) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig)))) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_HSI, .@"=")) and config.flags.MCO2Config)) {
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
                if ((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_LSE, .@"=")) or (LSCOSSourceLSE and config.flags.LSCOConfig) or (config.flags.Semaphore_input_Channel1TIM16 and config.flags.TIM16 and config.flags.SEM2RCC_LSE_REQUIRED1_TIM16) or (config.flags.SEM2RCC_LSE_REQUIRED_TIM2 and config.flags.Semaphore_TIM2_L4_ETR_REMAPTIM2 and config.flags.TIM2) or (USART1SourceLSE and config.flags.USART1_Used) or ((check_ref(@TypeOf(RCC_MCO1SourceValue), RCC_MCO1SourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((config.flags.Semaphore_input_Channel1TIM17 and config.flags.TIM17 and config.flags.SEM2RCC_MCO_REQUIRED_TIM17) or config.flags.MCOConfig)) or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and (config.flags.RTC_Used)) or ((check_ref(@TypeOf(RCC_MCO2SourceValue), RCC_MCO2SourceValue, .RCC_MCO2SOURCE_LSE, .@"=")) and config.flags.MCO2Config)) {
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

            const LSIEnableValue: LSIEnableList = blk: {
                break :blk .true;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTC_Used and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const RTCEnableValue: RTCEnableList = blk: {
                if (config.flags.RTC_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const IWDGEnableValue: IWDGEnableList = blk: {
                if (config.flags.IWDG_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USART1EnableValue: USART1EnableList = blk: {
                if (config.flags.USART1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2S1EnableValue: I2S1EnableList = blk: {
                if (config.flags.I2S1_Used or config.flags.SPI1_Used) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADCEnableValue: ADCEnableList = blk: {
                if (config.flags.ADC1_USED) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const I2C1EnableValue: I2C1EnableList = blk: {
                if (config.flags.I2C1_Used) {
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

            const MCOEnableValue: MCOEnableList = blk: {
                if (config.flags.MCOConfig) {
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

            const EnableCSSLSEValue: EnableCSSLSEList = blk: {
                if ((((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"="))) and (config.flags.RTC_Used))) {
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
                if (((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"="))) and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            // ======= NODE HSISYS ======
            HSISYS.nodetype = .div;
            HSISYS.value = try HSISYSCLKDividerValue.get();
            HSISYS.parents = &.{&HSIRC};

            // ======= NODE HSIKER ======
            HSIKER.nodetype = .div;
            HSIKER.value = try HSIKERCLKDividerValue.get();
            HSIKER.parents = &.{&HSIRC};

            // ======= NODE HSEOSC ======
            HSEOSC.nodetype = .source;
            HSEOSC.value = HSE_VALUEValue;

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            LSEOSC.nodetype = .source;
            LSEOSC.value = LSE_VALUEValue;

            // ======= NODE SysClkSource ======
            SysClkSource.nodetype = .multi;
            SysClkSource.parents = switch (SYSCLKSourceValue) {
                .RCC_SYSCLKSOURCE_LSI => &.{&LSIRC},
                .RCC_SYSCLKSOURCE_HSE => &.{&HSEOSC},
                .RCC_SYSCLKSOURCE_HSI => &.{&HSISYS},
                .RCC_SYSCLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE SYSDIV ======
            SYSDIV.nodetype = .div;
            SYSDIV.value = try SYSDIVValue.get();
            SYSDIV.parents = &.{&SysClkSource};

            // ======= NODE SysCLKOutput ======
            SysCLKOutput.nodetype = .output;
            SysCLKOutput.parents = &.{&SYSDIV};

            // ======= NODE HSERTCDevisor ======
            HSERTCDevisor.nodetype = .div;
            HSERTCDevisor.value = @floatFromInt(RCC_RTC_Clock_Source_FROM_HSEValue);
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
                .RCC_USART1CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_USART1CLKSOURCE_HSIKER => &.{&HSIKER},
                .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE USART1output ======
            USART1output.nodetype = .output;
            USART1output.parents = &.{&USART1Mult};

            // ======= NODE I2S1Mult ======
            I2S1Mult.nodetype = .multi;
            I2S1Mult.parents = switch (I2S1CLockSelectionValue) {
                .RCC_I2S1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2S1CLKSOURCE_HSIKER => &.{&HSIKER},
                .RCC_I2S1CLKSOURCE_EXT => &.{&I2S_CKIN},
            };

            // ======= NODE I2S1output ======
            I2S1output.nodetype = .output;
            I2S1output.parents = &.{&I2S1Mult};

            // ======= NODE ADCMult ======
            ADCMult.nodetype = .multi;
            ADCMult.parents = switch (ADCCLockSelectionValue) {
                .RCC_ADCCLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_ADCCLKSOURCE_HSIKER => &.{&HSIKER},
            };

            // ======= NODE ADCoutput ======
            ADCoutput.nodetype = .output;
            ADCoutput.parents = &.{&ADCMult};

            // ======= NODE I2C1Mult ======
            I2C1Mult.nodetype = .multi;
            I2C1Mult.parents = switch (I2C1CLockSelectionValue) {
                .RCC_I2C1CLKSOURCE_PCLK1 => &.{&APBPrescaler},
                .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                .RCC_I2C1CLKSOURCE_HSIKER => &.{&HSIKER},
            };

            // ======= NODE I2C1output ======
            I2C1output.nodetype = .output;
            I2C1output.parents = &.{&I2C1Mult};

            // ======= NODE I2S_CKIN ======
            I2S_CKIN.nodetype = .source;
            I2S_CKIN.value = EXTERNAL_CLOCK_VALUEValue;

            // ======= NODE MCOMult ======
            MCOMult.nodetype = .multi;
            MCOMult.parents = switch (RCC_MCO1SourceValue) {
                .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
            };

            // ======= NODE MCODiv ======
            MCODiv.nodetype = .div;
            MCODiv.value = try RCC_MCODivValue.get();
            MCODiv.parents = &.{&MCOMult};

            // ======= NODE MCOPin ======
            MCOPin.nodetype = .output;
            MCOPin.parents = &.{&MCODiv};

            // ======= NODE MCO2Mult ======
            MCO2Mult.nodetype = .multi;
            MCO2Mult.parents = switch (RCC_MCO2SourceValue) {
                .RCC_MCO2SOURCE_LSE => &.{&LSEOSC},
                .RCC_MCO2SOURCE_LSI => &.{&LSIRC},
                .RCC_MCO2SOURCE_HSE => &.{&HSEOSC},
                .RCC_MCO2SOURCE_HSI => &.{&HSIRC},
                .RCC_MCO2SOURCE_SYSCLK => &.{&SysCLKOutput},
            };

            // ======= NODE MCO2Div ======
            MCO2Div.nodetype = .div;
            MCO2Div.value = try RCC_MCO2DivValue.get();
            MCO2Div.parents = &.{&MCO2Mult};

            // ======= NODE MCO2Pin ======
            MCO2Pin.nodetype = .output;
            MCO2Pin.parents = &.{&MCO2Div};

            // ======= NODE LSCOMult ======
            LSCOMult.nodetype = .multi;
            LSCOMult.parents = switch (LSCOSource1Value) {
                .RCC_LSCOSOURCE_LSI => &.{&LSIRC},
                .RCC_LSCOSOURCE_LSE => &.{&LSEOSC},
            };

            // ======= NODE LSCOOutput ======
            LSCOOutput.nodetype = .output;
            LSCOOutput.parents = &.{&LSCOMult};

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

            // ======= NODE APBPrescaler ======
            APBPrescaler.nodetype = .div;
            APBPrescaler.value = try APB1CLKDividerValue.get();
            APBPrescaler.parents = &.{&AHBOutput};

            // ======= NODE APBOutput ======
            APBOutput.nodetype = .output;
            APBOutput.parents = &.{&APBPrescaler};

            // ======= NODE TimPrescalerAPB ======
            TimPrescalerAPB.nodetype = .mul;
            TimPrescalerAPB.value = @floatFromInt(APB1TimCLKDividerValue);
            TimPrescalerAPB.parents = &.{&APBPrescaler};

            // ======= NODE TimPrescOut1 ======
            TimPrescOut1.nodetype = .output;
            TimPrescOut1.parents = &.{&TimPrescalerAPB};

            //======== POST REFS ========

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);
            if ((check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 1.8, .@"<")) or (check_ref(@TypeOf(VDD_VALUEValue), VDD_VALUEValue, 2.1, .@">"))) {
                SysCLKOutput.limit = .{
                    .min = null,
                    .max = 4.8e7,
                    .main_expr = "(VDD_VALUE< 1.8)|(VDD_VALUE> 2.1)",
                    .main_dialog = "overDrive activated",
                };
            }

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) and !(check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")))) {
                RTCOutput.limit = .{
                    .min = 0e0,
                    .max = 1e6,
                    .main_expr = "(!(RTCClockSelection=RCC_RTCCLKSOURCE_LSE)&!(RTCClockSelection=RCC_RTCCLKSOURCE_LSI)& (RTCEnable=true))",
                    .main_dialog = "RTC Has HSE as source",
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= I2S1Freq_Value ========
            const I2S1Freq_ValueValue = I2S1output.get_as_ref();
            ignore_value(I2S1Freq_ValueValue);

            //======= ADCFreq_Value ========
            const ADCFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCFreq_ValueValue);

            ADCoutput.limit = .{
                .min = null,
                .max = 4.8e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= MCO1PinFreq_Value ========
            const MCO1PinFreq_ValueValue = MCOPin.get_as_ref();
            ignore_value(MCO1PinFreq_ValueValue);

            //======= MCO2PinFreq_Value ========
            const MCO2PinFreq_ValueValue = MCO2Pin.get_as_ref();
            ignore_value(MCO2PinFreq_ValueValue);

            //======= LSCOPinFreq_Value ========
            const LSCOPinFreq_ValueValue = LSCOOutput.get_as_ref();
            ignore_value(LSCOPinFreq_ValueValue);

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWRCLKoutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 4.8e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = CortexSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= APBFreq_Value ========
            const APBFreq_ValueValue = APBOutput.get_as_ref();
            ignore_value(APBFreq_ValueValue);

            APBOutput.limit = .{
                .min = null,
                .max = 4.8e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            //======= APBTimFreq_Value ========
            const APBTimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APBTimFreq_ValueValue);

            TimPrescOut1.limit = .{
                .min = null,
                .max = 4.8e7,
                .main_expr = "Else",
                .main_dialog = "No additional information",
            };

            const FLatencyValue: FLatencyList = blk: {
                if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"="))) {
                    const user_val = config.extra_config.FLatency;

                    if (user_val) |val| {
                        switch (val) {
                            .FLASH_LATENCY_0 => {},
                            .FLASH_LATENCY_1 => {},
                        }
                    }
                    break :blk user_val orelse .FLASH_LATENCY_0;
                } else if ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"<")) or (check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"="))) {
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
                                "(HCLKFreq_Value < 48000000) | (HCLKFreq_Value = 48000000)",
                                "",
                                patch_str,
                                val_enum,
                            });
                        }
                    }
                    break :blk .FLASH_LATENCY_1;
                }
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
                            "Else",
                            "No additional information",
                            patch_str,
                            val_enum,
                        });
                    }
                }
                break :blk .FLASH_LATENCY_0;
            };
            if (!(check_ref(@TypeOf(LSIEnableValue), LSIEnableValue, .true, .@"="))) {
                LSIRC.nodetype = .off;
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
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"="))) {
                USART1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S1EnableValue), I2S1EnableValue, .true, .@"="))) {
                I2S1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2S1EnableValue), I2S1EnableValue, .true, .@"="))) {
                I2S1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCMult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ADCEnableValue), ADCEnableValue, .true, .@"="))) {
                ADCoutput.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1Mult.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"="))) {
                I2C1output.nodetype = .off;
            }
            if (!(check_ref(@TypeOf(ExtClockEnableValue), ExtClockEnableValue, .true, .@"="))) {
                I2S_CKIN.nodetype = .off;
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
            out.HSIRC = try HSIRC.get_output();
            out.HSISYS = try HSISYS.get_output();
            out.HSIKER = try HSIKER.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SYSDIV = try SYSDIV.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1output = try USART1output.get_output();
            out.I2S1Mult = try I2S1Mult.get_output();
            out.I2S1output = try I2S1output.get_output();
            out.ADCMult = try ADCMult.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1output = try I2C1output.get_output();
            out.I2S_CKIN = try I2S_CKIN.get_output();
            out.MCOMult = try MCOMult.get_output();
            out.MCODiv = try MCODiv.get_output();
            out.MCOPin = try MCOPin.get_output();
            out.MCO2Mult = try MCO2Mult.get_output();
            out.MCO2Div = try MCO2Div.get_output();
            out.MCO2Pin = try MCO2Pin.get_output();
            out.LSCOMult = try LSCOMult.get_output();
            out.LSCOOutput = try LSCOOutput.get_output();
            out.AHBPrescaler = try AHBPrescaler.get_output();
            out.PWRCLKoutput = try PWRCLKoutput.get_output();
            out.AHBOutput = try AHBOutput.get_output();
            out.HCLKOutput = try HCLKOutput.get_output();
            out.CortexPrescaler = try CortexPrescaler.get_output();
            out.CortexSysOutput = try CortexSysOutput.get_output();
            out.FCLKCortexOutput = try FCLKCortexOutput.get_output();
            out.APBPrescaler = try APBPrescaler.get_output();
            out.APBOutput = try APBOutput.get_output();
            out.TimPrescalerAPB = try TimPrescalerAPB.get_output();
            out.TimPrescOut1 = try TimPrescOut1.get_output();
            ignore_value(HSI_VALUEValue);
            ref_out.HSISYSCLKDivider = HSISYSCLKDividerValue;
            ref_out.HSIKERCLKDivider = HSIKERCLKDividerValue;
            ignore_value(HSE_VALUEValue);
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ref_out.SYSDIV = SYSDIVValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.USART1CLockSelection = USART1CLockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.I2S1CLockSelection = I2S1CLockSelectionValue;
            ignore_value(I2S1Freq_ValueValue);
            ref_out.ADCCLockSelection = ADCCLockSelectionValue;
            ignore_value(ADCFreq_ValueValue);
            ref_out.I2C1CLockSelection = I2C1CLockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ignore_value(EXTERNAL_CLOCK_VALUEValue);
            ref_out.RCC_MCO1Source = RCC_MCO1SourceValue;
            ref_out.RCC_MCODiv = RCC_MCODivValue;
            ignore_value(MCO1PinFreq_ValueValue);
            ref_out.RCC_MCO2Source = RCC_MCO2SourceValue;
            ref_out.RCC_MCO2Div = RCC_MCO2DivValue;
            ignore_value(MCO2PinFreq_ValueValue);
            ref_out.LSCOSource1 = LSCOSource1Value;
            ignore_value(LSCOPinFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(PWRFreq_ValueValue);
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APBFreq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APBTimFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.INSTRUCTION_CACHE_ENABLE = INSTRUCTION_CACHE_ENABLEValue != .@"0";
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.flags.DATA_CACHE_ENABLE = DATA_CACHE_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.LSIEnable = LSIEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.I2S1Enable = I2S1EnableValue == .true;
            ref_out.flags.ADCEnable = ADCEnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.ExtClockEnable = ExtClockEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.MCO2Enable = MCO2EnableValue == .true;
            ref_out.flags.LSCOEnable = LSCOEnableValue == .true;
            ref_out.flags.HSIUsed = HSIUsedValue != 0;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.EnableCSSLSE = EnableCSSLSEValue == .true;
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
