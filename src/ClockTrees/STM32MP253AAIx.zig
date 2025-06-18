const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

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
        return 16000000;
    }
};
pub const HSEDIV2Conf = enum {
    @"2",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
        };
    }
};
pub const SPDIFConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 12288000;
    }

    pub fn min() f32 {
        return 3072000;
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
    RCC_MSI_16MHZ,
    RCC_MSI_4MHZ,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSI_16MHZ => 16,
            .RCC_MSI_4MHZ => 4,
        };
    }
};
pub const XBAR0Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR0PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR0FindivConf = enum(u32) {
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
pub const XBAR1Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR1PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR1FindivConf = enum(u32) {
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
pub const XBAR2Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR2PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR2FindivConf = enum(u32) {
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
pub const XBAR3Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR3PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR3FindivConf = enum(u32) {
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
pub const XBAR4Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR4PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR4FindivConf = enum(u32) {
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
pub const XBAR5Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR5PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR5FindivConf = enum(u32) {
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
pub const XBAR6Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR6PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR6FindivConf = enum(u32) {
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
pub const XBAR7Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    LSIRC,
    LSEOSC,
};
pub const XBAR7PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR7FindivConf = enum(u32) {
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
pub const XBAR8Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR8PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR8FindivConf = enum(u32) {
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
pub const XBAR9Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR9PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR9FindivConf = enum(u32) {
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
pub const XBAR10Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR10PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR10FindivConf = enum(u32) {
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
pub const XBAR11Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR11PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR11FindivConf = enum(u32) {
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
pub const XBAR12Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR12PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR12FindivConf = enum(u32) {
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
pub const XBAR13Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR13PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR13FindivConf = enum(u32) {
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
pub const XBAR14Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR14PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR14FindivConf = enum(u32) {
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
pub const XBAR15Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR15PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR15FindivConf = enum(u32) {
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
pub const XBAR16Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR16PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR16FindivConf = enum(u32) {
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
pub const XBAR17Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR17PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR17FindivConf = enum(u32) {
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
pub const XBAR18Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR18PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR18FindivConf = enum(u32) {
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
pub const XBAR19Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR19PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR19FindivConf = enum(u32) {
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
pub const XBAR20Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR20PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR20FindivConf = enum(u32) {
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
pub const XBAR21Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR21PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR21FindivConf = enum(u32) {
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
pub const XBAR22Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR22PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR22FindivConf = enum(u32) {
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
pub const XBAR23Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
};
pub const XBAR23PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR23FindivConf = enum(u32) {
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
pub const XBAR24Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
};
pub const XBAR24PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR24FindivConf = enum(u32) {
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
pub const XBAR25Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
};
pub const XBAR25PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR25FindivConf = enum(u32) {
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
pub const XBAR26Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR26PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR26FindivConf = enum(u32) {
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
pub const XBAR27Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR27PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR27FindivConf = enum(u32) {
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
pub const XBAR28Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR28PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR28FindivConf = enum(u32) {
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
pub const XBAR29Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR29PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR29FindivConf = enum(u32) {
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
pub const XBAR30Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR30PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR30FindivConf = enum(u32) {
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
pub const XBAR31Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR31PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR31FindivConf = enum(u32) {
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
pub const XBAR32Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR32PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR32FindivConf = enum(u32) {
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
pub const XBAR33Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
};
pub const XBAR33PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR33FindivConf = enum(u32) {
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
pub const XBAR34Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR34PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR34FindivConf = enum(u32) {
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
pub const XBAR35Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
};
pub const XBAR35PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR35FindivConf = enum(u32) {
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
pub const XBAR36Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR36PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR36FindivConf = enum(u32) {
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
pub const XBAR37Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR37PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR37FindivConf = enum(u32) {
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
pub const XBAR38Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR38PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR38FindivConf = enum(u32) {
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
pub const XBAR39Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR39PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR39FindivConf = enum(u32) {
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
pub const XBAR40Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    LSIRC,
    LSEOSC,
};
pub const XBAR40PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR40FindivConf = enum(u32) {
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
pub const XBAR41Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    LSIRC,
    LSEOSC,
};
pub const XBAR41PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR41FindivConf = enum(u32) {
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
pub const XBAR42Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR42PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR42FindivConf = enum(u32) {
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
pub const XBAR43Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR43PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR43FindivConf = enum(u32) {
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
pub const XBAR44Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR44PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR44FindivConf = enum(u32) {
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
pub const XBAR45Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR45PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR45FindivConf = enum(u32) {
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
pub const XBAR46Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR46PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR46FindivConf = enum(u32) {
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
pub const XBAR47Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR47PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR47FindivConf = enum(u32) {
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
pub const XBAR48Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR48PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR48FindivConf = enum(u32) {
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
pub const XBAR49Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR49PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR49FindivConf = enum(u32) {
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
pub const XBAR50Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR50PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR50FindivConf = enum(u32) {
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
pub const XBAR51Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR51PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR51FindivConf = enum(u32) {
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
pub const XBAR52Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR52PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR52FindivConf = enum(u32) {
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
pub const XBAR53Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR53PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR53FindivConf = enum(u32) {
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
pub const XBAR54Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR54PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR54FindivConf = enum(u32) {
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
pub const XBAR55Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR55PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR55FindivConf = enum(u32) {
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
pub const XBAR56Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR56PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR56FindivConf = enum(u32) {
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
pub const XBAR57Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR57PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR57FindivConf = enum(u32) {
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
pub const XBAR58Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR58PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR58FindivConf = enum(u32) {
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
pub const XBAR59Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR59PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR59FindivConf = enum(u32) {
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
pub const XBAR60Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR60PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR60FindivConf = enum(u32) {
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
pub const XBAR61Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR61PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR61FindivConf = enum(u32) {
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
pub const XBAR62Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR62PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR62FindivConf = enum(u32) {
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
pub const XBAR63Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR63PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"1" => 1,
            .@"2" => 2,
            .@"4" => 4,
            .@"1024" => 1024,
        };
    }
};
pub const XBAR63FindivConf = enum(u32) {
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
pub const CKINTSEL0Conf = enum {
    HSIRC,
    HSEOSC,
    MSIRC,
    PLL4Source,
    PLL5Source,
    PLL6Source,
    PLL7Source,
    PLL8Source,
    PLL1Source,
    PLL2Source,
    PLL3Source,
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
    XBAR0Output,
    XBAR1Output,
    XBAR2Output,
    XBAR3Output,
    XBAR4Output,
    XBAR5Output,
    XBAR6Output,
    XBAR7Output,
    XBAR8Output,
    XBAR9Output,
    XBAR10Output,
    XBAR11Output,
    XBAR12Output,
    XBAR13Output,
    XBAR14Output,
    XBAR15Output,
    XBAR16Output,
    XBAR17Output,
    XBAR18Output,
    XBAR19Output,
    XBAR20Output,
    XBAR21Output,
    XBAR22Output,
    XBAR23Output,
    XBAR24Output,
    XBAR25Output,
    XBAR26Output,
    XBAR27Output,
    XBAR28Output,
    XBAR29Output,
    XBAR30Output,
    XBAR31Output,
    XBAR32Output,
    XBAR33Output,
    XBAR34Output,
    XBAR35Output,
    XBAR36Output,
    XBAR37Output,
    XBAR38Output,
    XBAR39Output,
    XBAR40Output,
    XBAR41Output,
    XBAR42Output,
    XBAR43Output,
    XBAR44Output,
    XBAR45Output,
    XBAR46Output,
    XBAR47Output,
    XBAR48Output,
    XBAR49Output,
    XBAR50Output,
    XBAR51Output,
    XBAR52Output,
    XBAR53Output,
    XBAR54Output,
    XBAR55Output,
    XBAR56Output,
    XBAR57Output,
    XBAR58Output,
    XBAR59Output,
    XBAR60Output,
    XBAR61Output,
    XBAR62Output,
    XBAR63Output,
};
pub const CKEXTSEL0Conf = enum {
    PLL1Div42,
    PLL2Div4,
    PLL3Div2,
};
pub const CKINTSEL1Conf = enum {
    HSIRC,
    HSEOSC,
    MSIRC,
    PLL4Source,
    PLL5Source,
    PLL6Source,
    PLL7Source,
    PLL8Source,
    PLL1Source,
    PLL2Source,
    PLL3Source,
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
    XBAR0Output,
    XBAR1Output,
    XBAR2Output,
    XBAR3Output,
    XBAR4Output,
    XBAR5Output,
    XBAR6Output,
    XBAR7Output,
    XBAR8Output,
    XBAR9Output,
    XBAR10Output,
    XBAR11Output,
    XBAR12Output,
    XBAR13Output,
    XBAR14Output,
    XBAR15Output,
    XBAR16Output,
    XBAR17Output,
    XBAR18Output,
    XBAR19Output,
    XBAR20Output,
    XBAR21Output,
    XBAR22Output,
    XBAR23Output,
    XBAR24Output,
    XBAR25Output,
    XBAR26Output,
    XBAR27Output,
    XBAR28Output,
    XBAR29Output,
    XBAR30Output,
    XBAR31Output,
    XBAR32Output,
    XBAR33Output,
    XBAR34Output,
    XBAR35Output,
    XBAR36Output,
    XBAR37Output,
    XBAR38Output,
    XBAR39Output,
    XBAR40Output,
    XBAR41Output,
    XBAR42Output,
    XBAR43Output,
    XBAR44Output,
    XBAR45Output,
    XBAR46Output,
    XBAR47Output,
    XBAR48Output,
    XBAR49Output,
    XBAR50Output,
    XBAR51Output,
    XBAR52Output,
    XBAR53Output,
    XBAR54Output,
    XBAR55Output,
    XBAR56Output,
    XBAR57Output,
    XBAR58Output,
    XBAR59Output,
    XBAR60Output,
    XBAR61Output,
    XBAR62Output,
    XBAR63Output,
};
pub const CKEXTSEL1Conf = enum {
    PLL1Div42,
    PLL2Div4,
    PLL3Div2,
};
pub const OBS0Conf = enum {
    CKINTSEL0,
    CKEXTSEL0,
};
pub const OBS1Conf = enum {
    CKINTSEL1,
    CKEXTSEL1,
};
pub const MCO1MultConf = enum {
    XBAR61Output,
    OBS0Output,
};
pub const MCO2MultConf = enum {
    XBAR62Output,
    OBS1Output,
};
pub const D3PERConf = enum {
    MSIRC,
    LSIRC,
    LSEOSC,
};
pub const DTSConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const DSIPHYConf = enum {
    XBAR28Output,
    HSEOSC,
};
pub const DSIBLANEConf = enum {
    DSIPHYOutput,
    XBAR27Output,
};
pub const USB2PHY1Conf = enum {
    XBAR57Output,
    HSEDIV2,
};
pub const USB2PHY2Conf = enum {
    XBAR58Output,
    HSEDIV2,
};
pub const USB3PCIPHYConf = enum {
    XBAR34Output,
    HSEDIV2,
};
pub const SysClkSourceConf = enum {
    XBAR0Output,
    HSIRC,
};
pub const MCUDIVConf = enum {
    RCC_MCU_DIV1,
    RCC_MCU_DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCU_DIV1 => 1,
            .RCC_MCU_DIV2 => 2,
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
pub const APBDBGDIVConf = enum {
    RCC_APBDBG_DIV1,
    RCC_APBDBG_DIV2,
    RCC_APBDBG_DIV4,
    RCC_APBDBG_DIV8,
    RCC_APBDBG_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APBDBG_DIV1 => 1,
            .RCC_APBDBG_DIV2 => 2,
            .RCC_APBDBG_DIV4 => 4,
            .RCC_APBDBG_DIV8 => 8,
            .RCC_APBDBG_DIV16 => 16,
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
pub const ADC12MultConf = enum {
    XBAR46Output,
    XBAR0Output,
};
pub const ADC3MultConf = enum {
    XBAR47Output,
    XBAR0Output,
    XBAR46Output,
};
pub const PLL1SourceConf = enum {
    HSIRC,
    HSEOSC,
    MSIRC,
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
    HSEOSC,
    MSIRC,
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
        return 16;
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
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
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
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
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
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
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
pub const PLL5SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV5Conf = enum(u32) {
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
pub const FBDIV5Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
    }
};
pub const PLL5FRACVConf = enum(u32) {
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
pub const POSTDIV1_5Conf = enum(u32) {
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
pub const POSTDIV2_5Conf = enum(u32) {
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
pub const PLL6SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV6Conf = enum(u32) {
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
pub const FBDIV6Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
    }
};
pub const PLL6FRACVConf = enum(u32) {
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
pub const POSTDIV1_6Conf = enum(u32) {
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
pub const POSTDIV2_6Conf = enum(u32) {
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
pub const PLL7SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV7Conf = enum(u32) {
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
pub const FBDIV7Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
    }
};
pub const PLL7FRACVConf = enum(u32) {
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
pub const POSTDIV1_7Conf = enum(u32) {
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
pub const POSTDIV2_7Conf = enum(u32) {
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
pub const PLL8SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV8Conf = enum(u32) {
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
pub const FBDIV8Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 12297829382473034410;
    }

    pub fn min() f32 {
        return 12297829382473034410;
    }
};
pub const PLL8FRACVConf = enum(u32) {
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
pub const POSTDIV1_8Conf = enum(u32) {
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
pub const POSTDIV2_8Conf = enum(u32) {
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
pub const LSE_Drive_CapabilityConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(40000000),
    HSEDIV2: HSEDIV2Conf = .@"2",
    SPDIF: SPDIFConf = @enumFromInt(12288000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .RCC_MSI_16MHZ,
    XBAR0: XBAR0Conf = .HSIRC,
    XBAR0Prediv: XBAR0PredivConf = .@"1",
    XBAR0Findiv: XBAR0FindivConf = @enumFromInt(1),
    XBAR1: XBAR1Conf = .HSIRC,
    XBAR1Prediv: XBAR1PredivConf = .@"1",
    XBAR1Findiv: XBAR1FindivConf = @enumFromInt(1),
    XBAR2: XBAR2Conf = .HSIRC,
    XBAR2Prediv: XBAR2PredivConf = .@"1",
    XBAR2Findiv: XBAR2FindivConf = @enumFromInt(1),
    XBAR3: XBAR3Conf = .HSIRC,
    XBAR3Prediv: XBAR3PredivConf = .@"1",
    XBAR3Findiv: XBAR3FindivConf = @enumFromInt(1),
    XBAR4: XBAR4Conf = .HSIRC,
    XBAR4Prediv: XBAR4PredivConf = .@"1",
    XBAR4Findiv: XBAR4FindivConf = @enumFromInt(1),
    XBAR5: XBAR5Conf = .HSIRC,
    XBAR5Prediv: XBAR5PredivConf = .@"1",
    XBAR5Findiv: XBAR5FindivConf = @enumFromInt(1),
    XBAR6: XBAR6Conf = .HSIRC,
    XBAR6Prediv: XBAR6PredivConf = .@"1",
    XBAR6Findiv: XBAR6FindivConf = @enumFromInt(1),
    XBAR7: XBAR7Conf = .LSIRC,
    XBAR7Prediv: XBAR7PredivConf = .@"1",
    XBAR7Findiv: XBAR7FindivConf = @enumFromInt(1),
    XBAR8: XBAR8Conf = .HSIRC,
    XBAR8Prediv: XBAR8PredivConf = .@"1",
    XBAR8Findiv: XBAR8FindivConf = @enumFromInt(1),
    XBAR9: XBAR9Conf = .HSIRC,
    XBAR9Prediv: XBAR9PredivConf = .@"1",
    XBAR9Findiv: XBAR9FindivConf = @enumFromInt(1),
    XBAR10: XBAR10Conf = .HSIRC,
    XBAR10Prediv: XBAR10PredivConf = .@"1",
    XBAR10Findiv: XBAR10FindivConf = @enumFromInt(1),
    XBAR11: XBAR11Conf = .HSIRC,
    XBAR11Prediv: XBAR11PredivConf = .@"1",
    XBAR11Findiv: XBAR11FindivConf = @enumFromInt(1),
    XBAR12: XBAR12Conf = .HSIRC,
    XBAR12Prediv: XBAR12PredivConf = .@"1",
    XBAR12Findiv: XBAR12FindivConf = @enumFromInt(1),
    XBAR13: XBAR13Conf = .HSIRC,
    XBAR13Prediv: XBAR13PredivConf = .@"1",
    XBAR13Findiv: XBAR13FindivConf = @enumFromInt(1),
    XBAR14: XBAR14Conf = .HSIRC,
    XBAR14Prediv: XBAR14PredivConf = .@"1",
    XBAR14Findiv: XBAR14FindivConf = @enumFromInt(1),
    XBAR15: XBAR15Conf = .HSIRC,
    XBAR15Prediv: XBAR15PredivConf = .@"1",
    XBAR15Findiv: XBAR15FindivConf = @enumFromInt(1),
    XBAR16: XBAR16Conf = .HSIRC,
    XBAR16Prediv: XBAR16PredivConf = .@"1",
    XBAR16Findiv: XBAR16FindivConf = @enumFromInt(1),
    XBAR17: XBAR17Conf = .HSIRC,
    XBAR17Prediv: XBAR17PredivConf = .@"1",
    XBAR17Findiv: XBAR17FindivConf = @enumFromInt(1),
    XBAR18: XBAR18Conf = .HSIRC,
    XBAR18Prediv: XBAR18PredivConf = .@"1",
    XBAR18Findiv: XBAR18FindivConf = @enumFromInt(1),
    XBAR19: XBAR19Conf = .HSIRC,
    XBAR19Prediv: XBAR19PredivConf = .@"1",
    XBAR19Findiv: XBAR19FindivConf = @enumFromInt(1),
    XBAR20: XBAR20Conf = .HSIRC,
    XBAR20Prediv: XBAR20PredivConf = .@"1",
    XBAR20Findiv: XBAR20FindivConf = @enumFromInt(1),
    XBAR21: XBAR21Conf = .HSIRC,
    XBAR21Prediv: XBAR21PredivConf = .@"1",
    XBAR21Findiv: XBAR21FindivConf = @enumFromInt(1),
    XBAR22: XBAR22Conf = .HSIRC,
    XBAR22Prediv: XBAR22PredivConf = .@"1",
    XBAR22Findiv: XBAR22FindivConf = @enumFromInt(1),
    XBAR23: XBAR23Conf = .HSIRC,
    XBAR23Prediv: XBAR23PredivConf = .@"1",
    XBAR23Findiv: XBAR23FindivConf = @enumFromInt(1),
    XBAR24: XBAR24Conf = .HSIRC,
    XBAR24Prediv: XBAR24PredivConf = .@"1",
    XBAR24Findiv: XBAR24FindivConf = @enumFromInt(1),
    XBAR25: XBAR25Conf = .HSIRC,
    XBAR25Prediv: XBAR25PredivConf = .@"1",
    XBAR25Findiv: XBAR25FindivConf = @enumFromInt(1),
    XBAR26: XBAR26Conf = .HSEOSC,
    XBAR26Prediv: XBAR26PredivConf = .@"1",
    XBAR26Findiv: XBAR26FindivConf = @enumFromInt(1),
    XBAR27: XBAR27Conf = .FOUTPOSTDIV8,
    XBAR27Prediv: XBAR27PredivConf = .@"1",
    XBAR27Findiv: XBAR27FindivConf = @enumFromInt(1),
    XBAR28: XBAR28Conf = .HSEOSC,
    XBAR28Prediv: XBAR28PredivConf = .@"1",
    XBAR28Findiv: XBAR28FindivConf = @enumFromInt(1),
    XBAR29: XBAR29Conf = .FOUTPOSTDIV8,
    XBAR29Prediv: XBAR29PredivConf = .@"1",
    XBAR29Findiv: XBAR29FindivConf = @enumFromInt(1),
    XBAR30: XBAR30Conf = .HSEOSC,
    XBAR30Prediv: XBAR30PredivConf = .@"1",
    XBAR30Findiv: XBAR30FindivConf = @enumFromInt(1),
    XBAR31: XBAR31Conf = .HSEOSC,
    XBAR31Prediv: XBAR31PredivConf = .@"1",
    XBAR31Findiv: XBAR31FindivConf = @enumFromInt(1),
    XBAR32: XBAR32Conf = .HSEOSC,
    XBAR32Prediv: XBAR32PredivConf = .@"1",
    XBAR32Findiv: XBAR32FindivConf = @enumFromInt(1),
    XBAR33: XBAR33Conf = .HSIRC,
    XBAR33Prediv: XBAR33PredivConf = .@"1",
    XBAR33Findiv: XBAR33FindivConf = @enumFromInt(1),
    XBAR34: XBAR34Conf = .HSEOSC,
    XBAR34Prediv: XBAR34PredivConf = .@"1",
    XBAR34Findiv: XBAR34FindivConf = @enumFromInt(1),
    XBAR35: XBAR35Conf = .HSIRC,
    XBAR35Prediv: XBAR35PredivConf = .@"1",
    XBAR35Findiv: XBAR35FindivConf = @enumFromInt(1),
    XBAR36: XBAR36Conf = .MSIRC,
    XBAR36Prediv: XBAR36PredivConf = .@"1",
    XBAR36Findiv: XBAR36FindivConf = @enumFromInt(1),
    XBAR37: XBAR37Conf = .HSIRC,
    XBAR37Prediv: XBAR37PredivConf = .@"1",
    XBAR37Findiv: XBAR37FindivConf = @enumFromInt(1),
    XBAR38: XBAR38Conf = .HSIRC,
    XBAR38Prediv: XBAR38PredivConf = .@"1",
    XBAR38Findiv: XBAR38FindivConf = @enumFromInt(1),
    XBAR39: XBAR39Conf = .HSIRC,
    XBAR39Prediv: XBAR39PredivConf = .@"1",
    XBAR39Findiv: XBAR39FindivConf = @enumFromInt(1),
    XBAR40: XBAR40Conf = .LSIRC,
    XBAR40Prediv: XBAR40PredivConf = .@"1",
    XBAR40Findiv: XBAR40FindivConf = @enumFromInt(1),
    XBAR41: XBAR41Conf = .LSIRC,
    XBAR41Prediv: XBAR41PredivConf = .@"1",
    XBAR41Findiv: XBAR41FindivConf = @enumFromInt(1),
    XBAR42: XBAR42Conf = .HSIRC,
    XBAR42Prediv: XBAR42PredivConf = .@"1",
    XBAR42Findiv: XBAR42FindivConf = @enumFromInt(1),
    XBAR43: XBAR43Conf = .FOUTPOSTDIV8,
    XBAR43Prediv: XBAR43PredivConf = .@"1",
    XBAR43Findiv: XBAR43FindivConf = @enumFromInt(1),
    XBAR44: XBAR44Conf = .FOUTPOSTDIV8,
    XBAR44Prediv: XBAR44PredivConf = .@"1",
    XBAR44Findiv: XBAR44FindivConf = @enumFromInt(1),
    XBAR45: XBAR45Conf = .FOUTPOSTDIV8,
    XBAR45Prediv: XBAR45PredivConf = .@"1",
    XBAR45Findiv: XBAR45FindivConf = @enumFromInt(1),
    XBAR46: XBAR46Conf = .HSIRC,
    XBAR46Prediv: XBAR46PredivConf = .@"1",
    XBAR46Findiv: XBAR46FindivConf = @enumFromInt(1),
    XBAR47: XBAR47Conf = .FOUTPOSTDIV8,
    XBAR47Prediv: XBAR47PredivConf = .@"1",
    XBAR47Findiv: XBAR47FindivConf = @enumFromInt(1),
    XBAR48: XBAR48Conf = .FOUTPOSTDIV8,
    XBAR48Prediv: XBAR48PredivConf = .@"1",
    XBAR48Findiv: XBAR48FindivConf = @enumFromInt(1),
    XBAR49: XBAR49Conf = .FOUTPOSTDIV8,
    XBAR49Prediv: XBAR49PredivConf = .@"1",
    XBAR49Findiv: XBAR49FindivConf = @enumFromInt(1),
    XBAR50: XBAR50Conf = .FOUTPOSTDIV8,
    XBAR50Prediv: XBAR50PredivConf = .@"1",
    XBAR50Findiv: XBAR50FindivConf = @enumFromInt(1),
    XBAR51: XBAR51Conf = .HSIRC,
    XBAR51Prediv: XBAR51PredivConf = .@"1",
    XBAR51Findiv: XBAR51FindivConf = @enumFromInt(1),
    XBAR52: XBAR52Conf = .HSIRC,
    XBAR52Prediv: XBAR52PredivConf = .@"1",
    XBAR52Findiv: XBAR52FindivConf = @enumFromInt(1),
    XBAR53: XBAR53Conf = .HSIRC,
    XBAR53Prediv: XBAR53PredivConf = .@"1",
    XBAR53Findiv: XBAR53FindivConf = @enumFromInt(1),
    XBAR54: XBAR54Conf = .FOUTPOSTDIV8,
    XBAR54Prediv: XBAR54PredivConf = .@"1",
    XBAR54Findiv: XBAR54FindivConf = @enumFromInt(1),
    XBAR55: XBAR55Conf = .FOUTPOSTDIV8,
    XBAR55Prediv: XBAR55PredivConf = .@"1",
    XBAR55Findiv: XBAR55FindivConf = @enumFromInt(1),
    XBAR56: XBAR56Conf = .HSIRC,
    XBAR56Prediv: XBAR56PredivConf = .@"1",
    XBAR56Findiv: XBAR56FindivConf = @enumFromInt(1),
    XBAR57: XBAR57Conf = .HSEOSC,
    XBAR57Prediv: XBAR57PredivConf = .@"1",
    XBAR57Findiv: XBAR57FindivConf = @enumFromInt(1),
    XBAR58: XBAR58Conf = .HSEOSC,
    XBAR58Prediv: XBAR58PredivConf = .@"1",
    XBAR58Findiv: XBAR58FindivConf = @enumFromInt(1),
    XBAR59: XBAR59Conf = .FOUTPOSTDIV8,
    XBAR59Prediv: XBAR59PredivConf = .@"1",
    XBAR59Findiv: XBAR59FindivConf = @enumFromInt(1),
    XBAR60: XBAR60Conf = .FOUTPOSTDIV8,
    XBAR60Prediv: XBAR60PredivConf = .@"1",
    XBAR60Findiv: XBAR60FindivConf = @enumFromInt(1),
    XBAR61: XBAR61Conf = .HSIRC,
    XBAR61Prediv: XBAR61PredivConf = .@"1",
    XBAR61Findiv: XBAR61FindivConf = @enumFromInt(1),
    XBAR62: XBAR62Conf = .HSIRC,
    XBAR62Prediv: XBAR62PredivConf = .@"1",
    XBAR62Findiv: XBAR62FindivConf = @enumFromInt(1),
    XBAR63: XBAR63Conf = .HSIRC,
    XBAR63Prediv: XBAR63PredivConf = .@"1",
    XBAR63Findiv: XBAR63FindivConf = @enumFromInt(1),
    CKINTSEL0: CKINTSEL0Conf = .MSIRC,
    CKEXTSEL0: CKEXTSEL0Conf = .PLL1Div42,
    CKINTSEL1: CKINTSEL1Conf = .MSIRC,
    CKEXTSEL1: CKEXTSEL1Conf = .PLL1Div42,
    OBS0: OBS0Conf = .CKINTSEL0,
    OBS1: OBS1Conf = .CKINTSEL1,
    MCO1Mult: MCO1MultConf = .XBAR61Output,
    MCO2Mult: MCO2MultConf = .XBAR62Output,
    D3PER: D3PERConf = .MSIRC,
    DTS: DTSConf = .MSIRC,
    DSIPHY: DSIPHYConf = .XBAR28Output,
    DSIBLANE: DSIBLANEConf = .DSIPHYOutput,
    USB2PHY1: USB2PHY1Conf = .XBAR57Output,
    USB2PHY2: USB2PHY2Conf = .XBAR58Output,
    USB3PCIPHY: USB3PCIPHYConf = .XBAR34Output,
    SysClkSource: SysClkSourceConf = .XBAR0Output,
    MCUDIV: MCUDIVConf = .RCC_MCU_DIV1,
    APB3DIV: APB3DIVConf = .RCC_APB3_DIV1,
    APB4DIV: APB4DIVConf = .RCC_APB4_DIV1,
    APBDBGDIV: APBDBGDIVConf = .RCC_APBDBG_DIV1,
    APB1DIV: APB1DIVConf = .RCC_APB1_DIV1,
    APB2DIV: APB2DIVConf = .RCC_APB2_DIV1,
    ADC12Mult: ADC12MultConf = .XBAR46Output,
    ADC3Mult: ADC3MultConf = .XBAR47Output,
    PLL1Source: PLL1SourceConf = .HSIRC,
    FREFDIV1: FREFDIV1Conf = @enumFromInt(1),
    PLL2Source: PLL2SourceConf = .HSIRC,
    FREFDIV2: FREFDIV2Conf = @enumFromInt(1),
    PLL3Source: PLL3SourceConf = .HSIRC,
    FREFDIV3: FREFDIV3Conf = @enumFromInt(1),
    PLL4Source: PLL4SourceConf = .HSIRC,
    FREFDIV4: FREFDIV4Conf = @enumFromInt(1),
    FBDIV1: FBDIV1Conf = @enumFromInt(25),
    POSTDIV1_1: POSTDIV1_1Conf = @enumFromInt(1),
    POSTDIV2_1: POSTDIV2_1Conf = @enumFromInt(1),
    FBDIV2: FBDIV2Conf = @enumFromInt(12297829382473034410),
    PLL2FRACV: PLL2FRACVConf = @enumFromInt(0),
    POSTDIV1_2: POSTDIV1_2Conf = @enumFromInt(1),
    POSTDIV2_2: POSTDIV2_2Conf = @enumFromInt(1),
    FBDIV3: FBDIV3Conf = @enumFromInt(12297829382473034410),
    PLL3FRACV: PLL3FRACVConf = @enumFromInt(0),
    POSTDIV1_3: POSTDIV1_3Conf = @enumFromInt(1),
    POSTDIV2_3: POSTDIV2_3Conf = @enumFromInt(1),
    FBDIV4: FBDIV4Conf = @enumFromInt(12297829382473034410),
    PLL4FRACV: PLL4FRACVConf = @enumFromInt(0),
    POSTDIV1_4: POSTDIV1_4Conf = @enumFromInt(1),
    POSTDIV2_4: POSTDIV2_4Conf = @enumFromInt(1),
    PLL5Source: PLL5SourceConf = .HSIRC,
    FREFDIV5: FREFDIV5Conf = @enumFromInt(1),
    FBDIV5: FBDIV5Conf = @enumFromInt(12297829382473034410),
    PLL5FRACV: PLL5FRACVConf = @enumFromInt(0),
    POSTDIV1_5: POSTDIV1_5Conf = @enumFromInt(1),
    POSTDIV2_5: POSTDIV2_5Conf = @enumFromInt(1),
    PLL6Source: PLL6SourceConf = .HSIRC,
    FREFDIV6: FREFDIV6Conf = @enumFromInt(1),
    FBDIV6: FBDIV6Conf = @enumFromInt(12297829382473034410),
    PLL6FRACV: PLL6FRACVConf = @enumFromInt(0),
    POSTDIV1_6: POSTDIV1_6Conf = @enumFromInt(1),
    POSTDIV2_6: POSTDIV2_6Conf = @enumFromInt(1),
    PLL7Source: PLL7SourceConf = .HSIRC,
    FREFDIV7: FREFDIV7Conf = @enumFromInt(1),
    FBDIV7: FBDIV7Conf = @enumFromInt(12297829382473034410),
    PLL7FRACV: PLL7FRACVConf = @enumFromInt(0),
    POSTDIV1_7: POSTDIV1_7Conf = @enumFromInt(1),
    POSTDIV2_7: POSTDIV2_7Conf = @enumFromInt(1),
    PLL8Source: PLL8SourceConf = .HSIRC,
    FREFDIV8: FREFDIV8Conf = @enumFromInt(1),
    FBDIV8: FBDIV8Conf = @enumFromInt(12297829382473034410),
    PLL8FRACV: PLL8FRACVConf = @enumFromInt(0),
    POSTDIV1_8: POSTDIV1_8Conf = @enumFromInt(1),
    POSTDIV2_8: POSTDIV2_8Conf = @enumFromInt(1),
    HSERTCDevisor: HSERTCDevisorConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    RCC_TIM_G1_PRescaler_Selection: RCC_TIM_G1_PRescaler_SelectionConf = .RCC_TIMG1PRES_DEACTIVATED,
    RCC_TIM_G2_PRescaler_Selection: RCC_TIM_G2_PRescaler_SelectionConf = .RCC_TIMG2PRES_DEACTIVATED,
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    HSEOSC: ClockNode,
    HSEDIV2: ClockNode,
    SPDIF: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    MSIRC: ClockNode,
    I2S_CKIN: ClockNode,
    XBAR0: ClockNode,
    XBAR0Prediv: ClockNode,
    XBAR0Findiv: ClockNode,
    XBAR0Output: ClockNode,
    XBAR1: ClockNode,
    XBAR1Prediv: ClockNode,
    XBAR1Findiv: ClockNode,
    XBAR1Output: ClockNode,
    XBAR2: ClockNode,
    XBAR2Prediv: ClockNode,
    XBAR2Findiv: ClockNode,
    XBAR2Output: ClockNode,
    XBAR3: ClockNode,
    XBAR3Prediv: ClockNode,
    XBAR3Findiv: ClockNode,
    XBAR3Output: ClockNode,
    XBAR4: ClockNode,
    XBAR4Prediv: ClockNode,
    XBAR4Findiv: ClockNode,
    XBAR4Output: ClockNode,
    XBAR5: ClockNode,
    XBAR5Prediv: ClockNode,
    XBAR5Findiv: ClockNode,
    XBAR5Output: ClockNode,
    XBAR6: ClockNode,
    XBAR6Prediv: ClockNode,
    XBAR6Findiv: ClockNode,
    XBAR6Output: ClockNode,
    XBAR7: ClockNode,
    XBAR7Prediv: ClockNode,
    XBAR7Findiv: ClockNode,
    XBAR7Output: ClockNode,
    XBAR8: ClockNode,
    XBAR8Prediv: ClockNode,
    XBAR8Findiv: ClockNode,
    XBAR8Output: ClockNode,
    XBAR9: ClockNode,
    XBAR9Prediv: ClockNode,
    XBAR9Findiv: ClockNode,
    XBAR9Output: ClockNode,
    XBAR10: ClockNode,
    XBAR10Prediv: ClockNode,
    XBAR10Findiv: ClockNode,
    XBAR10Output: ClockNode,
    XBAR11: ClockNode,
    XBAR11Prediv: ClockNode,
    XBAR11Findiv: ClockNode,
    XBAR11Output: ClockNode,
    XBAR12: ClockNode,
    XBAR12Prediv: ClockNode,
    XBAR12Findiv: ClockNode,
    XBAR12Output: ClockNode,
    XBAR13: ClockNode,
    XBAR13Prediv: ClockNode,
    XBAR13Findiv: ClockNode,
    XBAR13Output: ClockNode,
    XBAR14: ClockNode,
    XBAR14Prediv: ClockNode,
    XBAR14Findiv: ClockNode,
    XBAR14Output: ClockNode,
    XBAR15: ClockNode,
    XBAR15Prediv: ClockNode,
    XBAR15Findiv: ClockNode,
    XBAR15Output: ClockNode,
    XBAR16: ClockNode,
    XBAR16Prediv: ClockNode,
    XBAR16Findiv: ClockNode,
    XBAR16Output: ClockNode,
    XBAR17: ClockNode,
    XBAR17Prediv: ClockNode,
    XBAR17Findiv: ClockNode,
    XBAR17Output: ClockNode,
    XBAR18: ClockNode,
    XBAR18Prediv: ClockNode,
    XBAR18Findiv: ClockNode,
    XBAR18Output: ClockNode,
    XBAR19: ClockNode,
    XBAR19Prediv: ClockNode,
    XBAR19Findiv: ClockNode,
    XBAR19Output: ClockNode,
    XBAR20: ClockNode,
    XBAR20Prediv: ClockNode,
    XBAR20Findiv: ClockNode,
    XBAR20Output: ClockNode,
    XBAR21: ClockNode,
    XBAR21Prediv: ClockNode,
    XBAR21Findiv: ClockNode,
    XBAR21Output: ClockNode,
    XBAR22: ClockNode,
    XBAR22Prediv: ClockNode,
    XBAR22Findiv: ClockNode,
    XBAR22Output: ClockNode,
    XBAR23: ClockNode,
    XBAR23Prediv: ClockNode,
    XBAR23Findiv: ClockNode,
    XBAR23Output: ClockNode,
    XBAR24: ClockNode,
    XBAR24Prediv: ClockNode,
    XBAR24Findiv: ClockNode,
    XBAR24Output: ClockNode,
    XBAR25: ClockNode,
    XBAR25Prediv: ClockNode,
    XBAR25Findiv: ClockNode,
    XBAR25Output: ClockNode,
    XBAR26: ClockNode,
    XBAR26Prediv: ClockNode,
    XBAR26Findiv: ClockNode,
    XBAR26Output: ClockNode,
    XBAR27: ClockNode,
    XBAR27Prediv: ClockNode,
    XBAR27Findiv: ClockNode,
    XBAR27Output: ClockNode,
    XBAR28: ClockNode,
    XBAR28Prediv: ClockNode,
    XBAR28Findiv: ClockNode,
    XBAR28Output: ClockNode,
    XBAR29: ClockNode,
    XBAR29Prediv: ClockNode,
    XBAR29Findiv: ClockNode,
    XBAR29Output: ClockNode,
    XBAR30: ClockNode,
    XBAR30Prediv: ClockNode,
    XBAR30Findiv: ClockNode,
    XBAR30Output: ClockNode,
    XBAR31: ClockNode,
    XBAR31Prediv: ClockNode,
    XBAR31Findiv: ClockNode,
    XBAR31Output: ClockNode,
    XBAR32: ClockNode,
    XBAR32Prediv: ClockNode,
    XBAR32Findiv: ClockNode,
    XBAR32Output: ClockNode,
    XBAR33: ClockNode,
    XBAR33Prediv: ClockNode,
    XBAR33Findiv: ClockNode,
    XBAR33Output: ClockNode,
    XBAR34: ClockNode,
    XBAR34Prediv: ClockNode,
    XBAR34Findiv: ClockNode,
    XBAR34Output: ClockNode,
    XBAR35: ClockNode,
    XBAR35Prediv: ClockNode,
    XBAR35Findiv: ClockNode,
    XBAR35Output: ClockNode,
    XBAR36: ClockNode,
    XBAR36Prediv: ClockNode,
    XBAR36Findiv: ClockNode,
    XBAR36Output: ClockNode,
    XBAR37: ClockNode,
    XBAR37Prediv: ClockNode,
    XBAR37Findiv: ClockNode,
    XBAR37Output: ClockNode,
    XBAR38: ClockNode,
    XBAR38Prediv: ClockNode,
    XBAR38Findiv: ClockNode,
    XBAR38Output: ClockNode,
    XBAR39: ClockNode,
    XBAR39Prediv: ClockNode,
    XBAR39Findiv: ClockNode,
    XBAR39Output: ClockNode,
    XBAR40: ClockNode,
    XBAR40Prediv: ClockNode,
    XBAR40Findiv: ClockNode,
    XBAR40Output: ClockNode,
    XBAR41: ClockNode,
    XBAR41Prediv: ClockNode,
    XBAR41Findiv: ClockNode,
    XBAR41Output: ClockNode,
    XBAR42: ClockNode,
    XBAR42Prediv: ClockNode,
    XBAR42Findiv: ClockNode,
    XBAR42Output: ClockNode,
    XBAR43: ClockNode,
    XBAR43Prediv: ClockNode,
    XBAR43Findiv: ClockNode,
    XBAR43Output: ClockNode,
    XBAR44: ClockNode,
    XBAR44Prediv: ClockNode,
    XBAR44Findiv: ClockNode,
    XBAR44Output: ClockNode,
    XBAR45: ClockNode,
    XBAR45Prediv: ClockNode,
    XBAR45Findiv: ClockNode,
    XBAR45Output: ClockNode,
    XBAR46: ClockNode,
    XBAR46Prediv: ClockNode,
    XBAR46Findiv: ClockNode,
    XBAR46Output: ClockNode,
    XBAR47: ClockNode,
    XBAR47Prediv: ClockNode,
    XBAR47Findiv: ClockNode,
    XBAR47Output: ClockNode,
    XBAR48: ClockNode,
    XBAR48Prediv: ClockNode,
    XBAR48Findiv: ClockNode,
    XBAR48Output: ClockNode,
    XBAR49: ClockNode,
    XBAR49Prediv: ClockNode,
    XBAR49Findiv: ClockNode,
    XBAR49Output: ClockNode,
    XBAR50: ClockNode,
    XBAR50Prediv: ClockNode,
    XBAR50Findiv: ClockNode,
    XBAR50Output: ClockNode,
    XBAR51: ClockNode,
    XBAR51Prediv: ClockNode,
    XBAR51Findiv: ClockNode,
    XBAR51Output: ClockNode,
    XBAR52: ClockNode,
    XBAR52Prediv: ClockNode,
    XBAR52Findiv: ClockNode,
    XBAR52Output: ClockNode,
    XBAR53: ClockNode,
    XBAR53Prediv: ClockNode,
    XBAR53Findiv: ClockNode,
    XBAR53Output: ClockNode,
    XBAR54: ClockNode,
    XBAR54Prediv: ClockNode,
    XBAR54Findiv: ClockNode,
    XBAR54Output: ClockNode,
    XBAR55: ClockNode,
    XBAR55Prediv: ClockNode,
    XBAR55Findiv: ClockNode,
    XBAR55Output: ClockNode,
    XBAR56: ClockNode,
    XBAR56Prediv: ClockNode,
    XBAR56Findiv: ClockNode,
    XBAR56Output: ClockNode,
    XBAR57: ClockNode,
    XBAR57Prediv: ClockNode,
    XBAR57Findiv: ClockNode,
    XBAR57Output: ClockNode,
    XBAR58: ClockNode,
    XBAR58Prediv: ClockNode,
    XBAR58Findiv: ClockNode,
    XBAR58Output: ClockNode,
    XBAR59: ClockNode,
    XBAR59Prediv: ClockNode,
    XBAR59Findiv: ClockNode,
    XBAR59Output: ClockNode,
    XBAR60: ClockNode,
    XBAR60Prediv: ClockNode,
    XBAR60Findiv: ClockNode,
    XBAR60Output: ClockNode,
    XBAR61: ClockNode,
    XBAR61Prediv: ClockNode,
    XBAR61Findiv: ClockNode,
    XBAR61Output: ClockNode,
    XBAR62: ClockNode,
    XBAR62Prediv: ClockNode,
    XBAR62Findiv: ClockNode,
    XBAR62Output: ClockNode,
    XBAR63: ClockNode,
    XBAR63Prediv: ClockNode,
    XBAR63Findiv: ClockNode,
    XBAR63Output: ClockNode,
    CKINTSEL0: ClockNode,
    CKEXTSEL0: ClockNode,
    CKINTSEL1: ClockNode,
    CKEXTSEL1: ClockNode,
    OBS0: ClockNode,
    OBS0Output: ClockNode,
    OBS1: ClockNode,
    OBS1Output: ClockNode,
    MCO1Mult: ClockNode,
    MCO1Pin: ClockNode,
    MCO2Mult: ClockNode,
    MCO2Pin: ClockNode,
    D3PER: ClockNode,
    D3PEROutput: ClockNode,
    DTS: ClockNode,
    DTSOutput: ClockNode,
    DSIPHY: ClockNode,
    DSIPHYOutput: ClockNode,
    DSIBLANE: ClockNode,
    DSIBLANEOutput: ClockNode,
    USB2PHY1: ClockNode,
    USB2PHY1Output: ClockNode,
    USB2PHY2: ClockNode,
    USB2PHY2Output: ClockNode,
    USB3PCIPHY: ClockNode,
    USB3PCIPHYOutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    MCUDIV: ClockNode,
    McuClockOutput: ClockNode,
    APB3DIV: ClockNode,
    APB3Output: ClockNode,
    APB4DIV: ClockNode,
    APB4Output: ClockNode,
    APBDBGDIV: ClockNode,
    APBDBGOutput: ClockNode,
    APB1DIV: ClockNode,
    Tim1Mul: ClockNode,
    Tim1Output: ClockNode,
    AHBOutput: ClockNode,
    APB1Output: ClockNode,
    APB2DIV: ClockNode,
    Tim2Mul: ClockNode,
    Tim2Output: ClockNode,
    APB2Output: ClockNode,
    ADC12Mult: ClockNode,
    ADC12output: ClockNode,
    ADC3Mult: ClockNode,
    ADC3output: ClockNode,
    PLL1Source: ClockNode,
    FREFDIV1: ClockNode,
    PLL2Source: ClockNode,
    FREFDIV2: ClockNode,
    PLL3Source: ClockNode,
    FREFDIV3: ClockNode,
    PLL4Source: ClockNode,
    FREFDIV4: ClockNode,
    FBDIV1: ClockNode,
    POSTDIV1_1: ClockNode,
    POSTDIV2_1: ClockNode,
    FOUTPOSTDIV1: ClockNode,
    PLL1Div42: ClockNode,
    FBDIV2: ClockNode,
    PLL2FRACV: ClockNode,
    POSTDIV1_2: ClockNode,
    POSTDIV2_2: ClockNode,
    FOUTPOSTDIV2: ClockNode,
    PLL2Div4: ClockNode,
    FBDIV3: ClockNode,
    PLL3FRACV: ClockNode,
    POSTDIV1_3: ClockNode,
    POSTDIV2_3: ClockNode,
    FOUTPOSTDIV3: ClockNode,
    PLL3Div2: ClockNode,
    FBDIV4: ClockNode,
    PLL4FRACV: ClockNode,
    POSTDIV1_4: ClockNode,
    POSTDIV2_4: ClockNode,
    FOUTPOSTDIV4: ClockNode,
    PLL5Source: ClockNode,
    FREFDIV5: ClockNode,
    FBDIV5: ClockNode,
    PLL5FRACV: ClockNode,
    POSTDIV1_5: ClockNode,
    POSTDIV2_5: ClockNode,
    FOUTPOSTDIV5: ClockNode,
    PLL6Source: ClockNode,
    FREFDIV6: ClockNode,
    FBDIV6: ClockNode,
    PLL6FRACV: ClockNode,
    POSTDIV1_6: ClockNode,
    POSTDIV2_6: ClockNode,
    FOUTPOSTDIV6: ClockNode,
    PLL7Source: ClockNode,
    FREFDIV7: ClockNode,
    FBDIV7: ClockNode,
    PLL7FRACV: ClockNode,
    POSTDIV1_7: ClockNode,
    POSTDIV2_7: ClockNode,
    FOUTPOSTDIV7: ClockNode,
    PLL8Source: ClockNode,
    FREFDIV8: ClockNode,
    FBDIV8: ClockNode,
    PLL8FRACV: ClockNode,
    POSTDIV1_8: ClockNode,
    POSTDIV2_8: ClockNode,
    FOUTPOSTDIV8: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    RCC_TIM_G1_PRescaler_Selection: ClockNodeTypes,
    RCC_TIM_G2_PRescaler_Selection: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 48000000, .min = 16000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const HSEDIV2val = ClockNodeTypes{ .div = .{ .value = config.HSEDIV2.get() } };
        const HSEDIV2: ClockNode = .{
            .name = "HSEDIV2",
            .Nodetype = HSEDIV2val,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const SPDIFval = ClockNodeTypes{
            .source = .{
                .value = config.SPDIF.get(),
                .limit = .{ .max = 12288000, .min = 3072000 },
            },
        };
        const SPDIF: ClockNode = .{
            .name = "SPDIF",
            .Nodetype = SPDIFval,
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
        const MSIRCval = ClockNodeTypes{
            .source = .{ .value = config.MSIRC.get() },
        };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .Nodetype = MSIRCval,
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
        };
        const PLL4Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL4Source) };
        const PLL4Source: ClockNode = .{
            .name = "PLL4Source",
            .Nodetype = PLL4Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
            },
        };
        const FREFDIV4val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV4.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV4: ClockNode = .{
            .name = "FREFDIV4",
            .Nodetype = FREFDIV4val,
            .parents = &[_]*const ClockNode{&PLL4Source},
        };
        const PLL4FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL4FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL4FRACV: ClockNode = .{
            .name = "PLL4FRACV",
            .Nodetype = PLL4FRACVval,
        };
        const FBDIV4val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.FBDIV4.get(),
                .limit = .{ .max = 12297829382473034410, .min = 12297829382473034410 },
            },
        };
        const FBDIV4: ClockNode = .{
            .name = "FBDIV4",
            .Nodetype = FBDIV4val,
            .parents = &[_]*const ClockNode{ &FREFDIV4, &PLL4FRACV },
        };
        const POSTDIV1_4val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_4.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_4: ClockNode = .{
            .name = "POSTDIV1_4",
            .Nodetype = POSTDIV1_4val,
            .parents = &[_]*const ClockNode{&FBDIV4},
        };
        const POSTDIV2_4val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_4.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_4: ClockNode = .{
            .name = "POSTDIV2_4",
            .Nodetype = POSTDIV2_4val,
            .parents = &[_]*const ClockNode{&POSTDIV1_4},
        };
        const FOUTPOSTDIV4val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV4: ClockNode = .{
            .name = "FOUTPOSTDIV4",
            .Nodetype = FOUTPOSTDIV4val,
            .parents = &[_]*const ClockNode{&POSTDIV2_4},
        };
        const PLL5Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL5Source) };
        const PLL5Source: ClockNode = .{
            .name = "PLL5Source",
            .Nodetype = PLL5Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
            },
        };
        const FREFDIV5val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV5.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV5: ClockNode = .{
            .name = "FREFDIV5",
            .Nodetype = FREFDIV5val,
            .parents = &[_]*const ClockNode{&PLL5Source},
        };
        const PLL5FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL5FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL5FRACV: ClockNode = .{
            .name = "PLL5FRACV",
            .Nodetype = PLL5FRACVval,
        };
        const FBDIV5val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.FBDIV5.get(),
                .limit = .{ .max = 12297829382473034410, .min = 12297829382473034410 },
            },
        };
        const FBDIV5: ClockNode = .{
            .name = "FBDIV5",
            .Nodetype = FBDIV5val,
            .parents = &[_]*const ClockNode{ &FREFDIV5, &PLL5FRACV },
        };
        const POSTDIV1_5val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_5.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_5: ClockNode = .{
            .name = "POSTDIV1_5",
            .Nodetype = POSTDIV1_5val,
            .parents = &[_]*const ClockNode{&FBDIV5},
        };
        const POSTDIV2_5val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_5.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_5: ClockNode = .{
            .name = "POSTDIV2_5",
            .Nodetype = POSTDIV2_5val,
            .parents = &[_]*const ClockNode{&POSTDIV1_5},
        };
        const FOUTPOSTDIV5val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV5: ClockNode = .{
            .name = "FOUTPOSTDIV5",
            .Nodetype = FOUTPOSTDIV5val,
            .parents = &[_]*const ClockNode{&POSTDIV2_5},
        };
        const PLL6Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL6Source) };
        const PLL6Source: ClockNode = .{
            .name = "PLL6Source",
            .Nodetype = PLL6Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
            },
        };
        const FREFDIV6val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV6.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV6: ClockNode = .{
            .name = "FREFDIV6",
            .Nodetype = FREFDIV6val,
            .parents = &[_]*const ClockNode{&PLL6Source},
        };
        const PLL6FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL6FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL6FRACV: ClockNode = .{
            .name = "PLL6FRACV",
            .Nodetype = PLL6FRACVval,
        };
        const FBDIV6val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.FBDIV6.get(),
                .limit = .{ .max = 12297829382473034410, .min = 12297829382473034410 },
            },
        };
        const FBDIV6: ClockNode = .{
            .name = "FBDIV6",
            .Nodetype = FBDIV6val,
            .parents = &[_]*const ClockNode{ &FREFDIV6, &PLL6FRACV },
        };
        const POSTDIV1_6val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_6.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_6: ClockNode = .{
            .name = "POSTDIV1_6",
            .Nodetype = POSTDIV1_6val,
            .parents = &[_]*const ClockNode{&FBDIV6},
        };
        const POSTDIV2_6val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_6.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_6: ClockNode = .{
            .name = "POSTDIV2_6",
            .Nodetype = POSTDIV2_6val,
            .parents = &[_]*const ClockNode{&POSTDIV1_6},
        };
        const FOUTPOSTDIV6val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV6: ClockNode = .{
            .name = "FOUTPOSTDIV6",
            .Nodetype = FOUTPOSTDIV6val,
            .parents = &[_]*const ClockNode{&POSTDIV2_6},
        };
        const PLL7Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL7Source) };
        const PLL7Source: ClockNode = .{
            .name = "PLL7Source",
            .Nodetype = PLL7Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
            },
        };
        const FREFDIV7val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV7.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV7: ClockNode = .{
            .name = "FREFDIV7",
            .Nodetype = FREFDIV7val,
            .parents = &[_]*const ClockNode{&PLL7Source},
        };
        const PLL7FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL7FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL7FRACV: ClockNode = .{
            .name = "PLL7FRACV",
            .Nodetype = PLL7FRACVval,
        };
        const FBDIV7val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.FBDIV7.get(),
                .limit = .{ .max = 12297829382473034410, .min = 12297829382473034410 },
            },
        };
        const FBDIV7: ClockNode = .{
            .name = "FBDIV7",
            .Nodetype = FBDIV7val,
            .parents = &[_]*const ClockNode{ &FREFDIV7, &PLL7FRACV },
        };
        const POSTDIV1_7val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_7.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_7: ClockNode = .{
            .name = "POSTDIV1_7",
            .Nodetype = POSTDIV1_7val,
            .parents = &[_]*const ClockNode{&FBDIV7},
        };
        const POSTDIV2_7val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_7.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_7: ClockNode = .{
            .name = "POSTDIV2_7",
            .Nodetype = POSTDIV2_7val,
            .parents = &[_]*const ClockNode{&POSTDIV1_7},
        };
        const FOUTPOSTDIV7val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV7: ClockNode = .{
            .name = "FOUTPOSTDIV7",
            .Nodetype = FOUTPOSTDIV7val,
            .parents = &[_]*const ClockNode{&POSTDIV2_7},
        };
        const PLL8Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL8Source) };
        const PLL8Source: ClockNode = .{
            .name = "PLL8Source",
            .Nodetype = PLL8Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
            },
        };
        const FREFDIV8val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV8.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV8: ClockNode = .{
            .name = "FREFDIV8",
            .Nodetype = FREFDIV8val,
            .parents = &[_]*const ClockNode{&PLL8Source},
        };
        const PLL8FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL8FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL8FRACV: ClockNode = .{
            .name = "PLL8FRACV",
            .Nodetype = PLL8FRACVval,
        };
        const FBDIV8val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.FBDIV8.get(),
                .limit = .{ .max = 12297829382473034410, .min = 12297829382473034410 },
            },
        };
        const FBDIV8: ClockNode = .{
            .name = "FBDIV8",
            .Nodetype = FBDIV8val,
            .parents = &[_]*const ClockNode{ &FREFDIV8, &PLL8FRACV },
        };
        const POSTDIV1_8val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_8.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_8: ClockNode = .{
            .name = "POSTDIV1_8",
            .Nodetype = POSTDIV1_8val,
            .parents = &[_]*const ClockNode{&FBDIV8},
        };
        const POSTDIV2_8val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_8.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_8: ClockNode = .{
            .name = "POSTDIV2_8",
            .Nodetype = POSTDIV2_8val,
            .parents = &[_]*const ClockNode{&POSTDIV1_8},
        };
        const FOUTPOSTDIV8val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV8: ClockNode = .{
            .name = "FOUTPOSTDIV8",
            .Nodetype = FOUTPOSTDIV8val,
            .parents = &[_]*const ClockNode{&POSTDIV2_8},
        };
        const XBAR0val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR0) };
        const XBAR0: ClockNode = .{
            .name = "XBAR0",
            .Nodetype = XBAR0val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR0Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR0Prediv.get() } };
        const XBAR0Prediv: ClockNode = .{
            .name = "XBAR0Prediv",
            .Nodetype = XBAR0Predivval,
            .parents = &[_]*const ClockNode{&XBAR0},
        };
        const XBAR0Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR0Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR0Findiv: ClockNode = .{
            .name = "XBAR0Findiv",
            .Nodetype = XBAR0Findivval,
            .parents = &[_]*const ClockNode{&XBAR0Prediv},
        };
        const XBAR0Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const XBAR0Output: ClockNode = .{
            .name = "XBAR0Output",
            .Nodetype = XBAR0Outputval,
            .parents = &[_]*const ClockNode{&XBAR0Findiv},
        };
        const XBAR1val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR1) };
        const XBAR1: ClockNode = .{
            .name = "XBAR1",
            .Nodetype = XBAR1val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR1Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR1Prediv.get() } };
        const XBAR1Prediv: ClockNode = .{
            .name = "XBAR1Prediv",
            .Nodetype = XBAR1Predivval,
            .parents = &[_]*const ClockNode{&XBAR1},
        };
        const XBAR1Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR1Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR1Findiv: ClockNode = .{
            .name = "XBAR1Findiv",
            .Nodetype = XBAR1Findivval,
            .parents = &[_]*const ClockNode{&XBAR1Prediv},
        };
        const XBAR1Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR1Output: ClockNode = .{
            .name = "XBAR1Output",
            .Nodetype = XBAR1Outputval,
            .parents = &[_]*const ClockNode{&XBAR1Findiv},
        };
        const XBAR2val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR2) };
        const XBAR2: ClockNode = .{
            .name = "XBAR2",
            .Nodetype = XBAR2val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR2Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR2Prediv.get() } };
        const XBAR2Prediv: ClockNode = .{
            .name = "XBAR2Prediv",
            .Nodetype = XBAR2Predivval,
            .parents = &[_]*const ClockNode{&XBAR2},
        };
        const XBAR2Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR2Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR2Findiv: ClockNode = .{
            .name = "XBAR2Findiv",
            .Nodetype = XBAR2Findivval,
            .parents = &[_]*const ClockNode{&XBAR2Prediv},
        };
        const XBAR2Outputval = ClockNodeTypes{
            .output = .{ .max = 600000000, .min = 0 },
        };
        const XBAR2Output: ClockNode = .{
            .name = "XBAR2Output",
            .Nodetype = XBAR2Outputval,
            .parents = &[_]*const ClockNode{&XBAR2Findiv},
        };
        const XBAR3val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR3) };
        const XBAR3: ClockNode = .{
            .name = "XBAR3",
            .Nodetype = XBAR3val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR3Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR3Prediv.get() } };
        const XBAR3Prediv: ClockNode = .{
            .name = "XBAR3Prediv",
            .Nodetype = XBAR3Predivval,
            .parents = &[_]*const ClockNode{&XBAR3},
        };
        const XBAR3Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR3Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR3Findiv: ClockNode = .{
            .name = "XBAR3Findiv",
            .Nodetype = XBAR3Findivval,
            .parents = &[_]*const ClockNode{&XBAR3Prediv},
        };
        const XBAR3Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const XBAR3Output: ClockNode = .{
            .name = "XBAR3Output",
            .Nodetype = XBAR3Outputval,
            .parents = &[_]*const ClockNode{&XBAR3Findiv},
        };
        const XBAR4val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR4) };
        const XBAR4: ClockNode = .{
            .name = "XBAR4",
            .Nodetype = XBAR4val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR4Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR4Prediv.get() } };
        const XBAR4Prediv: ClockNode = .{
            .name = "XBAR4Prediv",
            .Nodetype = XBAR4Predivval,
            .parents = &[_]*const ClockNode{&XBAR4},
        };
        const XBAR4Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR4Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR4Findiv: ClockNode = .{
            .name = "XBAR4Findiv",
            .Nodetype = XBAR4Findivval,
            .parents = &[_]*const ClockNode{&XBAR4Prediv},
        };
        const XBAR4Outputval = ClockNodeTypes{
            .output = .{ .max = 300000000, .min = 0 },
        };
        const XBAR4Output: ClockNode = .{
            .name = "XBAR4Output",
            .Nodetype = XBAR4Outputval,
            .parents = &[_]*const ClockNode{&XBAR4Findiv},
        };
        const XBAR5val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR5) };
        const XBAR5: ClockNode = .{
            .name = "XBAR5",
            .Nodetype = XBAR5val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR5Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR5Prediv.get() } };
        const XBAR5Prediv: ClockNode = .{
            .name = "XBAR5Prediv",
            .Nodetype = XBAR5Predivval,
            .parents = &[_]*const ClockNode{&XBAR5},
        };
        const XBAR5Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR5Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR5Findiv: ClockNode = .{
            .name = "XBAR5Findiv",
            .Nodetype = XBAR5Findivval,
            .parents = &[_]*const ClockNode{&XBAR5Prediv},
        };
        const XBAR5Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const XBAR5Output: ClockNode = .{
            .name = "XBAR5Output",
            .Nodetype = XBAR5Outputval,
            .parents = &[_]*const ClockNode{&XBAR5Findiv},
        };
        const XBAR6val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR6) };
        const XBAR6: ClockNode = .{
            .name = "XBAR6",
            .Nodetype = XBAR6val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR6Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR6Prediv.get() } };
        const XBAR6Prediv: ClockNode = .{
            .name = "XBAR6Prediv",
            .Nodetype = XBAR6Predivval,
            .parents = &[_]*const ClockNode{&XBAR6},
        };
        const XBAR6Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR6Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR6Findiv: ClockNode = .{
            .name = "XBAR6Findiv",
            .Nodetype = XBAR6Findivval,
            .parents = &[_]*const ClockNode{&XBAR6Prediv},
        };
        const XBAR6Outputval = ClockNodeTypes{
            .output = .{ .max = 600000000, .min = 0 },
        };
        const XBAR6Output: ClockNode = .{
            .name = "XBAR6Output",
            .Nodetype = XBAR6Outputval,
            .parents = &[_]*const ClockNode{&XBAR6Findiv},
        };
        const XBAR7val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR7) };
        const XBAR7: ClockNode = .{
            .name = "XBAR7",
            .Nodetype = XBAR7val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR7Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR7Prediv.get() } };
        const XBAR7Prediv: ClockNode = .{
            .name = "XBAR7Prediv",
            .Nodetype = XBAR7Predivval,
            .parents = &[_]*const ClockNode{&XBAR7},
        };
        const XBAR7Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR7Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR7Findiv: ClockNode = .{
            .name = "XBAR7Findiv",
            .Nodetype = XBAR7Findivval,
            .parents = &[_]*const ClockNode{&XBAR7Prediv},
        };
        const XBAR7Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR7Output: ClockNode = .{
            .name = "XBAR7Output",
            .Nodetype = XBAR7Outputval,
            .parents = &[_]*const ClockNode{&XBAR7Findiv},
        };
        const XBAR8val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR8) };
        const XBAR8: ClockNode = .{
            .name = "XBAR8",
            .Nodetype = XBAR8val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR8Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR8Prediv.get() } };
        const XBAR8Prediv: ClockNode = .{
            .name = "XBAR8Prediv",
            .Nodetype = XBAR8Predivval,
            .parents = &[_]*const ClockNode{&XBAR8},
        };
        const XBAR8Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR8Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR8Findiv: ClockNode = .{
            .name = "XBAR8Findiv",
            .Nodetype = XBAR8Findivval,
            .parents = &[_]*const ClockNode{&XBAR8Prediv},
        };
        const XBAR8Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR8Output: ClockNode = .{
            .name = "XBAR8Output",
            .Nodetype = XBAR8Outputval,
            .parents = &[_]*const ClockNode{&XBAR8Findiv},
        };
        const XBAR9val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR9) };
        const XBAR9: ClockNode = .{
            .name = "XBAR9",
            .Nodetype = XBAR9val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR9Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR9Prediv.get() } };
        const XBAR9Prediv: ClockNode = .{
            .name = "XBAR9Prediv",
            .Nodetype = XBAR9Predivval,
            .parents = &[_]*const ClockNode{&XBAR9},
        };
        const XBAR9Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR9Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR9Findiv: ClockNode = .{
            .name = "XBAR9Findiv",
            .Nodetype = XBAR9Findivval,
            .parents = &[_]*const ClockNode{&XBAR9Prediv},
        };
        const XBAR9Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR9Output: ClockNode = .{
            .name = "XBAR9Output",
            .Nodetype = XBAR9Outputval,
            .parents = &[_]*const ClockNode{&XBAR9Findiv},
        };
        const XBAR10val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR10) };
        const XBAR10: ClockNode = .{
            .name = "XBAR10",
            .Nodetype = XBAR10val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &I2S_CKIN,
            },
        };
        const XBAR10Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR10Prediv.get() } };
        const XBAR10Prediv: ClockNode = .{
            .name = "XBAR10Prediv",
            .Nodetype = XBAR10Predivval,
            .parents = &[_]*const ClockNode{&XBAR10},
        };
        const XBAR10Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR10Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR10Findiv: ClockNode = .{
            .name = "XBAR10Findiv",
            .Nodetype = XBAR10Findivval,
            .parents = &[_]*const ClockNode{&XBAR10Prediv},
        };
        const XBAR10Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR10Output: ClockNode = .{
            .name = "XBAR10Output",
            .Nodetype = XBAR10Outputval,
            .parents = &[_]*const ClockNode{&XBAR10Findiv},
        };
        const XBAR11val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR11) };
        const XBAR11: ClockNode = .{
            .name = "XBAR11",
            .Nodetype = XBAR11val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
            },
        };
        const XBAR11Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR11Prediv.get() } };
        const XBAR11Prediv: ClockNode = .{
            .name = "XBAR11Prediv",
            .Nodetype = XBAR11Predivval,
            .parents = &[_]*const ClockNode{&XBAR11},
        };
        const XBAR11Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR11Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR11Findiv: ClockNode = .{
            .name = "XBAR11Findiv",
            .Nodetype = XBAR11Findivval,
            .parents = &[_]*const ClockNode{&XBAR11Prediv},
        };
        const XBAR11Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR11Output: ClockNode = .{
            .name = "XBAR11Output",
            .Nodetype = XBAR11Outputval,
            .parents = &[_]*const ClockNode{&XBAR11Findiv},
        };
        const XBAR12val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR12) };
        const XBAR12: ClockNode = .{
            .name = "XBAR12",
            .Nodetype = XBAR12val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &MSIRC,
            },
        };
        const XBAR12Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR12Prediv.get() } };
        const XBAR12Prediv: ClockNode = .{
            .name = "XBAR12Prediv",
            .Nodetype = XBAR12Predivval,
            .parents = &[_]*const ClockNode{&XBAR12},
        };
        const XBAR12Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR12Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR12Findiv: ClockNode = .{
            .name = "XBAR12Findiv",
            .Nodetype = XBAR12Findivval,
            .parents = &[_]*const ClockNode{&XBAR12Prediv},
        };
        const XBAR12Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR12Output: ClockNode = .{
            .name = "XBAR12Output",
            .Nodetype = XBAR12Outputval,
            .parents = &[_]*const ClockNode{&XBAR12Findiv},
        };
        const XBAR13val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR13) };
        const XBAR13: ClockNode = .{
            .name = "XBAR13",
            .Nodetype = XBAR13val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &MSIRC,
            },
        };
        const XBAR13Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR13Prediv.get() } };
        const XBAR13Prediv: ClockNode = .{
            .name = "XBAR13Prediv",
            .Nodetype = XBAR13Predivval,
            .parents = &[_]*const ClockNode{&XBAR13},
        };
        const XBAR13Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR13Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR13Findiv: ClockNode = .{
            .name = "XBAR13Findiv",
            .Nodetype = XBAR13Findivval,
            .parents = &[_]*const ClockNode{&XBAR13Prediv},
        };
        const XBAR13Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR13Output: ClockNode = .{
            .name = "XBAR13Output",
            .Nodetype = XBAR13Outputval,
            .parents = &[_]*const ClockNode{&XBAR13Findiv},
        };
        const XBAR14val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR14) };
        const XBAR14: ClockNode = .{
            .name = "XBAR14",
            .Nodetype = XBAR14val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &MSIRC,
            },
        };
        const XBAR14Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR14Prediv.get() } };
        const XBAR14Prediv: ClockNode = .{
            .name = "XBAR14Prediv",
            .Nodetype = XBAR14Predivval,
            .parents = &[_]*const ClockNode{&XBAR14},
        };
        const XBAR14Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR14Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR14Findiv: ClockNode = .{
            .name = "XBAR14Findiv",
            .Nodetype = XBAR14Findivval,
            .parents = &[_]*const ClockNode{&XBAR14Prediv},
        };
        const XBAR14Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR14Output: ClockNode = .{
            .name = "XBAR14Output",
            .Nodetype = XBAR14Outputval,
            .parents = &[_]*const ClockNode{&XBAR14Findiv},
        };
        const XBAR15val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR15) };
        const XBAR15: ClockNode = .{
            .name = "XBAR15",
            .Nodetype = XBAR15val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &MSIRC,
            },
        };
        const XBAR15Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR15Prediv.get() } };
        const XBAR15Prediv: ClockNode = .{
            .name = "XBAR15Prediv",
            .Nodetype = XBAR15Predivval,
            .parents = &[_]*const ClockNode{&XBAR15},
        };
        const XBAR15Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR15Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR15Findiv: ClockNode = .{
            .name = "XBAR15Findiv",
            .Nodetype = XBAR15Findivval,
            .parents = &[_]*const ClockNode{&XBAR15Prediv},
        };
        const XBAR15Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR15Output: ClockNode = .{
            .name = "XBAR15Output",
            .Nodetype = XBAR15Outputval,
            .parents = &[_]*const ClockNode{&XBAR15Findiv},
        };
        const XBAR16val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR16) };
        const XBAR16: ClockNode = .{
            .name = "XBAR16",
            .Nodetype = XBAR16val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &I2S_CKIN,
            },
        };
        const XBAR16Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR16Prediv.get() } };
        const XBAR16Prediv: ClockNode = .{
            .name = "XBAR16Prediv",
            .Nodetype = XBAR16Predivval,
            .parents = &[_]*const ClockNode{&XBAR16},
        };
        const XBAR16Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR16Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR16Findiv: ClockNode = .{
            .name = "XBAR16Findiv",
            .Nodetype = XBAR16Findivval,
            .parents = &[_]*const ClockNode{&XBAR16Prediv},
        };
        const XBAR16Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR16Output: ClockNode = .{
            .name = "XBAR16Output",
            .Nodetype = XBAR16Outputval,
            .parents = &[_]*const ClockNode{&XBAR16Findiv},
        };
        const XBAR17val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR17) };
        const XBAR17: ClockNode = .{
            .name = "XBAR17",
            .Nodetype = XBAR17val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &I2S_CKIN,
            },
        };
        const XBAR17Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR17Prediv.get() } };
        const XBAR17Prediv: ClockNode = .{
            .name = "XBAR17Prediv",
            .Nodetype = XBAR17Predivval,
            .parents = &[_]*const ClockNode{&XBAR17},
        };
        const XBAR17Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR17Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR17Findiv: ClockNode = .{
            .name = "XBAR17Findiv",
            .Nodetype = XBAR17Findivval,
            .parents = &[_]*const ClockNode{&XBAR17Prediv},
        };
        const XBAR17Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR17Output: ClockNode = .{
            .name = "XBAR17Output",
            .Nodetype = XBAR17Outputval,
            .parents = &[_]*const ClockNode{&XBAR17Findiv},
        };
        const XBAR18val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR18) };
        const XBAR18: ClockNode = .{
            .name = "XBAR18",
            .Nodetype = XBAR18val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &I2S_CKIN,
            },
        };
        const XBAR18Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR18Prediv.get() } };
        const XBAR18Prediv: ClockNode = .{
            .name = "XBAR18Prediv",
            .Nodetype = XBAR18Predivval,
            .parents = &[_]*const ClockNode{&XBAR18},
        };
        const XBAR18Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR18Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR18Findiv: ClockNode = .{
            .name = "XBAR18Findiv",
            .Nodetype = XBAR18Findivval,
            .parents = &[_]*const ClockNode{&XBAR18Prediv},
        };
        const XBAR18Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR18Output: ClockNode = .{
            .name = "XBAR18Output",
            .Nodetype = XBAR18Outputval,
            .parents = &[_]*const ClockNode{&XBAR18Findiv},
        };
        const XBAR19val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR19) };
        const XBAR19: ClockNode = .{
            .name = "XBAR19",
            .Nodetype = XBAR19val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR19Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR19Prediv.get() } };
        const XBAR19Prediv: ClockNode = .{
            .name = "XBAR19Prediv",
            .Nodetype = XBAR19Predivval,
            .parents = &[_]*const ClockNode{&XBAR19},
        };
        const XBAR19Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR19Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR19Findiv: ClockNode = .{
            .name = "XBAR19Findiv",
            .Nodetype = XBAR19Findivval,
            .parents = &[_]*const ClockNode{&XBAR19Prediv},
        };
        const XBAR19Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR19Output: ClockNode = .{
            .name = "XBAR19Output",
            .Nodetype = XBAR19Outputval,
            .parents = &[_]*const ClockNode{&XBAR19Findiv},
        };
        const XBAR20val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR20) };
        const XBAR20: ClockNode = .{
            .name = "XBAR20",
            .Nodetype = XBAR20val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR20Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR20Prediv.get() } };
        const XBAR20Prediv: ClockNode = .{
            .name = "XBAR20Prediv",
            .Nodetype = XBAR20Predivval,
            .parents = &[_]*const ClockNode{&XBAR20},
        };
        const XBAR20Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR20Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR20Findiv: ClockNode = .{
            .name = "XBAR20Findiv",
            .Nodetype = XBAR20Findivval,
            .parents = &[_]*const ClockNode{&XBAR20Prediv},
        };
        const XBAR20Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR20Output: ClockNode = .{
            .name = "XBAR20Output",
            .Nodetype = XBAR20Outputval,
            .parents = &[_]*const ClockNode{&XBAR20Findiv},
        };
        const XBAR21val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR21) };
        const XBAR21: ClockNode = .{
            .name = "XBAR21",
            .Nodetype = XBAR21val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR21Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR21Prediv.get() } };
        const XBAR21Prediv: ClockNode = .{
            .name = "XBAR21Prediv",
            .Nodetype = XBAR21Predivval,
            .parents = &[_]*const ClockNode{&XBAR21},
        };
        const XBAR21Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR21Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR21Findiv: ClockNode = .{
            .name = "XBAR21Findiv",
            .Nodetype = XBAR21Findivval,
            .parents = &[_]*const ClockNode{&XBAR21Prediv},
        };
        const XBAR21Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR21Output: ClockNode = .{
            .name = "XBAR21Output",
            .Nodetype = XBAR21Outputval,
            .parents = &[_]*const ClockNode{&XBAR21Findiv},
        };
        const XBAR22val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR22) };
        const XBAR22: ClockNode = .{
            .name = "XBAR22",
            .Nodetype = XBAR22val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR22Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR22Prediv.get() } };
        const XBAR22Prediv: ClockNode = .{
            .name = "XBAR22Prediv",
            .Nodetype = XBAR22Predivval,
            .parents = &[_]*const ClockNode{&XBAR22},
        };
        const XBAR22Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR22Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR22Findiv: ClockNode = .{
            .name = "XBAR22Findiv",
            .Nodetype = XBAR22Findivval,
            .parents = &[_]*const ClockNode{&XBAR22Prediv},
        };
        const XBAR22Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR22Output: ClockNode = .{
            .name = "XBAR22Output",
            .Nodetype = XBAR22Outputval,
            .parents = &[_]*const ClockNode{&XBAR22Findiv},
        };
        const XBAR23val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR23) };
        const XBAR23: ClockNode = .{
            .name = "XBAR23",
            .Nodetype = XBAR23val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
            },
        };
        const XBAR23Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR23Prediv.get() } };
        const XBAR23Prediv: ClockNode = .{
            .name = "XBAR23Prediv",
            .Nodetype = XBAR23Predivval,
            .parents = &[_]*const ClockNode{&XBAR23},
        };
        const XBAR23Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR23Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR23Findiv: ClockNode = .{
            .name = "XBAR23Findiv",
            .Nodetype = XBAR23Findivval,
            .parents = &[_]*const ClockNode{&XBAR23Prediv},
        };
        const XBAR23Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR23Output: ClockNode = .{
            .name = "XBAR23Output",
            .Nodetype = XBAR23Outputval,
            .parents = &[_]*const ClockNode{&XBAR23Findiv},
        };
        const XBAR24val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR24) };
        const XBAR24: ClockNode = .{
            .name = "XBAR24",
            .Nodetype = XBAR24val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
            },
        };
        const XBAR24Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR24Prediv.get() } };
        const XBAR24Prediv: ClockNode = .{
            .name = "XBAR24Prediv",
            .Nodetype = XBAR24Predivval,
            .parents = &[_]*const ClockNode{&XBAR24},
        };
        const XBAR24Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR24Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR24Findiv: ClockNode = .{
            .name = "XBAR24Findiv",
            .Nodetype = XBAR24Findivval,
            .parents = &[_]*const ClockNode{&XBAR24Prediv},
        };
        const XBAR24Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR24Output: ClockNode = .{
            .name = "XBAR24Output",
            .Nodetype = XBAR24Outputval,
            .parents = &[_]*const ClockNode{&XBAR24Findiv},
        };
        const XBAR25val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR25) };
        const XBAR25: ClockNode = .{
            .name = "XBAR25",
            .Nodetype = XBAR25val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
            },
        };
        const XBAR25Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR25Prediv.get() } };
        const XBAR25Prediv: ClockNode = .{
            .name = "XBAR25Prediv",
            .Nodetype = XBAR25Predivval,
            .parents = &[_]*const ClockNode{&XBAR25},
        };
        const XBAR25Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR25Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR25Findiv: ClockNode = .{
            .name = "XBAR25Findiv",
            .Nodetype = XBAR25Findivval,
            .parents = &[_]*const ClockNode{&XBAR25Prediv},
        };
        const XBAR25Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR25Output: ClockNode = .{
            .name = "XBAR25Output",
            .Nodetype = XBAR25Outputval,
            .parents = &[_]*const ClockNode{&XBAR25Findiv},
        };
        const XBAR26val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR26) };
        const XBAR26: ClockNode = .{
            .name = "XBAR26",
            .Nodetype = XBAR26val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR26Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR26Prediv.get() } };
        const XBAR26Prediv: ClockNode = .{
            .name = "XBAR26Prediv",
            .Nodetype = XBAR26Predivval,
            .parents = &[_]*const ClockNode{&XBAR26},
        };
        const XBAR26Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR26Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR26Findiv: ClockNode = .{
            .name = "XBAR26Findiv",
            .Nodetype = XBAR26Findivval,
            .parents = &[_]*const ClockNode{&XBAR26Prediv},
        };
        const XBAR26Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR26Output: ClockNode = .{
            .name = "XBAR26Output",
            .Nodetype = XBAR26Outputval,
            .parents = &[_]*const ClockNode{&XBAR26Findiv},
        };
        const XBAR27val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR27) };
        const XBAR27: ClockNode = .{
            .name = "XBAR27",
            .Nodetype = XBAR27val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR27Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR27Prediv.get() } };
        const XBAR27Prediv: ClockNode = .{
            .name = "XBAR27Prediv",
            .Nodetype = XBAR27Predivval,
            .parents = &[_]*const ClockNode{&XBAR27},
        };
        const XBAR27Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR27Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR27Findiv: ClockNode = .{
            .name = "XBAR27Findiv",
            .Nodetype = XBAR27Findivval,
            .parents = &[_]*const ClockNode{&XBAR27Prediv},
        };
        const XBAR27Outputval = ClockNodeTypes{
            .output = .{ .max = 314000000, .min = 0 },
        };
        const XBAR27Output: ClockNode = .{
            .name = "XBAR27Output",
            .Nodetype = XBAR27Outputval,
            .parents = &[_]*const ClockNode{&XBAR27Findiv},
        };
        const XBAR28val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR28) };
        const XBAR28: ClockNode = .{
            .name = "XBAR28",
            .Nodetype = XBAR28val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR28Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR28Prediv.get() } };
        const XBAR28Prediv: ClockNode = .{
            .name = "XBAR28Prediv",
            .Nodetype = XBAR28Predivval,
            .parents = &[_]*const ClockNode{&XBAR28},
        };
        const XBAR28Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR28Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR28Findiv: ClockNode = .{
            .name = "XBAR28Findiv",
            .Nodetype = XBAR28Findivval,
            .parents = &[_]*const ClockNode{&XBAR28Prediv},
        };
        const XBAR28Outputval = ClockNodeTypes{
            .output = .{ .max = 27000000, .min = 0 },
        };
        const XBAR28Output: ClockNode = .{
            .name = "XBAR28Output",
            .Nodetype = XBAR28Outputval,
            .parents = &[_]*const ClockNode{&XBAR28Findiv},
        };
        const XBAR29val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR29) };
        const XBAR29: ClockNode = .{
            .name = "XBAR29",
            .Nodetype = XBAR29val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR29Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR29Prediv.get() } };
        const XBAR29Prediv: ClockNode = .{
            .name = "XBAR29Prediv",
            .Nodetype = XBAR29Predivval,
            .parents = &[_]*const ClockNode{&XBAR29},
        };
        const XBAR29Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR29Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR29Findiv: ClockNode = .{
            .name = "XBAR29Findiv",
            .Nodetype = XBAR29Findivval,
            .parents = &[_]*const ClockNode{&XBAR29Prediv},
        };
        const XBAR29Outputval = ClockNodeTypes{
            .output = .{ .max = 333000000, .min = 0 },
        };
        const XBAR29Output: ClockNode = .{
            .name = "XBAR29Output",
            .Nodetype = XBAR29Outputval,
            .parents = &[_]*const ClockNode{&XBAR29Findiv},
        };
        const XBAR30val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR30) };
        const XBAR30: ClockNode = .{
            .name = "XBAR30",
            .Nodetype = XBAR30val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR30Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR30Prediv.get() } };
        const XBAR30Prediv: ClockNode = .{
            .name = "XBAR30Prediv",
            .Nodetype = XBAR30Predivval,
            .parents = &[_]*const ClockNode{&XBAR30},
        };
        const XBAR30Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR30Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR30Findiv: ClockNode = .{
            .name = "XBAR30Findiv",
            .Nodetype = XBAR30Findivval,
            .parents = &[_]*const ClockNode{&XBAR30Prediv},
        };
        const XBAR30Outputval = ClockNodeTypes{
            .output = .{ .max = 20000000, .min = 0 },
        };
        const XBAR30Output: ClockNode = .{
            .name = "XBAR30Output",
            .Nodetype = XBAR30Outputval,
            .parents = &[_]*const ClockNode{&XBAR30Findiv},
        };
        const XBAR31val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR31) };
        const XBAR31: ClockNode = .{
            .name = "XBAR31",
            .Nodetype = XBAR31val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR31Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR31Prediv.get() } };
        const XBAR31Prediv: ClockNode = .{
            .name = "XBAR31Prediv",
            .Nodetype = XBAR31Predivval,
            .parents = &[_]*const ClockNode{&XBAR31},
        };
        const XBAR31Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR31Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR31Findiv: ClockNode = .{
            .name = "XBAR31Findiv",
            .Nodetype = XBAR31Findivval,
            .parents = &[_]*const ClockNode{&XBAR31Prediv},
        };
        const XBAR31Outputval = ClockNodeTypes{
            .output = .{ .max = 27000000, .min = 0 },
        };
        const XBAR31Output: ClockNode = .{
            .name = "XBAR31Output",
            .Nodetype = XBAR31Outputval,
            .parents = &[_]*const ClockNode{&XBAR31Findiv},
        };
        const XBAR32val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR32) };
        const XBAR32: ClockNode = .{
            .name = "XBAR32",
            .Nodetype = XBAR32val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR32Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR32Prediv.get() } };
        const XBAR32Prediv: ClockNode = .{
            .name = "XBAR32Prediv",
            .Nodetype = XBAR32Predivval,
            .parents = &[_]*const ClockNode{&XBAR32},
        };
        const XBAR32Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR32Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR32Findiv: ClockNode = .{
            .name = "XBAR32Findiv",
            .Nodetype = XBAR32Findivval,
            .parents = &[_]*const ClockNode{&XBAR32Prediv},
        };
        const XBAR32Outputval = ClockNodeTypes{
            .output = .{ .max = 27000000, .min = 0 },
        };
        const XBAR32Output: ClockNode = .{
            .name = "XBAR32Output",
            .Nodetype = XBAR32Outputval,
            .parents = &[_]*const ClockNode{&XBAR32Findiv},
        };
        const XBAR33val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR33) };
        const XBAR33: ClockNode = .{
            .name = "XBAR33",
            .Nodetype = XBAR33val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
            },
        };
        const XBAR33Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR33Prediv.get() } };
        const XBAR33Prediv: ClockNode = .{
            .name = "XBAR33Prediv",
            .Nodetype = XBAR33Predivval,
            .parents = &[_]*const ClockNode{&XBAR33},
        };
        const XBAR33Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR33Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR33Findiv: ClockNode = .{
            .name = "XBAR33Findiv",
            .Nodetype = XBAR33Findivval,
            .parents = &[_]*const ClockNode{&XBAR33Prediv},
        };
        const XBAR33Outputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const XBAR33Output: ClockNode = .{
            .name = "XBAR33Output",
            .Nodetype = XBAR33Outputval,
            .parents = &[_]*const ClockNode{&XBAR33Findiv},
        };
        const XBAR34val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR34) };
        const XBAR34: ClockNode = .{
            .name = "XBAR34",
            .Nodetype = XBAR34val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR34Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR34Prediv.get() } };
        const XBAR34Prediv: ClockNode = .{
            .name = "XBAR34Prediv",
            .Nodetype = XBAR34Predivval,
            .parents = &[_]*const ClockNode{&XBAR34},
        };
        const XBAR34Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR34Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR34Findiv: ClockNode = .{
            .name = "XBAR34Findiv",
            .Nodetype = XBAR34Findivval,
            .parents = &[_]*const ClockNode{&XBAR34Prediv},
        };
        const XBAR34Outputval = ClockNodeTypes{
            .output = .{ .max = 25000000, .min = 0 },
        };
        const XBAR34Output: ClockNode = .{
            .name = "XBAR34Output",
            .Nodetype = XBAR34Outputval,
            .parents = &[_]*const ClockNode{&XBAR34Findiv},
        };
        const XBAR35val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR35) };
        const XBAR35: ClockNode = .{
            .name = "XBAR35",
            .Nodetype = XBAR35val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
            },
        };
        const XBAR35Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR35Prediv.get() } };
        const XBAR35Prediv: ClockNode = .{
            .name = "XBAR35Prediv",
            .Nodetype = XBAR35Predivval,
            .parents = &[_]*const ClockNode{&XBAR35},
        };
        const XBAR35Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR35Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR35Findiv: ClockNode = .{
            .name = "XBAR35Findiv",
            .Nodetype = XBAR35Findivval,
            .parents = &[_]*const ClockNode{&XBAR35Prediv},
        };
        const XBAR35Outputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const XBAR35Output: ClockNode = .{
            .name = "XBAR35Output",
            .Nodetype = XBAR35Outputval,
            .parents = &[_]*const ClockNode{&XBAR35Findiv},
        };
        const XBAR36val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR36) };
        const XBAR36: ClockNode = .{
            .name = "XBAR36",
            .Nodetype = XBAR36val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &MSIRC,
            },
        };
        const XBAR36Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR36Prediv.get() } };
        const XBAR36Prediv: ClockNode = .{
            .name = "XBAR36Prediv",
            .Nodetype = XBAR36Predivval,
            .parents = &[_]*const ClockNode{&XBAR36},
        };
        const XBAR36Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR36Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR36Findiv: ClockNode = .{
            .name = "XBAR36Findiv",
            .Nodetype = XBAR36Findivval,
            .parents = &[_]*const ClockNode{&XBAR36Prediv},
        };
        const XBAR36Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR36Output: ClockNode = .{
            .name = "XBAR36Output",
            .Nodetype = XBAR36Outputval,
            .parents = &[_]*const ClockNode{&XBAR36Findiv},
        };
        const XBAR37val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR37) };
        const XBAR37: ClockNode = .{
            .name = "XBAR37",
            .Nodetype = XBAR37val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &I2S_CKIN,
            },
        };
        const XBAR37Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR37Prediv.get() } };
        const XBAR37Prediv: ClockNode = .{
            .name = "XBAR37Prediv",
            .Nodetype = XBAR37Predivval,
            .parents = &[_]*const ClockNode{&XBAR37},
        };
        const XBAR37Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR37Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR37Findiv: ClockNode = .{
            .name = "XBAR37Findiv",
            .Nodetype = XBAR37Findivval,
            .parents = &[_]*const ClockNode{&XBAR37Prediv},
        };
        const XBAR37Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR37Output: ClockNode = .{
            .name = "XBAR37Output",
            .Nodetype = XBAR37Outputval,
            .parents = &[_]*const ClockNode{&XBAR37Findiv},
        };
        const XBAR38val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR38) };
        const XBAR38: ClockNode = .{
            .name = "XBAR38",
            .Nodetype = XBAR38val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &MSIRC,
            },
        };
        const XBAR38Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR38Prediv.get() } };
        const XBAR38Prediv: ClockNode = .{
            .name = "XBAR38Prediv",
            .Nodetype = XBAR38Predivval,
            .parents = &[_]*const ClockNode{&XBAR38},
        };
        const XBAR38Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR38Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR38Findiv: ClockNode = .{
            .name = "XBAR38Findiv",
            .Nodetype = XBAR38Findivval,
            .parents = &[_]*const ClockNode{&XBAR38Prediv},
        };
        const XBAR38Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR38Output: ClockNode = .{
            .name = "XBAR38Output",
            .Nodetype = XBAR38Outputval,
            .parents = &[_]*const ClockNode{&XBAR38Findiv},
        };
        const XBAR39val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR39) };
        const XBAR39: ClockNode = .{
            .name = "XBAR39",
            .Nodetype = XBAR39val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR39Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR39Prediv.get() } };
        const XBAR39Prediv: ClockNode = .{
            .name = "XBAR39Prediv",
            .Nodetype = XBAR39Predivval,
            .parents = &[_]*const ClockNode{&XBAR39},
        };
        const XBAR39Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR39Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR39Findiv: ClockNode = .{
            .name = "XBAR39Findiv",
            .Nodetype = XBAR39Findivval,
            .parents = &[_]*const ClockNode{&XBAR39Prediv},
        };
        const XBAR39Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR39Output: ClockNode = .{
            .name = "XBAR39Output",
            .Nodetype = XBAR39Outputval,
            .parents = &[_]*const ClockNode{&XBAR39Findiv},
        };
        const XBAR40val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR40) };
        const XBAR40: ClockNode = .{
            .name = "XBAR40",
            .Nodetype = XBAR40val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR40Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR40Prediv.get() } };
        const XBAR40Prediv: ClockNode = .{
            .name = "XBAR40Prediv",
            .Nodetype = XBAR40Predivval,
            .parents = &[_]*const ClockNode{&XBAR40},
        };
        const XBAR40Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR40Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR40Findiv: ClockNode = .{
            .name = "XBAR40Findiv",
            .Nodetype = XBAR40Findivval,
            .parents = &[_]*const ClockNode{&XBAR40Prediv},
        };
        const XBAR40Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR40Output: ClockNode = .{
            .name = "XBAR40Output",
            .Nodetype = XBAR40Outputval,
            .parents = &[_]*const ClockNode{&XBAR40Findiv},
        };
        const XBAR41val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR41) };
        const XBAR41: ClockNode = .{
            .name = "XBAR41",
            .Nodetype = XBAR41val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR41Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR41Prediv.get() } };
        const XBAR41Prediv: ClockNode = .{
            .name = "XBAR41Prediv",
            .Nodetype = XBAR41Predivval,
            .parents = &[_]*const ClockNode{&XBAR41},
        };
        const XBAR41Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR41Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR41Findiv: ClockNode = .{
            .name = "XBAR41Findiv",
            .Nodetype = XBAR41Findivval,
            .parents = &[_]*const ClockNode{&XBAR41Prediv},
        };
        const XBAR41Outputval = ClockNodeTypes{
            .output = .{ .max = 100000000, .min = 0 },
        };
        const XBAR41Output: ClockNode = .{
            .name = "XBAR41Output",
            .Nodetype = XBAR41Outputval,
            .parents = &[_]*const ClockNode{&XBAR41Findiv},
        };
        const XBAR42val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR42) };
        const XBAR42: ClockNode = .{
            .name = "XBAR42",
            .Nodetype = XBAR42val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR42Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR42Prediv.get() } };
        const XBAR42Prediv: ClockNode = .{
            .name = "XBAR42Prediv",
            .Nodetype = XBAR42Predivval,
            .parents = &[_]*const ClockNode{&XBAR42},
        };
        const XBAR42Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR42Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR42Findiv: ClockNode = .{
            .name = "XBAR42Findiv",
            .Nodetype = XBAR42Findivval,
            .parents = &[_]*const ClockNode{&XBAR42Prediv},
        };
        const XBAR42Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR42Output: ClockNode = .{
            .name = "XBAR42Output",
            .Nodetype = XBAR42Outputval,
            .parents = &[_]*const ClockNode{&XBAR42Findiv},
        };
        const XBAR43val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR43) };
        const XBAR43: ClockNode = .{
            .name = "XBAR43",
            .Nodetype = XBAR43val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR43Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR43Prediv.get() } };
        const XBAR43Prediv: ClockNode = .{
            .name = "XBAR43Prediv",
            .Nodetype = XBAR43Predivval,
            .parents = &[_]*const ClockNode{&XBAR43},
        };
        const XBAR43Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR43Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR43Findiv: ClockNode = .{
            .name = "XBAR43Findiv",
            .Nodetype = XBAR43Findivval,
            .parents = &[_]*const ClockNode{&XBAR43Prediv},
        };
        const XBAR43Outputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const XBAR43Output: ClockNode = .{
            .name = "XBAR43Output",
            .Nodetype = XBAR43Outputval,
            .parents = &[_]*const ClockNode{&XBAR43Findiv},
        };
        const XBAR44val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR44) };
        const XBAR44: ClockNode = .{
            .name = "XBAR44",
            .Nodetype = XBAR44val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR44Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR44Prediv.get() } };
        const XBAR44Prediv: ClockNode = .{
            .name = "XBAR44Prediv",
            .Nodetype = XBAR44Predivval,
            .parents = &[_]*const ClockNode{&XBAR44},
        };
        const XBAR44Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR44Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR44Findiv: ClockNode = .{
            .name = "XBAR44Findiv",
            .Nodetype = XBAR44Findivval,
            .parents = &[_]*const ClockNode{&XBAR44Prediv},
        };
        const XBAR44Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR44Output: ClockNode = .{
            .name = "XBAR44Output",
            .Nodetype = XBAR44Outputval,
            .parents = &[_]*const ClockNode{&XBAR44Findiv},
        };
        const XBAR45val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR45) };
        const XBAR45: ClockNode = .{
            .name = "XBAR45",
            .Nodetype = XBAR45val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR45Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR45Prediv.get() } };
        const XBAR45Prediv: ClockNode = .{
            .name = "XBAR45Prediv",
            .Nodetype = XBAR45Predivval,
            .parents = &[_]*const ClockNode{&XBAR45},
        };
        const XBAR45Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR45Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR45Findiv: ClockNode = .{
            .name = "XBAR45Findiv",
            .Nodetype = XBAR45Findivval,
            .parents = &[_]*const ClockNode{&XBAR45Prediv},
        };
        const XBAR45Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const XBAR45Output: ClockNode = .{
            .name = "XBAR45Output",
            .Nodetype = XBAR45Outputval,
            .parents = &[_]*const ClockNode{&XBAR45Findiv},
        };
        const XBAR46val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR46) };
        const XBAR46: ClockNode = .{
            .name = "XBAR46",
            .Nodetype = XBAR46val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR46Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR46Prediv.get() } };
        const XBAR46Prediv: ClockNode = .{
            .name = "XBAR46Prediv",
            .Nodetype = XBAR46Predivval,
            .parents = &[_]*const ClockNode{&XBAR46},
        };
        const XBAR46Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR46Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR46Findiv: ClockNode = .{
            .name = "XBAR46Findiv",
            .Nodetype = XBAR46Findivval,
            .parents = &[_]*const ClockNode{&XBAR46Prediv},
        };
        const XBAR46Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR46Output: ClockNode = .{
            .name = "XBAR46Output",
            .Nodetype = XBAR46Outputval,
            .parents = &[_]*const ClockNode{&XBAR46Findiv},
        };
        const XBAR47val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR47) };
        const XBAR47: ClockNode = .{
            .name = "XBAR47",
            .Nodetype = XBAR47val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR47Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR47Prediv.get() } };
        const XBAR47Prediv: ClockNode = .{
            .name = "XBAR47Prediv",
            .Nodetype = XBAR47Predivval,
            .parents = &[_]*const ClockNode{&XBAR47},
        };
        const XBAR47Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR47Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR47Findiv: ClockNode = .{
            .name = "XBAR47Findiv",
            .Nodetype = XBAR47Findivval,
            .parents = &[_]*const ClockNode{&XBAR47Prediv},
        };
        const XBAR47Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR47Output: ClockNode = .{
            .name = "XBAR47Output",
            .Nodetype = XBAR47Outputval,
            .parents = &[_]*const ClockNode{&XBAR47Findiv},
        };
        const XBAR48val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR48) };
        const XBAR48: ClockNode = .{
            .name = "XBAR48",
            .Nodetype = XBAR48val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR48Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR48Prediv.get() } };
        const XBAR48Prediv: ClockNode = .{
            .name = "XBAR48Prediv",
            .Nodetype = XBAR48Predivval,
            .parents = &[_]*const ClockNode{&XBAR48},
        };
        const XBAR48Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR48Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR48Findiv: ClockNode = .{
            .name = "XBAR48Findiv",
            .Nodetype = XBAR48Findivval,
            .parents = &[_]*const ClockNode{&XBAR48Prediv},
        };
        const XBAR48Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR48Output: ClockNode = .{
            .name = "XBAR48Output",
            .Nodetype = XBAR48Outputval,
            .parents = &[_]*const ClockNode{&XBAR48Findiv},
        };
        const XBAR49val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR49) };
        const XBAR49: ClockNode = .{
            .name = "XBAR49",
            .Nodetype = XBAR49val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR49Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR49Prediv.get() } };
        const XBAR49Prediv: ClockNode = .{
            .name = "XBAR49Prediv",
            .Nodetype = XBAR49Predivval,
            .parents = &[_]*const ClockNode{&XBAR49},
        };
        const XBAR49Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR49Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR49Findiv: ClockNode = .{
            .name = "XBAR49Findiv",
            .Nodetype = XBAR49Findivval,
            .parents = &[_]*const ClockNode{&XBAR49Prediv},
        };
        const XBAR49Outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const XBAR49Output: ClockNode = .{
            .name = "XBAR49Output",
            .Nodetype = XBAR49Outputval,
            .parents = &[_]*const ClockNode{&XBAR49Findiv},
        };
        const XBAR50val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR50) };
        const XBAR50: ClockNode = .{
            .name = "XBAR50",
            .Nodetype = XBAR50val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR50Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR50Prediv.get() } };
        const XBAR50Prediv: ClockNode = .{
            .name = "XBAR50Prediv",
            .Nodetype = XBAR50Predivval,
            .parents = &[_]*const ClockNode{&XBAR50},
        };
        const XBAR50Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR50Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR50Findiv: ClockNode = .{
            .name = "XBAR50Findiv",
            .Nodetype = XBAR50Findivval,
            .parents = &[_]*const ClockNode{&XBAR50Prediv},
        };
        const XBAR50Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR50Output: ClockNode = .{
            .name = "XBAR50Output",
            .Nodetype = XBAR50Outputval,
            .parents = &[_]*const ClockNode{&XBAR50Findiv},
        };
        const XBAR51val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR51) };
        const XBAR51: ClockNode = .{
            .name = "XBAR51",
            .Nodetype = XBAR51val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
            },
        };
        const XBAR51Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR51Prediv.get() } };
        const XBAR51Prediv: ClockNode = .{
            .name = "XBAR51Prediv",
            .Nodetype = XBAR51Predivval,
            .parents = &[_]*const ClockNode{&XBAR51},
        };
        const XBAR51Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR51Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR51Findiv: ClockNode = .{
            .name = "XBAR51Findiv",
            .Nodetype = XBAR51Findivval,
            .parents = &[_]*const ClockNode{&XBAR51Prediv},
        };
        const XBAR51Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR51Output: ClockNode = .{
            .name = "XBAR51Output",
            .Nodetype = XBAR51Outputval,
            .parents = &[_]*const ClockNode{&XBAR51Findiv},
        };
        const XBAR52val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR52) };
        const XBAR52: ClockNode = .{
            .name = "XBAR52",
            .Nodetype = XBAR52val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
            },
        };
        const XBAR52Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR52Prediv.get() } };
        const XBAR52Prediv: ClockNode = .{
            .name = "XBAR52Prediv",
            .Nodetype = XBAR52Predivval,
            .parents = &[_]*const ClockNode{&XBAR52},
        };
        const XBAR52Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR52Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR52Findiv: ClockNode = .{
            .name = "XBAR52Findiv",
            .Nodetype = XBAR52Findivval,
            .parents = &[_]*const ClockNode{&XBAR52Prediv},
        };
        const XBAR52Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR52Output: ClockNode = .{
            .name = "XBAR52Output",
            .Nodetype = XBAR52Outputval,
            .parents = &[_]*const ClockNode{&XBAR52Findiv},
        };
        const XBAR53val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR53) };
        const XBAR53: ClockNode = .{
            .name = "XBAR53",
            .Nodetype = XBAR53val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
            },
        };
        const XBAR53Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR53Prediv.get() } };
        const XBAR53Prediv: ClockNode = .{
            .name = "XBAR53Prediv",
            .Nodetype = XBAR53Predivval,
            .parents = &[_]*const ClockNode{&XBAR53},
        };
        const XBAR53Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR53Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR53Findiv: ClockNode = .{
            .name = "XBAR53Findiv",
            .Nodetype = XBAR53Findivval,
            .parents = &[_]*const ClockNode{&XBAR53Prediv},
        };
        const XBAR53Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR53Output: ClockNode = .{
            .name = "XBAR53Output",
            .Nodetype = XBAR53Outputval,
            .parents = &[_]*const ClockNode{&XBAR53Findiv},
        };
        const XBAR54val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR54) };
        const XBAR54: ClockNode = .{
            .name = "XBAR54",
            .Nodetype = XBAR54val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR54Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR54Prediv.get() } };
        const XBAR54Prediv: ClockNode = .{
            .name = "XBAR54Prediv",
            .Nodetype = XBAR54Predivval,
            .parents = &[_]*const ClockNode{&XBAR54},
        };
        const XBAR54Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR54Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR54Findiv: ClockNode = .{
            .name = "XBAR54Findiv",
            .Nodetype = XBAR54Findivval,
            .parents = &[_]*const ClockNode{&XBAR54Prediv},
        };
        const XBAR54Outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const XBAR54Output: ClockNode = .{
            .name = "XBAR54Output",
            .Nodetype = XBAR54Outputval,
            .parents = &[_]*const ClockNode{&XBAR54Findiv},
        };
        const XBAR55val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR55) };
        const XBAR55: ClockNode = .{
            .name = "XBAR55",
            .Nodetype = XBAR55val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR55Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR55Prediv.get() } };
        const XBAR55Prediv: ClockNode = .{
            .name = "XBAR55Prediv",
            .Nodetype = XBAR55Predivval,
            .parents = &[_]*const ClockNode{&XBAR55},
        };
        const XBAR55Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR55Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR55Findiv: ClockNode = .{
            .name = "XBAR55Findiv",
            .Nodetype = XBAR55Findivval,
            .parents = &[_]*const ClockNode{&XBAR55Prediv},
        };
        const XBAR55Outputval = ClockNodeTypes{
            .output = .{ .max = 125000000, .min = 0 },
        };
        const XBAR55Output: ClockNode = .{
            .name = "XBAR55Output",
            .Nodetype = XBAR55Outputval,
            .parents = &[_]*const ClockNode{&XBAR55Findiv},
        };
        const XBAR56val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR56) };
        const XBAR56: ClockNode = .{
            .name = "XBAR56",
            .Nodetype = XBAR56val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR56Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR56Prediv.get() } };
        const XBAR56Prediv: ClockNode = .{
            .name = "XBAR56Prediv",
            .Nodetype = XBAR56Predivval,
            .parents = &[_]*const ClockNode{&XBAR56},
        };
        const XBAR56Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR56Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR56Findiv: ClockNode = .{
            .name = "XBAR56Findiv",
            .Nodetype = XBAR56Findivval,
            .parents = &[_]*const ClockNode{&XBAR56Prediv},
        };
        const XBAR56Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const XBAR56Output: ClockNode = .{
            .name = "XBAR56Output",
            .Nodetype = XBAR56Outputval,
            .parents = &[_]*const ClockNode{&XBAR56Findiv},
        };
        const XBAR57val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR57) };
        const XBAR57: ClockNode = .{
            .name = "XBAR57",
            .Nodetype = XBAR57val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR57Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR57Prediv.get() } };
        const XBAR57Prediv: ClockNode = .{
            .name = "XBAR57Prediv",
            .Nodetype = XBAR57Predivval,
            .parents = &[_]*const ClockNode{&XBAR57},
        };
        const XBAR57Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR57Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR57Findiv: ClockNode = .{
            .name = "XBAR57Findiv",
            .Nodetype = XBAR57Findivval,
            .parents = &[_]*const ClockNode{&XBAR57Prediv},
        };
        const XBAR57Outputval = ClockNodeTypes{
            .output = .{ .max = 24000000, .min = 0 },
        };
        const XBAR57Output: ClockNode = .{
            .name = "XBAR57Output",
            .Nodetype = XBAR57Outputval,
            .parents = &[_]*const ClockNode{&XBAR57Findiv},
        };
        const XBAR58val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR58) };
        const XBAR58: ClockNode = .{
            .name = "XBAR58",
            .Nodetype = XBAR58val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSEOSC,
            },
        };
        const XBAR58Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR58Prediv.get() } };
        const XBAR58Prediv: ClockNode = .{
            .name = "XBAR58Prediv",
            .Nodetype = XBAR58Predivval,
            .parents = &[_]*const ClockNode{&XBAR58},
        };
        const XBAR58Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR58Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR58Findiv: ClockNode = .{
            .name = "XBAR58Findiv",
            .Nodetype = XBAR58Findivval,
            .parents = &[_]*const ClockNode{&XBAR58Prediv},
        };
        const XBAR58Outputval = ClockNodeTypes{
            .output = .{ .max = 24000000, .min = 0 },
        };
        const XBAR58Output: ClockNode = .{
            .name = "XBAR58Output",
            .Nodetype = XBAR58Outputval,
            .parents = &[_]*const ClockNode{&XBAR58Findiv},
        };
        const XBAR59val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR59) };
        const XBAR59: ClockNode = .{
            .name = "XBAR59",
            .Nodetype = XBAR59val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR59Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR59Prediv.get() } };
        const XBAR59Prediv: ClockNode = .{
            .name = "XBAR59Prediv",
            .Nodetype = XBAR59Predivval,
            .parents = &[_]*const ClockNode{&XBAR59},
        };
        const XBAR59Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR59Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR59Findiv: ClockNode = .{
            .name = "XBAR59Findiv",
            .Nodetype = XBAR59Findivval,
            .parents = &[_]*const ClockNode{&XBAR59Prediv},
        };
        const XBAR59Outputval = ClockNodeTypes{
            .output = .{ .max = 600000000, .min = 0 },
        };
        const XBAR59Output: ClockNode = .{
            .name = "XBAR59Output",
            .Nodetype = XBAR59Outputval,
            .parents = &[_]*const ClockNode{&XBAR59Findiv},
        };
        const XBAR60val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR60) };
        const XBAR60: ClockNode = .{
            .name = "XBAR60",
            .Nodetype = XBAR60val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
            },
        };
        const XBAR60Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR60Prediv.get() } };
        const XBAR60Prediv: ClockNode = .{
            .name = "XBAR60Prediv",
            .Nodetype = XBAR60Predivval,
            .parents = &[_]*const ClockNode{&XBAR60},
        };
        const XBAR60Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR60Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR60Findiv: ClockNode = .{
            .name = "XBAR60Findiv",
            .Nodetype = XBAR60Findivval,
            .parents = &[_]*const ClockNode{&XBAR60Prediv},
        };
        const XBAR60Outputval = ClockNodeTypes{
            .output = .{ .max = 50000000, .min = 0 },
        };
        const XBAR60Output: ClockNode = .{
            .name = "XBAR60Output",
            .Nodetype = XBAR60Outputval,
            .parents = &[_]*const ClockNode{&XBAR60Findiv},
        };
        const XBAR61val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR61) };
        const XBAR61: ClockNode = .{
            .name = "XBAR61",
            .Nodetype = XBAR61val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR61Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR61Prediv.get() } };
        const XBAR61Prediv: ClockNode = .{
            .name = "XBAR61Prediv",
            .Nodetype = XBAR61Predivval,
            .parents = &[_]*const ClockNode{&XBAR61},
        };
        const XBAR61Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR61Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR61Findiv: ClockNode = .{
            .name = "XBAR61Findiv",
            .Nodetype = XBAR61Findivval,
            .parents = &[_]*const ClockNode{&XBAR61Prediv},
        };
        const XBAR61Outputval = ClockNodeTypes{
            .output = .{ .max = 160000000, .min = 0 },
        };
        const XBAR61Output: ClockNode = .{
            .name = "XBAR61Output",
            .Nodetype = XBAR61Outputval,
            .parents = &[_]*const ClockNode{&XBAR61Findiv},
        };
        const XBAR62val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR62) };
        const XBAR62: ClockNode = .{
            .name = "XBAR62",
            .Nodetype = XBAR62val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
            },
        };
        const XBAR62Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR62Prediv.get() } };
        const XBAR62Prediv: ClockNode = .{
            .name = "XBAR62Prediv",
            .Nodetype = XBAR62Predivval,
            .parents = &[_]*const ClockNode{&XBAR62},
        };
        const XBAR62Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR62Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR62Findiv: ClockNode = .{
            .name = "XBAR62Findiv",
            .Nodetype = XBAR62Findivval,
            .parents = &[_]*const ClockNode{&XBAR62Prediv},
        };
        const XBAR62Outputval = ClockNodeTypes{
            .output = .{ .max = 160000000, .min = 0 },
        };
        const XBAR62Output: ClockNode = .{
            .name = "XBAR62Output",
            .Nodetype = XBAR62Outputval,
            .parents = &[_]*const ClockNode{&XBAR62Findiv},
        };
        const XBAR63val = ClockNodeTypes{ .multi = @intFromEnum(config.XBAR63) };
        const XBAR63: ClockNode = .{
            .name = "XBAR63",
            .Nodetype = XBAR63val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const XBAR63Predivval = ClockNodeTypes{ .div = .{ .value = config.XBAR63Prediv.get() } };
        const XBAR63Prediv: ClockNode = .{
            .name = "XBAR63Prediv",
            .Nodetype = XBAR63Predivval,
            .parents = &[_]*const ClockNode{&XBAR63},
        };
        const XBAR63Findivval = ClockNodeTypes{
            .div = .{
                .value = config.XBAR63Findiv.get(),
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const XBAR63Findiv: ClockNode = .{
            .name = "XBAR63Findiv",
            .Nodetype = XBAR63Findivval,
            .parents = &[_]*const ClockNode{&XBAR63Prediv},
        };
        const XBAR63Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const XBAR63Output: ClockNode = .{
            .name = "XBAR63Output",
            .Nodetype = XBAR63Outputval,
            .parents = &[_]*const ClockNode{&XBAR63Findiv},
        };
        const PLL1Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL1Source) };
        const PLL1Source: ClockNode = .{
            .name = "PLL1Source",
            .Nodetype = PLL1Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const PLL2Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL2Source) };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",
            .Nodetype = PLL2Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const PLL3Sourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLL3Source) };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",
            .Nodetype = PLL3Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
            },
        };
        const CKINTSEL0val = ClockNodeTypes{ .multi = @intFromEnum(config.CKINTSEL0) };
        const CKINTSEL0: ClockNode = .{
            .name = "CKINTSEL0",
            .Nodetype = CKINTSEL0val,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &PLL4Source,
                &PLL5Source,
                &PLL6Source,
                &PLL7Source,
                &PLL8Source,
                &PLL1Source,
                &PLL2Source,
                &PLL3Source,
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
                &XBAR0Output,
                &XBAR1Output,
                &XBAR2Output,
                &XBAR3Output,
                &XBAR4Output,
                &XBAR5Output,
                &XBAR6Output,
                &XBAR7Output,
                &XBAR8Output,
                &XBAR9Output,
                &XBAR10Output,
                &XBAR11Output,
                &XBAR12Output,
                &XBAR13Output,
                &XBAR14Output,
                &XBAR15Output,
                &XBAR16Output,
                &XBAR17Output,
                &XBAR18Output,
                &XBAR19Output,
                &XBAR20Output,
                &XBAR21Output,
                &XBAR22Output,
                &XBAR23Output,
                &XBAR24Output,
                &XBAR25Output,
                &XBAR26Output,
                &XBAR27Output,
                &XBAR28Output,
                &XBAR29Output,
                &XBAR30Output,
                &XBAR31Output,
                &XBAR32Output,
                &XBAR33Output,
                &XBAR34Output,
                &XBAR35Output,
                &XBAR36Output,
                &XBAR37Output,
                &XBAR38Output,
                &XBAR39Output,
                &XBAR40Output,
                &XBAR41Output,
                &XBAR42Output,
                &XBAR43Output,
                &XBAR44Output,
                &XBAR45Output,
                &XBAR46Output,
                &XBAR47Output,
                &XBAR48Output,
                &XBAR49Output,
                &XBAR50Output,
                &XBAR51Output,
                &XBAR52Output,
                &XBAR53Output,
                &XBAR54Output,
                &XBAR55Output,
                &XBAR56Output,
                &XBAR57Output,
                &XBAR58Output,
                &XBAR59Output,
                &XBAR60Output,
                &XBAR61Output,
                &XBAR62Output,
                &XBAR63Output,
            },
        };
        const FREFDIV1val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV1.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV1: ClockNode = .{
            .name = "FREFDIV1",
            .Nodetype = FREFDIV1val,
            .parents = &[_]*const ClockNode{&PLL1Source},
        };
        const FBDIV1val = ClockNodeTypes{
            .mul = .{
                .value = config.FBDIV1.get(),
                .limit = .{ .max = 2500, .min = 16 },
            },
        };
        const FBDIV1: ClockNode = .{
            .name = "FBDIV1",
            .Nodetype = FBDIV1val,
            .parents = &[_]*const ClockNode{&FREFDIV1},
        };
        const POSTDIV1_1val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_1.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_1: ClockNode = .{
            .name = "POSTDIV1_1",
            .Nodetype = POSTDIV1_1val,
            .parents = &[_]*const ClockNode{&FBDIV1},
        };
        const POSTDIV2_1val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_1.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_1: ClockNode = .{
            .name = "POSTDIV2_1",
            .Nodetype = POSTDIV2_1val,
            .parents = &[_]*const ClockNode{&POSTDIV1_1},
        };
        const FOUTPOSTDIV1val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV1: ClockNode = .{
            .name = "FOUTPOSTDIV1",
            .Nodetype = FOUTPOSTDIV1val,
            .parents = &[_]*const ClockNode{&POSTDIV2_1},
        };
        const PLL1Div42val = ClockNodeTypes{
            .div = .{ .value = 42 },
        };
        const PLL1Div42: ClockNode = .{
            .name = "PLL1Div42",
            .Nodetype = PLL1Div42val,
            .parents = &[_]*const ClockNode{&FOUTPOSTDIV1},
        };
        const FREFDIV2val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV2.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV2: ClockNode = .{
            .name = "FREFDIV2",
            .Nodetype = FREFDIV2val,
            .parents = &[_]*const ClockNode{&PLL2Source},
        };
        const PLL2FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL2FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL2FRACV: ClockNode = .{
            .name = "PLL2FRACV",
            .Nodetype = PLL2FRACVval,
        };
        const FBDIV2val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.FBDIV2.get(),
                .limit = .{ .max = 12297829382473034410, .min = 12297829382473034410 },
            },
        };
        const FBDIV2: ClockNode = .{
            .name = "FBDIV2",
            .Nodetype = FBDIV2val,
            .parents = &[_]*const ClockNode{ &FREFDIV2, &PLL2FRACV },
        };
        const POSTDIV1_2val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_2.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_2: ClockNode = .{
            .name = "POSTDIV1_2",
            .Nodetype = POSTDIV1_2val,
            .parents = &[_]*const ClockNode{&FBDIV2},
        };
        const POSTDIV2_2val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_2.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_2: ClockNode = .{
            .name = "POSTDIV2_2",
            .Nodetype = POSTDIV2_2val,
            .parents = &[_]*const ClockNode{&POSTDIV1_2},
        };
        const FOUTPOSTDIV2val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV2: ClockNode = .{
            .name = "FOUTPOSTDIV2",
            .Nodetype = FOUTPOSTDIV2val,
            .parents = &[_]*const ClockNode{&POSTDIV2_2},
        };
        const PLL2Div4val = ClockNodeTypes{
            .div = .{ .value = 4 },
        };
        const PLL2Div4: ClockNode = .{
            .name = "PLL2Div4",
            .Nodetype = PLL2Div4val,
            .parents = &[_]*const ClockNode{&FOUTPOSTDIV2},
        };
        const FREFDIV3val = ClockNodeTypes{
            .div = .{
                .value = config.FREFDIV3.get(),
                .limit = .{ .max = 63, .min = 1 },
            },
        };
        const FREFDIV3: ClockNode = .{
            .name = "FREFDIV3",
            .Nodetype = FREFDIV3val,
            .parents = &[_]*const ClockNode{&PLL3Source},
        };
        const PLL3FRACVval = ClockNodeTypes{
            .source = .{
                .value = config.PLL3FRACV.get(),
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL3FRACV: ClockNode = .{
            .name = "PLL3FRACV",
            .Nodetype = PLL3FRACVval,
        };
        const FBDIV3val = ClockNodeTypes{
            .mulfrac = .{
                .value = config.FBDIV3.get(),
                .limit = .{ .max = 12297829382473034410, .min = 12297829382473034410 },
            },
        };
        const FBDIV3: ClockNode = .{
            .name = "FBDIV3",
            .Nodetype = FBDIV3val,
            .parents = &[_]*const ClockNode{ &FREFDIV3, &PLL3FRACV },
        };
        const POSTDIV1_3val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV1_3.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV1_3: ClockNode = .{
            .name = "POSTDIV1_3",
            .Nodetype = POSTDIV1_3val,
            .parents = &[_]*const ClockNode{&FBDIV3},
        };
        const POSTDIV2_3val = ClockNodeTypes{
            .div = .{
                .value = config.POSTDIV2_3.get(),
                .limit = .{ .max = 7, .min = 1 },
            },
        };
        const POSTDIV2_3: ClockNode = .{
            .name = "POSTDIV2_3",
            .Nodetype = POSTDIV2_3val,
            .parents = &[_]*const ClockNode{&POSTDIV1_3},
        };
        const FOUTPOSTDIV3val = ClockNodeTypes{
            .output = .{ .max = 3200000000, .min = 16000000 },
        };
        const FOUTPOSTDIV3: ClockNode = .{
            .name = "FOUTPOSTDIV3",
            .Nodetype = FOUTPOSTDIV3val,
            .parents = &[_]*const ClockNode{&POSTDIV2_3},
        };
        const PLL3Div2val = ClockNodeTypes{
            .div = .{ .value = 2 },
        };
        const PLL3Div2: ClockNode = .{
            .name = "PLL3Div2",
            .Nodetype = PLL3Div2val,
            .parents = &[_]*const ClockNode{&FOUTPOSTDIV3},
        };
        const CKEXTSEL0val = ClockNodeTypes{ .multi = @intFromEnum(config.CKEXTSEL0) };
        const CKEXTSEL0: ClockNode = .{
            .name = "CKEXTSEL0",
            .Nodetype = CKEXTSEL0val,

            .parents = &[_]*const ClockNode{
                &PLL1Div42,
                &PLL2Div4,
                &PLL3Div2,
            },
        };
        const CKINTSEL1val = ClockNodeTypes{ .multi = @intFromEnum(config.CKINTSEL1) };
        const CKINTSEL1: ClockNode = .{
            .name = "CKINTSEL1",
            .Nodetype = CKINTSEL1val,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &MSIRC,
                &PLL4Source,
                &PLL5Source,
                &PLL6Source,
                &PLL7Source,
                &PLL8Source,
                &PLL1Source,
                &PLL2Source,
                &PLL3Source,
                &FOUTPOSTDIV4,
                &FOUTPOSTDIV5,
                &FOUTPOSTDIV6,
                &FOUTPOSTDIV7,
                &FOUTPOSTDIV8,
                &SPDIF,
                &I2S_CKIN,
                &LSIRC,
                &LSEOSC,
                &XBAR0Output,
                &XBAR1Output,
                &XBAR2Output,
                &XBAR3Output,
                &XBAR4Output,
                &XBAR5Output,
                &XBAR6Output,
                &XBAR7Output,
                &XBAR8Output,
                &XBAR9Output,
                &XBAR10Output,
                &XBAR11Output,
                &XBAR12Output,
                &XBAR13Output,
                &XBAR14Output,
                &XBAR15Output,
                &XBAR16Output,
                &XBAR17Output,
                &XBAR18Output,
                &XBAR19Output,
                &XBAR20Output,
                &XBAR21Output,
                &XBAR22Output,
                &XBAR23Output,
                &XBAR24Output,
                &XBAR25Output,
                &XBAR26Output,
                &XBAR27Output,
                &XBAR28Output,
                &XBAR29Output,
                &XBAR30Output,
                &XBAR31Output,
                &XBAR32Output,
                &XBAR33Output,
                &XBAR34Output,
                &XBAR35Output,
                &XBAR36Output,
                &XBAR37Output,
                &XBAR38Output,
                &XBAR39Output,
                &XBAR40Output,
                &XBAR41Output,
                &XBAR42Output,
                &XBAR43Output,
                &XBAR44Output,
                &XBAR45Output,
                &XBAR46Output,
                &XBAR47Output,
                &XBAR48Output,
                &XBAR49Output,
                &XBAR50Output,
                &XBAR51Output,
                &XBAR52Output,
                &XBAR53Output,
                &XBAR54Output,
                &XBAR55Output,
                &XBAR56Output,
                &XBAR57Output,
                &XBAR58Output,
                &XBAR59Output,
                &XBAR60Output,
                &XBAR61Output,
                &XBAR62Output,
                &XBAR63Output,
            },
        };
        const CKEXTSEL1val = ClockNodeTypes{ .multi = @intFromEnum(config.CKEXTSEL1) };
        const CKEXTSEL1: ClockNode = .{
            .name = "CKEXTSEL1",
            .Nodetype = CKEXTSEL1val,

            .parents = &[_]*const ClockNode{
                &PLL1Div42,
                &PLL2Div4,
                &PLL3Div2,
            },
        };
        const OBS0val = ClockNodeTypes{ .multi = @intFromEnum(config.OBS0) };
        const OBS0: ClockNode = .{
            .name = "OBS0",
            .Nodetype = OBS0val,

            .parents = &[_]*const ClockNode{
                &CKINTSEL0,
                &CKEXTSEL0,
            },
        };
        const OBS0Outputval = ClockNodeTypes{ .output = null };
        const OBS0Output: ClockNode = .{
            .name = "OBS0Output",
            .Nodetype = OBS0Outputval,
            .parents = &[_]*const ClockNode{&OBS0},
        };
        const OBS1val = ClockNodeTypes{ .multi = @intFromEnum(config.OBS1) };
        const OBS1: ClockNode = .{
            .name = "OBS1",
            .Nodetype = OBS1val,

            .parents = &[_]*const ClockNode{
                &CKINTSEL1,
                &CKEXTSEL1,
            },
        };
        const OBS1Outputval = ClockNodeTypes{ .output = null };
        const OBS1Output: ClockNode = .{
            .name = "OBS1Output",
            .Nodetype = OBS1Outputval,
            .parents = &[_]*const ClockNode{&OBS1},
        };
        const MCO1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.MCO1Mult) };
        const MCO1Mult: ClockNode = .{
            .name = "MCO1Mult",
            .Nodetype = MCO1Multval,

            .parents = &[_]*const ClockNode{
                &XBAR61Output,
                &OBS0Output,
            },
        };
        const MCO1Pinval = ClockNodeTypes{ .output = null };
        const MCO1Pin: ClockNode = .{
            .name = "MCO1Pin",
            .Nodetype = MCO1Pinval,
            .parents = &[_]*const ClockNode{&MCO1Mult},
        };
        const MCO2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.MCO2Mult) };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .Nodetype = MCO2Multval,

            .parents = &[_]*const ClockNode{
                &XBAR62Output,
                &OBS1Output,
            },
        };
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const D3PERval = ClockNodeTypes{ .multi = @intFromEnum(config.D3PER) };
        const D3PER: ClockNode = .{
            .name = "D3PER",
            .Nodetype = D3PERval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &LSIRC,
                &LSEOSC,
            },
        };
        const D3PEROutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const D3PEROutput: ClockNode = .{
            .name = "D3PEROutput",
            .Nodetype = D3PEROutputval,
            .parents = &[_]*const ClockNode{&D3PER},
        };
        const DTSval = ClockNodeTypes{ .multi = @intFromEnum(config.DTS) };
        const DTS: ClockNode = .{
            .name = "DTS",
            .Nodetype = DTSval,

            .parents = &[_]*const ClockNode{
                &MSIRC,
                &HSIRC,
                &HSEOSC,
            },
        };
        const DTSOutputval = ClockNodeTypes{
            .output = .{ .max = 64000000, .min = 0 },
        };
        const DTSOutput: ClockNode = .{
            .name = "DTSOutput",
            .Nodetype = DTSOutputval,
            .parents = &[_]*const ClockNode{&DTS},
        };
        const DSIPHYval = ClockNodeTypes{ .multi = @intFromEnum(config.DSIPHY) };
        const DSIPHY: ClockNode = .{
            .name = "DSIPHY",
            .Nodetype = DSIPHYval,

            .parents = &[_]*const ClockNode{
                &XBAR28Output,
                &HSEOSC,
            },
        };
        const DSIPHYOutputval = ClockNodeTypes{
            .output = .{ .max = 27000000, .min = 17000000 },
        };
        const DSIPHYOutput: ClockNode = .{
            .name = "DSIPHYOutput",
            .Nodetype = DSIPHYOutputval,
            .parents = &[_]*const ClockNode{&DSIPHY},
        };
        const DSIBLANEval = ClockNodeTypes{ .multi = @intFromEnum(config.DSIBLANE) };
        const DSIBLANE: ClockNode = .{
            .name = "DSIBLANE",
            .Nodetype = DSIBLANEval,

            .parents = &[_]*const ClockNode{
                &DSIPHYOutput,
                &XBAR27Output,
            },
        };
        const DSIBLANEOutputval = ClockNodeTypes{
            .output = .{ .max = 314000000, .min = 0 },
        };
        const DSIBLANEOutput: ClockNode = .{
            .name = "DSIBLANEOutput",
            .Nodetype = DSIBLANEOutputval,
            .parents = &[_]*const ClockNode{&DSIBLANE},
        };
        const USB2PHY1val = ClockNodeTypes{ .multi = @intFromEnum(config.USB2PHY1) };
        const USB2PHY1: ClockNode = .{
            .name = "USB2PHY1",
            .Nodetype = USB2PHY1val,

            .parents = &[_]*const ClockNode{
                &XBAR57Output,
                &HSEDIV2,
            },
        };
        const USB2PHY1Outputval = ClockNodeTypes{
            .output = .{ .max = 24000000, .min = 0 },
        };
        const USB2PHY1Output: ClockNode = .{
            .name = "USB2PHY1Output",
            .Nodetype = USB2PHY1Outputval,
            .parents = &[_]*const ClockNode{&USB2PHY1},
        };
        const USB2PHY2val = ClockNodeTypes{ .multi = @intFromEnum(config.USB2PHY2) };
        const USB2PHY2: ClockNode = .{
            .name = "USB2PHY2",
            .Nodetype = USB2PHY2val,

            .parents = &[_]*const ClockNode{
                &XBAR58Output,
                &HSEDIV2,
            },
        };
        const USB2PHY2Outputval = ClockNodeTypes{
            .output = .{ .max = 24000000, .min = 0 },
        };
        const USB2PHY2Output: ClockNode = .{
            .name = "USB2PHY2Output",
            .Nodetype = USB2PHY2Outputval,
            .parents = &[_]*const ClockNode{&USB2PHY2},
        };
        const USB3PCIPHYval = ClockNodeTypes{ .multi = @intFromEnum(config.USB3PCIPHY) };
        const USB3PCIPHY: ClockNode = .{
            .name = "USB3PCIPHY",
            .Nodetype = USB3PCIPHYval,

            .parents = &[_]*const ClockNode{
                &XBAR34Output,
                &HSEDIV2,
            },
        };
        const USB3PCIPHYOutputval = ClockNodeTypes{
            .output = .{ .max = 25000000, .min = 0 },
        };
        const USB3PCIPHYOutput: ClockNode = .{
            .name = "USB3PCIPHYOutput",
            .Nodetype = USB3PCIPHYOutputval,
            .parents = &[_]*const ClockNode{&USB3PCIPHY},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &XBAR0Output,
                &HSIRC,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const MCUDIVval = ClockNodeTypes{ .div = .{ .value = config.MCUDIV.get() } };
        const MCUDIV: ClockNode = .{
            .name = "MCUDIV",
            .Nodetype = MCUDIVval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const McuClockOutputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const McuClockOutput: ClockNode = .{
            .name = "McuClockOutput",
            .Nodetype = McuClockOutputval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const APB3DIVval = ClockNodeTypes{ .div = .{ .value = config.APB3DIV.get() } };
        const APB3DIV: ClockNode = .{
            .name = "APB3DIV",
            .Nodetype = APB3DIVval,
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const APB3Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const APB3Output: ClockNode = .{
            .name = "APB3Output",
            .Nodetype = APB3Outputval,
            .parents = &[_]*const ClockNode{&APB3DIV},
        };
        const APB4DIVval = ClockNodeTypes{ .div = .{ .value = config.APB4DIV.get() } };
        const APB4DIV: ClockNode = .{
            .name = "APB4DIV",
            .Nodetype = APB4DIVval,
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const APB4Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .Nodetype = APB4Outputval,
            .parents = &[_]*const ClockNode{&APB4DIV},
        };
        const APBDBGDIVval = ClockNodeTypes{ .div = .{ .value = config.APBDBGDIV.get() } };
        const APBDBGDIV: ClockNode = .{
            .name = "APBDBGDIV",
            .Nodetype = APBDBGDIVval,
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const APBDBGOutputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const APBDBGOutput: ClockNode = .{
            .name = "APBDBGOutput",
            .Nodetype = APBDBGOutputval,
            .parents = &[_]*const ClockNode{&APBDBGDIV},
        };
        const APB1DIVval = ClockNodeTypes{ .div = .{ .value = config.APB1DIV.get() } };
        const APB1DIV: ClockNode = .{
            .name = "APB1DIV",
            .Nodetype = APB1DIVval,
            .parents = &[_]*const ClockNode{&MCUDIV},
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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const Tim1Output: ClockNode = .{
            .name = "Tim1Output",
            .Nodetype = Tim1Outputval,
            .parents = &[_]*const ClockNode{&Tim1Mul},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
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
            .parents = &[_]*const ClockNode{&MCUDIV},
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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const Tim2Output: ClockNode = .{
            .name = "Tim2Output",
            .Nodetype = Tim2Outputval,
            .parents = &[_]*const ClockNode{&Tim2Mul},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2DIV},
        };
        const ADC12Multval = ClockNodeTypes{ .multi = @intFromEnum(config.ADC12Mult) };
        const ADC12Mult: ClockNode = .{
            .name = "ADC12Mult",
            .Nodetype = ADC12Multval,

            .parents = &[_]*const ClockNode{
                &XBAR46Output,
                &XBAR0Output,
            },
        };
        const ADC12outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const ADC12output: ClockNode = .{
            .name = "ADC12output",
            .Nodetype = ADC12outputval,
            .parents = &[_]*const ClockNode{&ADC12Mult},
        };
        const ADC3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.ADC3Mult) };
        const ADC3Mult: ClockNode = .{
            .name = "ADC3Mult",
            .Nodetype = ADC3Multval,

            .parents = &[_]*const ClockNode{
                &XBAR47Output,
                &XBAR0Output,
                &XBAR46Output,
            },
        };
        const ADC3outputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const ADC3output: ClockNode = .{
            .name = "ADC3output",
            .Nodetype = ADC3outputval,
            .parents = &[_]*const ClockNode{&ADC3Mult},
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
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
        return .{
            .HSIRC = HSIRC,
            .HSEOSC = HSEOSC,
            .HSEDIV2 = HSEDIV2,
            .SPDIF = SPDIF,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .MSIRC = MSIRC,
            .I2S_CKIN = I2S_CKIN,
            .XBAR0 = XBAR0,
            .XBAR0Prediv = XBAR0Prediv,
            .XBAR0Findiv = XBAR0Findiv,
            .XBAR0Output = XBAR0Output,
            .XBAR1 = XBAR1,
            .XBAR1Prediv = XBAR1Prediv,
            .XBAR1Findiv = XBAR1Findiv,
            .XBAR1Output = XBAR1Output,
            .XBAR2 = XBAR2,
            .XBAR2Prediv = XBAR2Prediv,
            .XBAR2Findiv = XBAR2Findiv,
            .XBAR2Output = XBAR2Output,
            .XBAR3 = XBAR3,
            .XBAR3Prediv = XBAR3Prediv,
            .XBAR3Findiv = XBAR3Findiv,
            .XBAR3Output = XBAR3Output,
            .XBAR4 = XBAR4,
            .XBAR4Prediv = XBAR4Prediv,
            .XBAR4Findiv = XBAR4Findiv,
            .XBAR4Output = XBAR4Output,
            .XBAR5 = XBAR5,
            .XBAR5Prediv = XBAR5Prediv,
            .XBAR5Findiv = XBAR5Findiv,
            .XBAR5Output = XBAR5Output,
            .XBAR6 = XBAR6,
            .XBAR6Prediv = XBAR6Prediv,
            .XBAR6Findiv = XBAR6Findiv,
            .XBAR6Output = XBAR6Output,
            .XBAR7 = XBAR7,
            .XBAR7Prediv = XBAR7Prediv,
            .XBAR7Findiv = XBAR7Findiv,
            .XBAR7Output = XBAR7Output,
            .XBAR8 = XBAR8,
            .XBAR8Prediv = XBAR8Prediv,
            .XBAR8Findiv = XBAR8Findiv,
            .XBAR8Output = XBAR8Output,
            .XBAR9 = XBAR9,
            .XBAR9Prediv = XBAR9Prediv,
            .XBAR9Findiv = XBAR9Findiv,
            .XBAR9Output = XBAR9Output,
            .XBAR10 = XBAR10,
            .XBAR10Prediv = XBAR10Prediv,
            .XBAR10Findiv = XBAR10Findiv,
            .XBAR10Output = XBAR10Output,
            .XBAR11 = XBAR11,
            .XBAR11Prediv = XBAR11Prediv,
            .XBAR11Findiv = XBAR11Findiv,
            .XBAR11Output = XBAR11Output,
            .XBAR12 = XBAR12,
            .XBAR12Prediv = XBAR12Prediv,
            .XBAR12Findiv = XBAR12Findiv,
            .XBAR12Output = XBAR12Output,
            .XBAR13 = XBAR13,
            .XBAR13Prediv = XBAR13Prediv,
            .XBAR13Findiv = XBAR13Findiv,
            .XBAR13Output = XBAR13Output,
            .XBAR14 = XBAR14,
            .XBAR14Prediv = XBAR14Prediv,
            .XBAR14Findiv = XBAR14Findiv,
            .XBAR14Output = XBAR14Output,
            .XBAR15 = XBAR15,
            .XBAR15Prediv = XBAR15Prediv,
            .XBAR15Findiv = XBAR15Findiv,
            .XBAR15Output = XBAR15Output,
            .XBAR16 = XBAR16,
            .XBAR16Prediv = XBAR16Prediv,
            .XBAR16Findiv = XBAR16Findiv,
            .XBAR16Output = XBAR16Output,
            .XBAR17 = XBAR17,
            .XBAR17Prediv = XBAR17Prediv,
            .XBAR17Findiv = XBAR17Findiv,
            .XBAR17Output = XBAR17Output,
            .XBAR18 = XBAR18,
            .XBAR18Prediv = XBAR18Prediv,
            .XBAR18Findiv = XBAR18Findiv,
            .XBAR18Output = XBAR18Output,
            .XBAR19 = XBAR19,
            .XBAR19Prediv = XBAR19Prediv,
            .XBAR19Findiv = XBAR19Findiv,
            .XBAR19Output = XBAR19Output,
            .XBAR20 = XBAR20,
            .XBAR20Prediv = XBAR20Prediv,
            .XBAR20Findiv = XBAR20Findiv,
            .XBAR20Output = XBAR20Output,
            .XBAR21 = XBAR21,
            .XBAR21Prediv = XBAR21Prediv,
            .XBAR21Findiv = XBAR21Findiv,
            .XBAR21Output = XBAR21Output,
            .XBAR22 = XBAR22,
            .XBAR22Prediv = XBAR22Prediv,
            .XBAR22Findiv = XBAR22Findiv,
            .XBAR22Output = XBAR22Output,
            .XBAR23 = XBAR23,
            .XBAR23Prediv = XBAR23Prediv,
            .XBAR23Findiv = XBAR23Findiv,
            .XBAR23Output = XBAR23Output,
            .XBAR24 = XBAR24,
            .XBAR24Prediv = XBAR24Prediv,
            .XBAR24Findiv = XBAR24Findiv,
            .XBAR24Output = XBAR24Output,
            .XBAR25 = XBAR25,
            .XBAR25Prediv = XBAR25Prediv,
            .XBAR25Findiv = XBAR25Findiv,
            .XBAR25Output = XBAR25Output,
            .XBAR26 = XBAR26,
            .XBAR26Prediv = XBAR26Prediv,
            .XBAR26Findiv = XBAR26Findiv,
            .XBAR26Output = XBAR26Output,
            .XBAR27 = XBAR27,
            .XBAR27Prediv = XBAR27Prediv,
            .XBAR27Findiv = XBAR27Findiv,
            .XBAR27Output = XBAR27Output,
            .XBAR28 = XBAR28,
            .XBAR28Prediv = XBAR28Prediv,
            .XBAR28Findiv = XBAR28Findiv,
            .XBAR28Output = XBAR28Output,
            .XBAR29 = XBAR29,
            .XBAR29Prediv = XBAR29Prediv,
            .XBAR29Findiv = XBAR29Findiv,
            .XBAR29Output = XBAR29Output,
            .XBAR30 = XBAR30,
            .XBAR30Prediv = XBAR30Prediv,
            .XBAR30Findiv = XBAR30Findiv,
            .XBAR30Output = XBAR30Output,
            .XBAR31 = XBAR31,
            .XBAR31Prediv = XBAR31Prediv,
            .XBAR31Findiv = XBAR31Findiv,
            .XBAR31Output = XBAR31Output,
            .XBAR32 = XBAR32,
            .XBAR32Prediv = XBAR32Prediv,
            .XBAR32Findiv = XBAR32Findiv,
            .XBAR32Output = XBAR32Output,
            .XBAR33 = XBAR33,
            .XBAR33Prediv = XBAR33Prediv,
            .XBAR33Findiv = XBAR33Findiv,
            .XBAR33Output = XBAR33Output,
            .XBAR34 = XBAR34,
            .XBAR34Prediv = XBAR34Prediv,
            .XBAR34Findiv = XBAR34Findiv,
            .XBAR34Output = XBAR34Output,
            .XBAR35 = XBAR35,
            .XBAR35Prediv = XBAR35Prediv,
            .XBAR35Findiv = XBAR35Findiv,
            .XBAR35Output = XBAR35Output,
            .XBAR36 = XBAR36,
            .XBAR36Prediv = XBAR36Prediv,
            .XBAR36Findiv = XBAR36Findiv,
            .XBAR36Output = XBAR36Output,
            .XBAR37 = XBAR37,
            .XBAR37Prediv = XBAR37Prediv,
            .XBAR37Findiv = XBAR37Findiv,
            .XBAR37Output = XBAR37Output,
            .XBAR38 = XBAR38,
            .XBAR38Prediv = XBAR38Prediv,
            .XBAR38Findiv = XBAR38Findiv,
            .XBAR38Output = XBAR38Output,
            .XBAR39 = XBAR39,
            .XBAR39Prediv = XBAR39Prediv,
            .XBAR39Findiv = XBAR39Findiv,
            .XBAR39Output = XBAR39Output,
            .XBAR40 = XBAR40,
            .XBAR40Prediv = XBAR40Prediv,
            .XBAR40Findiv = XBAR40Findiv,
            .XBAR40Output = XBAR40Output,
            .XBAR41 = XBAR41,
            .XBAR41Prediv = XBAR41Prediv,
            .XBAR41Findiv = XBAR41Findiv,
            .XBAR41Output = XBAR41Output,
            .XBAR42 = XBAR42,
            .XBAR42Prediv = XBAR42Prediv,
            .XBAR42Findiv = XBAR42Findiv,
            .XBAR42Output = XBAR42Output,
            .XBAR43 = XBAR43,
            .XBAR43Prediv = XBAR43Prediv,
            .XBAR43Findiv = XBAR43Findiv,
            .XBAR43Output = XBAR43Output,
            .XBAR44 = XBAR44,
            .XBAR44Prediv = XBAR44Prediv,
            .XBAR44Findiv = XBAR44Findiv,
            .XBAR44Output = XBAR44Output,
            .XBAR45 = XBAR45,
            .XBAR45Prediv = XBAR45Prediv,
            .XBAR45Findiv = XBAR45Findiv,
            .XBAR45Output = XBAR45Output,
            .XBAR46 = XBAR46,
            .XBAR46Prediv = XBAR46Prediv,
            .XBAR46Findiv = XBAR46Findiv,
            .XBAR46Output = XBAR46Output,
            .XBAR47 = XBAR47,
            .XBAR47Prediv = XBAR47Prediv,
            .XBAR47Findiv = XBAR47Findiv,
            .XBAR47Output = XBAR47Output,
            .XBAR48 = XBAR48,
            .XBAR48Prediv = XBAR48Prediv,
            .XBAR48Findiv = XBAR48Findiv,
            .XBAR48Output = XBAR48Output,
            .XBAR49 = XBAR49,
            .XBAR49Prediv = XBAR49Prediv,
            .XBAR49Findiv = XBAR49Findiv,
            .XBAR49Output = XBAR49Output,
            .XBAR50 = XBAR50,
            .XBAR50Prediv = XBAR50Prediv,
            .XBAR50Findiv = XBAR50Findiv,
            .XBAR50Output = XBAR50Output,
            .XBAR51 = XBAR51,
            .XBAR51Prediv = XBAR51Prediv,
            .XBAR51Findiv = XBAR51Findiv,
            .XBAR51Output = XBAR51Output,
            .XBAR52 = XBAR52,
            .XBAR52Prediv = XBAR52Prediv,
            .XBAR52Findiv = XBAR52Findiv,
            .XBAR52Output = XBAR52Output,
            .XBAR53 = XBAR53,
            .XBAR53Prediv = XBAR53Prediv,
            .XBAR53Findiv = XBAR53Findiv,
            .XBAR53Output = XBAR53Output,
            .XBAR54 = XBAR54,
            .XBAR54Prediv = XBAR54Prediv,
            .XBAR54Findiv = XBAR54Findiv,
            .XBAR54Output = XBAR54Output,
            .XBAR55 = XBAR55,
            .XBAR55Prediv = XBAR55Prediv,
            .XBAR55Findiv = XBAR55Findiv,
            .XBAR55Output = XBAR55Output,
            .XBAR56 = XBAR56,
            .XBAR56Prediv = XBAR56Prediv,
            .XBAR56Findiv = XBAR56Findiv,
            .XBAR56Output = XBAR56Output,
            .XBAR57 = XBAR57,
            .XBAR57Prediv = XBAR57Prediv,
            .XBAR57Findiv = XBAR57Findiv,
            .XBAR57Output = XBAR57Output,
            .XBAR58 = XBAR58,
            .XBAR58Prediv = XBAR58Prediv,
            .XBAR58Findiv = XBAR58Findiv,
            .XBAR58Output = XBAR58Output,
            .XBAR59 = XBAR59,
            .XBAR59Prediv = XBAR59Prediv,
            .XBAR59Findiv = XBAR59Findiv,
            .XBAR59Output = XBAR59Output,
            .XBAR60 = XBAR60,
            .XBAR60Prediv = XBAR60Prediv,
            .XBAR60Findiv = XBAR60Findiv,
            .XBAR60Output = XBAR60Output,
            .XBAR61 = XBAR61,
            .XBAR61Prediv = XBAR61Prediv,
            .XBAR61Findiv = XBAR61Findiv,
            .XBAR61Output = XBAR61Output,
            .XBAR62 = XBAR62,
            .XBAR62Prediv = XBAR62Prediv,
            .XBAR62Findiv = XBAR62Findiv,
            .XBAR62Output = XBAR62Output,
            .XBAR63 = XBAR63,
            .XBAR63Prediv = XBAR63Prediv,
            .XBAR63Findiv = XBAR63Findiv,
            .XBAR63Output = XBAR63Output,
            .CKINTSEL0 = CKINTSEL0,
            .CKEXTSEL0 = CKEXTSEL0,
            .CKINTSEL1 = CKINTSEL1,
            .CKEXTSEL1 = CKEXTSEL1,
            .OBS0 = OBS0,
            .OBS0Output = OBS0Output,
            .OBS1 = OBS1,
            .OBS1Output = OBS1Output,
            .MCO1Mult = MCO1Mult,
            .MCO1Pin = MCO1Pin,
            .MCO2Mult = MCO2Mult,
            .MCO2Pin = MCO2Pin,
            .D3PER = D3PER,
            .D3PEROutput = D3PEROutput,
            .DTS = DTS,
            .DTSOutput = DTSOutput,
            .DSIPHY = DSIPHY,
            .DSIPHYOutput = DSIPHYOutput,
            .DSIBLANE = DSIBLANE,
            .DSIBLANEOutput = DSIBLANEOutput,
            .USB2PHY1 = USB2PHY1,
            .USB2PHY1Output = USB2PHY1Output,
            .USB2PHY2 = USB2PHY2,
            .USB2PHY2Output = USB2PHY2Output,
            .USB3PCIPHY = USB3PCIPHY,
            .USB3PCIPHYOutput = USB3PCIPHYOutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .MCUDIV = MCUDIV,
            .McuClockOutput = McuClockOutput,
            .APB3DIV = APB3DIV,
            .APB3Output = APB3Output,
            .APB4DIV = APB4DIV,
            .APB4Output = APB4Output,
            .APBDBGDIV = APBDBGDIV,
            .APBDBGOutput = APBDBGOutput,
            .APB1DIV = APB1DIV,
            .Tim1Mul = Tim1Mul,
            .Tim1Output = Tim1Output,
            .AHBOutput = AHBOutput,
            .APB1Output = APB1Output,
            .APB2DIV = APB2DIV,
            .Tim2Mul = Tim2Mul,
            .Tim2Output = Tim2Output,
            .APB2Output = APB2Output,
            .ADC12Mult = ADC12Mult,
            .ADC12output = ADC12output,
            .ADC3Mult = ADC3Mult,
            .ADC3output = ADC3output,
            .PLL1Source = PLL1Source,
            .FREFDIV1 = FREFDIV1,
            .PLL2Source = PLL2Source,
            .FREFDIV2 = FREFDIV2,
            .PLL3Source = PLL3Source,
            .FREFDIV3 = FREFDIV3,
            .PLL4Source = PLL4Source,
            .FREFDIV4 = FREFDIV4,
            .FBDIV1 = FBDIV1,
            .POSTDIV1_1 = POSTDIV1_1,
            .POSTDIV2_1 = POSTDIV2_1,
            .FOUTPOSTDIV1 = FOUTPOSTDIV1,
            .PLL1Div42 = PLL1Div42,
            .FBDIV2 = FBDIV2,
            .PLL2FRACV = PLL2FRACV,
            .POSTDIV1_2 = POSTDIV1_2,
            .POSTDIV2_2 = POSTDIV2_2,
            .FOUTPOSTDIV2 = FOUTPOSTDIV2,
            .PLL2Div4 = PLL2Div4,
            .FBDIV3 = FBDIV3,
            .PLL3FRACV = PLL3FRACV,
            .POSTDIV1_3 = POSTDIV1_3,
            .POSTDIV2_3 = POSTDIV2_3,
            .FOUTPOSTDIV3 = FOUTPOSTDIV3,
            .PLL3Div2 = PLL3Div2,
            .FBDIV4 = FBDIV4,
            .PLL4FRACV = PLL4FRACV,
            .POSTDIV1_4 = POSTDIV1_4,
            .POSTDIV2_4 = POSTDIV2_4,
            .FOUTPOSTDIV4 = FOUTPOSTDIV4,
            .PLL5Source = PLL5Source,
            .FREFDIV5 = FREFDIV5,
            .FBDIV5 = FBDIV5,
            .PLL5FRACV = PLL5FRACV,
            .POSTDIV1_5 = POSTDIV1_5,
            .POSTDIV2_5 = POSTDIV2_5,
            .FOUTPOSTDIV5 = FOUTPOSTDIV5,
            .PLL6Source = PLL6Source,
            .FREFDIV6 = FREFDIV6,
            .FBDIV6 = FBDIV6,
            .PLL6FRACV = PLL6FRACV,
            .POSTDIV1_6 = POSTDIV1_6,
            .POSTDIV2_6 = POSTDIV2_6,
            .FOUTPOSTDIV6 = FOUTPOSTDIV6,
            .PLL7Source = PLL7Source,
            .FREFDIV7 = FREFDIV7,
            .FBDIV7 = FBDIV7,
            .PLL7FRACV = PLL7FRACV,
            .POSTDIV1_7 = POSTDIV1_7,
            .POSTDIV2_7 = POSTDIV2_7,
            .FOUTPOSTDIV7 = FOUTPOSTDIV7,
            .PLL8Source = PLL8Source,
            .FREFDIV8 = FREFDIV8,
            .FBDIV8 = FBDIV8,
            .PLL8FRACV = PLL8FRACV,
            .POSTDIV1_8 = POSTDIV1_8,
            .POSTDIV2_8 = POSTDIV2_8,
            .FOUTPOSTDIV8 = FOUTPOSTDIV8,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .RCC_TIM_G1_PRescaler_Selection = RCC_TIM_G1_PRescaler_Selectionval,
            .RCC_TIM_G2_PRescaler_Selection = RCC_TIM_G2_PRescaler_Selectionval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.XBAR0Output.get_comptime();
        _ = self.XBAR1Output.get_comptime();
        _ = self.XBAR2Output.get_comptime();
        _ = self.XBAR3Output.get_comptime();
        _ = self.XBAR4Output.get_comptime();
        _ = self.XBAR5Output.get_comptime();
        _ = self.XBAR6Output.get_comptime();
        _ = self.XBAR7Output.get_comptime();
        _ = self.XBAR8Output.get_comptime();
        _ = self.XBAR9Output.get_comptime();
        _ = self.XBAR10Output.get_comptime();
        _ = self.XBAR11Output.get_comptime();
        _ = self.XBAR12Output.get_comptime();
        _ = self.XBAR13Output.get_comptime();
        _ = self.XBAR14Output.get_comptime();
        _ = self.XBAR15Output.get_comptime();
        _ = self.XBAR16Output.get_comptime();
        _ = self.XBAR17Output.get_comptime();
        _ = self.XBAR18Output.get_comptime();
        _ = self.XBAR19Output.get_comptime();
        _ = self.XBAR20Output.get_comptime();
        _ = self.XBAR21Output.get_comptime();
        _ = self.XBAR22Output.get_comptime();
        _ = self.XBAR23Output.get_comptime();
        _ = self.XBAR24Output.get_comptime();
        _ = self.XBAR25Output.get_comptime();
        _ = self.XBAR26Output.get_comptime();
        _ = self.XBAR27Output.get_comptime();
        _ = self.XBAR28Output.get_comptime();
        _ = self.XBAR29Output.get_comptime();
        _ = self.XBAR30Output.get_comptime();
        _ = self.XBAR31Output.get_comptime();
        _ = self.XBAR32Output.get_comptime();
        _ = self.XBAR33Output.get_comptime();
        _ = self.XBAR34Output.get_comptime();
        _ = self.XBAR35Output.get_comptime();
        _ = self.XBAR36Output.get_comptime();
        _ = self.XBAR37Output.get_comptime();
        _ = self.XBAR38Output.get_comptime();
        _ = self.XBAR39Output.get_comptime();
        _ = self.XBAR40Output.get_comptime();
        _ = self.XBAR41Output.get_comptime();
        _ = self.XBAR42Output.get_comptime();
        _ = self.XBAR43Output.get_comptime();
        _ = self.XBAR44Output.get_comptime();
        _ = self.XBAR45Output.get_comptime();
        _ = self.XBAR46Output.get_comptime();
        _ = self.XBAR47Output.get_comptime();
        _ = self.XBAR48Output.get_comptime();
        _ = self.XBAR49Output.get_comptime();
        _ = self.XBAR50Output.get_comptime();
        _ = self.XBAR51Output.get_comptime();
        _ = self.XBAR52Output.get_comptime();
        _ = self.XBAR53Output.get_comptime();
        _ = self.XBAR54Output.get_comptime();
        _ = self.XBAR55Output.get_comptime();
        _ = self.XBAR56Output.get_comptime();
        _ = self.XBAR57Output.get_comptime();
        _ = self.XBAR58Output.get_comptime();
        _ = self.XBAR59Output.get_comptime();
        _ = self.XBAR60Output.get_comptime();
        _ = self.XBAR61Output.get_comptime();
        _ = self.XBAR62Output.get_comptime();
        _ = self.XBAR63Output.get_comptime();
        _ = self.DSIPHYOutput.get_comptime();
        _ = self.DSIBLANEOutput.get_comptime();
        _ = self.USB2PHY1Output.get_comptime();
        _ = self.USB2PHY2Output.get_comptime();
        _ = self.USB3PCIPHYOutput.get_comptime();
        _ = self.SysCLKOutput.get_comptime();
        _ = self.McuClockOutput.get_comptime();
        _ = self.APB3Output.get_comptime();
        _ = self.APB4Output.get_comptime();
        _ = self.APBDBGOutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.ADC12output.get_comptime();
        _ = self.ADC3output.get_comptime();
        _ = self.FOUTPOSTDIV1.get_comptime();
        _ = self.FOUTPOSTDIV2.get_comptime();
        _ = self.FOUTPOSTDIV3.get_comptime();
        _ = self.FOUTPOSTDIV4.get_comptime();
        _ = self.FOUTPOSTDIV5.get_comptime();
        _ = self.FOUTPOSTDIV6.get_comptime();
        _ = self.FOUTPOSTDIV7.get_comptime();
        _ = self.FOUTPOSTDIV8.get_comptime();
    }
};
