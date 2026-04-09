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
        pub const RCC_SDPRE = enum(u5) {
            Div2 = 0,
            Div4 = 17,
            Div6 = 18,
            Div8 = 19,
            Div10 = 20,
            Div12 = 21,
            Div14 = 22,
            Div16 = 23,
            Div20 = 24,
            Div24 = 25,
            Div28 = 26,
            Div32 = 27,
            Div36 = 28,
            Div40 = 29,
            Div44 = 30,
            Div48 = 31,
        };
        pub const RCC_SW = enum(u2) {
            HSI = 0,
            HSE = 1,
            PLL1_P = 2,
        };
        pub const RCC_CECSW = enum(u1) {
            HSI_DIV_244 = 0,
            LSE = 1,
        };
        pub const RCC_MCOSEL = enum(u3) {
            LSI = 2,
            LSE = 3,
            SYS = 4,
            HSI = 5,
            HSE = 6,
            PLL_DIV_2 = 7,
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
        pub const RCC_ICSW = enum(u1) {
            HSI = 0,
            SYS = 1,
        };
        pub const RCC_PLLMUL = enum(u4) {
            Mul2 = 0,
            Mul3 = 1,
            Mul4 = 2,
            Mul5 = 3,
            Mul6 = 4,
            Mul7 = 5,
            Mul8 = 6,
            Mul9 = 7,
            Mul10 = 8,
            Mul11 = 9,
            Mul12 = 10,
            Mul13 = 11,
            Mul14 = 12,
            Mul15 = 13,
            Mul16 = 14,
        };
        pub const RCC_PLLSRC = enum(u1) {
            HSI_Div2 = 0,
            HSE_Div_PREDIV = 1,
        };
        pub const RCC_USART1SW = enum(u2) {
            PCLK2 = 0,
            SYS = 1,
            LSE = 2,
            HSI = 3,
        };
        pub const RCC_LSEDRV = enum(u2) {
            Low = 0,
            MediumHigh = 1,
            MediumLow = 2,
            High = 3,
        };
        pub const RCC_ADCPRES = enum(u5) {
            Div1 = 16,
            Div2 = 17,
            Div4 = 18,
            Div6 = 19,
            Div8 = 20,
            Div10 = 21,
            Div12 = 22,
            Div16 = 23,
            Div32 = 24,
            Div64 = 25,
            Div128 = 26,
            Div256 = 27,
        };
        pub const RCC_RTCSEL = enum(u2) {
            LSE = 1,
            LSI = 2,
            HSE = 3,
        };
        pub const RCC_PPRE = enum(u3) {
            Div1 = 0,
            Div2 = 4,
            Div4 = 5,
            Div8 = 6,
            Div16 = 7,
        };
        pub const RCC_USBPRE = enum(u1) {
            Div1_5 = 0,
            Div1 = 1,
        };
        pub const RCC_USARTSW = enum(u2) {
            PCLK1 = 0,
            SYS = 1,
            LSE = 2,
            HSI = 3,
        };
        pub const FLASH_LATENCY = enum(u3) {
            WS0 = 0,
            WS1 = 1,
            WS2 = 2,
        };

        pub const CECClockSelectionList = enum {
            RCC_CECCLKSOURCE_HSI,
            RCC_CECCLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_CECSW {
                return switch (self) {
                    .RCC_CECCLKSOURCE_LSE => .LSE,
                    .RCC_CECCLKSOURCE_HSI => .HSI_DIV_244,
                };
            }
            pub fn from_enum(item: RCC_CECSW) anyerror!@This() {
                return switch (item) {
                    .LSE => .RCC_CECCLKSOURCE_LSE,
                    .HSI_DIV_244 => .RCC_CECCLKSOURCE_HSI,
                };
            }
        };

        pub const RCC_PLLsource_Clock_Source_FROM_HSEList = enum {
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

        pub const PRESCALERUSBList = enum {
            RCC_USBCLKSOURCE_PLL,
            RCC_USBCLKSOURCE_PLL_DIV1_5,

            pub fn to_enum(self: @This()) anyerror!RCC_USBPRE {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL => .Div1,
                    .RCC_USBCLKSOURCE_PLL_DIV1_5 => .Div1_5,
                };
            }
            pub fn from_enum(item: RCC_USBPRE) anyerror!@This() {
                return switch (item) {
                    .Div1 => .RCC_USBCLKSOURCE_PLL,
                    .Div1_5 => .RCC_USBCLKSOURCE_PLL_DIV1_5,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_USBCLKSOURCE_PLL => 1,
                    .RCC_USBCLKSOURCE_PLL_DIV1_5 => 1.5,
                };
            }
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

        pub const SDADCPrescList = enum {
            RCC_SDADCSYSCLK_DIV2,
            RCC_SDADCSYSCLK_DIV4,
            RCC_SDADCSYSCLK_DIV6,
            RCC_SDADCSYSCLK_DIV8,
            RCC_SDADCSYSCLK_DIV10,
            RCC_SDADCSYSCLK_DIV12,
            RCC_SDADCSYSCLK_DIV14,
            RCC_SDADCSYSCLK_DIV16,
            RCC_SDADCSYSCLK_DIV20,
            RCC_SDADCSYSCLK_DIV24,
            RCC_SDADCSYSCLK_DIV28,
            RCC_SDADCSYSCLK_DIV32,
            RCC_SDADCSYSCLK_DIV36,
            RCC_SDADCSYSCLK_DIV40,
            RCC_SDADCSYSCLK_DIV44,
            RCC_SDADCSYSCLK_DIV48,

            pub fn to_enum(self: @This()) anyerror!RCC_SDPRE {
                return switch (self) {
                    .RCC_SDADCSYSCLK_DIV4 => .Div4,
                    .RCC_SDADCSYSCLK_DIV12 => .Div12,
                    .RCC_SDADCSYSCLK_DIV48 => .Div48,
                    .RCC_SDADCSYSCLK_DIV6 => .Div6,
                    .RCC_SDADCSYSCLK_DIV14 => .Div14,
                    .RCC_SDADCSYSCLK_DIV20 => .Div20,
                    .RCC_SDADCSYSCLK_DIV28 => .Div28,
                    .RCC_SDADCSYSCLK_DIV2 => .Div2,
                    .RCC_SDADCSYSCLK_DIV32 => .Div32,
                    .RCC_SDADCSYSCLK_DIV24 => .Div24,
                    .RCC_SDADCSYSCLK_DIV16 => .Div16,
                    .RCC_SDADCSYSCLK_DIV8 => .Div8,
                    .RCC_SDADCSYSCLK_DIV44 => .Div44,
                    .RCC_SDADCSYSCLK_DIV36 => .Div36,
                    .RCC_SDADCSYSCLK_DIV40 => .Div40,
                    .RCC_SDADCSYSCLK_DIV10 => .Div10,
                };
            }
            pub fn from_enum(item: RCC_SDPRE) anyerror!@This() {
                return switch (item) {
                    .Div4 => .RCC_SDADCSYSCLK_DIV4,
                    .Div12 => .RCC_SDADCSYSCLK_DIV12,
                    .Div48 => .RCC_SDADCSYSCLK_DIV48,
                    .Div6 => .RCC_SDADCSYSCLK_DIV6,
                    .Div14 => .RCC_SDADCSYSCLK_DIV14,
                    .Div20 => .RCC_SDADCSYSCLK_DIV20,
                    .Div28 => .RCC_SDADCSYSCLK_DIV28,
                    .Div2 => .RCC_SDADCSYSCLK_DIV2,
                    .Div32 => .RCC_SDADCSYSCLK_DIV32,
                    .Div24 => .RCC_SDADCSYSCLK_DIV24,
                    .Div16 => .RCC_SDADCSYSCLK_DIV16,
                    .Div8 => .RCC_SDADCSYSCLK_DIV8,
                    .Div44 => .RCC_SDADCSYSCLK_DIV44,
                    .Div36 => .RCC_SDADCSYSCLK_DIV36,
                    .Div40 => .RCC_SDADCSYSCLK_DIV40,
                    .Div10 => .RCC_SDADCSYSCLK_DIV10,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_SDADCSYSCLK_DIV2 => 2,
                    .RCC_SDADCSYSCLK_DIV4 => 4,
                    .RCC_SDADCSYSCLK_DIV6 => 6,
                    .RCC_SDADCSYSCLK_DIV8 => 8,
                    .RCC_SDADCSYSCLK_DIV10 => 10,
                    .RCC_SDADCSYSCLK_DIV12 => 12,
                    .RCC_SDADCSYSCLK_DIV14 => 14,
                    .RCC_SDADCSYSCLK_DIV16 => 16,
                    .RCC_SDADCSYSCLK_DIV20 => 20,
                    .RCC_SDADCSYSCLK_DIV24 => 24,
                    .RCC_SDADCSYSCLK_DIV28 => 28,
                    .RCC_SDADCSYSCLK_DIV32 => 32,
                    .RCC_SDADCSYSCLK_DIV36 => 36,
                    .RCC_SDADCSYSCLK_DIV40 => 40,
                    .RCC_SDADCSYSCLK_DIV44 => 44,
                    .RCC_SDADCSYSCLK_DIV48 => 48,
                };
            }
        };

        pub const RTCClockSelectionList = enum {
            RCC_RTCCLKSOURCE_LSE,
            RCC_RTCCLKSOURCE_LSI,
            RCC_RTCCLKSOURCE_HSE_DIV32,

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

        pub const RCC_MCOSourceList = enum {
            RCC_MCO1SOURCE_SYSCLK,
            RCC_MCO1SOURCE_HSI,
            RCC_MCO1SOURCE_HSE,
            RCC_MCO1SOURCE_LSI,
            RCC_MCO1SOURCE_LSE,
            RCC_MCO1SOURCE_PLLCLK_DIV2,

            pub fn to_enum(self: @This()) anyerror!RCC_MCOSEL {
                return switch (self) {
                    .RCC_MCO1SOURCE_LSI => .LSI,
                    .RCC_MCO1SOURCE_HSE => .HSE,
                    .RCC_MCO1SOURCE_HSI => .HSI,
                    .RCC_MCO1SOURCE_LSE => .LSE,
                    .RCC_MCO1SOURCE_SYSCLK => .SYS,
                    .RCC_MCO1SOURCE_PLLCLK_DIV2 => .PLL_DIV_2,
                };
            }
            pub fn from_enum(item: RCC_MCOSEL) anyerror!@This() {
                return switch (item) {
                    .LSI => .RCC_MCO1SOURCE_LSI,
                    .HSE => .RCC_MCO1SOURCE_HSE,
                    .HSI => .RCC_MCO1SOURCE_HSI,
                    .LSE => .RCC_MCO1SOURCE_LSE,
                    .SYS => .RCC_MCO1SOURCE_SYSCLK,
                    .PLL_DIV_2 => .RCC_MCO1SOURCE_PLLCLK_DIV2,
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

        pub const ADCPrescList = enum {
            RCC_ADC1PCLK2_DIV2,
            RCC_ADC1PCLK2_DIV4,
            RCC_ADC1PCLK2_DIV6,
            RCC_ADC1PCLK2_DIV8,

            pub fn to_enum(self: @This()) anyerror!RCC_ADCPRES {
                return switch (self) {
                    .RCC_ADC1PCLK2_DIV6 => .Div6,
                    .RCC_ADC1PCLK2_DIV8 => .Div8,
                    .RCC_ADC1PCLK2_DIV2 => .Div2,
                    .RCC_ADC1PCLK2_DIV4 => .Div4,
                };
            }
            pub fn from_enum(item: RCC_ADCPRES) anyerror!@This() {
                return switch (item) {
                    .Div6 => .RCC_ADC1PCLK2_DIV6,
                    .Div8 => .RCC_ADC1PCLK2_DIV8,
                    .Div2 => .RCC_ADC1PCLK2_DIV2,
                    .Div4 => .RCC_ADC1PCLK2_DIV4,
                    else => return comptime_fail_or_error(
                        error.UnmappedListItem,
                        "{s} - {s} cannot be mapped to {s}List",
                        .{ "RCC_ADCPRES", @tagName(item), "ADCPresc" },
                    ),
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_ADC1PCLK2_DIV2 => 2,
                    .RCC_ADC1PCLK2_DIV4 => 4,
                    .RCC_ADC1PCLK2_DIV6 => 6,
                    .RCC_ADC1PCLK2_DIV8 => 8,
                };
            }
        };

        pub const I2c1ClockSelectionList = enum {
            RCC_I2C1CLKSOURCE_SYSCLK,
            RCC_I2C1CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_ICSW {
                return switch (self) {
                    .RCC_I2C1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_I2C1CLKSOURCE_HSI => .HSI,
                };
            }
            pub fn from_enum(item: RCC_ICSW) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_I2C1CLKSOURCE_SYSCLK,
                    .HSI => .RCC_I2C1CLKSOURCE_HSI,
                };
            }
        };

        pub const I2c2ClockSelectionList = enum {
            RCC_I2C2CLKSOURCE_SYSCLK,
            RCC_I2C2CLKSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_ICSW {
                return switch (self) {
                    .RCC_I2C2CLKSOURCE_HSI => .HSI,
                    .RCC_I2C2CLKSOURCE_SYSCLK => .SYS,
                };
            }
            pub fn from_enum(item: RCC_ICSW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_I2C2CLKSOURCE_HSI,
                    .SYS => .RCC_I2C2CLKSOURCE_SYSCLK,
                };
            }
        };

        pub const Usart1ClockSelectionList = enum {
            RCC_USART1CLKSOURCE_PCLK2,
            RCC_USART1CLKSOURCE_SYSCLK,
            RCC_USART1CLKSOURCE_HSI,
            RCC_USART1CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USART1SW {
                return switch (self) {
                    .RCC_USART1CLKSOURCE_HSI => .HSI,
                    .RCC_USART1CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART1CLKSOURCE_LSE => .LSE,
                    .RCC_USART1CLKSOURCE_PCLK2 => .PCLK2,
                };
            }
            pub fn from_enum(item: RCC_USART1SW) anyerror!@This() {
                return switch (item) {
                    .HSI => .RCC_USART1CLKSOURCE_HSI,
                    .SYS => .RCC_USART1CLKSOURCE_SYSCLK,
                    .LSE => .RCC_USART1CLKSOURCE_LSE,
                    .PCLK2 => .RCC_USART1CLKSOURCE_PCLK2,
                };
            }
        };

        pub const Usart2ClockSelectionList = enum {
            RCC_USART2CLKSOURCE_PCLK1,
            RCC_USART2CLKSOURCE_SYSCLK,
            RCC_USART2CLKSOURCE_HSI,
            RCC_USART2CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSW {
                return switch (self) {
                    .RCC_USART2CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART2CLKSOURCE_HSI => .HSI,
                    .RCC_USART2CLKSOURCE_LSE => .LSE,
                    .RCC_USART2CLKSOURCE_PCLK1 => .PCLK1,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .SYS => .RCC_USART2CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART2CLKSOURCE_HSI,
                    .LSE => .RCC_USART2CLKSOURCE_LSE,
                    .PCLK1 => .RCC_USART2CLKSOURCE_PCLK1,
                };
            }
        };

        pub const Usart3ClockSelectionList = enum {
            RCC_USART3CLKSOURCE_PCLK1,
            RCC_USART3CLKSOURCE_SYSCLK,
            RCC_USART3CLKSOURCE_HSI,
            RCC_USART3CLKSOURCE_LSE,

            pub fn to_enum(self: @This()) anyerror!RCC_USARTSW {
                return switch (self) {
                    .RCC_USART3CLKSOURCE_PCLK1 => .PCLK1,
                    .RCC_USART3CLKSOURCE_SYSCLK => .SYS,
                    .RCC_USART3CLKSOURCE_HSI => .HSI,
                    .RCC_USART3CLKSOURCE_LSE => .LSE,
                };
            }
            pub fn from_enum(item: RCC_USARTSW) anyerror!@This() {
                return switch (item) {
                    .PCLK1 => .RCC_USART3CLKSOURCE_PCLK1,
                    .SYS => .RCC_USART3CLKSOURCE_SYSCLK,
                    .HSI => .RCC_USART3CLKSOURCE_HSI,
                    .LSE => .RCC_USART3CLKSOURCE_LSE,
                };
            }
        };

        pub const PLLSourceVirtualList = enum {
            RCC_PLLSOURCE_HSE,
            RCC_PLLSOURCE_HSI,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLSRC {
                return switch (self) {
                    .RCC_PLLSOURCE_HSE => .HSE_Div_PREDIV,
                    .RCC_PLLSOURCE_HSI => .HSI_Div2,
                };
            }
            pub fn from_enum(item: RCC_PLLSRC) anyerror!@This() {
                return switch (item) {
                    .HSE_Div_PREDIV => .RCC_PLLSOURCE_HSE,
                    .HSI_Div2 => .RCC_PLLSOURCE_HSI,
                };
            }
        };

        pub const PLLMULList = enum {
            RCC_PLL_MUL2,
            RCC_PLL_MUL3,
            RCC_PLL_MUL4,
            RCC_PLL_MUL5,
            RCC_PLL_MUL6,
            RCC_PLL_MUL7,
            RCC_PLL_MUL8,
            RCC_PLL_MUL9,
            RCC_PLL_MUL10,
            RCC_PLL_MUL11,
            RCC_PLL_MUL12,
            RCC_PLL_MUL13,
            RCC_PLL_MUL14,
            RCC_PLL_MUL15,
            RCC_PLL_MUL16,

            pub fn to_enum(self: @This()) anyerror!RCC_PLLMUL {
                return switch (self) {
                    .RCC_PLL_MUL14 => .Mul14,
                    .RCC_PLL_MUL12 => .Mul12,
                    .RCC_PLL_MUL5 => .Mul5,
                    .RCC_PLL_MUL13 => .Mul13,
                    .RCC_PLL_MUL7 => .Mul7,
                    .RCC_PLL_MUL3 => .Mul3,
                    .RCC_PLL_MUL9 => .Mul9,
                    .RCC_PLL_MUL16 => .Mul16,
                    .RCC_PLL_MUL10 => .Mul10,
                    .RCC_PLL_MUL2 => .Mul2,
                    .RCC_PLL_MUL8 => .Mul8,
                    .RCC_PLL_MUL4 => .Mul4,
                    .RCC_PLL_MUL6 => .Mul6,
                    .RCC_PLL_MUL15 => .Mul15,
                    .RCC_PLL_MUL11 => .Mul11,
                };
            }
            pub fn from_enum(item: RCC_PLLMUL) anyerror!@This() {
                return switch (item) {
                    .Mul14 => .RCC_PLL_MUL14,
                    .Mul12 => .RCC_PLL_MUL12,
                    .Mul5 => .RCC_PLL_MUL5,
                    .Mul13 => .RCC_PLL_MUL13,
                    .Mul7 => .RCC_PLL_MUL7,
                    .Mul3 => .RCC_PLL_MUL3,
                    .Mul9 => .RCC_PLL_MUL9,
                    .Mul16 => .RCC_PLL_MUL16,
                    .Mul10 => .RCC_PLL_MUL10,
                    .Mul2 => .RCC_PLL_MUL2,
                    .Mul8 => .RCC_PLL_MUL8,
                    .Mul4 => .RCC_PLL_MUL4,
                    .Mul6 => .RCC_PLL_MUL6,
                    .Mul15 => .RCC_PLL_MUL15,
                    .Mul11 => .RCC_PLL_MUL11,
                };
            }
            pub fn get(self: @This()) !f32 {
                return switch (self) {
                    .RCC_PLL_MUL2 => 2,
                    .RCC_PLL_MUL3 => 3,
                    .RCC_PLL_MUL4 => 4,
                    .RCC_PLL_MUL5 => 5,
                    .RCC_PLL_MUL6 => 6,
                    .RCC_PLL_MUL7 => 7,
                    .RCC_PLL_MUL8 => 8,
                    .RCC_PLL_MUL9 => 9,
                    .RCC_PLL_MUL10 => 10,
                    .RCC_PLL_MUL11 => 11,
                    .RCC_PLL_MUL12 => 12,
                    .RCC_PLL_MUL13 => 13,
                    .RCC_PLL_MUL14 => 14,
                    .RCC_PLL_MUL15 => 15,
                    .RCC_PLL_MUL16 => 16,
                };
            }
        };

        pub const PREFETCH_ENABLEList = enum {
            @"1",
            @"0",
        };

        pub const FLatencyList = enum {
            FLASH_LATENCY_0,
            FLASH_LATENCY_1,
            FLASH_LATENCY_2,

            pub fn to_enum(self: @This()) anyerror!FLASH_LATENCY {
                return switch (self) {
                    .FLASH_LATENCY_2 => .WS2,
                    .FLASH_LATENCY_0 => .WS0,
                    .FLASH_LATENCY_1 => .WS1,
                };
            }
            pub fn from_enum(item: FLASH_LATENCY) anyerror!@This() {
                return switch (item) {
                    .WS2 => .FLASH_LATENCY_2,
                    .WS0 => .FLASH_LATENCY_0,
                    .WS1 => .FLASH_LATENCY_1,
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

        pub const EnableLSEList = enum {
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

        pub const USBEnableList = enum {
            true,
            false,
        };

        pub const SDADCEnableList = enum {
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

        pub const MCOEnableList = enum {
            true,
            false,
        };

        pub const ADC1EnableList = enum {
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

        pub const EnableMCOMultDivisorList = enum {
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
            AudioClockConfig: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            USE_SDADC1: bool = false,
            USE_SDADC2: bool = false,
            USE_SDADC3: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            CSSEnabled: bool = false,
            MCOUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
        };

        //=======ClockTree Output Flags========

        pub const OutputFlags = struct {
            HSEByPass: bool = false,
            HSEOscillator: bool = false,
            LSEByPass: bool = false,
            LSEOscillator: bool = false,
            MCOConfig: bool = false,
            AudioClockConfig: bool = false,
            USBUsed_ForRCC: bool = false,
            RTCUsed_ForRCC: bool = false,
            USART1Used_ForRCC: bool = false,
            USART2Used_ForRCC: bool = false,
            USART3Used_ForRCC: bool = false,
            CECUsed_ForRCC: bool = false,
            USE_SDADC1: bool = false,
            USE_SDADC2: bool = false,
            USE_SDADC3: bool = false,
            IWDGUsed_ForRCC: bool = false,
            USE_ADC1: bool = false,
            I2C1Used_ForRCC: bool = false,
            I2C2Used_ForRCC: bool = false,
            CSSEnabled: bool = false,
            MCOUsed_ForRCC: bool = false,
            EnableCSS: bool = false,
            EnableCSSLSE: bool = false,
            PREFETCH_ENABLE: bool = false, //Reference flag
            LSEUsed: bool = false, //Reference flag
            PLLUsed: bool = false, //Reference flag
            EnableLSE: bool = false, //Reference flag
            CECEnable: bool = false, //Reference flag
            EnableHSE: bool = false, //Reference flag
            USBEnable: bool = false, //Reference flag
            SDADCEnable: bool = false, //Reference flag
            EnableHSERTCDevisor: bool = false, //Reference flag
            RTCEnable: bool = false, //Reference flag
            IWDGEnable: bool = false, //Reference flag
            MCOEnable: bool = false, //Reference flag
            ADC1Enable: bool = false, //Reference flag
            I2C1Enable: bool = false, //Reference flag
            I2C2Enable: bool = false, //Reference flag
            USART1Enable: bool = false, //Reference flag
            USART2Enable: bool = false, //Reference flag
            USART3Enable: bool = false, //Reference flag
            EnableMCOMultDivisor: bool = false, //Reference flag
            EnableLSERTC: bool = false, //Reference flag
            HSEUsed: bool = false, //Reference flag
            LSIUsed: bool = false, //Reference flag
            HSIUsed: bool = false, //Reference flag
            EnbaleCSS: bool = false, //Reference flag

        };

        //=======CubeMX Configurations========

        pub const CubeMXExtraConfig = struct {
            VDD_VALUE: ?f32 = null,
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?LSE_Drive_CapabilityList = null,
            EnbaleCSS: ?EnbaleCSSList = null,
        };

        pub const CubeMXConfig = struct {
            LSE_VALUE: ?f32 = null,
            CECClockSelection: ?CECClockSelectionList = null,
            HSE_VALUE: ?f32 = null,
            RCC_PLLsource_Clock_Source_FROM_HSE: ?RCC_PLLsource_Clock_Source_FROM_HSEList = null,
            PRESCALERUSB: ?PRESCALERUSBList = null,
            SYSCLKSource: ?SYSCLKSourceList = null,
            SDADCPresc: ?SDADCPrescList = null,
            RTCClockSelection: ?RTCClockSelectionList = null,
            RCC_MCOSource: ?RCC_MCOSourceList = null,
            AHBCLKDivider: ?AHBCLKDividerList = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?APB1CLKDividerList = null,
            APB2CLKDivider: ?APB2CLKDividerList = null,
            ADCPresc: ?ADCPrescList = null,
            I2c1ClockSelection: ?I2c1ClockSelectionList = null,
            I2c2ClockSelection: ?I2c2ClockSelectionList = null,
            Usart1ClockSelection: ?Usart1ClockSelectionList = null,
            Usart2ClockSelection: ?Usart2ClockSelectionList = null,
            Usart3ClockSelection: ?Usart3ClockSelectionList = null,
            PLLSourceVirtual: ?PLLSourceVirtualList = null,
            PLLMUL: ?PLLMULList = null,
            extra_config: CubeMXExtraConfig = .{},
            flags: Flags = .{},
        };

        pub const CubeMXOutputConfig = struct {
            flags: OutputFlags = .{},

            HSIRCDiv: u32,
            HSICECDiv: u32,
            CECClockSelection: CECClockSelectionList,
            RCC_PLLsource_Clock_Source_FROM_HSE: RCC_PLLsource_Clock_Source_FROM_HSEList,
            PRESCALERUSB: PRESCALERUSBList,
            SYSCLKSource: SYSCLKSourceList,
            SDADCPresc: SDADCPrescList,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RTCClockSelectionList,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: u32,
            RCC_MCOSource: RCC_MCOSourceList,
            AHBCLKDivider: AHBCLKDividerList,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: APB1CLKDividerList,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: APB2CLKDividerList,
            ADCPresc: ADCPrescList,
            APB2TimCLKDivider: u32,
            I2c1ClockSelection: I2c1ClockSelectionList,
            I2c2ClockSelection: I2c2ClockSelectionList,
            Usart1ClockSelection: Usart1ClockSelectionList,
            Usart2ClockSelection: Usart2ClockSelectionList,
            Usart3ClockSelection: Usart3ClockSelectionList,
            PLLSourceVirtual: PLLSourceVirtualList,
            PLLMUL: PLLMULList,
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
            PREFETCH_ENABLE: ?PREFETCH_ENABLEList = null,
            HSICalibrationValue: ?u32 = null,
            HSE_Timout: ?u32 = null,
            LSE_Timout: ?u32 = null,
            LSE_Drive_Capability: ?RCC_LSEDRV = null,
            EnbaleCSS: ?EnbaleCSSList = null,

            pub fn to_cubemx_config(self: ExtraConfig) !CubeMXExtraConfig {
                return CubeMXExtraConfig{
                    .VDD_VALUE = self.VDD_VALUE,
                    .PREFETCH_ENABLE = self.PREFETCH_ENABLE,
                    .HSICalibrationValue = self.HSICalibrationValue,
                    .HSE_Timout = self.HSE_Timout,
                    .LSE_Timout = self.LSE_Timout,
                    .LSE_Drive_Capability = if (self.LSE_Drive_Capability) |val| try LSE_Drive_CapabilityList.from_enum(val) else null,
                    .EnbaleCSS = self.EnbaleCSS,
                };
            }
        };

        pub const Config = struct {
            LSE_VALUE: ?f32 = null,
            CECClockSelection: ?RCC_CECSW = null,
            HSE_VALUE: ?f32 = null,
            RCC_PLLsource_Clock_Source_FROM_HSE: ?RCC_PLLsource_Clock_Source_FROM_HSEList = null,
            PRESCALERUSB: ?RCC_USBPRE = null,
            SYSCLKSource: ?RCC_SW = null,
            SDADCPresc: ?RCC_SDPRE = null,
            RTCClockSelection: ?RCC_RTCSEL = null,
            RCC_MCOSource: ?RCC_MCOSEL = null,
            AHBCLKDivider: ?RCC_HPRE = null,
            Cortex_Div: ?Cortex_DivList = null,
            APB1CLKDivider: ?RCC_PPRE = null,
            APB2CLKDivider: ?RCC_PPRE = null,
            ADCPresc: ?RCC_ADCPRES = null,
            I2c1ClockSelection: ?RCC_ICSW = null,
            I2c2ClockSelection: ?RCC_ICSW = null,
            Usart1ClockSelection: ?RCC_USART1SW = null,
            Usart2ClockSelection: ?RCC_USARTSW = null,
            Usart3ClockSelection: ?RCC_USARTSW = null,
            PLLSourceVirtual: ?RCC_PLLSRC = null,
            PLLMUL: ?RCC_PLLMUL = null,
            extra_config: ExtraConfig = .{},
            flags: Flags = .{},

            pub fn to_cubemx_config(self: Config) !CubeMXConfig {
                return CubeMXConfig{
                    .LSE_VALUE = self.LSE_VALUE,
                    .CECClockSelection = if (self.CECClockSelection) |val| try CECClockSelectionList.from_enum(val) else null,
                    .HSE_VALUE = self.HSE_VALUE,
                    .RCC_PLLsource_Clock_Source_FROM_HSE = self.RCC_PLLsource_Clock_Source_FROM_HSE,
                    .PRESCALERUSB = if (self.PRESCALERUSB) |val| try PRESCALERUSBList.from_enum(val) else null,
                    .SYSCLKSource = if (self.SYSCLKSource) |val| try SYSCLKSourceList.from_enum(val) else null,
                    .SDADCPresc = if (self.SDADCPresc) |val| try SDADCPrescList.from_enum(val) else null,
                    .RTCClockSelection = if (self.RTCClockSelection) |val| try RTCClockSelectionList.from_enum(val) else null,
                    .RCC_MCOSource = if (self.RCC_MCOSource) |val| try RCC_MCOSourceList.from_enum(val) else null,
                    .AHBCLKDivider = if (self.AHBCLKDivider) |val| try AHBCLKDividerList.from_enum(val) else null,
                    .Cortex_Div = self.Cortex_Div,
                    .APB1CLKDivider = if (self.APB1CLKDivider) |val| try APB1CLKDividerList.from_enum(val) else null,
                    .APB2CLKDivider = if (self.APB2CLKDivider) |val| try APB2CLKDividerList.from_enum(val) else null,
                    .ADCPresc = if (self.ADCPresc) |val| try ADCPrescList.from_enum(val) else null,
                    .I2c1ClockSelection = if (self.I2c1ClockSelection) |val| try I2c1ClockSelectionList.from_enum(val) else null,
                    .I2c2ClockSelection = if (self.I2c2ClockSelection) |val| try I2c2ClockSelectionList.from_enum(val) else null,
                    .Usart1ClockSelection = if (self.Usart1ClockSelection) |val| try Usart1ClockSelectionList.from_enum(val) else null,
                    .Usart2ClockSelection = if (self.Usart2ClockSelection) |val| try Usart2ClockSelectionList.from_enum(val) else null,
                    .Usart3ClockSelection = if (self.Usart3ClockSelection) |val| try Usart3ClockSelectionList.from_enum(val) else null,
                    .PLLSourceVirtual = if (self.PLLSourceVirtual) |val| try PLLSourceVirtualList.from_enum(val) else null,
                    .PLLMUL = if (self.PLLMUL) |val| try PLLMULList.from_enum(val) else null,
                    .flags = self.flags,
                    .extra_config = try self.extra_config.to_cubemx_config(),
                };
            }
        };

        pub const OutputConfig = struct {
            flags: OutputFlags = .{},

            HSIRCDiv: u32,
            HSICECDiv: u32,
            CECClockSelection: RCC_CECSW,
            RCC_PLLsource_Clock_Source_FROM_HSE: RCC_PLLsource_Clock_Source_FROM_HSEList,
            PRESCALERUSB: RCC_USBPRE,
            SYSCLKSource: RCC_SW,
            SDADCPresc: RCC_SDPRE,
            RCC_RTC_Clock_Source_FROM_HSE: u32,
            RTCClockSelection: RCC_RTCSEL,
            RCC_MCOMult_Clock_Source_FROM_PLLMUL: u32,
            RCC_MCOSource: RCC_MCOSEL,
            AHBCLKDivider: RCC_HPRE,
            Cortex_Div: Cortex_DivList,
            APB1CLKDivider: RCC_PPRE,
            APB1TimCLKDivider: u32,
            APB2CLKDivider: RCC_PPRE,
            ADCPresc: RCC_ADCPRES,
            APB2TimCLKDivider: u32,
            I2c1ClockSelection: RCC_ICSW,
            I2c2ClockSelection: RCC_ICSW,
            Usart1ClockSelection: RCC_USART1SW,
            Usart2ClockSelection: RCC_USARTSW,
            Usart3ClockSelection: RCC_USARTSW,
            PLLSourceVirtual: RCC_PLLSRC,
            PLLMUL: RCC_PLLMUL,
            VDD_VALUE: f32,
            FLatency: FLASH_LATENCY,
            HSICalibrationValue: u32,
            HSE_Timout: u32,
            LSE_Timout: u32,
            LSE_Drive_Capability: ?RCC_LSEDRV,

            pub fn from_cubemx_output_config(cubemx_config: CubeMXOutputConfig) !OutputConfig {
                return OutputConfig{
                    .flags = cubemx_config.flags,
                    .HSIRCDiv = cubemx_config.HSIRCDiv,
                    .HSICECDiv = cubemx_config.HSICECDiv,
                    .CECClockSelection = try cubemx_config.CECClockSelection.to_enum(),
                    .RCC_PLLsource_Clock_Source_FROM_HSE = cubemx_config.RCC_PLLsource_Clock_Source_FROM_HSE,
                    .PRESCALERUSB = try cubemx_config.PRESCALERUSB.to_enum(),
                    .SYSCLKSource = try cubemx_config.SYSCLKSource.to_enum(),
                    .SDADCPresc = try cubemx_config.SDADCPresc.to_enum(),
                    .RCC_RTC_Clock_Source_FROM_HSE = cubemx_config.RCC_RTC_Clock_Source_FROM_HSE,
                    .RTCClockSelection = try cubemx_config.RTCClockSelection.to_enum(),
                    .RCC_MCOMult_Clock_Source_FROM_PLLMUL = cubemx_config.RCC_MCOMult_Clock_Source_FROM_PLLMUL,
                    .RCC_MCOSource = try cubemx_config.RCC_MCOSource.to_enum(),
                    .AHBCLKDivider = try cubemx_config.AHBCLKDivider.to_enum(),
                    .Cortex_Div = cubemx_config.Cortex_Div,
                    .APB1CLKDivider = try cubemx_config.APB1CLKDivider.to_enum(),
                    .APB1TimCLKDivider = cubemx_config.APB1TimCLKDivider,
                    .APB2CLKDivider = try cubemx_config.APB2CLKDivider.to_enum(),
                    .ADCPresc = try cubemx_config.ADCPresc.to_enum(),
                    .APB2TimCLKDivider = cubemx_config.APB2TimCLKDivider,
                    .I2c1ClockSelection = try cubemx_config.I2c1ClockSelection.to_enum(),
                    .I2c2ClockSelection = try cubemx_config.I2c2ClockSelection.to_enum(),
                    .Usart1ClockSelection = try cubemx_config.Usart1ClockSelection.to_enum(),
                    .Usart2ClockSelection = try cubemx_config.Usart2ClockSelection.to_enum(),
                    .Usart3ClockSelection = try cubemx_config.Usart3ClockSelection.to_enum(),
                    .PLLSourceVirtual = try cubemx_config.PLLSourceVirtual.to_enum(),
                    .PLLMUL = try cubemx_config.PLLMUL.to_enum(),
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
            FLITFCLKoutput: u32 = 0,
            HSIRCDiv: u32 = 0,
            HSICECDiv: u32 = 0,
            LSIRC: u32 = 0,
            LSEOSC: u32 = 0,
            CECMult: u32 = 0,
            CECOutput: u32 = 0,
            HSEOSC: u32 = 0,
            HSEPLLsourceDevisor: u32 = 0,
            PRESCALERUSB: u32 = 0,
            USBoutput: u32 = 0,
            SysClkSource: u32 = 0,
            SysCLKOutput: u32 = 0,
            SDADCPresc: u32 = 0,
            SDADCoutput: u32 = 0,
            PWROutput: u32 = 0,
            HSERTCDevisor: u32 = 0,
            RTCClkSource: u32 = 0,
            RTCOutput: u32 = 0,
            IWDGOutput: u32 = 0,
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
            ADCPresc: u32 = 0,
            ADCoutput: u32 = 0,
            APB2Output: u32 = 0,
            TimPrescalerAPB2: u32 = 0,
            TimPrescOut2: u32 = 0,
            I2C1Mult: u32 = 0,
            I2C1Output: u32 = 0,
            I2C2Mult: u32 = 0,
            I2C2Output: u32 = 0,
            USART1Mult: u32 = 0,
            USART1Output: u32 = 0,
            USART2Mult: u32 = 0,
            USART2Output: u32 = 0,
            USART3Mult: u32 = 0,
            USART3Output: u32 = 0,
            PLLSource: u32 = 0,
            VCO2output: u32 = 0,
            PLLMUL: u32 = 0,
            HSI_CEC: u32 = 0,
            HSI_PLL: u32 = 0,
            HSE_PLL: u32 = 0,
            HSE_RTC: u32 = 0,
            PLLCLK_MCO: u32 = 0,
            PLLCLK: u32 = 0,
            Tim2CLK: u32 = 0,
            I2C2CLK: u32 = 0,
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

            var HSEDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv2: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv3: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv4: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv5: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv6: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv7: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv8: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv9: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv10: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv11: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv12: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv13: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv14: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv15: bool = false; //semaphore for processing, not an actual flag in the output;
            var HSEDiv16: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var SysSourcePLL: bool = false; //semaphore for processing, not an actual flag in the output;
            var HCLKDiv1: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C1SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var I2C2SourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSE: bool = false; //semaphore for processing, not an actual flag in the output;
            var PLLSourceHSI: bool = false; //semaphore for processing, not an actual flag in the output;
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

            var HSIRCDiv = ClockNode{
                .name = "HSIRCDiv",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSICECDiv = ClockNode{
                .name = "HSICECDiv",
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

            var HSEOSC = ClockNode{
                .name = "HSEOSC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSEPLLsourceDevisor = ClockNode{
                .name = "HSEPLLsourceDevisor",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PRESCALERUSB = ClockNode{
                .name = "PRESCALERUSB",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USBoutput = ClockNode{
                .name = "USBoutput",
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

            var SDADCPresc = ClockNode{
                .name = "SDADCPresc",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var SDADCoutput = ClockNode{
                .name = "SDADCoutput",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PWROutput = ClockNode{
                .name = "PWROutput",
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

            var ADCPresc = ClockNode{
                .name = "ADCPresc",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var ADCoutput = ClockNode{
                .name = "ADCoutput",
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

            var I2C1Mult = ClockNode{
                .name = "I2C1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C1Output = ClockNode{
                .name = "I2C1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C2Mult = ClockNode{
                .name = "I2C2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var I2C2Output = ClockNode{
                .name = "I2C2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART1Mult = ClockNode{
                .name = "USART1Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART1Output = ClockNode{
                .name = "USART1Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART2Mult = ClockNode{
                .name = "USART2Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART2Output = ClockNode{
                .name = "USART2Output",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART3Mult = ClockNode{
                .name = "USART3Mult",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var USART3Output = ClockNode{
                .name = "USART3Output",
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

            var HSI_CEC = ClockNode{
                .name = "HSI_CEC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSI_PLL = ClockNode{
                .name = "HSI_PLL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSE_PLL = ClockNode{
                .name = "HSE_PLL",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var HSE_RTC = ClockNode{
                .name = "HSE_RTC",
                .nodetype = .off, //to be filled later with actual node types after processing
                .parents = &.{}, //to be filled later with actual parent references
            };

            var PLLCLK_MCO = ClockNode{
                .name = "PLLCLK_MCO",
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

            const HSIRCDivValue: u32 = blk: {
                break :blk 2;
            };

            const HSICECDivValue: u32 = blk: {
                break :blk 244;
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

            const SYSCLKSourceValue: SYSCLKSourceList = blk: {
                const user_val = config.SYSCLKSource;

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

            const RCC_MCOSourceValue: RCC_MCOSourceList = blk: {
                const user_val = config.RCC_MCOSource;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_MCO1SOURCE_SYSCLK => {},
                        .RCC_MCO1SOURCE_HSI => {},
                        .RCC_MCO1SOURCE_HSE => {},
                        .RCC_MCO1SOURCE_LSI => {},
                        .RCC_MCO1SOURCE_LSE => {},
                        .RCC_MCO1SOURCE_PLLCLK_DIV2 => {},
                    }
                }
                break :blk user_val orelse .RCC_MCO1SOURCE_SYSCLK;
            };

            const PLLUsedValue: u1 = blk: {
                if (((check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_PLLCLK, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_PLLCLK_DIV2, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM14") and check_MCU("TIM14") and check_MCU("Semaphore_input_Channel1TIM14")) or config.flags.MCOConfig)) or config.flags.USBUsed_ForRCC)) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const PLLSourceVirtualValue: PLLSourceVirtualList = blk: {
                if ((config.flags.USBUsed_ForRCC)) {
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
                                "(USBUsed_ForRCC) ",
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

            const HSE_VALUEValue: f32 = blk: {
                if ((((check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) or (CSSEnabled))) and config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 1e6,
                        .max = 3.2e7,
                    };

                    break :blk user_val orelse 8e6;
                } else if (config.flags.HSEByPass) {
                    const user_val = config.HSE_VALUE;
                    HSEOSC.limit = .{
                        .min = 0e0,
                        .max = 3.2e7,
                    };

                    break :blk user_val orelse 8e6;
                }
                const user_val = config.HSE_VALUE;
                HSEOSC.limit = .{
                    .min = 4e6,
                    .max = 3.2e7,
                };

                break :blk user_val orelse 8e6;
            };

            const RCC_PLLsource_Clock_Source_FROM_HSEValue: RCC_PLLsource_Clock_Source_FROM_HSEList = blk: {
                const user_val = config.RCC_PLLsource_Clock_Source_FROM_HSE;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_HSE_PREDIV_DIV1 => HSEDiv1 = true,
                        .RCC_HSE_PREDIV_DIV2 => HSEDiv2 = true,
                        .RCC_HSE_PREDIV_DIV3 => HSEDiv3 = true,
                        .RCC_HSE_PREDIV_DIV4 => HSEDiv4 = true,
                        .RCC_HSE_PREDIV_DIV5 => HSEDiv5 = true,
                        .RCC_HSE_PREDIV_DIV6 => HSEDiv6 = true,
                        .RCC_HSE_PREDIV_DIV7 => HSEDiv7 = true,
                        .RCC_HSE_PREDIV_DIV8 => HSEDiv8 = true,
                        .RCC_HSE_PREDIV_DIV9 => HSEDiv9 = true,
                        .RCC_HSE_PREDIV_DIV10 => HSEDiv10 = true,
                        .RCC_HSE_PREDIV_DIV11 => HSEDiv11 = true,
                        .RCC_HSE_PREDIV_DIV12 => HSEDiv12 = true,
                        .RCC_HSE_PREDIV_DIV13 => HSEDiv13 = true,
                        .RCC_HSE_PREDIV_DIV14 => HSEDiv14 = true,
                        .RCC_HSE_PREDIV_DIV15 => HSEDiv15 = true,
                        .RCC_HSE_PREDIV_DIV16 => HSEDiv16 = true,
                    }
                }
                break :blk user_val orelse {
                    HSEDiv1 = true;
                    break :blk .RCC_HSE_PREDIV_DIV1;
                };
            };

            const PRESCALERUSBValue: PRESCALERUSBList = blk: {
                const user_val = config.PRESCALERUSB;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USBCLKSOURCE_PLL => {},
                        .RCC_USBCLKSOURCE_PLL_DIV1_5 => {},
                    }
                }
                break :blk user_val orelse .RCC_USBCLKSOURCE_PLL;
            };

            const SDADCPrescValue: SDADCPrescList = blk: {
                const user_val = config.SDADCPresc;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_SDADCSYSCLK_DIV2 => {},
                        .RCC_SDADCSYSCLK_DIV4 => {},
                        .RCC_SDADCSYSCLK_DIV6 => {},
                        .RCC_SDADCSYSCLK_DIV8 => {},
                        .RCC_SDADCSYSCLK_DIV10 => {},
                        .RCC_SDADCSYSCLK_DIV12 => {},
                        .RCC_SDADCSYSCLK_DIV14 => {},
                        .RCC_SDADCSYSCLK_DIV16 => {},
                        .RCC_SDADCSYSCLK_DIV20 => {},
                        .RCC_SDADCSYSCLK_DIV24 => {},
                        .RCC_SDADCSYSCLK_DIV28 => {},
                        .RCC_SDADCSYSCLK_DIV32 => {},
                        .RCC_SDADCSYSCLK_DIV36 => {},
                        .RCC_SDADCSYSCLK_DIV40 => {},
                        .RCC_SDADCSYSCLK_DIV44 => {},
                        .RCC_SDADCSYSCLK_DIV48 => {},
                    }
                }
                break :blk user_val orelse .RCC_SDADCSYSCLK_DIV2;
            };

            const RCC_RTC_Clock_Source_FROM_HSEValue: u32 = blk: {
                break :blk 32;
            };

            const RTCClockSelectionValue: RTCClockSelectionList = blk: {
                const user_val = config.RTCClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_LSE => {},
                        .RCC_RTCCLKSOURCE_LSI => {},
                        .RCC_RTCCLKSOURCE_HSE_DIV32 => {},
                    }
                }
                break :blk user_val orelse .RCC_RTCCLKSOURCE_LSI;
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

            const ADCPrescValue: ADCPrescList = blk: {
                const user_val = config.ADCPresc;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_ADC1PCLK2_DIV2 => {},
                        .RCC_ADC1PCLK2_DIV4 => {},
                        .RCC_ADC1PCLK2_DIV6 => {},
                        .RCC_ADC1PCLK2_DIV8 => {},
                    }
                }
                break :blk user_val orelse .RCC_ADC1PCLK2_DIV2;
            };

            const APB2TimCLKDividerValue: u32 = blk: {
                if (check_ref(@TypeOf(APB2CLKDividerValue), APB2CLKDividerValue, .RCC_HCLK_DIV1, .@"=")) {
                    break :blk 1;
                }
                break :blk 2;
            };

            const I2c1ClockSelectionValue: I2c1ClockSelectionList = blk: {
                const user_val = config.I2c1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C1CLKSOURCE_SYSCLK => {},
                        .RCC_I2C1CLKSOURCE_HSI => I2C1SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C1SourceHSI = true;
                    break :blk .RCC_I2C1CLKSOURCE_HSI;
                };
            };

            const I2c2ClockSelectionValue: I2c2ClockSelectionList = blk: {
                const user_val = config.I2c2ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_I2C2CLKSOURCE_SYSCLK => {},
                        .RCC_I2C2CLKSOURCE_HSI => I2C2SourceHSI = true,
                    }
                }
                break :blk user_val orelse {
                    I2C2SourceHSI = true;
                    break :blk .RCC_I2C2CLKSOURCE_HSI;
                };
            };

            const Usart1ClockSelectionValue: Usart1ClockSelectionList = blk: {
                const user_val = config.Usart1ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART1CLKSOURCE_PCLK2 => {},
                        .RCC_USART1CLKSOURCE_SYSCLK => {},
                        .RCC_USART1CLKSOURCE_HSI => {},
                        .RCC_USART1CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_USART1CLKSOURCE_PCLK2;
            };

            const Usart2ClockSelectionValue: Usart2ClockSelectionList = blk: {
                const user_val = config.Usart2ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART2CLKSOURCE_PCLK1 => {},
                        .RCC_USART2CLKSOURCE_SYSCLK => {},
                        .RCC_USART2CLKSOURCE_HSI => {},
                        .RCC_USART2CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_USART2CLKSOURCE_PCLK1;
            };

            const Usart3ClockSelectionValue: Usart3ClockSelectionList = blk: {
                const user_val = config.Usart3ClockSelection;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_USART3CLKSOURCE_PCLK1 => {},
                        .RCC_USART3CLKSOURCE_SYSCLK => {},
                        .RCC_USART3CLKSOURCE_HSI => {},
                        .RCC_USART3CLKSOURCE_LSE => {},
                    }
                }
                break :blk user_val orelse .RCC_USART3CLKSOURCE_PCLK1;
            };

            const PLLMULValue: PLLMULList = blk: {
                const user_val = config.PLLMUL;

                if (user_val) |val| {
                    switch (val) {
                        .RCC_PLL_MUL2 => {},
                        .RCC_PLL_MUL3 => {},
                        .RCC_PLL_MUL4 => {},
                        .RCC_PLL_MUL5 => {},
                        .RCC_PLL_MUL6 => {},
                        .RCC_PLL_MUL7 => {},
                        .RCC_PLL_MUL8 => {},
                        .RCC_PLL_MUL9 => {},
                        .RCC_PLL_MUL10 => {},
                        .RCC_PLL_MUL11 => {},
                        .RCC_PLL_MUL12 => {},
                        .RCC_PLL_MUL13 => {},
                        .RCC_PLL_MUL14 => {},
                        .RCC_PLL_MUL15 => {},
                        .RCC_PLL_MUL16 => {},
                    }
                }
                break :blk user_val orelse .RCC_PLL_MUL2;
            };

            const VDD_VALUEValue: f32 = blk: {
                if (!check_MCU("STM32F3x8")) {
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
                                "!STM32F3x8",
                                "HCLK2 not changed",
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
                                "!STM32F3x8",
                                "HCLK2 not changed",
                                3.6e0,
                                val,
                            });
                        }
                    }
                    break :blk user_val orelse 3.3e0;
                }
                const user_val = config.extra_config.VDD_VALUE;
                if (user_val) |val| {
                    if (val < 1.65e0) {
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
                            1.65e0,
                            val,
                        });
                    }
                    if (val > 1.95e0) {
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
                            1.95e0,
                            val,
                        });
                    }
                }
                break :blk user_val orelse 1.8e0;
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
                if (((config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_LSE, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_LSE, .@"="))) or (config.flags.USART3Used_ForRCC and (check_ref(@TypeOf(Usart3ClockSelectionValue), Usart3ClockSelectionValue, .RCC_USART3CLKSOURCE_LSE, .@"="))) or (config.flags.CECUsed_ForRCC and (check_ref(@TypeOf(CECClockSelectionValue), CECClockSelectionValue, .RCC_CECCLKSOURCE_LSE, .@"="))) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSE, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM14") and check_MCU("TIM14") and check_MCU("Semaphore_input_Channel1TIM14")) or config.flags.MCOConfig)) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=") and config.flags.RTCUsed_ForRCC))) {
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

            const EnableLSEValue: EnableLSEList = blk: {
                if ((config.flags.LSEOscillator or config.flags.LSEByPass)) {
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
                if ((config.flags.HSEOscillator or config.flags.HSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const USBEnableValue: USBEnableList = blk: {
                if (config.flags.USBUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const SDADCEnableValue: SDADCEnableList = blk: {
                if (config.flags.USE_SDADC1 or config.flags.USE_SDADC2 or config.flags.USE_SDADC3) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableHSERTCDevisorValue: EnableHSERTCDevisorList = blk: {
                if ((config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass))) {
                    break :blk .true;
                } else if (config.flags.RTCUsed_ForRCC and (config.flags.HSEOscillator or config.flags.HSEByPass)) {
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

            const MCOEnableValue: MCOEnableList = blk: {
                if ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM14") and check_MCU("TIM14") and check_MCU("Semaphore_input_Channel1TIM14")) or config.flags.MCOConfig) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const ADC1EnableValue: ADC1EnableList = blk: {
                if (config.flags.USE_ADC1) {
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

            const EnableMCOMultDivisorValue: EnableMCOMultDivisorList = blk: {
                if (config.flags.MCOUsed_ForRCC) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const EnableLSERTCValue: EnableLSERTCList = blk: {
                if (config.flags.RTCUsed_ForRCC and (config.flags.LSEOscillator or config.flags.LSEByPass)) {
                    break :blk .true;
                }
                break :blk .false;
            };

            const HSEUsedValue: u1 = blk: {
                if ((check_MCU("SEM2RCC_HSE_REQUIRED_TIM14") and check_MCU("TIM14") and check_MCU("Semaphore_input_Channel1TIM14")) or ((config.flags.RTCUsed_ForRCC) and !((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSE, .@"=")) or (check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")))) or ((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSE, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSE, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSE, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM14") and check_MCU("TIM14") and check_MCU("Semaphore_input_Channel1TIM14")) or config.flags.MCOConfig))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const LSIUsedValue: u1 = blk: {
                if ((config.flags.IWDGUsed_ForRCC or ((check_ref(@TypeOf(RTCClockSelectionValue), RTCClockSelectionValue, .RCC_RTCCLKSOURCE_LSI, .@"=")) and (config.flags.RTCUsed_ForRCC)) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_LSI, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM14") and check_MCU("TIM14") and check_MCU("Semaphore_input_Channel1TIM14")) or config.flags.MCOConfig)))) {
                    break :blk 1;
                }
                break :blk 0;
            };

            const HSIUsedValue: u1 = blk: {
                if ((((check_ref(@TypeOf(PLLSourceVirtualValue), PLLSourceVirtualValue, .RCC_PLLSOURCE_HSI, .@"=")) and (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"="))) or (config.flags.CECUsed_ForRCC and (check_ref(@TypeOf(CECClockSelectionValue), CECClockSelectionValue, .RCC_CECCLKSOURCE_HSI, .@"="))) or (check_ref(@TypeOf(SYSCLKSourceValue), SYSCLKSourceValue, .RCC_SYSCLKSOURCE_HSI, .@"=")) or ((check_ref(@TypeOf(RCC_MCOSourceValue), RCC_MCOSourceValue, .RCC_MCO1SOURCE_HSI, .@"=")) and ((check_MCU("SEM2RCC_MCO_REQUIRED_TIM14") and check_MCU("TIM14") and check_MCU("Semaphore_input_Channel1TIM14")) or config.flags.MCOConfig)) or (config.flags.USART1Used_ForRCC and (check_ref(@TypeOf(Usart1ClockSelectionValue), Usart1ClockSelectionValue, .RCC_USART1CLKSOURCE_HSI, .@"="))) or (config.flags.USART2Used_ForRCC and (check_ref(@TypeOf(Usart2ClockSelectionValue), Usart2ClockSelectionValue, .RCC_USART2CLKSOURCE_HSI, .@"="))) or (config.flags.USART3Used_ForRCC and (check_ref(@TypeOf(Usart3ClockSelectionValue), Usart3ClockSelectionValue, .RCC_USART3CLKSOURCE_HSI, .@"="))) or (config.flags.I2C1Used_ForRCC and (I2C1SourceHSI)) or (config.flags.I2C2Used_ForRCC and (I2C2SourceHSI)))) {
                    break :blk 1;
                }
                break :blk 0;
            };
            // ========CLOCK NODES=========

            // ======= NODE HSIRC ======
            HSIRC.nodetype = .source;
            HSIRC.value = HSI_VALUEValue;

            // ======= NODE FLITFCLKoutput ======
            FLITFCLKoutput.nodetype = .output;
            FLITFCLKoutput.parents = &.{&HSIRC};

            // ======= NODE HSIRCDiv ======
            HSIRCDiv.nodetype = .div;
            HSIRCDiv.value = @floatFromInt(HSIRCDivValue);
            HSIRCDiv.parents = &.{&HSIRC};

            // ======= NODE HSICECDiv ======
            HSICECDiv.nodetype = .div;
            HSICECDiv.value = @floatFromInt(HSICECDivValue);
            HSICECDiv.parents = &.{&HSIRC};

            // ======= NODE LSIRC ======
            LSIRC.nodetype = .source;
            LSIRC.value = LSI_VALUEValue;

            // ======= NODE LSEOSC ======
            if (check_ref(@TypeOf(EnableLSEValue), EnableLSEValue, .true, .@"=")) {
                LSEOSC.nodetype = .source;
                LSEOSC.value = LSE_VALUEValue;
            }
            // ======= NODE CECMult ======
            if (check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"=")) {
                CECMult.nodetype = .multi;
                CECMult.parents = switch (CECClockSelectionValue) {
                    .RCC_CECCLKSOURCE_HSI => &.{&HSICECDiv},
                    .RCC_CECCLKSOURCE_LSE => &.{&LSEOSC},
                };
            }
            // ======= NODE CECOutput ======
            if (check_ref(@TypeOf(CECEnableValue), CECEnableValue, .true, .@"=")) {
                CECOutput.nodetype = .output;
                CECOutput.parents = &.{&CECMult};
            }
            // ======= NODE HSEOSC ======
            if (check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"=")) {
                HSEOSC.nodetype = .source;
                HSEOSC.value = HSE_VALUEValue;
            }
            // ======= NODE HSEPLLsourceDevisor ======
            if (check_ref(@TypeOf(EnableHSEValue), EnableHSEValue, .true, .@"=")) {
                HSEPLLsourceDevisor.nodetype = .div;
                HSEPLLsourceDevisor.value = try RCC_PLLsource_Clock_Source_FROM_HSEValue.get();
                HSEPLLsourceDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE PRESCALERUSB ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                PRESCALERUSB.nodetype = .div;
                PRESCALERUSB.value = try PRESCALERUSBValue.get();
                PRESCALERUSB.parents = &.{&PLLMUL};
            }
            // ======= NODE USBoutput ======
            if (check_ref(@TypeOf(USBEnableValue), USBEnableValue, .true, .@"=")) {
                USBoutput.nodetype = .output;
                USBoutput.parents = &.{&PRESCALERUSB};
            }
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

            // ======= NODE SDADCPresc ======
            if (check_ref(@TypeOf(SDADCEnableValue), SDADCEnableValue, .true, .@"=")) {
                SDADCPresc.nodetype = .div;
                SDADCPresc.value = try SDADCPrescValue.get();
                SDADCPresc.parents = &.{&SysCLKOutput};
            }
            // ======= NODE SDADCoutput ======
            if (check_ref(@TypeOf(SDADCEnableValue), SDADCEnableValue, .true, .@"=")) {
                SDADCoutput.nodetype = .output;
                SDADCoutput.parents = &.{&SDADCPresc};
            }
            // ======= NODE PWROutput ======
            PWROutput.nodetype = .output;
            PWROutput.parents = &.{&SysCLKOutput};

            // ======= NODE HSERTCDevisor ======
            if (check_ref(@TypeOf(EnableHSERTCDevisorValue), EnableHSERTCDevisorValue, .true, .@"=")) {
                HSERTCDevisor.nodetype = .div;
                HSERTCDevisor.value = @floatFromInt(RCC_RTC_Clock_Source_FROM_HSEValue);
                HSERTCDevisor.parents = &.{&HSEOSC};
            }
            // ======= NODE RTCClkSource ======
            if (check_ref(@TypeOf(RTCEnableValue), RTCEnableValue, .true, .@"=")) {
                RTCClkSource.nodetype = .multi;
                RTCClkSource.parents = switch (RTCClockSelectionValue) {
                    .RCC_RTCCLKSOURCE_HSE_DIV32 => &.{&HSERTCDevisor},
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
            // ======= NODE MCOMultDivisor ======
            MCOMultDivisor.nodetype = .div;
            MCOMultDivisor.value = @floatFromInt(RCC_MCOMult_Clock_Source_FROM_PLLMULValue);
            MCOMultDivisor.parents = &.{&PLLMUL};

            // ======= NODE MCOMult ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCOMult.nodetype = .multi;
                MCOMult.parents = switch (RCC_MCOSourceValue) {
                    .RCC_MCO1SOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_MCO1SOURCE_HSI => &.{&HSIRC},
                    .RCC_MCO1SOURCE_HSE => &.{&HSEOSC},
                    .RCC_MCO1SOURCE_LSI => &.{&LSIRC},
                    .RCC_MCO1SOURCE_LSE => &.{&LSEOSC},
                    .RCC_MCO1SOURCE_PLLCLK_DIV2 => &.{&MCOMultDivisor},
                };
            }
            // ======= NODE MCOoutput ======
            if (check_ref(@TypeOf(MCOEnableValue), MCOEnableValue, .true, .@"=")) {
                MCOoutput.nodetype = .output;
                MCOoutput.parents = &.{&MCOMult};
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

            // ======= NODE FCLKCortexOutput ======
            FCLKCortexOutput.nodetype = .output;
            FCLKCortexOutput.parents = &.{&AHBOutput};

            // ======= NODE TimSysPresc ======
            TimSysPresc.nodetype = .div;
            TimSysPresc.value = try Cortex_DivValue.get();
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

            // ======= NODE ADCPresc ======
            if (check_ref(@TypeOf(ADC1EnableValue), ADC1EnableValue, .true, .@"=")) {
                ADCPresc.nodetype = .div;
                ADCPresc.value = try ADCPrescValue.get();
                ADCPresc.parents = &.{&APB2Prescaler};
            }
            // ======= NODE ADCoutput ======
            if (check_ref(@TypeOf(ADC1EnableValue), ADC1EnableValue, .true, .@"=")) {
                ADCoutput.nodetype = .output;
                ADCoutput.parents = &.{&ADCPresc};
            }
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

            // ======= NODE I2C1Mult ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                I2C1Mult.nodetype = .multi;
                I2C1Mult.parents = switch (I2c1ClockSelectionValue) {
                    .RCC_I2C1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE I2C1Output ======
            if (check_ref(@TypeOf(I2C1EnableValue), I2C1EnableValue, .true, .@"=")) {
                I2C1Output.nodetype = .output;
                I2C1Output.parents = &.{&I2C1Mult};
            }
            // ======= NODE I2C2Mult ======
            if (check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=")) {
                I2C2Mult.nodetype = .multi;
                I2C2Mult.parents = switch (I2c2ClockSelectionValue) {
                    .RCC_I2C2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_I2C2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                };
            }
            // ======= NODE I2C2Output ======
            if (check_ref(@TypeOf(I2C2EnableValue), I2C2EnableValue, .true, .@"=")) {
                I2C2Output.nodetype = .output;
                I2C2Output.parents = &.{&I2C2Mult};
            }
            // ======= NODE USART1Mult ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1Mult.nodetype = .multi;
                USART1Mult.parents = switch (Usart1ClockSelectionValue) {
                    .RCC_USART1CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART1CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART1CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_USART1CLKSOURCE_PCLK2 => &.{&APB2Prescaler},
                };
            }
            // ======= NODE USART1Output ======
            if (check_ref(@TypeOf(USART1EnableValue), USART1EnableValue, .true, .@"=")) {
                USART1Output.nodetype = .output;
                USART1Output.parents = &.{&USART1Mult};
            }
            // ======= NODE USART2Mult ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                USART2Mult.nodetype = .multi;
                USART2Mult.parents = switch (Usart2ClockSelectionValue) {
                    .RCC_USART2CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART2CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART2CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_USART2CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                };
            }
            // ======= NODE USART2Output ======
            if (check_ref(@TypeOf(USART2EnableValue), USART2EnableValue, .true, .@"=")) {
                USART2Output.nodetype = .output;
                USART2Output.parents = &.{&USART2Mult};
            }
            // ======= NODE USART3Mult ======
            if (check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=")) {
                USART3Mult.nodetype = .multi;
                USART3Mult.parents = switch (Usart3ClockSelectionValue) {
                    .RCC_USART3CLKSOURCE_SYSCLK => &.{&SysCLKOutput},
                    .RCC_USART3CLKSOURCE_HSI => &.{&HSIRC},
                    .RCC_USART3CLKSOURCE_LSE => &.{&LSEOSC},
                    .RCC_USART3CLKSOURCE_PCLK1 => &.{&APB1Prescaler},
                };
            }
            // ======= NODE USART3Output ======
            if (check_ref(@TypeOf(USART3EnableValue), USART3EnableValue, .true, .@"=")) {
                USART3Output.nodetype = .output;
                USART3Output.parents = &.{&USART3Mult};
            }
            // ======= NODE PLLSource ======
            PLLSource.nodetype = .multi;
            PLLSource.parents = switch (PLLSourceVirtualValue) {
                .RCC_PLLSOURCE_HSI => &.{&HSIRCDiv},
                .RCC_PLLSOURCE_HSE => &.{&HSEPLLsourceDevisor},
            };

            // ======= NODE VCO2output ======
            VCO2output.nodetype = .output;
            VCO2output.parents = &.{&PLLSource};

            // ======= NODE PLLMUL ======
            PLLMUL.nodetype = .mul;
            PLLMUL.value = try PLLMULValue.get();
            PLLMUL.parents = &.{&VCO2output};

            // ======= NODE HSI_CEC ======
            HSI_CEC.nodetype = .output;
            HSI_CEC.parents = &.{&HSICECDiv};

            // ======= NODE HSI_PLL ======
            HSI_PLL.nodetype = .output;
            HSI_PLL.parents = &.{&HSIRCDiv};

            // ======= NODE HSE_PLL ======
            HSE_PLL.nodetype = .output;
            HSE_PLL.parents = &.{&HSEPLLsourceDevisor};

            // ======= NODE HSE_RTC ======
            HSE_RTC.nodetype = .output;
            HSE_RTC.parents = &.{&HSERTCDevisor};

            // ======= NODE PLLCLK_MCO ======
            PLLCLK_MCO.nodetype = .output;
            PLLCLK_MCO.parents = &.{&MCOMultDivisor};

            // ======= NODE PLLCLK ======
            PLLCLK.nodetype = .output;
            PLLCLK.parents = &.{&PLLMUL};

            //======== POST REFS ========

            //======= FLITFCLKFreq_Value ========
            const FLITFCLKFreq_ValueValue = FLITFCLKoutput.get_as_ref();
            ignore_value(FLITFCLKFreq_ValueValue);

            //======= CECFreq_Value ========
            const CECFreq_ValueValue = CECOutput.get_as_ref();
            ignore_value(CECFreq_ValueValue);

            //======= USBFreq_Value ========
            const USBFreq_ValueValue = USBoutput.get_as_ref();
            ignore_value(USBFreq_ValueValue);

            USBoutput.limit = .{
                .min = 4.788e7,
                .max = 4.812e7,
            };

            //======= SYSCLKFreq_VALUE ========
            const SYSCLKFreq_VALUEValue = SysCLKOutput.get_as_ref();
            ignore_value(SYSCLKFreq_VALUEValue);

            //======= SDADCoutputFreq_Value ========
            const SDADCoutputFreq_ValueValue = SDADCoutput.get_as_ref();
            ignore_value(SDADCoutputFreq_ValueValue);

            SDADCoutput.limit = .{
                .min = 5e5,
                .max = 6e6,
            };

            //======= PWRFreq_Value ========
            const PWRFreq_ValueValue = PWROutput.get_as_ref();
            ignore_value(PWRFreq_ValueValue);

            //======= RTCFreq_Value ========
            const RTCFreq_ValueValue = RTCOutput.get_as_ref();
            ignore_value(RTCFreq_ValueValue);
            if ((!(false) and !(false))) {
                RTCOutput.limit = .{
                    .min = null,
                    .max = 1e6,
                };
            }

            //======= WatchDogFreq_Value ========
            const WatchDogFreq_ValueValue = IWDGOutput.get_as_ref();
            ignore_value(WatchDogFreq_ValueValue);

            //======= MCOFreq_Value ========
            const MCOFreq_ValueValue = MCOoutput.get_as_ref();
            ignore_value(MCOFreq_ValueValue);

            //======= HCLKFreq_Value ========
            const HCLKFreq_ValueValue = AHBOutput.get_as_ref();
            ignore_value(HCLKFreq_ValueValue);

            AHBOutput.limit = .{
                .min = null,
                .max = 7.2e7,
            };

            //======= AHBFreq_Value ========
            const AHBFreq_ValueValue = HCLKOutput.get_as_ref();
            ignore_value(AHBFreq_ValueValue);

            //======= FCLKCortexFreq_Value ========
            const FCLKCortexFreq_ValueValue = FCLKCortexOutput.get_as_ref();
            ignore_value(FCLKCortexFreq_ValueValue);

            //======= CortexFreq_Value ========
            const CortexFreq_ValueValue = TimSysOutput.get_as_ref();
            ignore_value(CortexFreq_ValueValue);

            //======= APB1Freq_Value ========
            const APB1Freq_ValueValue = APB1Output.get_as_ref();
            ignore_value(APB1Freq_ValueValue);
            if (config.flags.USBUsed_ForRCC) {
                APB1Output.limit = .{
                    .min = 1e7,
                    .max = 3.6e7,
                };
            } else if (config.flags.RTCUsed_ForRCC and !config.flags.USBUsed_ForRCC) {
                const max_APB1Output = 36000000;
                const min_APB1Output = RTCFreq_ValueValue;

                APB1Output.limit = .{
                    .min = min_APB1Output,
                    .max = max_APB1Output,
                    .min_expr = "=RTCFreq_Value",
                    .max_expr = "36000000",
                };
            } else {
                APB1Output.limit = .{
                    .min = null,
                    .max = 3.6e7,
                };
            }

            //======= APB1TimFreq_Value ========
            const APB1TimFreq_ValueValue = TimPrescOut1.get_as_ref();
            ignore_value(APB1TimFreq_ValueValue);

            //======= ADCoutputFreq_Value ========
            const ADCoutputFreq_ValueValue = ADCoutput.get_as_ref();
            ignore_value(ADCoutputFreq_ValueValue);

            //======= APB2Freq_Value ========
            const APB2Freq_ValueValue = APB2Output.get_as_ref();
            ignore_value(APB2Freq_ValueValue);

            APB2Output.limit = .{
                .min = null,
                .max = 7.2e7,
            };

            //======= APB2TimFreq_Value ========
            const APB2TimFreq_ValueValue = TimPrescOut2.get_as_ref();
            ignore_value(APB2TimFreq_ValueValue);

            //======= I2C1Freq_Value ========
            const I2C1Freq_ValueValue = I2C1Output.get_as_ref();
            ignore_value(I2C1Freq_ValueValue);

            //======= I2C2Freq_Value ========
            const I2C2Freq_ValueValue = I2C2Output.get_as_ref();
            ignore_value(I2C2Freq_ValueValue);

            //======= USART1Freq_Value ========
            const USART1Freq_ValueValue = USART1Output.get_as_ref();
            ignore_value(USART1Freq_ValueValue);

            //======= USART2Freq_Value ========
            const USART2Freq_ValueValue = USART2Output.get_as_ref();
            ignore_value(USART2Freq_ValueValue);

            //======= USART3Freq_Value ========
            const USART3Freq_ValueValue = USART3Output.get_as_ref();
            ignore_value(USART3Freq_ValueValue);

            //======= VCOOutput2Freq_Value ========
            const VCOOutput2Freq_ValueValue = VCO2output.get_as_ref();
            ignore_value(VCOOutput2Freq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                VCO2output.limit = .{
                    .min = 1e6,
                    .max = 2.4e7,
                };
            }

            //======= HSICECFreq_Value ========
            const HSICECFreq_ValueValue = HSI_CEC.get_as_ref();
            ignore_value(HSICECFreq_ValueValue);

            //======= HSIPLLFreq_Value ========
            const HSIPLLFreq_ValueValue = HSI_PLL.get_as_ref();
            ignore_value(HSIPLLFreq_ValueValue);

            //======= HSEPLLFreq_Value ========
            const HSEPLLFreq_ValueValue = HSE_PLL.get_as_ref();
            ignore_value(HSEPLLFreq_ValueValue);

            //======= RTCHSEDivFreq_Value ========
            const RTCHSEDivFreq_ValueValue = HSE_RTC.get_as_ref();
            ignore_value(RTCHSEDivFreq_ValueValue);

            //======= PLLMCOFreq_Value ========
            const PLLMCOFreq_ValueValue = PLLCLK_MCO.get_as_ref();
            ignore_value(PLLMCOFreq_ValueValue);

            //======= PLLCLKFreq_Value ========
            const PLLCLKFreq_ValueValue = PLLCLK.get_as_ref();
            ignore_value(PLLCLKFreq_ValueValue);
            if (check_ref(@TypeOf(PLLUsedValue), PLLUsedValue, 1, .@"=")) {
                PLLCLK.limit = .{
                    .min = 1.6e7,
                    .max = 7.2e7,
                };
            }

            const FLatencyValue: FLatencyList = blk: {
                if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 0, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@"=")))))) {
                    FLASH_LATENCY0 = true;
                    break :blk .FLASH_LATENCY_0;
                } else if (((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 24000000, .@">")) and ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"<")) or ((check_ref(@TypeOf(HCLKFreq_ValueValue), HCLKFreq_ValueValue, 48000000, .@"=")))))) {
                    break :blk .FLASH_LATENCY_1;
                }
                break :blk .FLASH_LATENCY_2;
            };
            out.HSIRC = try HSIRC.get_output();
            out.FLITFCLKoutput = try FLITFCLKoutput.get_output();
            out.HSIRCDiv = try HSIRCDiv.get_output();
            out.HSICECDiv = try HSICECDiv.get_output();
            out.LSIRC = try LSIRC.get_output();
            out.LSEOSC = try LSEOSC.get_output();
            out.CECMult = try CECMult.get_output();
            out.CECOutput = try CECOutput.get_output();
            out.HSEOSC = try HSEOSC.get_output();
            out.HSEPLLsourceDevisor = try HSEPLLsourceDevisor.get_output();
            out.PRESCALERUSB = try PRESCALERUSB.get_output();
            out.USBoutput = try USBoutput.get_output();
            out.SysClkSource = try SysClkSource.get_output();
            out.SysCLKOutput = try SysCLKOutput.get_output();
            out.SDADCPresc = try SDADCPresc.get_output();
            out.SDADCoutput = try SDADCoutput.get_output();
            out.PWROutput = try PWROutput.get_output();
            out.HSERTCDevisor = try HSERTCDevisor.get_output();
            out.RTCClkSource = try RTCClkSource.get_output();
            out.RTCOutput = try RTCOutput.get_output();
            out.IWDGOutput = try IWDGOutput.get_output();
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
            out.ADCPresc = try ADCPresc.get_output();
            out.ADCoutput = try ADCoutput.get_output();
            out.APB2Output = try APB2Output.get_output();
            out.TimPrescalerAPB2 = try TimPrescalerAPB2.get_output();
            out.TimPrescOut2 = try TimPrescOut2.get_output();
            out.I2C1Mult = try I2C1Mult.get_output();
            out.I2C1Output = try I2C1Output.get_output();
            out.I2C2Mult = try I2C2Mult.get_output();
            out.I2C2Output = try I2C2Output.get_output();
            out.USART1Mult = try USART1Mult.get_output();
            out.USART1Output = try USART1Output.get_output();
            out.USART2Mult = try USART2Mult.get_output();
            out.USART2Output = try USART2Output.get_output();
            out.USART3Mult = try USART3Mult.get_output();
            out.USART3Output = try USART3Output.get_output();
            out.PLLSource = try PLLSource.get_output();
            out.VCO2output = try VCO2output.get_output();
            out.PLLMUL = try PLLMUL.get_output();
            out.HSI_CEC = try HSI_CEC.get_extra_output();
            out.HSI_PLL = try HSI_PLL.get_extra_output();
            out.HSE_PLL = try HSE_PLL.get_extra_output();
            out.HSE_RTC = try HSE_RTC.get_extra_output();
            out.PLLCLK_MCO = try PLLCLK_MCO.get_extra_output();
            out.PLLCLK = try PLLCLK.get_extra_output();
            out.Tim2CLK = 0;
            out.I2C2CLK = 0;
            ignore_value(HSI_VALUEValue);
            ignore_value(FLITFCLKFreq_ValueValue);
            ref_out.HSIRCDiv = HSIRCDivValue;
            ref_out.HSICECDiv = HSICECDivValue;
            ignore_value(LSI_VALUEValue);
            ignore_value(LSE_VALUEValue);
            ref_out.CECClockSelection = CECClockSelectionValue;
            ignore_value(CECFreq_ValueValue);
            ignore_value(HSE_VALUEValue);
            ref_out.RCC_PLLsource_Clock_Source_FROM_HSE = RCC_PLLsource_Clock_Source_FROM_HSEValue;
            ref_out.PRESCALERUSB = PRESCALERUSBValue;
            ignore_value(USBFreq_ValueValue);
            ref_out.SYSCLKSource = SYSCLKSourceValue;
            ignore_value(SYSCLKFreq_VALUEValue);
            ref_out.SDADCPresc = SDADCPrescValue;
            ignore_value(SDADCoutputFreq_ValueValue);
            ignore_value(PWRFreq_ValueValue);
            ref_out.RCC_RTC_Clock_Source_FROM_HSE = RCC_RTC_Clock_Source_FROM_HSEValue;
            ref_out.RTCClockSelection = RTCClockSelectionValue;
            ignore_value(RTCFreq_ValueValue);
            ignore_value(WatchDogFreq_ValueValue);
            ref_out.RCC_MCOMult_Clock_Source_FROM_PLLMUL = RCC_MCOMult_Clock_Source_FROM_PLLMULValue;
            ref_out.RCC_MCOSource = RCC_MCOSourceValue;
            ignore_value(MCOFreq_ValueValue);
            ref_out.AHBCLKDivider = AHBCLKDividerValue;
            ignore_value(HCLKFreq_ValueValue);
            ignore_value(AHBFreq_ValueValue);
            ignore_value(FCLKCortexFreq_ValueValue);
            ref_out.Cortex_Div = Cortex_DivValue;
            ignore_value(CortexFreq_ValueValue);
            ref_out.APB1CLKDivider = APB1CLKDividerValue;
            ignore_value(APB1Freq_ValueValue);
            ref_out.APB1TimCLKDivider = APB1TimCLKDividerValue;
            ignore_value(APB1TimFreq_ValueValue);
            ref_out.APB2CLKDivider = APB2CLKDividerValue;
            ref_out.ADCPresc = ADCPrescValue;
            ignore_value(ADCoutputFreq_ValueValue);
            ignore_value(APB2Freq_ValueValue);
            ref_out.APB2TimCLKDivider = APB2TimCLKDividerValue;
            ignore_value(APB2TimFreq_ValueValue);
            ref_out.I2c1ClockSelection = I2c1ClockSelectionValue;
            ignore_value(I2C1Freq_ValueValue);
            ref_out.I2c2ClockSelection = I2c2ClockSelectionValue;
            ignore_value(I2C2Freq_ValueValue);
            ref_out.Usart1ClockSelection = Usart1ClockSelectionValue;
            ignore_value(USART1Freq_ValueValue);
            ref_out.Usart2ClockSelection = Usart2ClockSelectionValue;
            ignore_value(USART2Freq_ValueValue);
            ref_out.Usart3ClockSelection = Usart3ClockSelectionValue;
            ignore_value(USART3Freq_ValueValue);
            ref_out.PLLSourceVirtual = PLLSourceVirtualValue;
            ignore_value(VCOOutput2Freq_ValueValue);
            ref_out.PLLMUL = PLLMULValue;
            ignore_value(HSICECFreq_ValueValue);
            ignore_value(HSIPLLFreq_ValueValue);
            ignore_value(HSEPLLFreq_ValueValue);
            ignore_value(RTCHSEDivFreq_ValueValue);
            ignore_value(PLLMCOFreq_ValueValue);
            ignore_value(PLLCLKFreq_ValueValue);
            ref_out.VDD_VALUE = VDD_VALUEValue;
            ref_out.flags.PREFETCH_ENABLE = PREFETCH_ENABLEValue != .@"0";
            ref_out.FLatency = FLatencyValue;
            ref_out.HSICalibrationValue = HSICalibrationValueValue;
            ref_out.HSE_Timout = HSE_TimoutValue;
            ref_out.LSE_Timout = LSE_TimoutValue;
            ref_out.LSE_Drive_Capability = LSE_Drive_CapabilityValue;
            ref_out.flags.LSEUsed = LSEUsedValue != 0;
            ref_out.flags.PLLUsed = PLLUsedValue != 0;
            ref_out.flags.EnableLSE = EnableLSEValue == .true;
            ref_out.flags.CECEnable = CECEnableValue == .true;
            ref_out.flags.EnableHSE = EnableHSEValue == .true;
            ref_out.flags.USBEnable = USBEnableValue == .true;
            ref_out.flags.SDADCEnable = SDADCEnableValue == .true;
            ref_out.flags.EnableHSERTCDevisor = EnableHSERTCDevisorValue == .true;
            ref_out.flags.RTCEnable = RTCEnableValue == .true;
            ref_out.flags.IWDGEnable = IWDGEnableValue == .true;
            ref_out.flags.MCOEnable = MCOEnableValue == .true;
            ref_out.flags.ADC1Enable = ADC1EnableValue == .true;
            ref_out.flags.I2C1Enable = I2C1EnableValue == .true;
            ref_out.flags.I2C2Enable = I2C2EnableValue == .true;
            ref_out.flags.USART1Enable = USART1EnableValue == .true;
            ref_out.flags.USART2Enable = USART2EnableValue == .true;
            ref_out.flags.USART3Enable = USART3EnableValue == .true;
            ref_out.flags.EnableMCOMultDivisor = EnableMCOMultDivisorValue == .true;
            ref_out.flags.EnableLSERTC = EnableLSERTCValue == .true;
            ref_out.flags.HSEUsed = HSEUsedValue != 0;
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
