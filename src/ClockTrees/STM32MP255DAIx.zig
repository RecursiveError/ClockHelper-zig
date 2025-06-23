const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const HSE_Div2Conf = enum {
    @"2",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
        };
    }
};
pub const SPDIFFreq_ValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const MSIClockRangeConf = enum {
    RCC_MSI_16MHZ,
    RCC_MSI_4MHZ,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSI_16MHZ => 16,
            .RCC_MSI_4MHZ => 4,
        };
    }
};
pub const XBAR0CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR0PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR0FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR1CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR1PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR1FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR2CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR2PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR2FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR3CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR3PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR3FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR4CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR4PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR4FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR5CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR5PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR5FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR6CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR6PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR6FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR7CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR7PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR7FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR8CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR8PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR8FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR9CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR9PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR9FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR10CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR10PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR10FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR11CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR11PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR11FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR12CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR12PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR12FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR13CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR13PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR13FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR14CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR14PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR14FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR15CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR15PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR15FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR16CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR16PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR16FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR17CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR17PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR17FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR18CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR18PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR18FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR19CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR19PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR19FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR20CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR20PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR20FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR21CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR21PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR21FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR22CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR22PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR22FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR23CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR23PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR23FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR24CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR24PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR24FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR25CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR25PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR25FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR26CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR26PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR26FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR27CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR27PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR27FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR28CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR28PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR28FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR29CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR29PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR29FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR30CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR30PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR30FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR31CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR31PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR31FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR32CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR32PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR32FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR33CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR33PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR33FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR34CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR34PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR34FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR35CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR35PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR35FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR36CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR36PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR36FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR37CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_I2S,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR37PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR37FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR38CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR38PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR38FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR39CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR39PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR39FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR40CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR40PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR40FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR41CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR41PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR41FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR42CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR42PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR42FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR43CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR43PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR43FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR44CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR44PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR44FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR45CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR45PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR45FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR46CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR46PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR46FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR47CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR47PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR47FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR48CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR48PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR48FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR49CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR49PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR49FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR50CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR50PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR50FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR51CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR51PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR51FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR52CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR52PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR52FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR53CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR53PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR53FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR54CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR54PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR54FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR55CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR55PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR55FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR56CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR56PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR56FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR57CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR57PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR57FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR58CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR58PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR58FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR59CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR59PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR59FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR60CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR60PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR60FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR61CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR61PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR61FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR62CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR62PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR62FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const XBAR63CLKSourceConf = enum {
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XBAR63PredivConf = enum {
    @"1",
    @"2",
    @"4",
    @"1024",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
            .@"1024" => 1024,
            .@"4" => 4,
        };
    }
};
pub const XBAR63FindivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const CKINTSELCLKSourceConf = enum {
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    XBAR_SRC_PLL4_REF,
    XBAR_SRC_PLL5_REF,
    XBAR_SRC_PLL6_REF,
    XBAR_SRC_PLL7_REF,
    XBAR_SRC_PLL8_REF,
    XBAR_SRC_PLL1_REF,
    XBAR_SRC_PLL2_REF,
    XBAR_SRC_PLL3_REF,
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,
    XBAR_SRC_ROOT0,
    XBAR_SRC_ROOT1,
    XBAR_SRC_ROOT2,
    XBAR_SRC_ROOT3,
    XBAR_SRC_ROOT4,
    XBAR_SRC_ROOT5,
    XBAR_SRC_ROOT6,
    XBAR_SRC_ROOT7,
    XBAR_SRC_ROOT8,
    XBAR_SRC_ROOT9,
    XBAR_SRC_ROOT10,
    XBAR_SRC_ROOT11,
    XBAR_SRC_ROOT12,
    XBAR_SRC_ROOT13,
    XBAR_SRC_ROOT14,
    XBAR_SRC_ROOT15,
    XBAR_SRC_ROOT16,
    XBAR_SRC_ROOT17,
    XBAR_SRC_ROOT18,
    XBAR_SRC_ROOT19,
    XBAR_SRC_ROOT20,
    XBAR_SRC_ROOT21,
    XBAR_SRC_ROOT22,
    XBAR_SRC_ROOT23,
    XBAR_SRC_ROOT24,
    XBAR_SRC_ROOT25,
    XBAR_SRC_ROOT26,
    XBAR_SRC_ROOT27,
    XBAR_SRC_ROOT28,
    XBAR_SRC_ROOT29,
    XBAR_SRC_ROOT30,
    XBAR_SRC_ROOT31,
    XBAR_SRC_ROOT32,
    XBAR_SRC_ROOT33,
    XBAR_SRC_ROOT34,
    XBAR_SRC_ROOT35,
    XBAR_SRC_ROOT36,
    XBAR_SRC_ROOT37,
    XBAR_SRC_ROOT38,
    XBAR_SRC_ROOT39,
    XBAR_SRC_ROOT40,
    XBAR_SRC_ROOT41,
    XBAR_SRC_ROOT42,
    XBAR_SRC_ROOT43,
    XBAR_SRC_ROOT44,
    XBAR_SRC_ROOT45,
    XBAR_SRC_ROOT46,
    XBAR_SRC_ROOT47,
    XBAR_SRC_ROOT48,
    XBAR_SRC_ROOT49,
    XBAR_SRC_ROOT50,
    XBAR_SRC_ROOT51,
    XBAR_SRC_ROOT52,
    XBAR_SRC_ROOT53,
    XBAR_SRC_ROOT54,
    XBAR_SRC_ROOT55,
    XBAR_SRC_ROOT56,
    XBAR_SRC_ROOT57,
    XBAR_SRC_ROOT58,
    XBAR_SRC_ROOT59,
    XBAR_SRC_ROOT60,
    XBAR_SRC_ROOT61,
    XBAR_SRC_ROOT62,
    XBAR_SRC_ROOT63,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CKEXTSELCLKSourceConf = enum {
    XBAR_SRC_PLL1_DIV42,
    XBAR_SRC_PLL2_DIV4,
    XBAR_SRC_PLL3_DIV2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CKINTSELCLKSource1Conf = enum {
    RCC_XBAR_CLKSRC_HSI,
    RCC_XBAR_CLKSRC_HSE,
    RCC_XBAR_CLKSRC_MSI,
    XBAR_SRC_PLL4_REF,
    XBAR_SRC_PLL5_REF,
    XBAR_SRC_PLL6_REF,
    XBAR_SRC_PLL7_REF,
    XBAR_SRC_PLL8_REF,
    XBAR_SRC_PLL1_REF,
    XBAR_SRC_PLL2_REF,
    XBAR_SRC_PLL3_REF,
    RCC_XBAR_CLKSRC_PLL4,
    RCC_XBAR_CLKSRC_PLL5,
    RCC_XBAR_CLKSRC_PLL6,
    RCC_XBAR_CLKSRC_PLL7,
    RCC_XBAR_CLKSRC_PLL8,
    RCC_XBAR_CLKSRC_SPDIF,
    RCC_XBAR_CLKSRC_I2S,
    RCC_XBAR_CLKSRC_LSI,
    RCC_XBAR_CLKSRC_LSE,
    XBAR_SRC_ROOT0,
    XBAR_SRC_ROOT1,
    XBAR_SRC_ROOT2,
    XBAR_SRC_ROOT3,
    XBAR_SRC_ROOT4,
    XBAR_SRC_ROOT5,
    XBAR_SRC_ROOT6,
    XBAR_SRC_ROOT7,
    XBAR_SRC_ROOT8,
    XBAR_SRC_ROOT9,
    XBAR_SRC_ROOT10,
    XBAR_SRC_ROOT11,
    XBAR_SRC_ROOT12,
    XBAR_SRC_ROOT13,
    XBAR_SRC_ROOT14,
    XBAR_SRC_ROOT15,
    XBAR_SRC_ROOT16,
    XBAR_SRC_ROOT17,
    XBAR_SRC_ROOT18,
    XBAR_SRC_ROOT19,
    XBAR_SRC_ROOT20,
    XBAR_SRC_ROOT21,
    XBAR_SRC_ROOT22,
    XBAR_SRC_ROOT23,
    XBAR_SRC_ROOT24,
    XBAR_SRC_ROOT25,
    XBAR_SRC_ROOT26,
    XBAR_SRC_ROOT27,
    XBAR_SRC_ROOT28,
    XBAR_SRC_ROOT29,
    XBAR_SRC_ROOT30,
    XBAR_SRC_ROOT31,
    XBAR_SRC_ROOT32,
    XBAR_SRC_ROOT33,
    XBAR_SRC_ROOT34,
    XBAR_SRC_ROOT35,
    XBAR_SRC_ROOT36,
    XBAR_SRC_ROOT37,
    XBAR_SRC_ROOT38,
    XBAR_SRC_ROOT39,
    XBAR_SRC_ROOT40,
    XBAR_SRC_ROOT41,
    XBAR_SRC_ROOT42,
    XBAR_SRC_ROOT43,
    XBAR_SRC_ROOT44,
    XBAR_SRC_ROOT45,
    XBAR_SRC_ROOT46,
    XBAR_SRC_ROOT47,
    XBAR_SRC_ROOT48,
    XBAR_SRC_ROOT49,
    XBAR_SRC_ROOT50,
    XBAR_SRC_ROOT51,
    XBAR_SRC_ROOT52,
    XBAR_SRC_ROOT53,
    XBAR_SRC_ROOT54,
    XBAR_SRC_ROOT55,
    XBAR_SRC_ROOT56,
    XBAR_SRC_ROOT57,
    XBAR_SRC_ROOT58,
    XBAR_SRC_ROOT59,
    XBAR_SRC_ROOT60,
    XBAR_SRC_ROOT61,
    XBAR_SRC_ROOT62,
    XBAR_SRC_ROOT63,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CKEXTSELCLKSource1Conf = enum {
    XBAR_SRC_PLL1_DIV42,
    XBAR_SRC_PLL2_DIV4,
    XBAR_SRC_PLL3_DIV2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OBS0SourceConf = enum {
    RCC_OBS0SOURCE_CKINTSEL,
    RCC_OBS0SOURCE_CKEXTSEL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OBS1SourceConf = enum {
    RCC_OBS1SOURCE_CKINTSEL,
    RCC_OBS1SOURCE_CKEXTSEL,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO1SourceConf = enum {
    MUX_MCO1_FLEX61,
    MUX_MCO1_OBSER0,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCO2SourceConf = enum {
    MUX_MCO2_FLEX62,
    MUX_MCO2_OBSER1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const D3PERCLKSourceConf = enum {
    MUX_D3PER_MSI,
    MUX_D3PER_LSI,
    MUX_D3PER_LSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DTSCLKSourceConf = enum {
    MUX_DTS_MSI,
    MUX_DTS_HSI,
    MUX_DTS_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DSIPHYCLKSourceConf = enum {
    MUX_DSIPHY_FLEX28,
    MUX_DSIPHY_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DSIBLANECLKSourceConf = enum {
    MUX_DSIBLANE_DSIPHY,
    MUX_DSIBLANE_FLEX27,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USB2PHY1CLKSourceConf = enum {
    MUX_USB2PHY1_FLEX57,
    MUX_USB2PHY1_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USB2PHY2CLKSourceConf = enum {
    MUX_USB2PHY2_FLEX58,
    MUX_USB2PHY2_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USB3PCIPHYCLKSourceConf = enum {
    MUX_USB3PCIEPHY_FLEX34,
    MUX_USB3PCIEPHY_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const MCUCLKSourceConf = enum {
    RCC_MCUSSOURCE_FLEX0,
    RCC_MCUSSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const MCU_DivConf = enum {
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
            .RCC_APB3_DIV4 => 4,
            .RCC_APB3_DIV8 => 8,
            .RCC_APB3_DIV16 => 16,
            .RCC_APB3_DIV2 => 2,
            .RCC_APB3_DIV1 => 1,
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
            .RCC_APB4_DIV16 => 16,
            .RCC_APB4_DIV2 => 2,
            .RCC_APB4_DIV1 => 1,
            .RCC_APB4_DIV8 => 8,
            .RCC_APB4_DIV4 => 4,
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
            .RCC_APBDBG_DIV2 => 2,
            .RCC_APBDBG_DIV8 => 8,
            .RCC_APBDBG_DIV4 => 4,
            .RCC_APBDBG_DIV1 => 1,
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
            .RCC_APB1_DIV4 => 4,
            .RCC_APB1_DIV8 => 8,
            .RCC_APB1_DIV16 => 16,
            .RCC_APB1_DIV1 => 1,
            .RCC_APB1_DIV2 => 2,
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
            .RCC_APB2_DIV8 => 8,
            .RCC_APB2_DIV4 => 4,
            .RCC_APB2_DIV16 => 16,
        };
    }
};
pub const ADC12CLockSelectionConf = enum {
    MUX_ADC12_FLEX46,
    MUX_ADC12_LSMCU,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADC3CLockSelectionConf = enum {
    MUX_ADC3_FLEX47,
    MUX_ADC3_LSMCU,
    MUX_ADC3_FLEX46,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LVDSCLockSelectionConf = enum {
    MUX_LVDSPHY_FLEX32,
    MUX_LVDSPHY_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PLL1SourceConf = enum {
    RCC_PLL1SOURCE_HSI,
    RCC_PLL1SOURCE_HSE,
    RCC_PLL1SOURCE_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2SourceConf = enum {
    RCC_PLL2SOURCE_HSI,
    RCC_PLL2SOURCE_HSE,
    RCC_PLL2SOURCE_MSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3SourceConf = enum {
    RCC_PLL3SOURCE_HSI,
    RCC_PLL3SOURCE_MSI,
    RCC_PLL3SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL4SourceConf = enum {
    RCC_PLL4SOURCE_HSI,
    RCC_PLL4SOURCE_MSI,
    RCC_PLL4SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_1Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL2FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_2Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL3FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_3Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL4FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_4Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL5SourceConf = enum {
    RCC_PLL5SOURCE_HSI,
    RCC_PLL5SOURCE_MSI,
    RCC_PLL5SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV5Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV5Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL5FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_5Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_5Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL6SourceConf = enum {
    RCC_PLL6SOURCE_HSI,
    RCC_PLL6SOURCE_MSI,
    RCC_PLL6SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV6Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV6Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL6FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_6Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_6Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL7SourceConf = enum {
    RCC_PLL7SOURCE_HSI,
    RCC_PLL7SOURCE_MSI,
    RCC_PLL7SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV7Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV7Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL7FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_7Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_7Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL8SourceConf = enum {
    RCC_PLL8SOURCE_HSI,
    RCC_PLL8SOURCE_MSI,
    RCC_PLL8SOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FREFDIV8Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const FBDIV8Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const PLL8FRACVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV1_8Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const POSTDIV2_8Conf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const RCC_RTC_Clock_Source_FROM_HSEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const RTCCLockSelectionVirtualConf = enum {
    RCC_RTCCLKSOURCE_HSE_DIV,
    RCC_RTCCLKSOURCE_LSE,
    RCC_RTCCLKSOURCE_LSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const HSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const LSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
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
    RCC_LSEDRIVE_LOW,
    RCC_LSEDRIVE_MEDIUMLOW,
    RCC_LSEDRIVE_MEDIUMHIGH,
    RCC_LSEDRIVE_HIGH,
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_LSEDRIVE_LOW => 0,
            .RCC_LSEDRIVE_MEDIUMHIGH => 2,
            .null => 0,
            .RCC_LSEDRIVE_MEDIUMLOW => 1,
            .RCC_LSEDRIVE_HIGH => 3,
        };
    }
};
pub const Config = struct {
    HSEOSC: ?HSE_VALUEConf = null,
    HSEDIV2: ?HSE_Div2Conf = null,
    SPDIF: ?SPDIFFreq_ValueConf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    MSIRC: ?MSIClockRangeConf = null,
    XBAR0: ?XBAR0CLKSourceConf = null,
    XBAR0Prediv: ?XBAR0PredivConf = null,
    XBAR0Findiv: ?XBAR0FindivConf = null,
    XBAR1: ?XBAR1CLKSourceConf = null,
    XBAR1Prediv: ?XBAR1PredivConf = null,
    XBAR1Findiv: ?XBAR1FindivConf = null,
    XBAR2: ?XBAR2CLKSourceConf = null,
    XBAR2Prediv: ?XBAR2PredivConf = null,
    XBAR2Findiv: ?XBAR2FindivConf = null,
    XBAR3: ?XBAR3CLKSourceConf = null,
    XBAR3Prediv: ?XBAR3PredivConf = null,
    XBAR3Findiv: ?XBAR3FindivConf = null,
    XBAR4: ?XBAR4CLKSourceConf = null,
    XBAR4Prediv: ?XBAR4PredivConf = null,
    XBAR4Findiv: ?XBAR4FindivConf = null,
    XBAR5: ?XBAR5CLKSourceConf = null,
    XBAR5Prediv: ?XBAR5PredivConf = null,
    XBAR5Findiv: ?XBAR5FindivConf = null,
    XBAR6: ?XBAR6CLKSourceConf = null,
    XBAR6Prediv: ?XBAR6PredivConf = null,
    XBAR6Findiv: ?XBAR6FindivConf = null,
    XBAR7: ?XBAR7CLKSourceConf = null,
    XBAR7Prediv: ?XBAR7PredivConf = null,
    XBAR7Findiv: ?XBAR7FindivConf = null,
    XBAR8: ?XBAR8CLKSourceConf = null,
    XBAR8Prediv: ?XBAR8PredivConf = null,
    XBAR8Findiv: ?XBAR8FindivConf = null,
    XBAR9: ?XBAR9CLKSourceConf = null,
    XBAR9Prediv: ?XBAR9PredivConf = null,
    XBAR9Findiv: ?XBAR9FindivConf = null,
    XBAR10: ?XBAR10CLKSourceConf = null,
    XBAR10Prediv: ?XBAR10PredivConf = null,
    XBAR10Findiv: ?XBAR10FindivConf = null,
    XBAR11: ?XBAR11CLKSourceConf = null,
    XBAR11Prediv: ?XBAR11PredivConf = null,
    XBAR11Findiv: ?XBAR11FindivConf = null,
    XBAR12: ?XBAR12CLKSourceConf = null,
    XBAR12Prediv: ?XBAR12PredivConf = null,
    XBAR12Findiv: ?XBAR12FindivConf = null,
    XBAR13: ?XBAR13CLKSourceConf = null,
    XBAR13Prediv: ?XBAR13PredivConf = null,
    XBAR13Findiv: ?XBAR13FindivConf = null,
    XBAR14: ?XBAR14CLKSourceConf = null,
    XBAR14Prediv: ?XBAR14PredivConf = null,
    XBAR14Findiv: ?XBAR14FindivConf = null,
    XBAR15: ?XBAR15CLKSourceConf = null,
    XBAR15Prediv: ?XBAR15PredivConf = null,
    XBAR15Findiv: ?XBAR15FindivConf = null,
    XBAR16: ?XBAR16CLKSourceConf = null,
    XBAR16Prediv: ?XBAR16PredivConf = null,
    XBAR16Findiv: ?XBAR16FindivConf = null,
    XBAR17: ?XBAR17CLKSourceConf = null,
    XBAR17Prediv: ?XBAR17PredivConf = null,
    XBAR17Findiv: ?XBAR17FindivConf = null,
    XBAR18: ?XBAR18CLKSourceConf = null,
    XBAR18Prediv: ?XBAR18PredivConf = null,
    XBAR18Findiv: ?XBAR18FindivConf = null,
    XBAR19: ?XBAR19CLKSourceConf = null,
    XBAR19Prediv: ?XBAR19PredivConf = null,
    XBAR19Findiv: ?XBAR19FindivConf = null,
    XBAR20: ?XBAR20CLKSourceConf = null,
    XBAR20Prediv: ?XBAR20PredivConf = null,
    XBAR20Findiv: ?XBAR20FindivConf = null,
    XBAR21: ?XBAR21CLKSourceConf = null,
    XBAR21Prediv: ?XBAR21PredivConf = null,
    XBAR21Findiv: ?XBAR21FindivConf = null,
    XBAR22: ?XBAR22CLKSourceConf = null,
    XBAR22Prediv: ?XBAR22PredivConf = null,
    XBAR22Findiv: ?XBAR22FindivConf = null,
    XBAR23: ?XBAR23CLKSourceConf = null,
    XBAR23Prediv: ?XBAR23PredivConf = null,
    XBAR23Findiv: ?XBAR23FindivConf = null,
    XBAR24: ?XBAR24CLKSourceConf = null,
    XBAR24Prediv: ?XBAR24PredivConf = null,
    XBAR24Findiv: ?XBAR24FindivConf = null,
    XBAR25: ?XBAR25CLKSourceConf = null,
    XBAR25Prediv: ?XBAR25PredivConf = null,
    XBAR25Findiv: ?XBAR25FindivConf = null,
    XBAR26: ?XBAR26CLKSourceConf = null,
    XBAR26Prediv: ?XBAR26PredivConf = null,
    XBAR26Findiv: ?XBAR26FindivConf = null,
    XBAR27: ?XBAR27CLKSourceConf = null,
    XBAR27Prediv: ?XBAR27PredivConf = null,
    XBAR27Findiv: ?XBAR27FindivConf = null,
    XBAR28: ?XBAR28CLKSourceConf = null,
    XBAR28Prediv: ?XBAR28PredivConf = null,
    XBAR28Findiv: ?XBAR28FindivConf = null,
    XBAR29: ?XBAR29CLKSourceConf = null,
    XBAR29Prediv: ?XBAR29PredivConf = null,
    XBAR29Findiv: ?XBAR29FindivConf = null,
    XBAR30: ?XBAR30CLKSourceConf = null,
    XBAR30Prediv: ?XBAR30PredivConf = null,
    XBAR30Findiv: ?XBAR30FindivConf = null,
    XBAR31: ?XBAR31CLKSourceConf = null,
    XBAR31Prediv: ?XBAR31PredivConf = null,
    XBAR31Findiv: ?XBAR31FindivConf = null,
    XBAR32: ?XBAR32CLKSourceConf = null,
    XBAR32Prediv: ?XBAR32PredivConf = null,
    XBAR32Findiv: ?XBAR32FindivConf = null,
    XBAR33: ?XBAR33CLKSourceConf = null,
    XBAR33Prediv: ?XBAR33PredivConf = null,
    XBAR33Findiv: ?XBAR33FindivConf = null,
    XBAR34: ?XBAR34CLKSourceConf = null,
    XBAR34Prediv: ?XBAR34PredivConf = null,
    XBAR34Findiv: ?XBAR34FindivConf = null,
    XBAR35: ?XBAR35CLKSourceConf = null,
    XBAR35Prediv: ?XBAR35PredivConf = null,
    XBAR35Findiv: ?XBAR35FindivConf = null,
    XBAR36: ?XBAR36CLKSourceConf = null,
    XBAR36Prediv: ?XBAR36PredivConf = null,
    XBAR36Findiv: ?XBAR36FindivConf = null,
    XBAR37: ?XBAR37CLKSourceConf = null,
    XBAR37Prediv: ?XBAR37PredivConf = null,
    XBAR37Findiv: ?XBAR37FindivConf = null,
    XBAR38: ?XBAR38CLKSourceConf = null,
    XBAR38Prediv: ?XBAR38PredivConf = null,
    XBAR38Findiv: ?XBAR38FindivConf = null,
    XBAR39: ?XBAR39CLKSourceConf = null,
    XBAR39Prediv: ?XBAR39PredivConf = null,
    XBAR39Findiv: ?XBAR39FindivConf = null,
    XBAR40: ?XBAR40CLKSourceConf = null,
    XBAR40Prediv: ?XBAR40PredivConf = null,
    XBAR40Findiv: ?XBAR40FindivConf = null,
    XBAR41: ?XBAR41CLKSourceConf = null,
    XBAR41Prediv: ?XBAR41PredivConf = null,
    XBAR41Findiv: ?XBAR41FindivConf = null,
    XBAR42: ?XBAR42CLKSourceConf = null,
    XBAR42Prediv: ?XBAR42PredivConf = null,
    XBAR42Findiv: ?XBAR42FindivConf = null,
    XBAR43: ?XBAR43CLKSourceConf = null,
    XBAR43Prediv: ?XBAR43PredivConf = null,
    XBAR43Findiv: ?XBAR43FindivConf = null,
    XBAR44: ?XBAR44CLKSourceConf = null,
    XBAR44Prediv: ?XBAR44PredivConf = null,
    XBAR44Findiv: ?XBAR44FindivConf = null,
    XBAR45: ?XBAR45CLKSourceConf = null,
    XBAR45Prediv: ?XBAR45PredivConf = null,
    XBAR45Findiv: ?XBAR45FindivConf = null,
    XBAR46: ?XBAR46CLKSourceConf = null,
    XBAR46Prediv: ?XBAR46PredivConf = null,
    XBAR46Findiv: ?XBAR46FindivConf = null,
    XBAR47: ?XBAR47CLKSourceConf = null,
    XBAR47Prediv: ?XBAR47PredivConf = null,
    XBAR47Findiv: ?XBAR47FindivConf = null,
    XBAR48: ?XBAR48CLKSourceConf = null,
    XBAR48Prediv: ?XBAR48PredivConf = null,
    XBAR48Findiv: ?XBAR48FindivConf = null,
    XBAR49: ?XBAR49CLKSourceConf = null,
    XBAR49Prediv: ?XBAR49PredivConf = null,
    XBAR49Findiv: ?XBAR49FindivConf = null,
    XBAR50: ?XBAR50CLKSourceConf = null,
    XBAR50Prediv: ?XBAR50PredivConf = null,
    XBAR50Findiv: ?XBAR50FindivConf = null,
    XBAR51: ?XBAR51CLKSourceConf = null,
    XBAR51Prediv: ?XBAR51PredivConf = null,
    XBAR51Findiv: ?XBAR51FindivConf = null,
    XBAR52: ?XBAR52CLKSourceConf = null,
    XBAR52Prediv: ?XBAR52PredivConf = null,
    XBAR52Findiv: ?XBAR52FindivConf = null,
    XBAR53: ?XBAR53CLKSourceConf = null,
    XBAR53Prediv: ?XBAR53PredivConf = null,
    XBAR53Findiv: ?XBAR53FindivConf = null,
    XBAR54: ?XBAR54CLKSourceConf = null,
    XBAR54Prediv: ?XBAR54PredivConf = null,
    XBAR54Findiv: ?XBAR54FindivConf = null,
    XBAR55: ?XBAR55CLKSourceConf = null,
    XBAR55Prediv: ?XBAR55PredivConf = null,
    XBAR55Findiv: ?XBAR55FindivConf = null,
    XBAR56: ?XBAR56CLKSourceConf = null,
    XBAR56Prediv: ?XBAR56PredivConf = null,
    XBAR56Findiv: ?XBAR56FindivConf = null,
    XBAR57: ?XBAR57CLKSourceConf = null,
    XBAR57Prediv: ?XBAR57PredivConf = null,
    XBAR57Findiv: ?XBAR57FindivConf = null,
    XBAR58: ?XBAR58CLKSourceConf = null,
    XBAR58Prediv: ?XBAR58PredivConf = null,
    XBAR58Findiv: ?XBAR58FindivConf = null,
    XBAR59: ?XBAR59CLKSourceConf = null,
    XBAR59Prediv: ?XBAR59PredivConf = null,
    XBAR59Findiv: ?XBAR59FindivConf = null,
    XBAR60: ?XBAR60CLKSourceConf = null,
    XBAR60Prediv: ?XBAR60PredivConf = null,
    XBAR60Findiv: ?XBAR60FindivConf = null,
    XBAR61: ?XBAR61CLKSourceConf = null,
    XBAR61Prediv: ?XBAR61PredivConf = null,
    XBAR61Findiv: ?XBAR61FindivConf = null,
    XBAR62: ?XBAR62CLKSourceConf = null,
    XBAR62Prediv: ?XBAR62PredivConf = null,
    XBAR62Findiv: ?XBAR62FindivConf = null,
    XBAR63: ?XBAR63CLKSourceConf = null,
    XBAR63Prediv: ?XBAR63PredivConf = null,
    XBAR63Findiv: ?XBAR63FindivConf = null,
    CKINTSEL0: ?CKINTSELCLKSourceConf = null,
    CKEXTSEL0: ?CKEXTSELCLKSourceConf = null,
    CKINTSEL1: ?CKINTSELCLKSource1Conf = null,
    CKEXTSEL1: ?CKEXTSELCLKSource1Conf = null,
    OBS0: ?OBS0SourceConf = null,
    OBS1: ?OBS1SourceConf = null,
    MCO1Mult: ?RCC_MCO1SourceConf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    D3PER: ?D3PERCLKSourceConf = null,
    DTS: ?DTSCLKSourceConf = null,
    DSIPHY: ?DSIPHYCLKSourceConf = null,
    DSIBLANE: ?DSIBLANECLKSourceConf = null,
    USB2PHY1: ?USB2PHY1CLKSourceConf = null,
    USB2PHY2: ?USB2PHY2CLKSourceConf = null,
    USB3PCIPHY: ?USB3PCIPHYCLKSourceConf = null,
    SysClkSource: ?MCUCLKSourceConf = null,
    MCUDIV: ?MCU_DivConf = null,
    APB3DIV: ?APB3DIVConf = null,
    APB4DIV: ?APB4DIVConf = null,
    APBDBGDIV: ?APBDBGDIVConf = null,
    APB1DIV: ?APB1DIVConf = null,
    APB2DIV: ?APB2DIVConf = null,
    ADC12Mult: ?ADC12CLockSelectionConf = null,
    ADC3Mult: ?ADC3CLockSelectionConf = null,
    LVDSMult: ?LVDSCLockSelectionConf = null,
    PLL1Source: ?PLL1SourceConf = null,
    FREFDIV1: ?FREFDIV1Conf = null,
    PLL2Source: ?PLL2SourceConf = null,
    FREFDIV2: ?FREFDIV2Conf = null,
    PLL3Source: ?PLL3SourceConf = null,
    FREFDIV3: ?FREFDIV3Conf = null,
    PLL4Source: ?PLL4SourceConf = null,
    FREFDIV4: ?FREFDIV4Conf = null,
    FBDIV1: ?FBDIV1Conf = null,
    POSTDIV1_1: ?POSTDIV1_1Conf = null,
    POSTDIV2_1: ?POSTDIV2_1Conf = null,
    FBDIV2: ?FBDIV2Conf = null,
    PLL2FRACV: ?PLL2FRACVConf = null,
    POSTDIV1_2: ?POSTDIV1_2Conf = null,
    POSTDIV2_2: ?POSTDIV2_2Conf = null,
    FBDIV3: ?FBDIV3Conf = null,
    PLL3FRACV: ?PLL3FRACVConf = null,
    POSTDIV1_3: ?POSTDIV1_3Conf = null,
    POSTDIV2_3: ?POSTDIV2_3Conf = null,
    FBDIV4: ?FBDIV4Conf = null,
    PLL4FRACV: ?PLL4FRACVConf = null,
    POSTDIV1_4: ?POSTDIV1_4Conf = null,
    POSTDIV2_4: ?POSTDIV2_4Conf = null,
    PLL5Source: ?PLL5SourceConf = null,
    FREFDIV5: ?FREFDIV5Conf = null,
    FBDIV5: ?FBDIV5Conf = null,
    PLL5FRACV: ?PLL5FRACVConf = null,
    POSTDIV1_5: ?POSTDIV1_5Conf = null,
    POSTDIV2_5: ?POSTDIV2_5Conf = null,
    PLL6Source: ?PLL6SourceConf = null,
    FREFDIV6: ?FREFDIV6Conf = null,
    FBDIV6: ?FBDIV6Conf = null,
    PLL6FRACV: ?PLL6FRACVConf = null,
    POSTDIV1_6: ?POSTDIV1_6Conf = null,
    POSTDIV2_6: ?POSTDIV2_6Conf = null,
    PLL7Source: ?PLL7SourceConf = null,
    FREFDIV7: ?FREFDIV7Conf = null,
    FBDIV7: ?FBDIV7Conf = null,
    PLL7FRACV: ?PLL7FRACVConf = null,
    POSTDIV1_7: ?POSTDIV1_7Conf = null,
    POSTDIV2_7: ?POSTDIV2_7Conf = null,
    PLL8Source: ?PLL8SourceConf = null,
    FREFDIV8: ?FREFDIV8Conf = null,
    FBDIV8: ?FBDIV8Conf = null,
    PLL8FRACV: ?PLL8FRACVConf = null,
    POSTDIV1_8: ?POSTDIV1_8Conf = null,
    POSTDIV2_8: ?POSTDIV2_8Conf = null,
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RTCCLockSelectionVirtualConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_G1_PRescaler_Selection: ?RCC_TIM_G1_PRescaler_SelectionConf = null,
    RCC_TIM_G2_PRescaler_Selection: ?RCC_TIM_G2_PRescaler_SelectionConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    HSE_VALUE: ?HSE_VALUEConf = null,
    HSE_Div2: ?HSE_Div2Conf = null,
    SPDIFFreq_Value: ?SPDIFFreq_ValueConf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    MSIClockRange: ?MSIClockRangeConf = null,
    XBAR0CLKSource: ?XBAR0CLKSourceConf = null,
    XBAR0Prediv: ?XBAR0PredivConf = null,
    XBAR0Findiv: ?XBAR0FindivConf = null,
    XBAR1CLKSource: ?XBAR1CLKSourceConf = null,
    XBAR1Prediv: ?XBAR1PredivConf = null,
    XBAR1Findiv: ?XBAR1FindivConf = null,
    XBAR2CLKSource: ?XBAR2CLKSourceConf = null,
    XBAR2Prediv: ?XBAR2PredivConf = null,
    XBAR2Findiv: ?XBAR2FindivConf = null,
    XBAR3CLKSource: ?XBAR3CLKSourceConf = null,
    XBAR3Prediv: ?XBAR3PredivConf = null,
    XBAR3Findiv: ?XBAR3FindivConf = null,
    XBAR4CLKSource: ?XBAR4CLKSourceConf = null,
    XBAR4Prediv: ?XBAR4PredivConf = null,
    XBAR4Findiv: ?XBAR4FindivConf = null,
    XBAR5CLKSource: ?XBAR5CLKSourceConf = null,
    XBAR5Prediv: ?XBAR5PredivConf = null,
    XBAR5Findiv: ?XBAR5FindivConf = null,
    XBAR6CLKSource: ?XBAR6CLKSourceConf = null,
    XBAR6Prediv: ?XBAR6PredivConf = null,
    XBAR6Findiv: ?XBAR6FindivConf = null,
    XBAR7CLKSource: ?XBAR7CLKSourceConf = null,
    XBAR7Prediv: ?XBAR7PredivConf = null,
    XBAR7Findiv: ?XBAR7FindivConf = null,
    XBAR8CLKSource: ?XBAR8CLKSourceConf = null,
    XBAR8Prediv: ?XBAR8PredivConf = null,
    XBAR8Findiv: ?XBAR8FindivConf = null,
    XBAR9CLKSource: ?XBAR9CLKSourceConf = null,
    XBAR9Prediv: ?XBAR9PredivConf = null,
    XBAR9Findiv: ?XBAR9FindivConf = null,
    XBAR10CLKSource: ?XBAR10CLKSourceConf = null,
    XBAR10Prediv: ?XBAR10PredivConf = null,
    XBAR10Findiv: ?XBAR10FindivConf = null,
    XBAR11CLKSource: ?XBAR11CLKSourceConf = null,
    XBAR11Prediv: ?XBAR11PredivConf = null,
    XBAR11Findiv: ?XBAR11FindivConf = null,
    XBAR12CLKSource: ?XBAR12CLKSourceConf = null,
    XBAR12Prediv: ?XBAR12PredivConf = null,
    XBAR12Findiv: ?XBAR12FindivConf = null,
    XBAR13CLKSource: ?XBAR13CLKSourceConf = null,
    XBAR13Prediv: ?XBAR13PredivConf = null,
    XBAR13Findiv: ?XBAR13FindivConf = null,
    XBAR14CLKSource: ?XBAR14CLKSourceConf = null,
    XBAR14Prediv: ?XBAR14PredivConf = null,
    XBAR14Findiv: ?XBAR14FindivConf = null,
    XBAR15CLKSource: ?XBAR15CLKSourceConf = null,
    XBAR15Prediv: ?XBAR15PredivConf = null,
    XBAR15Findiv: ?XBAR15FindivConf = null,
    XBAR16CLKSource: ?XBAR16CLKSourceConf = null,
    XBAR16Prediv: ?XBAR16PredivConf = null,
    XBAR16Findiv: ?XBAR16FindivConf = null,
    XBAR17CLKSource: ?XBAR17CLKSourceConf = null,
    XBAR17Prediv: ?XBAR17PredivConf = null,
    XBAR17Findiv: ?XBAR17FindivConf = null,
    XBAR18CLKSource: ?XBAR18CLKSourceConf = null,
    XBAR18Prediv: ?XBAR18PredivConf = null,
    XBAR18Findiv: ?XBAR18FindivConf = null,
    XBAR19CLKSource: ?XBAR19CLKSourceConf = null,
    XBAR19Prediv: ?XBAR19PredivConf = null,
    XBAR19Findiv: ?XBAR19FindivConf = null,
    XBAR20CLKSource: ?XBAR20CLKSourceConf = null,
    XBAR20Prediv: ?XBAR20PredivConf = null,
    XBAR20Findiv: ?XBAR20FindivConf = null,
    XBAR21CLKSource: ?XBAR21CLKSourceConf = null,
    XBAR21Prediv: ?XBAR21PredivConf = null,
    XBAR21Findiv: ?XBAR21FindivConf = null,
    XBAR22CLKSource: ?XBAR22CLKSourceConf = null,
    XBAR22Prediv: ?XBAR22PredivConf = null,
    XBAR22Findiv: ?XBAR22FindivConf = null,
    XBAR23CLKSource: ?XBAR23CLKSourceConf = null,
    XBAR23Prediv: ?XBAR23PredivConf = null,
    XBAR23Findiv: ?XBAR23FindivConf = null,
    XBAR24CLKSource: ?XBAR24CLKSourceConf = null,
    XBAR24Prediv: ?XBAR24PredivConf = null,
    XBAR24Findiv: ?XBAR24FindivConf = null,
    XBAR25CLKSource: ?XBAR25CLKSourceConf = null,
    XBAR25Prediv: ?XBAR25PredivConf = null,
    XBAR25Findiv: ?XBAR25FindivConf = null,
    XBAR26CLKSource: ?XBAR26CLKSourceConf = null,
    XBAR26Prediv: ?XBAR26PredivConf = null,
    XBAR26Findiv: ?XBAR26FindivConf = null,
    XBAR27CLKSource: ?XBAR27CLKSourceConf = null,
    XBAR27Prediv: ?XBAR27PredivConf = null,
    XBAR27Findiv: ?XBAR27FindivConf = null,
    XBAR28CLKSource: ?XBAR28CLKSourceConf = null,
    XBAR28Prediv: ?XBAR28PredivConf = null,
    XBAR28Findiv: ?XBAR28FindivConf = null,
    XBAR29CLKSource: ?XBAR29CLKSourceConf = null,
    XBAR29Prediv: ?XBAR29PredivConf = null,
    XBAR29Findiv: ?XBAR29FindivConf = null,
    XBAR30CLKSource: ?XBAR30CLKSourceConf = null,
    XBAR30Prediv: ?XBAR30PredivConf = null,
    XBAR30Findiv: ?XBAR30FindivConf = null,
    XBAR31CLKSource: ?XBAR31CLKSourceConf = null,
    XBAR31Prediv: ?XBAR31PredivConf = null,
    XBAR31Findiv: ?XBAR31FindivConf = null,
    XBAR32CLKSource: ?XBAR32CLKSourceConf = null,
    XBAR32Prediv: ?XBAR32PredivConf = null,
    XBAR32Findiv: ?XBAR32FindivConf = null,
    XBAR33CLKSource: ?XBAR33CLKSourceConf = null,
    XBAR33Prediv: ?XBAR33PredivConf = null,
    XBAR33Findiv: ?XBAR33FindivConf = null,
    XBAR34CLKSource: ?XBAR34CLKSourceConf = null,
    XBAR34Prediv: ?XBAR34PredivConf = null,
    XBAR34Findiv: ?XBAR34FindivConf = null,
    XBAR35CLKSource: ?XBAR35CLKSourceConf = null,
    XBAR35Prediv: ?XBAR35PredivConf = null,
    XBAR35Findiv: ?XBAR35FindivConf = null,
    XBAR36CLKSource: ?XBAR36CLKSourceConf = null,
    XBAR36Prediv: ?XBAR36PredivConf = null,
    XBAR36Findiv: ?XBAR36FindivConf = null,
    XBAR37CLKSource: ?XBAR37CLKSourceConf = null,
    XBAR37Prediv: ?XBAR37PredivConf = null,
    XBAR37Findiv: ?XBAR37FindivConf = null,
    XBAR38CLKSource: ?XBAR38CLKSourceConf = null,
    XBAR38Prediv: ?XBAR38PredivConf = null,
    XBAR38Findiv: ?XBAR38FindivConf = null,
    XBAR39CLKSource: ?XBAR39CLKSourceConf = null,
    XBAR39Prediv: ?XBAR39PredivConf = null,
    XBAR39Findiv: ?XBAR39FindivConf = null,
    XBAR40CLKSource: ?XBAR40CLKSourceConf = null,
    XBAR40Prediv: ?XBAR40PredivConf = null,
    XBAR40Findiv: ?XBAR40FindivConf = null,
    XBAR41CLKSource: ?XBAR41CLKSourceConf = null,
    XBAR41Prediv: ?XBAR41PredivConf = null,
    XBAR41Findiv: ?XBAR41FindivConf = null,
    XBAR42CLKSource: ?XBAR42CLKSourceConf = null,
    XBAR42Prediv: ?XBAR42PredivConf = null,
    XBAR42Findiv: ?XBAR42FindivConf = null,
    XBAR43CLKSource: ?XBAR43CLKSourceConf = null,
    XBAR43Prediv: ?XBAR43PredivConf = null,
    XBAR43Findiv: ?XBAR43FindivConf = null,
    XBAR44CLKSource: ?XBAR44CLKSourceConf = null,
    XBAR44Prediv: ?XBAR44PredivConf = null,
    XBAR44Findiv: ?XBAR44FindivConf = null,
    XBAR45CLKSource: ?XBAR45CLKSourceConf = null,
    XBAR45Prediv: ?XBAR45PredivConf = null,
    XBAR45Findiv: ?XBAR45FindivConf = null,
    XBAR46CLKSource: ?XBAR46CLKSourceConf = null,
    XBAR46Prediv: ?XBAR46PredivConf = null,
    XBAR46Findiv: ?XBAR46FindivConf = null,
    XBAR47CLKSource: ?XBAR47CLKSourceConf = null,
    XBAR47Prediv: ?XBAR47PredivConf = null,
    XBAR47Findiv: ?XBAR47FindivConf = null,
    XBAR48CLKSource: ?XBAR48CLKSourceConf = null,
    XBAR48Prediv: ?XBAR48PredivConf = null,
    XBAR48Findiv: ?XBAR48FindivConf = null,
    XBAR49CLKSource: ?XBAR49CLKSourceConf = null,
    XBAR49Prediv: ?XBAR49PredivConf = null,
    XBAR49Findiv: ?XBAR49FindivConf = null,
    XBAR50CLKSource: ?XBAR50CLKSourceConf = null,
    XBAR50Prediv: ?XBAR50PredivConf = null,
    XBAR50Findiv: ?XBAR50FindivConf = null,
    XBAR51CLKSource: ?XBAR51CLKSourceConf = null,
    XBAR51Prediv: ?XBAR51PredivConf = null,
    XBAR51Findiv: ?XBAR51FindivConf = null,
    XBAR52CLKSource: ?XBAR52CLKSourceConf = null,
    XBAR52Prediv: ?XBAR52PredivConf = null,
    XBAR52Findiv: ?XBAR52FindivConf = null,
    XBAR53CLKSource: ?XBAR53CLKSourceConf = null,
    XBAR53Prediv: ?XBAR53PredivConf = null,
    XBAR53Findiv: ?XBAR53FindivConf = null,
    XBAR54CLKSource: ?XBAR54CLKSourceConf = null,
    XBAR54Prediv: ?XBAR54PredivConf = null,
    XBAR54Findiv: ?XBAR54FindivConf = null,
    XBAR55CLKSource: ?XBAR55CLKSourceConf = null,
    XBAR55Prediv: ?XBAR55PredivConf = null,
    XBAR55Findiv: ?XBAR55FindivConf = null,
    XBAR56CLKSource: ?XBAR56CLKSourceConf = null,
    XBAR56Prediv: ?XBAR56PredivConf = null,
    XBAR56Findiv: ?XBAR56FindivConf = null,
    XBAR57CLKSource: ?XBAR57CLKSourceConf = null,
    XBAR57Prediv: ?XBAR57PredivConf = null,
    XBAR57Findiv: ?XBAR57FindivConf = null,
    XBAR58CLKSource: ?XBAR58CLKSourceConf = null,
    XBAR58Prediv: ?XBAR58PredivConf = null,
    XBAR58Findiv: ?XBAR58FindivConf = null,
    XBAR59CLKSource: ?XBAR59CLKSourceConf = null,
    XBAR59Prediv: ?XBAR59PredivConf = null,
    XBAR59Findiv: ?XBAR59FindivConf = null,
    XBAR60CLKSource: ?XBAR60CLKSourceConf = null,
    XBAR60Prediv: ?XBAR60PredivConf = null,
    XBAR60Findiv: ?XBAR60FindivConf = null,
    XBAR61CLKSource: ?XBAR61CLKSourceConf = null,
    XBAR61Prediv: ?XBAR61PredivConf = null,
    XBAR61Findiv: ?XBAR61FindivConf = null,
    XBAR62CLKSource: ?XBAR62CLKSourceConf = null,
    XBAR62Prediv: ?XBAR62PredivConf = null,
    XBAR62Findiv: ?XBAR62FindivConf = null,
    XBAR63CLKSource: ?XBAR63CLKSourceConf = null,
    XBAR63Prediv: ?XBAR63PredivConf = null,
    XBAR63Findiv: ?XBAR63FindivConf = null,
    CKINTSELCLKSource: ?CKINTSELCLKSourceConf = null,
    CKEXTSELCLKSource: ?CKEXTSELCLKSourceConf = null,
    CKINTSELCLKSource1: ?CKINTSELCLKSource1Conf = null,
    CKEXTSELCLKSource1: ?CKEXTSELCLKSource1Conf = null,
    OBS0Source: ?OBS0SourceConf = null,
    OBS1Source: ?OBS1SourceConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    D3PERCLKSource: ?D3PERCLKSourceConf = null,
    DTSCLKSource: ?DTSCLKSourceConf = null,
    DSIPHYCLKSource: ?DSIPHYCLKSourceConf = null,
    DSIBLANECLKSource: ?DSIBLANECLKSourceConf = null,
    USB2PHY1CLKSource: ?USB2PHY1CLKSourceConf = null,
    USB2PHY2CLKSource: ?USB2PHY2CLKSourceConf = null,
    USB3PCIPHYCLKSource: ?USB3PCIPHYCLKSourceConf = null,
    MCUCLKSource: ?MCUCLKSourceConf = null,
    MCU_Div: ?MCU_DivConf = null,
    APB3DIV: ?APB3DIVConf = null,
    APB4DIV: ?APB4DIVConf = null,
    APBDBGDIV: ?APBDBGDIVConf = null,
    APB1DIV: ?APB1DIVConf = null,
    APB2DIV: ?APB2DIVConf = null,
    ADC12CLockSelection: ?ADC12CLockSelectionConf = null,
    ADC3CLockSelection: ?ADC3CLockSelectionConf = null,
    LVDSCLockSelection: ?LVDSCLockSelectionConf = null,
    PLL1Source: ?PLL1SourceConf = null,
    FREFDIV1: ?FREFDIV1Conf = null,
    PLL2Source: ?PLL2SourceConf = null,
    FREFDIV2: ?FREFDIV2Conf = null,
    PLL3Source: ?PLL3SourceConf = null,
    FREFDIV3: ?FREFDIV3Conf = null,
    PLL4Source: ?PLL4SourceConf = null,
    FREFDIV4: ?FREFDIV4Conf = null,
    FBDIV1: ?FBDIV1Conf = null,
    POSTDIV1_1: ?POSTDIV1_1Conf = null,
    POSTDIV2_1: ?POSTDIV2_1Conf = null,
    FBDIV2: ?FBDIV2Conf = null,
    PLL2FRACV: ?PLL2FRACVConf = null,
    POSTDIV1_2: ?POSTDIV1_2Conf = null,
    POSTDIV2_2: ?POSTDIV2_2Conf = null,
    FBDIV3: ?FBDIV3Conf = null,
    PLL3FRACV: ?PLL3FRACVConf = null,
    POSTDIV1_3: ?POSTDIV1_3Conf = null,
    POSTDIV2_3: ?POSTDIV2_3Conf = null,
    FBDIV4: ?FBDIV4Conf = null,
    PLL4FRACV: ?PLL4FRACVConf = null,
    POSTDIV1_4: ?POSTDIV1_4Conf = null,
    POSTDIV2_4: ?POSTDIV2_4Conf = null,
    PLL5Source: ?PLL5SourceConf = null,
    FREFDIV5: ?FREFDIV5Conf = null,
    FBDIV5: ?FBDIV5Conf = null,
    PLL5FRACV: ?PLL5FRACVConf = null,
    POSTDIV1_5: ?POSTDIV1_5Conf = null,
    POSTDIV2_5: ?POSTDIV2_5Conf = null,
    PLL6Source: ?PLL6SourceConf = null,
    FREFDIV6: ?FREFDIV6Conf = null,
    FBDIV6: ?FBDIV6Conf = null,
    PLL6FRACV: ?PLL6FRACVConf = null,
    POSTDIV1_6: ?POSTDIV1_6Conf = null,
    POSTDIV2_6: ?POSTDIV2_6Conf = null,
    PLL7Source: ?PLL7SourceConf = null,
    FREFDIV7: ?FREFDIV7Conf = null,
    FBDIV7: ?FBDIV7Conf = null,
    PLL7FRACV: ?PLL7FRACVConf = null,
    POSTDIV1_7: ?POSTDIV1_7Conf = null,
    POSTDIV2_7: ?POSTDIV2_7Conf = null,
    PLL8Source: ?PLL8SourceConf = null,
    FREFDIV8: ?FREFDIV8Conf = null,
    FBDIV8: ?FBDIV8Conf = null,
    PLL8FRACV: ?PLL8FRACVConf = null,
    POSTDIV1_8: ?POSTDIV1_8Conf = null,
    POSTDIV2_8: ?POSTDIV2_8Conf = null,
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCCLockSelectionVirtual: ?RTCCLockSelectionVirtualConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_G1_PRescaler_Selection: ?RCC_TIM_G1_PRescaler_SelectionConf = null,
    RCC_TIM_G2_PRescaler_Selection: ?RCC_TIM_G2_PRescaler_SelectionConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSEOSC = self.HSE_VALUE,
            .HSEDIV2 = self.HSE_Div2,
            .SPDIF = self.SPDIFFreq_Value,
            .LSEOSC = self.LSE_VALUE,
            .MSIRC = self.MSIClockRange,
            .XBAR0 = self.XBAR0CLKSource,
            .XBAR0Prediv = self.XBAR0Prediv,
            .XBAR0Findiv = self.XBAR0Findiv,
            .XBAR1 = self.XBAR1CLKSource,
            .XBAR1Prediv = self.XBAR1Prediv,
            .XBAR1Findiv = self.XBAR1Findiv,
            .XBAR2 = self.XBAR2CLKSource,
            .XBAR2Prediv = self.XBAR2Prediv,
            .XBAR2Findiv = self.XBAR2Findiv,
            .XBAR3 = self.XBAR3CLKSource,
            .XBAR3Prediv = self.XBAR3Prediv,
            .XBAR3Findiv = self.XBAR3Findiv,
            .XBAR4 = self.XBAR4CLKSource,
            .XBAR4Prediv = self.XBAR4Prediv,
            .XBAR4Findiv = self.XBAR4Findiv,
            .XBAR5 = self.XBAR5CLKSource,
            .XBAR5Prediv = self.XBAR5Prediv,
            .XBAR5Findiv = self.XBAR5Findiv,
            .XBAR6 = self.XBAR6CLKSource,
            .XBAR6Prediv = self.XBAR6Prediv,
            .XBAR6Findiv = self.XBAR6Findiv,
            .XBAR7 = self.XBAR7CLKSource,
            .XBAR7Prediv = self.XBAR7Prediv,
            .XBAR7Findiv = self.XBAR7Findiv,
            .XBAR8 = self.XBAR8CLKSource,
            .XBAR8Prediv = self.XBAR8Prediv,
            .XBAR8Findiv = self.XBAR8Findiv,
            .XBAR9 = self.XBAR9CLKSource,
            .XBAR9Prediv = self.XBAR9Prediv,
            .XBAR9Findiv = self.XBAR9Findiv,
            .XBAR10 = self.XBAR10CLKSource,
            .XBAR10Prediv = self.XBAR10Prediv,
            .XBAR10Findiv = self.XBAR10Findiv,
            .XBAR11 = self.XBAR11CLKSource,
            .XBAR11Prediv = self.XBAR11Prediv,
            .XBAR11Findiv = self.XBAR11Findiv,
            .XBAR12 = self.XBAR12CLKSource,
            .XBAR12Prediv = self.XBAR12Prediv,
            .XBAR12Findiv = self.XBAR12Findiv,
            .XBAR13 = self.XBAR13CLKSource,
            .XBAR13Prediv = self.XBAR13Prediv,
            .XBAR13Findiv = self.XBAR13Findiv,
            .XBAR14 = self.XBAR14CLKSource,
            .XBAR14Prediv = self.XBAR14Prediv,
            .XBAR14Findiv = self.XBAR14Findiv,
            .XBAR15 = self.XBAR15CLKSource,
            .XBAR15Prediv = self.XBAR15Prediv,
            .XBAR15Findiv = self.XBAR15Findiv,
            .XBAR16 = self.XBAR16CLKSource,
            .XBAR16Prediv = self.XBAR16Prediv,
            .XBAR16Findiv = self.XBAR16Findiv,
            .XBAR17 = self.XBAR17CLKSource,
            .XBAR17Prediv = self.XBAR17Prediv,
            .XBAR17Findiv = self.XBAR17Findiv,
            .XBAR18 = self.XBAR18CLKSource,
            .XBAR18Prediv = self.XBAR18Prediv,
            .XBAR18Findiv = self.XBAR18Findiv,
            .XBAR19 = self.XBAR19CLKSource,
            .XBAR19Prediv = self.XBAR19Prediv,
            .XBAR19Findiv = self.XBAR19Findiv,
            .XBAR20 = self.XBAR20CLKSource,
            .XBAR20Prediv = self.XBAR20Prediv,
            .XBAR20Findiv = self.XBAR20Findiv,
            .XBAR21 = self.XBAR21CLKSource,
            .XBAR21Prediv = self.XBAR21Prediv,
            .XBAR21Findiv = self.XBAR21Findiv,
            .XBAR22 = self.XBAR22CLKSource,
            .XBAR22Prediv = self.XBAR22Prediv,
            .XBAR22Findiv = self.XBAR22Findiv,
            .XBAR23 = self.XBAR23CLKSource,
            .XBAR23Prediv = self.XBAR23Prediv,
            .XBAR23Findiv = self.XBAR23Findiv,
            .XBAR24 = self.XBAR24CLKSource,
            .XBAR24Prediv = self.XBAR24Prediv,
            .XBAR24Findiv = self.XBAR24Findiv,
            .XBAR25 = self.XBAR25CLKSource,
            .XBAR25Prediv = self.XBAR25Prediv,
            .XBAR25Findiv = self.XBAR25Findiv,
            .XBAR26 = self.XBAR26CLKSource,
            .XBAR26Prediv = self.XBAR26Prediv,
            .XBAR26Findiv = self.XBAR26Findiv,
            .XBAR27 = self.XBAR27CLKSource,
            .XBAR27Prediv = self.XBAR27Prediv,
            .XBAR27Findiv = self.XBAR27Findiv,
            .XBAR28 = self.XBAR28CLKSource,
            .XBAR28Prediv = self.XBAR28Prediv,
            .XBAR28Findiv = self.XBAR28Findiv,
            .XBAR29 = self.XBAR29CLKSource,
            .XBAR29Prediv = self.XBAR29Prediv,
            .XBAR29Findiv = self.XBAR29Findiv,
            .XBAR30 = self.XBAR30CLKSource,
            .XBAR30Prediv = self.XBAR30Prediv,
            .XBAR30Findiv = self.XBAR30Findiv,
            .XBAR31 = self.XBAR31CLKSource,
            .XBAR31Prediv = self.XBAR31Prediv,
            .XBAR31Findiv = self.XBAR31Findiv,
            .XBAR32 = self.XBAR32CLKSource,
            .XBAR32Prediv = self.XBAR32Prediv,
            .XBAR32Findiv = self.XBAR32Findiv,
            .XBAR33 = self.XBAR33CLKSource,
            .XBAR33Prediv = self.XBAR33Prediv,
            .XBAR33Findiv = self.XBAR33Findiv,
            .XBAR34 = self.XBAR34CLKSource,
            .XBAR34Prediv = self.XBAR34Prediv,
            .XBAR34Findiv = self.XBAR34Findiv,
            .XBAR35 = self.XBAR35CLKSource,
            .XBAR35Prediv = self.XBAR35Prediv,
            .XBAR35Findiv = self.XBAR35Findiv,
            .XBAR36 = self.XBAR36CLKSource,
            .XBAR36Prediv = self.XBAR36Prediv,
            .XBAR36Findiv = self.XBAR36Findiv,
            .XBAR37 = self.XBAR37CLKSource,
            .XBAR37Prediv = self.XBAR37Prediv,
            .XBAR37Findiv = self.XBAR37Findiv,
            .XBAR38 = self.XBAR38CLKSource,
            .XBAR38Prediv = self.XBAR38Prediv,
            .XBAR38Findiv = self.XBAR38Findiv,
            .XBAR39 = self.XBAR39CLKSource,
            .XBAR39Prediv = self.XBAR39Prediv,
            .XBAR39Findiv = self.XBAR39Findiv,
            .XBAR40 = self.XBAR40CLKSource,
            .XBAR40Prediv = self.XBAR40Prediv,
            .XBAR40Findiv = self.XBAR40Findiv,
            .XBAR41 = self.XBAR41CLKSource,
            .XBAR41Prediv = self.XBAR41Prediv,
            .XBAR41Findiv = self.XBAR41Findiv,
            .XBAR42 = self.XBAR42CLKSource,
            .XBAR42Prediv = self.XBAR42Prediv,
            .XBAR42Findiv = self.XBAR42Findiv,
            .XBAR43 = self.XBAR43CLKSource,
            .XBAR43Prediv = self.XBAR43Prediv,
            .XBAR43Findiv = self.XBAR43Findiv,
            .XBAR44 = self.XBAR44CLKSource,
            .XBAR44Prediv = self.XBAR44Prediv,
            .XBAR44Findiv = self.XBAR44Findiv,
            .XBAR45 = self.XBAR45CLKSource,
            .XBAR45Prediv = self.XBAR45Prediv,
            .XBAR45Findiv = self.XBAR45Findiv,
            .XBAR46 = self.XBAR46CLKSource,
            .XBAR46Prediv = self.XBAR46Prediv,
            .XBAR46Findiv = self.XBAR46Findiv,
            .XBAR47 = self.XBAR47CLKSource,
            .XBAR47Prediv = self.XBAR47Prediv,
            .XBAR47Findiv = self.XBAR47Findiv,
            .XBAR48 = self.XBAR48CLKSource,
            .XBAR48Prediv = self.XBAR48Prediv,
            .XBAR48Findiv = self.XBAR48Findiv,
            .XBAR49 = self.XBAR49CLKSource,
            .XBAR49Prediv = self.XBAR49Prediv,
            .XBAR49Findiv = self.XBAR49Findiv,
            .XBAR50 = self.XBAR50CLKSource,
            .XBAR50Prediv = self.XBAR50Prediv,
            .XBAR50Findiv = self.XBAR50Findiv,
            .XBAR51 = self.XBAR51CLKSource,
            .XBAR51Prediv = self.XBAR51Prediv,
            .XBAR51Findiv = self.XBAR51Findiv,
            .XBAR52 = self.XBAR52CLKSource,
            .XBAR52Prediv = self.XBAR52Prediv,
            .XBAR52Findiv = self.XBAR52Findiv,
            .XBAR53 = self.XBAR53CLKSource,
            .XBAR53Prediv = self.XBAR53Prediv,
            .XBAR53Findiv = self.XBAR53Findiv,
            .XBAR54 = self.XBAR54CLKSource,
            .XBAR54Prediv = self.XBAR54Prediv,
            .XBAR54Findiv = self.XBAR54Findiv,
            .XBAR55 = self.XBAR55CLKSource,
            .XBAR55Prediv = self.XBAR55Prediv,
            .XBAR55Findiv = self.XBAR55Findiv,
            .XBAR56 = self.XBAR56CLKSource,
            .XBAR56Prediv = self.XBAR56Prediv,
            .XBAR56Findiv = self.XBAR56Findiv,
            .XBAR57 = self.XBAR57CLKSource,
            .XBAR57Prediv = self.XBAR57Prediv,
            .XBAR57Findiv = self.XBAR57Findiv,
            .XBAR58 = self.XBAR58CLKSource,
            .XBAR58Prediv = self.XBAR58Prediv,
            .XBAR58Findiv = self.XBAR58Findiv,
            .XBAR59 = self.XBAR59CLKSource,
            .XBAR59Prediv = self.XBAR59Prediv,
            .XBAR59Findiv = self.XBAR59Findiv,
            .XBAR60 = self.XBAR60CLKSource,
            .XBAR60Prediv = self.XBAR60Prediv,
            .XBAR60Findiv = self.XBAR60Findiv,
            .XBAR61 = self.XBAR61CLKSource,
            .XBAR61Prediv = self.XBAR61Prediv,
            .XBAR61Findiv = self.XBAR61Findiv,
            .XBAR62 = self.XBAR62CLKSource,
            .XBAR62Prediv = self.XBAR62Prediv,
            .XBAR62Findiv = self.XBAR62Findiv,
            .XBAR63 = self.XBAR63CLKSource,
            .XBAR63Prediv = self.XBAR63Prediv,
            .XBAR63Findiv = self.XBAR63Findiv,
            .CKINTSEL0 = self.CKINTSELCLKSource,
            .CKEXTSEL0 = self.CKEXTSELCLKSource,
            .CKINTSEL1 = self.CKINTSELCLKSource1,
            .CKEXTSEL1 = self.CKEXTSELCLKSource1,
            .OBS0 = self.OBS0Source,
            .OBS1 = self.OBS1Source,
            .MCO1Mult = self.RCC_MCO1Source,
            .MCO2Mult = self.RCC_MCO2Source,
            .D3PER = self.D3PERCLKSource,
            .DTS = self.DTSCLKSource,
            .DSIPHY = self.DSIPHYCLKSource,
            .DSIBLANE = self.DSIBLANECLKSource,
            .USB2PHY1 = self.USB2PHY1CLKSource,
            .USB2PHY2 = self.USB2PHY2CLKSource,
            .USB3PCIPHY = self.USB3PCIPHYCLKSource,
            .SysClkSource = self.MCUCLKSource,
            .MCUDIV = self.MCU_Div,
            .APB3DIV = self.APB3DIV,
            .APB4DIV = self.APB4DIV,
            .APBDBGDIV = self.APBDBGDIV,
            .APB1DIV = self.APB1DIV,
            .APB2DIV = self.APB2DIV,
            .ADC12Mult = self.ADC12CLockSelection,
            .ADC3Mult = self.ADC3CLockSelection,
            .LVDSMult = self.LVDSCLockSelection,
            .PLL1Source = self.PLL1Source,
            .FREFDIV1 = self.FREFDIV1,
            .PLL2Source = self.PLL2Source,
            .FREFDIV2 = self.FREFDIV2,
            .PLL3Source = self.PLL3Source,
            .FREFDIV3 = self.FREFDIV3,
            .PLL4Source = self.PLL4Source,
            .FREFDIV4 = self.FREFDIV4,
            .FBDIV1 = self.FBDIV1,
            .POSTDIV1_1 = self.POSTDIV1_1,
            .POSTDIV2_1 = self.POSTDIV2_1,
            .FBDIV2 = self.FBDIV2,
            .PLL2FRACV = self.PLL2FRACV,
            .POSTDIV1_2 = self.POSTDIV1_2,
            .POSTDIV2_2 = self.POSTDIV2_2,
            .FBDIV3 = self.FBDIV3,
            .PLL3FRACV = self.PLL3FRACV,
            .POSTDIV1_3 = self.POSTDIV1_3,
            .POSTDIV2_3 = self.POSTDIV2_3,
            .FBDIV4 = self.FBDIV4,
            .PLL4FRACV = self.PLL4FRACV,
            .POSTDIV1_4 = self.POSTDIV1_4,
            .POSTDIV2_4 = self.POSTDIV2_4,
            .PLL5Source = self.PLL5Source,
            .FREFDIV5 = self.FREFDIV5,
            .FBDIV5 = self.FBDIV5,
            .PLL5FRACV = self.PLL5FRACV,
            .POSTDIV1_5 = self.POSTDIV1_5,
            .POSTDIV2_5 = self.POSTDIV2_5,
            .PLL6Source = self.PLL6Source,
            .FREFDIV6 = self.FREFDIV6,
            .FBDIV6 = self.FBDIV6,
            .PLL6FRACV = self.PLL6FRACV,
            .POSTDIV1_6 = self.POSTDIV1_6,
            .POSTDIV2_6 = self.POSTDIV2_6,
            .PLL7Source = self.PLL7Source,
            .FREFDIV7 = self.FREFDIV7,
            .FBDIV7 = self.FBDIV7,
            .PLL7FRACV = self.PLL7FRACV,
            .POSTDIV1_7 = self.POSTDIV1_7,
            .POSTDIV2_7 = self.POSTDIV2_7,
            .PLL8Source = self.PLL8Source,
            .FREFDIV8 = self.FREFDIV8,
            .FBDIV8 = self.FBDIV8,
            .PLL8FRACV = self.PLL8FRACV,
            .POSTDIV1_8 = self.POSTDIV1_8,
            .POSTDIV2_8 = self.POSTDIV2_8,
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCCLockSelectionVirtual,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .RCC_TIM_G1_PRescaler_Selection = self.RCC_TIM_G1_PRescaler_Selection,
            .RCC_TIM_G2_PRescaler_Selection = self.RCC_TIM_G2_PRescaler_Selection,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
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
    LVDSMult: ClockNode,
    LVDSoutput: ClockNode,
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
                .value = if (config.HSEOSC) |val| val.get() else 40000000,
                .limit = .{ .max = 48000000, .min = 16000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const HSEDIV2val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEDIV2) |val| {
                    switch (val) {
                        .@"2",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        } };
        const HSEDIV2: ClockNode = .{
            .name = "HSEDIV2",
            .Nodetype = HSEDIV2val,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const SPDIFval = ClockNodeTypes{
            .source = .{
                .value = if (config.SPDIF) |val| val.get() else 12288000,
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
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = 1000000, .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const MSIRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIRC) |val| {
                    switch (val) {
                        .RCC_MSI_16MHZ,
                        .RCC_MSI_4MHZ,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 16;
                }
            },
        } };
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
        const PLL4Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL4Source) |val| {
                    switch (val) {
                        .RCC_PLL4SOURCE_HSI,
                        .RCC_PLL4SOURCE_MSI,
                        .RCC_PLL4SOURCE_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
                .value = if (config.FREFDIV4) |val| val.get() else 1,
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
                .value = if (config.PLL4FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL4FRACV: ClockNode = .{
            .name = "PLL4FRACV",
            .Nodetype = PLL4FRACVval,
        };
        const FBDIV4val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV4) |val| val.get() else 12297829382473034410,
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
                .value = if (config.POSTDIV1_4) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_4) |val| val.get() else 1,
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
        const PLL5Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL5Source) |val| {
                    switch (val) {
                        .RCC_PLL5SOURCE_HSI,
                        .RCC_PLL5SOURCE_MSI,
                        .RCC_PLL5SOURCE_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
                .value = if (config.FREFDIV5) |val| val.get() else 1,
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
                .value = if (config.PLL5FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL5FRACV: ClockNode = .{
            .name = "PLL5FRACV",
            .Nodetype = PLL5FRACVval,
        };
        const FBDIV5val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV5) |val| val.get() else 12297829382473034410,
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
                .value = if (config.POSTDIV1_5) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_5) |val| val.get() else 1,
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
        const PLL6Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL6Source) |val| {
                    switch (val) {
                        .RCC_PLL6SOURCE_HSI,
                        .RCC_PLL6SOURCE_MSI,
                        .RCC_PLL6SOURCE_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
                .value = if (config.FREFDIV6) |val| val.get() else 1,
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
                .value = if (config.PLL6FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL6FRACV: ClockNode = .{
            .name = "PLL6FRACV",
            .Nodetype = PLL6FRACVval,
        };
        const FBDIV6val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV6) |val| val.get() else 12297829382473034410,
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
                .value = if (config.POSTDIV1_6) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_6) |val| val.get() else 1,
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
        const PLL7Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL7Source) |val| {
                    switch (val) {
                        .RCC_PLL7SOURCE_HSI,
                        .RCC_PLL7SOURCE_MSI,
                        .RCC_PLL7SOURCE_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
                .value = if (config.FREFDIV7) |val| val.get() else 1,
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
                .value = if (config.PLL7FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL7FRACV: ClockNode = .{
            .name = "PLL7FRACV",
            .Nodetype = PLL7FRACVval,
        };
        const FBDIV7val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV7) |val| val.get() else 12297829382473034410,
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
                .value = if (config.POSTDIV1_7) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_7) |val| val.get() else 1,
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
        const PLL8Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL8Source) |val| {
                    switch (val) {
                        .RCC_PLL8SOURCE_HSI,
                        .RCC_PLL8SOURCE_MSI,
                        .RCC_PLL8SOURCE_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
                .value = if (config.FREFDIV8) |val| val.get() else 1,
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
                .value = if (config.PLL8FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL8FRACV: ClockNode = .{
            .name = "PLL8FRACV",
            .Nodetype = PLL8FRACVval,
        };
        const FBDIV8val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV8) |val| val.get() else 12297829382473034410,
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
                .value = if (config.POSTDIV1_8) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_8) |val| val.get() else 1,
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
        const XBAR0val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR0) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR0Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR0Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR0Prediv: ClockNode = .{
            .name = "XBAR0Prediv",
            .Nodetype = XBAR0Predivval,
            .parents = &[_]*const ClockNode{&XBAR0},
        };
        const XBAR0Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR0Findiv) |val| val.get() else 1,
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
        const XBAR1val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR1) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR1Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR1Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR1Prediv: ClockNode = .{
            .name = "XBAR1Prediv",
            .Nodetype = XBAR1Predivval,
            .parents = &[_]*const ClockNode{&XBAR1},
        };
        const XBAR1Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR1Findiv) |val| val.get() else 1,
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
        const XBAR2val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR2) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR2Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR2Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR2Prediv: ClockNode = .{
            .name = "XBAR2Prediv",
            .Nodetype = XBAR2Predivval,
            .parents = &[_]*const ClockNode{&XBAR2},
        };
        const XBAR2Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR2Findiv) |val| val.get() else 1,
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
        const XBAR3val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR3) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR3Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR3Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR3Prediv: ClockNode = .{
            .name = "XBAR3Prediv",
            .Nodetype = XBAR3Predivval,
            .parents = &[_]*const ClockNode{&XBAR3},
        };
        const XBAR3Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR3Findiv) |val| val.get() else 1,
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
        const XBAR4val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR4) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR4Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR4Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR4Prediv: ClockNode = .{
            .name = "XBAR4Prediv",
            .Nodetype = XBAR4Predivval,
            .parents = &[_]*const ClockNode{&XBAR4},
        };
        const XBAR4Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR4Findiv) |val| val.get() else 1,
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
        const XBAR5val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR5) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR5Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR5Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR5Prediv: ClockNode = .{
            .name = "XBAR5Prediv",
            .Nodetype = XBAR5Predivval,
            .parents = &[_]*const ClockNode{&XBAR5},
        };
        const XBAR5Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR5Findiv) |val| val.get() else 1,
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
        const XBAR6val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR6) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR6Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR6Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR6Prediv: ClockNode = .{
            .name = "XBAR6Prediv",
            .Nodetype = XBAR6Predivval,
            .parents = &[_]*const ClockNode{&XBAR6},
        };
        const XBAR6Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR6Findiv) |val| val.get() else 1,
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
        const XBAR7val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR7) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR7Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR7Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR7Prediv: ClockNode = .{
            .name = "XBAR7Prediv",
            .Nodetype = XBAR7Predivval,
            .parents = &[_]*const ClockNode{&XBAR7},
        };
        const XBAR7Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR7Findiv) |val| val.get() else 1,
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
        const XBAR8val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR8) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR8Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR8Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR8Prediv: ClockNode = .{
            .name = "XBAR8Prediv",
            .Nodetype = XBAR8Predivval,
            .parents = &[_]*const ClockNode{&XBAR8},
        };
        const XBAR8Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR8Findiv) |val| val.get() else 1,
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
        const XBAR9val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR9) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR9Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR9Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR9Prediv: ClockNode = .{
            .name = "XBAR9Prediv",
            .Nodetype = XBAR9Predivval,
            .parents = &[_]*const ClockNode{&XBAR9},
        };
        const XBAR9Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR9Findiv) |val| val.get() else 1,
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
        const XBAR10val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR10) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR10Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR10Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR10Prediv: ClockNode = .{
            .name = "XBAR10Prediv",
            .Nodetype = XBAR10Predivval,
            .parents = &[_]*const ClockNode{&XBAR10},
        };
        const XBAR10Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR10Findiv) |val| val.get() else 1,
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
        const XBAR11val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR11) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR11Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR11Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR11Prediv: ClockNode = .{
            .name = "XBAR11Prediv",
            .Nodetype = XBAR11Predivval,
            .parents = &[_]*const ClockNode{&XBAR11},
        };
        const XBAR11Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR11Findiv) |val| val.get() else 1,
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
        const XBAR12val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR12) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR12Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR12Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR12Prediv: ClockNode = .{
            .name = "XBAR12Prediv",
            .Nodetype = XBAR12Predivval,
            .parents = &[_]*const ClockNode{&XBAR12},
        };
        const XBAR12Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR12Findiv) |val| val.get() else 1,
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
        const XBAR13val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR13) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR13Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR13Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR13Prediv: ClockNode = .{
            .name = "XBAR13Prediv",
            .Nodetype = XBAR13Predivval,
            .parents = &[_]*const ClockNode{&XBAR13},
        };
        const XBAR13Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR13Findiv) |val| val.get() else 1,
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
        const XBAR14val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR14) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR14Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR14Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR14Prediv: ClockNode = .{
            .name = "XBAR14Prediv",
            .Nodetype = XBAR14Predivval,
            .parents = &[_]*const ClockNode{&XBAR14},
        };
        const XBAR14Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR14Findiv) |val| val.get() else 1,
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
        const XBAR15val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR15) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR15Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR15Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR15Prediv: ClockNode = .{
            .name = "XBAR15Prediv",
            .Nodetype = XBAR15Predivval,
            .parents = &[_]*const ClockNode{&XBAR15},
        };
        const XBAR15Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR15Findiv) |val| val.get() else 1,
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
        const XBAR16val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR16) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR16Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR16Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR16Prediv: ClockNode = .{
            .name = "XBAR16Prediv",
            .Nodetype = XBAR16Predivval,
            .parents = &[_]*const ClockNode{&XBAR16},
        };
        const XBAR16Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR16Findiv) |val| val.get() else 1,
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
        const XBAR17val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR17) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR17Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR17Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR17Prediv: ClockNode = .{
            .name = "XBAR17Prediv",
            .Nodetype = XBAR17Predivval,
            .parents = &[_]*const ClockNode{&XBAR17},
        };
        const XBAR17Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR17Findiv) |val| val.get() else 1,
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
        const XBAR18val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR18) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR18Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR18Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR18Prediv: ClockNode = .{
            .name = "XBAR18Prediv",
            .Nodetype = XBAR18Predivval,
            .parents = &[_]*const ClockNode{&XBAR18},
        };
        const XBAR18Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR18Findiv) |val| val.get() else 1,
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
        const XBAR19val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR19) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR19Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR19Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR19Prediv: ClockNode = .{
            .name = "XBAR19Prediv",
            .Nodetype = XBAR19Predivval,
            .parents = &[_]*const ClockNode{&XBAR19},
        };
        const XBAR19Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR19Findiv) |val| val.get() else 1,
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
        const XBAR20val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR20) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR20Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR20Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR20Prediv: ClockNode = .{
            .name = "XBAR20Prediv",
            .Nodetype = XBAR20Predivval,
            .parents = &[_]*const ClockNode{&XBAR20},
        };
        const XBAR20Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR20Findiv) |val| val.get() else 1,
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
        const XBAR21val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR21) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR21Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR21Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR21Prediv: ClockNode = .{
            .name = "XBAR21Prediv",
            .Nodetype = XBAR21Predivval,
            .parents = &[_]*const ClockNode{&XBAR21},
        };
        const XBAR21Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR21Findiv) |val| val.get() else 1,
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
        const XBAR22val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR22) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR22Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR22Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR22Prediv: ClockNode = .{
            .name = "XBAR22Prediv",
            .Nodetype = XBAR22Predivval,
            .parents = &[_]*const ClockNode{&XBAR22},
        };
        const XBAR22Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR22Findiv) |val| val.get() else 1,
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
        const XBAR23val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR23) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR23Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR23Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR23Prediv: ClockNode = .{
            .name = "XBAR23Prediv",
            .Nodetype = XBAR23Predivval,
            .parents = &[_]*const ClockNode{&XBAR23},
        };
        const XBAR23Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR23Findiv) |val| val.get() else 1,
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
        const XBAR24val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR24) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR24Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR24Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR24Prediv: ClockNode = .{
            .name = "XBAR24Prediv",
            .Nodetype = XBAR24Predivval,
            .parents = &[_]*const ClockNode{&XBAR24},
        };
        const XBAR24Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR24Findiv) |val| val.get() else 1,
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
        const XBAR25val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR25) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR25Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR25Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR25Prediv: ClockNode = .{
            .name = "XBAR25Prediv",
            .Nodetype = XBAR25Predivval,
            .parents = &[_]*const ClockNode{&XBAR25},
        };
        const XBAR25Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR25Findiv) |val| val.get() else 1,
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
        const XBAR26val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR26) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR26Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR26Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR26Prediv: ClockNode = .{
            .name = "XBAR26Prediv",
            .Nodetype = XBAR26Predivval,
            .parents = &[_]*const ClockNode{&XBAR26},
        };
        const XBAR26Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR26Findiv) |val| val.get() else 1,
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
        const XBAR27val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR27) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR27Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR27Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR27Prediv: ClockNode = .{
            .name = "XBAR27Prediv",
            .Nodetype = XBAR27Predivval,
            .parents = &[_]*const ClockNode{&XBAR27},
        };
        const XBAR27Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR27Findiv) |val| val.get() else 1,
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
        const XBAR28val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR28) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR28Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR28Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR28Prediv: ClockNode = .{
            .name = "XBAR28Prediv",
            .Nodetype = XBAR28Predivval,
            .parents = &[_]*const ClockNode{&XBAR28},
        };
        const XBAR28Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR28Findiv) |val| val.get() else 1,
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
        const XBAR29val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR29) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR29Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR29Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR29Prediv: ClockNode = .{
            .name = "XBAR29Prediv",
            .Nodetype = XBAR29Predivval,
            .parents = &[_]*const ClockNode{&XBAR29},
        };
        const XBAR29Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR29Findiv) |val| val.get() else 1,
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
        const XBAR30val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR30) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR30Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR30Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR30Prediv: ClockNode = .{
            .name = "XBAR30Prediv",
            .Nodetype = XBAR30Predivval,
            .parents = &[_]*const ClockNode{&XBAR30},
        };
        const XBAR30Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR30Findiv) |val| val.get() else 1,
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
        const XBAR31val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR31) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR31Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR31Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR31Prediv: ClockNode = .{
            .name = "XBAR31Prediv",
            .Nodetype = XBAR31Predivval,
            .parents = &[_]*const ClockNode{&XBAR31},
        };
        const XBAR31Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR31Findiv) |val| val.get() else 1,
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
        const XBAR32val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR32) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR32Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR32Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR32Prediv: ClockNode = .{
            .name = "XBAR32Prediv",
            .Nodetype = XBAR32Predivval,
            .parents = &[_]*const ClockNode{&XBAR32},
        };
        const XBAR32Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR32Findiv) |val| val.get() else 1,
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
        const XBAR33val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR33) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR33Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR33Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR33Prediv: ClockNode = .{
            .name = "XBAR33Prediv",
            .Nodetype = XBAR33Predivval,
            .parents = &[_]*const ClockNode{&XBAR33},
        };
        const XBAR33Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR33Findiv) |val| val.get() else 1,
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
        const XBAR34val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR34) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR34Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR34Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR34Prediv: ClockNode = .{
            .name = "XBAR34Prediv",
            .Nodetype = XBAR34Predivval,
            .parents = &[_]*const ClockNode{&XBAR34},
        };
        const XBAR34Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR34Findiv) |val| val.get() else 1,
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
        const XBAR35val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR35) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR35Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR35Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR35Prediv: ClockNode = .{
            .name = "XBAR35Prediv",
            .Nodetype = XBAR35Predivval,
            .parents = &[_]*const ClockNode{&XBAR35},
        };
        const XBAR35Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR35Findiv) |val| val.get() else 1,
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
        const XBAR36val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR36) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 6;
                }
            },
        };
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
        const XBAR36Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR36Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR36Prediv: ClockNode = .{
            .name = "XBAR36Prediv",
            .Nodetype = XBAR36Predivval,
            .parents = &[_]*const ClockNode{&XBAR36},
        };
        const XBAR36Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR36Findiv) |val| val.get() else 1,
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
        const XBAR37val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR37) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_I2S,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR37Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR37Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR37Prediv: ClockNode = .{
            .name = "XBAR37Prediv",
            .Nodetype = XBAR37Predivval,
            .parents = &[_]*const ClockNode{&XBAR37},
        };
        const XBAR37Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR37Findiv) |val| val.get() else 1,
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
        const XBAR38val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR38) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR38Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR38Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR38Prediv: ClockNode = .{
            .name = "XBAR38Prediv",
            .Nodetype = XBAR38Predivval,
            .parents = &[_]*const ClockNode{&XBAR38},
        };
        const XBAR38Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR38Findiv) |val| val.get() else 1,
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
        const XBAR39val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR39) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR39Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR39Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR39Prediv: ClockNode = .{
            .name = "XBAR39Prediv",
            .Nodetype = XBAR39Predivval,
            .parents = &[_]*const ClockNode{&XBAR39},
        };
        const XBAR39Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR39Findiv) |val| val.get() else 1,
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
        const XBAR40val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR40) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR40Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR40Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR40Prediv: ClockNode = .{
            .name = "XBAR40Prediv",
            .Nodetype = XBAR40Predivval,
            .parents = &[_]*const ClockNode{&XBAR40},
        };
        const XBAR40Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR40Findiv) |val| val.get() else 1,
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
        const XBAR41val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR41) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR41Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR41Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR41Prediv: ClockNode = .{
            .name = "XBAR41Prediv",
            .Nodetype = XBAR41Predivval,
            .parents = &[_]*const ClockNode{&XBAR41},
        };
        const XBAR41Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR41Findiv) |val| val.get() else 1,
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
        const XBAR42val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR42) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR42Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR42Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR42Prediv: ClockNode = .{
            .name = "XBAR42Prediv",
            .Nodetype = XBAR42Predivval,
            .parents = &[_]*const ClockNode{&XBAR42},
        };
        const XBAR42Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR42Findiv) |val| val.get() else 1,
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
        const XBAR43val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR43) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR43Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR43Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR43Prediv: ClockNode = .{
            .name = "XBAR43Prediv",
            .Nodetype = XBAR43Predivval,
            .parents = &[_]*const ClockNode{&XBAR43},
        };
        const XBAR43Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR43Findiv) |val| val.get() else 1,
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
        const XBAR44val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR44) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR44Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR44Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR44Prediv: ClockNode = .{
            .name = "XBAR44Prediv",
            .Nodetype = XBAR44Predivval,
            .parents = &[_]*const ClockNode{&XBAR44},
        };
        const XBAR44Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR44Findiv) |val| val.get() else 1,
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
        const XBAR45val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR45) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR45Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR45Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR45Prediv: ClockNode = .{
            .name = "XBAR45Prediv",
            .Nodetype = XBAR45Predivval,
            .parents = &[_]*const ClockNode{&XBAR45},
        };
        const XBAR45Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR45Findiv) |val| val.get() else 1,
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
        const XBAR46val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR46) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR46Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR46Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR46Prediv: ClockNode = .{
            .name = "XBAR46Prediv",
            .Nodetype = XBAR46Predivval,
            .parents = &[_]*const ClockNode{&XBAR46},
        };
        const XBAR46Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR46Findiv) |val| val.get() else 1,
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
        const XBAR47val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR47) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR47Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR47Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR47Prediv: ClockNode = .{
            .name = "XBAR47Prediv",
            .Nodetype = XBAR47Predivval,
            .parents = &[_]*const ClockNode{&XBAR47},
        };
        const XBAR47Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR47Findiv) |val| val.get() else 1,
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
        const XBAR48val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR48) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR48Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR48Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR48Prediv: ClockNode = .{
            .name = "XBAR48Prediv",
            .Nodetype = XBAR48Predivval,
            .parents = &[_]*const ClockNode{&XBAR48},
        };
        const XBAR48Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR48Findiv) |val| val.get() else 1,
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
        const XBAR49val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR49) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR49Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR49Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR49Prediv: ClockNode = .{
            .name = "XBAR49Prediv",
            .Nodetype = XBAR49Predivval,
            .parents = &[_]*const ClockNode{&XBAR49},
        };
        const XBAR49Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR49Findiv) |val| val.get() else 1,
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
        const XBAR50val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR50) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR50Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR50Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR50Prediv: ClockNode = .{
            .name = "XBAR50Prediv",
            .Nodetype = XBAR50Predivval,
            .parents = &[_]*const ClockNode{&XBAR50},
        };
        const XBAR50Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR50Findiv) |val| val.get() else 1,
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
        const XBAR51val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR51) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR51Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR51Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR51Prediv: ClockNode = .{
            .name = "XBAR51Prediv",
            .Nodetype = XBAR51Predivval,
            .parents = &[_]*const ClockNode{&XBAR51},
        };
        const XBAR51Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR51Findiv) |val| val.get() else 1,
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
        const XBAR52val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR52) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR52Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR52Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR52Prediv: ClockNode = .{
            .name = "XBAR52Prediv",
            .Nodetype = XBAR52Predivval,
            .parents = &[_]*const ClockNode{&XBAR52},
        };
        const XBAR52Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR52Findiv) |val| val.get() else 1,
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
        const XBAR53val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR53) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR53Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR53Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR53Prediv: ClockNode = .{
            .name = "XBAR53Prediv",
            .Nodetype = XBAR53Predivval,
            .parents = &[_]*const ClockNode{&XBAR53},
        };
        const XBAR53Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR53Findiv) |val| val.get() else 1,
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
        const XBAR54val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR54) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR54Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR54Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR54Prediv: ClockNode = .{
            .name = "XBAR54Prediv",
            .Nodetype = XBAR54Predivval,
            .parents = &[_]*const ClockNode{&XBAR54},
        };
        const XBAR54Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR54Findiv) |val| val.get() else 1,
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
        const XBAR55val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR55) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR55Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR55Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR55Prediv: ClockNode = .{
            .name = "XBAR55Prediv",
            .Nodetype = XBAR55Predivval,
            .parents = &[_]*const ClockNode{&XBAR55},
        };
        const XBAR55Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR55Findiv) |val| val.get() else 1,
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
        const XBAR56val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR56) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR56Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR56Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR56Prediv: ClockNode = .{
            .name = "XBAR56Prediv",
            .Nodetype = XBAR56Predivval,
            .parents = &[_]*const ClockNode{&XBAR56},
        };
        const XBAR56Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR56Findiv) |val| val.get() else 1,
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
        const XBAR57val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR57) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR57Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR57Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR57Prediv: ClockNode = .{
            .name = "XBAR57Prediv",
            .Nodetype = XBAR57Predivval,
            .parents = &[_]*const ClockNode{&XBAR57},
        };
        const XBAR57Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR57Findiv) |val| val.get() else 1,
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
        const XBAR58val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR58) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR58Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR58Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR58Prediv: ClockNode = .{
            .name = "XBAR58Prediv",
            .Nodetype = XBAR58Predivval,
            .parents = &[_]*const ClockNode{&XBAR58},
        };
        const XBAR58Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR58Findiv) |val| val.get() else 1,
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
        const XBAR59val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR59) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR59Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR59Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR59Prediv: ClockNode = .{
            .name = "XBAR59Prediv",
            .Nodetype = XBAR59Predivval,
            .parents = &[_]*const ClockNode{&XBAR59},
        };
        const XBAR59Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR59Findiv) |val| val.get() else 1,
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
        const XBAR60val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR60) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 4;
                }
            },
        };
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
        const XBAR60Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR60Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR60Prediv: ClockNode = .{
            .name = "XBAR60Prediv",
            .Nodetype = XBAR60Predivval,
            .parents = &[_]*const ClockNode{&XBAR60},
        };
        const XBAR60Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR60Findiv) |val| val.get() else 1,
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
        const XBAR61val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR61) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR61Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR61Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR61Prediv: ClockNode = .{
            .name = "XBAR61Prediv",
            .Nodetype = XBAR61Predivval,
            .parents = &[_]*const ClockNode{&XBAR61},
        };
        const XBAR61Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR61Findiv) |val| val.get() else 1,
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
        const XBAR62val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR62) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR62Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR62Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR62Prediv: ClockNode = .{
            .name = "XBAR62Prediv",
            .Nodetype = XBAR62Predivval,
            .parents = &[_]*const ClockNode{&XBAR62},
        };
        const XBAR62Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR62Findiv) |val| val.get() else 1,
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
        const XBAR63val = ClockNodeTypes{
            .multi = inner: {
                if (config.XBAR63) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 5;
                }
            },
        };
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
        const XBAR63Predivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.XBAR63Prediv) |val| {
                    switch (val) {
                        .@"1",
                        .@"2",
                        .@"4",
                        .@"1024",
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const XBAR63Prediv: ClockNode = .{
            .name = "XBAR63Prediv",
            .Nodetype = XBAR63Predivval,
            .parents = &[_]*const ClockNode{&XBAR63},
        };
        const XBAR63Findivval = ClockNodeTypes{
            .div = .{
                .value = if (config.XBAR63Findiv) |val| val.get() else 1,
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
        const PLL1Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL1Source) |val| {
                    switch (val) {
                        .RCC_PLL1SOURCE_HSI,
                        .RCC_PLL1SOURCE_HSE,
                        .RCC_PLL1SOURCE_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL1Source: ClockNode = .{
            .name = "PLL1Source",
            .Nodetype = PLL1Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const PLL2Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL2Source) |val| {
                    switch (val) {
                        .RCC_PLL2SOURCE_HSI,
                        .RCC_PLL2SOURCE_HSE,
                        .RCC_PLL2SOURCE_MSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",
            .Nodetype = PLL2Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &MSIRC,
            },
        };
        const PLL3Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL3Source) |val| {
                    switch (val) {
                        .RCC_PLL3SOURCE_HSI,
                        .RCC_PLL3SOURCE_MSI,
                        .RCC_PLL3SOURCE_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",
            .Nodetype = PLL3Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
            },
        };
        const CKINTSEL0val = ClockNodeTypes{
            .multi = inner: {
                if (config.CKINTSEL0) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .XBAR_SRC_PLL4_REF,
                        .XBAR_SRC_PLL5_REF,
                        .XBAR_SRC_PLL6_REF,
                        .XBAR_SRC_PLL7_REF,
                        .XBAR_SRC_PLL8_REF,
                        .XBAR_SRC_PLL1_REF,
                        .XBAR_SRC_PLL2_REF,
                        .XBAR_SRC_PLL3_REF,
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        .XBAR_SRC_ROOT0,
                        .XBAR_SRC_ROOT1,
                        .XBAR_SRC_ROOT2,
                        .XBAR_SRC_ROOT3,
                        .XBAR_SRC_ROOT4,
                        .XBAR_SRC_ROOT5,
                        .XBAR_SRC_ROOT6,
                        .XBAR_SRC_ROOT7,
                        .XBAR_SRC_ROOT8,
                        .XBAR_SRC_ROOT9,
                        .XBAR_SRC_ROOT10,
                        .XBAR_SRC_ROOT11,
                        .XBAR_SRC_ROOT12,
                        .XBAR_SRC_ROOT13,
                        .XBAR_SRC_ROOT14,
                        .XBAR_SRC_ROOT15,
                        .XBAR_SRC_ROOT16,
                        .XBAR_SRC_ROOT17,
                        .XBAR_SRC_ROOT18,
                        .XBAR_SRC_ROOT19,
                        .XBAR_SRC_ROOT20,
                        .XBAR_SRC_ROOT21,
                        .XBAR_SRC_ROOT22,
                        .XBAR_SRC_ROOT23,
                        .XBAR_SRC_ROOT24,
                        .XBAR_SRC_ROOT25,
                        .XBAR_SRC_ROOT26,
                        .XBAR_SRC_ROOT27,
                        .XBAR_SRC_ROOT28,
                        .XBAR_SRC_ROOT29,
                        .XBAR_SRC_ROOT30,
                        .XBAR_SRC_ROOT31,
                        .XBAR_SRC_ROOT32,
                        .XBAR_SRC_ROOT33,
                        .XBAR_SRC_ROOT34,
                        .XBAR_SRC_ROOT35,
                        .XBAR_SRC_ROOT36,
                        .XBAR_SRC_ROOT37,
                        .XBAR_SRC_ROOT38,
                        .XBAR_SRC_ROOT39,
                        .XBAR_SRC_ROOT40,
                        .XBAR_SRC_ROOT41,
                        .XBAR_SRC_ROOT42,
                        .XBAR_SRC_ROOT43,
                        .XBAR_SRC_ROOT44,
                        .XBAR_SRC_ROOT45,
                        .XBAR_SRC_ROOT46,
                        .XBAR_SRC_ROOT47,
                        .XBAR_SRC_ROOT48,
                        .XBAR_SRC_ROOT49,
                        .XBAR_SRC_ROOT50,
                        .XBAR_SRC_ROOT51,
                        .XBAR_SRC_ROOT52,
                        .XBAR_SRC_ROOT53,
                        .XBAR_SRC_ROOT54,
                        .XBAR_SRC_ROOT55,
                        .XBAR_SRC_ROOT56,
                        .XBAR_SRC_ROOT57,
                        .XBAR_SRC_ROOT58,
                        .XBAR_SRC_ROOT59,
                        .XBAR_SRC_ROOT60,
                        .XBAR_SRC_ROOT61,
                        .XBAR_SRC_ROOT62,
                        .XBAR_SRC_ROOT63,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
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
                .value = if (config.FREFDIV1) |val| val.get() else 1,
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
                .value = if (config.FBDIV1) |val| val.get() else 25,
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
                .value = if (config.POSTDIV1_1) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_1) |val| val.get() else 1,
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
                .value = if (config.FREFDIV2) |val| val.get() else 1,
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
                .value = if (config.PLL2FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL2FRACV: ClockNode = .{
            .name = "PLL2FRACV",
            .Nodetype = PLL2FRACVval,
        };
        const FBDIV2val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV2) |val| val.get() else 12297829382473034410,
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
                .value = if (config.POSTDIV1_2) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_2) |val| val.get() else 1,
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
                .value = if (config.FREFDIV3) |val| val.get() else 1,
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
                .value = if (config.PLL3FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL3FRACV: ClockNode = .{
            .name = "PLL3FRACV",
            .Nodetype = PLL3FRACVval,
        };
        const FBDIV3val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV3) |val| val.get() else 12297829382473034410,
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
                .value = if (config.POSTDIV1_3) |val| val.get() else 1,
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
                .value = if (config.POSTDIV2_3) |val| val.get() else 1,
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
        const CKEXTSEL0val = ClockNodeTypes{
            .multi = inner: {
                if (config.CKEXTSEL0) |val| {
                    switch (val) {
                        .XBAR_SRC_PLL1_DIV42,
                        .XBAR_SRC_PLL2_DIV4,
                        .XBAR_SRC_PLL3_DIV2,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const CKEXTSEL0: ClockNode = .{
            .name = "CKEXTSEL0",
            .Nodetype = CKEXTSEL0val,

            .parents = &[_]*const ClockNode{
                &PLL1Div42,
                &PLL2Div4,
                &PLL3Div2,
            },
        };
        const CKINTSEL1val = ClockNodeTypes{
            .multi = inner: {
                if (config.CKINTSEL1) |val| {
                    switch (val) {
                        .RCC_XBAR_CLKSRC_HSI,
                        .RCC_XBAR_CLKSRC_HSE,
                        .RCC_XBAR_CLKSRC_MSI,
                        .XBAR_SRC_PLL4_REF,
                        .XBAR_SRC_PLL5_REF,
                        .XBAR_SRC_PLL6_REF,
                        .XBAR_SRC_PLL7_REF,
                        .XBAR_SRC_PLL8_REF,
                        .XBAR_SRC_PLL1_REF,
                        .XBAR_SRC_PLL2_REF,
                        .XBAR_SRC_PLL3_REF,
                        .RCC_XBAR_CLKSRC_PLL4,
                        .RCC_XBAR_CLKSRC_PLL5,
                        .RCC_XBAR_CLKSRC_PLL6,
                        .RCC_XBAR_CLKSRC_PLL7,
                        .RCC_XBAR_CLKSRC_PLL8,
                        .RCC_XBAR_CLKSRC_SPDIF,
                        .RCC_XBAR_CLKSRC_I2S,
                        .RCC_XBAR_CLKSRC_LSI,
                        .RCC_XBAR_CLKSRC_LSE,
                        .XBAR_SRC_ROOT0,
                        .XBAR_SRC_ROOT1,
                        .XBAR_SRC_ROOT2,
                        .XBAR_SRC_ROOT3,
                        .XBAR_SRC_ROOT4,
                        .XBAR_SRC_ROOT5,
                        .XBAR_SRC_ROOT6,
                        .XBAR_SRC_ROOT7,
                        .XBAR_SRC_ROOT8,
                        .XBAR_SRC_ROOT9,
                        .XBAR_SRC_ROOT10,
                        .XBAR_SRC_ROOT11,
                        .XBAR_SRC_ROOT12,
                        .XBAR_SRC_ROOT13,
                        .XBAR_SRC_ROOT14,
                        .XBAR_SRC_ROOT15,
                        .XBAR_SRC_ROOT16,
                        .XBAR_SRC_ROOT17,
                        .XBAR_SRC_ROOT18,
                        .XBAR_SRC_ROOT19,
                        .XBAR_SRC_ROOT20,
                        .XBAR_SRC_ROOT21,
                        .XBAR_SRC_ROOT22,
                        .XBAR_SRC_ROOT23,
                        .XBAR_SRC_ROOT24,
                        .XBAR_SRC_ROOT25,
                        .XBAR_SRC_ROOT26,
                        .XBAR_SRC_ROOT27,
                        .XBAR_SRC_ROOT28,
                        .XBAR_SRC_ROOT29,
                        .XBAR_SRC_ROOT30,
                        .XBAR_SRC_ROOT31,
                        .XBAR_SRC_ROOT32,
                        .XBAR_SRC_ROOT33,
                        .XBAR_SRC_ROOT34,
                        .XBAR_SRC_ROOT35,
                        .XBAR_SRC_ROOT36,
                        .XBAR_SRC_ROOT37,
                        .XBAR_SRC_ROOT38,
                        .XBAR_SRC_ROOT39,
                        .XBAR_SRC_ROOT40,
                        .XBAR_SRC_ROOT41,
                        .XBAR_SRC_ROOT42,
                        .XBAR_SRC_ROOT43,
                        .XBAR_SRC_ROOT44,
                        .XBAR_SRC_ROOT45,
                        .XBAR_SRC_ROOT46,
                        .XBAR_SRC_ROOT47,
                        .XBAR_SRC_ROOT48,
                        .XBAR_SRC_ROOT49,
                        .XBAR_SRC_ROOT50,
                        .XBAR_SRC_ROOT51,
                        .XBAR_SRC_ROOT52,
                        .XBAR_SRC_ROOT53,
                        .XBAR_SRC_ROOT54,
                        .XBAR_SRC_ROOT55,
                        .XBAR_SRC_ROOT56,
                        .XBAR_SRC_ROOT57,
                        .XBAR_SRC_ROOT58,
                        .XBAR_SRC_ROOT59,
                        .XBAR_SRC_ROOT60,
                        .XBAR_SRC_ROOT61,
                        .XBAR_SRC_ROOT62,
                        .XBAR_SRC_ROOT63,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
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
        const CKEXTSEL1val = ClockNodeTypes{
            .multi = inner: {
                if (config.CKEXTSEL1) |val| {
                    switch (val) {
                        .XBAR_SRC_PLL1_DIV42,
                        .XBAR_SRC_PLL2_DIV4,
                        .XBAR_SRC_PLL3_DIV2,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const CKEXTSEL1: ClockNode = .{
            .name = "CKEXTSEL1",
            .Nodetype = CKEXTSEL1val,

            .parents = &[_]*const ClockNode{
                &PLL1Div42,
                &PLL2Div4,
                &PLL3Div2,
            },
        };
        const OBS0val = ClockNodeTypes{
            .multi = inner: {
                if (config.OBS0) |val| {
                    switch (val) {
                        .RCC_OBS0SOURCE_CKINTSEL,
                        .RCC_OBS0SOURCE_CKEXTSEL,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const OBS1val = ClockNodeTypes{
            .multi = inner: {
                if (config.OBS1) |val| {
                    switch (val) {
                        .RCC_OBS1SOURCE_CKINTSEL,
                        .RCC_OBS1SOURCE_CKEXTSEL,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const MCO1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO1Mult) |val| {
                    switch (val) {
                        .MUX_MCO1_FLEX61,
                        .MUX_MCO1_OBSER0,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    switch (val) {
                        .MUX_MCO2_FLEX62,
                        .MUX_MCO2_OBSER1,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const D3PERval = ClockNodeTypes{
            .multi = inner: {
                if (config.D3PER) |val| {
                    switch (val) {
                        .MUX_D3PER_MSI,
                        .MUX_D3PER_LSI,
                        .MUX_D3PER_LSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const DTSval = ClockNodeTypes{
            .multi = inner: {
                if (config.DTS) |val| {
                    switch (val) {
                        .MUX_DTS_MSI,
                        .MUX_DTS_HSI,
                        .MUX_DTS_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const DSIPHYval = ClockNodeTypes{
            .multi = inner: {
                if (config.DSIPHY) |val| {
                    switch (val) {
                        .MUX_DSIPHY_FLEX28,
                        .MUX_DSIPHY_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const DSIBLANEval = ClockNodeTypes{
            .multi = inner: {
                if (config.DSIBLANE) |val| {
                    switch (val) {
                        .MUX_DSIBLANE_DSIPHY,
                        .MUX_DSIBLANE_FLEX27,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const USB2PHY1val = ClockNodeTypes{
            .multi = inner: {
                if (config.USB2PHY1) |val| {
                    switch (val) {
                        .MUX_USB2PHY1_FLEX57,
                        .MUX_USB2PHY1_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const USB2PHY2val = ClockNodeTypes{
            .multi = inner: {
                if (config.USB2PHY2) |val| {
                    switch (val) {
                        .MUX_USB2PHY2_FLEX58,
                        .MUX_USB2PHY2_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const USB3PCIPHYval = ClockNodeTypes{
            .multi = inner: {
                if (config.USB3PCIPHY) |val| {
                    switch (val) {
                        .MUX_USB3PCIEPHY_FLEX34,
                        .MUX_USB3PCIEPHY_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const SysClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SysClkSource) |val| {
                    switch (val) {
                        .RCC_MCUSSOURCE_FLEX0,
                        .RCC_MCUSSOURCE_HSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const MCUDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCUDIV) |val| {
                    switch (val) {
                        .RCC_MCU_DIV1,
                        .RCC_MCU_DIV2,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
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
        const APB3DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB3DIV) |val| {
                    switch (val) {
                        .RCC_APB3_DIV1,
                        .RCC_APB3_DIV2,
                        .RCC_APB3_DIV4,
                        .RCC_APB3_DIV8,
                        .RCC_APB3_DIV16,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
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
        const APB4DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB4DIV) |val| {
                    switch (val) {
                        .RCC_APB4_DIV1,
                        .RCC_APB4_DIV2,
                        .RCC_APB4_DIV4,
                        .RCC_APB4_DIV8,
                        .RCC_APB4_DIV16,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
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
        const APBDBGDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APBDBGDIV) |val| {
                    switch (val) {
                        .RCC_APBDBG_DIV1,
                        .RCC_APBDBG_DIV2,
                        .RCC_APBDBG_DIV4,
                        .RCC_APBDBG_DIV8,
                        .RCC_APBDBG_DIV16,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
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
        const APB1DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB1DIV) |val| {
                    switch (val) {
                        .RCC_APB1_DIV1,
                        .RCC_APB1_DIV2,
                        .RCC_APB1_DIV4,
                        .RCC_APB1_DIV8,
                        .RCC_APB1_DIV16,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB1DIV: ClockNode = .{
            .name = "APB1DIV",
            .Nodetype = APB1DIVval,
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const RCC_TIM_G1_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_G1_PRescaler_Selection) |val| {
                    switch (val) {
                        .RCC_TIMG1PRES_ACTIVATED,
                        .RCC_TIMG1PRES_DEACTIVATED,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
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
        const APB2DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB2DIV) |val| {
                    switch (val) {
                        .RCC_APB2_DIV1,
                        .RCC_APB2_DIV2,
                        .RCC_APB2_DIV4,
                        .RCC_APB2_DIV8,
                        .RCC_APB2_DIV16,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB2DIV: ClockNode = .{
            .name = "APB2DIV",
            .Nodetype = APB2DIVval,
            .parents = &[_]*const ClockNode{&MCUDIV},
        };
        const RCC_TIM_G2_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_G2_PRescaler_Selection) |val| {
                    switch (val) {
                        .RCC_TIMG2PRES_ACTIVATED,
                        .RCC_TIMG2PRES_DEACTIVATED,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 1;
                }
            },
        } };
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
        const ADC12Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADC12Mult) |val| {
                    switch (val) {
                        .MUX_ADC12_FLEX46,
                        .MUX_ADC12_LSMCU,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const ADC3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADC3Mult) |val| {
                    switch (val) {
                        .MUX_ADC3_FLEX47,
                        .MUX_ADC3_LSMCU,
                        .MUX_ADC3_FLEX46,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
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
        const LVDSMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LVDSMult) |val| {
                    switch (val) {
                        .MUX_LVDSPHY_FLEX32,
                        .MUX_LVDSPHY_HSE,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        };
        const LVDSMult: ClockNode = .{
            .name = "LVDSMult",
            .Nodetype = LVDSMultval,

            .parents = &[_]*const ClockNode{
                &XBAR32Output,
                &HSEOSC,
            },
        };
        const LVDSoutputval = ClockNodeTypes{ .output = null };
        const LVDSoutput: ClockNode = .{
            .name = "LVDSoutput",
            .Nodetype = LVDSoutputval,
            .parents = &[_]*const ClockNode{&LVDSMult},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{
                .value = if (config.HSERTCDevisor) |val| val.get() else 1,
                .limit = .{ .max = 64, .min = 1 },
            },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    switch (val) {
                        .RCC_RTCCLKSOURCE_HSE_DIV,
                        .RCC_RTCCLKSOURCE_LSE,
                        .RCC_RTCCLKSOURCE_LSI,
                        => {
                            break :inner val.get();
                        },
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 2;
                }
            },
        };
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
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.LSE_Drive_Capability) |val| {
                    switch (val) {
                        .null,
                        => {
                            break :inner val.get();
                        },
                        else => {},
                    }
                    @compileError(std.fmt.comptimePrint("value {s} depends on an expression that returned false", .{@tagName(val)}));
                } else {
                    break :inner 0;
                }
            },
        } };
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
            .LVDSMult = LVDSMult,
            .LVDSoutput = LVDSoutput,
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
        _ = self.LVDSoutput.get_comptime();
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
