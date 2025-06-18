const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSIDivConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
        };
    }
};
pub const HSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 50000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const LSIRCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32600;
    }

    pub fn min() f32 {
        return 31400;
    }
};
pub const LSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 1000000;
    }

    pub fn min() f32 {
        return 1000;
    }
};
pub const SysClkSourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
    PLL1P,
};
pub const PLLSourceConf = enum {
    CSIRC,
    HSIDiv,
    HSEOSC,
};
pub const PLL2SourceConf = enum {
    CSIRC,
    HSIDiv,
    HSEOSC,
};
pub const PLL3SourceConf = enum {
    CSIRC,
    HSIDiv,
    HSEOSC,
};
pub const PLLMConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL2MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL3MConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const HSERTCDevisorConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    DIV16,
    DIV17,
    DIV18,
    DIV19,
    DIV20,
    DIV21,
    DIV22,
    DIV23,
    DIV24,
    DIV25,
    DIV26,
    DIV27,
    DIV28,
    DIV29,
    DIV30,
    DIV31,
    DIV32,
    DIV33,
    DIV34,
    DIV35,
    DIV36,
    DIV37,
    DIV38,
    DIV39,
    DIV40,
    DIV41,
    DIV42,
    DIV43,
    DIV44,
    DIV45,
    DIV46,
    DIV47,
    DIV48,
    DIV49,
    DIV50,
    DIV51,
    DIV52,
    DIV53,
    DIV54,
    DIV55,
    DIV56,
    DIV57,
    DIV58,
    DIV59,
    DIV60,
    DIV61,
    DIV62,
    DIV63,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
            .DIV16 => 16,
            .DIV17 => 17,
            .DIV18 => 18,
            .DIV19 => 19,
            .DIV20 => 20,
            .DIV21 => 21,
            .DIV22 => 22,
            .DIV23 => 23,
            .DIV24 => 24,
            .DIV25 => 25,
            .DIV26 => 26,
            .DIV27 => 27,
            .DIV28 => 28,
            .DIV29 => 29,
            .DIV30 => 30,
            .DIV31 => 31,
            .DIV32 => 32,
            .DIV33 => 33,
            .DIV34 => 34,
            .DIV35 => 35,
            .DIV36 => 36,
            .DIV37 => 37,
            .DIV38 => 38,
            .DIV39 => 39,
            .DIV40 => 40,
            .DIV41 => 41,
            .DIV42 => 42,
            .DIV43 => 43,
            .DIV44 => 44,
            .DIV45 => 45,
            .DIV46 => 46,
            .DIV47 => 47,
            .DIV48 => 48,
            .DIV49 => 49,
            .DIV50 => 50,
            .DIV51 => 51,
            .DIV52 => 52,
            .DIV53 => 53,
            .DIV54 => 54,
            .DIV55 => 55,
            .DIV56 => 56,
            .DIV57 => 57,
            .DIV58 => 58,
            .DIV59 => 59,
            .DIV60 => 60,
            .DIV61 => 61,
            .DIV62 => 62,
            .DIV63 => 63,
        };
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const CECMultConf = enum {
    LSEOSC,
    CSIdivTohdmi,
    LSIRC,
};
pub const USART1MultConf = enum {
    APB2Prescaler,
    PLL2Q,
    HSIDiv,
    LSEOSC,
    CSIRC,
    PLL3Q,
};
pub const USART2MultConf = enum {
    APB1Prescaler,
    PLL2Q,
    HSIDiv,
    LSEOSC,
    CSIRC,
    PLL3Q,
};
pub const USART3MultConf = enum {
    APB1Prescaler,
    PLL2Q,
    HSIDiv,
    LSEOSC,
    CSIRC,
    PLL3Q,
};
pub const UART4MultConf = enum {
    APB1Prescaler,
    PLL2Q,
    HSIDiv,
    LSEOSC,
    CSIRC,
    PLL3Q,
};
pub const UART5MultConf = enum {
    APB1Prescaler,
    PLL2Q,
    HSIDiv,
    LSEOSC,
    CSIRC,
    PLL3Q,
};
pub const USART6MultConf = enum {
    APB1Prescaler,
    PLL2Q,
    HSIDiv,
    LSEOSC,
    CSIRC,
    PLL3Q,
};
pub const LPUART1MultConf = enum {
    APB3Output,
    PLL2Q,
    HSIDiv,
    LSEOSC,
    CSIRC,
    PLL3Q,
};
pub const LPTIM1MultConf = enum {
    APB3Output,
    PLL2P,
    LSEOSC,
    LSIRC,
    CKPERMult,
    PLL3R,
};
pub const LPTIM2MultConf = enum {
    APB1Prescaler,
    PLL2P,
    LSEOSC,
    LSIRC,
    CKPERMult,
    PLL3R,
};
pub const DACMultConf = enum {
    LSEOSC,
    LSIRC,
};
pub const ADCMultConf = enum {
    AHBOutput,
    SysCLKOutput,
    PLL2R,
    HSEOSC,
    HSIDiv,
    CSIRC,
};
pub const CK48MultConf = enum {
    PLL3Q,
    PLL1Q,
    HSI48RC,
};
pub const FDCANMultConf = enum {
    PLL1Q,
    PLL2Q,
    HSEOSC,
};
pub const I2C1MultConf = enum {
    APB1Prescaler,
    PLL3R,
    HSIDiv,
    CSIRC,
};
pub const I2C2MultConf = enum {
    APB1Prescaler,
    PLL3R,
    HSIDiv,
    CSIRC,
};
pub const I2C3MultConf = enum {
    APB3Output,
    PLL3R,
    HSIDiv,
    CSIRC,
};
pub const I3C1MultConf = enum {
    APB1Prescaler,
    PLL3R,
    HSIDiv,
};
pub const I3C2MultConf = enum {
    APB3Prescaler,
    PLL3R,
    HSIDiv,
};
pub const OCTOSPIMMultConf = enum {
    AHBOutput,
    PLL1Q,
    PLL2R,
    CKPERMult,
};
pub const RNGMultConf = enum {
    HSI48RC,
    PLL1Q,
    LSEOSC,
    LSIRC,
};
pub const MCOMultConf = enum {
    LSEOSC,
    HSEOSC,
    HSIDiv,
    PLL1Q,
    HSI48RC,
};
pub const MCODivConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
        };
    }
};
pub const MCO2MultConf = enum {
    LSIRC,
    HSEOSC,
    CSIRC,
    PLL1P,
    PLL2P,
    SysCLKOutput,
};
pub const MCO2DivConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
        };
    }
};
pub const LSCOMultConf = enum {
    LSIRC,
    LSEOSC,
};
pub const CKPERMultConf = enum {
    HSIDiv,
    HSEOSC,
    CSIRC,
};
pub const AHBPrescalerConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV64,
    DIV128,
    DIV256,
    DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
            .DIV512 => 512,
        };
    }
};
pub const CortexPrescalerConf = enum {
    DIV1,
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV8 => 8,
        };
    }
};
pub const CortexCLockSelectionConf = enum {
    CortexPrescaler,
    LSEOSC,
    LSIRC,
};
pub const APB1PrescalerConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const APB2PrescalerConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const APB3PrescalerConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const SPI1MultConf = enum {
    PLL1Q,
    PLL2P,
    PLL3P,
    AUDIOCLK,
    CKPERMult,
};
pub const SPI3MultConf = enum {
    PLL1Q,
    PLL2P,
    PLL3P,
    AUDIOCLK,
    CKPERMult,
};
pub const SPI4MultConf = enum {
    APB2Prescaler,
    PLL2Q,
    HSIDiv,
    CSIRC,
    HSEOSC,
    PLL3Q,
};
pub const SPI2MultConf = enum {
    PLL1Q,
    PLL2P,
    PLL3P,
    AUDIOCLK,
    CKPERMult,
};
pub const PLLNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 512;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLLFRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8191;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const PLL1PConf = enum {
    DIV2,
    DIV4,
    DIV6,
    DIV8,
    DIV10,
    DIV12,
    DIV14,
    DIV16,
    DIV18,
    DIV20,
    DIV22,
    DIV24,
    DIV26,
    DIV28,
    DIV30,
    DIV32,
    DIV34,
    DIV36,
    DIV38,
    DIV40,
    DIV42,
    DIV44,
    DIV46,
    DIV48,
    DIV50,
    DIV52,
    DIV54,
    DIV56,
    DIV58,
    DIV60,
    DIV62,
    DIV64,
    DIV66,
    DIV68,
    DIV70,
    DIV72,
    DIV74,
    DIV76,
    DIV78,
    DIV80,
    DIV82,
    DIV84,
    DIV86,
    DIV88,
    DIV90,
    DIV92,
    DIV94,
    DIV96,
    DIV98,
    DIV100,
    DIV102,
    DIV104,
    DIV106,
    DIV108,
    DIV110,
    DIV112,
    DIV114,
    DIV116,
    DIV118,
    DIV120,
    DIV122,
    DIV124,
    DIV126,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV6 => 6,
            .DIV8 => 8,
            .DIV10 => 10,
            .DIV12 => 12,
            .DIV14 => 14,
            .DIV16 => 16,
            .DIV18 => 18,
            .DIV20 => 20,
            .DIV22 => 22,
            .DIV24 => 24,
            .DIV26 => 26,
            .DIV28 => 28,
            .DIV30 => 30,
            .DIV32 => 32,
            .DIV34 => 34,
            .DIV36 => 36,
            .DIV38 => 38,
            .DIV40 => 40,
            .DIV42 => 42,
            .DIV44 => 44,
            .DIV46 => 46,
            .DIV48 => 48,
            .DIV50 => 50,
            .DIV52 => 52,
            .DIV54 => 54,
            .DIV56 => 56,
            .DIV58 => 58,
            .DIV60 => 60,
            .DIV62 => 62,
            .DIV64 => 64,
            .DIV66 => 66,
            .DIV68 => 68,
            .DIV70 => 70,
            .DIV72 => 72,
            .DIV74 => 74,
            .DIV76 => 76,
            .DIV78 => 78,
            .DIV80 => 80,
            .DIV82 => 82,
            .DIV84 => 84,
            .DIV86 => 86,
            .DIV88 => 88,
            .DIV90 => 90,
            .DIV92 => 92,
            .DIV94 => 94,
            .DIV96 => 96,
            .DIV98 => 98,
            .DIV100 => 100,
            .DIV102 => 102,
            .DIV104 => 104,
            .DIV106 => 106,
            .DIV108 => 108,
            .DIV110 => 110,
            .DIV112 => 112,
            .DIV114 => 114,
            .DIV116 => 116,
            .DIV118 => 118,
            .DIV120 => 120,
            .DIV122 => 122,
            .DIV124 => 124,
            .DIV126 => 126,
            .DIV128 => 128,
        };
    }
};
pub const PLL1QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL1RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL2NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 512;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLL2FRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8191;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const PLL2PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL2QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL2RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL3NConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 512;
    }

    pub fn min() f32 {
        return 4;
    }
};
pub const PLL3FRACNConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 8191;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const PLL3PConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL3QConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL3RConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 128;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const Config = struct {
    HSIDiv: HSIDivConf = .DIV2,
    HSEOSC: HSEOSCConf = @enumFromInt(25000000),
    LSIRC: LSIRCConf = @enumFromInt(32000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIDiv,
    PLLSource: PLLSourceConf = .CSIRC,
    PLL2Source: PLL2SourceConf = .CSIRC,
    PLL3Source: PLL3SourceConf = .CSIRC,
    PLLM: PLLMConf = @enumFromInt(1),
    PLL2M: PLL2MConf = @enumFromInt(1),
    PLL3M: PLL3MConf = @enumFromInt(1),
    HSERTCDevisor: HSERTCDevisorConf = .DIV1,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    CECMult: CECMultConf = .LSEOSC,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    USART6Mult: USART6MultConf = .APB1Prescaler,
    LPUART1Mult: LPUART1MultConf = .APB3Output,
    LPTIM1Mult: LPTIM1MultConf = .APB3Output,
    LPTIM2Mult: LPTIM2MultConf = .APB1Prescaler,
    DACMult: DACMultConf = .LSEOSC,
    ADCMult: ADCMultConf = .AHBOutput,
    CK48Mult: CK48MultConf = .HSI48RC,
    FDCANMult: FDCANMultConf = .HSEOSC,
    I2C1Mult: I2C1MultConf = .APB1Prescaler,
    I2C2Mult: I2C2MultConf = .APB1Prescaler,
    I2C3Mult: I2C3MultConf = .APB3Output,
    I3C1Mult: I3C1MultConf = .APB1Prescaler,
    I3C2Mult: I3C2MultConf = .APB3Prescaler,
    OCTOSPIMMult: OCTOSPIMMultConf = .AHBOutput,
    RNGMult: RNGMultConf = .HSI48RC,
    MCOMult: MCOMultConf = .HSIDiv,
    MCODiv: MCODivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .SysCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    LSCOMult: LSCOMultConf = .LSIRC,
    CKPERMult: CKPERMultConf = .HSIDiv,
    AHBPrescaler: AHBPrescalerConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    CortexCLockSelection: CortexCLockSelectionConf = .CortexPrescaler,
    APB1Prescaler: APB1PrescalerConf = .DIV1,
    APB2Prescaler: APB2PrescalerConf = .DIV1,
    APB3Prescaler: APB3PrescalerConf = .DIV1,
    SPI1Mult: SPI1MultConf = .PLL1Q,
    SPI3Mult: SPI3MultConf = .PLL1Q,
    SPI4Mult: SPI4MultConf = .APB2Prescaler,
    SPI2Mult: SPI2MultConf = .PLL1Q,
    PLLN: PLLNConf = @enumFromInt(129),
    PLLFRACN: PLLFRACNConf = @enumFromInt(0),
    PLL1P: PLL1PConf = .DIV2,
    PLL1Q: PLL1QConf = @enumFromInt(2),
    PLL1R: PLL1RConf = @enumFromInt(2),
    PLL2N: PLL2NConf = @enumFromInt(129),
    PLL2FRACN: PLL2FRACNConf = @enumFromInt(0),
    PLL2P: PLL2PConf = @enumFromInt(2),
    PLL2Q: PLL2QConf = @enumFromInt(2),
    PLL2R: PLL2RConf = @enumFromInt(2),
    PLL3N: PLL3NConf = @enumFromInt(129),
    PLL3FRACN: PLL3FRACNConf = @enumFromInt(0),
    PLL3P: PLL3PConf = @enumFromInt(2),
    PLL3Q: PLL3QConf = @enumFromInt(2),
    PLL3R: PLL3RConf = @enumFromInt(2),
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSIDiv: ClockNode,
    CRSCLKoutput: ClockNode,
    HSI48RC: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    CSIRC: ClockNode,
    AUDIOCLK: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    PLLSource: ClockNode,
    PLL2Source: ClockNode,
    PLL3Source: ClockNode,
    PLLM: ClockNode,
    PLL2M: ClockNode,
    PLL3M: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    CSIdivTohdmi: ClockNode,
    CECMult: ClockNode,
    CECoutput: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART3Mult: ClockNode,
    USART3output: ClockNode,
    UART4Mult: ClockNode,
    UART4output: ClockNode,
    UART5Mult: ClockNode,
    UART5output: ClockNode,
    USART6Mult: ClockNode,
    USART6output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    DACMult: ClockNode,
    DACoutput: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CK48Mult: ClockNode,
    USBoutput: ClockNode,
    FDCANMult: ClockNode,
    FDCANOutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    I3C1Mult: ClockNode,
    I3C1output: ClockNode,
    I3C2Mult: ClockNode,
    I3C2output: ClockNode,
    OCTOSPIMMult: ClockNode,
    OCTOSPIMoutput: ClockNode,
    RNGMult: ClockNode,
    RNGoutput: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    LSCOMult: ClockNode,
    LSCOOutput: ClockNode,
    CKPERMult: ClockNode,
    CKPERoutput: ClockNode,
    AHBPrescaler: ClockNode,
    PWRCLKoutput: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexCLockSelection: ClockNode,
    CortexSysOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    APB3Prescaler: ClockNode,
    APB3Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    hsidivToUCPD: ClockNode,
    UCPD1Output: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
    SPI4Mult: ClockNode,
    SPI4output: ClockNode,
    SPI2Mult: ClockNode,
    SPI2output: ClockNode,
    PLLN: ClockNode,
    PLLFRACN: ClockNode,
    PLL1P: ClockNode,
    PLL1Q: ClockNode,
    PLLQoutput: ClockNode,
    PLL1R: ClockNode,
    PLL2N: ClockNode,
    PLL2FRACN: ClockNode,
    PLL2P: ClockNode,
    PLL2Poutput: ClockNode,
    PLL2Q: ClockNode,
    PLL2Qoutput: ClockNode,
    PLL2R: ClockNode,
    PLL2Routput: ClockNode,
    PLL3N: ClockNode,
    PLL3FRACN: ClockNode,
    PLL3P: ClockNode,
    PLL3Poutput: ClockNode,
    PLL3Q: ClockNode,
    PLL3Qoutput: ClockNode,
    PLL3R: ClockNode,
    PLL3Routput: ClockNode,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = .{ .source = .{ .value = 64000000 } },
        };
        const HSIDiv: ClockNode = .{
            .name = "HSIDiv",
            .Nodetype = .{ .div = .{ .value = config.HSIDiv.get() } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSI48RC: ClockNode = .{
            .name = "HSI48RC",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const CRSCLKoutput: ClockNode = .{
            .name = "CRSCLKoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSI48RC},
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 50000000, .min = 4000000 },
            } },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{
                .value = config.LSIRC.get(),
                .limit = .{ .max = 32600, .min = 31400 },
            } },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 1000 },
            } },
        };
        const CSIRC: ClockNode = .{
            .name = "CSIRC",
            .Nodetype = .{ .source = .{ .value = 4000000 } },
        };
        const AUDIOCLK: ClockNode = .{
            .name = "AUDIOCLK",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",

            .Nodetype = .{ .multi = @intFromEnum(config.PLLSource) },
            .parents = &[_]*const ClockNode{
                &CSIRC,
                &HSIDiv,
                &HSEOSC,
            },
        };
        const PLLM: ClockNode = .{
            .name = "PLLM",
            .Nodetype = .{ .div = .{ .value = config.PLLM.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const PLLFRACN: ClockNode = .{
            .name = "PLLFRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLLFRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const PLLN: ClockNode = .{
            .name = "PLLN",
            .Nodetype = .{ .mulfrac = .{ .value = config.PLLN.get(), .limit = .{ .max = 512, .min = 4 } } },
            .parents = &[_]*const ClockNode{ &PLLM, &PLLFRACN },
        };
        const PLL1P: ClockNode = .{
            .name = "PLL1P",
            .Nodetype = .{ .div = .{ .value = config.PLL1P.get() } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &PLL1P,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL2Source) },
            .parents = &[_]*const ClockNode{
                &CSIRC,
                &HSIDiv,
                &HSEOSC,
            },
        };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL3Source) },
            .parents = &[_]*const ClockNode{
                &CSIRC,
                &HSIDiv,
                &HSEOSC,
            },
        };
        const PLL2M: ClockNode = .{
            .name = "PLL2M",
            .Nodetype = .{ .div = .{ .value = config.PLL2M.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL2Source},
        };
        const PLL3M: ClockNode = .{
            .name = "PLL3M",
            .Nodetype = .{ .div = .{ .value = config.PLL3M.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL3Source},
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSERTCDevisor.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.RTCClkSource) },
            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const CSIdivTohdmi: ClockNode = .{
            .name = "CSIdivTohdmi",
            .Nodetype = .{ .div = .{ .value = 122 } },
            .parents = &[_]*const ClockNode{&CSIRC},
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CECMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &CSIdivTohdmi,
                &LSIRC,
            },
        };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CECMult},
        };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = .{ .div = .{ .value = config.AHBPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB2Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const PLL2FRACN: ClockNode = .{
            .name = "PLL2FRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLL2FRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const PLL2N: ClockNode = .{
            .name = "PLL2N",
            .Nodetype = .{ .mulfrac = .{ .value = config.PLL2N.get(), .limit = .{ .max = 512, .min = 4 } } },
            .parents = &[_]*const ClockNode{ &PLL2M, &PLL2FRACN },
        };
        const PLL2Q: ClockNode = .{
            .name = "PLL2Q",
            .Nodetype = .{ .div = .{ .value = config.PLL2Q.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const PLL3FRACN: ClockNode = .{
            .name = "PLL3FRACN",
            .Nodetype = .{ .source = .{
                .value = config.PLL3FRACN.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const PLL3N: ClockNode = .{
            .name = "PLL3N",
            .Nodetype = .{ .mulfrac = .{ .value = config.PLL3N.get(), .limit = .{ .max = 512, .min = 4 } } },
            .parents = &[_]*const ClockNode{ &PLL3M, &PLL3FRACN },
        };
        const PLL3Q: ClockNode = .{
            .name = "PLL3Q",
            .Nodetype = .{ .div = .{ .value = config.PLL3Q.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL3N},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB1Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART3Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART4Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART5Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART6Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const APB3Prescaler: ClockNode = .{
            .name = "APB3Prescaler",
            .Nodetype = .{ .div = .{ .value = config.APB3Prescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB3Prescaler},
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2Q,
                &HSIDiv,
                &LSEOSC,
                &CSIRC,
                &PLL3Q,
            },
        };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const PLL2P: ClockNode = .{
            .name = "PLL2P",
            .Nodetype = .{ .div = .{ .value = config.PLL2P.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const CKPERMult: ClockNode = .{
            .name = "CKPERMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CKPERMult) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
                &CSIRC,
            },
        };
        const PLL3R: ClockNode = .{
            .name = "PLL3R",
            .Nodetype = .{ .div = .{ .value = config.PLL3R.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL3N},
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM1Mult) },
            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
            },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL2P,
                &LSEOSC,
                &LSIRC,
                &CKPERMult,
                &PLL3R,
            },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const DACMult: ClockNode = .{
            .name = "DACMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DACMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &LSIRC,
            },
        };
        const DACoutput: ClockNode = .{
            .name = "DACoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DACMult},
        };
        const PLL2R: ClockNode = .{
            .name = "PLL2R",
            .Nodetype = .{ .div = .{ .value = config.PLL2R.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL2N},
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &SysCLKOutput,
                &PLL2R,
                &HSEOSC,
                &HSIDiv,
                &CSIRC,
            },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const PLL1Q: ClockNode = .{
            .name = "PLL1Q",
            .Nodetype = .{ .div = .{ .value = config.PLL1Q.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const CK48Mult: ClockNode = .{
            .name = "CK48Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.CK48Mult) },
            .parents = &[_]*const ClockNode{
                &PLL3Q,
                &PLL1Q,
                &HSI48RC,
            },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CK48Mult},
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FDCANMult) },
            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2Q,
                &HSEOSC,
            },
        };
        const FDCANOutput: ClockNode = .{
            .name = "FDCANOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL3R,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL3R,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C3Mult) },
            .parents = &[_]*const ClockNode{
                &APB3Output,
                &PLL3R,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I3C1Mult: ClockNode = .{
            .name = "I3C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I3C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Prescaler,
                &PLL3R,
                &HSIDiv,
            },
        };
        const I3C1output: ClockNode = .{
            .name = "I3C1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I3C1Mult},
        };
        const I3C2Mult: ClockNode = .{
            .name = "I3C2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I3C2Mult) },
            .parents = &[_]*const ClockNode{
                &APB3Prescaler,
                &PLL3R,
                &HSIDiv,
            },
        };
        const I3C2output: ClockNode = .{
            .name = "I3C2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I3C2Mult},
        };
        const OCTOSPIMMult: ClockNode = .{
            .name = "OCTOSPIMMult",

            .Nodetype = .{ .multi = @intFromEnum(config.OCTOSPIMMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &PLL1Q,
                &PLL2R,
                &CKPERMult,
            },
        };
        const OCTOSPIMoutput: ClockNode = .{
            .name = "OCTOSPIMoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&OCTOSPIMMult},
        };
        const RNGMult: ClockNode = .{
            .name = "RNGMult",

            .Nodetype = .{ .multi = @intFromEnum(config.RNGMult) },
            .parents = &[_]*const ClockNode{
                &HSI48RC,
                &PLL1Q,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RNGoutput: ClockNode = .{
            .name = "RNGoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&RNGMult},
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &LSEOSC,
                &HSEOSC,
                &HSIDiv,
                &PLL1Q,
                &HSI48RC,
            },
        };
        const MCODiv: ClockNode = .{
            .name = "MCODiv",
            .Nodetype = .{ .div = .{ .value = config.MCODiv.get() } },
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCODiv},
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO2Mult) },
            .parents = &[_]*const ClockNode{
                &LSIRC,
                &HSEOSC,
                &CSIRC,
                &PLL1P,
                &PLL2P,
                &SysCLKOutput,
            },
        };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .Nodetype = .{ .div = .{ .value = config.MCO2Div.get() } },
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const LSCOMult: ClockNode = .{
            .name = "LSCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LSCOMult) },
            .parents = &[_]*const ClockNode{
                &LSIRC,
                &LSEOSC,
            },
        };
        const LSCOOutput: ClockNode = .{
            .name = "LSCOOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSCOMult},
        };
        const CKPERoutput: ClockNode = .{
            .name = "CKPERoutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CKPERMult},
        };
        const PWRCLKoutput: ClockNode = .{
            .name = "PWRCLKoutput",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = config.CortexPrescaler.get() } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexCLockSelection: ClockNode = .{
            .name = "CortexCLockSelection",

            .Nodetype = .{ .multi = @intFromEnum(config.CortexCLockSelection) },
            .parents = &[_]*const ClockNode{
                &CortexPrescaler,
                &LSEOSC,
                &LSIRC,
            },
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CortexCLockSelection},
        };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2: ClockNode = .{
            .name = "TimPrescalerAPB2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = .{ .output = .{ .max = 250000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const hsidivToUCPD: ClockNode = .{
            .name = "hsidivToUCPD",
            .Nodetype = .{ .div = .{ .value = 4 } },
            .parents = &[_]*const ClockNode{&HSIDiv},
        };
        const UCPD1Output: ClockNode = .{
            .name = "UCPD1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&hsidivToUCPD},
        };
        const PLL3P: ClockNode = .{
            .name = "PLL3P",
            .Nodetype = .{ .div = .{ .value = config.PLL3P.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL3N},
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI1Mult) },
            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &PLL3P,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI3Mult) },
            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &PLL3P,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const SPI4Mult: ClockNode = .{
            .name = "SPI4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI4Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Prescaler,
                &PLL2Q,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &PLL3Q,
            },
        };
        const SPI4output: ClockNode = .{
            .name = "SPI4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI4Mult},
        };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI2Mult) },
            .parents = &[_]*const ClockNode{
                &PLL1Q,
                &PLL2P,
                &PLL3P,
                &AUDIOCLK,
                &CKPERMult,
            },
        };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SPI2Mult},
        };
        const PLLQoutput: ClockNode = .{
            .name = "PLLQoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL1Q},
        };
        const PLL1R: ClockNode = .{
            .name = "PLL1R",
            .Nodetype = .{ .div = .{ .value = config.PLL1R.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLLN},
        };
        const PLL2Poutput: ClockNode = .{
            .name = "PLL2Poutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL2P},
        };
        const PLL2Qoutput: ClockNode = .{
            .name = "PLL2Qoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL2Q},
        };
        const PLL2Routput: ClockNode = .{
            .name = "PLL2Routput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL2R},
        };
        const PLL3Poutput: ClockNode = .{
            .name = "PLL3Poutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL3P},
        };
        const PLL3Qoutput: ClockNode = .{
            .name = "PLL3Qoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL3Q},
        };
        const PLL3Routput: ClockNode = .{
            .name = "PLL3Routput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PLL3R},
        };
        return .{
            .HSIRC = HSIRC,
            .HSIDiv = HSIDiv,
            .CRSCLKoutput = CRSCLKoutput,
            .HSI48RC = HSI48RC,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .CSIRC = CSIRC,
            .AUDIOCLK = AUDIOCLK,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .PLLSource = PLLSource,
            .PLL2Source = PLL2Source,
            .PLL3Source = PLL3Source,
            .PLLM = PLLM,
            .PLL2M = PLL2M,
            .PLL3M = PLL3M,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .CSIdivTohdmi = CSIdivTohdmi,
            .CECMult = CECMult,
            .CECoutput = CECoutput,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART3Mult = USART3Mult,
            .USART3output = USART3output,
            .UART4Mult = UART4Mult,
            .UART4output = UART4output,
            .UART5Mult = UART5Mult,
            .UART5output = UART5output,
            .USART6Mult = USART6Mult,
            .USART6output = USART6output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .DACMult = DACMult,
            .DACoutput = DACoutput,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CK48Mult = CK48Mult,
            .USBoutput = USBoutput,
            .FDCANMult = FDCANMult,
            .FDCANOutput = FDCANOutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .I3C1Mult = I3C1Mult,
            .I3C1output = I3C1output,
            .I3C2Mult = I3C2Mult,
            .I3C2output = I3C2output,
            .OCTOSPIMMult = OCTOSPIMMult,
            .OCTOSPIMoutput = OCTOSPIMoutput,
            .RNGMult = RNGMult,
            .RNGoutput = RNGoutput,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .LSCOMult = LSCOMult,
            .LSCOOutput = LSCOOutput,
            .CKPERMult = CKPERMult,
            .CKPERoutput = CKPERoutput,
            .AHBPrescaler = AHBPrescaler,
            .PWRCLKoutput = PWRCLKoutput,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexCLockSelection = CortexCLockSelection,
            .CortexSysOutput = CortexSysOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .APB3Prescaler = APB3Prescaler,
            .APB3Output = APB3Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .hsidivToUCPD = hsidivToUCPD,
            .UCPD1Output = UCPD1Output,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
            .SPI4Mult = SPI4Mult,
            .SPI4output = SPI4output,
            .SPI2Mult = SPI2Mult,
            .SPI2output = SPI2output,
            .PLLN = PLLN,
            .PLLFRACN = PLLFRACN,
            .PLL1P = PLL1P,
            .PLL1Q = PLL1Q,
            .PLLQoutput = PLLQoutput,
            .PLL1R = PLL1R,
            .PLL2N = PLL2N,
            .PLL2FRACN = PLL2FRACN,
            .PLL2P = PLL2P,
            .PLL2Poutput = PLL2Poutput,
            .PLL2Q = PLL2Q,
            .PLL2Qoutput = PLL2Qoutput,
            .PLL2R = PLL2R,
            .PLL2Routput = PLL2Routput,
            .PLL3N = PLL3N,
            .PLL3FRACN = PLL3FRACN,
            .PLL3P = PLL3P,
            .PLL3Poutput = PLL3Poutput,
            .PLL3Q = PLL3Q,
            .PLL3Qoutput = PLL3Qoutput,
            .PLL3R = PLL3R,
            .PLL3Routput = PLL3Routput,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.CRSCLKoutput.get_comptime();
        _ = self.RTCOutput.get_comptime();
        _ = self.IWDGOutput.get_comptime();
        _ = self.CECoutput.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.UART4output.get_comptime();
        _ = self.UART5output.get_comptime();
        _ = self.USART6output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.DACoutput.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.USBoutput.get_comptime();
        _ = self.FDCANOutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.I3C1output.get_comptime();
        _ = self.I3C2output.get_comptime();
        _ = self.OCTOSPIMoutput.get_comptime();
        _ = self.RNGoutput.get_comptime();
        _ = self.PWRCLKoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.APB3Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI3output.get_comptime();
        _ = self.SPI4output.get_comptime();
        _ = self.SPI2output.get_comptime();
    }
};
