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
        return 4000000;
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
    MPUMult,
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
pub const MCUDIVConf = enum {
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
        return 512;
    }

    pub fn min() f32 {
        return 4;
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
        return 512;
    }

    pub fn min() f32 {
        return 4;
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
        return 512;
    }

    pub fn min() f32 {
        return 4;
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
        return 512;
    }

    pub fn min() f32 {
        return 4;
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
pub const DSIMultConf = enum {
    PLL4DSIInput,
    DSIPHYPrescaler,
};
pub const DSITXPrescalerConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32;
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
pub const I2C35MultConf = enum {
    APB1DIV,
    DIVR4,
    HSIDiv,
    CSIRC,
};
pub const I2C46MultConf = enum {
    APB5DIV,
    DIVQ3,
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
pub const SDMMC12MultConf = enum {
    Hclk6Output,
    DIVR3,
    DIVP4,
    HSIDiv,
};
pub const SDMMC3MultConf = enum {
    AHBOutput,
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
pub const LPTIM23MultConf = enum {
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
    APB5DIV,
    DIVQ4,
    DIVQ3,
    HSEOSC,
    CSIRC,
    HSIDiv,
};
pub const USART24MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSEOSC,
    CSIRC,
    HSIDiv,
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
    LSEOSC,
    LSIRC,
};
pub const RNG2MultConf = enum {
    CSIRC,
    DIVR4,
    LSEOSC,
    LSIRC,
};
pub const SPI6MultConf = enum {
    APB5DIV,
    DIVQ4,
    DIVQ3,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const SPI45MultConf = enum {
    APB1DIV,
    DIVQ4,
    HSIDiv,
    CSIRC,
    HSEOSC,
};
pub const SAI2MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    SPDIFMult,
    DIVR3,
};
pub const SAI4MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
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
pub const SAI3MultConf = enum {
    DIVQ4,
    DIVQ3,
    I2S_CKIN,
    CKPERCLKOutput,
    DIVR3,
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
pub const ADCMultConf = enum {
    DIVR4,
    CKPERCLKOutput,
    DIVQ3,
};
pub const CSICECDevisorConf = enum {
    DIV122,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV122 => 122,
        };
    }
};
pub const CECMultConf = enum {
    CSICECDevisor,
    LSEOSC,
    LSIRC,
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
pub const PLLDSIIDFConf = enum {
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
        };
    }
};
pub const PLLDSINDIVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 125;
    }

    pub fn min() f32 {
        return 10;
    }
};
pub const PLLDSIODFConf = enum {
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
    MCO1Mult: MCO1MultConf = .HSIDiv,
    MCO1Div: MCO1DivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .MPUMult,
    MCO2Div: MCO2DivConf = .DIV1,
    MCUDIV: MCUDIVConf = .DIV1,
    CortexPrescaler: CortexPrescalerConf = .DIV1,
    APB3DIV: APB3DIVConf = .DIV1,
    APB1DIV: APB1DIVConf = .DIV1,
    APB2DIV: APB2DIVConf = .DIV1,
    PLL12Source: PLL12SourceConf = .HSIDiv,
    DIVM1: DIVM1Conf = @enumFromInt(32),
    DIVM2: DIVM2Conf = @enumFromInt(32),
    PLL3Source: PLL3SourceConf = .HSIDiv,
    DIVM3: DIVM3Conf = @enumFromInt(32),
    PLL4Source: PLL4SourceConf = .HSIDiv,
    DIVM4: DIVM4Conf = @enumFromInt(32),
    MPUDIV: MPUDIVConf = .DIV2,
    DIVN1: DIVN1Conf = @enumFromInt(25),
    PLL1FRACV: PLL1FRACVConf = @enumFromInt(0),
    DIVP1: DIVP1Conf = @enumFromInt(1),
    DIVQ1: DIVQ1Conf = @enumFromInt(2),
    DIVR1: DIVR1Conf = @enumFromInt(2),
    DIVN2: DIVN2Conf = @enumFromInt(25),
    PLL2FRACV: PLL2FRACVConf = @enumFromInt(0),
    DIVP2: DIVP2Conf = @enumFromInt(2),
    DIVQ2: DIVQ2Conf = @enumFromInt(2),
    DIVR2: DIVR2Conf = @enumFromInt(2),
    DIVN3: DIVN3Conf = @enumFromInt(25),
    PLL3FRACV: PLL3FRACVConf = @enumFromInt(0),
    DIVP3: DIVP3Conf = @enumFromInt(2),
    DIVQ3: DIVQ3Conf = @enumFromInt(2),
    DIVR3: DIVR3Conf = @enumFromInt(2),
    DIVN4: DIVN4Conf = @enumFromInt(25),
    PLL4FRACV: PLL4FRACVConf = @enumFromInt(0),
    DIVP4: DIVP4Conf = @enumFromInt(2),
    DIVQ4: DIVQ4Conf = @enumFromInt(2),
    DIVR4: DIVR4Conf = @enumFromInt(2),
    DSIMult: DSIMultConf = .DSIPHYPrescaler,
    DSITXPrescaler: DSITXPrescalerConf = @enumFromInt(4),
    HSERTCDevisor: HSERTCDevisorConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    I2C12Mult: I2C12MultConf = .APB1DIV,
    I2C35Mult: I2C35MultConf = .APB1DIV,
    I2C46Mult: I2C46MultConf = .APB5DIV,
    SPDIFMult: SPDIFMultConf = .DIVP4,
    QSPIMult: QSPIMultConf = .AXIOutput,
    FMCMult: FMCMultConf = .AXIOutput,
    SDMMC12Mult: SDMMC12MultConf = .Hclk6Output,
    SDMMC3Mult: SDMMC3MultConf = .AHBOutput,
    STGENMult: STGENMultConf = .HSIDiv,
    LPTIM45Mult: LPTIM45MultConf = .APB3DIV,
    LPTIM23Mult: LPTIM23MultConf = .APB3DIV,
    LPTIM1Mult: LPTIM1MultConf = .APB1DIV,
    USART1Mult: USART1MultConf = .APB5DIV,
    USART24Mult: USART24MultConf = .APB1DIV,
    USART35Mult: USART35MultConf = .APB1DIV,
    USART6Mult: USART6MultConf = .APB2DIV,
    UART78Mult: UART78MultConf = .APB1DIV,
    RNG1Mult: RNG1MultConf = .CSIRC,
    RNG2Mult: RNG2MultConf = .CSIRC,
    SPI6Mult: SPI6MultConf = .APB5DIV,
    SPI45Mult: SPI45MultConf = .APB1DIV,
    SAI2Mult: SAI2MultConf = .DIVQ4,
    SAI4Mult: SAI4MultConf = .DIVQ4,
    SPI1Mult: SPI1MultConf = .DIVP4,
    SPI23Mult: SPI23MultConf = .DIVP4,
    SAI1Mult: SAI1MultConf = .DIVQ4,
    SAI3Mult: SAI3MultConf = .DIVQ4,
    FDCANMult: FDCANMultConf = .HSEOSC,
    ETH1Mult: ETH1MultConf = .DIVP4,
    ADCMult: ADCMultConf = .DIVR4,
    CSICECDevisor: CSICECDevisorConf = .DIV122,
    CECMult: CECMultConf = .LSEOSC,
    HSEUSBPHYDevisor: HSEUSBPHYDevisorConf = .DIV2,
    USBPHYCLKMux: USBPHYCLKMuxConf = .DIVR4,
    USBOCLKMux: USBOCLKMuxConf = .DIVR4,
    PLLDSIIDF: PLLDSIIDFConf = .DIV1,
    PLLDSINDIV: PLLDSINDIVConf = @enumFromInt(20),
    PLLDSIODF: PLLDSIODFConf = .DIV1,
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
    MCO1Mult: ClockNode,
    MCO1Div: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Div: ClockNode,
    MCO2Pin: ClockNode,
    MCUDIV: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    McuClockOutput: ClockNode,
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
    LTDCOutput: ClockNode,
    DIVR3output: ClockNode,
    DIVN4: ClockNode,
    PLL4FRACV: ClockNode,
    DIVP4: ClockNode,
    DIVP4output: ClockNode,
    PLL4DSIInput: ClockNode,
    DIVQ4: ClockNode,
    DIVQ4output: ClockNode,
    DIVR4: ClockNode,
    DIVR4output: ClockNode,
    DSIPHYPrescaler: ClockNode,
    DSIMult: ClockNode,
    DSIoutput: ClockNode,
    DSITXPrescaler: ClockNode,
    DSITXCLKEsc: ClockNode,
    DSIPixel: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    I2C12Mult: ClockNode,
    I2C12output: ClockNode,
    I2C35Mult: ClockNode,
    I2C35output: ClockNode,
    I2C46Mult: ClockNode,
    I2C46output: ClockNode,
    SPDIFMult: ClockNode,
    SPDIFoutput: ClockNode,
    QSPIMult: ClockNode,
    QSPIoutput: ClockNode,
    FMCMult: ClockNode,
    FMCoutput: ClockNode,
    SDMMC12Mult: ClockNode,
    SDMMC12output: ClockNode,
    SDMMC3Mult: ClockNode,
    SDMMC3output: ClockNode,
    STGENMult: ClockNode,
    STGENoutput: ClockNode,
    LPTIM45Mult: ClockNode,
    LPTIM45output: ClockNode,
    LPTIM23Mult: ClockNode,
    LPTIM23output: ClockNode,
    LPTIM1Mult: ClockNode,
    LPTIM1output: ClockNode,
    USART1Mult: ClockNode,
    USART1output: ClockNode,
    USART24Mult: ClockNode,
    USART24output: ClockNode,
    USART35Mult: ClockNode,
    USART35output: ClockNode,
    USART6Mult: ClockNode,
    USART6output: ClockNode,
    UART78Mult: ClockNode,
    USART78output: ClockNode,
    RNG1Mult: ClockNode,
    RNG1output: ClockNode,
    RNG2Mult: ClockNode,
    RNG2output: ClockNode,
    SPI6Mult: ClockNode,
    SPI6output: ClockNode,
    SPI45Mult: ClockNode,
    SPI45output: ClockNode,
    SAI2Mult: ClockNode,
    SAI2output: ClockNode,
    SAI4Mult: ClockNode,
    SAI4output: ClockNode,
    SPI1Mult: ClockNode,
    SPI1output: ClockNode,
    SPI23Mult: ClockNode,
    SPI23output: ClockNode,
    SAI1Mult: ClockNode,
    SAI1output: ClockNode,
    DFSDF1Audiooutput: ClockNode,
    SAI3Mult: ClockNode,
    SAI3output: ClockNode,
    FDCANMult: ClockNode,
    FDCANoutput: ClockNode,
    ETH1Mult: ClockNode,
    ETH1output: ClockNode,
    ADCMult: ClockNode,
    ADCoutput: ClockNode,
    CSICECDevisor: ClockNode,
    CECMult: ClockNode,
    CECoutput: ClockNode,
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
    PLLDSIIDF: ClockNode,
    PLLDSIMultiplicator: ClockNode,
    PLLDSINDIV: ClockNode,
    VCOoutput: ClockNode,
    PLLDSIDevisor: ClockNode,
    PLLDSIODF: ClockNode,
    PLLDSIoutput: ClockNode,

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
                .limit = .{ .max = 48000000, .min = 4000000 },
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
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN3.get(), .limit = .{ .max = 512, .min = 4 } } },
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
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN1.get(), .limit = .{ .max = 512, .min = 4 } } },
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
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN2.get(), .limit = .{ .max = 512, .min = 4 } } },
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
            .Nodetype = .{ .mulfrac = .{ .value = config.DIVN4.get(), .limit = .{ .max = 512, .min = 4 } } },
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
                &MPUMult,
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
        const MCUDIV: ClockNode = .{
            .name = "MCUDIV",
            .Nodetype = .{ .div = .{ .value = config.MCUDIV.get() } },
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = .{ .div = .{ .value = config.CortexPrescaler.get() } },
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const McuClockOutput: ClockNode = .{
            .name = "McuClockOutput",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const APB3DIV: ClockNode = .{
            .name = "APB3DIV",
            .Nodetype = .{ .div = .{ .value = config.APB3DIV.get() } },
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB3DIV},
        };
        const APB1DIV: ClockNode = .{
            .name = "APB1DIV",
            .Nodetype = .{ .div = .{ .value = config.APB1DIV.get() } },
            .parents = &[_]*const ClockNode{&MCUDIV},
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
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&APB1DIV},
        };
        const APB2DIV: ClockNode = .{
            .name = "APB2DIV",
            .Nodetype = .{ .div = .{ .value = config.APB2DIV.get() } },
            .parents = &[_]*const ClockNode{&MCUDIV},
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
            .parents = &[_]*const ClockNode{&MCUDIV},
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
            .Nodetype = .{ .output = .{ .max = 533000000, .min = 0 } },
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
        const DIVQ4: ClockNode = .{
            .name = "DIVQ4",
            .Nodetype = .{ .div = .{ .value = config.DIVQ4.get(), .limit = .{ .max = 128, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DIVN4},
        };
        const LTDCOutput: ClockNode = .{
            .name = "LTDCOutput",
            .Nodetype = .{ .output = .{ .max = 90000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&DIVQ4},
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
        const PLL4DSIInput: ClockNode = .{
            .name = "PLL4DSIInput",
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&DIVP4},
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
        const PLLDSIIDF: ClockNode = .{
            .name = "PLLDSIIDF",
            .Nodetype = .{ .div = .{ .value = config.PLLDSIIDF.get() } },
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const PLLDSIMultiplicator: ClockNode = .{
            .name = "PLLDSIMultiplicator",
            .Nodetype = .{ .mul = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&PLLDSIIDF},
        };
        const PLLDSINDIV: ClockNode = .{
            .name = "PLLDSINDIV",
            .Nodetype = .{ .mul = .{ .value = config.PLLDSINDIV.get(), .limit = .{ .max = 125, .min = 10 } } },
            .parents = &[_]*const ClockNode{&PLLDSIMultiplicator},
        };
        const VCOoutput: ClockNode = .{
            .name = "VCOoutput",
            .Nodetype = .{ .output = .{ .max = 2000000000, .min = 1000000000 } },
            .parents = &[_]*const ClockNode{&PLLDSINDIV},
        };
        const PLLDSIDevisor: ClockNode = .{
            .name = "PLLDSIDevisor",
            .Nodetype = .{ .div = .{ .value = 2 } },
            .parents = &[_]*const ClockNode{&VCOoutput},
        };
        const PLLDSIODF: ClockNode = .{
            .name = "PLLDSIODF",
            .Nodetype = .{ .div = .{ .value = config.PLLDSIODF.get() } },
            .parents = &[_]*const ClockNode{&PLLDSIDevisor},
        };
        const DSIPHYPrescaler: ClockNode = .{
            .name = "DSIPHYPrescaler",
            .Nodetype = .{ .div = .{ .value = 8 } },
            .parents = &[_]*const ClockNode{&PLLDSIODF},
        };
        const DSIMult: ClockNode = .{
            .name = "DSIMult",

            .Nodetype = .{ .multi = @intFromEnum(config.DSIMult) },
            .parents = &[_]*const ClockNode{
                &PLL4DSIInput,
                &DSIPHYPrescaler,
            },
        };
        const DSIoutput: ClockNode = .{
            .name = "DSIoutput",
            .Nodetype = .{ .output = .{ .max = 125000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&DSIMult},
        };
        const DSITXPrescaler: ClockNode = .{
            .name = "DSITXPrescaler",
            .Nodetype = .{ .div = .{ .value = config.DSITXPrescaler.get(), .limit = .{ .max = 32, .min = 1 } } },
            .parents = &[_]*const ClockNode{&DSIMult},
        };
        const DSITXCLKEsc: ClockNode = .{
            .name = "DSITXCLKEsc",
            .Nodetype = .{ .output = .{ .max = 20000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&DSITXPrescaler},
        };
        const DSIPixel: ClockNode = .{
            .name = "DSIPixel",
            .Nodetype = .{ .output = .{ .max = 90000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&DIVQ4},
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
        const I2C35Mult: ClockNode = .{
            .name = "I2C35Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C35Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVR4,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C35output: ClockNode = .{
            .name = "I2C35output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2C35Mult},
        };
        const I2C46Mult: ClockNode = .{
            .name = "I2C46Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.I2C46Mult) },
            .parents = &[_]*const ClockNode{
                &APB5DIV,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
            },
        };
        const I2C46output: ClockNode = .{
            .name = "I2C46output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&I2C46Mult},
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
        const SDMMC12Mult: ClockNode = .{
            .name = "SDMMC12Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMC12Mult) },
            .parents = &[_]*const ClockNode{
                &Hclk6Output,
                &DIVR3,
                &DIVP4,
                &HSIDiv,
            },
        };
        const SDMMC12output: ClockNode = .{
            .name = "SDMMC12output",
            .Nodetype = .{ .output = .{ .max = 200000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMC12Mult},
        };
        const SDMMC3Mult: ClockNode = .{
            .name = "SDMMC3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SDMMC3Mult) },
            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &DIVR3,
                &DIVP4,
                &HSIDiv,
            },
        };
        const SDMMC3output: ClockNode = .{
            .name = "SDMMC3output",
            .Nodetype = .{ .output = .{ .max = 209000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SDMMC3Mult},
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
        const LPTIM23Mult: ClockNode = .{
            .name = "LPTIM23Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.LPTIM23Mult) },
            .parents = &[_]*const ClockNode{
                &APB3DIV,
                &DIVQ4,
                &CKPERCLKOutput,
                &LSEOSC,
                &LSIRC,
            },
        };
        const LPTIM23output: ClockNode = .{
            .name = "LPTIM23output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&LPTIM23Mult},
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
                &APB5DIV,
                &DIVQ4,
                &DIVQ3,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART24Mult: ClockNode = .{
            .name = "USART24Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.USART24Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSEOSC,
                &CSIRC,
                &HSIDiv,
            },
        };
        const USART24output: ClockNode = .{
            .name = "USART24output",
            .Nodetype = .{ .output = .{ .max = 104500000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USART24Mult},
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
                &LSEOSC,
                &LSIRC,
            },
        };
        const RNG1output: ClockNode = .{
            .name = "RNG1output",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RNG1Mult},
        };
        const RNG2Mult: ClockNode = .{
            .name = "RNG2Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.RNG2Mult) },
            .parents = &[_]*const ClockNode{
                &CSIRC,
                &DIVR4,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RNG2output: ClockNode = .{
            .name = "RNG2output",
            .Nodetype = .{ .output = .{ .max = 48000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&RNG2Mult},
        };
        const SPI6Mult: ClockNode = .{
            .name = "SPI6Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI6Mult) },
            .parents = &[_]*const ClockNode{
                &APB5DIV,
                &DIVQ4,
                &DIVQ3,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI6Mult},
        };
        const SPI45Mult: ClockNode = .{
            .name = "SPI45Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SPI45Mult) },
            .parents = &[_]*const ClockNode{
                &APB1DIV,
                &DIVQ4,
                &HSIDiv,
                &CSIRC,
                &HSEOSC,
            },
        };
        const SPI45output: ClockNode = .{
            .name = "SPI45output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SPI45Mult},
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
        const SAI4Mult: ClockNode = .{
            .name = "SAI4Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI4Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SAI4output: ClockNode = .{
            .name = "SAI4output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAI4Mult},
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
            .Nodetype = .{ .output = null },
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI3Mult: ClockNode = .{
            .name = "SAI3Mult",

            .Nodetype = .{ .multi = @intFromEnum(config.SAI3Mult) },
            .parents = &[_]*const ClockNode{
                &DIVQ4,
                &DIVQ3,
                &I2S_CKIN,
                &CKPERCLKOutput,
                &DIVR3,
            },
        };
        const SAI3output: ClockNode = .{
            .name = "SAI3output",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&SAI3Mult},
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",

            .Nodetype = .{ .multi = @intFromEnum(config.FDCANMult) },
            .parents = &[_]*const ClockNode{
                &HSEOSC,
                &DIVQ3,
                &DIVQ4,
                &DIVR4,
            },
        };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .Nodetype = .{ .output = .{ .max = 100000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&FDCANMult},
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
        const ADCMult: ClockNode = .{
            .name = "ADCMult",

            .Nodetype = .{ .multi = @intFromEnum(config.ADCMult) },
            .parents = &[_]*const ClockNode{
                &DIVR4,
                &CKPERCLKOutput,
                &DIVQ3,
            },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = .{ .output = .{ .max = 133250000, .min = 0 } },
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const CSICECDevisor: ClockNode = .{
            .name = "CSICECDevisor",
            .Nodetype = .{ .div = .{ .value = config.CSICECDevisor.get() } },
            .parents = &[_]*const ClockNode{&CSIRC},
        };
        const CECMult: ClockNode = .{
            .name = "CECMult",

            .Nodetype = .{ .multi = @intFromEnum(config.CECMult) },
            .parents = &[_]*const ClockNode{
                &CSICECDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const CECoutput: ClockNode = .{
            .name = "CECoutput",
            .Nodetype = .{ .output = .{ .max = 1000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&CECMult},
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
            .Nodetype = .{ .output = .{ .max = 50000000, .min = 0 } },
            .parents = &[_]*const ClockNode{&USBOCLKMux},
        };
        const PLLDSIoutput: ClockNode = .{
            .name = "PLLDSIoutput",
            .Nodetype = .{ .output = .{ .max = 1000000000, .min = 62500000 } },
            .parents = &[_]*const ClockNode{&PLLDSIODF},
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
            .MCO1Mult = MCO1Mult,
            .MCO1Div = MCO1Div,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Div = MCO2Div,
            .MCO2Pin = MCO2Pin,
            .MCUDIV = MCUDIV,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .McuClockOutput = McuClockOutput,
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
            .LTDCOutput = LTDCOutput,
            .DIVR3output = DIVR3output,
            .DIVN4 = DIVN4,
            .PLL4FRACV = PLL4FRACV,
            .DIVP4 = DIVP4,
            .DIVP4output = DIVP4output,
            .PLL4DSIInput = PLL4DSIInput,
            .DIVQ4 = DIVQ4,
            .DIVQ4output = DIVQ4output,
            .DIVR4 = DIVR4,
            .DIVR4output = DIVR4output,
            .DSIPHYPrescaler = DSIPHYPrescaler,
            .DSIMult = DSIMult,
            .DSIoutput = DSIoutput,
            .DSITXPrescaler = DSITXPrescaler,
            .DSITXCLKEsc = DSITXCLKEsc,
            .DSIPixel = DSIPixel,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .I2C12Mult = I2C12Mult,
            .I2C12output = I2C12output,
            .I2C35Mult = I2C35Mult,
            .I2C35output = I2C35output,
            .I2C46Mult = I2C46Mult,
            .I2C46output = I2C46output,
            .SPDIFMult = SPDIFMult,
            .SPDIFoutput = SPDIFoutput,
            .QSPIMult = QSPIMult,
            .QSPIoutput = QSPIoutput,
            .FMCMult = FMCMult,
            .FMCoutput = FMCoutput,
            .SDMMC12Mult = SDMMC12Mult,
            .SDMMC12output = SDMMC12output,
            .SDMMC3Mult = SDMMC3Mult,
            .SDMMC3output = SDMMC3output,
            .STGENMult = STGENMult,
            .STGENoutput = STGENoutput,
            .LPTIM45Mult = LPTIM45Mult,
            .LPTIM45output = LPTIM45output,
            .LPTIM23Mult = LPTIM23Mult,
            .LPTIM23output = LPTIM23output,
            .LPTIM1Mult = LPTIM1Mult,
            .LPTIM1output = LPTIM1output,
            .USART1Mult = USART1Mult,
            .USART1output = USART1output,
            .USART24Mult = USART24Mult,
            .USART24output = USART24output,
            .USART35Mult = USART35Mult,
            .USART35output = USART35output,
            .USART6Mult = USART6Mult,
            .USART6output = USART6output,
            .UART78Mult = UART78Mult,
            .USART78output = USART78output,
            .RNG1Mult = RNG1Mult,
            .RNG1output = RNG1output,
            .RNG2Mult = RNG2Mult,
            .RNG2output = RNG2output,
            .SPI6Mult = SPI6Mult,
            .SPI6output = SPI6output,
            .SPI45Mult = SPI45Mult,
            .SPI45output = SPI45output,
            .SAI2Mult = SAI2Mult,
            .SAI2output = SAI2output,
            .SAI4Mult = SAI4Mult,
            .SAI4output = SAI4output,
            .SPI1Mult = SPI1Mult,
            .SPI1output = SPI1output,
            .SPI23Mult = SPI23Mult,
            .SPI23output = SPI23output,
            .SAI1Mult = SAI1Mult,
            .SAI1output = SAI1output,
            .DFSDF1Audiooutput = DFSDF1Audiooutput,
            .SAI3Mult = SAI3Mult,
            .SAI3output = SAI3output,
            .FDCANMult = FDCANMult,
            .FDCANoutput = FDCANoutput,
            .ETH1Mult = ETH1Mult,
            .ETH1output = ETH1output,
            .ADCMult = ADCMult,
            .ADCoutput = ADCoutput,
            .CSICECDevisor = CSICECDevisor,
            .CECMult = CECMult,
            .CECoutput = CECoutput,
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
            .PLLDSIIDF = PLLDSIIDF,
            .PLLDSIMultiplicator = PLLDSIMultiplicator,
            .PLLDSINDIV = PLLDSINDIV,
            .VCOoutput = VCOoutput,
            .PLLDSIDevisor = PLLDSIDevisor,
            .PLLDSIODF = PLLDSIODF,
            .PLLDSIoutput = PLLDSIoutput,
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
        _ = self.CortexSysOutput.get_comptime();
        _ = self.McuClockOutput.get_comptime();
        _ = self.APB3Output.get_comptime();
        _ = self.Tim1Output.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.Tim2Output.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.DFSDM1Output.get_comptime();
        _ = self.DIVQ2output.get_comptime();
        _ = self.LTDCOutput.get_comptime();
        _ = self.DSIoutput.get_comptime();
        _ = self.DSITXCLKEsc.get_comptime();
        _ = self.DSIPixel.get_comptime();
        _ = self.I2C12output.get_comptime();
        _ = self.I2C35output.get_comptime();
        _ = self.I2C46output.get_comptime();
        _ = self.SPDIFoutput.get_comptime();
        _ = self.QSPIoutput.get_comptime();
        _ = self.FMCoutput.get_comptime();
        _ = self.SDMMC12output.get_comptime();
        _ = self.SDMMC3output.get_comptime();
        _ = self.STGENoutput.get_comptime();
        _ = self.LPTIM45output.get_comptime();
        _ = self.LPTIM23output.get_comptime();
        _ = self.LPTIM1output.get_comptime();
        _ = self.USART1output.get_comptime();
        _ = self.USART24output.get_comptime();
        _ = self.USART35output.get_comptime();
        _ = self.USART6output.get_comptime();
        _ = self.USART78output.get_comptime();
        _ = self.RNG1output.get_comptime();
        _ = self.RNG2output.get_comptime();
        _ = self.SPI6output.get_comptime();
        _ = self.SPI45output.get_comptime();
        _ = self.SAI2output.get_comptime();
        _ = self.SAI4output.get_comptime();
        _ = self.SPI1output.get_comptime();
        _ = self.SPI23output.get_comptime();
        _ = self.SAI1output.get_comptime();
        _ = self.DFSDF1Audiooutput.get_comptime();
        _ = self.SAI3output.get_comptime();
        _ = self.FDCANoutput.get_comptime();
        _ = self.ETH1output.get_comptime();
        _ = self.ADCoutput.get_comptime();
        _ = self.CECoutput.get_comptime();
        _ = self.DDRC.get_comptime();
        _ = self.DDRPERFM.get_comptime();
        _ = self.USBPHYCLKOutput.get_comptime();
        _ = self.USBOFSCLKOutput.get_comptime();
    }
};
