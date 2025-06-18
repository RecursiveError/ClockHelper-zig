const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSIDivConf = enum {
    RCC_HSI_DIV1,
    RCC_HSI_DIV2,
    RCC_HSI_DIV4,
    RCC_HSI_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HSI_DIV1 => 1,
            .RCC_HSI_DIV2 => 2,
            .RCC_HSI_DIV4 => 4,
            .RCC_HSI_DIV8 => 8,
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
pub const SysClkSourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
    DIVP3,
};
pub const MPUMultConf = enum {
    DIVP1,
    MPUDIV,
    HSEOSC,
    HSIDiv,
};
pub const CKPERMultConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const AXIMultConf = enum {
    HSEOSC,
    HSIDiv,
    DIVP2,
};
pub const AXIDIVConf = enum {
    RCC_AXI_DIV1,
    RCC_AXI_DIV2,
    RCC_AXI_DIV3,
    RCC_AXI_DIV4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_AXI_DIV1 => 1,
            .RCC_AXI_DIV2 => 2,
            .RCC_AXI_DIV3 => 3,
            .RCC_AXI_DIV4 => 4,
        };
    }
};
pub const APB4DIVConf = enum {
    RCC_APB4_DIV1,
    RCC_APB4_DIV2,
    RCC_APB4_DIV4,
    RCC_APB4_DIV8,
    RCC_APB4_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB4_DIV1 => 1,
            .RCC_APB4_DIV2 => 2,
            .RCC_APB4_DIV4 => 4,
            .RCC_APB4_DIV8 => 8,
            .RCC_APB4_DIV16 => 16,
        };
    }
};
pub const APB5DIVConf = enum {
    RCC_APB5_DIV1,
    RCC_APB5_DIV2,
    RCC_APB5_DIV4,
    RCC_APB5_DIV8,
    RCC_APB5_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB5_DIV1 => 1,
            .RCC_APB5_DIV2 => 2,
            .RCC_APB5_DIV4 => 4,
            .RCC_APB5_DIV8 => 8,
            .RCC_APB5_DIV16 => 16,
        };
    }
};
pub const APB6DIVConf = enum {
    RCC_APB6_DIV1,
    RCC_APB6_DIV2,
    RCC_APB6_DIV4,
    RCC_APB6_DIV8,
    RCC_APB6_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB6_DIV1 => 1,
            .RCC_APB6_DIV2 => 2,
            .RCC_APB6_DIV4 => 4,
            .RCC_APB6_DIV8 => 8,
            .RCC_APB6_DIV16 => 16,
        };
    }
};
pub const MCO1MultConf = enum {
    HSIDiv,
    HSEOSC,
    CSIRC,
    LSIRC,
    LSEOSC,
};
pub const MCO1DivConf = enum {
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
    RCC_MCODIV_16,
    pub fn get(self: @This()) f32 {
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
            .RCC_MCODIV_16 => 16,
        };
    }
};
pub const MCO2MultConf = enum {
    MPUCLKOutput,
    AXIDIV,
    SysCLKOutput,
    DIVP4,
    HSEOSC,
    HSIDiv,
};
pub const MCO2DivConf = enum {
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
    RCC_MCODIV_16,
    pub fn get(self: @This()) f32 {
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
            .RCC_MCODIV_16 => 16,
        };
    }
};
pub const MLAHBDIVConf = enum {
    RCC_MLAHB_DIV1,
    RCC_MLAHB_DIV2,
    RCC_MLAHB_DIV4,
    RCC_MLAHB_DIV8,
    RCC_MLAHB_DIV16,
    RCC_MLAHB_DIV32,
    RCC_MLAHB_DIV64,
    RCC_MLAHB_DIV128,
    RCC_MLAHB_DIV256,
    RCC_MLAHB_DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MLAHB_DIV1 => 1,
            .RCC_MLAHB_DIV2 => 2,
            .RCC_MLAHB_DIV4 => 4,
            .RCC_MLAHB_DIV8 => 8,
            .RCC_MLAHB_DIV16 => 16,
            .RCC_MLAHB_DIV32 => 32,
            .RCC_MLAHB_DIV64 => 64,
            .RCC_MLAHB_DIV128 => 128,
            .RCC_MLAHB_DIV256 => 256,
            .RCC_MLAHB_DIV512 => 512,
        };
    }
};
pub const APB3DIVConf = enum {
    RCC_APB3_DIV1,
    RCC_APB3_DIV2,
    RCC_APB3_DIV4,
    RCC_APB3_DIV8,
    RCC_APB3_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB3_DIV1 => 1,
            .RCC_APB3_DIV2 => 2,
            .RCC_APB3_DIV4 => 4,
            .RCC_APB3_DIV8 => 8,
            .RCC_APB3_DIV16 => 16,
        };
    }
};
pub const APB1DIVConf = enum {
    RCC_APB1_DIV1,
    RCC_APB1_DIV2,
    RCC_APB1_DIV4,
    RCC_APB1_DIV8,
    RCC_APB1_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB1_DIV1 => 1,
            .RCC_APB1_DIV2 => 2,
            .RCC_APB1_DIV4 => 4,
            .RCC_APB1_DIV8 => 8,
            .RCC_APB1_DIV16 => 16,
        };
    }
};
pub const APB2DIVConf = enum {
    RCC_APB2_DIV1,
    RCC_APB2_DIV2,
    RCC_APB2_DIV4,
    RCC_APB2_DIV8,
    RCC_APB2_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB2_DIV1 => 1,
            .RCC_APB2_DIV2 => 2,
            .RCC_APB2_DIV4 => 4,
            .RCC_APB2_DIV8 => 8,
            .RCC_APB2_DIV16 => 16,
        };
    }
};
pub const PLL12SourceConf = enum {
    HSIDiv,
    HSEOSC,
};
pub const DIVM1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 64;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const DIVM2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 64;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL3SourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const DIVM3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 64;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const PLL4SourceConf = enum {
    HSIDiv,
    CSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const DIVM4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 64;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const MPUDIVConf = enum {
    RCC_MPU_DIV_OFF,
    RCC_MPU_DIV2,
    RCC_MPU_DIV4,
    RCC_MPU_DIV8,
    RCC_MPU_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MPU_DIV_OFF => 1,
            .RCC_MPU_DIV2 => 2,
            .RCC_MPU_DIV4 => 4,
            .RCC_MPU_DIV8 => 8,
            .RCC_MPU_DIV16 => 16,
        };
    }
};
pub const DIVN1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 100;
    }

    pub fn min() f32 {
        return 25;
    }
};
pub const PLL1FRACVConf = enum(u32) {
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
pub const DIVP1Conf = enum(u32) {
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
pub const DIVQ1Conf = enum(u32) {
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
pub const DIVR1Conf = enum(u32) {
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
pub const DIVN2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 100;
    }

    pub fn min() f32 {
        return 25;
    }
};
pub const PLL2FRACVConf = enum(u32) {
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
pub const DIVP2Conf = enum(u32) {
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
pub const DIVQ2Conf = enum(u32) {
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
pub const DIVR2Conf = enum(u32) {
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
pub const DIVN3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 200;
    }

    pub fn min() f32 {
        return 25;
    }
};
pub const PLL3FRACVConf = enum(u32) {
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
pub const DIVP3Conf = enum(u32) {
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
pub const DIVQ3Conf = enum(u32) {
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
pub const DIVR3Conf = enum(u32) {
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
pub const DIVN4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 200;
    }

    pub fn min() f32 {
        return 25;
    }
};
pub const PLL4FRACVConf = enum(u32) {
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
pub const DIVP4Conf = enum(u32) {
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
pub const DIVQ4Conf = enum(u32) {
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
pub const DIVR4Conf = enum(u32) {
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
pub const HSERTCDevisorConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 64;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const I2C12MultConf = enum {
    APB1DIV,
    DIVR4,
    HSIDiv,
    CSIRC,
};
pub const I2C3MultConf = enum {
    APB6DIV,
    DIVR4,
    HSIDiv,
    CSIRC,
};
pub const I2C4MultConf = enum {
    APB6DIV,
    DIVR4,
    HSIDiv,
    CSIRC,
};
pub const I2C5MultConf = enum {
    APB6DIV,
    DIVR4,
    HSIDiv,
    CSIRC,
};
pub const SPDIFMultConf = enum {
    DIVP4,
    DIVQ3,
    HSIDiv,
};
pub const QSPIMultConf = enum {
    AXIOutput,
    DIVP4,
    DIVR3,
    CKPERCLKOutput,
};
pub const FMCMultConf = enum {
    AXIOutput,
    DIVR3,
    DIVP4,
    CKPERCLKOutput,
};
pub const SDMMC1MultConf = enum {
    Hclk6Output,
    DIVR3,
    DIVP4,
    HSIDiv,
};
pub const SDMMC2MultConf = enum {
    Hclk6Output,
    DIVR3,
    DIVP4,
    HSIDiv,
};
pub const STGENMultConf = enum {
    HSIDiv,
    HSEOSC,
};
pub const LPTIM45MultConf = enum {
    APB3DIV,
    DIVP4,
    DIVQ3,
    LSEOSC,
    LSIRC,
    CKPERCLKOutput,
};
pub const LPTIM2MultConf = enum {
    APB3DIV,
    DIVQ4,
    CKPERCLKOutput,
    LSEOSC,
    LSIRC,
};
pub const LPTIM1MultConf = enum {
    APB1DIV,
    DIVP4,
    DIVQ3,
    LSEOSC,
    LSIRC,
    CKPERCLKOutput,
};
pub const USART1MultConf = enum {
    APB6DIV,
    DIVQ4,
    DIVQ3,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const USART2MultConf = enum {
    APB6DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
    DIVQ3,
};
pub const USART35MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const USART6MultConf = enum {
    APB2DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const UART78MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const RNG1MultConf = enum {
    CSIRC,
    DIVR4,
    LSIRC,
};
pub const SAESMultConf = enum {
    AXIOutput,
    CKPERCLKOutput,
    DIVR4,
    LSIRC,
};
pub const LPTIM3MultConf = enum {
    APB3DIV,
    DIVQ4,
    CKPERCLKOutput,
    LSEOSC,
    LSIRC,
};
pub const SPI4MultConf = enum {
    APB6DIV,
    DIVQ4,
    HSIDiv,
    CSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const SAI2MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    SPDIFMult,
    DIVR3,
};
pub const USART4MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const SPI1MultConf = enum {
    DIVP4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const SPI23MultConf = enum {
    DIVP4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const SAI1MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
};
pub const SPI5MultConf = enum {
    APB6DIV,
    DIVQ4,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const FDCANMultConf = enum {
    HSEOSC,
    DIVQ3,
    DIVQ4,
    DIVR4,
};
pub const ETH1MultConf = enum {
    DIVP4,
    DIVQ3,
};
pub const ETH2MultConf = enum {
    DIVP4,
    DIVQ3,
};
pub const ADC2MultConf = enum {
    DIVR4,
    CKPERCLKOutput,
    DIVQ3,
};
pub const ADC1MultConf = enum {
    DIVR4,
    CKPERCLKOutput,
    DIVQ3,
};
pub const HSEUSBPHYDevisorConf = enum {
    RCC_USBPHYCLKSOURCE_HSE2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_USBPHYCLKSOURCE_HSE2 => 2,
        };
    }
};
pub const USBPHYCLKMuxConf = enum {
    HSEUSBPHYDevisor,
    HSEOSC,
    DIVR4,
};
pub const USBOCLKMuxConf = enum {
    DIVR4,
    USBPHYRC,
};
pub const HSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const LSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const RCC_TIM_G1_PRescaler_SelectionConf = enum {
    RCC_TIMG1PRES_ACTIVATED,
    RCC_TIMG1PRES_DEACTIVATED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TIMG1PRES_ACTIVATED => 0,
            .RCC_TIMG1PRES_DEACTIVATED => 1,
        };
    }
};
pub const RCC_TIM_G2_PRescaler_SelectionConf = enum {
    RCC_TIMG2PRES_ACTIVATED,
    RCC_TIMG2PRES_DEACTIVATED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TIMG2PRES_ACTIVATED => 0,
            .RCC_TIMG2PRES_DEACTIVATED => 1,
        };
    }
};
pub const RCC_TIM_G3_PRescaler_SelectionConf = enum {
    RCC_TIMG3PRES_ACTIVATED,
    RCC_TIMG3PRES_DEACTIVATED,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TIMG3PRES_ACTIVATED => 0,
            .RCC_TIMG3PRES_DEACTIVATED => 1,
        };
    }
};
pub const MPUMaxLimitConstraintConf = enum {
    @"650Mhz",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"650Mhz" => 0,
        };
    }
};
pub const LSE_Drive_CapabilityConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 127;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const CSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 31;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const Config = struct {
    HSIDiv: HSIDivConf = .RCC_HSI_DIV1,
    HSEOSC: HSEOSCConf = @enumFromInt(24000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIDiv,
    MPUMult: MPUMultConf = .HSIDiv,
    CKPERMult: CKPERMultConf = .HSIDiv,
    AXIMult: AXIMultConf = .HSIDiv,
    AXIDIV: AXIDIVConf = .RCC_AXI_DIV1,
    APB4DIV: APB4DIVConf = .RCC_APB4_DIV1,
    APB5DIV: APB5DIVConf = .RCC_APB5_DIV1,
    APB6DIV: APB6DIVConf = .RCC_APB6_DIV1,
    MCO1Mult: MCO1MultConf = .HSIDiv,
    MCO1Div: MCO1DivConf = .RCC_MCODIV_1,
    MCO2Mult: MCO2MultConf = .MPUCLKOutput,
    MCO2Div: MCO2DivConf = .RCC_MCODIV_1,
    MLAHBDIV: MLAHBDIVConf = .RCC_MLAHB_DIV1,
    APB3DIV: APB3DIVConf = .RCC_APB3_DIV1,
    APB1DIV: APB1DIVConf = .RCC_APB1_DIV1,
    APB2DIV: APB2DIVConf = .RCC_APB2_DIV1,
    PLL12Source: PLL12SourceConf = .HSIDiv,
    DIVM1: DIVM1Conf = @enumFromInt(2),
    DIVM2: DIVM2Conf = @enumFromInt(2),
    PLL3Source: PLL3SourceConf = .HSIDiv,
    DIVM3: DIVM3Conf = @enumFromInt(2),
    PLL4Source: PLL4SourceConf = .HSIDiv,
    DIVM4: DIVM4Conf = @enumFromInt(2),
    MPUDIV: MPUDIVConf = .RCC_MPU_DIV2,
    DIVN1: DIVN1Conf = @enumFromInt(50),
    PLL1FRACV: PLL1FRACVConf = @enumFromInt(0),
    DIVP1: DIVP1Conf = @enumFromInt(1),
    DIVQ1: DIVQ1Conf = @enumFromInt(2),
    DIVR1: DIVR1Conf = @enumFromInt(2),
    DIVN2: DIVN2Conf = @enumFromInt(100),
    PLL2FRACV: PLL2FRACVConf = @enumFromInt(0),
    DIVP2: DIVP2Conf = @enumFromInt(2),
    DIVQ2: DIVQ2Conf = @enumFromInt(2),
    DIVR2: DIVR2Conf = @enumFromInt(2),
    DIVN3: DIVN3Conf = @enumFromInt(50),
    PLL3FRACV: PLL3FRACVConf = @enumFromInt(0),
    DIVP3: DIVP3Conf = @enumFromInt(2),
    DIVQ3: DIVQ3Conf = @enumFromInt(2),
    DIVR3: DIVR3Conf = @enumFromInt(2),
    DIVN4: DIVN4Conf = @enumFromInt(50),
    PLL4FRACV: PLL4FRACVConf = @enumFromInt(0),
    DIVP4: DIVP4Conf = @enumFromInt(1),
    DIVQ4: DIVQ4Conf = @enumFromInt(1),
    DIVR4: DIVR4Conf = @enumFromInt(1),
    HSERTCDevisor: HSERTCDevisorConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    I2C12Mult: I2C12MultConf = .APB1DIV,
    I2C3Mult: I2C3MultConf = .APB6DIV,
    I2C4Mult: I2C4MultConf = .APB6DIV,
    I2C5Mult: I2C5MultConf = .APB6DIV,
    SPDIFMult: SPDIFMultConf = .DIVP4,
    QSPIMult: QSPIMultConf = .AXIOutput,
    FMCMult: FMCMultConf = .AXIOutput,
    SDMMC1Mult: SDMMC1MultConf = .Hclk6Output,
    SDMMC2Mult: SDMMC2MultConf = .Hclk6Output,
    STGENMult: STGENMultConf = .HSIDiv,
    LPTIM45Mult: LPTIM45MultConf = .APB3DIV,
    LPTIM2Mult: LPTIM2MultConf = .APB3DIV,
    LPTIM1Mult: LPTIM1MultConf = .APB1DIV,
    USART1Mult: USART1MultConf = .APB6DIV,
    USART2Mult: USART2MultConf = .APB6DIV,
    USART35Mult: USART35MultConf = .APB1DIV,
    USART6Mult: USART6MultConf = .APB2DIV,
    UART78Mult: UART78MultConf = .APB1DIV,
    RNG1Mult: RNG1MultConf = .CSIRC,
    SAESMult: SAESMultConf = .AXIOutput,
    LPTIM3Mult: LPTIM3MultConf = .APB3DIV,
    SPI4Mult: SPI4MultConf = .APB6DIV,
    SAI2Mult: SAI2MultConf = .DIVQ4,
    USART4Mult: USART4MultConf = .APB1DIV,
    SPI1Mult: SPI1MultConf = .DIVP4,
    SPI23Mult: SPI23MultConf = .DIVP4,
    SAI1Mult: SAI1MultConf = .DIVQ4,
    SPI5Mult: SPI5MultConf = .APB6DIV,
    FDCANMult: FDCANMultConf = .HSEOSC,
    ETH1Mult: ETH1MultConf = .DIVP4,
    ETH2Mult: ETH2MultConf = .DIVP4,
    ADC2Mult: ADC2MultConf = .DIVR4,
    ADC1Mult: ADC1MultConf = .DIVR4,
    HSEUSBPHYDevisor: HSEUSBPHYDevisorConf = .RCC_USBPHYCLKSOURCE_HSE2,
    USBPHYCLKMux: USBPHYCLKMuxConf = .DIVR4,
    USBOCLKMux: USBOCLKMuxConf = .DIVR4,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    RCC_TIM_G1_PRescaler_Selection: RCC_TIM_G1_PRescaler_SelectionConf = .RCC_TIMG1PRES_DEACTIVATED,
    RCC_TIM_G2_PRescaler_Selection: RCC_TIM_G2_PRescaler_SelectionConf = .RCC_TIMG2PRES_DEACTIVATED,
    RCC_TIM_G3_PRescaler_Selection: RCC_TIM_G3_PRescaler_SelectionConf = .RCC_TIMG3PRES_DEACTIVATED,
    MPUMaxLimitConstraint: MPUMaxLimitConstraintConf = .@"650Mhz",
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    CSICalibrationValue: CSICalibrationValueConf = @enumFromInt(16),
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSIDiv: ClockNode,
    HSEOSC: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    CSIRC: ClockNode,
    I2S_CKIN: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    MPUMult: ClockNode,
    MPUCLKOutput: ClockNode,
    CKPERMult: ClockNode,
    CKPERCLKOutput: ClockNode,
    AXIMult: ClockNode,
    AXICLKOutput: ClockNode,
    DACCLKOutput: ClockNode,
    AXIDIV: ClockNode,
    AXIOutput: ClockNode,
    Hclk5Output: ClockNode,
    Hclk6Output: ClockNode,
    APB4DIV: ClockNode,
    APB4DIVOutput: ClockNode,
    APB5DIV: ClockNode,
    APB5DIVOutput: ClockNode,
    APB6DIV: ClockNode,
    Tim3Mul: ClockNode,
    Tim3Output: ClockNode,
    APB6DIVOutput: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    MLAHBDIV: ClockNode,
    MLAHBClockOutput: ClockNode,
    APB3DIV: ClockNode,
    APB3Output: ClockNode,
    APB1DIV: ClockNode,
    Tim1Mul: ClockNode,
    Tim1Output: ClockNode,
    AHBOutput: ClockNode,
    APB1Output: ClockNode,
    APB2DIV: ClockNode,
    Tim2Mul: ClockNode,
    Tim2Output: ClockNode,
    APB2Output: ClockNode,
    DFSDM1Output: ClockNode,
    PLL12Source: ClockNode,
    DIVM1: ClockNode,
    DIVM2: ClockNode,
    PLL3Source: ClockNode,
    DIVM3: ClockNode,
    PLL4Source: ClockNode,
    DIVM4: ClockNode,
    MPUDIV: ClockNode,
    FreqCk1: ClockNode,
    DIVN1: ClockNode,
    PLL1FRACV: ClockNode,
    DIVN1Mul2Div2: ClockNode,
    DIVP1: ClockNode,
    DIVQ1: ClockNode,
    DIVQ1output: ClockNode,
    DIVR1: ClockNode,
    DIVR1output: ClockNode,
    FreqCk2: ClockNode,
    DIVN2: ClockNode,
    PLL2FRACV: ClockNode,
    DIVN2Mul2Div2: ClockNode,
    DIVP2: ClockNode,
    DIVQ2: ClockNode,
    DIVQ2output: ClockNode,
    DIVR2: ClockNode,
    DIVR2output: ClockNode,
    DIVN3: ClockNode,
    PLL3FRACV: ClockNode,
    DIVP3: ClockNode,
    DIVQ3: ClockNode,
    DIVQ3output: ClockNode,
    DIVR3: ClockNode,
    DIVR3output: ClockNode,
    DIVN4: ClockNode,
    PLL4FRACV: ClockNode,
    DIVP4: ClockNode,
    DIVP4output: ClockNode,
    DIVQ4: ClockNode,
    DIVQ4output: ClockNode,
    DIVR4: ClockNode,
    DIVR4output: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    I2C12Mult: ClockNode,
    I2C12output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3output: ClockNode,
    I2C4Mult: ClockNode,
    I2C4output: ClockNode,
    I2C5Mult: ClockNode,
    I2C5output: ClockNode,
    SPDIFMult: ClockNode,
    SPDIFoutput: ClockNode,
    QSPIMult: ClockNode,
    QSPIoutput: ClockNode,
    FMCMult: ClockNode,
    FMCoutput: ClockNode,
    SDMMC1Mult: ClockNode,
    SDMMC1output: ClockNode,
    SDMMC2Mult: ClockNode,
    SDMMC2output: ClockNode,
    STGENMult: ClockNode,
    STGENoutput: ClockNode,
    LPTIM45Mult: ClockNode,
    LPTIM45output: ClockNode,
    LPTIM2Mult: ClockNode,
    LPTIM2output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART2Mult: ClockNode,
    USART2output: ClockNode,
    USART35Mult: ClockNode,
    USART35output: ClockNode,
    USART6Mult: ClockNode,
    USART6output: ClockNode,
    UART78Mult: ClockNode,
    USART78output: ClockNode,
    RNG1Mult: ClockNode,
    RNG1output: ClockNode,
    SAESMult: ClockNode,
    SAESoutput: ClockNode,
    LPTIM3Mult: ClockNode,
    LPTIM3output: ClockNode,
    SPI4Mult: ClockNode,
    SPI4output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    USART4Mult: ClockNode,
    USART4output: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI23Mult: ClockNode,
    SPI23output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    DFSDF1Audiooutput: ClockNode,
    SPI5Mult: ClockNode,
    SPI5output: ClockNode,
    FDCANMult: ClockNode,
    FDCANoutput: ClockNode,
    ETH1Mult: ClockNode,
    ETH1output: ClockNode,
    ETH2Mult: ClockNode,
    ETH2output: ClockNode,
    ADC2Mult: ClockNode,
    ADC2output: ClockNode,
    ADC1Mult: ClockNode,
    ADC1output: ClockNode,
    DDRPHYC: ClockNode,
    PUBL: ClockNode,
    DDRC: ClockNode,
    DDRPERFM: ClockNode,
    HSEUSBPHYDevisor: ClockNode,
    USBPHYCLKMux: ClockNode,
    USBPHYCLKOutput: ClockNode,
    USBPHYRC: ClockNode,
    USBOCLKMux: ClockNode,
    USBOFSCLKOutput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    RCC_TIM_G1_PRescaler_Selection: ClockNodeTypes,
    RCC_TIM_G2_PRescaler_Selection: ClockNodeTypes,
    RCC_TIM_G3_PRescaler_Selection: ClockNodeTypes,
    MPUMaxLimitConstraint: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    CSICalibrationValue: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSIDivval = ClockNodeTypes{ .div = .{ .value = config.HSIDiv.get() } };
        const HSIDiv: ClockNode = .{
            .name = "HSIDiv",
            .Nodetype = HSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 48000000, .min = 8000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const CSIRCval = ClockNodeTypes{
            .source = .{ .value = 4000000 },
        };
        const CSIRC: ClockNode = .{
            .name = "CSIRC",
            .Nodetype = CSIRCval,
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
        };
        const PLL3Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL3Source) };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",
            .Nodetype = PLL3Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const DIVM3val = ClockNodeTypes{
            .div = .{
                .value = config.DIVM3.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const DIVM3: ClockNode = .{
            .name = "DIVM3",
            .Nodetype = DIVM3val,
            .parents = &[_]*const ClockNode{&PLL3Source},
        };
        const PLL3FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL3FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLL3FRACV: ClockNode = .{
            .name = "PLL3FRACV",
            .Nodetype = PLL3FRACVval,
        };
        const DIVN3val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.DIVN3.get(),
                .limit = .{ .max = 200, .min = 25 },
            },
        };
        const DIVN3: ClockNode = .{
            .name = "DIVN3",
            .Nodetype = DIVN3val,
            .parents = &[_]*const ClockNode{ &DIVM3, &PLL3FRACV },
        };
        const DIVP3val = ClockNodeTypes{
            .div = .{
                .value = config.DIVP3.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVP3: ClockNode = .{
            .name = "DIVP3",
            .Nodetype = DIVP3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &DIVP3,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 209000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PLL12Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL12Source) };
        const PLL12Source: ClockNode = .{
            .name = "PLL12Source",
            .Nodetype = PLL12Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
            },
        };
        const DIVM1val = ClockNodeTypes{
            .div = .{
                .value = config.DIVM1.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const DIVM1: ClockNode = .{
            .name = "DIVM1",
            .Nodetype = DIVM1val,
            .parents = &[_]*const ClockNode{&PLL12Source},
        };
        const FreqCk1val = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        const FreqCk1: ClockNode = .{
            .name = "FreqCk1",
            .Nodetype = FreqCk1val,
            .parents = &[_]*const ClockNode{&DIVM1},
        };
        const PLL1FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL1FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLL1FRACV: ClockNode = .{
            .name = "PLL1FRACV",
            .Nodetype = PLL1FRACVval,
        };
        const DIVN1val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.DIVN1.get(),
                .limit = .{ .max = 100, .min = 25 },
            },
        };
        const DIVN1: ClockNode = .{
            .name = "DIVN1",
            .Nodetype = DIVN1val,
            .parents = &[_]*const ClockNode{ &FreqCk1, &PLL1FRACV },
        };
        const DIVN1Mul2Div2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const DIVN1Mul2Div2: ClockNode = .{
            .name = "DIVN1Mul2Div2",
            .Nodetype = DIVN1Mul2Div2val,
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVP1val = ClockNodeTypes{
            .div = .{
                .value = config.DIVP1.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVP1: ClockNode = .{
            .name = "DIVP1",
            .Nodetype = DIVP1val,
            .parents = &[_]*const ClockNode{&DIVN1Mul2Div2},
        };
        const MPUDIVval = ClockNodeTypes{ .div = .{ .value = config.MPUDIV.get() } };
        const MPUDIV: ClockNode = .{
            .name = "MPUDIV",
            .Nodetype = MPUDIVval,
            .parents = &[_]*const ClockNode{&DIVP1},
        };
        const MPUMultval = ClockNodeTypes{ .multi = @intFromEnum(config.MPUMult) };
        const MPUMult: ClockNode = .{
            .name = "MPUMult",
            .Nodetype = MPUMultval,

            .parents = &[_]*const ClockNode{
                &DIVP1,
                &MPUDIV,
                &HSEOSC,
                &HSIDiv,
            },
        };
        const MPUCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 650000000, .min = 0 },
        };
        const MPUCLKOutput: ClockNode = .{
            .name = "MPUCLKOutput",
            .Nodetype = MPUCLKOutputval,
            .parents = &[_]*const ClockNode{&MPUMult},
        };
        const CKPERMultval = ClockNodeTypes{ .multi = @intFromEnum(config.CKPERMult) };
        const CKPERMult: ClockNode = .{
            .name = "CKPERMult",
            .Nodetype = CKPERMultval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const CKPERCLKOutputval = ClockNodeTypes{ .output = null };
        const CKPERCLKOutput: ClockNode = .{
            .name = "CKPERCLKOutput",
            .Nodetype = CKPERCLKOutputval,
            .parents = &[_]*const ClockNode{&CKPERMult},
        };
        const DIVM2val = ClockNodeTypes{
            .div = .{
                .value = config.DIVM2.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const DIVM2: ClockNode = .{
            .name = "DIVM2",
            .Nodetype = DIVM2val,
            .parents = &[_]*const ClockNode{&PLL12Source},
        };
        const FreqCk2val = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        const FreqCk2: ClockNode = .{
            .name = "FreqCk2",
            .Nodetype = FreqCk2val,
            .parents = &[_]*const ClockNode{&DIVM2},
        };
        const PLL2FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL2FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLL2FRACV: ClockNode = .{
            .name = "PLL2FRACV",
            .Nodetype = PLL2FRACVval,
        };
        const DIVN2val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.DIVN2.get(),
                .limit = .{ .max = 100, .min = 25 },
            },
        };
        const DIVN2: ClockNode = .{
            .name = "DIVN2",
            .Nodetype = DIVN2val,
            .parents = &[_]*const ClockNode{ &FreqCk2, &PLL2FRACV },
        };
        const DIVN2Mul2Div2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const DIVN2Mul2Div2: ClockNode = .{
            .name = "DIVN2Mul2Div2",
            .Nodetype = DIVN2Mul2Div2val,
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVP2val = ClockNodeTypes{
            .div = .{
                .value = config.DIVP2.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVP2: ClockNode = .{
            .name = "DIVP2",
            .Nodetype = DIVP2val,
            .parents = &[_]*const ClockNode{&DIVN2Mul2Div2},
        };
        const AXIMultval = ClockNodeTypes{ .multi = @intFromEnum(config.AXIMult) };
        const AXIMult: ClockNode = .{
            .name = "AXIMult",
            .Nodetype = AXIMultval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &HSIDiv,
                &DIVP2,
            },
        };
        const AXICLKOutputval = ClockNodeTypes{
            .output = .{ .max = 266500000, .min = 0 },
        };
        const AXICLKOutput: ClockNode = .{
            .name = "AXICLKOutput",
            .Nodetype = AXICLKOutputval,
            .parents = &[_]*const ClockNode{&AXIMult},
        };
        const DACCLKOutputval = ClockNodeTypes{ .output = null };
        const DACCLKOutput: ClockNode = .{
            .name = "DACCLKOutput",
            .Nodetype = DACCLKOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const AXIDIVval = ClockNodeTypes{ .div = .{ .value = config.AXIDIV.get() } };
        const AXIDIV: ClockNode = .{
            .name = "AXIDIV",
            .Nodetype = AXIDIVval,
            .parents = &[_]*const ClockNode{&AXICLKOutput},
        };
        const AXIOutputval = ClockNodeTypes{
            .output = .{ .max = 266500000, .min = 0 },
        };
        const AXIOutput: ClockNode = .{
            .name = "AXIOutput",
            .Nodetype = AXIOutputval,
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const Hclk5Outputval = ClockNodeTypes{
            .output = .{ .max = 266500000, .min = 0 },
        };
        const Hclk5Output: ClockNode = .{
            .name = "Hclk5Output",
            .Nodetype = Hclk5Outputval,
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const Hclk6Outputval = ClockNodeTypes{
            .output = .{ .max = 266500000, .min = 0 },
        };
        const Hclk6Output: ClockNode = .{
            .name = "Hclk6Output",
            .Nodetype = Hclk6Outputval,
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const APB4DIVval = ClockNodeTypes{ .div = .{ .value = config.APB4DIV.get() } };
        const APB4DIV: ClockNode = .{
            .name = "APB4DIV",
            .Nodetype = APB4DIVval,
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const APB4DIVOutputval = ClockNodeTypes{
            .output = .{ .max = 133250000, .min = 0 },
        };
        const APB4DIVOutput: ClockNode = .{
            .name = "APB4DIVOutput",
            .Nodetype = APB4DIVOutputval,
            .parents = &[_]*const ClockNode{&APB4DIV},
        };
        const APB5DIVval = ClockNodeTypes{ .div = .{ .value = config.APB5DIV.get() } };
        const APB5DIV: ClockNode = .{
            .name = "APB5DIV",
            .Nodetype = APB5DIVval,
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const APB5DIVOutputval = ClockNodeTypes{
            .output = .{ .max = 67000000, .min = 0 },
        };
        const APB5DIVOutput: ClockNode = .{
            .name = "APB5DIVOutput",
            .Nodetype = APB5DIVOutputval,
            .parents = &[_]*const ClockNode{&APB5DIV},
        };
        const MLAHBDIVval = ClockNodeTypes{ .div = .{ .value = config.MLAHBDIV.get() } };
        const MLAHBDIV: ClockNode = .{
            .name = "MLAHBDIV",
            .Nodetype = MLAHBDIVval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const APB6DIVval = ClockNodeTypes{ .div = .{ .value = config.APB6DIV.get() } };
        const APB6DIV: ClockNode = .{
            .name = "APB6DIV",
            .Nodetype = APB6DIVval,
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const RCC_TIM_G3_PRescaler_Selectionval = ClockNodeTypes{
            .source = .{ .value = config.RCC_TIM_G3_PRescaler_Selection.get() },
        };
        const Tim3Mulval = blk: {
            if ((RCC_TIM_G3_PRescaler_Selectionval.num_val() == 1)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            } else if ((RCC_TIM_G3_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 4 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const Tim3Mul: ClockNode = .{
            .name = "Tim3Mul",
            .Nodetype = Tim3Mulval,
            .parents = &[_]*const ClockNode{&APB6DIV},
        };
        const Tim3Outputval = ClockNodeTypes{
            .output = .{ .max = 209000000, .min = 0 },
        };
        const Tim3Output: ClockNode = .{
            .name = "Tim3Output",
            .Nodetype = Tim3Outputval,
            .parents = &[_]*const ClockNode{&Tim3Mul},
        };
        const APB6DIVOutputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const APB6DIVOutput: ClockNode = .{
            .name = "APB6DIVOutput",
            .Nodetype = APB6DIVOutputval,
            .parents = &[_]*const ClockNode{&APB6DIV},
        };
        const MCO1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.MCO1Mult) };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",
            .Nodetype = MCO1Multval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
                &CSIRC,
                &LSIRC,
                &LSEOSC,
            },
        };
        const MCO1Divval = ClockNodeTypes{ .div = .{ .value = config.MCO1Div.get() } };
        const MCO1Div: ClockNode = .{
            .name = "MCO1Div",
            .Nodetype = MCO1Divval,
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO1Pinval = ClockNodeTypes{ .output = null };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = MCO1Pinval,
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const PLL4Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL4Source) };
        const PLL4Source: ClockNode = .{
            .name = "PLL4Source",
            .Nodetype = PLL4Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const DIVM4val = ClockNodeTypes{
            .div = .{
                .value = config.DIVM4.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const DIVM4: ClockNode = .{
            .name = "DIVM4",
            .Nodetype = DIVM4val,
            .parents = &[_]*const ClockNode{&PLL4Source},
        };
        const PLL4FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL4FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            },
        };
        const PLL4FRACV: ClockNode = .{
            .name = "PLL4FRACV",
            .Nodetype = PLL4FRACVval,
        };
        const DIVN4val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.DIVN4.get(),
                .limit = .{ .max = 200, .min = 25 },
            },
        };
        const DIVN4: ClockNode = .{
            .name = "DIVN4",
            .Nodetype = DIVN4val,
            .parents = &[_]*const ClockNode{ &DIVM4, &PLL4FRACV },
        };
        const DIVP4val = ClockNodeTypes{
            .div = .{
                .value = config.DIVP4.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVP4: ClockNode = .{
            .name = "DIVP4",
            .Nodetype = DIVP4val,
            .parents = &[_]*const ClockNode{&DIVN4},
        };
        const MCO2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.MCO2Mult) };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .Nodetype = MCO2Multval,

            .parents = &[_]*const ClockNode{
                &MPUCLKOutput,
                &AXIDIV,
                &SysCLKOutput,
                &DIVP4,
                &HSEOSC,
                &HSIDiv,
            },
        };
        const MCO2Divval = ClockNodeTypes{ .div = .{ .value = config.MCO2Div.get() } };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .Nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const MLAHBClockOutputval = ClockNodeTypes{
            .output = .{ .max = 209000000, .min = 0 },
        };
        const MLAHBClockOutput: ClockNode = .{
            .name = "MLAHBClockOutput",
            .Nodetype = MLAHBClockOutputval,
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const APB3DIVval = ClockNodeTypes{ .div = .{ .value = config.APB3DIV.get() } };
        const APB3DIV: ClockNode = .{
            .name = "APB3DIV",
            .Nodetype = APB3DIVval,
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const APB3Outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = APB3Outputval,
            .parents = &[_]*const ClockNode{&APB3DIV},
        };
        const APB1DIVval = ClockNodeTypes{ .div = .{ .value = config.APB1DIV.get() } };
        const APB1DIV: ClockNode = .{
            .name = "APB1DIV",
            .Nodetype = APB1DIVval,
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const RCC_TIM_G1_PRescaler_Selectionval = ClockNodeTypes{
            .source = .{ .value = config.RCC_TIM_G1_PRescaler_Selection.get() },
        };
        const Tim1Mulval = blk: {
            if ((RCC_TIM_G1_PRescaler_Selectionval.num_val() == 1)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            } else if ((RCC_TIM_G1_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 4 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const Tim1Mul: ClockNode = .{
            .name = "Tim1Mul",
            .Nodetype = Tim1Mulval,
            .parents = &[_]*const ClockNode{&APB1DIV},
        };
        const Tim1Outputval = ClockNodeTypes{
            .output = .{ .max = 209000000, .min = 0 },
        };
        const Tim1Output: ClockNode = .{
            .name = "Tim1Output",
            .Nodetype = Tim1Outputval,
            .parents = &[_]*const ClockNode{&Tim1Mul},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 209000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1DIV},
        };
        const APB2DIVval = ClockNodeTypes{ .div = .{ .value = config.APB2DIV.get() } };
        const APB2DIV: ClockNode = .{
            .name = "APB2DIV",
            .Nodetype = APB2DIVval,
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const RCC_TIM_G2_PRescaler_Selectionval = ClockNodeTypes{
            .source = .{ .value = config.RCC_TIM_G2_PRescaler_Selection.get() },
        };
        const Tim2Mulval = blk: {
            if ((RCC_TIM_G2_PRescaler_Selectionval.num_val() == 1)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            } else if ((RCC_TIM_G2_PRescaler_Selectionval.num_val() == 0)) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 4 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const Tim2Mul: ClockNode = .{
            .name = "Tim2Mul",
            .Nodetype = Tim2Mulval,
            .parents = &[_]*const ClockNode{&APB2DIV},
        };
        const Tim2Outputval = ClockNodeTypes{
            .output = .{ .max = 209000000, .min = 0 },
        };
        const Tim2Output: ClockNode = .{
            .name = "Tim2Output",
            .Nodetype = Tim2Outputval,
            .parents = &[_]*const ClockNode{&Tim2Mul},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2DIV},
        };
        const DFSDM1Outputval = ClockNodeTypes{ .output = null };
        const DFSDM1Output: ClockNode = .{
            .name = "DFSDM1Output",
            .Nodetype = DFSDM1Outputval,
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const DIVQ1val = ClockNodeTypes{
            .div = .{
                .value = config.DIVQ1.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVQ1: ClockNode = .{
            .name = "DIVQ1",
            .Nodetype = DIVQ1val,
            .parents = &[_]*const ClockNode{&DIVN1Mul2Div2},
        };
        const DIVQ1outputval = ClockNodeTypes{ .output = null };
        const DIVQ1output: ClockNode = .{
            .name = "DIVQ1output",
            .Nodetype = DIVQ1outputval,
            .parents = &[_]*const ClockNode{&DIVQ1},
        };
        const DIVR1val = ClockNodeTypes{
            .div = .{
                .value = config.DIVR1.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVR1: ClockNode = .{
            .name = "DIVR1",
            .Nodetype = DIVR1val,
            .parents = &[_]*const ClockNode{&DIVN1Mul2Div2},
        };
        const DIVR1outputval = ClockNodeTypes{ .output = null };
        const DIVR1output: ClockNode = .{
            .name = "DIVR1output",
            .Nodetype = DIVR1outputval,
            .parents = &[_]*const ClockNode{&DIVR1},
        };
        const DIVQ2val = ClockNodeTypes{
            .div = .{
                .value = config.DIVQ2.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVQ2: ClockNode = .{
            .name = "DIVQ2",
            .Nodetype = DIVQ2val,
            .parents = &[_]*const ClockNode{&DIVN2Mul2Div2},
        };
        const DIVQ2outputval = ClockNodeTypes{
            .output = .{ .max = 800000000, .min = 0 },
        };
        const DIVQ2output: ClockNode = .{
            .name = "DIVQ2output",
            .Nodetype = DIVQ2outputval,
            .parents = &[_]*const ClockNode{&DIVQ2},
        };
        const DIVR2val = ClockNodeTypes{
            .div = .{
                .value = config.DIVR2.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVR2: ClockNode = .{
            .name = "DIVR2",
            .Nodetype = DIVR2val,
            .parents = &[_]*const ClockNode{&DIVN2Mul2Div2},
        };
        const DIVR2outputval = ClockNodeTypes{ .output = null };
        const DIVR2output: ClockNode = .{
            .name = "DIVR2output",
            .Nodetype = DIVR2outputval,
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DIVQ3val = ClockNodeTypes{
            .div = .{
                .value = config.DIVQ3.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVQ3: ClockNode = .{
            .name = "DIVQ3",
            .Nodetype = DIVQ3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVQ3outputval = ClockNodeTypes{ .output = null };
        const DIVQ3output: ClockNode = .{
            .name = "DIVQ3output",
            .Nodetype = DIVQ3outputval,
            .parents = &[_]*const ClockNode{&DIVQ3},
        };
        const DIVR3val = ClockNodeTypes{
            .div = .{
                .value = config.DIVR3.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVR3: ClockNode = .{
            .name = "DIVR3",
            .Nodetype = DIVR3val,
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVR3outputval = ClockNodeTypes{ .output = null };
        const DIVR3output: ClockNode = .{
            .name = "DIVR3output",
            .Nodetype = DIVR3outputval,
            .parents = &[_]*const ClockNode{&DIVR3},
        };
        const DIVP4outputval = ClockNodeTypes{ .output = null };
        const DIVP4output: ClockNode = .{
            .name = "DIVP4output",
            .Nodetype = DIVP4outputval,
            .parents = &[_]*const ClockNode{&DIVP4},
        };
        const DIVQ4val = ClockNodeTypes{
            .div = .{
                .value = config.DIVQ4.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVQ4: ClockNode = .{
            .name = "DIVQ4",
            .Nodetype = DIVQ4val,
            .parents = &[_]*const ClockNode{&DIVN4},
        };
        const DIVQ4outputval = ClockNodeTypes{ .output = null };
        const DIVQ4output: ClockNode = .{
            .name = "DIVQ4output",
            .Nodetype = DIVQ4outputval,
            .parents = &[_]*const ClockNode{&DIVQ4},
        };
        const DIVR4val = ClockNodeTypes{
            .div = .{
                .value = config.DIVR4.get(),
                .limit = .{ .max = 128, .min = 1 },
            },
        };
        const DIVR4: ClockNode = .{
            .name = "DIVR4",
            .Nodetype = DIVR4val,
            .parents = &[_]*const ClockNode{&DIVN4},
        };
        const DIVR4outputval = ClockNodeTypes{ .output = null };
        const DIVR4output: ClockNode = .{
            .name = "DIVR4output",
            .Nodetype = DIVR4outputval,
            .parents = &[_]*const ClockNode{&DIVR4},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{
                .value = config.HSERTCDevisor.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.RTCClkSource) };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",
            .Nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = 4000000, .min = 0 },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const I2C12Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C12Mult) };
        const I2C12Mult: ClockNode = .{
            .name = "I2C12Mult",
            .Nodetype = I2C12Multval,

            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C12outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const I2C12output: ClockNode = .{
            .name = "I2C12output",
            .Nodetype = I2C12outputval,
            .parents = &[_]*const ClockNode{&I2C12Mult},
        };
        const I2C3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C3Mult) };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C3outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = I2C3outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2C4Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C4Mult) };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",
            .Nodetype = I2C4Multval,

            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C4outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = I2C4outputval,
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const I2C5Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C5Mult) };
        const I2C5Mult: ClockNode = .{
            .name = "I2C5Mult",
            .Nodetype = I2C5Multval,

            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C5outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const I2C5output: ClockNode = .{
            .name = "I2C5output",
            .Nodetype = I2C5outputval,
            .parents = &[_]*const ClockNode{&I2C5Mult},
        };
        const SPDIFMultval = ClockNodeTypes{ .multi = @intFromEnum(config.SPDIFMult) };
        const SPDIFMult: ClockNode = .{
            .name = "SPDIFMult",
            .Nodetype = SPDIFMultval,

            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
                &HSIDiv,
            },
        };
        const SPDIFoutputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .Nodetype = SPDIFoutputval,
            .parents = &[_]*const ClockNode{&SPDIFMult},
        };
        const QSPIMultval = ClockNodeTypes{ .multi = @intFromEnum(config.QSPIMult) };
        const QSPIMult: ClockNode = .{
            .name = "QSPIMult",
            .Nodetype = QSPIMultval,

            .parents = &[_]*const ClockNode{
                &AXIOutput,
                &DIVP4,
                &DIVR3,
                &CKPERCLKOutput,
            },
        };
        const QSPIoutputval = ClockNodeTypes{
            .output = .{ .max = 266500000, .min = 0 },
        };
        const QSPIoutput: ClockNode = .{
            .name = "QSPIoutput",
            .Nodetype = QSPIoutputval,
            .parents = &[_]*const ClockNode{&QSPIMult},
        };
        const FMCMultval = ClockNodeTypes{ .multi = @intFromEnum(config.FMCMult) };
        const FMCMult: ClockNode = .{
            .name = "FMCMult",
            .Nodetype = FMCMultval,

            .parents = &[_]*const ClockNode{
                &AXIOutput,
                &DIVR3,
                &DIVP4,
                &CKPERCLKOutput,
            },
        };
        const FMCoutputval = ClockNodeTypes{
            .output = .{ .max = 266500000, .min = 0 },
        };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .Nodetype = FMCoutputval,
            .parents = &[_]*const ClockNode{&FMCMult},
        };
        const SDMMC1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SDMMC1Mult) };
        const SDMMC1Mult: ClockNode = .{
            .name = "SDMMC1Mult",
            .Nodetype = SDMMC1Multval,

            .parents = &[_]*const ClockNode{
                &Hclk6Output,
                &DIVR3,
                &DIVP4,
                &HSIDiv,
            },
        };
        const SDMMC1outputval = ClockNodeTypes{
            .output = .{ .max = 266000000, .min = 0 },
        };
        const SDMMC1output: ClockNode = .{
            .name = "SDMMC1output",
            .Nodetype = SDMMC1outputval,
            .parents = &[_]*const ClockNode{&SDMMC1Mult},
        };
        const SDMMC2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SDMMC2Mult) };
        const SDMMC2Mult: ClockNode = .{
            .name = "SDMMC2Mult",
            .Nodetype = SDMMC2Multval,

            .parents = &[_]*const ClockNode{
                &Hclk6Output,
                &DIVR3,
                &DIVP4,
                &HSIDiv,
            },
        };
        const SDMMC2outputval = ClockNodeTypes{
            .output = .{ .max = 266000000, .min = 0 },
        };
        const SDMMC2output: ClockNode = .{
            .name = "SDMMC2output",
            .Nodetype = SDMMC2outputval,
            .parents = &[_]*const ClockNode{&SDMMC2Mult},
        };
        const STGENMultval = ClockNodeTypes{ .multi = @intFromEnum(config.STGENMult) };
        const STGENMult: ClockNode = .{
            .name = "STGENMult",
            .Nodetype = STGENMultval,

            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
            },
        };
        const STGENoutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const STGENoutput: ClockNode = .{
            .name = "STGENoutput",
            .Nodetype = STGENoutputval,
            .parents = &[_]*const ClockNode{&STGENMult},
        };
        const LPTIM45Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM45Mult) };
        const LPTIM45Mult: ClockNode = .{
            .name = "LPTIM45Mult",
            .Nodetype = LPTIM45Multval,

            .parents = &[_]*const ClockNode{
                &APB3DIV,
                &DIVP4,
                &DIVQ3,
                &LSEOSC,
                &LSIRC,
                &CKPERCLKOutput,
            },
        };
        const LPTIM45outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const LPTIM45output: ClockNode = .{
            .name = "LPTIM45output",
            .Nodetype = LPTIM45outputval,
            .parents = &[_]*const ClockNode{&LPTIM45Mult},
        };
        const LPTIM2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM2Mult) };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .Nodetype = LPTIM2Multval,

            .parents = &[_]*const ClockNode{
                &APB3DIV,
                &DIVQ4,
                &CKPERCLKOutput,
                &LSEOSC,
                &LSIRC,
            },
        };
        const LPTIM2outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const LPTIM1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM1Mult) };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .Nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVP4,
                &DIVQ3,
                &LSEOSC,
                &LSIRC,
                &CKPERCLKOutput,
            },
        };
        const LPTIM1outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const USART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART1Mult) };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &DIVQ3,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART1outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART2Mult) };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .Nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
                &DIVQ3,
            },
        };
        const USART2outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = USART2outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART35Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART35Mult) };
        const USART35Mult: ClockNode = .{
            .name = "USART35Mult",
            .Nodetype = USART35Multval,

            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART35outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const USART35output: ClockNode = .{
            .name = "USART35output",
            .Nodetype = USART35outputval,
            .parents = &[_]*const ClockNode{&USART35Mult},
        };
        const USART6Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART6Mult) };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",
            .Nodetype = USART6Multval,

            .parents = &[_]*const ClockNode{
                &APB2DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART6outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = USART6outputval,
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const UART78Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART78Mult) };
        const UART78Mult: ClockNode = .{
            .name = "UART78Mult",
            .Nodetype = UART78Multval,

            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART78outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const USART78output: ClockNode = .{
            .name = "USART78output",
            .Nodetype = USART78outputval,
            .parents = &[_]*const ClockNode{&UART78Mult},
        };
        const RNG1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.RNG1Mult) };
        const RNG1Mult: ClockNode = .{
            .name = "RNG1Mult",
            .Nodetype = RNG1Multval,

            .parents = &[_]*const ClockNode{
                &CSIRC,
                &DIVR4,
                &LSIRC,
            },
        };
        const RNG1outputval = ClockNodeTypes{
            .output = .{ .max = 360000000, .min = 0 },
        };
        const RNG1output: ClockNode = .{
            .name = "RNG1output",
            .Nodetype = RNG1outputval,
            .parents = &[_]*const ClockNode{&RNG1Mult},
        };
        const SAESMultval = ClockNodeTypes{ .multi = @intFromEnum(config.SAESMult) };
        const SAESMult: ClockNode = .{
            .name = "SAESMult",
            .Nodetype = SAESMultval,

            .parents = &[_]*const ClockNode{
                &AXIOutput,
                &CKPERCLKOutput,
                &DIVR4,
                &LSIRC,
            },
        };
        const SAESoutputval = ClockNodeTypes{
            .output = .{ .max = 360000000, .min = 0 },
        };
        const SAESoutput: ClockNode = .{
            .name = "SAESoutput",
            .Nodetype = SAESoutputval,
            .parents = &[_]*const ClockNode{&SAESMult},
        };
        const LPTIM3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.LPTIM3Mult) };
        const LPTIM3Mult: ClockNode = .{
            .name = "LPTIM3Mult",
            .Nodetype = LPTIM3Multval,

            .parents = &[_]*const ClockNode{
                &APB3DIV,
                &DIVQ4,
                &CKPERCLKOutput,
                &LSEOSC,
                &LSIRC,
            },
        };
        const LPTIM3outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .Nodetype = LPTIM3outputval,
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const SPI4Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI4Mult) };
        const SPI4Mult: ClockNode = .{
            .name = "SPI4Mult",
            .Nodetype = SPI4Multval,

            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const SPI4outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const SPI4output: ClockNode = .{
            .name = "SPI4output",
            .Nodetype = SPI4outputval,
            .parents = &[_]*const ClockNode{&SPI4Mult},
        };
        const SAI2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SAI2Mult) };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",
            .Nodetype = SAI2Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &SPDIFMult,
                &DIVR3,
            },
        };
        const SAI2outputval = ClockNodeTypes{
            .output = .{ .max = 133250000, .min = 0 },
        };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = SAI2outputval,
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const USART4Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART4Mult) };
        const USART4Mult: ClockNode = .{
            .name = "USART4Mult",
            .Nodetype = USART4Multval,

            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART4outputval = ClockNodeTypes{
            .output = .{ .max = 104500000, .min = 0 },
        };
        const USART4output: ClockNode = .{
            .name = "USART4output",
            .Nodetype = USART4outputval,
            .parents = &[_]*const ClockNode{&USART4Mult},
        };
        const SPI1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI1Mult) };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",
            .Nodetype = SPI1Multval,

            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SPI1outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = SPI1outputval,
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI23Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI23Mult) };
        const SPI23Mult: ClockNode = .{
            .name = "SPI23Mult",
            .Nodetype = SPI23Multval,

            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SPI23outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPI23output: ClockNode = .{
            .name = "SPI23output",
            .Nodetype = SPI23outputval,
            .parents = &[_]*const ClockNode{&SPI23Mult},
        };
        const SAI1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SAI1Mult) };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",
            .Nodetype = SAI1Multval,

            .parents = &[_]*const ClockNode{
                &DIVQ4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SAI1outputval = ClockNodeTypes{
            .output = .{ .max = 133250000, .min = 0 },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const DFSDF1Audiooutputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const DFSDF1Audiooutput: ClockNode = .{
            .name = "DFSDF1Audiooutput",
            .Nodetype = DFSDF1Audiooutputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SPI5Multval = ClockNodeTypes{ .multi = @intFromEnum(config.SPI5Mult) };
        const SPI5Mult: ClockNode = .{
            .name = "SPI5Mult",
            .Nodetype = SPI5Multval,

            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI5outputval = ClockNodeTypes{
            .output = .{ .max = 133250000, .min = 0 },
        };
        const SPI5output: ClockNode = .{
            .name = "SPI5output",
            .Nodetype = SPI5outputval,
            .parents = &[_]*const ClockNode{&SPI5Mult},
        };
        const FDCANMultval = ClockNodeTypes{ .multi = @intFromEnum(config.FDCANMult) };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",
            .Nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &DIVQ3,
                &DIVQ4,
                &DIVR4,
            },
        };
        const FDCANoutputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .Nodetype = FDCANoutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const ETH1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.ETH1Mult) };
        const ETH1Mult: ClockNode = .{
            .name = "ETH1Mult",
            .Nodetype = ETH1Multval,

            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
            },
        };
        const ETH1outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const ETH1output: ClockNode = .{
            .name = "ETH1output",
            .Nodetype = ETH1outputval,
            .parents = &[_]*const ClockNode{&ETH1Mult},
        };
        const ETH2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.ETH2Mult) };
        const ETH2Mult: ClockNode = .{
            .name = "ETH2Mult",
            .Nodetype = ETH2Multval,

            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
            },
        };
        const ETH2outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const ETH2output: ClockNode = .{
            .name = "ETH2output",
            .Nodetype = ETH2outputval,
            .parents = &[_]*const ClockNode{&ETH2Mult},
        };
        const ADC2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.ADC2Mult) };
        const ADC2Mult: ClockNode = .{
            .name = "ADC2Mult",
            .Nodetype = ADC2Multval,

            .parents = &[_]*const ClockNode{
                &DIVR4,
                &CKPERCLKOutput,
                &DIVQ3,
            },
        };
        const ADC2outputval = ClockNodeTypes{
            .output = .{ .max = 133250000, .min = 0 },
        };
        const ADC2output: ClockNode = .{
            .name = "ADC2output",
            .Nodetype = ADC2outputval,
            .parents = &[_]*const ClockNode{&ADC2Mult},
        };
        const ADC1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.ADC1Mult) };
        const ADC1Mult: ClockNode = .{
            .name = "ADC1Mult",
            .Nodetype = ADC1Multval,

            .parents = &[_]*const ClockNode{
                &DIVR4,
                &CKPERCLKOutput,
                &DIVQ3,
            },
        };
        const ADC1outputval = ClockNodeTypes{
            .output = .{ .max = 133250000, .min = 0 },
        };
        const ADC1output: ClockNode = .{
            .name = "ADC1output",
            .Nodetype = ADC1outputval,
            .parents = &[_]*const ClockNode{&ADC1Mult},
        };
        const DDRPHYCval = ClockNodeTypes{ .output = null };
        const DDRPHYC: ClockNode = .{
            .name = "DDRPHYC",
            .Nodetype = DDRPHYCval,
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const PUBLval = ClockNodeTypes{ .output = null };
        const PUBL: ClockNode = .{
            .name = "PUBL",
            .Nodetype = PUBLval,
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DDRCval = ClockNodeTypes{ .output = null };
        const DDRC: ClockNode = .{
            .name = "DDRC",
            .Nodetype = DDRCval,
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DDRPERFMval = ClockNodeTypes{ .output = null };
        const DDRPERFM: ClockNode = .{
            .name = "DDRPERFM",
            .Nodetype = DDRPERFMval,
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const HSEUSBPHYDevisorval = ClockNodeTypes{ .div = .{ .value = config.HSEUSBPHYDevisor.get() } };
        const HSEUSBPHYDevisor: ClockNode = .{
            .name = "HSEUSBPHYDevisor",
            .Nodetype = HSEUSBPHYDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const USBPHYCLKMuxval = ClockNodeTypes{ .multi = @intFromEnum(config.USBPHYCLKMux) };
        const USBPHYCLKMux: ClockNode = .{
            .name = "USBPHYCLKMux",
            .Nodetype = USBPHYCLKMuxval,

            .parents = &[_]*const ClockNode{
                &HSEUSBPHYDevisor,
                &HSEOSC,
                &DIVR4,
            },
        };
        const USBPHYCLKOutputval = ClockNodeTypes{ .output = null };
        const USBPHYCLKOutput: ClockNode = .{
            .name = "USBPHYCLKOutput",
            .Nodetype = USBPHYCLKOutputval,
            .parents = &[_]*const ClockNode{&USBPHYCLKMux},
        };
        const USBPHYRCval = ClockNodeTypes{
            .source = .{ .value = 48000000 },
        };
        const USBPHYRC: ClockNode = .{
            .name = "USBPHYRC",
            .Nodetype = USBPHYRCval,
        };
        const USBOCLKMuxval = ClockNodeTypes{ .multi = @intFromEnum(config.USBOCLKMux) };
        const USBOCLKMux: ClockNode = .{
            .name = "USBOCLKMux",
            .Nodetype = USBOCLKMuxval,

            .parents = &[_]*const ClockNode{
                &DIVR4,
                &USBPHYRC,
            },
        };
        const USBOFSCLKOutputval = ClockNodeTypes{ .output = null };
        const USBOFSCLKOutput: ClockNode = .{
            .name = "USBOFSCLKOutput",
            .Nodetype = USBOFSCLKOutputval,
            .parents = &[_]*const ClockNode{&USBOCLKMux},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.HSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.LSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const MPUMaxLimitConstraintval = ClockNodeTypes{
            .source = .{ .value = config.MPUMaxLimitConstraint.get() },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.HSICalibrationValue.get(),
                .limit = .{ .max = 127, .min = 0 },
            },
        };
        const CSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.CSICalibrationValue.get(),
                .limit = .{ .max = 31, .min = 0 },
            },
        };
        return .{
            .HSIRC = HSIRC,
            .HSIDiv = HSIDiv,
            .HSEOSC = HSEOSC,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .CSIRC = CSIRC,
            .I2S_CKIN = I2S_CKIN,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .MPUMult = MPUMult,
            .MPUCLKOutput = MPUCLKOutput,
            .CKPERMult = CKPERMult,
            .CKPERCLKOutput = CKPERCLKOutput,
            .AXIMult = AXIMult,
            .AXICLKOutput = AXICLKOutput,
            .DACCLKOutput = DACCLKOutput,
            .AXIDIV = AXIDIV,
            .AXIOutput = AXIOutput,
            .Hclk5Output = Hclk5Output,
            .Hclk6Output = Hclk6Output,
            .APB4DIV = APB4DIV,
            .APB4DIVOutput = APB4DIVOutput,
            .APB5DIV = APB5DIV,
            .APB5DIVOutput = APB5DIVOutput,
            .APB6DIV = APB6DIV,
            .Tim3Mul = Tim3Mul,
            .Tim3Output = Tim3Output,
            .APB6DIVOutput = APB6DIVOutput,
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .MLAHBDIV = MLAHBDIV,
            .MLAHBClockOutput = MLAHBClockOutput,
            .APB3DIV = APB3DIV,
            .APB3Output = APB3Output,
            .APB1DIV = APB1DIV,
            .Tim1Mul = Tim1Mul,
            .Tim1Output = Tim1Output,
            .AHBOutput = AHBOutput,
            .APB1Output = APB1Output,
            .APB2DIV = APB2DIV,
            .Tim2Mul = Tim2Mul,
            .Tim2Output = Tim2Output,
            .APB2Output = APB2Output,
            .DFSDM1Output = DFSDM1Output,
            .PLL12Source = PLL12Source,
            .DIVM1 = DIVM1,
            .DIVM2 = DIVM2,
            .PLL3Source = PLL3Source,
            .DIVM3 = DIVM3,
            .PLL4Source = PLL4Source,
            .DIVM4 = DIVM4,
            .MPUDIV = MPUDIV,
            .FreqCk1 = FreqCk1,
            .DIVN1 = DIVN1,
            .PLL1FRACV = PLL1FRACV,
            .DIVN1Mul2Div2 = DIVN1Mul2Div2,
            .DIVP1 = DIVP1,
            .DIVQ1 = DIVQ1,
            .DIVQ1output = DIVQ1output,
            .DIVR1 = DIVR1,
            .DIVR1output = DIVR1output,
            .FreqCk2 = FreqCk2,
            .DIVN2 = DIVN2,
            .PLL2FRACV = PLL2FRACV,
            .DIVN2Mul2Div2 = DIVN2Mul2Div2,
            .DIVP2 = DIVP2,
            .DIVQ2 = DIVQ2,
            .DIVQ2output = DIVQ2output,
            .DIVR2 = DIVR2,
            .DIVR2output = DIVR2output,
            .DIVN3 = DIVN3,
            .PLL3FRACV = PLL3FRACV,
            .DIVP3 = DIVP3,
            .DIVQ3 = DIVQ3,
            .DIVQ3output = DIVQ3output,
            .DIVR3 = DIVR3,
            .DIVR3output = DIVR3output,
            .DIVN4 = DIVN4,
            .PLL4FRACV = PLL4FRACV,
            .DIVP4 = DIVP4,
            .DIVP4output = DIVP4output,
            .DIVQ4 = DIVQ4,
            .DIVQ4output = DIVQ4output,
            .DIVR4 = DIVR4,
            .DIVR4output = DIVR4output,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .I2C12Mult = I2C12Mult,
            .I2C12output = I2C12output,
            .I2C3Mult = I2C3Mult,
            .I2C3output = I2C3output,
            .I2C4Mult = I2C4Mult,
            .I2C4output = I2C4output,
            .I2C5Mult = I2C5Mult,
            .I2C5output = I2C5output,
            .SPDIFMult = SPDIFMult,
            .SPDIFoutput = SPDIFoutput,
            .QSPIMult = QSPIMult,
            .QSPIoutput = QSPIoutput,
            .FMCMult = FMCMult,
            .FMCoutput = FMCoutput,
            .SDMMC1Mult = SDMMC1Mult,
            .SDMMC1output = SDMMC1output,
            .SDMMC2Mult = SDMMC2Mult,
            .SDMMC2output = SDMMC2output,
            .STGENMult = STGENMult,
            .STGENoutput = STGENoutput,
            .LPTIM45Mult = LPTIM45Mult,
            .LPTIM45output = LPTIM45output,
            .LPTIM2Mult = LPTIM2Mult,
            .LPTIM2output = LPTIM2output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART2Mult = USART2Mult,
            .USART2output = USART2output,
            .USART35Mult = USART35Mult,
            .USART35output = USART35output,
            .USART6Mult = USART6Mult,
            .USART6output = USART6output,
            .UART78Mult = UART78Mult,
            .USART78output = USART78output,
            .RNG1Mult = RNG1Mult,
            .RNG1output = RNG1output,
            .SAESMult = SAESMult,
            .SAESoutput = SAESoutput,
            .LPTIM3Mult = LPTIM3Mult,
            .LPTIM3output = LPTIM3output,
            .SPI4Mult = SPI4Mult,
            .SPI4output = SPI4output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .USART4Mult = USART4Mult,
            .USART4output = USART4output,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI23Mult = SPI23Mult,
            .SPI23output = SPI23output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .DFSDF1Audiooutput = DFSDF1Audiooutput,
            .SPI5Mult = SPI5Mult,
            .SPI5output = SPI5output,
            .FDCANMult = FDCANMult,
            .FDCANoutput = FDCANoutput,
            .ETH1Mult = ETH1Mult,
            .ETH1output = ETH1output,
            .ETH2Mult = ETH2Mult,
            .ETH2output = ETH2output,
            .ADC2Mult = ADC2Mult,
            .ADC2output = ADC2output,
            .ADC1Mult = ADC1Mult,
            .ADC1output = ADC1output,
            .DDRPHYC = DDRPHYC,
            .PUBL = PUBL,
            .DDRC = DDRC,
            .DDRPERFM = DDRPERFM,
            .HSEUSBPHYDevisor = HSEUSBPHYDevisor,
            .USBPHYCLKMux = USBPHYCLKMux,
            .USBPHYCLKOutput = USBPHYCLKOutput,
            .USBPHYRC = USBPHYRC,
            .USBOCLKMux = USBOCLKMux,
            .USBOFSCLKOutput = USBOFSCLKOutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .RCC_TIM_G1_PRescaler_Selection = RCC_TIM_G1_PRescaler_Selectionval,
            .RCC_TIM_G2_PRescaler_Selection = RCC_TIM_G2_PRescaler_Selectionval,
            .RCC_TIM_G3_PRescaler_Selection = RCC_TIM_G3_PRescaler_Selectionval,
            .MPUMaxLimitConstraint = MPUMaxLimitConstraintval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
            .HSICalibrationValue = HSICalibrationValueval,
            .CSICalibrationValue = CSICalibrationValueval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.SysCLKOutput.get_comptime();
        _ = self.MPUCLKOutput.get_comptime();
        _ = self.CKPERCLKOutput.get_comptime();
        _ = self.AXICLKOutput.get_comptime();
        _ = self.AXIOutput.get_comptime();
        _ = self.Hclk5Output.get_comptime();
        _ = self.Hclk6Output.get_comptime();
        _ = self.APB4DIVOutput.get_comptime();
        _ = self.APB5DIVOutput.get_comptime();
        _ = self.Tim3Output.get_comptime();
        _ = self.APB6DIVOutput.get_comptime();
        _ = self.MLAHBClockOutput.get_comptime();
        _ = self.APB3Output.get_comptime();
        _ = self.Tim1Output.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.Tim2Output.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.DFSDM1Output.get_comptime();
        _ = self.DIVQ2output.get_comptime();
        _ = self.I2C12output.get_comptime();
        _ = self.I2C3output.get_comptime();
        _ = self.I2C4output.get_comptime();
        _ = self.I2C5output.get_comptime();
        _ = self.SPDIFoutput.get_comptime();
        _ = self.QSPIoutput.get_comptime();
        _ = self.FMCoutput.get_comptime();
        _ = self.SDMMC1output.get_comptime();
        _ = self.SDMMC2output.get_comptime();
        _ = self.STGENoutput.get_comptime();
        _ = self.LPTIM45output.get_comptime();
        _ = self.LPTIM2output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART2output.get_comptime();
        _ = self.USART35output.get_comptime();
        _ = self.USART6output.get_comptime();
        _ = self.USART78output.get_comptime();
        _ = self.RNG1output.get_comptime();
        _ = self.SAESoutput.get_comptime();
        _ = self.LPTIM3output.get_comptime();
        _ = self.SPI4output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.USART4output.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI23output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.DFSDF1Audiooutput.get_comptime();
        _ = self.SPI5output.get_comptime();
        _ = self.FDCANoutput.get_comptime();
        _ = self.ETH1output.get_comptime();
        _ = self.ETH2output.get_comptime();
        _ = self.ADC2output.get_comptime();
        _ = self.ADC1output.get_comptime();
        _ = self.DDRC.get_comptime();
        _ = self.DDRPERFM.get_comptime();
        _ = self.USBPHYCLKOutput.get_comptime();
        _ = self.USBOFSCLKOutput.get_comptime();
    }
};
