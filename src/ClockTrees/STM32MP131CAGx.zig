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
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
        };
    }
};
pub const APB4DIVConf = enum {
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
pub const APB5DIVConf = enum {
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
pub const APB6DIVConf = enum {
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
pub const MCO1MultConf = enum {
    HSIDiv,
    HSEOSC,
    CSIRC,
    LSIRC,
    LSEOSC,
};
pub const MCO1DivConf = enum {
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
    MPUCLKOutput,
    AXIDIV,
    SysCLKOutput,
    DIVP4,
    HSEOSC,
    HSIDiv,
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
pub const MLAHBDIVConf = enum {
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
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
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
            .DIV256 => 256,
            .DIV512 => 512,
        };
    }
};
pub const APB3DIVConf = enum {
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
pub const APB1DIVConf = enum {
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
pub const APB2DIVConf = enum {
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
pub const ETH1MultConf = enum {
    DIVP4,
    DIVQ3,
};
pub const ADC2MultConf = enum {
    DIVR4,
    CKPERCLKOutput,
    DIVQ3,
};
pub const HSEUSBPHYDevisorConf = enum {
    DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV2 => 2,
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
pub const Config = struct {
    HSIDiv: HSIDivConf = .DIV1,
    HSEOSC: HSEOSCConf = @enumFromInt(24000000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    SysClkSource: SysClkSourceConf = .HSIDiv,
    MPUMult: MPUMultConf = .HSIDiv,
    CKPERMult: CKPERMultConf = .HSIDiv,
    AXIMult: AXIMultConf = .HSIDiv,
    AXIDIV: AXIDIVConf = .DIV1,
    APB4DIV: APB4DIVConf = .DIV1,
    APB5DIV: APB5DIVConf = .DIV1,
    APB6DIV: APB6DIVConf = .DIV1,
    MCO1Mult: MCO1MultConf = .HSIDiv,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .MPUCLKOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    MLAHBDIV: MLAHBDIVConf = .DIV1,
    APB3DIV: APB3DIVConf = .DIV1,
    APB1DIV: APB1DIVConf = .DIV1,
    APB2DIV: APB2DIVConf = .DIV1,
    PLL12Source: PLL12SourceConf = .HSIDiv,
    DIVM1: DIVM1Conf = @enumFromInt(2),
    DIVM2: DIVM2Conf = @enumFromInt(2),
    PLL3Source: PLL3SourceConf = .HSIDiv,
    DIVM3: DIVM3Conf = @enumFromInt(2),
    PLL4Source: PLL4SourceConf = .HSIDiv,
    DIVM4: DIVM4Conf = @enumFromInt(2),
    MPUDIV: MPUDIVConf = .DIV2,
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
    ETH1Mult: ETH1MultConf = .DIVP4,
    ADC2Mult: ADC2MultConf = .DIVR4,
    HSEUSBPHYDevisor: HSEUSBPHYDevisorConf = .DIV2,
    USBPHYCLKMux: USBPHYCLKMuxConf = .DIVR4,
    USBOCLKMux: USBOCLKMuxConf = .DIVR4,
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
    ETH1Mult: ClockNode,
    ETH1output: ClockNode,
    ADC2Mult: ClockNode,
    ADC2output: ClockNode,
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
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = .{ .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 48000000, .min = 8000000 },
            } },
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
        const CSIRC: ClockNode = .{
            .name = "CSIRC",
            .Nodetype = .{ .source = .{ .value = 4000000 } },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = .{ .source = .{ .value = 12288000 } },
        };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL3Source) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const DIVM3: ClockNode = .{
            .name = "DIVM3",
            .Nodetype = .{ .div = .{ .value = config.DIVM3.get(), .limit = .{ .max = 64, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL3Source},
        };
        const PLL3FRACV: ClockNode = .{
            .name = "PLL3FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL3FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN3: ClockNode = .{
            .name = "DIVN3",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN3.get(), .limit = .{ .max = 200, .min = 25 } } },
            .parents = &[_]*const ClockNode{ &DIVM3, &PLL3FRACV },
        };
        const DIVP3: ClockNode = .{
            .name = "DIVP3",
            .Nodetype = .{ .div = .{ .value = config.DIVP3.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",

            .Nodetype = .{ .multi = @intFromEnum(config.SysClkSource) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &DIVP3,
            },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const PLL12Source: ClockNode = .{
            .name = "PLL12Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL12Source) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
            },
        };
        const DIVM1: ClockNode = .{
            .name = "DIVM1",
            .Nodetype = .{ .div = .{ .value = config.DIVM1.get(), .limit = .{ .max = 64, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL12Source},
        };
        const FreqCk1: ClockNode = .{
            .name = "FreqCk1",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&DIVM1},
        };
        const PLL1FRACV: ClockNode = .{
            .name = "PLL1FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL1FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN1: ClockNode = .{
            .name = "DIVN1",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN1.get(), .limit = .{ .max = 100, .min = 25 } } },
            .parents = &[_]*const ClockNode{ &FreqCk1, &PLL1FRACV },
        };
        const DIVN1Mul2Div2: ClockNode = .{
            .name = "DIVN1Mul2Div2",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&DIVN1},
        };
        const DIVP1: ClockNode = .{
            .name = "DIVP1",
            .Nodetype = .{ .div = .{ .value = config.DIVP1.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1Mul2Div2},
        };
        const MPUDIV: ClockNode = .{
            .name = "MPUDIV",
            .Nodetype = .{ .div = .{ .value = config.MPUDIV.get() } },
            .parents = &[_]*const ClockNode{&DIVP1},
        };
        const MPUMult: ClockNode = .{
            .name = "MPUMult",

            .Nodetype = .{ .multi = @intFromEnum(config.MPUMult) },
            .parents = &[_]*const ClockNode{
                &DIVP1,
                &MPUDIV,
                &HSEOSC,
                &HSIDiv,
            },
        };
        const MPUCLKOutput: ClockNode = .{
            .name = "MPUCLKOutput",
            .Nodetype = .{ .output = .{ .max = 650000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MPUMult},
        };
        const CKPERMult: ClockNode = .{
            .name = "CKPERMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CKPERMult) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const CKPERCLKOutput: ClockNode = .{
            .name = "CKPERCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CKPERMult},
        };
        const DIVM2: ClockNode = .{
            .name = "DIVM2",
            .Nodetype = .{ .div = .{ .value = config.DIVM2.get(), .limit = .{ .max = 64, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL12Source},
        };
        const FreqCk2: ClockNode = .{
            .name = "FreqCk2",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&DIVM2},
        };
        const PLL2FRACV: ClockNode = .{
            .name = "PLL2FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL2FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN2: ClockNode = .{
            .name = "DIVN2",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN2.get(), .limit = .{ .max = 100, .min = 25 } } },
            .parents = &[_]*const ClockNode{ &FreqCk2, &PLL2FRACV },
        };
        const DIVN2Mul2Div2: ClockNode = .{
            .name = "DIVN2Mul2Div2",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&DIVN2},
        };
        const DIVP2: ClockNode = .{
            .name = "DIVP2",
            .Nodetype = .{ .div = .{ .value = config.DIVP2.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2Mul2Div2},
        };
        const AXIMult: ClockNode = .{
            .name = "AXIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.AXIMult) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &HSIDiv,
                &DIVP2,
            },
        };
        const AXICLKOutput: ClockNode = .{
            .name = "AXICLKOutput",
            .Nodetype = .{ .output = .{ .max = 266500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AXIMult},
        };
        const DACCLKOutput: ClockNode = .{
            .name = "DACCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const AXIDIV: ClockNode = .{
            .name = "AXIDIV",
            .Nodetype = .{ .div = .{ .value = config.AXIDIV.get() } },
            .parents = &[_]*const ClockNode{&AXICLKOutput},
        };
        const AXIOutput: ClockNode = .{
            .name = "AXIOutput",
            .Nodetype = .{ .output = .{ .max = 266500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const Hclk5Output: ClockNode = .{
            .name = "Hclk5Output",
            .Nodetype = .{ .output = .{ .max = 266500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const Hclk6Output: ClockNode = .{
            .name = "Hclk6Output",
            .Nodetype = .{ .output = .{ .max = 266500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const APB4DIV: ClockNode = .{
            .name = "APB4DIV",
            .Nodetype = .{ .div = .{ .value = config.APB4DIV.get() } },
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const APB4DIVOutput: ClockNode = .{
            .name = "APB4DIVOutput",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB4DIV},
        };
        const APB5DIV: ClockNode = .{
            .name = "APB5DIV",
            .Nodetype = .{ .div = .{ .value = config.APB5DIV.get() } },
            .parents = &[_]*const ClockNode{&AXIDIV},
        };
        const APB5DIVOutput: ClockNode = .{
            .name = "APB5DIVOutput",
            .Nodetype = .{ .output = .{ .max = 67000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB5DIV},
        };
        const MLAHBDIV: ClockNode = .{
            .name = "MLAHBDIV",
            .Nodetype = .{ .div = .{ .value = config.MLAHBDIV.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const APB6DIV: ClockNode = .{
            .name = "APB6DIV",
            .Nodetype = .{ .div = .{ .value = config.APB6DIV.get() } },
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const Tim3Mul: ClockNode = .{
            .name = "Tim3Mul",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB6DIV},
        };
        const Tim3Output: ClockNode = .{
            .name = "Tim3Output",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&Tim3Mul},
        };
        const APB6DIVOutput: ClockNode = .{
            .name = "APB6DIVOutput",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB6DIV},
        };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO1Mult) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
                &CSIRC,
                &LSIRC,
                &LSEOSC,
            },
        };
        const MCO1Div: ClockNode = .{
            .name = "MCO1Div",
            .Nodetype = .{ .div = .{ .value = config.MCO1Div.get() } },
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MCO1Div},
        };
        const PLL4Source: ClockNode = .{
            .name = "PLL4Source",

            .Nodetype = .{ .multi = @intFromEnum(config.PLL4Source) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const DIVM4: ClockNode = .{
            .name = "DIVM4",
            .Nodetype = .{ .div = .{ .value = config.DIVM4.get(), .limit = .{ .max = 64, .min = 1 } } },
            .parents = &[_]*const ClockNode{&PLL4Source},
        };
        const PLL4FRACV: ClockNode = .{
            .name = "PLL4FRACV",
            .Nodetype = .{ .source = .{
                .value = config.PLL4FRACV.get(),
                .limit = .{ .max = 8191, .min = 0 },
            } },
        };
        const DIVN4: ClockNode = .{
            .name = "DIVN4",
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN4.get(), .limit = .{ .max = 200, .min = 25 } } },
            .parents = &[_]*const ClockNode{ &DIVM4, &PLL4FRACV },
        };
        const DIVP4: ClockNode = .{
            .name = "DIVP4",
            .Nodetype = .{ .div = .{ .value = config.DIVP4.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN4},
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.MCO2Mult) },
            .parents = &[_]*const ClockNode{
                &MPUCLKOutput,
                &AXIDIV,
                &SysCLKOutput,
                &DIVP4,
                &HSEOSC,
                &HSIDiv,
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
        const MLAHBClockOutput: ClockNode = .{
            .name = "MLAHBClockOutput",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const APB3DIV: ClockNode = .{
            .name = "APB3DIV",
            .Nodetype = .{ .div = .{ .value = config.APB3DIV.get() } },
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB3DIV},
        };
        const APB1DIV: ClockNode = .{
            .name = "APB1DIV",
            .Nodetype = .{ .div = .{ .value = config.APB1DIV.get() } },
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const Tim1Mul: ClockNode = .{
            .name = "Tim1Mul",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB1DIV},
        };
        const Tim1Output: ClockNode = .{
            .name = "Tim1Output",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&Tim1Mul},
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1DIV},
        };
        const APB2DIV: ClockNode = .{
            .name = "APB2DIV",
            .Nodetype = .{ .div = .{ .value = config.APB2DIV.get() } },
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const Tim2Mul: ClockNode = .{
            .name = "Tim2Mul",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&APB2DIV},
        };
        const Tim2Output: ClockNode = .{
            .name = "Tim2Output",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&Tim2Mul},
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB2DIV},
        };
        const DFSDM1Output: ClockNode = .{
            .name = "DFSDM1Output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&MLAHBDIV},
        };
        const DIVQ1: ClockNode = .{
            .name = "DIVQ1",
            .Nodetype = .{ .div = .{ .value = config.DIVQ1.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1Mul2Div2},
        };
        const DIVQ1output: ClockNode = .{
            .name = "DIVQ1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVQ1},
        };
        const DIVR1: ClockNode = .{
            .name = "DIVR1",
            .Nodetype = .{ .div = .{ .value = config.DIVR1.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN1Mul2Div2},
        };
        const DIVR1output: ClockNode = .{
            .name = "DIVR1output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR1},
        };
        const DIVQ2: ClockNode = .{
            .name = "DIVQ2",
            .Nodetype = .{ .div = .{ .value = config.DIVQ2.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2Mul2Div2},
        };
        const DIVQ2output: ClockNode = .{
            .name = "DIVQ2output",
            .Nodetype = .{ .output = .{ .max = 800000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&DIVQ2},
        };
        const DIVR2: ClockNode = .{
            .name = "DIVR2",
            .Nodetype = .{ .div = .{ .value = config.DIVR2.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN2Mul2Div2},
        };
        const DIVR2output: ClockNode = .{
            .name = "DIVR2output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DIVQ3: ClockNode = .{
            .name = "DIVQ3",
            .Nodetype = .{ .div = .{ .value = config.DIVQ3.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVQ3output: ClockNode = .{
            .name = "DIVQ3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVQ3},
        };
        const DIVR3: ClockNode = .{
            .name = "DIVR3",
            .Nodetype = .{ .div = .{ .value = config.DIVR3.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN3},
        };
        const DIVR3output: ClockNode = .{
            .name = "DIVR3output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR3},
        };
        const DIVP4output: ClockNode = .{
            .name = "DIVP4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVP4},
        };
        const DIVQ4: ClockNode = .{
            .name = "DIVQ4",
            .Nodetype = .{ .div = .{ .value = config.DIVQ4.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN4},
        };
        const DIVQ4output: ClockNode = .{
            .name = "DIVQ4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVQ4},
        };
        const DIVR4: ClockNode = .{
            .name = "DIVR4",
            .Nodetype = .{ .div = .{ .value = config.DIVR4.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN4},
        };
        const DIVR4output: ClockNode = .{
            .name = "DIVR4output",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR4},
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSERTCDevisor.get(), .limit = .{ .max = 64, .min = 1 } } },
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
        const I2C12Mult: ClockNode = .{
            .name = "I2C12Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C12Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C12output: ClockNode = .{
            .name = "I2C12output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2C12Mult},
        };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C3Mult) },
            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C4Mult) },
            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const I2C5Mult: ClockNode = .{
            .name = "I2C5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C5Mult) },
            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C5output: ClockNode = .{
            .name = "I2C5output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2C5Mult},
        };
        const SPDIFMult: ClockNode = .{
            .name = "SPDIFMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPDIFMult) },
            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
                &HSIDiv,
            },
        };
        const SPDIFoutput: ClockNode = .{
            .name = "SPDIFoutput",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPDIFMult},
        };
        const QSPIMult: ClockNode = .{
            .name = "QSPIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.QSPIMult) },
            .parents = &[_]*const ClockNode{
                &AXIOutput,
                &DIVP4,
                &DIVR3,
                &CKPERCLKOutput,
            },
        };
        const QSPIoutput: ClockNode = .{
            .name = "QSPIoutput",
            .Nodetype = .{ .output = .{ .max = 266500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&QSPIMult},
        };
        const FMCMult: ClockNode = .{
            .name = "FMCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FMCMult) },
            .parents = &[_]*const ClockNode{
                &AXIOutput,
                &DIVR3,
                &DIVP4,
                &CKPERCLKOutput,
            },
        };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .Nodetype = .{ .output = .{ .max = 266500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&FMCMult},
        };
        const SDMMC1Mult: ClockNode = .{
            .name = "SDMMC1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMC1Mult) },
            .parents = &[_]*const ClockNode{
                &Hclk6Output,
                &DIVR3,
                &DIVP4,
                &HSIDiv,
            },
        };
        const SDMMC1output: ClockNode = .{
            .name = "SDMMC1output",
            .Nodetype = .{ .output = .{ .max = 266000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMC1Mult},
        };
        const SDMMC2Mult: ClockNode = .{
            .name = "SDMMC2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMC2Mult) },
            .parents = &[_]*const ClockNode{
                &Hclk6Output,
                &DIVR3,
                &DIVP4,
                &HSIDiv,
            },
        };
        const SDMMC2output: ClockNode = .{
            .name = "SDMMC2output",
            .Nodetype = .{ .output = .{ .max = 266000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMC2Mult},
        };
        const STGENMult: ClockNode = .{
            .name = "STGENMult",

            .Nodetype = .{ .multi = @intFromEnum(config.STGENMult) },
            .parents = &[_]*const ClockNode{
                &HSIDiv,
                &HSEOSC,
            },
        };
        const STGENoutput: ClockNode = .{
            .name = "STGENoutput",
            .Nodetype = .{ .output = .{ .max = 64000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&STGENMult},
        };
        const LPTIM45Mult: ClockNode = .{
            .name = "LPTIM45Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM45Mult) },
            .parents = &[_]*const ClockNode{
                &APB3DIV,
                &DIVP4,
                &DIVQ3,
                &LSEOSC,
                &LSIRC,
                &CKPERCLKOutput,
            },
        };
        const LPTIM45output: ClockNode = .{
            .name = "LPTIM45output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM45Mult},
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM2Mult) },
            .parents = &[_]*const ClockNode{
                &APB3DIV,
                &DIVQ4,
                &CKPERCLKOutput,
                &LSEOSC,
                &LSIRC,
            },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM1Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVP4,
                &DIVQ3,
                &LSEOSC,
                &LSIRC,
                &CKPERCLKOutput,
            },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART1Mult) },
            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &DIVQ3,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART2Mult) },
            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
                &DIVQ3,
            },
        };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART35Mult: ClockNode = .{
            .name = "USART35Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART35Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART35output: ClockNode = .{
            .name = "USART35output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART35Mult},
        };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART6Mult) },
            .parents = &[_]*const ClockNode{
                &APB2DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const UART78Mult: ClockNode = .{
            .name = "UART78Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.UART78Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART78output: ClockNode = .{
            .name = "USART78output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&UART78Mult},
        };
        const RNG1Mult: ClockNode = .{
            .name = "RNG1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.RNG1Mult) },
            .parents = &[_]*const ClockNode{
                &CSIRC,
                &DIVR4,
                &LSIRC,
            },
        };
        const RNG1output: ClockNode = .{
            .name = "RNG1output",
            .Nodetype = .{ .output = .{ .max = 360000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RNG1Mult},
        };
        const SAESMult: ClockNode = .{
            .name = "SAESMult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAESMult) },
            .parents = &[_]*const ClockNode{
                &AXIOutput,
                &CKPERCLKOutput,
                &DIVR4,
                &LSIRC,
            },
        };
        const SAESoutput: ClockNode = .{
            .name = "SAESoutput",
            .Nodetype = .{ .output = .{ .max = 360000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAESMult},
        };
        const LPTIM3Mult: ClockNode = .{
            .name = "LPTIM3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM3Mult) },
            .parents = &[_]*const ClockNode{
                &APB3DIV,
                &DIVQ4,
                &CKPERCLKOutput,
                &LSEOSC,
                &LSIRC,
            },
        };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const SPI4Mult: ClockNode = .{
            .name = "SPI4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI4Mult) },
            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const SPI4output: ClockNode = .{
            .name = "SPI4output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI4Mult},
        };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI2Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &SPDIFMult,
                &DIVR3,
            },
        };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const USART4Mult: ClockNode = .{
            .name = "USART4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART4Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART4output: ClockNode = .{
            .name = "USART4output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART4Mult},
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI1Mult) },
            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI23Mult: ClockNode = .{
            .name = "SPI23Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI23Mult) },
            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SPI23output: ClockNode = .{
            .name = "SPI23output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI23Mult},
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI1Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const DFSDF1Audiooutput: ClockNode = .{
            .name = "DFSDF1Audiooutput",
            .Nodetype = .{ .output = .{ .max = 133000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SPI5Mult: ClockNode = .{
            .name = "SPI5Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI5Mult) },
            .parents = &[_]*const ClockNode{
                &APB6DIV,
                &DIVQ4,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI5output: ClockNode = .{
            .name = "SPI5output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI5Mult},
        };
        const ETH1Mult: ClockNode = .{
            .name = "ETH1Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.ETH1Mult) },
            .parents = &[_]*const ClockNode{
                &DIVP4,
                &DIVQ3,
            },
        };
        const ETH1output: ClockNode = .{
            .name = "ETH1output",
            .Nodetype = .{ .output = .{ .max = 125000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ETH1Mult},
        };
        const ADC2Mult: ClockNode = .{
            .name = "ADC2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADC2Mult) },
            .parents = &[_]*const ClockNode{
                &DIVR4,
                &CKPERCLKOutput,
                &DIVQ3,
            },
        };
        const ADC2output: ClockNode = .{
            .name = "ADC2output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ADC2Mult},
        };
        const DDRPHYC: ClockNode = .{
            .name = "DDRPHYC",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const PUBL: ClockNode = .{
            .name = "PUBL",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DDRC: ClockNode = .{
            .name = "DDRC",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const DDRPERFM: ClockNode = .{
            .name = "DDRPERFM",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVR2},
        };
        const HSEUSBPHYDevisor: ClockNode = .{
            .name = "HSEUSBPHYDevisor",
            .Nodetype = .{ .div = .{ .value = config.HSEUSBPHYDevisor.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const USBPHYCLKMux: ClockNode = .{
            .name = "USBPHYCLKMux",

            .Nodetype = .{ .multi = @intFromEnum(config.USBPHYCLKMux) },
            .parents = &[_]*const ClockNode{
                &HSEUSBPHYDevisor,
                &HSEOSC,
                &DIVR4,
            },
        };
        const USBPHYCLKOutput: ClockNode = .{
            .name = "USBPHYCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USBPHYCLKMux},
        };
        const USBPHYRC: ClockNode = .{
            .name = "USBPHYRC",
            .Nodetype = .{ .source = .{ .value = 48000000 } },
        };
        const USBOCLKMux: ClockNode = .{
            .name = "USBOCLKMux",

            .Nodetype = .{ .multi = @intFromEnum(config.USBOCLKMux) },
            .parents = &[_]*const ClockNode{
                &DIVR4,
                &USBPHYRC,
            },
        };
        const USBOFSCLKOutput: ClockNode = .{
            .name = "USBOFSCLKOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&USBOCLKMux},
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
            .ETH1Mult = ETH1Mult,
            .ETH1output = ETH1output,
            .ADC2Mult = ADC2Mult,
            .ADC2output = ADC2output,
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
        _ = self.ETH1output.get_comptime();
        _ = self.ADC2output.get_comptime();
        _ = self.DDRC.get_comptime();
        _ = self.DDRPERFM.get_comptime();
        _ = self.USBPHYCLKOutput.get_comptime();
        _ = self.USBOFSCLKOutput.get_comptime();
    }
};
