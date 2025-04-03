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
pub const HSIDiv4Conf = enum {
    DIV4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV4 => 4,
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
        return 48000000;
    }

    pub fn min() f32 {
        return 8000000;
    }
};
pub const HSEOSCDIVConf = enum {
    DIV1,
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
        };
    }
};
pub const HSEDIVConf = enum {
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
        };
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
        return 0;
    }
};
pub const MSIRCConf = enum {
    CLOCK_16,
    CLOCK_4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .CLOCK_16 => 16,
            .CLOCK_4 => 4,
        };
    }
};
pub const IC1Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC1DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC2Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC2DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC3Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC3DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC4Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC4DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC5Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC5DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC6Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC6DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC7Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC7DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC8Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC8DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC9Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC9DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC10Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC10DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC11Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC11DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC12Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC12DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC13Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC13DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC14Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC14DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC15Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC15DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC16Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC16DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC17Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC17DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC18Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC18DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC19Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC19DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const IC20Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC20DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const MCOMultConf = enum {
    HSIDivOutput,
    LSEOSC,
    MSIRC,
    LSIRC,
    HSEOSC,
    IC5Output,
    IC10Output,
    SYSAClkSource,
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
    DIV16,
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
        };
    }
};
pub const MCO2MultConf = enum {
    HSIDivOutput,
    LSEOSC,
    MSIRC,
    LSIRC,
    HSEOSC,
    IC5Output,
    IC10Output,
    SYSBClkSource,
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
    DIV16,
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
        };
    }
};
pub const CKPERSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC5Output,
    IC10Output,
    IC15Output,
    IC19Output,
    IC20Output,
};
pub const ADCMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    TIMGOutput,
};
pub const ADCDIVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 256;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const ADFMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    TIMGOutput,
};
pub const MDF1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    TIMGOutput,
};
pub const PSSIMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC20Output,
    HSIDivOutput,
};
pub const FDCANMultConf = enum {
    APB1Output,
    CKPERoutput,
    IC19Output,
    HSEOSC,
};
pub const I2C1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I2C2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I2C3MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I2C4MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I3C1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I3C2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const LPTIM1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM3MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM2MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM4MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM5MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LTDCMultConf = enum {
    APB5Output,
    CKPERoutput,
    IC16Output,
    HSIDivOutput,
};
pub const DCMIPPMultConf = enum {
    APB5Output,
    CKPERoutput,
    IC17Output,
    HSIDivOutput,
};
pub const FMCMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const SAI1MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    SPDIFRX1Mult,
};
pub const SAI2MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    SPDIFRX1Mult,
};
pub const USART1MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART3MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART4MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART5MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART6MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART7MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART8MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART9MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const LPUART1MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART10MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const SPI1MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SPI2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SPI3MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SPI4MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    MSIRC,
    HSIDivOutput,
    HSEOSC,
};
pub const SPI5MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    MSIRC,
    HSIDivOutput,
    HSEOSC,
};
pub const SPI6MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const XSPI1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const XSPI2MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const OTGHS1MultConf = enum {
    OTGPHY1output,
    HSEOSCDIV,
};
pub const OTGHS2MultConf = enum {
    OTGPHY2output,
    HSEOSCDIV,
};
pub const XSPI3MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const OTGPHY1MultConf = enum {
    HSEOSCDIV,
    CKPERoutput,
    IC15Output,
    HSEDIV,
};
pub const OTGPHY2MultConf = enum {
    HSEOSCDIV,
    CKPERoutput,
    IC15Output,
    HSEDIV,
};
pub const SDMMC1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC4Output,
    IC5Output,
};
pub const SDMMC2MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC4Output,
    IC5Output,
};
pub const ETH1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC12Output,
    HSEOSC,
};
pub const SPDIFRX1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SYSBClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC2Output,
};
pub const SYSCClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC6Output,
};
pub const SYSDClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC11Output,
};
pub const SYSAClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC1Output,
};
pub const TPIUPrescalerConf = enum {
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV8 => 8,
        };
    }
};
pub const CortexPrescalerConf = enum {
    DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV8 => 8,
        };
    }
};
pub const HPREDivConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
        };
    }
};
pub const APB4DIVConf = enum {
    DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const APB5DIVConf = enum {
    DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const TIMGDIVConf = enum {
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
pub const APB1DIVConf = enum {
    DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const APB2DIVConf = enum {
    DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const PLL1SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV1Conf = enum(u32) {
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
pub const PLL2SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV2Conf = enum(u32) {
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
pub const PLL3SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV3Conf = enum(u32) {
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
pub const PLL4SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV4Conf = enum(u32) {
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
pub const FBDIV1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 2500;
    }

    pub fn min() f32 {
        return 10;
    }
};
pub const PLL1FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 16777215;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const POSTDIV1_1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const POSTDIV2_1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const FBDIV2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 500;
    }

    pub fn min() f32 {
        return 20;
    }
};
pub const PLL2FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 16777215;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const POSTDIV1_2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const POSTDIV2_2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const FBDIV3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 500;
    }

    pub fn min() f32 {
        return 20;
    }
};
pub const PLL3FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 16777215;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const POSTDIV1_3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const POSTDIV2_3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const FBDIV4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 500;
    }

    pub fn min() f32 {
        return 20;
    }
};
pub const PLL4FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 16777215;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const POSTDIV1_4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const POSTDIV2_4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 7;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const HSERTCDevisorConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 63;
    }

    pub fn min() f32 {
        return 2;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const Config = struct {
    HSIDiv: HSIDivConf = .DIV1,
    HSIDiv4: HSIDiv4Conf = .DIV4,
    HSEOSC: HSEOSCConf = @enumFromInt(48000000),
    HSEOSCDIV: HSEOSCDIVConf = .DIV1,
    HSEDIV: HSEDIVConf = .DIV2,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .CLOCK_16,
    IC1: IC1Conf = .FOUTPOSTDIV1,
    IC1Div: IC1DivConf = @enumFromInt(3),
    IC2: IC2Conf = .FOUTPOSTDIV1,
    IC2Div: IC2DivConf = @enumFromInt(4),
    IC3: IC3Conf = .FOUTPOSTDIV1,
    IC3Div: IC3DivConf = @enumFromInt(1),
    IC4: IC4Conf = .FOUTPOSTDIV1,
    IC4Div: IC4DivConf = @enumFromInt(1),
    IC5: IC5Conf = .FOUTPOSTDIV1,
    IC5Div: IC5DivConf = @enumFromInt(1),
    IC6: IC6Conf = .FOUTPOSTDIV1,
    IC6Div: IC6DivConf = @enumFromInt(4),
    IC7: IC7Conf = .FOUTPOSTDIV2,
    IC7Div: IC7DivConf = @enumFromInt(1),
    IC8: IC8Conf = .FOUTPOSTDIV2,
    IC8Div: IC8DivConf = @enumFromInt(1),
    IC9: IC9Conf = .FOUTPOSTDIV2,
    IC9Div: IC9DivConf = @enumFromInt(1),
    IC10: IC10Conf = .FOUTPOSTDIV2,
    IC10Div: IC10DivConf = @enumFromInt(1),
    IC11: IC11Conf = .FOUTPOSTDIV1,
    IC11Div: IC11DivConf = @enumFromInt(4),
    IC12: IC12Conf = .FOUTPOSTDIV3,
    IC12Div: IC12DivConf = @enumFromInt(1),
    IC13: IC13Conf = .FOUTPOSTDIV3,
    IC13Div: IC13DivConf = @enumFromInt(1),
    IC14: IC14Conf = .FOUTPOSTDIV3,
    IC14Div: IC14DivConf = @enumFromInt(1),
    IC15: IC15Conf = .FOUTPOSTDIV3,
    IC15Div: IC15DivConf = @enumFromInt(1),
    IC16: IC16Conf = .FOUTPOSTDIV4,
    IC16Div: IC16DivConf = @enumFromInt(1),
    IC17: IC17Conf = .FOUTPOSTDIV4,
    IC17Div: IC17DivConf = @enumFromInt(1),
    IC18: IC18Conf = .FOUTPOSTDIV4,
    IC18Div: IC18DivConf = @enumFromInt(1),
    IC19: IC19Conf = .FOUTPOSTDIV4,
    IC19Div: IC19DivConf = @enumFromInt(1),
    IC20: IC20Conf = .FOUTPOSTDIV4,
    IC20Div: IC20DivConf = @enumFromInt(1),
    MCOMult: MCOMultConf = .HSIDivOutput,
    MCODiv: MCODivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .HSIDivOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    CKPERSource: CKPERSourceConf = .HSIRC,
    ADCMult: ADCMultConf = .AHBOutput,
    ADCDIV: ADCDIVConf = @enumFromInt(1),
    ADFMult: ADFMultConf = .AHBOutput,
    MDF1Mult: MDF1MultConf = .AHBOutput,
    PSSIMult: PSSIMultConf = .AHBOutput,
    FDCANMult: FDCANMultConf = .APB1Output,
    I2C1Mult: I2C1MultConf = .APB1Output,
    I2C2Mult: I2C2MultConf = .APB1Output,
    I2C3Mult: I2C3MultConf = .APB1Output,
    I2C4Mult: I2C4MultConf = .APB1Output,
    I3C1Mult: I3C1MultConf = .APB1Output,
    I3C2Mult: I3C2MultConf = .APB1Output,
    LPTIM1Mult: LPTIM1MultConf = .APB1Output,
    LPTIM3Mult: LPTIM3MultConf = .APB4Output,
    LPTIM2Mult: LPTIM2MultConf = .APB4Output,
    LPTIM4Mult: LPTIM4MultConf = .APB4Output,
    LPTIM5Mult: LPTIM5MultConf = .APB4Output,
    LTDCMult: LTDCMultConf = .APB5Output,
    DCMIPPMult: DCMIPPMultConf = .APB5Output,
    FMCMult: FMCMultConf = .AHBOutput,
    SAI1Mult: SAI1MultConf = .APB2Output,
    SAI2Mult: SAI2MultConf = .APB2Output,
    USART1Mult: USART1MultConf = .APB2Output,
    USART2Mult: USART2MultConf = .APB1Output,
    USART3Mult: USART3MultConf = .APB1Output,
    UART4Mult: UART4MultConf = .APB1Output,
    UART5Mult: UART5MultConf = .APB1Output,
    USART6Mult: USART6MultConf = .APB2Output,
    UART7Mult: UART7MultConf = .APB1Output,
    UART8Mult: UART8MultConf = .APB1Output,
    UART9Mult: UART9MultConf = .APB2Output,
    LPUART1Mult: LPUART1MultConf = .APB4Output,
    USART10Mult: USART10MultConf = .APB2Output,
    SPI1Mult: SPI1MultConf = .APB2Output,
    SPI2Mult: SPI2MultConf = .APB1Output,
    SPI3Mult: SPI3MultConf = .APB1Output,
    SPI4Mult: SPI4MultConf = .APB2Output,
    SPI5Mult: SPI5MultConf = .APB2Output,
    SPI6Mult: SPI6MultConf = .APB4Output,
    XSPI1Mult: XSPI1MultConf = .AHBOutput,
    XSPI2Mult: XSPI2MultConf = .AHBOutput,
    OTGHS1Mult: OTGHS1MultConf = .OTGPHY1output,
    OTGHS2Mult: OTGHS2MultConf = .OTGPHY2output,
    XSPI3Mult: XSPI3MultConf = .AHBOutput,
    OTGPHY1Mult: OTGPHY1MultConf = .HSEDIV,
    OTGPHY2Mult: OTGPHY2MultConf = .HSEDIV,
    SDMMC1Mult: SDMMC1MultConf = .AHBOutput,
    SDMMC2Mult: SDMMC2MultConf = .AHBOutput,
    ETH1Mult: ETH1MultConf = .AHBOutput,
    SPDIFRX1Mult: SPDIFRX1MultConf = .APB1Output,
    SYSBClkSource: SYSBClkSourceConf = .HSIRC,
    SYSCClkSource: SYSCClkSourceConf = .HSIRC,
    SYSDClkSource: SYSDClkSourceConf = .HSIRC,
    SYSAClkSource: SYSAClkSourceConf = .HSIRC,
    TPIUPrescaler: TPIUPrescalerConf = .DIV8,
    CortexPrescaler: CortexPrescalerConf = .DIV8,
    HPREDiv: HPREDivConf = .DIV2,
    APB4DIV: APB4DIVConf = .DIV1,
    APB5DIV: APB5DIVConf = .DIV1,
    TIMGDIV: TIMGDIVConf = .DIV1,
    APB1DIV: APB1DIVConf = .DIV1,
    APB2DIV: APB2DIVConf = .DIV1,
    PLL1Source: PLL1SourceConf = .HSIRC,
    FREFDIV1: FREFDIV1Conf = @enumFromInt(1),
    PLL2Source: PLL2SourceConf = .HSIRC,
    FREFDIV2: FREFDIV2Conf = @enumFromInt(1),
    PLL3Source: PLL3SourceConf = .HSIRC,
    FREFDIV3: FREFDIV3Conf = @enumFromInt(1),
    PLL4Source: PLL4SourceConf = .HSIRC,
    FREFDIV4: FREFDIV4Conf = @enumFromInt(1),
    FBDIV1: FBDIV1Conf = @enumFromInt(25),
    PLL1FRACV: PLL1FRACVConf = @enumFromInt(0),
    POSTDIV1_1: POSTDIV1_1Conf = @enumFromInt(1),
    POSTDIV2_1: POSTDIV2_1Conf = @enumFromInt(1),
    FBDIV2: FBDIV2Conf = @enumFromInt(25),
    PLL2FRACV: PLL2FRACVConf = @enumFromInt(0),
    POSTDIV1_2: POSTDIV1_2Conf = @enumFromInt(1),
    POSTDIV2_2: POSTDIV2_2Conf = @enumFromInt(1),
    FBDIV3: FBDIV3Conf = @enumFromInt(25),
    PLL3FRACV: PLL3FRACVConf = @enumFromInt(0),
    POSTDIV1_3: POSTDIV1_3Conf = @enumFromInt(1),
    POSTDIV2_3: POSTDIV2_3Conf = @enumFromInt(1),
    FBDIV4: FBDIV4Conf = @enumFromInt(25),
    PLL4FRACV: PLL4FRACVConf = @enumFromInt(0),
    POSTDIV1_4: POSTDIV1_4Conf = @enumFromInt(1),
    POSTDIV2_4: POSTDIV2_4Conf = @enumFromInt(1),
    HSERTCDevisor: HSERTCDevisorConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSIDiv: ClockNode,
    HSIDivOutput: ClockNode,
    HSIDiv4: ClockNode,
    UCPDOutput: ClockNode,
    HSEOSC: ClockNode,
    HSEOSCDIV: ClockNode,
    HSEDIV: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    MSIRC: ClockNode,
    I2S_CKIN: ClockNode,
    IC1: ClockNode,
    IC1Div: ClockNode,
    IC1Output: ClockNode,
    IC2: ClockNode,
    IC2Div: ClockNode,
    IC2Output: ClockNode,
    IC3: ClockNode,
    IC3Div: ClockNode,
    IC3Output: ClockNode,
    IC4: ClockNode,
    IC4Div: ClockNode,
    IC4Output: ClockNode,
    IC5: ClockNode,
    IC5Div: ClockNode,
    IC5Output: ClockNode,
    IC6: ClockNode,
    IC6Div: ClockNode,
    IC6Output: ClockNode,
    IC7: ClockNode,
    IC7Div: ClockNode,
    IC7Output: ClockNode,
    IC8: ClockNode,
    IC8Div: ClockNode,
    IC8Output: ClockNode,
    IC9: ClockNode,
    IC9Div: ClockNode,
    IC9Output: ClockNode,
    IC10: ClockNode,
    IC10Div: ClockNode,
    IC10Output: ClockNode,
    IC11: ClockNode,
    IC11Div: ClockNode,
    IC11Output: ClockNode,
    IC12: ClockNode,
    IC12Div: ClockNode,
    IC12Output: ClockNode,
    IC13: ClockNode,
    IC13Div: ClockNode,
    IC13Output: ClockNode,
    IC14: ClockNode,
    IC14Div: ClockNode,
    IC14Output: ClockNode,
    IC15: ClockNode,
    IC15Div: ClockNode,
    IC15Output: ClockNode,
    IC16: ClockNode,
    IC16Div: ClockNode,
    IC16Output: ClockNode,
    IC17: ClockNode,
    IC17Div: ClockNode,
    IC17Output: ClockNode,
    IC18: ClockNode,
    IC18Div: ClockNode,
    IC18Output: ClockNode,
    IC19: ClockNode,
    IC19Div: ClockNode,
    IC19Output: ClockNode,
    IC20: ClockNode,
    IC20Div: ClockNode,
    IC20Output: ClockNode,
    MCOMult: ClockNode,
    MCODiv: ClockNode,
    MCOPin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    CKPERSource: ClockNode,
    CKPERoutput: ClockNode,
    ADCMult: ClockNode,
    ADCDIV: ClockNode,
    ADCoutput: ClockNode,
    ADFMult: ClockNode,
    ADFoutput: ClockNode,
    MDF1Mult: ClockNode,
    MDFoutput: ClockNode,
    PSSIMult: ClockNode,
    PSSIoutput: ClockNode,
    FDCANMult: ClockNode,
    FDCANoutput: ClockNode,
    I2C1Mult: ClockNode,
    I2C1output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    I3C1Mult: ClockNode,
    I3C1output: ClockNode,
    I3C2Mult: ClockNode,
    I3C2output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    LPTIM3Mult: ClockNode,
    LPTIM3output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    LPTIM4Mult: ClockNode,
    LPTIM4output: ClockNode,
    LPTIM5Mult: ClockNode,
    LPTIM5output: ClockNode,
    LTDCMult: ClockNode,
    LTDCoutput: ClockNode,
    DCMIPPMult: ClockNode,
    DCMIPPoutput: ClockNode,
    FMCMult: ClockNode,
    FMCoutput: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
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
    UART7Mult: ClockNode,
    UART7output: ClockNode,
    UART8Mult: ClockNode,
    UART8output: ClockNode,
    UART9Mult: ClockNode,
    UART9output: ClockNode,
    LPUART1Mult: ClockNode,
    LPUART1output: ClockNode,
    USART10Mult: ClockNode,
    USART10output: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI2Mult: ClockNode,
    SPI2output: ClockNode,
    SPI3Mult: ClockNode,
    SPI3output: ClockNode,
    SPI4Mult: ClockNode,
    SPI4output: ClockNode,
    SPI5Mult: ClockNode,
    SPI5output: ClockNode,
    SPI6Mult: ClockNode,
    SPI6output: ClockNode,
    XSPI1Mult: ClockNode,
    XSPI1output: ClockNode,
    XSPI2Mult: ClockNode,
    XSPI2output: ClockNode,
    OTGHS1Mult: ClockNode,
    OTGHS1output: ClockNode,
    OTGHS2Mult: ClockNode,
    OTGHS2output: ClockNode,
    XSPI3Mult: ClockNode,
    XSPI3output: ClockNode,
    OTGPHY1Mult: ClockNode,
    OTGPHY1output: ClockNode,
    OTGPHY2Mult: ClockNode,
    OTGPHY2output: ClockNode,
    SDMMC1Mult: ClockNode,
    SDMMC1output: ClockNode,
    SDMMC2Mult: ClockNode,
    SDMMC2output: ClockNode,
    ETH1Mult: ClockNode,
    ETH1output: ClockNode,
    SPDIFRX1Mult: ClockNode,
    SPDIFRX1output: ClockNode,
    SYSBClkSource: ClockNode,
    SYSCClkSource: ClockNode,
    SYSDClkSource: ClockNode,
    SYSBCLKOutput: ClockNode,
    SYSCCLKOutput: ClockNode,
    SYSDCLKOutput: ClockNode,
    SYSAClkSource: ClockNode,
    TPIUPrescaler: ClockNode,
    TPIUOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    CpuClockOutput: ClockNode,
    AXIClockOutput: ClockNode,
    HPREDiv: ClockNode,
    APB4DIV: ClockNode,
    APB4Output: ClockNode,
    APB5DIV: ClockNode,
    APB5Output: ClockNode,
    TIMGDIV: ClockNode,
    TIMGOutput: ClockNode,
    APB1DIV: ClockNode,
    AHBOutput: ClockNode,
    APB1Output: ClockNode,
    APB2DIV: ClockNode,
    APB2Output: ClockNode,
    PLL1Source: ClockNode,
    FREFDIV1: ClockNode,
    PLL2Source: ClockNode,
    FREFDIV2: ClockNode,
    PLL3Source: ClockNode,
    FREFDIV3: ClockNode,
    PLL4Source: ClockNode,
    FREFDIV4: ClockNode,
    FBDIV1: ClockNode,
    PLL1FRACV: ClockNode,
    POSTDIV1_1: ClockNode,
    POSTDIV2_1: ClockNode,
    FOUTPOSTDIV1: ClockNode,
    FBDIV2: ClockNode,
    PLL2FRACV: ClockNode,
    POSTDIV1_2: ClockNode,
    POSTDIV2_2: ClockNode,
    FOUTPOSTDIV2: ClockNode,
    FBDIV3: ClockNode,
    PLL3FRACV: ClockNode,
    POSTDIV1_3: ClockNode,
    POSTDIV2_3: ClockNode,
    FOUTPOSTDIV3: ClockNode,
    FBDIV4: ClockNode,
    PLL4FRACV: ClockNode,
    POSTDIV1_4: ClockNode,
    POSTDIV2_4: ClockNode,
    FOUTPOSTDIV4: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,

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
        const HSIDivOutput: ClockNode = .{
            .name = "HSIDivOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&HSIDiv},
        };
        const HSIDiv4: ClockNode = .{
            .name = "HSIDiv4",
            .Nodetype = .{ .div = .{ .value = config.HSIDiv4.get() } },
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const UCPDOutput: ClockNode = .{
            .name = "UCPDOutput",
            .Nodetype = .{ .output = .{ .max = 25000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&HSIDiv4},
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 48000000, .min = 8000000 },
            } },
        };
        const HSEOSCDIV: ClockNode = .{
            .name = "HSEOSCDIV",
            .Nodetype = .{ .div = .{ .value = config.HSEOSCDIV.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const HSEDIV: ClockNode = .{
            .name = "HSEDIV",
            .Nodetype = .{ .div = .{ .value = config.HSEDIV.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = .{ .source = .{ .value = 32000 } },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 0 },
            } },
        };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = .{ .source = .{ .value = config.MSIRC.get() } },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const PLL1Source: ClockNode = .{
            .name = "PLL1Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL1Source) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV1: ClockNode = .{
            .name = "FREFDIV1",
            .Nodetype = .{ .div = .{ .value = config.FREFDIV1.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL1Source},
        };
        const FBDIV1: ClockNode = .{
            .name = "FBDIV1",
            .Nodetype = .{ .mul = .{ .value = config.FBDIV1.get(), .limit = .{ .max = 2500, .min = 10 } } },
            .parents = &[_]*const ClockNode{&FREFDIV1},
        };
        const POSTDIV1_1: ClockNode = .{
            .name = "POSTDIV1_1",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV1_1.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&FBDIV1},
        };
        const POSTDIV2_1: ClockNode = .{
            .name = "POSTDIV2_1",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV2_1.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&POSTDIV1_1},
        };
        const FOUTPOSTDIV1: ClockNode = .{
            .name = "FOUTPOSTDIV1",
            .Nodetype = .{ .output = .{ .max = 3200000000, .min = 16000000 } },
            .parents = &[_]*const ClockNode{&POSTDIV2_1},
        };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL2Source) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV2: ClockNode = .{
            .name = "FREFDIV2",
            .Nodetype = .{ .div = .{ .value = config.FREFDIV2.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL2Source},
        };
        const PLL2FRACV: ClockNode = .{
            .name = "PLL2FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL2FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            } },
        };
        const FBDIV2: ClockNode = .{
            .name = "FBDIV2",
            .Nodetype = .{ .mulfrac = .{ .value = config.FBDIV2.get(), .limit = .{ .max = 500, .min = 20 } } },
            .parents = &[_]*const ClockNode{ &FREFDIV2, &PLL2FRACV },
        };
        const POSTDIV1_2: ClockNode = .{
            .name = "POSTDIV1_2",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV1_2.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&FBDIV2},
        };
        const POSTDIV2_2: ClockNode = .{
            .name = "POSTDIV2_2",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV2_2.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&POSTDIV1_2},
        };
        const FOUTPOSTDIV2: ClockNode = .{
            .name = "FOUTPOSTDIV2",
            .Nodetype = .{ .output = .{ .max = 3200000000, .min = 16000000 } },
            .parents = &[_]*const ClockNode{&POSTDIV2_2},
        };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL3Source) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV3: ClockNode = .{
            .name = "FREFDIV3",
            .Nodetype = .{ .div = .{ .value = config.FREFDIV3.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL3Source},
        };
        const PLL3FRACV: ClockNode = .{
            .name = "PLL3FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL3FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            } },
        };
        const FBDIV3: ClockNode = .{
            .name = "FBDIV3",
            .Nodetype = .{ .mulfrac = .{ .value = config.FBDIV3.get(), .limit = .{ .max = 500, .min = 20 } } },
            .parents = &[_]*const ClockNode{ &FREFDIV3, &PLL3FRACV },
        };
        const POSTDIV1_3: ClockNode = .{
            .name = "POSTDIV1_3",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV1_3.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&FBDIV3},
        };
        const POSTDIV2_3: ClockNode = .{
            .name = "POSTDIV2_3",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV2_3.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&POSTDIV1_3},
        };
        const FOUTPOSTDIV3: ClockNode = .{
            .name = "FOUTPOSTDIV3",
            .Nodetype = .{ .output = .{ .max = 3200000000, .min = 16000000 } },
            .parents = &[_]*const ClockNode{&POSTDIV2_3},
        };
        const PLL4Source: ClockNode = .{
            .name = "PLL4Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL4Source) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV4: ClockNode = .{
            .name = "FREFDIV4",
            .Nodetype = .{ .div = .{ .value = config.FREFDIV4.get(), .limit = .{ .max = 63, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL4Source},
        };
        const PLL4FRACV: ClockNode = .{
            .name = "PLL4FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL4FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            } },
        };
        const FBDIV4: ClockNode = .{
            .name = "FBDIV4",
            .Nodetype = .{ .mulfrac = .{ .value = config.FBDIV4.get(), .limit = .{ .max = 500, .min = 20 } } },
            .parents = &[_]*const ClockNode{ &FREFDIV4, &PLL4FRACV },
        };
        const POSTDIV1_4: ClockNode = .{
            .name = "POSTDIV1_4",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV1_4.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&FBDIV4},
        };
        const POSTDIV2_4: ClockNode = .{
            .name = "POSTDIV2_4",
            .Nodetype = .{ .div = .{ .value = config.POSTDIV2_4.get(), .limit = .{ .max = 7, .min = 1 } } },
            .parents = &[_]*const ClockNode{&POSTDIV1_4},
        };
        const FOUTPOSTDIV4: ClockNode = .{
            .name = "FOUTPOSTDIV4",
            .Nodetype = .{ .output = .{ .max = 3200000000, .min = 16000000 } },
            .parents = &[_]*const ClockNode{&POSTDIV2_4},
        };
        const IC1: ClockNode = .{
            .name = "IC1",

            .Nodetype = .{ .multi = @intFromEnum(config.IC1) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC1Div: ClockNode = .{
            .name = "IC1Div",
            .Nodetype = .{ .div = .{ .value = config.IC1Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC1},
        };
        const IC1Output: ClockNode = .{
            .name = "IC1Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC1Div},
        };
        const IC2: ClockNode = .{
            .name = "IC2",

            .Nodetype = .{ .multi = @intFromEnum(config.IC2) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC2Div: ClockNode = .{
            .name = "IC2Div",
            .Nodetype = .{ .div = .{ .value = config.IC2Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC2},
        };
        const IC2Output: ClockNode = .{
            .name = "IC2Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC2Div},
        };
        const IC3: ClockNode = .{
            .name = "IC3",

            .Nodetype = .{ .multi = @intFromEnum(config.IC3) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC3Div: ClockNode = .{
            .name = "IC3Div",
            .Nodetype = .{ .div = .{ .value = config.IC3Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC3},
        };
        const IC3Output: ClockNode = .{
            .name = "IC3Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC3Div},
        };
        const IC4: ClockNode = .{
            .name = "IC4",

            .Nodetype = .{ .multi = @intFromEnum(config.IC4) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC4Div: ClockNode = .{
            .name = "IC4Div",
            .Nodetype = .{ .div = .{ .value = config.IC4Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC4},
        };
        const IC4Output: ClockNode = .{
            .name = "IC4Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC4Div},
        };
        const IC5: ClockNode = .{
            .name = "IC5",

            .Nodetype = .{ .multi = @intFromEnum(config.IC5) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC5Div: ClockNode = .{
            .name = "IC5Div",
            .Nodetype = .{ .div = .{ .value = config.IC5Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC5},
        };
        const IC5Output: ClockNode = .{
            .name = "IC5Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC5Div},
        };
        const IC6: ClockNode = .{
            .name = "IC6",

            .Nodetype = .{ .multi = @intFromEnum(config.IC6) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC6Div: ClockNode = .{
            .name = "IC6Div",
            .Nodetype = .{ .div = .{ .value = config.IC6Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC6},
        };
        const IC6Output: ClockNode = .{
            .name = "IC6Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC6Div},
        };
        const IC7: ClockNode = .{
            .name = "IC7",

            .Nodetype = .{ .multi = @intFromEnum(config.IC7) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC7Div: ClockNode = .{
            .name = "IC7Div",
            .Nodetype = .{ .div = .{ .value = config.IC7Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC7},
        };
        const IC7Output: ClockNode = .{
            .name = "IC7Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC7Div},
        };
        const IC8: ClockNode = .{
            .name = "IC8",

            .Nodetype = .{ .multi = @intFromEnum(config.IC8) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC8Div: ClockNode = .{
            .name = "IC8Div",
            .Nodetype = .{ .div = .{ .value = config.IC8Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC8},
        };
        const IC8Output: ClockNode = .{
            .name = "IC8Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC8Div},
        };
        const IC9: ClockNode = .{
            .name = "IC9",

            .Nodetype = .{ .multi = @intFromEnum(config.IC9) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC9Div: ClockNode = .{
            .name = "IC9Div",
            .Nodetype = .{ .div = .{ .value = config.IC9Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC9},
        };
        const IC9Output: ClockNode = .{
            .name = "IC9Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC9Div},
        };
        const IC10: ClockNode = .{
            .name = "IC10",

            .Nodetype = .{ .multi = @intFromEnum(config.IC10) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC10Div: ClockNode = .{
            .name = "IC10Div",
            .Nodetype = .{ .div = .{ .value = config.IC10Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC10},
        };
        const IC10Output: ClockNode = .{
            .name = "IC10Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC10Div},
        };
        const IC11: ClockNode = .{
            .name = "IC11",

            .Nodetype = .{ .multi = @intFromEnum(config.IC11) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC11Div: ClockNode = .{
            .name = "IC11Div",
            .Nodetype = .{ .div = .{ .value = config.IC11Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC11},
        };
        const IC11Output: ClockNode = .{
            .name = "IC11Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC11Div},
        };
        const IC12: ClockNode = .{
            .name = "IC12",

            .Nodetype = .{ .multi = @intFromEnum(config.IC12) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC12Div: ClockNode = .{
            .name = "IC12Div",
            .Nodetype = .{ .div = .{ .value = config.IC12Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC12},
        };
        const IC12Output: ClockNode = .{
            .name = "IC12Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC12Div},
        };
        const IC13: ClockNode = .{
            .name = "IC13",

            .Nodetype = .{ .multi = @intFromEnum(config.IC13) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC13Div: ClockNode = .{
            .name = "IC13Div",
            .Nodetype = .{ .div = .{ .value = config.IC13Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC13},
        };
        const IC13Output: ClockNode = .{
            .name = "IC13Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC13Div},
        };
        const IC14: ClockNode = .{
            .name = "IC14",

            .Nodetype = .{ .multi = @intFromEnum(config.IC14) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC14Div: ClockNode = .{
            .name = "IC14Div",
            .Nodetype = .{ .div = .{ .value = config.IC14Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC14},
        };
        const IC14Output: ClockNode = .{
            .name = "IC14Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC14Div},
        };
        const IC15: ClockNode = .{
            .name = "IC15",

            .Nodetype = .{ .multi = @intFromEnum(config.IC15) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC15Div: ClockNode = .{
            .name = "IC15Div",
            .Nodetype = .{ .div = .{ .value = config.IC15Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC15},
        };
        const IC15Output: ClockNode = .{
            .name = "IC15Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC15Div},
        };
        const IC16: ClockNode = .{
            .name = "IC16",

            .Nodetype = .{ .multi = @intFromEnum(config.IC16) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC16Div: ClockNode = .{
            .name = "IC16Div",
            .Nodetype = .{ .div = .{ .value = config.IC16Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC16},
        };
        const IC16Output: ClockNode = .{
            .name = "IC16Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC16Div},
        };
        const IC17: ClockNode = .{
            .name = "IC17",

            .Nodetype = .{ .multi = @intFromEnum(config.IC17) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC17Div: ClockNode = .{
            .name = "IC17Div",
            .Nodetype = .{ .div = .{ .value = config.IC17Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC17},
        };
        const IC17Output: ClockNode = .{
            .name = "IC17Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC17Div},
        };
        const IC18: ClockNode = .{
            .name = "IC18",

            .Nodetype = .{ .multi = @intFromEnum(config.IC18) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC18Div: ClockNode = .{
            .name = "IC18Div",
            .Nodetype = .{ .div = .{ .value = config.IC18Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC18},
        };
        const IC18Output: ClockNode = .{
            .name = "IC18Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC18Div},
        };
        const IC19: ClockNode = .{
            .name = "IC19",

            .Nodetype = .{ .multi = @intFromEnum(config.IC19) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC19Div: ClockNode = .{
            .name = "IC19Div",
            .Nodetype = .{ .div = .{ .value = config.IC19Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC19},
        };
        const IC19Output: ClockNode = .{
            .name = "IC19Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC19Div},
        };
        const IC20: ClockNode = .{
            .name = "IC20",

            .Nodetype = .{ .multi = @intFromEnum(config.IC20) },
            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC20Div: ClockNode = .{
            .name = "IC20Div",
            .Nodetype = .{ .div = .{ .value = config.IC20Div.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&IC20},
        };
        const IC20Output: ClockNode = .{
            .name = "IC20Output",
            .Nodetype = .{ .output = .{ .max = 1600000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&IC20Div},
        };
        const SYSAClkSource: ClockNode = .{
            .name = "SYSAClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SYSAClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC1Output,
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCOMult) },
            .parents = &[_]*const ClockNode{
                &HSIDivOutput,
                &LSEOSC,
                &MSIRC,
                &LSIRC,
                &HSEOSC,
                &IC5Output,
                &IC10Output,
                &SYSAClkSource,
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
        const SYSBClkSource: ClockNode = .{
            .name = "SYSBClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SYSBClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC2Output,
            },
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO2Mult) },
            .parents = &[_]*const ClockNode{
                &HSIDivOutput,
                &LSEOSC,
                &MSIRC,
                &LSIRC,
                &HSEOSC,
                &IC5Output,
                &IC10Output,
                &SYSBClkSource,
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
        const CKPERSource: ClockNode = .{
            .name = "CKPERSource",

            .Nodetype = .{ .multi = @intFromEnum(config.CKPERSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC5Output,
                &IC10Output,
                &IC15Output,
                &IC19Output,
                &IC20Output,
            },
        };
        const CKPERoutput: ClockNode = .{
            .name = "CKPERoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CKPERSource},
        };
        const SYSBCLKOutput: ClockNode = .{
            .name = "SYSBCLKOutput",
            .Nodetype = .{ .output = .{ .max = 800000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SYSBClkSource},
        };
        const HPREDiv: ClockNode = .{
            .name = "HPREDiv",
            .Nodetype = .{ .div = .{ .value = config.HPREDiv.get() } },
            .parents = &[_]*const ClockNode{&SYSBCLKOutput},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 400000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const TIMGDIV: ClockNode = .{
            .name = "TIMGDIV",
            .Nodetype = .{ .div = .{ .value = config.TIMGDIV.get() } },
            .parents = &[_]*const ClockNode{&SYSBCLKOutput},
        };
        const TIMGOutput: ClockNode = .{
            .name = "TIMGOutput",
            .Nodetype = .{ .output = .{ .max = 400000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&TIMGDIV},
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC7Output,
                &IC8Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
                &TIMGOutput,
            },
        };
        const ADCDIV: ClockNode = .{
            .name = "ADCDIV",
            .Nodetype = .{ .div = .{ .value = config.ADCDIV.get(), .limit = .{ .max = 256, .min = 1 } } },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = .{ .max = 133000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ADCDIV},
        };
        const ADFMult: ClockNode = .{
            .name = "ADFMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADFMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC7Output,
                &IC8Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
                &TIMGOutput,
            },
        };
        const ADFoutput: ClockNode = .{
            .name = "ADFoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ADFMult},
        };
        const MDF1Mult: ClockNode = .{
            .name = "MDF1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MDF1Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC7Output,
                &IC8Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
                &TIMGOutput,
            },
        };
        const MDFoutput: ClockNode = .{
            .name = "MDFoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MDF1Mult},
        };
        const PSSIMult: ClockNode = .{
            .name = "PSSIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.PSSIMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC20Output,
                &HSIDivOutput,
            },
        };
        const PSSIoutput: ClockNode = .{
            .name = "PSSIoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&PSSIMult},
        };
        const APB1DIV: ClockNode = .{
            .name = "APB1DIV",
            .Nodetype = .{ .div = .{ .value = config.APB1DIV.get() } },
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 400000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1DIV},
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FDCANMult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC19Output,
                &HSEOSC,
            },
        };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
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
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
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
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C4Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const I3C1Mult: ClockNode = .{
            .name = "I3C1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I3C1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
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
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I3C2output: ClockNode = .{
            .name = "I3C2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&I3C2Mult},
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const APB4DIV: ClockNode = .{
            .name = "APB4DIV",
            .Nodetype = .{ .div = .{ .value = config.APB4DIV.get() } },
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .Nodetype = .{ .output = .{ .max = 400000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB4DIV},
        };
        const LPTIM3Mult: ClockNode = .{
            .name = "LPTIM3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM3Mult) },
            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM2Mult) },
            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const LPTIM4Mult: ClockNode = .{
            .name = "LPTIM4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM4Mult) },
            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM4output: ClockNode = .{
            .name = "LPTIM4output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM4Mult},
        };
        const LPTIM5Mult: ClockNode = .{
            .name = "LPTIM5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM5Mult) },
            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM5output: ClockNode = .{
            .name = "LPTIM5output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM5Mult},
        };
        const APB5DIV: ClockNode = .{
            .name = "APB5DIV",
            .Nodetype = .{ .div = .{ .value = config.APB5DIV.get() } },
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB5Output: ClockNode = .{
            .name = "APB5Output",
            .Nodetype = .{ .output = .{ .max = 400000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB5DIV},
        };
        const LTDCMult: ClockNode = .{
            .name = "LTDCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.LTDCMult) },
            .parents = &[_]*const ClockNode{
                &APB5Output,
                &CKPERoutput,
                &IC16Output,
                &HSIDivOutput,
            },
        };
        const LTDCoutput: ClockNode = .{
            .name = "LTDCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LTDCMult},
        };
        const DCMIPPMult: ClockNode = .{
            .name = "DCMIPPMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DCMIPPMult) },
            .parents = &[_]*const ClockNode{
                &APB5Output,
                &CKPERoutput,
                &IC17Output,
                &HSIDivOutput,
            },
        };
        const DCMIPPoutput: ClockNode = .{
            .name = "DCMIPPoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DCMIPPMult},
        };
        const FMCMult: ClockNode = .{
            .name = "FMCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FMCMult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&FMCMult},
        };
        const APB2DIV: ClockNode = .{
            .name = "APB2DIV",
            .Nodetype = .{ .div = .{ .value = config.APB2DIV.get() } },
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 400000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2DIV},
        };
        const SPDIFRX1Mult: ClockNode = .{
            .name = "SPDIFRX1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPDIFRX1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC7Output,
                &IC8Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
            },
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC7Output,
                &IC8Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
                &SPDIFRX1Mult,
            },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI2Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC7Output,
                &IC8Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
                &SPDIFRX1Mult,
            },
        };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART3Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART4Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART5Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART6Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const UART7Mult: ClockNode = .{
            .name = "UART7Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART7Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const UART7output: ClockNode = .{
            .name = "UART7output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&UART7Mult},
        };
        const UART8Mult: ClockNode = .{
            .name = "UART8Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART8Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const UART8output: ClockNode = .{
            .name = "UART8output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&UART8Mult},
        };
        const UART9Mult: ClockNode = .{
            .name = "UART9Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART9Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const UART9output: ClockNode = .{
            .name = "UART9output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&UART9Mult},
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPUART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const USART10Mult: ClockNode = .{
            .name = "USART10Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART10Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &LSEOSC,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const USART10output: ClockNode = .{
            .name = "USART10output",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART10Mult},
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI1Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC8Output,
                &IC9Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
            },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI2Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC8Output,
                &IC9Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
            },
        };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI2Mult},
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI3Mult) },
            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC8Output,
                &IC9Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
            },
        };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const SPI4Mult: ClockNode = .{
            .name = "SPI4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI4Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &MSIRC,
                &HSIDivOutput,
                &HSEOSC,
            },
        };
        const SPI4output: ClockNode = .{
            .name = "SPI4output",
            .Nodetype = .{ .output = .{ .max = 133000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI4Mult},
        };
        const SPI5Mult: ClockNode = .{
            .name = "SPI5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI5Mult) },
            .parents = &[_]*const ClockNode{
                &APB2Output,
                &CKPERoutput,
                &IC9Output,
                &IC14Output,
                &MSIRC,
                &HSIDivOutput,
                &HSEOSC,
            },
        };
        const SPI5output: ClockNode = .{
            .name = "SPI5output",
            .Nodetype = .{ .output = .{ .max = 133000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI5Mult},
        };
        const SPI6Mult: ClockNode = .{
            .name = "SPI6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI6Mult) },
            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC8Output,
                &IC9Output,
                &MSIRC,
                &HSIDivOutput,
                &I2S_CKIN,
            },
        };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI6Mult},
        };
        const XSPI1Mult: ClockNode = .{
            .name = "XSPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.XSPI1Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const XSPI1output: ClockNode = .{
            .name = "XSPI1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&XSPI1Mult},
        };
        const XSPI2Mult: ClockNode = .{
            .name = "XSPI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.XSPI2Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const XSPI2output: ClockNode = .{
            .name = "XSPI2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&XSPI2Mult},
        };
        const OTGPHY1Mult: ClockNode = .{
            .name = "OTGPHY1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.OTGPHY1Mult) },
            .parents = &[_]*const ClockNode{
                &HSEOSCDIV,
                &CKPERoutput,
                &IC15Output,
                &HSEDIV,
            },
        };
        const OTGPHY1output: ClockNode = .{
            .name = "OTGPHY1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&OTGPHY1Mult},
        };
        const OTGHS1Mult: ClockNode = .{
            .name = "OTGHS1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.OTGHS1Mult) },
            .parents = &[_]*const ClockNode{
                &OTGPHY1output,
                &HSEOSCDIV,
            },
        };
        const OTGHS1output: ClockNode = .{
            .name = "OTGHS1output",
            .Nodetype = .{ .output = .{ .max = 60000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&OTGHS1Mult},
        };
        const OTGPHY2Mult: ClockNode = .{
            .name = "OTGPHY2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.OTGPHY2Mult) },
            .parents = &[_]*const ClockNode{
                &HSEOSCDIV,
                &CKPERoutput,
                &IC15Output,
                &HSEDIV,
            },
        };
        const OTGPHY2output: ClockNode = .{
            .name = "OTGPHY2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&OTGPHY2Mult},
        };
        const OTGHS2Mult: ClockNode = .{
            .name = "OTGHS2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.OTGHS2Mult) },
            .parents = &[_]*const ClockNode{
                &OTGPHY2output,
                &HSEOSCDIV,
            },
        };
        const OTGHS2output: ClockNode = .{
            .name = "OTGHS2output",
            .Nodetype = .{ .output = .{ .max = 60000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&OTGHS2Mult},
        };
        const XSPI3Mult: ClockNode = .{
            .name = "XSPI3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.XSPI3Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const XSPI3output: ClockNode = .{
            .name = "XSPI3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&XSPI3Mult},
        };
        const SDMMC1Mult: ClockNode = .{
            .name = "SDMMC1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMC1Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC4Output,
                &IC5Output,
            },
        };
        const SDMMC1output: ClockNode = .{
            .name = "SDMMC1output",
            .Nodetype = .{ .output = .{ .max = 208000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMC1Mult},
        };
        const SDMMC2Mult: ClockNode = .{
            .name = "SDMMC2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMC2Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC4Output,
                &IC5Output,
            },
        };
        const SDMMC2output: ClockNode = .{
            .name = "SDMMC2output",
            .Nodetype = .{ .output = .{ .max = 208000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMC2Mult},
        };
        const ETH1Mult: ClockNode = .{
            .name = "ETH1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.ETH1Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC12Output,
                &HSEOSC,
            },
        };
        const ETH1output: ClockNode = .{
            .name = "ETH1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&ETH1Mult},
        };
        const SPDIFRX1output: ClockNode = .{
            .name = "SPDIFRX1output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPDIFRX1Mult},
        };
        const SYSCClkSource: ClockNode = .{
            .name = "SYSCClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SYSCClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC6Output,
            },
        };
        const SYSDClkSource: ClockNode = .{
            .name = "SYSDClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SYSDClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC11Output,
            },
        };
        const SYSCCLKOutput: ClockNode = .{
            .name = "SYSCCLKOutput",
            .Nodetype = .{ .output = .{ .max = 1000000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SYSCClkSource},
        };
        const SYSDCLKOutput: ClockNode = .{
            .name = "SYSDCLKOutput",
            .Nodetype = .{ .output = .{ .max = 800000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SYSDClkSource},
        };
        const TPIUPrescaler: ClockNode = .{
            .name = "TPIUPrescaler",
            .Nodetype = .{ .div = .{ .value = config.TPIUPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const TPIUOutput: ClockNode = .{
            .name = "TPIUOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&TPIUPrescaler},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = config.CortexPrescaler.get() } },
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const CpuClockOutput: ClockNode = .{
            .name = "CpuClockOutput",
            .Nodetype = .{ .output = .{ .max = 800000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const AXIClockOutput: ClockNode = .{
            .name = "AXIClockOutput",
            .Nodetype = .{ .output = .{ .max = 800000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SYSBClkSource},
        };
        const PLL1FRACV: ClockNode = .{
            .name = "PLL1FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL1FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            } },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSERTCDevisor.get(), .limit = .{ .max = 63, .min = 2 } } },
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
            .Nodetype = .{ .output = .{ .max = 4000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        return .{
            .HSIRC = HSIRC,
            .HSIDiv = HSIDiv,
            .HSIDivOutput = HSIDivOutput,
            .HSIDiv4 = HSIDiv4,
            .UCPDOutput = UCPDOutput,
            .HSEOSC = HSEOSC,
            .HSEOSCDIV = HSEOSCDIV,
            .HSEDIV = HSEDIV,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .MSIRC = MSIRC,
            .I2S_CKIN = I2S_CKIN,
            .IC1 = IC1,
            .IC1Div = IC1Div,
            .IC1Output = IC1Output,
            .IC2 = IC2,
            .IC2Div = IC2Div,
            .IC2Output = IC2Output,
            .IC3 = IC3,
            .IC3Div = IC3Div,
            .IC3Output = IC3Output,
            .IC4 = IC4,
            .IC4Div = IC4Div,
            .IC4Output = IC4Output,
            .IC5 = IC5,
            .IC5Div = IC5Div,
            .IC5Output = IC5Output,
            .IC6 = IC6,
            .IC6Div = IC6Div,
            .IC6Output = IC6Output,
            .IC7 = IC7,
            .IC7Div = IC7Div,
            .IC7Output = IC7Output,
            .IC8 = IC8,
            .IC8Div = IC8Div,
            .IC8Output = IC8Output,
            .IC9 = IC9,
            .IC9Div = IC9Div,
            .IC9Output = IC9Output,
            .IC10 = IC10,
            .IC10Div = IC10Div,
            .IC10Output = IC10Output,
            .IC11 = IC11,
            .IC11Div = IC11Div,
            .IC11Output = IC11Output,
            .IC12 = IC12,
            .IC12Div = IC12Div,
            .IC12Output = IC12Output,
            .IC13 = IC13,
            .IC13Div = IC13Div,
            .IC13Output = IC13Output,
            .IC14 = IC14,
            .IC14Div = IC14Div,
            .IC14Output = IC14Output,
            .IC15 = IC15,
            .IC15Div = IC15Div,
            .IC15Output = IC15Output,
            .IC16 = IC16,
            .IC16Div = IC16Div,
            .IC16Output = IC16Output,
            .IC17 = IC17,
            .IC17Div = IC17Div,
            .IC17Output = IC17Output,
            .IC18 = IC18,
            .IC18Div = IC18Div,
            .IC18Output = IC18Output,
            .IC19 = IC19,
            .IC19Div = IC19Div,
            .IC19Output = IC19Output,
            .IC20 = IC20,
            .IC20Div = IC20Div,
            .IC20Output = IC20Output,
            .MCOMult = MCOMult,
            .MCODiv = MCODiv,
            .MCOPin = MCOPin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .CKPERSource = CKPERSource,
            .CKPERoutput = CKPERoutput,
            .ADCMult = ADCMult,
            .ADCDIV = ADCDIV,
            .ADCoutput = ADCoutput,
            .ADFMult = ADFMult,
            .ADFoutput = ADFoutput,
            .MDF1Mult = MDF1Mult,
            .MDFoutput = MDFoutput,
            .PSSIMult = PSSIMult,
            .PSSIoutput = PSSIoutput,
            .FDCANMult = FDCANMult,
            .FDCANoutput = FDCANoutput,
            .I2C1Mult = I2C1Mult,
            .I2C1output = I2C1output,
            .I2C2Mult = I2C2Mult,
            .I2C2output = I2C2output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .I3C1Mult = I3C1Mult,
            .I3C1output = I3C1output,
            .I3C2Mult = I3C2Mult,
            .I3C2output = I3C2output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .LPTIM3Mult = LPTIM3Mult,
            .LPTIM3output = LPTIM3output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .LPTIM4Mult = LPTIM4Mult,
            .LPTIM4output = LPTIM4output,
            .LPTIM5Mult = LPTIM5Mult,
            .LPTIM5output = LPTIM5output,
            .LTDCMult = LTDCMult,
            .LTDCoutput = LTDCoutput,
            .DCMIPPMult = DCMIPPMult,
            .DCMIPPoutput = DCMIPPoutput,
            .FMCMult = FMCMult,
            .FMCoutput = FMCoutput,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
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
            .UART7Mult = UART7Mult,
            .UART7output = UART7output,
            .UART8Mult = UART8Mult,
            .UART8output = UART8output,
            .UART9Mult = UART9Mult,
            .UART9output = UART9output,
            .LPUART1Mult = LPUART1Mult,
            .LPUART1output = LPUART1output,
            .USART10Mult = USART10Mult,
            .USART10output = USART10output,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI2Mult = SPI2Mult,
            .SPI2output = SPI2output,
            .SPI3Mult = SPI3Mult,
            .SPI3output = SPI3output,
            .SPI4Mult = SPI4Mult,
            .SPI4output = SPI4output,
            .SPI5Mult = SPI5Mult,
            .SPI5output = SPI5output,
            .SPI6Mult = SPI6Mult,
            .SPI6output = SPI6output,
            .XSPI1Mult = XSPI1Mult,
            .XSPI1output = XSPI1output,
            .XSPI2Mult = XSPI2Mult,
            .XSPI2output = XSPI2output,
            .OTGHS1Mult = OTGHS1Mult,
            .OTGHS1output = OTGHS1output,
            .OTGHS2Mult = OTGHS2Mult,
            .OTGHS2output = OTGHS2output,
            .XSPI3Mult = XSPI3Mult,
            .XSPI3output = XSPI3output,
            .OTGPHY1Mult = OTGPHY1Mult,
            .OTGPHY1output = OTGPHY1output,
            .OTGPHY2Mult = OTGPHY2Mult,
            .OTGPHY2output = OTGPHY2output,
            .SDMMC1Mult = SDMMC1Mult,
            .SDMMC1output = SDMMC1output,
            .SDMMC2Mult = SDMMC2Mult,
            .SDMMC2output = SDMMC2output,
            .ETH1Mult = ETH1Mult,
            .ETH1output = ETH1output,
            .SPDIFRX1Mult = SPDIFRX1Mult,
            .SPDIFRX1output = SPDIFRX1output,
            .SYSBClkSource = SYSBClkSource,
            .SYSCClkSource = SYSCClkSource,
            .SYSDClkSource = SYSDClkSource,
            .SYSBCLKOutput = SYSBCLKOutput,
            .SYSCCLKOutput = SYSCCLKOutput,
            .SYSDCLKOutput = SYSDCLKOutput,
            .SYSAClkSource = SYSAClkSource,
            .TPIUPrescaler = TPIUPrescaler,
            .TPIUOutput = TPIUOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .CpuClockOutput = CpuClockOutput,
            .AXIClockOutput = AXIClockOutput,
            .HPREDiv = HPREDiv,
            .APB4DIV = APB4DIV,
            .APB4Output = APB4Output,
            .APB5DIV = APB5DIV,
            .APB5Output = APB5Output,
            .TIMGDIV = TIMGDIV,
            .TIMGOutput = TIMGOutput,
            .APB1DIV = APB1DIV,
            .AHBOutput = AHBOutput,
            .APB1Output = APB1Output,
            .APB2DIV = APB2DIV,
            .APB2Output = APB2Output,
            .PLL1Source = PLL1Source,
            .FREFDIV1 = FREFDIV1,
            .PLL2Source = PLL2Source,
            .FREFDIV2 = FREFDIV2,
            .PLL3Source = PLL3Source,
            .FREFDIV3 = FREFDIV3,
            .PLL4Source = PLL4Source,
            .FREFDIV4 = FREFDIV4,
            .FBDIV1 = FBDIV1,
            .PLL1FRACV = PLL1FRACV,
            .POSTDIV1_1 = POSTDIV1_1,
            .POSTDIV2_1 = POSTDIV2_1,
            .FOUTPOSTDIV1 = FOUTPOSTDIV1,
            .FBDIV2 = FBDIV2,
            .PLL2FRACV = PLL2FRACV,
            .POSTDIV1_2 = POSTDIV1_2,
            .POSTDIV2_2 = POSTDIV2_2,
            .FOUTPOSTDIV2 = FOUTPOSTDIV2,
            .FBDIV3 = FBDIV3,
            .PLL3FRACV = PLL3FRACV,
            .POSTDIV1_3 = POSTDIV1_3,
            .POSTDIV2_3 = POSTDIV2_3,
            .FOUTPOSTDIV3 = FOUTPOSTDIV3,
            .FBDIV4 = FBDIV4,
            .PLL4FRACV = PLL4FRACV,
            .POSTDIV1_4 = POSTDIV1_4,
            .POSTDIV2_4 = POSTDIV2_4,
            .FOUTPOSTDIV4 = FOUTPOSTDIV4,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.ADCoutput.get_comptime();
        _ = self.ADFoutput.get_comptime();
        _ = self.MDFoutput.get_comptime();
        _ = self.PSSIoutput.get_comptime();
        _ = self.FDCANoutput.get_comptime();
        _ = self.I2C1output.get_comptime();
        _ = self.I2C2output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.I3C1output.get_comptime();
        _ = self.I3C2output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.LPTIM3output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.LPTIM4output.get_comptime();
        _ = self.LPTIM5output.get_comptime();
        _ = self.LTDCoutput.get_comptime();
        _ = self.DCMIPPoutput.get_comptime();
        _ = self.FMCoutput.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART3output.get_comptime();
        _ = self.UART4output.get_comptime();
        _ = self.UART5output.get_comptime();
        _ = self.USART6output.get_comptime();
        _ = self.UART7output.get_comptime();
        _ = self.UART8output.get_comptime();
        _ = self.UART9output.get_comptime();
        _ = self.LPUART1output.get_comptime();
        _ = self.USART10output.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI2output.get_comptime();
        _ = self.SPI3output.get_comptime();
        _ = self.SPI4output.get_comptime();
        _ = self.SPI5output.get_comptime();
        _ = self.SPI6output.get_comptime();
        _ = self.XSPI1output.get_comptime();
        _ = self.XSPI2output.get_comptime();
        _ = self.OTGHS1output.get_comptime();
        _ = self.OTGHS2output.get_comptime();
        _ = self.XSPI3output.get_comptime();
        _ = self.OTGPHY1output.get_comptime();
        _ = self.OTGPHY2output.get_comptime();
        _ = self.SDMMC1output.get_comptime();
        _ = self.SDMMC2output.get_comptime();
        _ = self.ETH1output.get_comptime();
        _ = self.SPDIFRX1output.get_comptime();
        _ = self.SYSBCLKOutput.get_comptime();
        _ = self.SYSCCLKOutput.get_comptime();
        _ = self.SYSDCLKOutput.get_comptime();
        _ = self.TPIUOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.CpuClockOutput.get_comptime();
        _ = self.AXIClockOutput.get_comptime();
        _ = self.APB4Output.get_comptime();
        _ = self.APB5Output.get_comptime();
        _ = self.TIMGOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.APB2Output.get_comptime();
    }
};
